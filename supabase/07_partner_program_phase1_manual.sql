-- 07_partner_program_phase1_manual.sql
-- Run this script in your Supabase SQL Editor.

-- Create partner_profiles table (linked to auth.users)
CREATE TABLE IF NOT EXISTS public.partner_profiles (
  id uuid REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
  full_name text NOT NULL,
  mobile text NOT NULL,
  email text NOT NULL,
  city text NOT NULL,
  partner_type text NOT NULL,
  company_name text,
  status text DEFAULT 'pending' NOT NULL,
  membership_type text DEFAULT 'free' NOT NULL,
  last_login timestamp with time zone
);

-- Set up RLS for partner_profiles
ALTER TABLE public.partner_profiles ENABLE ROW LEVEL SECURITY;

-- Admins can do anything
CREATE POLICY "Admins can manage partner_profiles"
  ON public.partner_profiles FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM users
      WHERE users.id = auth.uid()
      AND users.role = 'admin'
    )
  );

-- Users can read their own profile
CREATE POLICY "Users can read own partner_profile"
  ON public.partner_profiles FOR SELECT
  USING (auth.uid() = id);

-- Allow authenticated users to insert their own profile during registration
CREATE POLICY "Users can insert own partner_profile"
  ON public.partner_profiles FOR INSERT
  WITH CHECK (auth.uid() = id);

-- Allow users to update their own last_login and basic profile
CREATE POLICY "Users can update own partner_profile"
  ON public.partner_profiles FOR UPDATE
  USING (auth.uid() = id);


-- Create partner_referrals table
CREATE TABLE IF NOT EXISTS public.partner_referrals (
  id uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  partner_id uuid REFERENCES public.partner_profiles(id) ON DELETE CASCADE NOT NULL,
  customer_name text NOT NULL,
  customer_mobile text NOT NULL,
  requirement_type text NOT NULL,
  preferred_location text,
  budget text,
  remarks text,
  lead_status text DEFAULT 'New' NOT NULL,
  created_at timestamp with time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Set up RLS for partner_referrals
ALTER TABLE public.partner_referrals ENABLE ROW LEVEL SECURITY;

-- Admins can do anything
CREATE POLICY "Admins can manage partner_referrals"
  ON public.partner_referrals FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM users
      WHERE users.id = auth.uid()
      AND users.role = 'admin'
    )
  );

-- Partners can see their own referrals
CREATE POLICY "Partners can view own referrals"
  ON public.partner_referrals FOR SELECT
  USING (auth.uid() = partner_id);

-- Partners can insert their own referrals
CREATE POLICY "Partners can insert own referrals"
  ON public.partner_referrals FOR INSERT
  WITH CHECK (auth.uid() = partner_id);
