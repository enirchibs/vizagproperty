-- Fix Property RLS Policies to allow all admin roles to view pending properties

DROP POLICY IF EXISTS "public can view approved properties" ON properties;
CREATE POLICY "public can view approved properties"
ON properties
FOR SELECT
USING (
  status = 'approved'
  OR auth.uid() = owner_id
  OR EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
      AND users.role IN ('admin', 'super_admin', 'property_admin')
  )
);

DROP POLICY IF EXISTS "owners and admins can update properties" ON properties;
CREATE POLICY "owners and admins can update properties"
ON properties
FOR UPDATE
USING (
  auth.uid() = owner_id
  OR EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
      AND users.role IN ('admin', 'super_admin', 'property_admin')
  )
)
WITH CHECK (
  auth.uid() = owner_id
  OR EXISTS (
    SELECT 1 FROM users
    WHERE users.id = auth.uid()
      AND users.role IN ('admin', 'super_admin', 'property_admin')
  )
);
