/*
  # Finalize Admin Role and RLS Policies

  1. Admin User Setup
    - Promote pratapjamp@gmail.com to admin role
  
  2. Users Table RLS Updates
    - Add policy for admin to read all user profiles
    - Add policy for admin to update all user profiles
    - Keeps existing user policies (users read/update own profile)
  
  3. Properties Table RLS Verification
    - Public can only read properties with status='active'
    - Admin has full access to all properties
    - Owners can manage their own properties
  
  4. Notes
    - Admin role constraint already exists: CHECK (role IN ('buyer', 'owner', 'admin'))
    - Property status constraint already exists: CHECK (status IN ('pending', 'active', 'rejected'))
    - Property status defaults to 'pending'
*/

-- Promote specific user to admin role
UPDATE users 
SET role = 'admin' 
WHERE id IN (
  SELECT id FROM auth.users WHERE email = 'pratapjamp@gmail.com'
);

-- Add admin RLS policies for users table (if not exists)
DO $$
BEGIN
  -- Admin can read all user profiles
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'users' 
    AND policyname = 'Admin can read all users'
  ) THEN
    CREATE POLICY "Admin can read all users"
      ON users FOR SELECT
      TO authenticated
      USING (
        EXISTS (
          SELECT 1 FROM users 
          WHERE id = auth.uid() AND role = 'admin'
        )
      );
  END IF;

  -- Admin can update all user profiles
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE tablename = 'users' 
    AND policyname = 'Admin can update all users'
  ) THEN
    CREATE POLICY "Admin can update all users"
      ON users FOR UPDATE
      TO authenticated
      USING (
        EXISTS (
          SELECT 1 FROM users 
          WHERE id = auth.uid() AND role = 'admin'
        )
      )
      WITH CHECK (
        EXISTS (
          SELECT 1 FROM users 
          WHERE id = auth.uid() AND role = 'admin'
        )
      );
  END IF;
END $$;
