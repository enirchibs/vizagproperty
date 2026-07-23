-- ==============================================================================
-- 06. FUNCTIONS, TRIGGERS & AUTOMATION
-- ==============================================================================

-- -----------------------------------------------------------------------------
-- PROPERTY COUNT MATERIALIZED VIEW
-- Automatically maintains active listings counts by location
-- -----------------------------------------------------------------------------

CREATE MATERIALIZED VIEW property.location_statistics AS
SELECT 
    locality_id,
    COUNT(CASE WHEN listing_type = 'sale' THEN 1 END) as properties_for_sale,
    COUNT(CASE WHEN listing_type = 'rent' THEN 1 END) as properties_for_rent,
    COUNT(CASE WHEN property_type = 'apartment' THEN 1 END) as apartments_count,
    COUNT(CASE WHEN property_type = 'villa' THEN 1 END) as villas_count,
    COUNT(CASE WHEN property_type = 'plot' THEN 1 END) as plots_count,
    COUNT(*) as total_active_properties
FROM property.properties_active
GROUP BY locality_id;

CREATE UNIQUE INDEX idx_location_statistics_locality ON property.location_statistics(locality_id);

-- Function to refresh location stats concurrently
CREATE OR REPLACE FUNCTION property.refresh_location_statistics()
RETURNS TRIGGER AS $$
BEGIN
    -- We use PG_NOTIFY to process this asynchronously via a worker in production,
    -- but for simplicity, we can trigger a fast concurrent refresh
    REFRESH MATERIALIZED VIEW CONCURRENTLY property.location_statistics;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- We trigger this only on status changes or inserts to active partition
CREATE TRIGGER trigger_refresh_location_stats
AFTER INSERT OR DELETE OR UPDATE OF status, locality_id, listing_type, property_type
ON property.properties_active
FOR EACH STATEMENT EXECUTE FUNCTION property.refresh_location_statistics();


-- -----------------------------------------------------------------------------
-- PRICE HISTORY TRIGGER
-- Automatically tracks when a property price changes
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION property.track_price_change()
RETURNS TRIGGER AS $$
BEGIN
    IF (OLD.price IS DISTINCT FROM NEW.price) THEN
        INSERT INTO property.prices_history (property_id, property_status, old_price, new_price)
        VALUES (NEW.id, NEW.status, OLD.price, NEW.price);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_track_price_change
AFTER UPDATE OF price ON property.properties
FOR EACH ROW EXECUTE FUNCTION property.track_price_change();


-- -----------------------------------------------------------------------------
-- APPLY AUDIT TRIGGERS TO CORE TABLES
-- -----------------------------------------------------------------------------
CREATE TRIGGER audit_properties_changes
AFTER INSERT OR UPDATE OR DELETE ON property.properties
FOR EACH ROW EXECUTE FUNCTION audit.log_record_change();

CREATE TRIGGER audit_cities_changes
AFTER INSERT OR UPDATE OR DELETE ON geo.cities
FOR EACH ROW EXECUTE FUNCTION audit.log_record_change();


-- -----------------------------------------------------------------------------
-- AI SEARCH RADIUS FUNCTION
-- PostGIS ST_DWithin for ultra-fast nearby property search
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION search.get_properties_nearby(
    center_lon DOUBLE PRECISION,
    center_lat DOUBLE PRECISION,
    radius_meters DOUBLE PRECISION,
    max_results INT DEFAULT 50
)
RETURNS TABLE (
    property_id UUID,
    title VARCHAR,
    price NUMERIC,
    distance_meters DOUBLE PRECISION
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id,
        p.title,
        p.price,
        ST_Distance(p.geo_location::geography, ST_SetSRID(ST_MakePoint(center_lon, center_lat), 4326)::geography) AS distance_meters
    FROM property.properties_active p
    WHERE ST_DWithin(
        p.geo_location::geography,
        ST_SetSRID(ST_MakePoint(center_lon, center_lat), 4326)::geography,
        radius_meters
    )
    ORDER BY distance_meters ASC
    LIMIT max_results;
END;
$$ LANGUAGE plpgsql STABLE;
