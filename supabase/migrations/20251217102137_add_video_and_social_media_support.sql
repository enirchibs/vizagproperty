/*
  # Add Video and Social Media Support

  1. New Tables
    - `property_videos`
      - `id` (uuid, primary key)
      - `property_id` (uuid, foreign key to properties)
      - `video_url` (text) - Supabase storage URL for uploaded videos
      - `thumbnail_url` (text, optional) - Thumbnail image
      - `duration` (integer, optional) - Video duration in seconds
      - `created_at` (timestamptz)
      
    - `property_social_links`
      - `id` (uuid, primary key)
      - `property_id` (uuid, foreign key to properties)
      - `platform` (text) - 'youtube' or 'instagram'
      - `link_url` (text) - Full URL to the video
      - `embed_code` (text, optional) - Extracted embed ID/code
      - `created_at` (timestamptz)

  2. Security
    - Enable RLS on both tables
    - Users can view links for any property
    - Only property owners can add/delete their property's videos and links
    - Authenticated users can add videos/links to their own properties
*/

-- Create property_videos table
CREATE TABLE IF NOT EXISTS property_videos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id uuid NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
  video_url text NOT NULL,
  thumbnail_url text,
  duration integer,
  created_at timestamptz DEFAULT now()
);

-- Create property_social_links table
CREATE TABLE IF NOT EXISTS property_social_links (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id uuid NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
  platform text NOT NULL CHECK (platform IN ('youtube', 'instagram')),
  link_url text NOT NULL,
  embed_code text,
  created_at timestamptz DEFAULT now()
);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_property_videos_property_id ON property_videos(property_id);
CREATE INDEX IF NOT EXISTS idx_property_social_links_property_id ON property_social_links(property_id);

-- Enable RLS
ALTER TABLE property_videos ENABLE ROW LEVEL SECURITY;
ALTER TABLE property_social_links ENABLE ROW LEVEL SECURITY;

-- RLS Policies for property_videos
CREATE POLICY "Anyone can view property videos"
  ON property_videos FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Property owners can insert videos"
  ON property_videos FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_videos.property_id
      AND properties.owner_id = auth.uid()
    )
  );

CREATE POLICY "Property owners can delete their videos"
  ON property_videos FOR DELETE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_videos.property_id
      AND properties.owner_id = auth.uid()
    )
  );

-- RLS Policies for property_social_links
CREATE POLICY "Anyone can view property social links"
  ON property_social_links FOR SELECT
  TO authenticated
  USING (true);

CREATE POLICY "Property owners can insert social links"
  ON property_social_links FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_social_links.property_id
      AND properties.owner_id = auth.uid()
    )
  );

CREATE POLICY "Property owners can delete their social links"
  ON property_social_links FOR DELETE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_social_links.property_id
      AND properties.owner_id = auth.uid()
    )
  );