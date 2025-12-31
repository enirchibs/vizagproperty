/*
  # Add Locality Reference to Properties

  1. Schema Changes
    - Add `locality_slug` column to properties table (NOT NULL, foreign key to vizag_localities)
    - This replaces free-text location data with structured locality references

  2. Performance Indexes
    - `idx_properties_locality` - Fast filtering by locality
    - `idx_properties_type_locality` - Fast combined filtering by type and locality

  3. Important Notes
    - All properties must reference a valid locality from vizag_localities table
    - NO free-text location data should be stored
    - Foreign key ensures data integrity
*/

-- Add locality_slug column with temporary default for existing rows
ALTER TABLE properties 
ADD COLUMN IF NOT EXISTS locality_slug text;

-- Set a default value for existing rows (using madhurawada as default)
UPDATE properties 
SET locality_slug = 'madhurawada' 
WHERE locality_slug IS NULL;

-- Now make it NOT NULL
ALTER TABLE properties 
ALTER COLUMN locality_slug SET NOT NULL;

-- Add foreign key constraint to ensure referential integrity
ALTER TABLE properties
ADD CONSTRAINT fk_properties_locality 
FOREIGN KEY (locality_slug) 
REFERENCES vizag_localities(locality_slug)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- Create index for locality-based queries
CREATE INDEX IF NOT EXISTS idx_properties_locality ON properties(locality_slug);

-- Create composite index for type + locality queries (e.g., "flats in Madhurawada")
CREATE INDEX IF NOT EXISTS idx_properties_type_locality ON properties(property_type, locality_slug);
