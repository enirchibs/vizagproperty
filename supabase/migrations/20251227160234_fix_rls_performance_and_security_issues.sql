/*
  # Fix RLS Performance and Security Issues

  ## 1. RLS Performance Optimization
  Replace direct `auth.uid()` calls with `(select auth.uid())` to prevent re-evaluation per row.
  
  ### Tables Fixed:
  - `property_videos` (2 policies)
  - `property_social_links` (2 policies)
  - `user_search_history` (3 policies)

  ## 2. Remove Unused Indexes
  Drop indexes that are not being used to reduce storage overhead and maintenance cost.
  
  ### Indexes Dropped:
  - Properties table: 7 unused indexes (including 1 duplicate)
  - Favorites table: 1 unused index
  - Property views table: 2 unused indexes
  - Search history table: 1 unused index
  - Chat messages table: 2 unused indexes
  - Property inquiries table: 2 unused indexes
  - Property visits table: 3 unused indexes
  - Negotiation insights table: 1 unused index
  - Indian cities table: 1 unused index
  - Vizag localities master table: 3 unused indexes
  - User search history table: 2 unused indexes

  ## 3. Fix Function Security
  Recreate `get_localities_within_radius` with immutable search_path to prevent security vulnerabilities.

  ## Important Notes:
  - All RLS policies maintain exact same authorization logic
  - Only optimization is caching auth.uid() result instead of re-evaluating per row
  - Unused indexes are safely removed (will be recreated if needed in future)
  - Function security is hardened with explicit search_path
*/

-- ============================================================
-- PART 1: FIX RLS POLICIES FOR PERFORMANCE
-- ============================================================

-- Fix property_videos policies
DROP POLICY IF EXISTS "Property owners can insert videos" ON property_videos;
DROP POLICY IF EXISTS "Property owners can delete their videos" ON property_videos;

CREATE POLICY "Property owners can insert videos"
  ON property_videos FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_videos.property_id
      AND properties.owner_id = (select auth.uid())
    )
  );

CREATE POLICY "Property owners can delete their videos"
  ON property_videos FOR DELETE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_videos.property_id
      AND properties.owner_id = (select auth.uid())
    )
  );

-- Fix property_social_links policies
DROP POLICY IF EXISTS "Property owners can insert social links" ON property_social_links;
DROP POLICY IF EXISTS "Property owners can delete their social links" ON property_social_links;

CREATE POLICY "Property owners can insert social links"
  ON property_social_links FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_social_links.property_id
      AND properties.owner_id = (select auth.uid())
    )
  );

CREATE POLICY "Property owners can delete their social links"
  ON property_social_links FOR DELETE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM properties
      WHERE properties.id = property_social_links.property_id
      AND properties.owner_id = (select auth.uid())
    )
  );

-- Fix user_search_history policies
DROP POLICY IF EXISTS "Users can view own search history" ON user_search_history;
DROP POLICY IF EXISTS "Users can insert own search history" ON user_search_history;
DROP POLICY IF EXISTS "Users can update own search history" ON user_search_history;

CREATE POLICY "Users can view own search history"
  ON user_search_history
  FOR SELECT
  TO authenticated
  USING ((select auth.uid()) = user_id);

CREATE POLICY "Users can insert own search history"
  ON user_search_history
  FOR INSERT
  TO authenticated
  WITH CHECK ((select auth.uid()) = user_id);

CREATE POLICY "Users can update own search history"
  ON user_search_history
  FOR UPDATE
  TO authenticated
  USING ((select auth.uid()) = user_id)
  WITH CHECK ((select auth.uid()) = user_id);

-- ============================================================
-- PART 2: DROP UNUSED AND DUPLICATE INDEXES
-- ============================================================

-- Properties table indexes
DROP INDEX IF EXISTS idx_properties_created; -- Duplicate of idx_properties_created_at
DROP INDEX IF EXISTS idx_properties_price;
DROP INDEX IF EXISTS idx_properties_owner;
DROP INDEX IF EXISTS idx_properties_location_search;
DROP INDEX IF EXISTS idx_properties_locality_search;
DROP INDEX IF EXISTS idx_properties_price_search;
DROP INDEX IF EXISTS idx_properties_full_search;

-- Favorites table indexes
DROP INDEX IF EXISTS idx_favorites_property;

-- Property views table indexes
DROP INDEX IF EXISTS idx_property_views_property;
DROP INDEX IF EXISTS idx_property_views_user_id;

-- Search history table indexes
DROP INDEX IF EXISTS idx_search_history_user;

-- Chat messages table indexes
DROP INDEX IF EXISTS idx_chat_messages_session;
DROP INDEX IF EXISTS idx_chat_messages_user;

-- Property inquiries table indexes
DROP INDEX IF EXISTS idx_property_inquiries_property_id;
DROP INDEX IF EXISTS idx_property_inquiries_user_id;

-- Property visits table indexes
DROP INDEX IF EXISTS idx_property_visits_user_id;
DROP INDEX IF EXISTS idx_property_visits_property_id;
DROP INDEX IF EXISTS idx_property_visits_visit_date;

-- Negotiation insights table indexes
DROP INDEX IF EXISTS idx_negotiation_insights_property_id;

-- Indian cities table indexes
DROP INDEX IF EXISTS idx_cities_state_id;

-- Vizag localities master table indexes
DROP INDEX IF EXISTS idx_vizag_localities_name;
DROP INDEX IF EXISTS idx_vizag_localities_geo;
DROP INDEX IF EXISTS idx_vizag_localities_active;

-- User search history table indexes
DROP INDEX IF EXISTS idx_user_search_history_user_id;
DROP INDEX IF EXISTS idx_user_search_history_created_at;

-- ============================================================
-- PART 3: FIX FUNCTION SEARCH PATH SECURITY
-- ============================================================

-- Recreate get_localities_within_radius with immutable search_path
DROP FUNCTION IF EXISTS get_localities_within_radius(text, numeric);

CREATE OR REPLACE FUNCTION public.get_localities_within_radius(
  p_center_slug text, 
  p_radius_km numeric DEFAULT 5
)
RETURNS TABLE(
  locality_name text, 
  locality_slug text, 
  distance_km numeric
)
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
BEGIN
  RETURN QUERY
  SELECT
    vl.locality_name,
    vl.locality_slug,
    ROUND(
      (
        6371 * acos(
          cos(radians(center.latitude)) *
          cos(radians(vl.latitude)) *
          cos(radians(vl.longitude) - radians(center.longitude)) +
          sin(radians(center.latitude)) *
          sin(radians(vl.latitude))
        )
      )::numeric,
      2
    ) as distance_km
  FROM vizag_localities_master vl
  CROSS JOIN (
    SELECT latitude, longitude
    FROM vizag_localities_master
    WHERE vizag_localities_master.locality_slug = p_center_slug
    AND is_active = true
  ) center
  WHERE vl.is_active = true
  AND vl.locality_slug != p_center_slug
  AND (
    6371 * acos(
      cos(radians(center.latitude)) *
      cos(radians(vl.latitude)) *
      cos(radians(vl.longitude) - radians(center.longitude)) +
      sin(radians(center.latitude)) *
      sin(radians(vl.latitude))
    )
  ) <= p_radius_km
  ORDER BY distance_km;
END;
$$;
