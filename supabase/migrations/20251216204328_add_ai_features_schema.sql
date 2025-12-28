/*
  # AI Features Schema

  This migration adds comprehensive support for advanced AI features.

  ## 1. New Tables
  
  ### `property_analytics`
  - `id` (uuid, primary key)
  - `property_id` (uuid, foreign key to properties)
  - `fair_price_min` (numeric) - Minimum fair price
  - `fair_price_max` (numeric) - Maximum fair price
  - `area_average_price` (numeric) - Average price in the area
  - `appreciation_potential` (text) - Appreciation analysis
  - `negotiation_margin` (text) - Negotiation insights
  - `price_analysis` (jsonb) - Detailed price breakdown
  - `created_at` (timestamptz)
  - `updated_at` (timestamptz)

  ### `user_preferences`
  - `id` (uuid, primary key)
  - `user_id` (uuid, foreign key to auth.users)
  - `budget_min` (numeric) - Minimum budget
  - `budget_max` (numeric) - Maximum budget
  - `work_location` (text) - Work location for commute calculations
  - `preferred_areas` (text[]) - List of preferred areas
  - `property_type` (text) - Preferred property type
  - `bedrooms` (integer) - Preferred number of bedrooms
  - `preferences_data` (jsonb) - Additional preferences
  - `created_at` (timestamptz)
  - `updated_at` (timestamptz)

  ### `property_interactions`
  - `id` (uuid, primary key)
  - `user_id` (uuid, foreign key to auth.users)
  - `property_id` (uuid, foreign key to properties)
  - `interaction_type` (text) - liked, rejected, viewed, shortlisted
  - `reason` (text) - Why they liked/rejected
  - `created_at` (timestamptz)

  ### `area_insights`
  - `id` (uuid, primary key)
  - `area_name` (text) - Area name
  - `city` (text) - City name
  - `average_price` (numeric) - Average property price
  - `commute_hubs` (jsonb) - Commute data to major hubs
  - `lifestyle_score` (numeric) - Lifestyle rating
  - `appreciation_trend` (text) - Price appreciation trend
  - `insights_data` (jsonb) - Additional insights
  - `created_at` (timestamptz)
  - `updated_at` (timestamptz)

  ### `negotiation_insights`
  - `id` (uuid, primary key)
  - `property_id` (uuid, foreign key to properties)
  - `suggested_offer` (numeric) - Suggested opening offer
  - `negotiation_strategy` (text) - Strategy advice
  - `objections_to_raise` (text[]) - List of objections
  - `walk_away_price` (numeric) - Maximum recommended price
  - `market_context` (text) - Market conditions
  - `created_at` (timestamptz)
  - `updated_at` (timestamptz)

  ## 2. Security
  - Enable RLS on all new tables
  - Users can read their own preferences and interactions
  - Property analytics and area insights are publicly readable
  - Negotiation insights are readable by authenticated users
*/

-- Property Analytics Table
CREATE TABLE IF NOT EXISTS property_analytics (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id uuid REFERENCES properties(id) ON DELETE CASCADE,
  fair_price_min numeric NOT NULL,
  fair_price_max numeric NOT NULL,
  area_average_price numeric NOT NULL,
  appreciation_potential text DEFAULT '',
  negotiation_margin text DEFAULT '',
  price_analysis jsonb DEFAULT '{}',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(property_id)
);

ALTER TABLE property_analytics ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Property analytics are publicly readable"
  ON property_analytics FOR SELECT
  TO authenticated, anon
  USING (true);

CREATE POLICY "Admins can insert property analytics"
  ON property_analytics FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Admins can update property analytics"
  ON property_analytics FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- User Preferences Table
CREATE TABLE IF NOT EXISTS user_preferences (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
  budget_min numeric DEFAULT 0,
  budget_max numeric DEFAULT 0,
  work_location text DEFAULT '',
  preferred_areas text[] DEFAULT '{}',
  property_type text DEFAULT '',
  bedrooms integer DEFAULT 0,
  preferences_data jsonb DEFAULT '{}',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(user_id)
);

ALTER TABLE user_preferences ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own preferences"
  ON user_preferences FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own preferences"
  ON user_preferences FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own preferences"
  ON user_preferences FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Property Interactions Table
CREATE TABLE IF NOT EXISTS property_interactions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE CASCADE,
  property_id uuid REFERENCES properties(id) ON DELETE CASCADE,
  interaction_type text NOT NULL,
  reason text DEFAULT '',
  created_at timestamptz DEFAULT now()
);

ALTER TABLE property_interactions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own interactions"
  ON property_interactions FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own interactions"
  ON property_interactions FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own interactions"
  ON property_interactions FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Area Insights Table
CREATE TABLE IF NOT EXISTS area_insights (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  area_name text NOT NULL,
  city text NOT NULL,
  average_price numeric DEFAULT 0,
  commute_hubs jsonb DEFAULT '{}',
  lifestyle_score numeric DEFAULT 0,
  appreciation_trend text DEFAULT '',
  insights_data jsonb DEFAULT '{}',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(area_name, city)
);

ALTER TABLE area_insights ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Area insights are publicly readable"
  ON area_insights FOR SELECT
  TO authenticated, anon
  USING (true);

CREATE POLICY "Admins can insert area insights"
  ON area_insights FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Admins can update area insights"
  ON area_insights FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Negotiation Insights Table
CREATE TABLE IF NOT EXISTS negotiation_insights (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id uuid REFERENCES properties(id) ON DELETE CASCADE,
  suggested_offer numeric NOT NULL,
  negotiation_strategy text DEFAULT '',
  objections_to_raise text[] DEFAULT '{}',
  walk_away_price numeric DEFAULT 0,
  market_context text DEFAULT '',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(property_id)
);

ALTER TABLE negotiation_insights ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Negotiation insights readable by authenticated users"
  ON negotiation_insights FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Admins can insert negotiation insights"
  ON negotiation_insights FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Admins can update negotiation insights"
  ON negotiation_insights FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_property_analytics_property_id ON property_analytics(property_id);
CREATE INDEX IF NOT EXISTS idx_user_preferences_user_id ON user_preferences(user_id);
CREATE INDEX IF NOT EXISTS idx_property_interactions_user_id ON property_interactions(user_id);
CREATE INDEX IF NOT EXISTS idx_property_interactions_property_id ON property_interactions(property_id);
CREATE INDEX IF NOT EXISTS idx_area_insights_city ON area_insights(city);
CREATE INDEX IF NOT EXISTS idx_negotiation_insights_property_id ON negotiation_insights(property_id);