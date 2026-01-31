/*
  # Consolidate Property RLS Policies

  ## Changes
  
  1. **DROP old policies**
     - Removes fragmented SELECT policies (property_owner_read, property_public_read)
     - Removes limited UPDATE policy (property_update_owner)
     - Removes email-based admin policy (property_admin_all)
  
  2. **CREATE consolidated SELECT policy**
     - Public users: Can view approved properties only
     - Property owners: Can view their own properties (any status)
     - Admins: Can view all properties
  
  3. **CREATE consolidated UPDATE policy**
     - Property owners: Can update their own properties
     - Admins: Can update any property
     - Both must pass RLS check (owner_id preserved)
  
  ## Security Notes
  
  - Owner visibility: Owners always see their own listings regardless of status
  - Public visibility: Only approved properties are visible to unauthenticated/non-owner users
  - Admin access: Role-based check using public.users.role = 'admin'
  - Data integrity: owner_id cannot be changed by non-admins (enforced by WITH CHECK)
*/

-- Step 1: Drop old policies
DROP POLICY IF EXISTS "property_owner_read" ON properties;
DROP POLICY IF EXISTS "property_public_read" ON properties;
DROP POLICY IF EXISTS "property_update_owner" ON properties;
DROP POLICY IF EXISTS "property_admin_all" ON properties;

-- Step 2: Create consolidated SELECT policy
CREATE POLICY "public can view approved properties"
ON properties
FOR SELECT
USING (
  status = 'approved'
  OR auth.uid() = owner_id
  OR EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
      AND users.role = 'admin'
  )
);

-- Step 3: Create consolidated UPDATE policy
CREATE POLICY "owners and admins can update properties"
ON properties
FOR UPDATE
USING (
  auth.uid() = owner_id
  OR EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
      AND users.role = 'admin'
  )
)
WITH CHECK (
  auth.uid() = owner_id
  OR EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
      AND users.role = 'admin'
  )
);

-- Note: INSERT policy remains unchanged (property_insert_owner)
-- It correctly requires owner_id = auth.uid() on insert
