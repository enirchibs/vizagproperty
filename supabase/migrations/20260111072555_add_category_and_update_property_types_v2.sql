/*
  # Add Category and Update Property Types (Fixed)

  1. Changes
    - Add `category` column to properties table ('residential' or 'commercial')
    - Update property_type column to support new type values
    - Add 'lease' as a listing_type option
    - Make bedrooms and bathrooms nullable (not all properties need these)
    - Migrate existing data first, then update constraints

  2. New Property Types
    **Residential**: flat_apartment, independent_house_villa, plot_land, pg_hostel, 
                     farmhouse, serviced_apartment, other_residential
    **Commercial**: office, shop, showroom, warehouse, industrial_land, 
                    commercial_plot, commercial_farmhouse, coworking_space, other_commercial

  3. Backward Compatibility
    - Existing data will be migrated automatically
    - Old property_type values will be mapped to new values
    - Default category is 'residential' for existing properties

  4. Important Notes
    - Category field is required for new properties
    - Property type must match the selected category
    - Bedrooms/bathrooms are now optional (not needed for plots, commercial properties)
    - Listing type now includes 'lease' option
*/

-- Step 1: Add category column without constraint first
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'category'
  ) THEN
    ALTER TABLE properties 
    ADD COLUMN category text DEFAULT 'residential';
  END IF;
END $$;

-- Step 2: Remove old constraints
ALTER TABLE properties DROP CONSTRAINT IF EXISTS check_property_type;
ALTER TABLE properties DROP CONSTRAINT IF EXISTS check_listing_type;
ALTER TABLE properties DROP CONSTRAINT IF EXISTS check_category;

-- Step 3: Make bedrooms and bathrooms nullable
ALTER TABLE properties ALTER COLUMN bedrooms DROP NOT NULL;
ALTER TABLE properties ALTER COLUMN bathrooms DROP NOT NULL;

-- Step 4: Migrate existing data - map old values to new values
UPDATE properties SET property_type = 'flat_apartment' 
WHERE property_type IN ('apartment', 'flat');

UPDATE properties SET property_type = 'independent_house_villa' 
WHERE property_type IN ('villa', 'house');

UPDATE properties SET property_type = 'plot_land' 
WHERE property_type IN ('plot', 'land');

UPDATE properties SET property_type = 'pg_hostel' 
WHERE property_type = 'pg';

UPDATE properties SET property_type = 'office' 
WHERE property_type IN ('commercial', 'office_space');

UPDATE properties SET property_type = 'other_residential' 
WHERE property_type = 'penthouse';

-- Step 5: Set category based on property_type
UPDATE properties SET category = 'commercial' 
WHERE property_type IN ('office', 'shop', 'showroom', 'warehouse', 'industrial_land', 
                        'commercial_plot', 'commercial_farmhouse', 'coworking_space', 'other_commercial');

UPDATE properties SET category = 'residential' 
WHERE property_type IN ('flat_apartment', 'independent_house_villa', 'plot_land', 'pg_hostel',
                        'farmhouse', 'serviced_apartment', 'other_residential');

-- Step 6: Make category NOT NULL now that all rows have values
ALTER TABLE properties ALTER COLUMN category SET NOT NULL;

-- Step 7: Add new constraints
ALTER TABLE properties
ADD CONSTRAINT check_category 
CHECK (category IN ('residential', 'commercial'));

ALTER TABLE properties
ADD CONSTRAINT check_property_type
CHECK (property_type IN (
  'flat_apartment', 'independent_house_villa', 'plot_land', 'pg_hostel',
  'farmhouse', 'serviced_apartment', 'other_residential',
  'office', 'shop', 'showroom', 'warehouse', 'industrial_land',
  'commercial_plot', 'commercial_farmhouse', 'coworking_space', 'other_commercial'
));

ALTER TABLE properties
ADD CONSTRAINT check_listing_type
CHECK (listing_type IN ('sale', 'rent', 'lease'));

-- Step 8: Create indexes
CREATE INDEX IF NOT EXISTS idx_properties_category ON properties(category);
CREATE INDEX IF NOT EXISTS idx_properties_category_type ON properties(category, property_type);
