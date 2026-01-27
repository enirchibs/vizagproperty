/*
  # Add Rejection Reason Column to Properties Table

  This migration adds a rejection_reason column to help admins provide feedback to owners.

  ## Changes Made
  - Add `rejection_reason` column (text, nullable) to properties table
  - Allows admins to explain why a property was rejected
  - Helps owners improve their listings
*/

-- Add rejection_reason column to properties table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'rejection_reason'
  ) THEN
    ALTER TABLE properties ADD COLUMN rejection_reason text;
  END IF;
END $$;
