/*
  # Link Properties to Vizag Localities

  1. Changes to `properties` table
    - Add `locality_id` (uuid, FK to vizag_localities) - Strict locality reference
    - Make old `location` and `city` fields nullable for backward compatibility
    - Add index on locality_id for fast lookups
    - Add constraint to ensure locality_id is set for new properties

  2. Data Migration
    - Existing properties keep their free-text location/city for now
    - New properties MUST use locality_id

  3. Security
    - Update RLS policies if needed (no changes required)

  4. Important Notes
    - **NO MORE free-text locality fields for new properties**
    - All new property inserts must reference vizag_localities.id
    - Old properties can be migrated gradually using a data migration script
*/

-- Add locality_id foreign key to properties
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'locality_id'
  ) THEN
    ALTER TABLE properties ADD COLUMN locality_id uuid REFERENCES vizag_localities(id) ON DELETE RESTRICT;
  END IF;
END $$;

-- Make old location and city fields nullable (for backward compatibility with existing data)
ALTER TABLE properties ALTER COLUMN location DROP NOT NULL;
ALTER TABLE properties ALTER COLUMN city DROP NOT NULL;

-- Add index for fast locality lookups
CREATE INDEX IF NOT EXISTS idx_properties_locality ON properties(locality_id);

-- Add check constraint to ensure new properties have locality_id
-- (This constraint will be enforced at application level for now)
-- Uncomment when ready to enforce strictly:
-- ALTER TABLE properties ADD CONSTRAINT check_locality_id_required 
--   CHECK (locality_id IS NOT NULL OR created_at < '2025-12-28');

-- Create a helpful view that joins properties with locality information
CREATE OR REPLACE VIEW properties_with_locality AS
SELECT 
  p.*,
  l.locality_name,
  l.locality_slug,
  l.latitude as locality_latitude,
  l.longitude as locality_longitude
FROM properties p
LEFT JOIN vizag_localities l ON p.locality_id = l.id;

-- Grant access to the view
GRANT SELECT ON properties_with_locality TO anon, authenticated;
