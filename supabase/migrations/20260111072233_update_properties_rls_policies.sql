/*
  # Update Properties Table RLS Policies

  1. Changes
    - Drop all existing property RLS policies
    - Create new "owner insert property" policy - owners can insert their own properties
    - Create new "owner update property" policy - owners can update their own properties
    - Create new "admin manage properties" policy - admins have full access
    - Create new "public read approved" policy - public can read approved properties

  2. Security Model
    - **Owner Access**: Property owners can insert and update their own properties
    - **Admin Access**: Admins with role='admin' have full access to all properties
    - **Public Access**: Anyone (including unauthenticated) can read approved properties
    - **Status Control**: Only approved properties are visible to the public

  3. Important Notes
    - Owner can edit properties even after approval
    - Public access does not require authentication for SELECT
    - Admin role is checked via users.role column
    - All policies properly check ownership via owner_id = auth.uid()
*/

-- Drop all existing policies on properties table
DROP POLICY IF EXISTS "owner insert property" ON properties;
DROP POLICY IF EXISTS "owner update property" ON properties;
DROP POLICY IF EXISTS "admin manage properties" ON properties;
DROP POLICY IF EXISTS "public read approved" ON properties;
DROP POLICY IF EXISTS "Anyone can view approved properties" ON properties;
DROP POLICY IF EXISTS "Owners can insert properties" ON properties;
DROP POLICY IF EXISTS "Owners can update own properties" ON properties;
DROP POLICY IF EXISTS "Owners can delete own properties" ON properties;
DROP POLICY IF EXISTS "Admin can manage all properties" ON properties;

-- Owner can insert their own properties
CREATE POLICY "owner insert property"
  ON properties
  FOR INSERT
  TO authenticated
  WITH CHECK (owner_id = auth.uid());

-- Owner can update their own properties (even after approval)
CREATE POLICY "owner update property"
  ON properties
  FOR UPDATE
  TO authenticated
  USING (owner_id = auth.uid());

-- Admin has full access to all properties
CREATE POLICY "admin manage properties"
  ON properties
  FOR ALL
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM users
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- Public can read only approved properties
CREATE POLICY "public read approved"
  ON properties
  FOR SELECT
  USING (status = 'approved');
