/*
  # Complete Admin System Fix
  
  1. Role System Updates
    - Update users table role constraint to include 'admin'
    - Supports: 'buyer', 'owner', 'admin'
  
  2. Properties Moderation Flow
    - Update status column to use moderation values ('pending', 'approved', 'rejected')
    - Convert existing 'active' status to 'approved'
    - Default status is 'pending' for new properties
  
  3. Auto-Promotion System
    - Create trigger to auto-convert buyer → owner on first property submission
    - Ensures seamless user experience
  
  4. Row Level Security (RLS)
    - Public can only read approved properties
    - Owners can insert/update their own properties
    - Admins have full access to all properties
    - Ensures data security and proper access control
*/

-- 1. Update users table role constraint
ALTER TABLE users
DROP CONSTRAINT IF EXISTS users_role_check;

ALTER TABLE users
ADD CONSTRAINT users_role_check
CHECK (role IN ('buyer', 'owner', 'admin'));

-- 2. Update status column for properties moderation
-- First drop the old constraint if it exists
ALTER TABLE properties
DROP CONSTRAINT IF EXISTS properties_status_check;

-- Convert existing 'active' status to 'approved'
UPDATE properties
SET status = 'approved'
WHERE status = 'active';

-- Update any NULL values to 'approved'
UPDATE properties
SET status = 'approved'
WHERE status IS NULL;

-- Set default for new properties
ALTER TABLE properties
ALTER COLUMN status SET DEFAULT 'pending';

-- Add new constraint
ALTER TABLE properties
ADD CONSTRAINT properties_status_check
CHECK (status IN ('pending', 'approved', 'rejected'));

-- 3. Create auto-promotion trigger
CREATE OR REPLACE FUNCTION promote_to_owner()
RETURNS trigger AS $$
BEGIN
  UPDATE users
  SET role = 'owner'
  WHERE id = NEW.owner_id AND role = 'buyer';
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS trg_promote_owner ON properties;
CREATE TRIGGER trg_promote_owner
AFTER INSERT ON properties
FOR EACH ROW
EXECUTE FUNCTION promote_to_owner();

-- 4. Set up RLS policies for properties
ALTER TABLE properties ENABLE ROW LEVEL SECURITY;

-- Drop existing policies
DROP POLICY IF EXISTS "public read approved" ON properties;
DROP POLICY IF EXISTS "owner insert" ON properties;
DROP POLICY IF EXISTS "owner update" ON properties;
DROP POLICY IF EXISTS "admin full access" ON properties;
DROP POLICY IF EXISTS "Public can view approved properties" ON properties;
DROP POLICY IF EXISTS "Users can insert their own properties" ON properties;
DROP POLICY IF EXISTS "Users can update their own properties" ON properties;
DROP POLICY IF EXISTS "Users can delete their own properties" ON properties;

-- Public can only read approved properties
CREATE POLICY "public read approved"
ON properties
FOR SELECT
USING (status = 'approved');

-- Owners can insert their own properties
CREATE POLICY "owner insert"
ON properties
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = owner_id);

-- Owners can update their own properties
CREATE POLICY "owner update"
ON properties
FOR UPDATE
TO authenticated
USING (auth.uid() = owner_id);

-- Admins have full access to all properties
CREATE POLICY "admin full access"
ON properties
FOR ALL
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
    AND users.role = 'admin'
  )
)
WITH CHECK (
  EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
    AND users.role = 'admin'
  )
);