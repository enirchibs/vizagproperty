/*
  # Update Users Table SELECT Policies

  1. Changes
    - Drop old "users read self" policy (uses auth.uid() = id)
    - Drop old "admin read all users" policy (uses hardcoded email check)
    - Create new "users read own" policy (uses id = auth.uid())
    - Create new "admin read all users" policy (checks role column in users table)

  2. Security Improvements
    - Admin check now uses role-based access from users.role column
    - More scalable approach than hardcoded email addresses
    - Maintains same security level with better flexibility

  3. Notes
    - This migration uses IF EXISTS to safely handle policy changes
    - Existing INSERT and UPDATE policies remain unchanged
*/

-- Drop old SELECT policies
DROP POLICY IF EXISTS "users read self" ON users;
DROP POLICY IF EXISTS "admin read all users" ON users;

-- Create new SELECT policy for users to read their own data
CREATE POLICY "users read own"
  ON users 
  FOR SELECT
  TO authenticated
  USING (id = auth.uid());

-- Create new SELECT policy for admins to read all users
CREATE POLICY "admin read all users"
  ON users 
  FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM users u
      WHERE u.id = auth.uid() AND u.role = 'admin'
    )
  );
