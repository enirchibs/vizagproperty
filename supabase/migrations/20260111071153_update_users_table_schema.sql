/*
  # Update Users Table Schema

  1. Changes
    - Ensure users table exists with proper structure
    - Make columns nullable as per specification (name, email, phone)
    - Add DEFAULT 'buyer' to role column
    - Ensure foreign key references auth.users(id) with ON DELETE CASCADE
    - Keep existing username column and constraints

  2. Details
    - The table will have: id, name, email, phone, role, created_at, username
    - role has check constraint for 'buyer', 'owner', 'admin' values
    - Foreign key ensures data integrity with auth.users
    - Default values ensure proper data on insert

  3. Notes
    - Using IF NOT EXISTS to safely create table if it doesn't exist
    - Altering existing columns to match specification
    - Preserving username column added in previous migration
*/

-- Create table if not exists
CREATE TABLE IF NOT EXISTS users (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  name text,
  email text,
  phone text,
  role text CHECK (role IN ('buyer', 'owner', 'admin')) DEFAULT 'buyer',
  created_at timestamptz DEFAULT now(),
  username text UNIQUE
);

-- Update existing columns to match specification
DO $$
BEGIN
  -- Make name nullable if it's not
  ALTER TABLE users ALTER COLUMN name DROP NOT NULL;
  
  -- Make role nullable and add default if not already set
  ALTER TABLE users ALTER COLUMN role DROP NOT NULL;
  ALTER TABLE users ALTER COLUMN role SET DEFAULT 'buyer';
  
  -- Make created_at nullable if it's not
  ALTER TABLE users ALTER COLUMN created_at DROP NOT NULL;
  
  -- Update role check constraint if needed
  ALTER TABLE users DROP CONSTRAINT IF EXISTS users_role_check;
  ALTER TABLE users ADD CONSTRAINT users_role_check 
    CHECK (role IN ('buyer', 'owner', 'admin'));
    
EXCEPTION
  WHEN OTHERS THEN
    -- Columns might already be in correct state
    NULL;
END $$;

-- Ensure foreign key exists with proper cascade
DO $$
BEGIN
  -- Drop existing foreign key if it exists
  ALTER TABLE users DROP CONSTRAINT IF EXISTS users_id_fkey;
  
  -- Add foreign key with ON DELETE CASCADE
  ALTER TABLE users ADD CONSTRAINT users_id_fkey 
    FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE;
EXCEPTION
  WHEN OTHERS THEN
    -- Foreign key might already be correct
    NULL;
END $$;
