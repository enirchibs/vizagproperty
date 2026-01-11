/*
  # Update Property Details RLS Policies

  1. Changes
    - Drop old separate owner policies (read, insert, update, delete)
    - Create single "owner manage details" policy for all operations
    - Update admin policies to use role check instead of email check
    - Keep public read policy for approved properties

  2. Security Model
    - **Owner Access**: Property owners can manage all details (select, insert, update, delete) for their properties
    - **Admin Access**: Admins with role='admin' have full access to all property details
    - **Public Access**: Anyone can read details for approved properties

  3. Important Notes
    - Owner policy checks property ownership via properties.owner_id
    - Single FOR ALL policy simplifies owner permissions
    - Admin check uses users.role column for consistency
    - Public access limited to approved properties only
*/

-- Drop old owner policies
DROP POLICY IF EXISTS "owner read own property details" ON property_details;
DROP POLICY IF EXISTS "owner insert property details" ON property_details;
DROP POLICY IF EXISTS "owner update property details" ON property_details;
DROP POLICY IF EXISTS "owner delete property details" ON property_details;

-- Drop old admin policies
DROP POLICY IF EXISTS "admin select all property details" ON property_details;
DROP POLICY IF EXISTS "admin insert property details" ON property_details;
DROP POLICY IF EXISTS "admin update property details" ON property_details;
DROP POLICY IF EXISTS "admin delete property details" ON property_details;
DROP POLICY IF EXISTS "admin manage property details" ON property_details;

-- Owner can manage all details for their properties
CREATE POLICY "owner manage details"
  ON property_details
  FOR ALL
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties p
      WHERE p.id = property_details.property_id
      AND p.owner_id = auth.uid()
    )
  );

-- Admin has full access to all property details
CREATE POLICY "admin manage property details"
  ON property_details
  FOR ALL
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM users
      WHERE id = auth.uid() AND role = 'admin'
    )
  );
