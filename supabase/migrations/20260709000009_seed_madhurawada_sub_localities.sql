-- ==============================================================================
-- 09. SEED MADHURAWADA SUB-LOCALITIES
-- ==============================================================================

DO $$
DECLARE
    vzg_city_id UUID;
    madhurawada_loc_id UUID;
    sub_loc_id UUID;
    sub_loc RECORD;
BEGIN
    -- 1. Get the City ID
    SELECT id INTO vzg_city_id FROM geo.cities WHERE name = 'Visakhapatnam' LIMIT 1;
    
    -- 2. Get the Madhurawada Locality ID
    SELECT id INTO madhurawada_loc_id FROM geo.localities WHERE name = 'Madhurawada' AND city_id = vzg_city_id LIMIT 1;
    
    IF madhurawada_loc_id IS NULL THEN
        RAISE EXCEPTION 'Madhurawada locality not found. Please run previous seed scripts.';
    END IF;

    -- 3. Loop through Madhurawada Sub-Localities
    FOR sub_loc IN SELECT * FROM (VALUES 
        ('Kommadi', 'కొమ్మాది', 17.8385, 83.3512, 85),
        ('Bakkannapalem', 'బక్కన్నపాలెం', 17.8180, 83.3361, 80),
        ('Chandrampalem', 'చంద్రంపాలెం', 17.8245, 83.3410, 75),
        ('Revallapalem', 'రేవల్లపాలెం', 17.8112, 83.3551, 70),
        ('Srinivasa Nagar', 'శ్రీనివాస నగర్', 17.8220, 83.3485, 82),
        ('Marikavalasa', 'మరికావలస', 17.8481, 83.3423, 78),
        ('Midhilapuri Vuda Colony', 'మిధిలాపురి వుడా కాలనీ', 17.8295, 83.3440, 90),
        ('Car Shed Junction', 'కార్ షెడ్ జంక్షన్', 17.8105, 83.3350, 88)
    ) AS t(name, name_te, lat, lon, popularity)
    LOOP
        -- Check if it already exists to prevent duplicates
        SELECT id INTO sub_loc_id FROM geo.sub_localities WHERE name = sub_loc.name AND locality_id = madhurawada_loc_id;
        
        IF sub_loc_id IS NULL THEN
            -- Insert into geo.sub_localities
            INSERT INTO geo.sub_localities (locality_id, name, center_point, translations)
            VALUES (
                madhurawada_loc_id, 
                sub_loc.name, 
                ST_SetSRID(ST_MakePoint(sub_loc.lon, sub_loc.lat), 4326),
                jsonb_build_object('te', sub_loc.name_te)
            )
            RETURNING id INTO sub_loc_id;
            
            -- Insert into search.locations for autocomplete search
            INSERT INTO search.locations (
                entity_id, 
                entity_type, 
                display_name, 
                search_text, 
                center_point, 
                popularity_score
            )
            VALUES (
                sub_loc_id, 
                'sub_locality', 
                sub_loc.name || ', Madhurawada, Visakhapatnam', 
                sub_loc.name || ' ' || sub_loc.name_te, 
                ST_SetSRID(ST_MakePoint(sub_loc.lon, sub_loc.lat), 4326), 
                sub_loc.popularity
            );
        END IF;
    END LOOP;
END $$;
