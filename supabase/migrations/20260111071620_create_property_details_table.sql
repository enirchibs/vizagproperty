/*
  # Create Property Details Table

  1. New Tables
    - `property_details`
      - `id` (uuid, primary key) - Unique identifier with auto-generation
      - `property_id` (uuid, foreign key) - References properties table with cascade delete
      - `key` (text, not null) - Attribute name/key for the property detail
      - `value` (text, nullable) - Attribute value

  2. Security
    - Enable RLS on `property_details` table
    - Add policy for public to read details of approved properties
    - Add policy for property owners to manage their property details
    - Add policy for admin to manage all property details

  3. Purpose
    - Flexible key-value storage for additional property attributes
    - Allows dynamic property metadata without schema changes
    - Supports custom fields per property type
*/

-- Create property_details table
CREATE TABLE IF NOT EXISTS property_details (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id uuid REFERENCES properties(id) ON DELETE CASCADE,
  key text NOT NULL,
  value text
);

-- Enable Row Level Security
ALTER TABLE property_details ENABLE ROW LEVEL SECURITY;

-- Public can read property details for approved properties
CREATE POLICY "public read approved property details"
  ON property_details
  FOR SELECT
  TO public
  USING (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_details.property_id
      AND properties.status = 'approved'
    )
  );

-- Property owners can read their own property details
CREATE POLICY "owner read own property details"
  ON property_details
  FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_details.property_id
      AND properties.owner_id = auth.uid()
    )
  );

-- Property owners can insert details for their properties
CREATE POLICY "owner insert property details"
  ON property_details
  FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_details.property_id
      AND properties.owner_id = auth.uid()
    )
  );

-- Property owners can update their property details
CREATE POLICY "owner update property details"
  ON property_details
  FOR UPDATE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_details.property_id
      AND properties.owner_id = auth.uid()
    )
  )
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_details.property_id
      AND properties.owner_id = auth.uid()
    )
  );

-- Property owners can delete their property details
CREATE POLICY "owner delete property details"
  ON property_details
  FOR DELETE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_details.property_id
      AND properties.owner_id = auth.uid()
    )
  );

-- Admin can select all property details
CREATE POLICY "admin select all property details"
  ON property_details
  FOR SELECT
  TO authenticated
  USING ((auth.jwt() ->> 'email') = 'himaaitools@gmail.com');

-- Admin can insert property details
CREATE POLICY "admin insert property details"
  ON property_details
  FOR INSERT
  TO authenticated
  WITH CHECK ((auth.jwt() ->> 'email') = 'himaaitools@gmail.com');

-- Admin can update property details
CREATE POLICY "admin update property details"
  ON property_details
  FOR UPDATE
  TO authenticated
  USING ((auth.jwt() ->> 'email') = 'himaaitools@gmail.com')
  WITH CHECK ((auth.jwt() ->> 'email') = 'himaaitools@gmail.com');

-- Admin can delete property details
CREATE POLICY "admin delete property details"
  ON property_details
  FOR DELETE
  TO authenticated
  USING ((auth.jwt() ->> 'email') = 'himaaitools@gmail.com');

-- Create index for faster lookups
CREATE INDEX IF NOT EXISTS idx_property_details_property_id 
  ON property_details(property_id);

CREATE INDEX IF NOT EXISTS idx_property_details_key 
  ON property_details(key);
