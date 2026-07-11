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
    prop_lat NUMERIC;
    prop_lon NUMERIC;
    loc_id UUID;
BEGIN
    -- 1. Get the property's location from public.properties
    SELECT latitude, longitude, locality_id 
    INTO prop_lat, prop_lon, loc_id
    FROM public.properties
    WHERE id = prop_id;

    -- If property has lat/lon directly
    IF prop_lat IS NOT NULL AND prop_lon IS NOT NULL THEN
        prop_point := ST_SetSRID(ST_MakePoint(prop_lon, prop_lat), 4326);
    ELSIF loc_id IS NOT NULL THEN
        -- Fallback to locality center point in public.localities
        SELECT latitude, longitude INTO prop_lat, prop_lon
        FROM public.localities
        WHERE id = loc_id;
        
        IF prop_lat IS NOT NULL AND prop_lon IS NOT NULL THEN
            prop_point := ST_SetSRID(ST_MakePoint(prop_lon, prop_lat), 4326);
        ELSE
            -- Try geo.localities if it exists
            SELECT center_point INTO prop_point
            FROM geo.localities
            WHERE id = loc_id;
        END IF;
    END IF;

    -- If still no point, return empty
    IF prop_point IS NULL THEN
        RETURN;
    END IF;

    -- 2. Find nearby POIs using PostGIS ST_DWithin
    RETURN QUERY
    SELECT 
        p.id,
        p.name,
        p.poi_type,
        ST_Distance(p.center_point::geography, prop_point::geography) AS distance_meters
    FROM geo.poi p
    WHERE ST_DWithin(p.center_point::geography, prop_point::geography, radius_meters)
    ORDER BY distance_meters ASC
    LIMIT 20;
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
