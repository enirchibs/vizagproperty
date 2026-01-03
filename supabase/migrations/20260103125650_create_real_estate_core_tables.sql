/*
  # Real Estate Portal Core Schema - Vizag Focus

  ## Overview
  This migration creates the core database schema for a real estate portal focused on Vizag,
  with support for property listings, user management, locality tracking, and lead generation.

  ## New Tables Created

  ### 1. users
  Extended user profile table that references Supabase auth.users
  - `id` (uuid, primary key) - References auth.users(id)
  - `role` (text) - User role: 'buyer', 'owner', or 'agent'
  - `name` (text) - Full name of the user
  - `phone` (text) - Contact phone number
  - `email` (text) - Email address
  - `created_at` (timestamptz) - Account creation timestamp

  ### 2. localities
  Geographic locations within Vizag for property categorization
  - `id` (uuid, primary key) - Unique locality identifier
  - `name` (text) - Locality name (e.g., "Madhurawada", "MVP Colony")
  - `slug` (text, unique) - URL-friendly version of name
  - `city` (text) - City name, defaults to 'Vizag'
  - `latitude` (decimal) - Geographic latitude coordinate
  - `longitude` (decimal) - Geographic longitude coordinate
  - `created_at` (timestamptz) - Record creation timestamp

  ### 3. properties
  Property listings for sale or rent
  - `id` (uuid, primary key) - Unique property identifier
  - `title` (text) - Property listing title
  - `property_type` (text) - Type: 'plot', 'flat', 'villa', 'rental', 'pg'
  - `listing_type` (text) - 'sale' or 'rent'
  - `price` (decimal) - Property price/rent amount
  - `locality_id` (uuid) - Foreign key to localities table
  - `owner_id` (uuid) - Foreign key to users table
  - `is_vmrda_approved` (boolean) - VMRDA approval status
  - `created_at` (timestamptz) - Listing creation timestamp

  ### 4. leads
  Lead tracking for property inquiries
  - `id` (uuid, primary key) - Unique lead identifier
  - `property_id` (uuid) - Foreign key to properties table
  - `user_id` (uuid) - Foreign key to users table (inquirer)
  - `source` (text) - Lead source: 'website' or 'whatsapp'
  - `created_at` (timestamptz) - Lead creation timestamp

  ## Security (Row Level Security)

  All tables have RLS enabled with the following policies:

  ### users table:
  - Authenticated users can read their own profile
  - Authenticated users can update their own profile
  - New users can insert their own profile on signup

  ### localities table:
  - Public read access (anyone can view localities)
  - Only authenticated users can suggest new localities

  ### properties table:
  - Public read access (anyone can browse properties)
  - Property owners can insert their own listings
  - Property owners can update their own listings
  - Property owners can delete their own listings

  ### leads table:
  - Authenticated users can create leads
  - Users can view their own leads
  - Property owners can view leads for their properties

  ## Indexes

  Performance indexes added for:
  - User role lookup
  - Locality slug lookup
  - Property type and listing type filtering
  - Property locality search
  - Lead tracking by property and user

  ## Important Notes

  1. The users table extends Supabase auth.users with a profile table
  2. All timestamps use timestamptz for proper timezone handling
  3. Foreign key constraints ensure data integrity
  4. RLS policies are restrictive by default and only allow necessary access
  5. Public tables (localities, properties) allow anonymous reads for SEO and discovery
*/

-- Create users profile table
CREATE TABLE IF NOT EXISTS users (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  role text NOT NULL CHECK (role IN ('buyer', 'owner', 'agent')),
  name text NOT NULL,
  phone text,
  email text,
  created_at timestamptz DEFAULT now() NOT NULL
);

-- Create localities table
CREATE TABLE IF NOT EXISTS localities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text UNIQUE NOT NULL,
  city text DEFAULT 'Vizag' NOT NULL,
  latitude decimal(10, 8),
  longitude decimal(11, 8),
  created_at timestamptz DEFAULT now() NOT NULL
);

-- Create properties table
CREATE TABLE IF NOT EXISTS properties (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  property_type text NOT NULL CHECK (property_type IN ('plot', 'flat', 'villa', 'rental', 'pg')),
  listing_type text NOT NULL CHECK (listing_type IN ('sale', 'rent')),
  price decimal(12, 2) NOT NULL CHECK (price >= 0),
  locality_id uuid REFERENCES localities(id) ON DELETE SET NULL,
  owner_id uuid REFERENCES users(id) ON DELETE CASCADE NOT NULL,
  is_vmrda_approved boolean DEFAULT false NOT NULL,
  created_at timestamptz DEFAULT now() NOT NULL
);

-- Create leads table
CREATE TABLE IF NOT EXISTS leads (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id uuid REFERENCES properties(id) ON DELETE CASCADE NOT NULL,
  user_id uuid REFERENCES users(id) ON DELETE CASCADE NOT NULL,
  source text NOT NULL CHECK (source IN ('website', 'whatsapp')),
  created_at timestamptz DEFAULT now() NOT NULL
);

-- Enable Row Level Security on all tables
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE localities ENABLE ROW LEVEL SECURITY;
ALTER TABLE properties ENABLE ROW LEVEL SECURITY;
ALTER TABLE leads ENABLE ROW LEVEL SECURITY;

-- RLS Policies for users table
CREATE POLICY "Users can read own profile"
  ON users FOR SELECT
  TO authenticated
  USING (auth.uid() = id);

CREATE POLICY "Users can update own profile"
  ON users FOR UPDATE
  TO authenticated
  USING (auth.uid() = id)
  WITH CHECK (auth.uid() = id);

CREATE POLICY "Users can insert own profile"
  ON users FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = id);

-- RLS Policies for localities table
CREATE POLICY "Anyone can view localities"
  ON localities FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Authenticated users can suggest localities"
  ON localities FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- RLS Policies for properties table
CREATE POLICY "Anyone can view properties"
  ON properties FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Owners can insert their properties"
  ON properties FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = owner_id);

CREATE POLICY "Owners can update their properties"
  ON properties FOR UPDATE
  TO authenticated
  USING (auth.uid() = owner_id)
  WITH CHECK (auth.uid() = owner_id);

CREATE POLICY "Owners can delete their properties"
  ON properties FOR DELETE
  TO authenticated
  USING (auth.uid() = owner_id);

-- RLS Policies for leads table
CREATE POLICY "Authenticated users can create leads"
  ON leads FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can view their own leads"
  ON leads FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Property owners can view leads for their properties"
  ON leads FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = leads.property_id
      AND properties.owner_id = auth.uid()
    )
  );

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_localities_slug ON localities(slug);
CREATE INDEX IF NOT EXISTS idx_localities_city ON localities(city);
CREATE INDEX IF NOT EXISTS idx_properties_type ON properties(property_type);
CREATE INDEX IF NOT EXISTS idx_properties_listing_type ON properties(listing_type);
CREATE INDEX IF NOT EXISTS idx_properties_locality ON properties(locality_id);
CREATE INDEX IF NOT EXISTS idx_properties_owner ON properties(owner_id);
CREATE INDEX IF NOT EXISTS idx_properties_created ON properties(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_leads_property ON leads(property_id);
CREATE INDEX IF NOT EXISTS idx_leads_user ON leads(user_id);
CREATE INDEX IF NOT EXISTS idx_leads_created ON leads(created_at DESC);
