/*
  # Add Nearby Localities Search Function

  1. New Function
    - `get_nearby_localities` - Finds all localities within a specified radius (in km) from a center locality
    - Uses Haversine formula for accurate distance calculation
    - Returns array of locality IDs within the radius
  
  2. Parameters
    - `center_lat` (numeric) - Latitude of center point
    - `center_lng` (numeric) - Longitude of center point
    - `radius_km` (numeric) - Search radius in kilometers (default 5km)
    - `p_city` (text) - City filter (default 'Visakhapatnam')
  
  3. Returns
    - Array of locality UUIDs within the specified radius
  
  4. Security
    - Function is marked as STABLE for query optimization
    - SECURITY DEFINER to allow access without direct table permissions
*/

-- Drop existing function if exists
DROP FUNCTION IF EXISTS get_nearby_localities(numeric, numeric, numeric, text);

-- Create function to find nearby localities using Haversine formula
CREATE OR REPLACE FUNCTION get_nearby_localities(
  center_lat numeric,
  center_lng numeric,
  radius_km numeric DEFAULT 5,
  p_city text DEFAULT 'Visakhapatnam'
)
RETURNS TABLE(locality_id uuid, distance_km numeric) 
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
AS $$
BEGIN
  RETURN QUERY
  SELECT 
    id,
    (
      6371 * acos(
        cos(radians(center_lat)) *
        cos(radians(latitude)) *
        cos(radians(longitude) - radians(center_lng)) +
        sin(radians(center_lat)) *
        sin(radians(latitude))
      )
    ) AS distance
  FROM localities
  WHERE 
    city = p_city
    AND latitude IS NOT NULL
    AND longitude IS NOT NULL
    AND (
      6371 * acos(
        cos(radians(center_lat)) *
        cos(radians(latitude)) *
        cos(radians(longitude) - radians(center_lng)) +
        sin(radians(center_lat)) *
        sin(radians(latitude))
      )
    ) <= radius_km
  ORDER BY distance;
END;
$$;
