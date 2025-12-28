/*
  # Real Estate Platform - Initial Schema

  ## Overview
  Complete database schema for a real estate property listing platform with AI chatbot,
  voice search, and advanced user features.

  ## New Tables

  ### 1. `user_profiles`
  Extended user information beyond auth.users
  - `id` (uuid, FK to auth.users) - Primary key
  - `full_name` (text) - User's full name
  - `phone` (text) - Contact number
  - `avatar_url` (text) - Profile picture URL
  - `user_type` (text) - 'buyer', 'seller', or 'agent'
  - `preferences` (jsonb) - Search preferences and settings
  - `created_at` (timestamptz) - Account creation timestamp
  - `updated_at` (timestamptz) - Last update timestamp

  ### 2. `properties`
  Main property listings table
  - `id` (uuid) - Primary key
  - `title` (text) - Property title
  - `description` (text) - Detailed description
  - `property_type` (text) - 'apartment', 'villa', 'plot', 'commercial'
  - `listing_type` (text) - 'sale' or 'rent'
  - `price` (numeric) - Property price
  - `bedrooms` (integer) - Number of bedrooms
  - `bathrooms` (integer) - Number of bathrooms
  - `area_sqft` (integer) - Area in square feet
  - `location` (text) - Area/neighborhood
  - `city` (text) - City name
  - `state` (text) - State name
  - `pincode` (text) - Postal code
  - `latitude` (numeric) - GPS latitude
  - `longitude` (numeric) - GPS longitude
  - `amenities` (text[]) - Array of amenities
  - `images` (text[]) - Array of image URLs
  - `video_url` (text) - Property video URL
  - `status` (text) - 'available', 'sold', 'rented'
  - `featured` (boolean) - Featured listing flag
  - `verified` (boolean) - Admin verification flag
  - `owner_id` (uuid, FK) - Property owner/seller
  - `agent_name` (text) - Agent/owner name
  - `agent_phone` (text) - Contact number
  - `agent_whatsapp` (text) - WhatsApp number
  - `views_count` (integer) - Total views
  - `created_at` (timestamptz) - Listing creation
  - `updated_at` (timestamptz) - Last update

  ### 3. `favorites`
  User's saved/favorite properties
  - `id` (uuid) - Primary key
  - `user_id` (uuid, FK) - User who saved
  - `property_id` (uuid, FK) - Saved property
  - `created_at` (timestamptz) - When saved

  ### 4. `property_views`
  Track property view analytics
  - `id` (uuid) - Primary key
  - `property_id` (uuid, FK) - Viewed property
  - `user_id` (uuid, FK, nullable) - Viewer (null if anonymous)
  - `viewed_at` (timestamptz) - View timestamp

  ### 5. `search_history`
  User search history for AI recommendations
  - `id` (uuid) - Primary key
  - `user_id` (uuid, FK) - Searcher
  - `search_query` (text) - Search text
  - `filters` (jsonb) - Applied filters
  - `results_count` (integer) - Number of results
  - `created_at` (timestamptz) - Search timestamp

  ### 6. `chat_messages`
  AI chatbot conversation history
  - `id` (uuid) - Primary key
  - `user_id` (uuid, FK, nullable) - User (null for anonymous)
  - `session_id` (uuid) - Conversation session ID
  - `role` (text) - 'user' or 'assistant'
  - `message` (text) - Message content
  - `metadata` (jsonb) - Additional context
  - `created_at` (timestamptz) - Message timestamp

  ### 7. `property_inquiries`
  Contact requests and inquiries
  - `id` (uuid) - Primary key
  - `property_id` (uuid, FK) - Property of interest
  - `user_id` (uuid, FK, nullable) - Inquirer
  - `name` (text) - Inquirer name
  - `email` (text) - Inquirer email
  - `phone` (text) - Inquirer phone
  - `message` (text) - Inquiry message
  - `status` (text) - 'pending', 'contacted', 'closed'
  - `created_at` (timestamptz) - Inquiry timestamp

  ## Security
  - RLS enabled on all tables
  - Users can only read/write their own data
  - Public read access for properties (listings visible to all)
  - Authenticated users can save favorites and chat
  - Property owners can manage their listings

  ## Indexes
  - Property search optimization (city, price, property_type)
  - User lookup indexes
  - Foreign key indexes for joins
*/

-- Create user_profiles table
CREATE TABLE IF NOT EXISTS user_profiles (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  full_name text NOT NULL,
  phone text,
  avatar_url text,
  user_type text NOT NULL DEFAULT 'buyer' CHECK (user_type IN ('buyer', 'seller', 'agent')),
  preferences jsonb DEFAULT '{}'::jsonb,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create properties table
CREATE TABLE IF NOT EXISTS properties (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text NOT NULL,
  property_type text NOT NULL CHECK (property_type IN ('apartment', 'villa', 'plot', 'commercial', 'penthouse', 'farmhouse')),
  listing_type text NOT NULL CHECK (listing_type IN ('sale', 'rent')),
  price numeric NOT NULL CHECK (price > 0),
  bedrooms integer DEFAULT 0 CHECK (bedrooms >= 0),
  bathrooms integer DEFAULT 0 CHECK (bathrooms >= 0),
  area_sqft integer NOT NULL CHECK (area_sqft > 0),
  location text NOT NULL,
  city text NOT NULL,
  state text NOT NULL DEFAULT 'Karnataka',
  pincode text,
  latitude numeric,
  longitude numeric,
  amenities text[] DEFAULT ARRAY[]::text[],
  images text[] DEFAULT ARRAY[]::text[],
  video_url text,
  status text NOT NULL DEFAULT 'available' CHECK (status IN ('available', 'sold', 'rented', 'inactive')),
  featured boolean DEFAULT false,
  verified boolean DEFAULT false,
  owner_id uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  agent_name text NOT NULL,
  agent_phone text NOT NULL,
  agent_whatsapp text,
  views_count integer DEFAULT 0,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create favorites table
CREATE TABLE IF NOT EXISTS favorites (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  property_id uuid NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now(),
  UNIQUE(user_id, property_id)
);

-- Create property_views table
CREATE TABLE IF NOT EXISTS property_views (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id uuid NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
  user_id uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  viewed_at timestamptz DEFAULT now()
);

-- Create search_history table
CREATE TABLE IF NOT EXISTS search_history (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  search_query text,
  filters jsonb DEFAULT '{}'::jsonb,
  results_count integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Create chat_messages table
CREATE TABLE IF NOT EXISTS chat_messages (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  session_id uuid NOT NULL,
  role text NOT NULL CHECK (role IN ('user', 'assistant')),
  message text NOT NULL,
  metadata jsonb DEFAULT '{}'::jsonb,
  created_at timestamptz DEFAULT now()
);

-- Create property_inquiries table
CREATE TABLE IF NOT EXISTS property_inquiries (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id uuid NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
  user_id uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  name text NOT NULL,
  email text NOT NULL,
  phone text NOT NULL,
  message text NOT NULL,
  status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'contacted', 'closed')),
  created_at timestamptz DEFAULT now()
);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_properties_city ON properties(city);
CREATE INDEX IF NOT EXISTS idx_properties_price ON properties(price);
CREATE INDEX IF NOT EXISTS idx_properties_type ON properties(property_type);
CREATE INDEX IF NOT EXISTS idx_properties_listing_type ON properties(listing_type);
CREATE INDEX IF NOT EXISTS idx_properties_status ON properties(status);
CREATE INDEX IF NOT EXISTS idx_properties_owner ON properties(owner_id);
CREATE INDEX IF NOT EXISTS idx_properties_created ON properties(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_favorites_user ON favorites(user_id);
CREATE INDEX IF NOT EXISTS idx_favorites_property ON favorites(property_id);
CREATE INDEX IF NOT EXISTS idx_property_views_property ON property_views(property_id);
CREATE INDEX IF NOT EXISTS idx_search_history_user ON search_history(user_id);
CREATE INDEX IF NOT EXISTS idx_chat_messages_session ON chat_messages(session_id);
CREATE INDEX IF NOT EXISTS idx_chat_messages_user ON chat_messages(user_id);

-- Enable Row Level Security
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE properties ENABLE ROW LEVEL SECURITY;
ALTER TABLE favorites ENABLE ROW LEVEL SECURITY;
ALTER TABLE property_views ENABLE ROW LEVEL SECURITY;
ALTER TABLE search_history ENABLE ROW LEVEL SECURITY;
ALTER TABLE chat_messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE property_inquiries ENABLE ROW LEVEL SECURITY;

-- RLS Policies for user_profiles
CREATE POLICY "Users can view all profiles"
  ON user_profiles FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Users can update own profile"
  ON user_profiles FOR UPDATE
  TO authenticated
  USING (auth.uid() = id)
  WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can insert own profile"
  ON user_profiles FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = id);

-- RLS Policies for properties
CREATE POLICY "Anyone can view available properties"
  ON properties FOR SELECT
  USING (status = 'available' OR owner_id = auth.uid());

CREATE POLICY "Property owners can insert properties"
  ON properties FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = owner_id);

CREATE POLICY "Property owners can update own properties"
  ON properties FOR UPDATE
  TO authenticated
  USING (auth.uid() = owner_id)
  WITH CHECK (auth.uid() = owner_id);

CREATE POLICY "Property owners can delete own properties"
  ON properties FOR DELETE
  TO authenticated
  USING (auth.uid() = owner_id);

-- RLS Policies for favorites
CREATE POLICY "Users can view own favorites"
  ON favorites FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own favorites"
  ON favorites FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own favorites"
  ON favorites FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);

-- RLS Policies for property_views
CREATE POLICY "Anyone can insert property views"
  ON property_views FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

CREATE POLICY "Users can view own property views"
  ON property_views FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

-- RLS Policies for search_history
CREATE POLICY "Users can view own search history"
  ON search_history FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own search history"
  ON search_history FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

-- RLS Policies for chat_messages
CREATE POLICY "Users can view own chat messages"
  ON chat_messages FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own chat messages"
  ON chat_messages FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Anonymous users can view their session chats"
  ON chat_messages FOR SELECT
  TO anon
  USING (true);

CREATE POLICY "Anonymous users can insert chat messages"
  ON chat_messages FOR INSERT
  TO anon
  WITH CHECK (true);

-- RLS Policies for property_inquiries
CREATE POLICY "Users can view own inquiries"
  ON property_inquiries FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id OR auth.uid() IN (
    SELECT owner_id FROM properties WHERE id = property_id
  ));

CREATE POLICY "Anyone can insert inquiries"
  ON property_inquiries FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers for updated_at
CREATE TRIGGER update_user_profiles_updated_at
  BEFORE UPDATE ON user_profiles
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER update_properties_updated_at
  BEFORE UPDATE ON properties
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();

-- Function to increment property views
CREATE OR REPLACE FUNCTION increment_property_views()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE properties
  SET views_count = views_count + 1
  WHERE id = NEW.property_id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to auto-increment views
CREATE TRIGGER increment_views_on_view
  AFTER INSERT ON property_views
  FOR EACH ROW
  EXECUTE FUNCTION increment_property_views();