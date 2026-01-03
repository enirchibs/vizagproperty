/*
  # Update User Profiles for Role-Based Authentication

  1. Changes
    - Add `role` column ('buyer', 'owner', 'both')
    - Add `auth_provider` column (phone, email, google, microsoft)
    - Add `phone` column for phone authentication
    - Update existing `user_type` to use new role system
    - Add indexes for performance

  2. Security
    - RLS policies remain unchanged
    - Users can only update their own profiles
*/

-- Add new columns if they don't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'user_profiles' AND column_name = 'role'
  ) THEN
    ALTER TABLE user_profiles ADD COLUMN role text DEFAULT 'buyer' CHECK (role IN ('buyer', 'owner', 'both'));
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'user_profiles' AND column_name = 'auth_provider'
  ) THEN
    ALTER TABLE user_profiles ADD COLUMN auth_provider text CHECK (auth_provider IN ('phone', 'email', 'google', 'microsoft'));
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'user_profiles' AND column_name = 'phone'
  ) THEN
    ALTER TABLE user_profiles ADD COLUMN phone text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'user_profiles' AND column_name = 'email'
  ) THEN
    ALTER TABLE user_profiles ADD COLUMN email text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'user_profiles' AND column_name = 'name'
  ) THEN
    ALTER TABLE user_profiles ADD COLUMN name text;
  END IF;
END $$;

-- Migrate existing user_type to role if needed
UPDATE user_profiles
SET role = CASE
  WHEN user_type = 'seller' THEN 'owner'
  WHEN user_type = 'agent' THEN 'owner'
  ELSE 'buyer'
END
WHERE role IS NULL;

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_user_profiles_role ON user_profiles(role);
CREATE INDEX IF NOT EXISTS idx_user_profiles_auth_provider ON user_profiles(auth_provider);
CREATE INDEX IF NOT EXISTS idx_user_profiles_phone ON user_profiles(phone);
CREATE INDEX IF NOT EXISTS idx_user_profiles_email ON user_profiles(email);

-- Add function to upgrade user role
CREATE OR REPLACE FUNCTION upgrade_user_role(user_id uuid, new_role text)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  UPDATE user_profiles
  SET role = CASE
    WHEN role = 'buyer' AND new_role = 'owner' THEN 'both'
    WHEN role = 'owner' AND new_role = 'buyer' THEN 'both'
    WHEN role = 'both' THEN 'both'
    ELSE new_role
  END
  WHERE id = user_id;
END;
$$;
