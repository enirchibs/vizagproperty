-- Create the seo_keywords table
CREATE TABLE IF NOT EXISTS seo_keywords (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  keyword text UNIQUE NOT NULL,
  target_url text NOT NULL,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Enable Row Level Security
ALTER TABLE seo_keywords ENABLE ROW LEVEL SECURITY;

-- Allow public read access (necessary for the frontend hook)
CREATE POLICY "Allow public read access on seo_keywords"
  ON seo_keywords FOR SELECT
  USING (true);

-- Insert the initial hardcoded taxonomy
INSERT INTO seo_keywords (keyword, target_url)
VALUES
  ('plots for sale in vizag', '/plots'),
  ('plots for sale in bhogapuram vizag', '/plots/bhogapuram'),
  ('plots for sale in bhogapuram', '/plots/bhogapuram'),
  ('vuda approved plots in vizag', '/plots/vuda-approved'),
  ('vuda & vmrda approved plots', '/plots/vuda-approved'),
  ('gated community plots for sale in vizag', '/plots/gated-community'),
  ('open land in visakhapatnam', '/plots'),
  ('residential plots for sale in vizag', '/plots'),
  ('villas for sale in madhurawada', '/residential/villas/madhurawada'),
  ('plots in anandapuram vizag', '/plots/anandapuram'),
  ('new apartments in visakhapatnam', '/residential/flats'),
  ('luxury villas for sale in vizag', '/residential/villas'),
  ('shops for rent in vizag', '/commercial/shops-for-rent'),
  ('plots in tarluvada visakhapatnam', '/plots/tarluvada')
ON CONFLICT (keyword) DO UPDATE
SET target_url = EXCLUDED.target_url;
