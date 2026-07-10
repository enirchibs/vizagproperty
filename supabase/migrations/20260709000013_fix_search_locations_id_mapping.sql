-- ==============================================================================
-- 13. FIX SEARCH LOCATIONS ID MAPPING
-- ==============================================================================

-- Drop the existing functions first to avoid conflicts in signature or return types
DROP FUNCTION IF EXISTS public.search_locations(text, integer);
DROP FUNCTION IF EXISTS search.search_locations(text, integer);

-- Recreate search.search_locations to return entity_id as id
CREATE OR REPLACE FUNCTION search.search_locations(
    search_query TEXT,
    limit_count INT DEFAULT 10
) RETURNS TABLE (
    id UUID,
    display_name VARCHAR,
    entity_type geo.location_level,
    similarity_score REAL,
    rank_score REAL
) AS $$
DECLARE
    normalized_query TEXT := lower(unaccent(search_query));
BEGIN
    RETURN QUERY
    SELECT 
        l.entity_id AS id, -- Map to original geo table ID (e.g. locality_id)
        l.display_name,
        l.entity_type,
        similarity(l.search_text, normalized_query) AS similarity_score,
        (
            CASE WHEN lower(l.display_name) LIKE normalized_query || '%' THEN 10.0 ELSE 0.0 END +
            (similarity(l.search_text, normalized_query) * 5.0) +
            (ln(l.popularity_score + 2) * 0.5) +
            (ln(l.property_count + 2) * 0.2)
        )::REAL AS rank_score
    FROM search.locations l
    WHERE 
        l.search_text % normalized_query
        OR l.search_vector @@ plainto_tsquery('english', normalized_query)
    ORDER BY rank_score DESC
    LIMIT limit_count;
END;
$$ LANGUAGE plpgsql STABLE;

-- Recreate public.search_locations wrapper function in public schema
CREATE OR REPLACE FUNCTION public.search_locations(
    search_query TEXT,
    limit_count INT DEFAULT 10
) RETURNS TABLE (
    id UUID,
    display_name VARCHAR,
    entity_type geo.location_level,
    similarity_score REAL,
    rank_score REAL
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        l.id,
        l.display_name,
        l.entity_type,
        l.similarity_score,
        l.rank_score
    FROM search.search_locations(search_query, limit_count) l;
END;
$$ LANGUAGE plpgsql STABLE SECURITY DEFINER;

-- Expose execution permissions to the public and authenticated API roles
GRANT EXECUTE ON FUNCTION public.search_locations TO public, anon, authenticated;
