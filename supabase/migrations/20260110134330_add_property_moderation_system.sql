/*
  # Add Property Moderation System

  ## Overview
  Implements a moderation workflow for property listings where new submissions require admin approval.

  ## Changes

  1. Status Column Updates
    - Set default value to 'pending' for new properties
    - Add check constraint to ensure valid status values: 'pending', 'active', 'rejected'

  2. Row Level Security Policies
    - **Public read active properties**: Unauthenticated and authenticated users can only view properties with status='active'
    - **Owner read own properties**: Property owners can view all their own properties regardless of status
    - **Owner insert pending properties**: Property owners can insert new properties (automatically set to 'pending')
    - **Owner update own properties**: Property owners can update their own properties but cannot change status
    - **Admin full access**: Admin users have full read/write access to all properties including status changes

  ## Security Notes
  - New properties automatically enter 'pending' status
  - Only admins can approve (status='active') or reject (status='rejected') properties
  - Public pages only display approved properties
  - Owners can view their pending/rejected listings in their dashboard
*/

-- Add check constraint for status values if it doesn't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conname = 'properties_status_check'
  ) THEN
    ALTER TABLE properties
    ADD CONSTRAINT properties_status_check
    CHECK (status IN ('pending', 'active', 'rejected'));
  END IF;
END $$;

-- Set default value for status column
ALTER TABLE properties
ALTER COLUMN status SET DEFAULT 'pending';

-- Drop ALL existing policies to recreate them with new logic
DROP POLICY IF EXISTS "Public can read all properties" ON properties;
DROP POLICY IF EXISTS "Public read all properties" ON properties;
DROP POLICY IF EXISTS "Anyone can view properties" ON properties;
DROP POLICY IF EXISTS "Public read active properties" ON properties;
DROP POLICY IF EXISTS "Owner read own properties" ON properties;
DROP POLICY IF EXISTS "Owners can insert properties" ON properties;
DROP POLICY IF EXISTS "Owners can insert their properties" ON properties;
DROP POLICY IF EXISTS "Owners can update own properties" ON properties;
DROP POLICY IF EXISTS "Owners can update their properties" ON properties;
DROP POLICY IF EXISTS "Owner update properties" ON properties;
DROP POLICY IF EXISTS "Owners can delete their properties" ON properties;
DROP POLICY IF EXISTS "Owner delete properties" ON properties;
DROP POLICY IF EXISTS "Authenticated insert properties" ON properties;
DROP POLICY IF EXISTS "authenticated users can insert properties" ON properties;
DROP POLICY IF EXISTS "Admin full access" ON properties;

-- Public can only view active properties
CREATE POLICY "Public read active properties"
ON properties
FOR SELECT
TO public
USING (status = 'active');

-- Owners can view their own properties (any status)
CREATE POLICY "Owner read own properties"
ON properties
FOR SELECT
TO authenticated
USING (owner_id = auth.uid());

-- Owners can insert new properties (will be set to pending by default)
CREATE POLICY "Owner insert pending properties"
ON properties
FOR INSERT
TO authenticated
WITH CHECK (
  owner_id = auth.uid()
  AND (status = 'pending' OR status IS NULL)
);

-- Owners can update their own properties but cannot change status
CREATE POLICY "Owner update own properties"
ON properties
FOR UPDATE
TO authenticated
USING (owner_id = auth.uid())
WITH CHECK (
  owner_id = auth.uid()
  AND status = (SELECT status FROM properties WHERE id = properties.id)
);

-- Owners can delete their own properties
CREATE POLICY "Owner delete own properties"
ON properties
FOR DELETE
TO authenticated
USING (owner_id = auth.uid());

-- Admin has full access to all properties
CREATE POLICY "Admin full access"
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
