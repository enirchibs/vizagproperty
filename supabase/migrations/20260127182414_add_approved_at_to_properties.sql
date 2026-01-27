/*
  # Add approved_at Column to Properties Table

  This migration adds an approved_at timestamp column to track when properties are approved by admins.

  ## Changes Made
  - Add `approved_at` column (timestamptz, nullable) to properties table
  - This field is set when an admin approves a property
  - Helps track approval timeline and audit trail
*/

-- Add approved_at column to properties table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'approved_at'
  ) THEN
    ALTER TABLE properties ADD COLUMN approved_at timestamptz;
  END IF;
END $$;
