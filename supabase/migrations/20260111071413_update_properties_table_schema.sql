/*
  # Update Properties Table Schema

  1. Changes
    - Add category column with check constraint for 'residential', 'commercial'
    - Make title nullable
    - Make price nullable
    - Change area_sqft from integer to numeric
    - Update listing_type check constraint to include 'lease'
    - Update status check constraint to include 'draft'
    - Remove specific property_type check constraint (allow any text)
    - Keep all existing columns and data

  2. Column Details
    - id: uuid primary key with default gen_random_uuid()
    - owner_id: uuid references users(id) on delete cascade
    - category: text not null, check for 'residential'/'commercial'
    - property_type: text not null (no specific constraint)
    - listing_type: text not null, check for 'sale'/'rent'/'lease'
    - title: text (nullable)
    - description: text (nullable)
    - price: numeric (nullable)
    - area_sqft: numeric (nullable)
    - locality_id: uuid references localities(id)
    - status: text not null, check for 'draft'/'pending'/'approved'/'rejected', default 'pending'
    - created_at: timestamptz default now()
    - updated_at: timestamptz default now()

  3. Notes
    - Preserves all existing columns like bedrooms, bathrooms, amenities, etc.
    - Updates constraints to match specification
    - Maintains foreign keys and indexes
*/

-- Add category column if it doesn't exist
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'category'
  ) THEN
    ALTER TABLE properties ADD COLUMN category text;
  END IF;
END $$;

-- Make title nullable
ALTER TABLE properties ALTER COLUMN title DROP NOT NULL;

-- Make price nullable
ALTER TABLE properties ALTER COLUMN price DROP NOT NULL;

-- Change area_sqft from integer to numeric
ALTER TABLE properties ALTER COLUMN area_sqft TYPE numeric USING area_sqft::numeric;

-- Update listing_type check constraint to include 'lease'
ALTER TABLE properties DROP CONSTRAINT IF EXISTS properties_listing_type_check;
ALTER TABLE properties ADD CONSTRAINT properties_listing_type_check 
  CHECK (listing_type IN ('sale', 'rent', 'lease'));

-- Update status check constraint to include 'draft'
ALTER TABLE properties DROP CONSTRAINT IF EXISTS properties_status_check;
ALTER TABLE properties ADD CONSTRAINT properties_status_check 
  CHECK (status IN ('draft', 'pending', 'approved', 'rejected'));

-- Remove specific property_type check constraint (allow any text)
ALTER TABLE properties DROP CONSTRAINT IF EXISTS properties_property_type_check;

-- Add category check constraint
ALTER TABLE properties DROP CONSTRAINT IF EXISTS properties_category_check;
ALTER TABLE properties ADD CONSTRAINT properties_category_check 
  CHECK (category IN ('residential', 'commercial'));

-- Make category not null after adding it
-- First set a default value for existing rows
UPDATE properties SET category = 'residential' WHERE category IS NULL;
ALTER TABLE properties ALTER COLUMN category SET NOT NULL;
