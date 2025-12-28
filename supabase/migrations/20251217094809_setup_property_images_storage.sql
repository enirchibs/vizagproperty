/*
  # Setup Property Images Storage

  ## 1. Create Storage Bucket
  
  Creates a public storage bucket for property images:
  - `property-images` bucket - Public bucket for property photos
  - Allows authenticated users to upload images
  - Public read access for all users
  
  ## 2. Storage Policies
  
  - Anyone can view/download images (public access)
  - Authenticated users can upload images
  - Users can update/delete their own uploads
  
  ## Security Notes
  - Images are publicly accessible (required for property listings)
  - File uploads restricted to authenticated users only
  - Max file size enforced by client-side validation
*/

-- Create storage bucket for property images
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'property-images',
  'property-images',
  true,
  10485760,
  ARRAY['image/jpeg', 'image/jpg', 'image/png', 'image/webp']
)
ON CONFLICT (id) DO NOTHING;

-- Allow public access to view images
CREATE POLICY "Public Access"
ON storage.objects FOR SELECT
USING (bucket_id = 'property-images');

-- Allow authenticated users to upload images
CREATE POLICY "Authenticated users can upload images"
ON storage.objects FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'property-images');

-- Allow users to update their own images
CREATE POLICY "Users can update own images"
ON storage.objects FOR UPDATE
TO authenticated
USING (bucket_id = 'property-images' AND (select auth.uid()) = owner)
WITH CHECK (bucket_id = 'property-images');

-- Allow users to delete their own images
CREATE POLICY "Users can delete own images"
ON storage.objects FOR DELETE
TO authenticated
USING (bucket_id = 'property-images' AND (select auth.uid()) = owner);
