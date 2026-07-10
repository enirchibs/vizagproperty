-- ==============================================================================
-- 12. PUBLIC SEARCH WRAPPER FUNCTION
-- ==============================================================================

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
