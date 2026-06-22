/*
  # Multi-Level Admin & Partner Role System Migration

  1. Changes
    - Drops old role constraint
    - Updates role constraint to include super_admin, property_admin, partner_admin, partner, user
    - Retains legacy roles (buyer, owner, agent, admin) for backward compatibility
    - Adds new columns: created_by, approved_by to users
    - Updates super admin privileges
*/

-- 1. Add missing columns safely
DO $$ 
BEGIN
  -- created_by
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'created_by') THEN
    ALTER TABLE public.users ADD COLUMN created_by UUID REFERENCES auth.users(id) ON DELETE SET NULL;
  END IF;

  -- approved_by
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'approved_by') THEN
    ALTER TABLE public.users ADD COLUMN approved_by UUID REFERENCES auth.users(id) ON DELETE SET NULL;
  END IF;
  
  -- ensure partner_status, partner_type, membership_type exist (mostly from Phase 1)
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'partner_status') THEN
    ALTER TABLE public.users ADD COLUMN partner_status TEXT;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'partner_type') THEN
    ALTER TABLE public.users ADD COLUMN partner_type TEXT;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'users' AND column_name = 'membership_type') THEN
    ALTER TABLE public.users ADD COLUMN membership_type TEXT DEFAULT 'free';
  END IF;

END $$;

-- 2. Update role constraint
DO $$
BEGIN
  -- Drop existing constraint
  ALTER TABLE public.users DROP CONSTRAINT IF EXISTS users_role_check;
  
  -- Add new constraint including new and legacy roles
  ALTER TABLE public.users ADD CONSTRAINT users_role_check 
    CHECK (role IN ('super_admin', 'property_admin', 'partner_admin', 'partner', 'user', 'buyer', 'owner', 'agent', 'admin'));
    
  -- Update default role to 'user'
  ALTER TABLE public.users ALTER COLUMN role SET DEFAULT 'user';
EXCEPTION WHEN OTHERS THEN
  NULL;
END $$;

-- 3. Grand Super Admin Privileges to specific user
DO $$
BEGIN
  UPDATE public.users 
  SET 
    role = 'super_admin',
    is_partner = true,
    partner_status = 'approved',
    membership_type = 'gold',
    partner_since = NOW()
  WHERE email = 'vsekharsqldba@gmail.com';
END $$;

-- 4. Update core RLS Policies
-- Property Admin & Super Admin can manage properties
-- We will do simple role checks. Note: existing RLS might be relying on role = 'admin'.
-- To avoid breaking everything instantly, we update them where necessary or assume the super_admin acts as 'admin' in legacy until fully migrated.

-- Instead of dropping and recreating every single policy right now, let's inject a global view function 
-- that helps check if someone has property management access.
CREATE OR REPLACE FUNCTION public.is_property_manager(user_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM users WHERE id = user_id AND role IN ('super_admin', 'property_admin', 'admin')
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE FUNCTION public.is_partner_manager(user_id UUID)
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM users WHERE id = user_id AND role IN ('super_admin', 'partner_admin', 'admin')
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
