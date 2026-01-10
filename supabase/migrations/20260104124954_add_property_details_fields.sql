/*
  # Add Property Details Fields

  ## Overview
  This migration adds comprehensive property details fields to the properties table
  to support the full property listing form functionality.

  ## Fields Added
  
  ### Property Description
  - `description` (text) - Detailed property description
  
  ### Property Dimensions
  - `bedrooms` (integer) - Number of bedrooms
  - `bathrooms` (integer) - Number of bathrooms
  - `area_sqft` (integer) - Property area in square feet
  
  ### Location Details
  - `state` (text) - State/Province name
  - `pincode` (text) - Postal/ZIP code
  
  ### Property Features
  - `amenities` (text array) - List of available amenities
  
  ### Agent Contact Information
  - `agent_name` (text) - Property agent name
  - `agent_phone` (text) - Agent contact phone
  - `agent_whatsapp` (text) - Agent WhatsApp number
  
  ### Media
  - `images` (text array) - Array of image URLs
  
  ## Notes
  - All new fields are nullable to support existing records
  - Arrays default to empty arrays for new records
  - Text fields have reasonable length limits where applicable
*/

DO $$
BEGIN
  -- Add description field
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'description'
  ) THEN
    ALTER TABLE properties ADD COLUMN description text;
  END IF;

  -- Add bedroom and bathroom counts
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'bedrooms'
  ) THEN
    ALTER TABLE properties ADD COLUMN bedrooms integer;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'bathrooms'
  ) THEN
    ALTER TABLE properties ADD COLUMN bathrooms integer;
  END IF;

  -- Add area in square feet
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'area_sqft'
  ) THEN
    ALTER TABLE properties ADD COLUMN area_sqft integer;
  END IF;

  -- Add location details
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'state'
  ) THEN
    ALTER TABLE properties ADD COLUMN state text DEFAULT 'Andhra Pradesh';
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'pincode'
  ) THEN
    ALTER TABLE properties ADD COLUMN pincode text;
  END IF;

  -- Add amenities array
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'amenities'
  ) THEN
    ALTER TABLE properties ADD COLUMN amenities text[] DEFAULT '{}';
  END IF;

  -- Add agent contact information
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'agent_name'
  ) THEN
    ALTER TABLE properties ADD COLUMN agent_name text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'agent_phone'
  ) THEN
    ALTER TABLE properties ADD COLUMN agent_phone text;
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'agent_whatsapp'
  ) THEN
    ALTER TABLE properties ADD COLUMN agent_whatsapp text;
  END IF;

  -- Add images array
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'properties' AND column_name = 'images'
  ) THEN
    ALTER TABLE properties ADD COLUMN images text[] DEFAULT '{}';
  END IF;
END $$;

-- Create indexes for commonly queried fields
CREATE INDEX IF NOT EXISTS idx_properties_bedrooms ON properties(bedrooms);
CREATE INDEX IF NOT EXISTS idx_properties_price ON properties(price);
CREATE INDEX IF NOT EXISTS idx_properties_area ON properties(area_sqft);