-- ==============================================================================
-- 11. REMOVE DUPLICATES & ADD UNIQUE CONSTRAINTS
-- ==============================================================================

-- 1. Delete the duplicated search locations first (due to foreign keys)
DELETE FROM search.locations 
WHERE entity_type = 'locality' 
AND entity_id IN (
    SELECT id FROM geo.localities 
    WHERE id NOT IN (
        SELECT MIN(id::text)::uuid FROM geo.localities GROUP BY city_id, name
    )
);

-- 2. Delete the duplicates in geo.localities (keep only the oldest record for each name)
DELETE FROM geo.localities
WHERE id NOT IN (
    SELECT MIN(id::text)::uuid FROM geo.localities GROUP BY city_id, name
);

-- 3. Add a UNIQUE constraint so this can never happen again!
ALTER TABLE geo.localities ADD CONSTRAINT uq_localities_city_name UNIQUE (city_id, name);
