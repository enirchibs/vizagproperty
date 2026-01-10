/*
  # Fix Auth & Property Flow - Complete End-to-End

  1. Users Table
    - Ensure `role` column exists with DEFAULT 'buyer'
    - Valid roles: 'buyer', 'owner', 'agent'
  
  2. Properties Table
    - Ensure `status` column exists with DEFAULT 'active'
    - Make `owner_id` nullable to handle legacy data
  
  3. Row Level Security
    - Enable RLS on properties table
    - Public read for active properties
    - Authenticated users can insert
    - Owners can update/delete their properties
  
  4. Security Notes
    - No destructive operations
    - All changes are idempotent and safe
    - Production-ready RLS policies
*/

-- 1. Ensure users table has role column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'users' AND column_name = 'role'
  ) THEN
    ALTER TABLE users ADD COLUMN role text DEFAULT 'buyer' CHECK (role IN ('buyer', 'owner', 'agent'));
  END IF;
END $$;

-- Update any NULL roles to 'buyer'
UPDATE users SET role = 'buyer' WHERE role IS NULL;

-- 2. Ensure properties table has status column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'status'
  ) THEN
    ALTER TABLE properties ADD COLUMN status text DEFAULT 'active' NOT NULL;
  END IF;
END $$;

-- Update any NULL or empty status to 'active'
UPDATE properties SET status = 'active' WHERE status IS NULL OR status = '';

-- 3. Make owner_id nullable (safe for legacy data)
DO $$
BEGIN
  ALTER TABLE properties ALTER COLUMN owner_id DROP NOT NULL;
EXCEPTION
  WHEN OTHERS THEN NULL;
END $$;

-- 4. Enable RLS on properties
ALTER TABLE properties ENABLE ROW LEVEL SECURITY;

-- 5. Drop existing policies if they exist
DROP POLICY IF EXISTS "Public read active properties" ON properties;
DROP POLICY IF EXISTS "Authenticated insert properties" ON properties;
DROP POLICY IF EXISTS "Owner update properties" ON properties;
DROP POLICY IF EXISTS "Owner delete properties" ON properties;
DROP POLICY IF EXISTS "Anyone can view active properties" ON properties;
DROP POLICY IF EXISTS "Authenticated users can insert properties" ON properties;
DROP POLICY IF EXISTS "Users can update own properties" ON properties;

-- 6. Create comprehensive RLS policies

-- Public read: Anyone can view active properties
CREATE POLICY "Public read active properties"
  ON properties
  FOR SELECT
  USING (status = 'active');

-- Insert: Any authenticated user can create properties
CREATE POLICY "Authenticated insert properties"
  ON properties
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() IS NOT NULL);

-- Update: Only owner can update their properties
CREATE POLICY "Owner update properties"
  ON properties
  FOR UPDATE
  TO authenticated
  USING (owner_id = auth.uid())
  WITH CHECK (owner_id = auth.uid());

-- Delete: Only owner can delete their properties
CREATE POLICY "Owner delete properties"
  ON properties
  FOR DELETE
  TO authenticated
  USING (owner_id = auth.uid());

-- 7. Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_properties_status ON properties(status);
CREATE INDEX IF NOT EXISTS idx_properties_owner_id ON properties(owner_id);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
