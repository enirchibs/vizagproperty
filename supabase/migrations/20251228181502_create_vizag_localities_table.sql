/*
  # Create Vizag Localities Table

  1. New Tables
    - `vizag_localities`
      - `id` (uuid, primary key) - Unique identifier
      - `locality_name` (text) - Full name of the locality
      - `locality_slug` (text, unique) - URL-friendly identifier
      - `city` (text) - City name (defaults to 'Vizag')
      - `latitude` (numeric) - Geographic latitude coordinate
      - `longitude` (numeric) - Geographic longitude coordinate
      - `is_active` (boolean) - Whether locality is active (defaults to true)
      - `created_at` (timestamp) - Creation timestamp

  2. Security
    - Enable RLS on `vizag_localities` table
    - Add policy for public read access (locality data is public reference data)
    - Add policy for authenticated users to insert/update localities

  3. Indexes
    - Index on locality_slug for fast lookups
    - Index on is_active for filtering active localities
*/

CREATE TABLE IF NOT EXISTS vizag_localities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  locality_name text NOT NULL,
  locality_slug text NOT NULL UNIQUE,
  city text NOT NULL DEFAULT 'Vizag',
  latitude numeric NOT NULL,
  longitude numeric NOT NULL,
  is_active boolean DEFAULT true,
  created_at timestamp DEFAULT now()
);

-- Enable RLS
ALTER TABLE vizag_localities ENABLE ROW LEVEL SECURITY;

-- Public can view all active localities
CREATE POLICY "Anyone can view active localities"
  ON vizag_localities
  FOR SELECT
  USING (is_active = true);

-- Authenticated users can view all localities (including inactive)
CREATE POLICY "Authenticated users can view all localities"
  ON vizag_localities
  FOR SELECT
  TO authenticated
  USING (true);

-- Authenticated users can insert localities
CREATE POLICY "Authenticated users can insert localities"
  ON vizag_localities
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Authenticated users can update localities
CREATE POLICY "Authenticated users can update localities"
  ON vizag_localities
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_vizag_localities_slug ON vizag_localities(locality_slug);
CREATE INDEX IF NOT EXISTS idx_vizag_localities_active ON vizag_localities(is_active);
CREATE INDEX IF NOT EXISTS idx_vizag_localities_city ON vizag_localities(city);
