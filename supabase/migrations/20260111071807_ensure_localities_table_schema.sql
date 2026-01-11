/*
  # Ensure Localities Table Schema

  1. Table Structure
    - `localities` table
      - `id` (uuid, primary key) - Unique identifier with auto-generation
      - `name` (text, unique) - Locality name with unique constraint
      - `city` (text, default 'Visakhapatnam') - City name
      - `pincode` (text) - Postal code

  2. Changes Applied
    - Ensure table exists with IF NOT EXISTS
    - Add unique constraint on name column if not exists
    - Ensure pincode column exists (already added in previous migrations)

  3. Notes
    - Table already exists with additional columns (slug, latitude, longitude, created_at)
    - This migration ensures the core schema matches requirements
    - Existing data and columns are preserved
*/

-- Create localities table if not exists
CREATE TABLE IF NOT EXISTS localities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  city text DEFAULT 'Visakhapatnam',
  pincode text
);

-- Add unique constraint on name if it doesn't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint 
    WHERE conname = 'localities_name_key' 
    AND conrelid = 'localities'::regclass
  ) THEN
    ALTER TABLE localities ADD CONSTRAINT localities_name_key UNIQUE (name);
  END IF;
END $$;

-- Ensure RLS is enabled
ALTER TABLE localities ENABLE ROW LEVEL SECURITY;

-- Create index on city for faster filtering
CREATE INDEX IF NOT EXISTS idx_localities_city ON localities(city);

-- Create index on pincode for faster lookups
CREATE INDEX IF NOT EXISTS idx_localities_pincode ON localities(pincode);
