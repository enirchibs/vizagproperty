/*
  # Fix auto_make_owner Function to Remove user_type Column

  1. Changes
    - Drop existing auto_make_owner function and trigger
    - Recreate auto_make_owner function to only update "role" column
    - Remove reference to non-existent "user_type" column

  2. Security
    - Function uses SECURITY DEFINER to allow updating users table
    - Only updates users who are not already owners
    - Ensures data integrity by checking role before updating

  3. Notes
    - Fixes "column user_type does not exist" error
    - Only updates the "role" column which exists in users table
    - Maintains same functionality: auto-converts users to owners after first property post
*/

-- Drop existing function and trigger
DROP FUNCTION IF EXISTS auto_make_owner() CASCADE;

-- Recreate function to only update role column
CREATE OR REPLACE FUNCTION auto_make_owner()
RETURNS trigger AS $$
BEGIN
  UPDATE users
  SET role = 'owner'
  WHERE id = NEW.owner_id
    AND role != 'owner';
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Recreate trigger
CREATE TRIGGER trg_auto_make_owner
AFTER INSERT ON properties
FOR EACH ROW
EXECUTE FUNCTION auto_make_owner();
