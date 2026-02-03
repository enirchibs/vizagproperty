/*
  # Add Smart Locality Typo Correction

  1. Purpose
    - Fix human typing errors without guessing wrong areas
    - Two-layer safe correction: prefix match first, then fuzzy match
    - Require user confirmation (no silent auto-correction)

  2. Changes
    - Enable `pg_trgm` extension for fuzzy string matching
    - Create trigram index on localities.name for fast similarity searches
    - Create `search_localities_with_suggestions` function for smart search

  3. Search Strategy
    - Layer 1: Prefix match (fast) - "mad%" matches "Madhurawada"
    - Layer 2: Fuzzy match (only if no prefix results) - "madurawada" suggests "Madhurawada"
    - Similarity threshold: 0.4 (prevents wild guesses)
    - Returns up to 6 results

  4. Security
    - Function is SECURITY DEFINER for performance
    - Public access (locality names are not sensitive)
*/

-- Enable pg_trgm extension for fuzzy matching
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Create trigram index for fast similarity searches
CREATE INDEX IF NOT EXISTS idx_localities_name_trgm 
ON localities USING gin (name gin_trgm_ops);

-- Create smart locality search function with typo correction
CREATE OR REPLACE FUNCTION search_localities_with_suggestions(
  p_query text,
  p_city text DEFAULT 'Visakhapatnam',
  p_limit int DEFAULT 6
)
RETURNS TABLE (
  id uuid,
  name text,
  slug text,
  city text,
  pincode text,
  match_type text,
  similarity_score numeric
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  prefix_results_count int;
BEGIN
  -- Layer 1: Try prefix match first (fast and accurate)
  CREATE TEMP TABLE IF NOT EXISTS temp_results (
    id uuid,
    name text,
    slug text,
    city text,
    pincode text,
    match_type text,
    similarity_score numeric
  ) ON COMMIT DROP;

  INSERT INTO temp_results
  SELECT 
    l.id,
    l.name,
    l.slug,
    l.city,
    l.pincode,
    'prefix' AS match_type,
    1.0 AS similarity_score
  FROM localities l
  WHERE l.city = p_city
    AND l.name ILIKE (p_query || '%')
  ORDER BY l.name
  LIMIT p_limit;

  GET DIAGNOSTICS prefix_results_count = ROW_COUNT;

  -- Layer 2: Only use fuzzy match if prefix match found nothing
  IF prefix_results_count = 0 THEN
    INSERT INTO temp_results
    SELECT 
      l.id,
      l.name,
      l.slug,
      l.city,
      l.pincode,
      'fuzzy' AS match_type,
      ROUND(similarity(l.name, p_query)::numeric, 2) AS similarity_score
    FROM localities l
    WHERE l.city = p_city
      AND similarity(l.name, p_query) > 0.4
    ORDER BY similarity(l.name, p_query) DESC
    LIMIT p_limit;
  END IF;

  -- Return results
  RETURN QUERY
  SELECT * FROM temp_results
  ORDER BY similarity_score DESC, temp_results.name;

  DROP TABLE IF EXISTS temp_results;
END;
$$;

-- Grant execute permission to public
GRANT EXECUTE ON FUNCTION search_localities_with_suggestions TO public;