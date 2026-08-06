/*
  # Admin Property Approval & Users RLS Fix
  
  This SQL script ensures that admin users (specifically vsekharsqldba@gmail.com, admin@vizagproperty.co.in,
  and users with role super_admin / property_admin / admin) can:
  1. Read owner profiles from public.users
  2. UPDATE and approve ANY property listing in public.properties
*/

-- 1. Enable RLS on users table and grant SELECT to Admins
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Admins can view all users" ON public.users;
DROP POLICY IF EXISTS "Public can view basic user profiles" ON public.users;

CREATE POLICY "Admins and owners can view users"
ON public.users FOR SELECT
USING (
  auth.uid() = id OR
  EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid()
    AND role IN ('super_admin', 'property_admin', 'admin')
  ) OR
  (SELECT email FROM auth.users WHERE id = auth.uid()) IN ('vsekharsqldba@gmail.com', 'admin@vizagproperty.co.in')
);

-- 2. Ensure RLS is enabled on properties table
ALTER TABLE public.properties ENABLE ROW LEVEL SECURITY;

-- 3. Drop existing restricting update policies on properties
DROP POLICY IF EXISTS "Admins can update all properties" ON public.properties;
DROP POLICY IF EXISTS "Users can update own properties" ON public.properties;
DROP POLICY IF EXISTS "Allow owner or admin update" ON public.properties;
DROP POLICY IF EXISTS "Admins and Owners can update properties" ON public.properties;

-- 4. Policy: Anyone can select approved properties (or owner/admin can select all)
DROP POLICY IF EXISTS "Public can view approved properties" ON public.properties;
CREATE POLICY "Public can view approved properties"
ON public.properties FOR SELECT
USING (
  status = 'approved' OR
  auth.uid() = owner_id OR
  EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid()
    AND role IN ('super_admin', 'property_admin', 'admin')
  ) OR
  (SELECT email FROM auth.users WHERE id = auth.uid()) IN ('vsekharsqldba@gmail.com', 'admin@vizagproperty.co.in')
);

-- 5. Policy: Owners can insert properties
DROP POLICY IF EXISTS "Owners can insert properties" ON public.properties;
CREATE POLICY "Owners can insert properties"
ON public.properties FOR INSERT
WITH CHECK (
  auth.uid() = owner_id OR
  auth.uid() IS NOT NULL
);

-- 6. CRITICAL POLICY: Allow Owners AND Admins to UPDATE properties (Approve / Reject / Edit Notes)
CREATE POLICY "Admins and Owners can update properties"
ON public.properties FOR UPDATE
USING (
  auth.uid() = owner_id OR
  EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid()
    AND role IN ('super_admin', 'property_admin', 'admin')
  ) OR
  (SELECT email FROM auth.users WHERE id = auth.uid()) IN ('vsekharsqldba@gmail.com', 'admin@vizagproperty.co.in')
)
WITH CHECK (
  auth.uid() = owner_id OR
  EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid()
    AND role IN ('super_admin', 'property_admin', 'admin')
  ) OR
  (SELECT email FROM auth.users WHERE id = auth.uid()) IN ('vsekharsqldba@gmail.com', 'admin@vizagproperty.co.in')
);

-- 7. Ensure vsekharsqldba@gmail.com is set as super_admin in users table
UPDATE public.users 
SET role = 'super_admin'
WHERE email = 'vsekharsqldba@gmail.com';
