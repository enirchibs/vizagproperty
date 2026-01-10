/*
  # Add Status Column to Properties Table

  ## Changes
  - Adds `status` column to `properties` table with default value 'active'
  - All existing properties will automatically receive status = 'active'
  - Adds CHECK constraint to ensure only valid status values
  - Adds performance index for status filtering

  ## Column Details
  - `status` (text) - Property listing status
    - Possible values: 'active', 'sold', 'rented', 'inactive'
    - Default: 'active'
    - NOT NULL constraint

  ## Security
  - No RLS policy changes required
  - Existing policies continue to work as expected

  ## Important Notes
  - This is a non-destructive additive change
  - No existing data is modified or deleted
  - All existing properties automatically get status = 'active' via DEFAULT
  - Frontend queries using .eq('status', 'active') will work immediately
*/

-- Add status column to properties table
ALTER TABLE properties
ADD COLUMN IF NOT EXISTS status text DEFAULT 'active' NOT NULL
CHECK (status IN ('active', 'sold', 'rented', 'inactive'));

-- Add index for status filtering (performance optimization)
CREATE INDEX IF NOT EXISTS idx_properties_status ON properties(status);
