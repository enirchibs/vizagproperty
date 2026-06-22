-- 09_partner_referrals_update.sql
-- Run this script in your Supabase SQL Editor.

-- Drop the old foreign key that linked to partner_profiles
ALTER TABLE IF EXISTS public.partner_referrals 
  DROP CONSTRAINT IF EXISTS partner_referrals_partner_id_fkey;

-- Add the new foreign key to auth.users
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.table_constraints 
        WHERE constraint_name = 'partner_referrals_partner_id_users_fkey'
    ) THEN
        ALTER TABLE public.partner_referrals
        ADD CONSTRAINT partner_referrals_partner_id_users_fkey
        FOREIGN KEY (partner_id) REFERENCES auth.users(id) ON DELETE CASCADE;
    END IF;
END $$;

-- Add new columns
ALTER TABLE public.partner_referrals
ADD COLUMN IF NOT EXISTS commission_amount NUMERIC DEFAULT 0,
ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now());

-- Create trigger function for updated_at if it doesn't exist generically
CREATE OR REPLACE FUNCTION update_partner_referrals_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = timezone('utc'::text, now());
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Apply trigger
DROP TRIGGER IF EXISTS set_partner_referrals_updated_at ON public.partner_referrals;
CREATE TRIGGER set_partner_referrals_updated_at
    BEFORE UPDATE ON public.partner_referrals
    FOR EACH ROW
    EXECUTE FUNCTION update_partner_referrals_updated_at_column();
