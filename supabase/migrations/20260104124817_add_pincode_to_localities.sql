/*
  # Add pincode column to localities table

  1. Changes
    - Add `pincode` column to localities table (6-digit string)
    - This will enable auto-fill functionality when users select a locality
  
  2. Notes
    - Pincode is nullable as existing localities may not have this data yet
    - Can be updated later with actual pincode data for each locality
*/

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'localities' AND column_name = 'pincode'
  ) THEN
    ALTER TABLE localities ADD COLUMN pincode text;
  END IF;
END $$;