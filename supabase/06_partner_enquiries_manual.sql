-- 06_partner_enquiries_manual.sql
-- Run this script in your Supabase SQL Editor to create the partner_enquiries table.

-- Create the table
CREATE TABLE IF NOT EXISTS public.partner_enquiries (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
  full_name text NOT NULL,
  mobile text NOT NULL,
  email text NOT NULL,
  city text NOT NULL,
  partner_type text NOT NULL,
  company_name text,
  message text
);

-- Set up Row Level Security (RLS)
ALTER TABLE public.partner_enquiries ENABLE ROW LEVEL SECURITY;

-- Allow ANYONE (including unauthenticated users) to insert new enquiries
CREATE POLICY "Allow public inserts on partner_enquiries"
  ON public.partner_enquiries FOR INSERT
  WITH CHECK (true);

-- Allow ONLY admins to view all enquiries
CREATE POLICY "Allow admins to select partner_enquiries"
  ON public.partner_enquiries FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM users
      WHERE users.id = auth.uid()
      AND users.role = 'admin'
    )
  );

-- Allow admins to delete enquiries (optional, but good for management)
CREATE POLICY "Allow admins to delete partner_enquiries"
  ON public.partner_enquiries FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM users
      WHERE users.id = auth.uid()
      AND users.role = 'admin'
    )
  );
