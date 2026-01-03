/*
  # Fix Security and Performance Issues

  1. Performance Improvements
    - Add missing index on properties.locality_id foreign key
    - Optimize RLS policies to use (select auth.uid()) pattern
    - This prevents re-evaluation of auth functions for each row

  2. Security Fixes
    - Remove SECURITY DEFINER from properties_with_locality view
    - Fix function search_path for upgrade_user_role
    - Set stable search path to prevent SQL injection

  3. Changes Made
    - Index: idx_properties_locality_fk on properties(locality_id)
    - Updated all RLS policies using auth.uid() to use (select auth.uid())
    - Recreated properties_with_locality view without SECURITY DEFINER
    - Updated upgrade_user_role function with stable search_path
*/

-- Add missing index on foreign key (in addition to the existing idx_properties_locality)
CREATE INDEX IF NOT EXISTS idx_properties_locality_fk ON properties(locality_id);

-- Drop and recreate properties_with_locality view without SECURITY DEFINER
DROP VIEW IF EXISTS properties_with_locality;

CREATE VIEW properties_with_locality AS
SELECT
  p.*,
  l.locality_name,
  l.latitude as locality_latitude,
  l.longitude as locality_longitude
FROM properties p
LEFT JOIN vizag_localities l ON p.locality_id = l.id;

-- Grant access to the view
GRANT SELECT ON properties_with_locality TO authenticated, anon;

-- Fix upgrade_user_role function with stable search_path
CREATE OR REPLACE FUNCTION upgrade_user_role(user_id uuid, new_role text)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  UPDATE user_profiles
  SET role = CASE
    WHEN role = 'buyer' AND new_role = 'owner' THEN 'both'
    WHEN role = 'owner' AND new_role = 'buyer' THEN 'both'
    WHEN role = 'both' THEN 'both'
    ELSE new_role
  END
  WHERE id = user_id;
END;
$$;

-- Optimize RLS policies by caching auth.uid() result
-- This prevents re-evaluation for each row

-- Drop existing policies that need optimization
DROP POLICY IF EXISTS "Users can update own profile" ON user_profiles;
DROP POLICY IF EXISTS "Users can insert own profile" ON user_profiles;
DROP POLICY IF EXISTS "Anyone can view available properties" ON properties;
DROP POLICY IF EXISTS "Property owners can insert properties" ON properties;
DROP POLICY IF EXISTS "Property owners can update own properties" ON properties;
DROP POLICY IF EXISTS "Property owners can delete own properties" ON properties;
DROP POLICY IF EXISTS "Users can view own favorites" ON favorites;
DROP POLICY IF EXISTS "Users can insert own favorites" ON favorites;
DROP POLICY IF EXISTS "Users can delete own favorites" ON favorites;
DROP POLICY IF EXISTS "Users can view own property views" ON property_views;
DROP POLICY IF EXISTS "Users can view own search history" ON search_history;
DROP POLICY IF EXISTS "Users can insert own search history" ON search_history;
DROP POLICY IF EXISTS "Users can view own chat messages" ON chat_messages;
DROP POLICY IF EXISTS "Users can insert own chat messages" ON chat_messages;
DROP POLICY IF EXISTS "Users can view own preferences" ON user_preferences;
DROP POLICY IF EXISTS "Users can insert own preferences" ON user_preferences;
DROP POLICY IF EXISTS "Users can update own preferences" ON user_preferences;
DROP POLICY IF EXISTS "Users can view own interactions" ON property_interactions;
DROP POLICY IF EXISTS "Users can insert own interactions" ON property_interactions;
DROP POLICY IF EXISTS "Users can update own interactions" ON property_interactions;
DROP POLICY IF EXISTS "Users can view own property inquiries" ON property_inquiries;
DROP POLICY IF EXISTS "Users can insert own property inquiries" ON property_inquiries;
DROP POLICY IF EXISTS "Property owners can view inquiries on their properties" ON property_inquiries;

-- Recreate optimized policies for user_profiles
CREATE POLICY "Users can update own profile"
  ON user_profiles FOR UPDATE
  TO authenticated
  USING ((select auth.uid()) = id)
  WITH CHECK ((select auth.uid()) = id);

CREATE POLICY "Users can insert own profile"
  ON user_profiles FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = id);

-- Recreate optimized policies for properties
CREATE POLICY "Anyone can view available properties"
  ON properties FOR SELECT
  USING (status = 'available' OR owner_id = (select auth.uid()));

CREATE POLICY "Property owners can insert properties"
  ON properties FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = owner_id);

CREATE POLICY "Property owners can update own properties"
  ON properties FOR UPDATE
  TO authenticated
  USING ((select auth.uid()) = owner_id)
  WITH CHECK ((select auth.uid()) = owner_id);

CREATE POLICY "Property owners can delete own properties"
  ON properties FOR DELETE
  TO authenticated
  USING ((select auth.uid()) = owner_id);

-- Recreate optimized policies for favorites
CREATE POLICY "Users can view own favorites"
  ON favorites FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

CREATE POLICY "Users can insert own favorites"
  ON favorites FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

CREATE POLICY "Users can delete own favorites"
  ON favorites FOR DELETE
  TO authenticated
  USING ((select auth.uid()) = user_id);

-- Recreate optimized policies for property_views
CREATE POLICY "Users can view own property views"
  ON property_views FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

-- Recreate optimized policies for search_history
CREATE POLICY "Users can view own search history"
  ON search_history FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

CREATE POLICY "Users can insert own search history"
  ON search_history FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

-- Recreate optimized policies for chat_messages
CREATE POLICY "Users can view own chat messages"
  ON chat_messages FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

CREATE POLICY "Users can insert own chat messages"
  ON chat_messages FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

-- Recreate optimized policies for user_preferences
CREATE POLICY "Users can view own preferences"
  ON user_preferences FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

CREATE POLICY "Users can insert own preferences"
  ON user_preferences FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

CREATE POLICY "Users can update own preferences"
  ON user_preferences FOR UPDATE
  TO authenticated
  USING ((select auth.uid()) = user_id)
  WITH CHECK ((select auth.uid()) = user_id);

-- Recreate optimized policies for property_interactions
CREATE POLICY "Users can view own interactions"
  ON property_interactions FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

CREATE POLICY "Users can insert own interactions"
  ON property_interactions FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

CREATE POLICY "Users can update own interactions"
  ON property_interactions FOR UPDATE
  TO authenticated
  USING ((select auth.uid()) = user_id)
  WITH CHECK ((select auth.uid()) = user_id);

-- Recreate optimized policies for property_inquiries
CREATE POLICY "Users can view own property inquiries"
  ON property_inquiries FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

CREATE POLICY "Users can insert own property inquiries"
  ON property_inquiries FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

CREATE POLICY "Property owners can view inquiries on their properties"
  ON property_inquiries FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_inquiries.property_id
      AND properties.owner_id = (select auth.uid())
    )
  );