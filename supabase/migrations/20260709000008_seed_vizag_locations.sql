-- ==============================================================================
-- 08. SEED BULK VIZAG LOCATIONS
-- ==============================================================================

DO $$
DECLARE
    vzg_city_id UUID;
    loc_id UUID;
    -- Array of locations: name, name_te, lat, lon
    loc RECORD;
BEGIN
    -- Get the Visakhapatnam City ID from the previous seed
    SELECT id INTO vzg_city_id FROM geo.cities WHERE name = 'Visakhapatnam' LIMIT 1;
    
    IF vzg_city_id IS NULL THEN
        RAISE EXCEPTION 'Visakhapatnam city not found. Please run 07_seed_data.sql first.';
    END IF;

    -- Iterate over the locations we generated
    FOR loc IN SELECT * FROM (VALUES 
        ('Madhurawada', 'మధురవాడ', 17.8205, 83.3421, 95),
        ('MVP Colony', 'ఎం.వి.పి కాలనీ', 17.7441, 83.3312, 98),
        ('Gajuwaka', 'గాజువాక', 17.6917, 83.1755, 90),
        ('Rushikonda', 'రుషికొండ', 17.7801, 83.3855, 85),
        ('Seethammadhara', 'సీతమ్మధార', 17.7380, 83.3150, 88),
        ('Bheemili', 'భీమిలి', 17.8885, 83.4475, 75),
        ('Pendurthi', 'పెందుర్తి', 17.8097, 83.2081, 82),
        ('PM Palem', 'పి.ఎం.పాలెం', 17.7963, 83.3465, 89),
        ('Akkayyapalem', 'అక్కయ్యపాలెం', 17.7291, 83.3039, 86),
        ('NAD X Road', 'ఎన్.ఎ.డి. క్రాస్ రోడ్స్', 17.7470, 83.2201, 91),
        ('Yendada', 'ఎండాడ', 17.7651, 83.3512, 87),
        ('Muralinagar', 'మురళీనగర్', 17.7547, 83.2458, 80),
        ('Kancharapalem', 'కంచరపాలెం', 17.7279, 83.2758, 79),
        ('Kurmannapalem', 'కూర్మన్నపాలెం', 17.6521, 83.1610, 78),
        ('Siripuram', 'సిరిపురం', 17.7188, 83.3217, 94),
        ('Dwaraka Nagar', 'ద్వారకానగర్', 17.7262, 83.3033, 96),
        ('Sagar Nagar', 'సాగర్ నగర్', 17.7600, 83.3582, 83),
        ('Kapuluppada', 'కాపులుప్పాడ', 17.8540, 83.3850, 70),
        ('Thagarapuvalasa', 'తగరపువలస', 17.9155, 83.4243, 72),
        ('Sujatha Nagar', 'సుజాతానగర్', 17.7818, 83.2201, 81)
    ) AS t(name, name_te, lat, lon, popularity)
    LOOP
        -- 1. Insert into geo.localities, ignoring if it already exists (by name)
        -- To prevent duplicates since Madhurawada and MVP were in seed 07, we check first
        SELECT id INTO loc_id FROM geo.localities WHERE name = loc.name AND city_id = vzg_city_id;
        
        IF loc_id IS NULL THEN
            INSERT INTO geo.localities (city_id, name, center_point, translations)
            VALUES (
                vzg_city_id, 
                loc.name, 
                ST_SetSRID(ST_MakePoint(loc.lon, loc.lat), 4326),
                jsonb_build_object('te', loc.name_te)
            )
            RETURNING id INTO loc_id;
            
            -- 2. Insert into the optimized search.locations table
            INSERT INTO search.locations (
                entity_id, 
                entity_type, 
                display_name, 
                search_text, 
                center_point, 
                popularity_score
            )
            VALUES (
                loc_id, 
                'locality', 
                loc.name || ', Visakhapatnam', 
                loc.name || ' ' || loc.name_te, -- Allow searching by English or Telugu
                ST_SetSRID(ST_MakePoint(loc.lon, loc.lat), 4326), 
                loc.popularity
            );
        END IF;
    END LOOP;
END $$;
