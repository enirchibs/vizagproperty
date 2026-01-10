/*
  # Fix Property Permissions and Auto-Owner Conversion

  1. Changes
    - Drop existing "owners can insert properties" policy
    - Create new policy allowing any authenticated user to insert properties with their own owner_id
    - Create auto_make_owner() function to convert users to owners after property submission
    - Create trigger to automatically execute the conversion

  2. Security
    - Authenticated users can insert properties with owner_id = auth.uid()
    - Users are automatically converted to 'owner' role after first property submission
    - Ensures data integrity by enforcing owner_id matches authenticated user

  3. Notes
    - Uses IF NOT EXISTS checks for idempotency
    - Drops existing policies/triggers before recreating them
    - Function only updates users who are not already owners
*/

-- RLS: allow authenticated users to insert their own properties
DROP POLICY IF EXISTS "owners can insert properties" ON properties;

CREATE POLICY "authenticated users can insert properties"
ON properties
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = owner_id);

-- Auto convert user to owner after posting property
CREATE OR REPLACE FUNCTION auto_make_owner()
RETURNS trigger AS $$
BEGIN
  UPDATE user_profiles
  SET role = 'owner',
      user_type = 'seller'
  WHERE id = NEW.owner_id
    AND role != 'owner';
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS trg_auto_make_owner ON properties;

CREATE TRIGGER trg_auto_make_owner
AFTER INSERT ON properties
FOR EACH ROW
EXECUTE FUNCTION auto_make_owner();
