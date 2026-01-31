/*
  # Fix Properties RLS - Complete Access Control

  ## Problem
  - Owners cannot see their own pending/draft properties
  - Only approved properties are visible via public_read policy
  - owner_id column is nullable (should be NOT NULL for data integrity)

  ## Changes

  ### 1. Make owner_id NOT NULL
  - Ensure all existing properties have an owner_id
  - Make column NOT NULL to prevent orphaned properties

  ### 2. Add Missing SELECT Policies
  - **property_owner_read**: Owners can see ALL their own properties (draft, pending, approved, rejected)
  - Keep existing public_read policy for approved properties

  ### 3. Fix INSERT Policy
  - Ensure INSERT policy explicitly targets authenticated users
  - Keep WITH CHECK (owner_id = auth.uid())

  ### 4. Add WITH CHECK to UPDATE Policy
  - Owners can only update properties they own
  - Add WITH CHECK to prevent ownership transfer

  ## Security Model
  - **Public**: Can SELECT approved properties only
  - **Owners**: Can SELECT all own properties, INSERT with owner_id=self, UPDATE own properties
  - **Admins**: Full access via property_admin_all policy
*/

-- =====================================================
-- Step 1: Ensure all properties have an owner_id
-- =====================================================

-- Check if there are any properties without owner_id
DO $$
BEGIN
  -- If any properties exist without owner_id, we cannot proceed
  -- This should not happen in production, but we check anyway
  IF EXISTS (SELECT 1 FROM properties WHERE owner_id IS NULL) THEN
    RAISE EXCEPTION 'Cannot make owner_id NOT NULL: found properties without owner_id';
  END IF;
END $$;

-- Make owner_id NOT NULL
ALTER TABLE properties ALTER COLUMN owner_id SET NOT NULL;

-- =====================================================
-- Step 2: Drop and Recreate INSERT Policy (ensure TO authenticated)
-- =====================================================

DROP POLICY IF EXISTS "property_insert_owner" ON properties;

CREATE POLICY "property_insert_owner"
  ON properties
  FOR INSERT
  TO authenticated
  WITH CHECK (owner_id = auth.uid());

-- =====================================================
-- Step 3: Add Missing Owner SELECT Policy
-- =====================================================

-- Owners must be able to see their own properties (all statuses)
DROP POLICY IF EXISTS "property_owner_read" ON properties;

CREATE POLICY "property_owner_read"
  ON properties
  FOR SELECT
  TO authenticated
  USING (owner_id = auth.uid());

-- =====================================================
-- Step 4: Fix UPDATE Policy - Add WITH CHECK
-- =====================================================

DROP POLICY IF EXISTS "property_update_owner" ON properties;

CREATE POLICY "property_update_owner"
  ON properties
  FOR UPDATE
  TO authenticated
  USING (owner_id = auth.uid())
  WITH CHECK (owner_id = auth.uid());

-- =====================================================
-- Step 5: Ensure Admin Policy Has WITH CHECK
-- =====================================================

DROP POLICY IF EXISTS "property_admin_all" ON properties;

CREATE POLICY "property_admin_all"
  ON properties
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

-- =====================================================
-- Step 6: Keep Public Read Policy (No Changes)
-- =====================================================

-- Public can read only approved properties (already exists)
-- No changes needed, but we recreate for consistency

DROP POLICY IF EXISTS "property_public_read" ON properties;

CREATE POLICY "property_public_read"
  ON properties
  FOR SELECT
  USING (status = 'approved');
