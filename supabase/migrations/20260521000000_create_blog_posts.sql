-- Create blog_posts table
CREATE TABLE IF NOT EXISTS public.blog_posts (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  title text NOT NULL,
  slug text NOT NULL UNIQUE,
  excerpt text NOT NULL,
  content text NOT NULL,
  category text NOT NULL,
  tags text[] DEFAULT '{}'::text[],
  meta_title text NOT NULL,
  meta_description text NOT NULL,
  og_image text,
  author_name text NOT NULL DEFAULT 'VizagProperty AI',
  published boolean NOT NULL DEFAULT true,
  featured boolean NOT NULL DEFAULT false,
  reading_time_min integer NOT NULL DEFAULT 5,
  published_at timestamptz NOT NULL DEFAULT now(),
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

-- Enable RLS
ALTER TABLE public.blog_posts ENABLE ROW LEVEL SECURITY;

-- Allow public read access for published blogs
CREATE POLICY "Allow public read access for published blogs" ON public.blog_posts
  FOR SELECT USING (published = true);

-- Allow authenticated users with admin role to manage blogs
CREATE POLICY "Allow admins to manage blogs" ON public.blog_posts
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM user_profiles
      WHERE id = auth.uid() AND role = 'admin'
    )
  );

-- Create trigger for updated_at
CREATE OR REPLACE FUNCTION update_blog_posts_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_blog_posts_updated_at_trigger
BEFORE UPDATE ON public.blog_posts
FOR EACH ROW
EXECUTE FUNCTION update_blog_posts_updated_at();

-- Note: The pg_cron job to run the edge function daily needs the pg_net extension to make HTTP requests
CREATE EXTENSION IF NOT EXISTS pg_net;

-- Create the pg_cron schedule to call the edge function daily at midnight
-- Assuming edge function URL will be deployed, this cron will make the request
-- Make sure to replace project URL and ANON KEY if setting this up manually or pass them as headers

SELECT cron.schedule(
  'auto-blog-daily',
  '0 0 * * *', -- Runs every day at midnight (00:00)
  $$
    SELECT net.http_post(
      url:='https://[PROJECT_REF].supabase.co/functions/v1/auto-blog',
      headers:='{"Content-Type": "application/json", "Authorization": "Bearer [ANON_KEY]"}'::jsonb,
      body:='{}'::jsonb
    )
  $$
);
