/*
  # Create Storage Bucket for Category Icons
  
  1. New Storage
    - Creates public storage bucket 'olon-images'
    - Stores category icon PNG files permanently
    
  2. Security
    - Public read access for all images
    - Authenticated upload access (for admin use)
    
  3. Benefits
    - Images never disappear (unlike local files)
    - CDN delivery for fast loading
    - Same images work for static site and WordPress
    - Upload once, use everywhere
*/

-- Create public storage bucket
INSERT INTO storage.buckets (id, name, public)
VALUES ('olon-images', 'olon-images', true)
ON CONFLICT (id) DO NOTHING;

-- Drop existing policies if they exist
DO $$
BEGIN
  DROP POLICY IF EXISTS "Public read access for olon images" ON storage.objects;
  DROP POLICY IF EXISTS "Authenticated upload for olon images" ON storage.objects;
  DROP POLICY IF EXISTS "Authenticated delete for olon images" ON storage.objects;
END $$;

-- Allow public read access to images
CREATE POLICY "Public read access for olon images"
ON storage.objects FOR SELECT
USING (bucket_id = 'olon-images');

-- Allow authenticated users to upload (for admin)
CREATE POLICY "Authenticated upload for olon images"
ON storage.objects FOR INSERT
WITH CHECK (
  bucket_id = 'olon-images' 
  AND auth.role() = 'authenticated'
);

-- Allow authenticated users to delete (for admin)
CREATE POLICY "Authenticated delete for olon images"
ON storage.objects FOR DELETE
USING (
  bucket_id = 'olon-images' 
  AND auth.role() = 'authenticated'
);