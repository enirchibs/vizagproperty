/*
  # Add Admin Notes Column to Properties Table

  This migration adds an internal admin_notes field for admins to track information privately.

  ## Changes Made
  - Add `admin_notes` column (text, nullable) to properties table
  - This field is only visible to admins, never to property owners
  - Used for internal tracking, concerns, follow-ups, etc.
  
  ## Security
  - Already covered by existing admin RLS policies
  - Only admins can read/write this field
*/

-- Add admin_notes column to properties table
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'admin_notes'
  ) THEN
    ALTER TABLE properties ADD COLUMN admin_notes text;
  END IF;
END $$;
