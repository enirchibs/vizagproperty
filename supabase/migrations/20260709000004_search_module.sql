-- ==============================================================================
-- 04. HIGH PERFORMANCE SEARCH MODULE
-- ==============================================================================

-- -----------------------------------------------------------------------------
-- SEARCH LOCATIONS (Denormalized & Optimized)
-- This table consolidates all locations (cities, zones, localities, etc.) into 
-- a single flat table optimized for ultra-fast autocomplete and fuzzy search.
-- -----------------------------------------------------------------------------
CREATE TABLE search.locations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_id UUID NOT NULL, -- references the original geo table id
    entity_type geo.location_level NOT NULL,
    
    display_name VARCHAR(255) NOT NULL, -- "Madhurawada, Visakhapatnam"
    search_vector TSVECTOR,             -- Full Text Search
    search_text TEXT NOT NULL,          -- Used for pg_trgm (fuzzy/typo search)
    
    center_point GEOMETRY(Point, 4326),
    
    popularity_score INTEGER DEFAULT 0,
    property_count INTEGER DEFAULT 0,
    
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- TSVector generation function
CREATE OR REPLACE FUNCTION search.update_location_search_vector() 
RETURNS TRIGGER AS $$
BEGIN
  -- Unaccent and lowercase for optimal FTS
  NEW.search_vector := to_tsvector('english', unaccent(NEW.search_text));
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_loc_search_vector
BEFORE INSERT OR UPDATE ON search.locations
FOR EACH ROW EXECUTE FUNCTION search.update_location_search_vector();

-- -----------------------------------------------------------------------------
-- SEARCH INDEXES for Locations
-- -----------------------------------------------------------------------------
-- 1. FTS Index (GIN)
CREATE INDEX idx_search_loc_vector ON search.locations USING GIN (search_vector);

-- 2. Trigram Index (GIN) for "mad", "gach", typos
CREATE INDEX idx_search_loc_trgm ON search.locations USING GIN (search_text gin_trgm_ops);

-- 3. Exact Prefix Matching (BTREE)
CREATE INDEX idx_search_loc_prefix ON search.locations (display_name text_pattern_ops);

-- 4. Spatial Index (GiST)
CREATE INDEX idx_search_loc_geom ON search.locations USING GIST (center_point);

-- 5. Sorting Index (BTREE)
CREATE INDEX idx_search_loc_popularity ON search.locations (popularity_score DESC, property_count DESC);

-- -----------------------------------------------------------------------------
-- AI / SEMANTIC SEARCH
-- -----------------------------------------------------------------------------
CREATE TABLE search.property_embeddings (
    property_id UUID PRIMARY KEY,
    property_status property.property_status NOT NULL,
    embedding vector(1536), -- Assuming OpenAI ada-002 model dimension
    ai_tags TEXT[],
    created_at TIMESTAMPTZ DEFAULT NOW(),
    FOREIGN KEY (property_id, property_status) REFERENCES property.properties (id, status) ON DELETE CASCADE
);

-- HNSW Index for ultra-fast vector similarity search (requires pgvector 0.5+)
CREATE INDEX idx_property_embeddings_hnsw ON search.property_embeddings USING hnsw (embedding vector_cosine_ops);

-- -----------------------------------------------------------------------------
-- TRENDING & SEARCH HISTORY (Partitioned)
-- -----------------------------------------------------------------------------
CREATE TABLE search.history (
    id UUID NOT NULL DEFAULT uuid_generate_v4(),
    user_id UUID,
    query_text TEXT NOT NULL,
    matched_results INTEGER DEFAULT 0,
    response_time_ms INTEGER,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
) PARTITION BY RANGE (created_at);

-- Partitions by Month
CREATE TABLE search.history_y2026m07 PARTITION OF search.history FOR VALUES FROM ('2026-07-01') TO ('2026-08-01');

-- View for Trending Searches (Materialized)
CREATE MATERIALIZED VIEW search.trending_keywords AS
SELECT 
    query_text, 
    COUNT(*) as search_count
FROM search.history
WHERE created_at > NOW() - INTERVAL '7 days'
GROUP BY query_text
HAVING COUNT(*) > 10
ORDER BY search_count DESC;

CREATE UNIQUE INDEX idx_trending_keywords ON search.trending_keywords(query_text);

-- -----------------------------------------------------------------------------
-- RANKING ALGORITHM FUNCTION
-- Combines Exact Match, Trigram Similarity, and Popularity
-- -----------------------------------------------------------------------------
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
        l.id,
        l.display_name,
        l.entity_type,
        similarity(l.search_text, normalized_query) AS similarity_score,
        -- Combined Ranking Score:
        -- 1. Exact Prefix gets a massive boost (+10)
        -- 2. Trigram similarity (0 to 1) multiplied by 5
        -- 3. Logarithmic popularity boost to prevent highly popular generic terms from dominating specific niche matches
        (
            CASE WHEN lower(l.display_name) LIKE normalized_query || '%' THEN 10.0 ELSE 0.0 END +
            (similarity(l.search_text, normalized_query) * 5.0) +
            (ln(l.popularity_score + 2) * 0.5) +
            (ln(l.property_count + 2) * 0.2)
        )::REAL AS rank_score
    FROM search.locations l
    WHERE 
        l.search_text % normalized_query -- Trigram threshold match
        OR l.search_vector @@ plainto_tsquery('english', normalized_query) -- FTS match
    ORDER BY rank_score DESC
    LIMIT limit_count;
END;
$$ LANGUAGE plpgsql STABLE;
