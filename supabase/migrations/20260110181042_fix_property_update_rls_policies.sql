/*
  # Fix Property Update RLS Policies
  
  ## Problem
  Broken update policies were causing silent redirect issues when users tried to update properties.
  
  ## Changes
  
  1. Remove Broken Policies
    - Drop "owners update properties" policy (if exists)
    - Drop "admin full access" policy (will recreate with correct scope)
  
  2. Safe Update Policies
    - "owner edit pending property" - Owners can ONLY edit properties with status='pending'
    - "admin edit property" - Admin can edit ANY property at ANY time
  
  3. Security
    - NO recursion risk
    - Clear permission boundaries
    - Status-based access control for owners
    - JWT email check for admin (instant auth)
  
  ## Impact
  - Fixes silent redirect on property updates
  - Owners can edit only before approval
  - Admin has full edit access
  - Production-ready, non-recursive policies
*/

-- ============================================
-- REMOVE BROKEN POLICIES
-- ============================================

DROP POLICY IF EXISTS "owners update properties" ON properties;
DROP POLICY IF EXISTS "admin full access" ON properties;

-- ============================================
-- CREATE SAFE UPDATE POLICIES
-- ============================================

-- Owner can edit ONLY properties with status='pending'
CREATE POLICY "owner edit pending property"
ON properties
FOR UPDATE
TO authenticated
USING (
  auth.uid() = owner_id
  AND status = 'pending'
)
WITH CHECK (
  auth.uid() = owner_id
  AND status = 'pending'
);

-- Admin can edit ANY property at ANY time
CREATE POLICY "admin edit property"
ON properties
FOR UPDATE
TO authenticated
USING (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
)
WITH CHECK (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
);

-- ============================================
-- RECREATE ADMIN SELECT/INSERT/DELETE
-- ============================================

-- Admin needs SELECT access too
CREATE POLICY "admin select all properties"
ON properties
FOR SELECT
TO authenticated
USING (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
);

-- Admin can insert properties
CREATE POLICY "admin insert property"
ON properties
FOR INSERT
TO authenticated
WITH CHECK (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
);

-- Admin can delete properties
CREATE POLICY "admin delete property"
ON properties
FOR DELETE
TO authenticated
USING (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
);