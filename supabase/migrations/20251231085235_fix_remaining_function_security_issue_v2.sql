/*
  # Fix Remaining Function Security Issue

  ## Changes Made
  
  1. **Fix search_properties_by_radius Overload**
     - Drop and recreate the older overloaded version of search_properties_by_radius
     - Add immutable search_path to prevent SQL injection vulnerabilities

  ## Notes
  - There are two overloaded versions of this function with different signatures
  - Both need to have the immutable search_path set
*/

-- Drop the older version first
DROP FUNCTION IF EXISTS search_properties_by_radius(numeric, numeric, integer, text, text);

-- Recreate with immutable search_path
CREATE OR REPLACE FUNCTION search_properties_by_radius(
  center_lat numeric,
  center_lng numeric,
  radius_meters integer,
  p_property_type text DEFAULT NULL,
  p_listing_type text DEFAULT NULL
)
RETURNS TABLE (
  id uuid,
  title text,
  description text,
  location text,
  latitude numeric,
  longitude numeric,
  price numeric,
  property_type text,
  listing_type text,
  bedrooms integer,
  bathrooms integer,
  area_sqft integer,
  amenities text[],
  status text,
  owner_id uuid,
  locality_id text,
  created_at timestamptz,
  updated_at timestamptz,
  distance_meters numeric
)
LANGUAGE plpgsql
STABLE
SET search_path = public, pg_temp
AS $$
BEGIN
  RETURN QUERY
  SELECT 
    p.*,
    ST_Distance(
      geography(ST_Point(p.longitude, p.latitude)),
      geography(ST_Point(center_lng, center_lat))
    )::numeric AS distance_meters
  FROM properties p
  INNER JOIN vizag_localities vl ON p.locality_id = vl.locality_slug
  WHERE 
    vl.is_active = true
    AND p.status = 'available'
    AND p.latitude IS NOT NULL
    AND p.longitude IS NOT NULL
    AND ST_DWithin(
      geography(ST_Point(p.longitude, p.latitude)),
      geography(ST_Point(center_lng, center_lat)),
      radius_meters
    )
    AND (p_property_type IS NULL OR p.property_type = p_property_type)
    AND (p_listing_type IS NULL OR p.listing_type = p_listing_type)
  ORDER BY distance_meters ASC;
END;
$$;
