/*
  # Add Username to Users Table

  1. Changes
    - Add `username` column to `users` table
    - Username is optional and unique
    - Username used for display, NOT for login
    - Add index for performance

  2. Security
    - RLS policies remain unchanged
    - Users can update their own username
*/

-- Add username column if it doesn't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'users' AND column_name = 'username'
  ) THEN
    ALTER TABLE users ADD COLUMN username text UNIQUE;
  END IF;
END $$;

-- Create index for performance
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);

-- Add comment explaining username purpose
COMMENT ON COLUMN users.username IS 'Display name chosen by user. NOT used for authentication. Can be null.';