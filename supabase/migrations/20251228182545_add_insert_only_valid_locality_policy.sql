/*
  # Add Locality Validation for Property Inserts

  1. Security Changes
    - Add RLS policy to validate locality_slug on property inserts
    - Only allows inserting properties with valid locality_slug from vizag_localities table
    - Prevents orphaned or invalid locality references

  2. Important Notes
    - Policy applies to INSERT operations only
    - locality_slug must exist in vizag_localities table (regardless of is_active status)
    - This ensures referential integrity at the RLS level
*/

-- Create policy to ensure only valid locality_slug values can be inserted
CREATE POLICY "insert_only_valid_locality"
  ON properties 
  FOR INSERT
  WITH CHECK (
    locality_slug IN (
      SELECT locality_slug 
      FROM vizag_localities
    )
  );
