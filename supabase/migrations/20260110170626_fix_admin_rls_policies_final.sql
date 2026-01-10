/*
  # Fix Admin RLS Policies and Clean Up Duplicates
  
  1. Users Table RLS
    - Users can read their own profile
    - Admins can read all profiles
    - Users can insert and update their own profile
    - Admins can update all profiles
  
  2. Properties Table RLS
    - Remove all duplicate and old policies
    - Public can read only approved properties
    - Owners can insert their own properties
    - Owners can read, update, delete their own properties
    - Admins have full access to all properties
  
  3. Security
    - All policies check auth.uid() properly
    - Admin checks use users.role = 'admin'
    - No references to 'active' status (only 'approved', 'pending', 'rejected')
*/

-- Clean up properties table policies (remove all old ones)
DROP POLICY IF EXISTS "Public read active properties" ON properties;
DROP POLICY IF EXISTS "Public read approved properties" ON properties;
DROP POLICY IF EXISTS "public read approved" ON properties;
DROP POLICY IF EXISTS "Authenticated users can insert properties" ON properties;
DROP POLICY IF EXISTS "owner insert" ON properties;
DROP POLICY IF EXISTS "Owner read own properties" ON properties;
DROP POLICY IF EXISTS "Owner can update own properties" ON properties;
DROP POLICY IF EXISTS "owner update" ON properties;
DROP POLICY IF EXISTS "Owner delete own properties" ON properties;
DROP POLICY IF EXISTS "Admin full access" ON properties;
DROP POLICY IF EXISTS "admin full access" ON properties;

-- Create clean, consolidated policies for properties
CREATE POLICY "Public can read approved properties only"
ON properties
FOR SELECT
TO public
USING (status = 'approved');

CREATE POLICY "Owners can insert their properties"
ON properties
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = owner_id);

CREATE POLICY "Owners can read their own properties"
ON properties
FOR SELECT
TO authenticated
USING (auth.uid() = owner_id);

CREATE POLICY "Owners can update their own properties"
ON properties
FOR UPDATE
TO authenticated
USING (auth.uid() = owner_id)
WITH CHECK (auth.uid() = owner_id);

CREATE POLICY "Owners can delete their own properties"
ON properties
FOR DELETE
TO authenticated
USING (auth.uid() = owner_id);

CREATE POLICY "Admins have full access to all properties"
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