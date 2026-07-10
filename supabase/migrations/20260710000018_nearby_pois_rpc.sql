-- ==============================================================================
-- 18. GET NEARBY POIS (RPC FUNCTION)
-- ==============================================================================

CREATE OR REPLACE FUNCTION geo.get_nearby_pois(
    prop_id UUID,
    radius_meters INT DEFAULT 3000
) RETURNS TABLE (
    poi_id UUID,
    name VARCHAR,
    poi_type VARCHAR,
    distance_meters FLOAT
) AS $$
DECLARE
    prop_point GEOMETRY(Point, 4326);
BEGIN
    -- 1. Get the property's location
    SELECT location INTO prop_point
    FROM property.properties
    WHERE id = prop_id;

    -- If property not found or has no location, return empty
    IF prop_point IS NULL THEN
        RETURN;
    END IF;

    -- 2. Find nearby POIs using PostGIS ST_DWithin
    -- Note: ST_DWithin on geometry with SRID 4326 uses degrees, so we cast to geography for meters
    RETURN QUERY
    SELECT 
        p.id,
        p.name,
        p.poi_type,
        ST_Distance(p.center_point::geography, prop_point::geography) AS distance_meters
    FROM geo.poi p
    WHERE ST_DWithin(p.center_point::geography, prop_point::geography, radius_meters)
    ORDER BY distance_meters ASC
    LIMIT 20; -- Return closest 20 POIs
END;
$$ LANGUAGE plpgsql STABLE;

-- Expose to public
CREATE OR REPLACE FUNCTION public.get_nearby_pois(
    prop_id UUID,
    radius_meters INT DEFAULT 3000
) RETURNS TABLE (
    poi_id UUID,
    name VARCHAR,
    poi_type VARCHAR,
    distance_meters FLOAT
) AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM geo.get_nearby_pois(prop_id, radius_meters);
END;
$$ LANGUAGE plpgsql STABLE SECURITY DEFINER;

GRANT EXECUTE ON FUNCTION public.get_nearby_pois TO public, anon, authenticated;
