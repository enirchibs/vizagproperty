/*
  # Fix Security and Performance Issues

  This migration addresses critical security and performance issues identified in the database audit.

  ## 1. Add Missing Foreign Key Indexes

  Add indexes for foreign key columns to improve query performance:
  - `property_inquiries.property_id` - Index for property lookup
  - `property_inquiries.user_id` - Index for user inquiry lookup
  - `property_views.user_id` - Index for user view history

  ## 2. Optimize RLS Policies

  Replace direct `auth.uid()` calls with `(select auth.uid())` to prevent re-evaluation
  for each row, significantly improving query performance at scale. This affects all tables:
  - user_profiles
  - properties
  - favorites
  - property_views
  - search_history
  - chat_messages
  - property_inquiries
  - user_preferences
  - property_interactions
  - property_visits

  ## 3. Fix Function Security

  Add explicit search_path to functions to prevent search_path injection attacks:
  - `update_updated_at()` - Update timestamp trigger function
  - `increment_property_views()` - Property view counter function

  ## Security Notes
  - All changes maintain existing access control rules
  - Performance improvements do not compromise security
  - Functions now have immutable search_path for security
*/

-- ============================================================================
-- 1. ADD MISSING FOREIGN KEY INDEXES
-- ============================================================================

CREATE INDEX IF NOT EXISTS idx_property_inquiries_property_id
  ON property_inquiries(property_id);

CREATE INDEX IF NOT EXISTS idx_property_inquiries_user_id
  ON property_inquiries(user_id);

CREATE INDEX IF NOT EXISTS idx_property_views_user_id
  ON property_views(user_id);

-- ============================================================================
-- 2. OPTIMIZE RLS POLICIES - DROP AND RECREATE WITH SELECT WRAPPING
-- ============================================================================

-- user_profiles policies
DROP POLICY IF EXISTS "Users can update own profile" ON user_profiles;
CREATE POLICY "Users can update own profile"
  ON user_profiles FOR UPDATE
  TO authenticated
  USING ((select auth.uid()) = id)
  WITH CHECK ((select auth.uid()) = id);

DROP POLICY IF EXISTS "Users can insert own profile" ON user_profiles;
CREATE POLICY "Users can insert own profile"
  ON user_profiles FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = id);

-- properties policies
DROP POLICY IF EXISTS "Anyone can view available properties" ON properties;
CREATE POLICY "Anyone can view available properties"
  ON properties FOR SELECT
  USING (status = 'available' OR owner_id = (select auth.uid()));

DROP POLICY IF EXISTS "Property owners can insert properties" ON properties;
CREATE POLICY "Property owners can insert properties"
  ON properties FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = owner_id);

DROP POLICY IF EXISTS "Property owners can update own properties" ON properties;
CREATE POLICY "Property owners can update own properties"
  ON properties FOR UPDATE
  TO authenticated
  USING ((select auth.uid()) = owner_id)
  WITH CHECK ((select auth.uid()) = owner_id);

DROP POLICY IF EXISTS "Property owners can delete own properties" ON properties;
CREATE POLICY "Property owners can delete own properties"
  ON properties FOR DELETE
  TO authenticated
  USING ((select auth.uid()) = owner_id);

-- favorites policies
DROP POLICY IF EXISTS "Users can view own favorites" ON favorites;
CREATE POLICY "Users can view own favorites"
  ON favorites FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can insert own favorites" ON favorites;
CREATE POLICY "Users can insert own favorites"
  ON favorites FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can delete own favorites" ON favorites;
CREATE POLICY "Users can delete own favorites"
  ON favorites FOR DELETE
  TO authenticated
  USING ((select auth.uid()) = user_id);

-- property_views policies
DROP POLICY IF EXISTS "Users can view own property views" ON property_views;
CREATE POLICY "Users can view own property views"
  ON property_views FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

-- search_history policies
DROP POLICY IF EXISTS "Users can view own search history" ON search_history;
CREATE POLICY "Users can view own search history"
  ON search_history FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can insert own search history" ON search_history;
CREATE POLICY "Users can insert own search history"
  ON search_history FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

-- chat_messages policies
DROP POLICY IF EXISTS "Users can view own chat messages" ON chat_messages;
CREATE POLICY "Users can view own chat messages"
  ON chat_messages FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can insert own chat messages" ON chat_messages;
CREATE POLICY "Users can insert own chat messages"
  ON chat_messages FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

-- property_inquiries policies
DROP POLICY IF EXISTS "Users can view own inquiries" ON property_inquiries;
CREATE POLICY "Users can view own inquiries"
  ON property_inquiries FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id OR (select auth.uid()) IN (
    SELECT owner_id FROM properties WHERE id = property_id
  ));

-- user_preferences policies
DROP POLICY IF EXISTS "Users can view own preferences" ON user_preferences;
CREATE POLICY "Users can view own preferences"
  ON user_preferences FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can insert own preferences" ON user_preferences;
CREATE POLICY "Users can insert own preferences"
  ON user_preferences FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can update own preferences" ON user_preferences;
CREATE POLICY "Users can update own preferences"
  ON user_preferences FOR UPDATE
  TO authenticated
  USING ((select auth.uid()) = user_id)
  WITH CHECK ((select auth.uid()) = user_id);

-- property_interactions policies
DROP POLICY IF EXISTS "Users can view own interactions" ON property_interactions;
CREATE POLICY "Users can view own interactions"
  ON property_interactions FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can insert own interactions" ON property_interactions;
CREATE POLICY "Users can insert own interactions"
  ON property_interactions FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can update own interactions" ON property_interactions;
CREATE POLICY "Users can update own interactions"
  ON property_interactions FOR UPDATE
  TO authenticated
  USING ((select auth.uid()) = user_id)
  WITH CHECK ((select auth.uid()) = user_id);

-- property_visits policies
DROP POLICY IF EXISTS "Users can view own visits" ON property_visits;
CREATE POLICY "Users can view own visits"
  ON property_visits FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can insert own visits" ON property_visits;
CREATE POLICY "Users can insert own visits"
  ON property_visits FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can update own visits" ON property_visits;
CREATE POLICY "Users can update own visits"
  ON property_visits FOR UPDATE
  TO authenticated
  USING ((select auth.uid()) = user_id)
  WITH CHECK ((select auth.uid()) = user_id);

DROP POLICY IF EXISTS "Users can delete own visits" ON property_visits;
CREATE POLICY "Users can delete own visits"
  ON property_visits FOR DELETE
  TO authenticated
  USING ((select auth.uid()) = user_id);

-- ============================================================================
-- 3. FIX FUNCTION SECURITY - ADD EXPLICIT SEARCH_PATH
-- ============================================================================

-- Update the update_updated_at function with secure search_path
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

-- Update the increment_property_views function with secure search_path
CREATE OR REPLACE FUNCTION increment_property_views()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  UPDATE properties
  SET views_count = views_count + 1
  WHERE id = NEW.property_id;
  RETURN NEW;
END;
$$;
