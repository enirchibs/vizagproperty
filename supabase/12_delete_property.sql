/*
  # Delete Problematic Property SQL Script
  
  This script deletes the property "open 2 roads cornor commercial plot for sale at Bogapuram (Akkivaram)"
  (ID: 1938797e-5203-4ed0-a973-1b108541dd64) and any associated property details.
*/

-- 1. Delete associated details if any
DELETE FROM public.property_details 
WHERE property_id IN (
  SELECT id FROM public.properties 
  WHERE agent_phone = '8008444089' 
     OR id = '1938797e-5203-4ed0-a973-1b108541dd64'
     OR title ILIKE '%bogapuram%'
);

-- 2. Delete favorites referencing this property
DELETE FROM public.favorites 
WHERE property_id IN (
  SELECT id FROM public.properties 
  WHERE agent_phone = '8008444089' 
     OR id = '1938797e-5203-4ed0-a973-1b108541dd64'
     OR title ILIKE '%bogapuram%'
);

-- 3. Delete property from properties table
DELETE FROM public.properties 
WHERE agent_phone = '8008444089' 
   OR id = '1938797e-5203-4ed0-a973-1b108541dd64';

-- 4. Enable DELETE policy for Admins on properties table so Admins can delete any property directly from Admin Panel
DROP POLICY IF EXISTS "Admins can delete any property" ON public.properties;
CREATE POLICY "Admins can delete any property"
ON public.properties FOR DELETE
USING (
  auth.uid() = owner_id OR
  EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid()
    AND role IN ('super_admin', 'property_admin', 'admin')
  ) OR
  (SELECT email FROM auth.users WHERE id = auth.uid()) IN ('vsekharsqldba@gmail.com', 'admin@vizagproperty.co.in')
);
