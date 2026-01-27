/*
  # Create Admin Analytics Functions
  
  1. Functions Created
    - `count_properties_last_7_days` - Returns count of properties created in last 7 days
    - `count_properties_last_30_days` - Returns count of properties created in last 30 days
    - `get_property_type_distribution` - Returns property type breakdown for approved listings
    - `get_locality_distribution` - Returns locality heatmap data using JOIN with localities table
  
  2. Security
    - All functions are SECURITY DEFINER to allow admin access
    - Functions return aggregated data only (no sensitive info)
*/

-- Count properties created in last 7 days
CREATE OR REPLACE FUNCTION count_properties_last_7_days()
RETURNS bigint
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT count(*)
  FROM properties
  WHERE created_at >= now() - interval '7 days';
$$;

-- Count properties created in last 30 days
CREATE OR REPLACE FUNCTION count_properties_last_30_days()
RETURNS bigint
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT count(*)
  FROM properties
  WHERE created_at >= now() - interval '30 days';
$$;

-- Get property type distribution for approved listings
CREATE OR REPLACE FUNCTION get_property_type_distribution()
RETURNS TABLE(property_type text, total bigint)
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT property_type, count(*) as total
  FROM properties
  WHERE status = 'approved'
  GROUP BY property_type
  ORDER BY total DESC;
$$;

-- Get locality distribution using JOIN with localities table
CREATE OR REPLACE FUNCTION get_locality_distribution()
RETURNS TABLE(locality text, total bigint)
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT l.name as locality, count(*) as total
  FROM properties p
  JOIN localities l ON l.id = p.locality_id
  WHERE p.status = 'approved'
  GROUP BY l.name
  ORDER BY total DESC;
$$;
