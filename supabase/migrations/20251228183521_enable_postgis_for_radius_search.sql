/*
  # Enable PostGIS for Radius Search

  1. Extension
    - Enable PostGIS extension for geographic queries
  
  2. Functions
    - `search_properties_by_radius` - Search properties within radius from a point
      - Only returns Vizag properties
      - Uses ST_DWithin for efficient geo queries
      - Supports 1-5km radius
  
  3. Notes
    - Requires latitude/longitude on properties table
    - Joins with vizag_localities to ensure strict Vizag filtering
    - Returns only active properties
*/

-- Enable PostGIS extension
CREATE EXTENSION IF NOT EXISTS postgis;

-- Function to search properties within radius (Vizag only)
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
  property_type text,
  listing_type text,
  price numeric,
  bedrooms integer,
  bathrooms integer,
  area_sqft numeric,
  locality_id text,
  location text,
  city text,
  state text,
  pincode text,
  latitude numeric,
  longitude numeric,
  amenities text[],
  images text[],
  video_url text,
  status text,
  featured boolean,
  verified boolean,
  owner_id uuid,
  agent_name text,
  agent_phone text,
  agent_whatsapp text,
  views_count integer,
  created_at timestamptz,
  updated_at timestamptz,
  distance_meters numeric
) AS $$
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
$$ LANGUAGE plpgsql STABLE;
