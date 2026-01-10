/*
  # Fix Recursive Admin Policies - Use JWT Claims
  
  ## Critical Issue
  Previous admin policies were recursive - they queried the users table to check if someone is admin,
  which causes performance issues and potential recursion problems.
  
  ## Solution
  Use auth.jwt() to check email directly from JWT token - no table lookups, no recursion.
  
  ## Changes
  
  1. Users Table Policies
    - Drop all existing policies (remove recursive ones)
    - Users can read their own profile (auth.uid() = id)
    - Admin can read all users (check JWT email)
    - Users can insert their own profile
    - Users can update their own profile
    - Admin can update all users
  
  2. Properties Table Policies
    - Drop all existing policies
    - Public can read approved properties
    - Owners can manage their own properties
    - Admin has full access (using JWT email check)
  
  ## Security
  - No recursive queries
  - Fast JWT-based auth checks
  - Admin email: himaaitools@gmail.com
*/

-- ============================================
-- USERS TABLE - Fix Recursive Policies
-- ============================================

-- Drop all existing policies on users table
DROP POLICY IF EXISTS "Users can read own profile" ON users;
DROP POLICY IF EXISTS "Admin can read all users" ON users;
DROP POLICY IF EXISTS "Users can insert own profile" ON users;
DROP POLICY IF EXISTS "Users can update own profile" ON users;
DROP POLICY IF EXISTS "Admin can update all users" ON users;
DROP POLICY IF EXISTS "users read self" ON users;
DROP POLICY IF EXISTS "admin read users" ON users;
DROP POLICY IF EXISTS "user read own" ON users;
DROP POLICY IF EXISTS "admin read all users" ON users;

-- Create clean, non-recursive policies

-- Users can read their own profile
CREATE POLICY "users read self"
ON users
FOR SELECT
TO authenticated
USING (auth.uid() = id);

-- Admin can read all users (using JWT email - NO RECURSION)
CREATE POLICY "admin read all users"
ON users
FOR SELECT
TO authenticated
USING (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
);

-- Users can insert their own profile
CREATE POLICY "users insert self"
ON users
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = id);

-- Users can update their own profile
CREATE POLICY "users update self"
ON users
FOR UPDATE
TO authenticated
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);

-- Admin can update all users (using JWT email - NO RECURSION)
CREATE POLICY "admin update all users"
ON users
FOR UPDATE
TO authenticated
USING (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
)
WITH CHECK (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
);

-- ============================================
-- PROPERTIES TABLE - Fix Recursive Policies
-- ============================================

-- Drop all existing policies on properties table
DROP POLICY IF EXISTS "Public can read approved properties only" ON properties;
DROP POLICY IF EXISTS "Owners can insert their properties" ON properties;
DROP POLICY IF EXISTS "Owners can read their own properties" ON properties;
DROP POLICY IF EXISTS "Owners can update their own properties" ON properties;
DROP POLICY IF EXISTS "Owners can delete their own properties" ON properties;
DROP POLICY IF EXISTS "Admins have full access to all properties" ON properties;

-- Create clean, non-recursive policies

-- Public can read approved properties
CREATE POLICY "public read approved"
ON properties
FOR SELECT
TO public
USING (status = 'approved');

-- Owners can insert their properties
CREATE POLICY "owner insert"
ON properties
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = owner_id);

-- Owners can read their own properties
CREATE POLICY "owner read own"
ON properties
FOR SELECT
TO authenticated
USING (auth.uid() = owner_id);

-- Owners can update their own properties
CREATE POLICY "owner update own"
ON properties
FOR UPDATE
TO authenticated
USING (auth.uid() = owner_id)
WITH CHECK (auth.uid() = owner_id);

-- Owners can delete their own properties
CREATE POLICY "owner delete own"
ON properties
FOR DELETE
TO authenticated
USING (auth.uid() = owner_id);

-- Admin has full access (using JWT email - NO RECURSION)
CREATE POLICY "admin full access"
ON properties
FOR ALL
TO authenticated
USING (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
)
WITH CHECK (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
);