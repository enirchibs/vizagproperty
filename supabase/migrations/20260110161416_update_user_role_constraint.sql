/*
  # Update User Role Constraint

  1. Changes
    - Drop existing role check constraint if it exists
    - Add new role check constraint allowing: 'buyer', 'owner', 'admin'
  
  2. Security
    - Maintains data integrity by enforcing valid role values
    - Ensures only approved roles can be assigned to users
*/

ALTER TABLE users
DROP CONSTRAINT IF EXISTS users_role_check;

ALTER TABLE users
ADD CONSTRAINT users_role_check
CHECK (role IN ('buyer', 'owner', 'admin'));
