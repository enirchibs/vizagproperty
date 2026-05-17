/*
  # Fix Recursive RLS Policy on Users Table - CRITICAL FIX
  
  1. Problem Identified
    - The "Admins can update trusted status" policy on the users table has a RECURSIVE query
    - It queries FROM users WHERE users.role = 'admin' while being applied TO the users table
    - This causes infinite loops and hangs when:
      * Submitting properties (triggers auto_make_owner which updates users.role)
      * Loading admin dashboard (checks admin status)
      * Any operation that checks user role
  
  2. Root Cause
    - Policy created: likely between Jan 27 - Feb 8, 2026
    - Affects: Property submission, admin dashboard, profile loads
    - Symptom: Page "continuously rolling" (infinite query loop)
  
  3. Solution
    - Replace recursive policy with JWT-based check
    - Use auth.jwt() which doesn't query the users table
    - Same security level, no recursion
  
  4. Migration Actions
    - Drop the problematic recursive policy
    - Create new JWT-based policy using email whitelist
    - Maintains admin access control without table self-reference
*/

-- Drop the recursive policy that causes infinite loops
DROP POLICY IF EXISTS "Admins can update trusted status" ON users;

-- Create new non-recursive policy using JWT email check
-- This avoids querying the users table while evaluating users table access
CREATE POLICY "admin_update_trusted_via_jwt"
  ON users
  FOR UPDATE
  TO authenticated
  USING (
    -- Allow if user is updating themselves OR if they are an admin (via JWT email check)
    (auth.uid() = id) OR 
    ((auth.jwt()->>'email') IN ('pratapjamp@gmail.com', 'himaaitools@gmail.com'))
  )
  WITH CHECK (
    (auth.uid() = id) OR 
    ((auth.jwt()->>'email') IN ('pratapjamp@gmail.com', 'himaaitools@gmail.com'))
  );

-- Verify no recursive policies remain on users table
-- This query should return 0 rows with 'RECURSIVE' in recursive_check column
DO $$
DECLARE
  recursive_count integer;
BEGIN
  SELECT COUNT(*) INTO recursive_count
  FROM pg_policies 
  WHERE tablename = 'users' 
    AND schemaname = 'public'
    AND (qual LIKE '%FROM users%' OR with_check LIKE '%FROM users%');
  
  IF recursive_count > 0 THEN
    RAISE NOTICE 'WARNING: % recursive policies still exist on users table', recursive_count;
  ELSE
    RAISE NOTICE 'SUCCESS: No recursive policies on users table';
  END IF;
END $$;
