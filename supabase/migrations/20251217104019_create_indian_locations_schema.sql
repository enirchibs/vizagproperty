/*
  # Create Indian Geographic Locations Schema

  1. New Tables
    - `indian_states`
      - `id` (uuid, primary key)
      - `name` (text) - State name
      - `code` (text) - State code (e.g., KA, MH)
      - `created_at` (timestamptz)
    
    - `indian_cities`
      - `id` (uuid, primary key)
      - `state_id` (uuid, foreign key to indian_states)
      - `name` (text) - City name
      - `is_major` (boolean) - Whether it's a major city
      - `created_at` (timestamptz)
    
    - `indian_localities`
      - `id` (uuid, primary key)
      - `city_id` (uuid, foreign key to indian_cities)
      - `name` (text) - Locality name
      - `pincode` (text, optional)
      - `created_at` (timestamptz)

  2. Indexes
    - Add indexes on name fields for faster search
    - Add index on state_id and city_id for joins

  3. Security
    - Enable RLS on all tables
    - Allow all authenticated users to read location data
    - Only admins can modify (for now, allow authenticated users to read only)
*/

-- Create indian_states table
CREATE TABLE IF NOT EXISTS indian_states (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL UNIQUE,
  code text NOT NULL UNIQUE,
  created_at timestamptz DEFAULT now()
);

-- Create indian_cities table
CREATE TABLE IF NOT EXISTS indian_cities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  state_id uuid NOT NULL REFERENCES indian_states(id) ON DELETE CASCADE,
  name text NOT NULL,
  is_major boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  UNIQUE(state_id, name)
);

-- Create indian_localities table
CREATE TABLE IF NOT EXISTS indian_localities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  city_id uuid NOT NULL REFERENCES indian_cities(id) ON DELETE CASCADE,
  name text NOT NULL,
  pincode text,
  created_at timestamptz DEFAULT now(),
  UNIQUE(city_id, name)
);

-- Create indexes for better search performance
CREATE INDEX IF NOT EXISTS idx_states_name ON indian_states(name);
CREATE INDEX IF NOT EXISTS idx_cities_state_id ON indian_cities(state_id);
CREATE INDEX IF NOT EXISTS idx_cities_name ON indian_cities(name);
CREATE INDEX IF NOT EXISTS idx_localities_city_id ON indian_localities(city_id);
CREATE INDEX IF NOT EXISTS idx_localities_name ON indian_localities(name);

-- Enable RLS
ALTER TABLE indian_states ENABLE ROW LEVEL SECURITY;
ALTER TABLE indian_cities ENABLE ROW LEVEL SECURITY;
ALTER TABLE indian_localities ENABLE ROW LEVEL SECURITY;

-- RLS Policies - Allow all authenticated users to read
CREATE POLICY "Anyone can view states"
  ON indian_states FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Anyone can view cities"
  ON indian_cities FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Anyone can view localities"
  ON indian_localities FOR SELECT
  TO authenticated
  USING (true);