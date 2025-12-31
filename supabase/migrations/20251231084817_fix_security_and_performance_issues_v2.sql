/*
  # Fix Security and Performance Issues

  ## Changes Made
  
  1. **Add Missing Foreign Key Indexes**
     - Add indexes for all foreign keys to improve query performance:
       - `chat_messages.user_id`
       - `favorites.property_id`
       - `properties.locality_id`
       - `properties.owner_id`
       - `property_inquiries.property_id`
       - `property_inquiries.user_id`
       - `property_views.property_id`
       - `property_views.user_id`
       - `property_visits.property_id`
       - `search_history.user_id`
       - `user_search_history.user_id`

  2. **Remove Unused Indexes**
     - Remove indexes that are not being used by queries:
       - `idx_vizag_localities_active`
       - `idx_vizag_localities_city`
       - `idx_properties_locality`
       - `idx_locality_slug`
       - `idx_locality_name_trgm`

  3. **Consolidate RLS Policies**
     - Remove duplicate permissive policies to prevent conflicts
     - Keep the most appropriate policy for each operation

  4. **Fix Function Security**
     - Set immutable search_path for search_properties_by_radius function

  ## Notes
  - spatial_ref_sys is a PostGIS system table and should not have RLS enabled
  - Extensions (postgis, pg_trgm) should remain in public schema for compatibility
  - Auth connection strategy is a project setting, not a migration change
*/

-- =====================================================
-- 1. ADD MISSING FOREIGN KEY INDEXES
-- =====================================================

-- chat_messages indexes
CREATE INDEX IF NOT EXISTS idx_chat_messages_user_id 
ON chat_messages(user_id);

-- favorites indexes
CREATE INDEX IF NOT EXISTS idx_favorites_property_id 
ON favorites(property_id);

-- properties indexes
CREATE INDEX IF NOT EXISTS idx_properties_locality_id 
ON properties(locality_id);

CREATE INDEX IF NOT EXISTS idx_properties_owner_id 
ON properties(owner_id);

-- property_inquiries indexes
CREATE INDEX IF NOT EXISTS idx_property_inquiries_property_id 
ON property_inquiries(property_id);

CREATE INDEX IF NOT EXISTS idx_property_inquiries_user_id 
ON property_inquiries(user_id);

-- property_views indexes
CREATE INDEX IF NOT EXISTS idx_property_views_property_id 
ON property_views(property_id);

CREATE INDEX IF NOT EXISTS idx_property_views_user_id 
ON property_views(user_id);

-- property_visits indexes
CREATE INDEX IF NOT EXISTS idx_property_visits_property_id 
ON property_visits(property_id);

-- search_history indexes
CREATE INDEX IF NOT EXISTS idx_search_history_user_id 
ON search_history(user_id);

-- user_search_history indexes
CREATE INDEX IF NOT EXISTS idx_user_search_history_user_id 
ON user_search_history(user_id);

-- =====================================================
-- 2. REMOVE UNUSED INDEXES
-- =====================================================

DROP INDEX IF EXISTS idx_vizag_localities_active;
DROP INDEX IF EXISTS idx_vizag_localities_city;
DROP INDEX IF EXISTS idx_properties_locality;
DROP INDEX IF EXISTS idx_locality_slug;
DROP INDEX IF EXISTS idx_locality_name_trgm;

-- =====================================================
-- 3. CONSOLIDATE RLS POLICIES
-- =====================================================

-- Drop duplicate policies on properties table
DROP POLICY IF EXISTS "public_read_vizag_properties" ON properties;

-- Drop and recreate INSERT policy with locality validation
DROP POLICY IF EXISTS "insert_only_valid_locality" ON properties;
DROP POLICY IF EXISTS "Property owners can insert properties" ON properties;

CREATE POLICY "Property owners can insert properties"
  ON properties
  FOR INSERT
  TO authenticated
  WITH CHECK (
    auth.uid() = owner_id 
    AND (
      locality_id IS NULL 
      OR EXISTS (
        SELECT 1 FROM vizag_localities 
        WHERE id = properties.locality_id 
        AND is_active = true
      )
    )
  );

-- Consolidate vizag_localities SELECT policies
DROP POLICY IF EXISTS "Anyone can view active localities" ON vizag_localities;

-- Add public access policy for active localities
CREATE POLICY "Public can view active localities"
  ON vizag_localities
  FOR SELECT
  TO anon
  USING (is_active = true);

-- =====================================================
-- 4. FIX FUNCTION SECURITY
-- =====================================================

-- Recreate the function with immutable search_path
CREATE OR REPLACE FUNCTION search_properties_by_radius(
  lat double precision,
  lng double precision,
  radius_km double precision DEFAULT 5
)
RETURNS TABLE (
  id uuid,
  title text,
  location text,
  price numeric,
  property_type text,
  listing_type text,
  distance_km double precision
)
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
BEGIN
  RETURN QUERY
  SELECT 
    p.id,
    p.title,
    p.location,
    p.price,
    p.property_type,
    p.listing_type,
    ST_Distance(
      ST_SetSRID(ST_MakePoint(lng, lat), 4326)::geography,
      ST_SetSRID(ST_MakePoint(p.longitude, p.latitude), 4326)::geography
    ) / 1000 as distance_km
  FROM properties p
  WHERE p.status = 'available'
    AND p.latitude IS NOT NULL
    AND p.longitude IS NOT NULL
    AND ST_DWithin(
      ST_SetSRID(ST_MakePoint(lng, lat), 4326)::geography,
      ST_SetSRID(ST_MakePoint(p.longitude, p.latitude), 4326)::geography,
      radius_km * 1000
    )
  ORDER BY distance_km;
END;
$$;
