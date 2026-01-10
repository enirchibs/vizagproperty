/*
  # Fix Owner Edit Permissions with Auto-Reset Status

  1. Changes
    - Drop old restrictive owner edit policy
    - Create simple owner update policy (owner can always edit their properties)
    - Create admin update policy (admin can edit any property)
    - Add trigger to automatically reset status to 'pending' when owner edits
    - Admin edits do NOT reset status

  2. Security
    - Owner can update their own properties at any time
    - Admin can update any property at any time
    - Status is automatically reset to 'pending' when owner makes changes
    - Admin changes do not affect status
*/

-- Drop old restrictive policies
DROP POLICY IF EXISTS "owner edit pending property" ON properties;
DROP POLICY IF EXISTS "Owners can update only pending properties" ON properties;
DROP POLICY IF EXISTS "owner update pending property" ON properties;

-- Create simple owner update policy
CREATE POLICY "owner update property"
ON properties
FOR UPDATE
USING (
  auth.uid() = owner_id
);

-- Create admin update policy
CREATE POLICY "admin update property"
ON properties
FOR UPDATE
USING (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
);

-- Create function to reset status when owner edits
CREATE OR REPLACE FUNCTION reset_status_on_owner_edit()
RETURNS TRIGGER AS $$
BEGIN
  -- Only reset status if owner is editing (not admin)
  IF auth.uid() = OLD.owner_id AND (auth.jwt() ->> 'email') != 'himaaitools@gmail.com' THEN
    NEW.status := 'pending';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop existing trigger if it exists
DROP TRIGGER IF EXISTS trg_reset_status ON properties;

-- Create trigger
CREATE TRIGGER trg_reset_status
BEFORE UPDATE ON properties
FOR EACH ROW
EXECUTE FUNCTION reset_status_on_owner_edit();
