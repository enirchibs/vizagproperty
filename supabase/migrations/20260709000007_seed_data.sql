-- ==============================================================================
-- 07. SEED DATA (Vizag Specific)
-- ==============================================================================

DO $$
DECLARE
    ind_id UUID;
    ap_id UUID;
    vzg_dist_id UUID;
    vzg_city_id UUID;
    madhurawada_zone_id UUID;
    madhurawada_loc_id UUID;
    mvp_loc_id UUID;
BEGIN
    -- 1. Country (Idempotent)
    SELECT id INTO ind_id FROM geo.countries WHERE iso2 = 'IN';
    IF ind_id IS NULL THEN
        INSERT INTO geo.countries (name, iso2, translations)
        VALUES ('India', 'IN', '{"te": "భారతదేశం", "hi": "भारत"}'::jsonb)
        RETURNING id INTO ind_id;
    END IF;

    -- 2. State
    SELECT id INTO ap_id FROM geo.states WHERE code = 'AP' AND country_id = ind_id;
    IF ap_id IS NULL THEN
        INSERT INTO geo.states (country_id, name, code, translations)
        VALUES (ind_id, 'Andhra Pradesh', 'AP', '{"te": "ఆంధ్రప్రదేశ్", "hi": "आंध्र प्रदेश"}'::jsonb)
        RETURNING id INTO ap_id;
    END IF;

    -- 3. District
    SELECT id INTO vzg_dist_id FROM geo.districts WHERE name = 'Visakhapatnam' AND state_id = ap_id;
    IF vzg_dist_id IS NULL THEN
        INSERT INTO geo.districts (state_id, name, translations)
        VALUES (ap_id, 'Visakhapatnam', '{"te": "విశాఖపట్నం", "hi": "विशाखापत्तनम"}'::jsonb)
        RETURNING id INTO vzg_dist_id;
    END IF;

    -- 4. City
    SELECT id INTO vzg_city_id FROM geo.cities WHERE name = 'Visakhapatnam' AND district_id = vzg_dist_id;
    IF vzg_city_id IS NULL THEN
        INSERT INTO geo.cities (district_id, name, is_metro, aliases, center_point)
        VALUES (
            vzg_dist_id, 
            'Visakhapatnam', 
            TRUE, 
            ARRAY['Vizag', 'Waltair', 'Visakha', 'Vizagapatam'], 
            ST_SetSRID(ST_MakePoint(83.2185, 17.6868), 4326)
        )
        RETURNING id INTO vzg_city_id;
    END IF;

    -- 5. Zones
    SELECT id INTO madhurawada_zone_id FROM geo.zones WHERE name = 'Zone 2 (Madhurawada)' AND city_id = vzg_city_id;
    IF madhurawada_zone_id IS NULL THEN
        INSERT INTO geo.zones (city_id, name) VALUES (vzg_city_id, 'Zone 2 (Madhurawada)') RETURNING id INTO madhurawada_zone_id;
    END IF;

    -- 6. Localities
    SELECT id INTO madhurawada_loc_id FROM geo.localities WHERE name = 'Madhurawada' AND city_id = vzg_city_id;
    IF madhurawada_loc_id IS NULL THEN
        INSERT INTO geo.localities (city_id, zone_id, name, pincode, center_point, aliases)
        VALUES (
            vzg_city_id, 
            madhurawada_zone_id, 
            'Madhurawada', 
            '530041', 
            ST_SetSRID(ST_MakePoint(83.3421, 17.8205), 4326),
            ARRAY['Maduravada', 'Madhurwada', 'IT SEZ']
        )
        RETURNING id INTO madhurawada_loc_id;

        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (madhurawada_loc_id, 'locality', 'Madhurawada, Visakhapatnam', 'Madhurawada Maduravada Madhurwada IT SEZ', ST_SetSRID(ST_MakePoint(83.3421, 17.8205), 4326), 95)
        ON CONFLICT DO NOTHING;
    END IF;

    SELECT id INTO mvp_loc_id FROM geo.localities WHERE name = 'MVP Colony' AND city_id = vzg_city_id;
    IF mvp_loc_id IS NULL THEN
        INSERT INTO geo.localities (city_id, name, pincode, center_point, aliases)
        VALUES (
            vzg_city_id, 
            'MVP Colony', 
            '530017', 
            ST_SetSRID(ST_MakePoint(83.3312, 17.7441), 4326),
            ARRAY['Muvvalavanipalem', 'Sector 1', 'Sector 2']
        )
        RETURNING id INTO mvp_loc_id;

        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (mvp_loc_id, 'locality', 'MVP Colony, Visakhapatnam', 'MVP Colony Muvvalavanipalem Sector 1 Sector 2', ST_SetSRID(ST_MakePoint(83.3312, 17.7441), 4326), 92)
        ON CONFLICT DO NOTHING;
    END IF;

    -- Add City to search locations if not exists
    INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
    VALUES (vzg_city_id, 'city', 'Visakhapatnam, Andhra Pradesh', 'Visakhapatnam Vizag Waltair Visakha', ST_SetSRID(ST_MakePoint(83.2185, 17.6868), 4326), 100)
    ON CONFLICT DO NOTHING;

END $$;
