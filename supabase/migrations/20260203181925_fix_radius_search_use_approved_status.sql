/*
  # Fix Radius Search Function - Use 'approved' Status

  ## Overview
  Updates the search_properties_by_radius function to use the correct status value 'approved'
  to match the current property moderation system.

  ## Changes
  - Update WHERE clause to check for status = 'approved' instead of 'active'
  - Ensure strict property type filtering with exact match (=) operator
*/

DROP FUNCTION IF EXISTS search_properties_by_radius(numeric, numeric, integer, text, text);

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
  distance_meters numeric,
  images text[],
  videos text[],
  verified boolean,
  featured boolean,
  city text,
  pincode text,
  balconies integer,
  furnishing_status text,
  parking_spaces integer,
  floor_number integer,
  total_floors integer,
  facing text,
  age_years integer,
  whatsapp_number text,
  contact_email text
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
  WHERE 
    p.status = 'approved'
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