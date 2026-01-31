/*
  # Fix Property Details RLS Policies

  ## Problem
  - Current policy uses "FOR ALL" on public role
  - Should explicitly target authenticated users
  - Needs separate WITH CHECK clause for INSERT operations

  ## Changes

  ### 1. Replace Single "FOR ALL" Policy with Specific Policies
  - **details_owner_select**: Owners can view their property details
  - **details_owner_insert**: Owners can insert details for their properties
  - **details_owner_update**: Owners can update their property details
  - **details_owner_delete**: Owners can delete their property details
  - **details_admin_all**: Admins have full access

  ## Security Model
  - Owners can only manage details for properties they own
  - Admins can manage all property details
  - Uses EXISTS subquery to check property ownership (safe, no recursion)
*/

-- =====================================================
-- Drop Existing Policy
-- =====================================================

DROP POLICY IF EXISTS "details_owner_access" ON property_details;

-- =====================================================
-- Create Separate Policies for Each Operation
-- =====================================================

-- Owners can SELECT details for their properties
CREATE POLICY "details_owner_select"
  ON property_details
  FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties p
      WHERE p.id = property_details.property_id
      AND p.owner_id = auth.uid()
    )
  );

-- Owners can INSERT details for their properties
CREATE POLICY "details_owner_insert"
  ON property_details
  FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM properties p
      WHERE p.id = property_details.property_id
      AND p.owner_id = auth.uid()
    )
  );

-- Owners can UPDATE details for their properties
CREATE POLICY "details_owner_update"
  ON property_details
  FOR UPDATE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties p
      WHERE p.id = property_details.property_id
      AND p.owner_id = auth.uid()
    )
  )
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM properties p
      WHERE p.id = property_details.property_id
      AND p.owner_id = auth.uid()
    )
  );

-- Owners can DELETE details for their properties
CREATE POLICY "details_owner_delete"
  ON property_details
  FOR DELETE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties p
      WHERE p.id = property_details.property_id
      AND p.owner_id = auth.uid()
    )
  );

-- Admins have full access to all property details
CREATE POLICY "details_admin_all"
  ON property_details
  FOR ALL
  TO authenticated
  USING (
    auth.jwt() ->> 'email' IN (
      'pratapjamp@gmail.com',
      'himaaitools@gmail.com'
    )
  )
  WITH CHECK (
    auth.jwt() ->> 'email' IN (
      'pratapjamp@gmail.com',
      'himaaitools@gmail.com'
    )
  );
