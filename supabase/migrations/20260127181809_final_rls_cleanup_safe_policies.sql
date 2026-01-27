/*
  # Final RLS Cleanup - Remove Recursive Policies

  This migration performs a complete RLS reset to eliminate infinite recursion issues
  and establishes safe, minimal policies for the application.

  ## Changes Made

  ### 1. Policy Cleanup (Safe Reset)
  - Drops all existing policies on users, properties, and property_details tables
  - Removes potential recursive policy chains
  - Cleans up conflicting policy definitions

  ### 2. RLS Re-enablement
  - Ensures RLS is enabled on all core tables
  - Locks down tables by default (no access without explicit policies)

  ### 3. Safe User Policies (Non-Recursive)
  - **users_read_self_or_admin**: Users can read their own profile; admins can read all
    - Uses JWT email check (no table self-query to avoid recursion)
  - **users_update_self_or_admin**: Users can update their own profile; admins can update all
    - Uses JWT email check (no table self-query to avoid recursion)

  ### 4. Safe Property Policies
  - **property_insert_owner**: Authenticated users can create properties (owner_id = auth.uid())
  - **property_update_owner**: Property owners can edit their own properties
  - **property_admin_all**: Admins have full access to all properties (uses JWT email check)
  - **property_public_read**: Public can read only approved properties

  ### 5. Safe Property Details Policies
  - **details_owner_access**: Property owners have full access to their property details
    - Uses EXISTS subquery (safe, no recursion)

  ## Security Notes
  - No recursive policy chains
  - Admin detection via JWT email (hardcoded emails: pratapjamp@gmail.com, himaaitools@gmail.com)
  - All policies use auth.uid() or auth.jwt() for authentication
  - No self-referential table queries in user policies
*/

-- =====================================================
-- A. DROP ALL EXISTING POLICIES (SAFE RESET)
-- =====================================================

-- USERS TABLE
DROP POLICY IF EXISTS "users_select" ON users;
DROP POLICY IF EXISTS "users_update" ON users;
DROP POLICY IF EXISTS "admin read all users" ON users;
DROP POLICY IF EXISTS "users read own" ON users;
DROP POLICY IF EXISTS "users_read_self_or_admin" ON users;
DROP POLICY IF EXISTS "users_update_self_or_admin" ON users;

-- PROPERTIES TABLE
DROP POLICY IF EXISTS "owner insert property" ON properties;
DROP POLICY IF EXISTS "owner update property" ON properties;
DROP POLICY IF EXISTS "admin manage properties" ON properties;
DROP POLICY IF EXISTS "public read approved" ON properties;
DROP POLICY IF EXISTS "property_insert_owner" ON properties;
DROP POLICY IF EXISTS "property_update_owner" ON properties;
DROP POLICY IF EXISTS "property_admin_all" ON properties;
DROP POLICY IF EXISTS "property_public_read" ON properties;

-- PROPERTY DETAILS TABLE
DROP POLICY IF EXISTS "owner manage details" ON property_details;
DROP POLICY IF EXISTS "details_owner_access" ON property_details;

-- =====================================================
-- B. RE-ENABLE RLS (ENSURE TABLES ARE PROTECTED)
-- =====================================================

ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE properties ENABLE ROW LEVEL SECURITY;
ALTER TABLE property_details ENABLE ROW LEVEL SECURITY;

-- =====================================================
-- C. CREATE SAFE, NON-RECURSIVE POLICIES
-- =====================================================

-- -----------------------------------------------
-- USERS TABLE POLICIES (NO SELF-QUERY)
-- -----------------------------------------------

-- Users can read their own profile OR admins can read all
CREATE POLICY "users_read_self_or_admin"
ON users
FOR SELECT
USING (
  auth.uid() = id
  OR auth.jwt() ->> 'email' IN (
    'pratapjamp@gmail.com',
    'himaaitools@gmail.com'
  )
);

-- Users can update their own profile OR admins can update all
CREATE POLICY "users_update_self_or_admin"
ON users
FOR UPDATE
USING (
  auth.uid() = id
  OR auth.jwt() ->> 'email' IN (
    'pratapjamp@gmail.com',
    'himaaitools@gmail.com'
  )
);

-- -----------------------------------------------
-- PROPERTIES TABLE POLICIES
-- -----------------------------------------------

-- Authenticated users can create properties (becomes owner)
CREATE POLICY "property_insert_owner"
ON properties
FOR INSERT
WITH CHECK (owner_id = auth.uid());

-- Property owners can edit their own properties
CREATE POLICY "property_update_owner"
ON properties
FOR UPDATE
USING (owner_id = auth.uid());

-- Admins have full access to all properties
CREATE POLICY "property_admin_all"
ON properties
FOR ALL
USING (
  auth.jwt() ->> 'email' IN (
    'pratapjamp@gmail.com',
    'himaaitools@gmail.com'
  )
);

-- Public can read only approved properties
CREATE POLICY "property_public_read"
ON properties
FOR SELECT
USING (status = 'approved');

-- -----------------------------------------------
-- PROPERTY DETAILS TABLE POLICIES
-- -----------------------------------------------

-- Property owners have full access to their property details
CREATE POLICY "details_owner_access"
ON property_details
FOR ALL
USING (
  EXISTS (
    SELECT 1 FROM properties p
    WHERE p.id = property_details.property_id
    AND p.owner_id = auth.uid()
  )
);
