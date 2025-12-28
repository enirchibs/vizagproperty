/*
  # Setup Property Videos Storage

  1. Storage
    - Create 'property-videos' bucket for video uploads
    - Set appropriate size limits (100MB for videos)
    - Allow video file types (mp4, webm, mov, avi)
  
  2. Security
    - Public access for viewing videos
    - Authenticated users can upload videos for their properties
    - Only property owners can delete their videos
*/

-- Create storage bucket for property videos
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'property-videos',
  'property-videos',
  true,
  104857600, -- 100MB limit
  ARRAY['video/mp4', 'video/webm', 'video/quicktime', 'video/x-msvideo', 'video/avi']
)
ON CONFLICT (id) DO NOTHING;

-- Drop existing policies if they exist
DO $$ 
BEGIN
  DROP POLICY IF EXISTS "Anyone can view property videos" ON storage.objects;
  DROP POLICY IF EXISTS "Authenticated users can upload property videos" ON storage.objects;
  DROP POLICY IF EXISTS "Users can update their own property videos" ON storage.objects;
  DROP POLICY IF EXISTS "Users can delete their own property videos" ON storage.objects;
EXCEPTION
  WHEN undefined_object THEN NULL;
END $$;

-- Allow anyone to view videos
CREATE POLICY "Anyone can view property videos"
  ON storage.objects FOR SELECT
  TO public
  USING (bucket_id = 'property-videos');

-- Allow authenticated users to upload videos
CREATE POLICY "Authenticated users can upload property videos"
  ON storage.objects FOR INSERT
  TO authenticated
  WITH CHECK (
    bucket_id = 'property-videos' AND
    (storage.foldername(name))[1] = auth.uid()::text
  );

-- Allow users to update their own videos
CREATE POLICY "Users can update their own property videos"
  ON storage.objects FOR UPDATE
  TO authenticated
  USING (
    bucket_id = 'property-videos' AND
    (storage.foldername(name))[1] = auth.uid()::text
  );

-- Allow users to delete their own videos
CREATE POLICY "Users can delete their own property videos"
  ON storage.objects FOR DELETE
  TO authenticated
  USING (
    bucket_id = 'property-videos' AND
    (storage.foldername(name))[1] = auth.uid()::text
  );