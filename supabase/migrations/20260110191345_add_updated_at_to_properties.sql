/*
  # Add updated_at Column to Properties Table

  1. Changes
    - Add `updated_at` column to `properties` table with default now()
    - Create trigger function to auto-update `updated_at` on UPDATE
    - Create trigger on `properties` table to call the function

  2. Details
    - The `updated_at` column will automatically be set to the current timestamp when a row is created
    - The trigger will automatically update `updated_at` to the current timestamp whenever a row is updated
    - This ensures accurate tracking of when properties were last modified

  3. Notes
    - Using `IF NOT EXISTS` checks to prevent errors if column or trigger already exists
    - The trigger function is reusable and follows PostgreSQL best practices
*/

-- Add updated_at column if it doesn't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'updated_at'
  ) THEN
    ALTER TABLE properties ADD COLUMN updated_at timestamptz DEFAULT now();
  END IF;
END $$;

-- Create or replace the trigger function to auto-update updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Drop trigger if it exists, then create it
DROP TRIGGER IF EXISTS set_updated_at ON properties;

CREATE TRIGGER set_updated_at
  BEFORE UPDATE ON properties
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();
