/*
  # Fix Admin Policy and Create Favorites Table
  
  ## Changes
  
  1. Properties Admin Policy
    - Ensure admin full access policy uses JWT email check only
    - No WITH CHECK clause needed for ALL operations
  
  2. Favorites Table
    - New table for user property favorites/shortlist
    - Columns:
      - id (uuid, primary key)
      - user_id (uuid, references auth.users)
      - property_id (uuid, references properties)
      - created_at (timestamp)
    - Unique constraint on (user_id, property_id)
  
  3. Security
    - Enable RLS on favorites table
    - Users can only access their own favorites
  
  ## Notes
  - Admin policy uses JWT email for instant auth check
  - Favorites cascade delete when user or property is deleted
*/

-- ============================================
-- FIX PROPERTIES ADMIN POLICY
-- ============================================

-- Drop existing admin policy to recreate it correctly
DROP POLICY IF EXISTS "admin full access" ON properties;

-- Create admin policy with JWT email check (no WITH CHECK needed)
CREATE POLICY "admin full access"
ON properties
FOR ALL
TO authenticated
USING (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
);

-- ============================================
-- CREATE FAVORITES TABLE
-- ============================================

-- Create favorites table
CREATE TABLE IF NOT EXISTS favorites (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  property_id uuid NOT NULL REFERENCES properties(id) ON DELETE CASCADE,
  created_at timestamptz DEFAULT now(),
  UNIQUE (user_id, property_id)
);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_favorites_user_id ON favorites(user_id);
CREATE INDEX IF NOT EXISTS idx_favorites_property_id ON favorites(property_id);
CREATE INDEX IF NOT EXISTS idx_favorites_created_at ON favorites(created_at DESC);

-- Enable RLS
ALTER TABLE favorites ENABLE ROW LEVEL SECURITY;

-- Users can manage their own favorites
CREATE POLICY "favorites own access"
ON favorites
FOR ALL
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

-- Admin can view all favorites (for analytics)
CREATE POLICY "admin view all favorites"
ON favorites
FOR SELECT
TO authenticated
USING (
  (auth.jwt() ->> 'email') = 'himaaitools@gmail.com'
);