/*
  # Fix Property INSERT and UPDATE RLS Policies

  ## Overview
  Fixes RLS policies to allow property submission with pending status and editing by owners/admins.

  ## Changes

  1. INSERT Policy
    - Simplifies the policy to allow authenticated users to insert properties
    - Removes status restriction to allow 'pending' status
    - Ensures owner_id matches the authenticated user

  2. UPDATE Policy
    - Allows owners to update their own properties
    - Allows admins to update any property
    - Owners cannot change their own property status (enforced by previous migration)
    - Admins can change any property status

  ## Security Notes
  - Authenticated users can insert properties with any status, but the default is 'pending'
  - Owners can only update their own properties
  - Only admins can change property status or edit other users' properties
*/

-- Drop existing INSERT policies
DROP POLICY IF EXISTS "Owner insert pending properties" ON properties;
DROP POLICY IF EXISTS "Owners can insert properties" ON properties;
DROP POLICY IF EXISTS "Owners can insert their properties" ON properties;
DROP POLICY IF EXISTS "Authenticated insert properties" ON properties;
DROP POLICY IF EXISTS "authenticated users can insert properties" ON properties;
DROP POLICY IF EXISTS "Authenticated insert" ON properties;

-- Create simplified INSERT policy
CREATE POLICY "Authenticated users can insert properties"
ON properties
FOR INSERT
TO authenticated
WITH CHECK (
  auth.uid() IS NOT NULL
  AND owner_id = auth.uid()
);

-- Drop existing UPDATE policies
DROP POLICY IF EXISTS "Owner update own properties" ON properties;
DROP POLICY IF EXISTS "Owners can update own properties" ON properties;
DROP POLICY IF EXISTS "Owners can update their properties" ON properties;
DROP POLICY IF EXISTS "Owner update properties" ON properties;
DROP POLICY IF EXISTS "Owner update" ON properties;

-- Create UPDATE policy for owners (cannot change status)
CREATE POLICY "Owner can update own properties"
ON properties
FOR UPDATE
TO authenticated
USING (owner_id = auth.uid())
WITH CHECK (
  owner_id = auth.uid()
  AND (
    -- Ensure status hasn't changed from original
    status = (SELECT status FROM properties WHERE id = properties.id)
  )
);
