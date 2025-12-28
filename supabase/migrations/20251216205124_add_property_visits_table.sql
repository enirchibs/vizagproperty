/*
  # Add Property Visits Table

  ## 1. New Tables
  
  ### `property_visits`
  - `id` (uuid, primary key)
  - `user_id` (uuid, foreign key to auth.users)
  - `property_id` (uuid, foreign key to properties)
  - `visit_date` (date) - Scheduled visit date
  - `visit_time` (text) - Scheduled visit time
  - `status` (text) - scheduled, completed, cancelled
  - `notes` (text) - Visit notes
  - `created_at` (timestamptz)
  - `updated_at` (timestamptz)

  ## 2. Security
  - Enable RLS on property_visits table
  - Users can only view and manage their own visit schedules
  - Property owners can see visits scheduled for their properties
*/

CREATE TABLE IF NOT EXISTS property_visits (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
  property_id uuid REFERENCES properties(id) ON DELETE CASCADE,
  visit_date date,
  visit_time text DEFAULT '',
  status text DEFAULT 'scheduled',
  notes text DEFAULT '',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(user_id, property_id)
);

ALTER TABLE property_visits ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own visits"
  ON property_visits FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own visits"
  ON property_visits FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own visits"
  ON property_visits FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own visits"
  ON property_visits FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);

CREATE INDEX IF NOT EXISTS idx_property_visits_user_id ON property_visits(user_id);
CREATE INDEX IF NOT EXISTS idx_property_visits_property_id ON property_visits(property_id);
CREATE INDEX IF NOT EXISTS idx_property_visits_visit_date ON property_visits(visit_date);