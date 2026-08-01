-- BULK OSM DATA SEED PART 6
DO $$
DECLARE
    vzg_city_id UUID;
    new_loc_id UUID;
BEGIN
    SELECT id INTO vzg_city_id FROM geo.cities WHERE name = 'Visakhapatnam' LIMIT 1;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.0141937, 17.6869908), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.0141937, 17.6869908), 4326), 10);
    END IF;
    -- Insert Coastal Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Coastal Bank', ST_SetSRID(ST_MakePoint(83.014294, 17.6869554), 4326), '{"C234, KSTL BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Coastal Bank, Visakhapatnam', 'Coastal Bank  C234, KSTL BNK', ST_SetSRID(ST_MakePoint(83.014294, 17.6869554), 4326), 10);
    END IF;
    -- Insert DCB Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'DCB Bank', ST_SetSRID(ST_MakePoint(83.0158093, 17.6873125), 4326), '{"TKB BNK, D211"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'DCB Bank, Visakhapatnam', 'DCB Bank  TKB BNK, D211', ST_SetSRID(ST_MakePoint(83.0158093, 17.6873125), 4326), 10);
    END IF;
    -- Insert Maharaja Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maharaja Bank', ST_SetSRID(ST_MakePoint(83.0151347, 17.6874301), 4326), '{"MHRJ BNK, M621"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maharaja Bank, Visakhapatnam', 'Maharaja Bank  MHRJ BNK, M621', ST_SetSRID(ST_MakePoint(83.0151347, 17.6874301), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.0119002, 17.6874081), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.0119002, 17.6874081), 4326), 10);
    END IF;
    -- Insert Geetha Eye & Orthopaedic Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Geetha Eye & Orthopaedic Hospital', ST_SetSRID(ST_MakePoint(83.0127619, 17.6872398), 4326), '{"G363, J0 EY OR0PTK HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Geetha Eye & Orthopaedic Hospital, Visakhapatnam', 'Geetha Eye & Orthopaedic Hospital  G363, J0 EY OR0PTK HSPTL', ST_SetSRID(ST_MakePoint(83.0127619, 17.6872398), 4326), 50);
    END IF;
    -- Insert Raanos (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Raanos', ST_SetSRID(ST_MakePoint(83.2242472, 17.7277306), 4326), '{"RNS, R520"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Raanos, Visakhapatnam', 'Raanos  RNS, R520', ST_SetSRID(ST_MakePoint(83.2242472, 17.7277306), 4326), 10);
    END IF;
    -- Insert seekupanasa (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'seekupanasa', ST_SetSRID(ST_MakePoint(82.827472, 17.9698385), 4326), '{"S215, SKPNS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'seekupanasa, Visakhapatnam', 'seekupanasa  S215, SKPNS', ST_SetSRID(ST_MakePoint(82.827472, 17.9698385), 4326), 10);
    END IF;
    -- Insert Tolugurupadu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tolugurupadu', ST_SetSRID(ST_MakePoint(82.8167527, 18.0402185), 4326), '{"T426, TLKRPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tolugurupadu, Visakhapatnam', 'Tolugurupadu  T426, TLKRPT', ST_SetSRID(ST_MakePoint(82.8167527, 18.0402185), 4326), 10);
    END IF;
    -- Insert Seekaipadu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Seekaipadu', ST_SetSRID(ST_MakePoint(82.8262162, 17.9702231), 4326), '{"SKPT, S213"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Seekaipadu, Visakhapatnam', 'Seekaipadu  SKPT, S213', ST_SetSRID(ST_MakePoint(82.8262162, 17.9702231), 4326), 10);
    END IF;
    -- Insert Pippalamamidi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pippalamamidi', ST_SetSRID(ST_MakePoint(82.8022603, 18.0141901), 4326), '{"PPLMMT, P145"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pippalamamidi, Visakhapatnam', 'Pippalamamidi  PPLMMT, P145', ST_SetSRID(ST_MakePoint(82.8022603, 18.0141901), 4326), 10);
    END IF;
    -- Insert Jarragaruvu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jarragaruvu', ST_SetSRID(ST_MakePoint(82.8137019, 17.9763697), 4326), '{"J626, JRKRF"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jarragaruvu, Visakhapatnam', 'Jarragaruvu  J626, JRKRF', ST_SetSRID(ST_MakePoint(82.8137019, 17.9763697), 4326), 10);
    END IF;
    -- Insert Janagadapalli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Janagadapalli', ST_SetSRID(ST_MakePoint(82.806687, 18.0283825), 4326), '{"JNKTPL, J523"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Janagadapalli, Visakhapatnam', 'Janagadapalli  JNKTPL, J523', ST_SetSRID(ST_MakePoint(82.806687, 18.0283825), 4326), 10);
    END IF;
    -- Insert Goppulapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Goppulapalem', ST_SetSRID(ST_MakePoint(82.803972, 18.0042256), 4326), '{"KPLPLM, G141"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Goppulapalem, Visakhapatnam', 'Goppulapalem  KPLPLM, G141', ST_SetSRID(ST_MakePoint(82.803972, 18.0042256), 4326), 10);
    END IF;
    -- Insert Gadilametta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gadilametta', ST_SetSRID(ST_MakePoint(82.8362751, 17.9817758), 4326), '{"G345, KTLMT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gadilametta, Visakhapatnam', 'Gadilametta  G345, KTLMT', ST_SetSRID(ST_MakePoint(82.8362751, 17.9817758), 4326), 10);
    END IF;
    -- Insert Gaddibanda (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gaddibanda', ST_SetSRID(ST_MakePoint(82.8190391, 18.044236), 4326), '{"KTBNT, G315"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gaddibanda, Visakhapatnam', 'Gaddibanda  KTBNT, G315', ST_SetSRID(ST_MakePoint(82.8190391, 18.044236), 4326), 10);
    END IF;
    -- Insert Dabbagaruvu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dabbagaruvu', ST_SetSRID(ST_MakePoint(82.8056725, 18.0082625), 4326), '{"TBKRF, D126"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dabbagaruvu, Visakhapatnam', 'Dabbagaruvu  TBKRF, D126', ST_SetSRID(ST_MakePoint(82.8056725, 18.0082625), 4326), 10);
    END IF;
    -- Insert solabangu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'solabangu', ST_SetSRID(ST_MakePoint(82.9263965, 18.0633895), 4326), '{"SLBNK, S415"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'solabangu, Visakhapatnam', 'solabangu  SLBNK, S415', ST_SetSRID(ST_MakePoint(82.9263965, 18.0633895), 4326), 10);
    END IF;
    -- Insert TenkubuddI (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'TenkubuddI', ST_SetSRID(ST_MakePoint(82.959407, 18.0290174), 4326), '{"TNKBT, T521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'TenkubuddI, Visakhapatnam', 'TenkubuddI  TNKBT, T521', ST_SetSRID(ST_MakePoint(82.959407, 18.0290174), 4326), 10);
    END IF;
    -- Insert Tattapudi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tattapudi', ST_SetSRID(ST_MakePoint(83.011748, 18.0891042), 4326), '{"TTPT, T313"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tattapudi, Visakhapatnam', 'Tattapudi  TTPT, T313', ST_SetSRID(ST_MakePoint(83.011748, 18.0891042), 4326), 10);
    END IF;
    -- Insert Sukuduputtu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sukuduputtu', ST_SetSRID(ST_MakePoint(82.9157019, 18.0487724), 4326), '{"S231, SKTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sukuduputtu, Visakhapatnam', 'Sukuduputtu  S231, SKTPT', ST_SetSRID(ST_MakePoint(82.9157019, 18.0487724), 4326), 10);
    END IF;
    -- Insert Rachakilam (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rachakilam', ST_SetSRID(ST_MakePoint(82.9126652, 18.0524846), 4326), '{"RXKLM, R224"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rachakilam, Visakhapatnam', 'Rachakilam  RXKLM, R224', ST_SetSRID(ST_MakePoint(82.9126652, 18.0524846), 4326), 10);
    END IF;
    -- Insert Porlubanda (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Porlubanda', ST_SetSRID(ST_MakePoint(82.9464477, 18.0630861), 4326), '{"P641, PRLBNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Porlubanda, Visakhapatnam', 'Porlubanda  P641, PRLBNT', ST_SetSRID(ST_MakePoint(82.9464477, 18.0630861), 4326), 10);
    END IF;
    -- Insert Pedaburugu-II (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedaburugu-II', ST_SetSRID(ST_MakePoint(82.998738, 18.0566768), 4326), '{"P316, PTBRK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedaburugu-II, Visakhapatnam', 'Pedaburugu-II  P316, PTBRK', ST_SetSRID(ST_MakePoint(82.998738, 18.0566768), 4326), 10);
    END IF;
    -- Insert Makanapalle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Makanapalle', ST_SetSRID(ST_MakePoint(82.8989784, 18.0428639), 4326), '{"MKNPL, M251"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Makanapalle, Visakhapatnam', 'Makanapalle  MKNPL, M251', ST_SetSRID(ST_MakePoint(82.8989784, 18.0428639), 4326), 10);
    END IF;
    -- Insert Kothavuru (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kothavuru', ST_SetSRID(ST_MakePoint(82.8505281, 18.0620073), 4326), '{"K316, K0FR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kothavuru, Visakhapatnam', 'Kothavuru  K316, K0FR', ST_SetSRID(ST_MakePoint(82.8505281, 18.0620073), 4326), 10);
    END IF;
    -- Insert Katikamamidi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Katikamamidi', ST_SetSRID(ST_MakePoint(82.9505936, 18.0420723), 4326), '{"K325, KTKMMT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Katikamamidi, Visakhapatnam', 'Katikamamidi  K325, KTKMMT', ST_SetSRID(ST_MakePoint(82.9505936, 18.0420723), 4326), 10);
    END IF;
    -- Insert Gujjali (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gujjali', ST_SetSRID(ST_MakePoint(82.8997125, 18.0809168), 4326), '{"G240, KJL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gujjali, Visakhapatnam', 'Gujjali  G240, KJL', ST_SetSRID(ST_MakePoint(82.8997125, 18.0809168), 4326), 10);
    END IF;
    -- Insert Goddumamidi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Goddumamidi', ST_SetSRID(ST_MakePoint(82.8256854, 18.0991761), 4326), '{"G355, KTMMT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Goddumamidi, Visakhapatnam', 'Goddumamidi  G355, KTMMT', ST_SetSRID(ST_MakePoint(82.8256854, 18.0991761), 4326), 10);
    END IF;
    -- Insert Chindugulapadu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chindugulapadu', ST_SetSRID(ST_MakePoint(82.9160582, 18.0607995), 4326), '{"C532, XNTKLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chindugulapadu, Visakhapatnam', 'Chindugulapadu  C532, XNTKLPT', ST_SetSRID(ST_MakePoint(82.9160582, 18.0607995), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3023497, 17.7262946), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3023497, 17.7262946), 4326), 10);
    END IF;
    -- Insert Helapuri Restaurant & Buffet (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Helapuri Restaurant & Buffet', ST_SetSRID(ST_MakePoint(83.3028774, 17.7262423), 4326), '{"HLPR RSTRNT BFT, H416"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Helapuri Restaurant & Buffet, Visakhapatnam', 'Helapuri Restaurant & Buffet  HLPR RSTRNT BFT, H416', ST_SetSRID(ST_MakePoint(83.3028774, 17.7262423), 4326), 10);
    END IF;
    -- Insert Kotak Mahindra Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotak Mahindra Bank', ST_SetSRID(ST_MakePoint(83.3018316, 17.7268441), 4326), '{"K325, KTK MHNTR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotak Mahindra Bank, Visakhapatnam', 'Kotak Mahindra Bank  K325, KTK MHNTR BNK', ST_SetSRID(ST_MakePoint(83.3018316, 17.7268441), 4326), 10);
    END IF;
    -- Insert Bal Vikasa Foundation Bridge School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bal Vikasa Foundation Bridge School', ST_SetSRID(ST_MakePoint(83.3015825, 17.6995098), 4326), '{"B412, BL FKS FNTXN BRJ SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bal Vikasa Foundation Bridge School, Visakhapatnam', 'Bal Vikasa Foundation Bridge School  B412, BL FKS FNTXN BRJ SXL', ST_SetSRID(ST_MakePoint(83.3015825, 17.6995098), 4326), 50);
    END IF;
    -- Insert Sri Basara Junior College (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Basara Junior College', ST_SetSRID(ST_MakePoint(83.3006752, 17.7347281), 4326), '{"SR BSR JNR KLJ, S612"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Basara Junior College, Visakhapatnam', 'Sri Basara Junior College  SR BSR JNR KLJ, S612', ST_SetSRID(ST_MakePoint(83.3006752, 17.7347281), 4326), 50);
    END IF;
    -- Insert Annapurna Bhojanalayam (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Annapurna Bhojanalayam', ST_SetSRID(ST_MakePoint(83.2990023, 17.7263411), 4326), '{"ANPRN BHJNLYM, A516"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Annapurna Bhojanalayam, Visakhapatnam', 'Annapurna Bhojanalayam  ANPRN BHJNLYM, A516', ST_SetSRID(ST_MakePoint(83.2990023, 17.7263411), 4326), 10);
    END IF;
    -- Insert Chutneys (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chutneys', ST_SetSRID(ST_MakePoint(83.3009483, 17.7272525), 4326), '{"XTNS, C352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chutneys, Visakhapatnam', 'Chutneys  XTNS, C352', ST_SetSRID(ST_MakePoint(83.3009483, 17.7272525), 4326), 10);
    END IF;
    -- Insert Chittibabu Kodi Pulav (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chittibabu Kodi Pulav', ST_SetSRID(ST_MakePoint(83.3010795, 17.7272568), 4326), '{"XTBB KT PLF, C311"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chittibabu Kodi Pulav, Visakhapatnam', 'Chittibabu Kodi Pulav  XTBB KT PLF, C311', ST_SetSRID(ST_MakePoint(83.3010795, 17.7272568), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.2987351, 17.7273649), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.2987351, 17.7273649), 4326), 10);
    END IF;
    -- Insert IDFC First Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IDFC First Bank', ST_SetSRID(ST_MakePoint(83.2985006, 17.7274), 4326), '{"ITFK FRST BNK, I312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IDFC First Bank, Visakhapatnam', 'IDFC First Bank  ITFK FRST BNK, I312', ST_SetSRID(ST_MakePoint(83.2985006, 17.7274), 4326), 10);
    END IF;
    -- Insert Waltair Mess (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Waltair Mess', ST_SetSRID(ST_MakePoint(83.2980514, 17.7274878), 4326), '{"W436, WLTR MS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Waltair Mess, Visakhapatnam', 'Waltair Mess  W436, WLTR MS', ST_SetSRID(ST_MakePoint(83.2980514, 17.7274878), 4326), 10);
    END IF;
    -- Insert Rajugari Vindhu (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajugari Vindhu', ST_SetSRID(ST_MakePoint(83.2993587, 17.7296691), 4326), '{"RJKR FNTH, R226"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajugari Vindhu, Visakhapatnam', 'Rajugari Vindhu  RJKR FNTH, R226', ST_SetSRID(ST_MakePoint(83.2993587, 17.7296691), 4326), 10);
    END IF;
    -- Insert Federal Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Federal Bank', ST_SetSRID(ST_MakePoint(83.2991694, 17.7321355), 4326), '{"FTRL BNK, F364"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Federal Bank, Visakhapatnam', 'Federal Bank  FTRL BNK, F364', ST_SetSRID(ST_MakePoint(83.2991694, 17.7321355), 4326), 10);
    END IF;
    -- Insert Food World (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Food World', ST_SetSRID(ST_MakePoint(83.318272, 17.7120377), 4326), '{"FT WRLT, F364"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Food World, Visakhapatnam', 'Food World  FT WRLT, F364', ST_SetSRID(ST_MakePoint(83.318272, 17.7120377), 4326), 10);
    END IF;
    -- Insert Mayuri Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mayuri Restaurant', ST_SetSRID(ST_MakePoint(83.3182333, 17.7119971), 4326), '{"M662, MYR RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mayuri Restaurant, Visakhapatnam', 'Mayuri Restaurant  M662, MYR RSTRNT', ST_SetSRID(ST_MakePoint(83.3182333, 17.7119971), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.3176353, 17.7115311), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.3176353, 17.7115311), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.2511169, 17.7499484), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.2511169, 17.7499484), 4326), 10);
    END IF;
    -- Insert Sri Gayatri Vidya Nilayam (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Gayatri Vidya Nilayam', ST_SetSRID(ST_MakePoint(83.2513306, 17.7499395), 4326), '{"SR KYTR FTY NLYM, S623"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Gayatri Vidya Nilayam, Visakhapatnam', 'Sri Gayatri Vidya Nilayam  SR KYTR FTY NLYM, S623', ST_SetSRID(ST_MakePoint(83.2513306, 17.7499395), 4326), 50);
    END IF;
    -- Insert K4 Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'K4 Restaurant', ST_SetSRID(ST_MakePoint(83.2514842, 17.7501841), 4326), '{"K RSTRNT, K623"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'K4 Restaurant, Visakhapatnam', 'K4 Restaurant  K RSTRNT, K623', ST_SetSRID(ST_MakePoint(83.2514842, 17.7501841), 4326), 10);
    END IF;
    -- Insert PEN School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'PEN School', ST_SetSRID(ST_MakePoint(83.2525354, 17.7497761), 4326), '{"PN SXL, P524"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'PEN School, Visakhapatnam', 'PEN School  PN SXL, P524', ST_SetSRID(ST_MakePoint(83.2525354, 17.7497761), 4326), 50);
    END IF;
    -- Insert Indian Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Bank', ST_SetSRID(ST_MakePoint(83.2528057, 17.7497777), 4326), '{"I535, INTN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Bank, Visakhapatnam', 'Indian Bank  I535, INTN BNK', ST_SetSRID(ST_MakePoint(83.2528057, 17.7497777), 4326), 10);
    END IF;
    -- Insert Pulka & Chapathi (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pulka & Chapathi', ST_SetSRID(ST_MakePoint(83.2541829, 17.7497669), 4326), '{"PLK XP0, P422"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pulka & Chapathi, Visakhapatnam', 'Pulka & Chapathi  PLK XP0, P422', ST_SetSRID(ST_MakePoint(83.2541829, 17.7497669), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2558911, 17.7493389), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2558911, 17.7493389), 4326), 10);
    END IF;
    -- Insert New Ram Sai Parlour (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'New Ram Sai Parlour', ST_SetSRID(ST_MakePoint(83.2563646, 17.7494834), 4326), '{"N RM S PRLR, N652"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'New Ram Sai Parlour, Visakhapatnam', 'New Ram Sai Parlour  N RM S PRLR, N652', ST_SetSRID(ST_MakePoint(83.2563646, 17.7494834), 4326), 10);
    END IF;
    -- Insert New Ram Sai Pure Veg Corner (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'New Ram Sai Pure Veg Corner', ST_SetSRID(ST_MakePoint(83.2563364, 17.7492383), 4326), '{"N652, N RM S PR FK KRNR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'New Ram Sai Pure Veg Corner, Visakhapatnam', 'New Ram Sai Pure Veg Corner  N652, N RM S PR FK KRNR', ST_SetSRID(ST_MakePoint(83.2563364, 17.7492383), 4326), 10);
    END IF;
    -- Insert NNN Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'NNN Restaurant', ST_SetSRID(ST_MakePoint(82.9824986, 17.9904975), 4326), '{"N623, N RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'NNN Restaurant, Visakhapatnam', 'NNN Restaurant  N623, N RSTRNT', ST_SetSRID(ST_MakePoint(82.9824986, 17.9904975), 4326), 10);
    END IF;
    -- Insert Andhra Pradesh Grameena Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Andhra Pradesh Grameena Bank', ST_SetSRID(ST_MakePoint(82.9819621, 17.9905481), 4326), '{"ANTHR PRTX KRMN BNK, A536"}', jsonb_build_object('te', 'ఆంధ్ర‌ప్ర‌దేశ్ గ్రామీణ బ్యాంక్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Andhra Pradesh Grameena Bank, Visakhapatnam', 'Andhra Pradesh Grameena Bank ఆంధ్ర‌ప్ర‌దేశ్ గ్రామీణ బ్యాంక్ ANTHR PRTX KRMN BNK, A536', ST_SetSRID(ST_MakePoint(82.9819621, 17.9905481), 4326), 10);
    END IF;
    -- Insert Bojana Hotel Biryani (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bojana Hotel Biryani', ST_SetSRID(ST_MakePoint(82.9817486, 17.9905481), 4326), '{"B253, BJN HTL BRYN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bojana Hotel Biryani, Visakhapatnam', 'Bojana Hotel Biryani  B253, BJN HTL BRYN', ST_SetSRID(ST_MakePoint(82.9817486, 17.9905481), 4326), 10);
    END IF;
    -- Insert UCO Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'UCO Bank', ST_SetSRID(ST_MakePoint(82.9813937, 17.9906378), 4326), '{"U215, UK BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'UCO Bank, Visakhapatnam', 'UCO Bank  U215, UK BNK', ST_SetSRID(ST_MakePoint(82.9813937, 17.9906378), 4326), 10);
    END IF;
    -- Insert Kollivanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kollivanipalem', ST_SetSRID(ST_MakePoint(82.9704871, 17.9756172), 4326), '{"KLFNPLM, K415"}', jsonb_build_object('te', 'కొల్లివానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kollivanipalem, Visakhapatnam', 'Kollivanipalem కొల్లివానిపాలెం KLFNPLM, K415', ST_SetSRID(ST_MakePoint(82.9704871, 17.9756172), 4326), 10);
    END IF;
    -- Insert G.N. Raju Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'G.N. Raju Restaurant', ST_SetSRID(ST_MakePoint(83.3499503, 17.7523403), 4326), '{"G562, KN RJ RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'G.N. Raju Restaurant, Visakhapatnam', 'G.N. Raju Restaurant  G562, KN RJ RSTRNT', ST_SetSRID(ST_MakePoint(83.3499503, 17.7523403), 4326), 10);
    END IF;
    -- Insert Primary Health Center Kothavalasa (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Primary Health Center Kothavalasa', ST_SetSRID(ST_MakePoint(83.1897275, 17.900578), 4326), '{"P656, PRMR HL0 SNTR K0FLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Primary Health Center Kothavalasa, Visakhapatnam', 'Primary Health Center Kothavalasa  P656, PRMR HL0 SNTR K0FLS', ST_SetSRID(ST_MakePoint(83.1897275, 17.900578), 4326), 50);
    END IF;
    -- Insert Anna Canteen (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Anna Canteen', ST_SetSRID(ST_MakePoint(83.0083434, 17.6941843), 4326), '{"AN KNTN, A525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Anna Canteen, Visakhapatnam', 'Anna Canteen  AN KNTN, A525', ST_SetSRID(ST_MakePoint(83.0083434, 17.6941843), 4326), 10);
    END IF;
    -- Insert Vantashala (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vantashala', ST_SetSRID(ST_MakePoint(83.3047515, 17.7173952), 4326), '{"FNTXL, V532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vantashala, Visakhapatnam', 'Vantashala  FNTXL, V532', ST_SetSRID(ST_MakePoint(83.3047515, 17.7173952), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.3041332, 17.7161668), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.3041332, 17.7161668), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3100329, 17.745721), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3100329, 17.745721), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3224444, 17.7356397), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3224444, 17.7356397), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.309865, 17.72781), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.309865, 17.72781), 4326), 10);
    END IF;
    -- Insert Kandhari (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kandhari', ST_SetSRID(ST_MakePoint(83.3274557, 17.7166455), 4326), '{"K536, KNTHR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kandhari, Visakhapatnam', 'Kandhari  K536, KNTHR', ST_SetSRID(ST_MakePoint(83.3274557, 17.7166455), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.3250164, 17.7160243), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.3250164, 17.7160243), 4326), 10);
    END IF;
    -- Insert Union Bank Of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank Of India', ST_SetSRID(ST_MakePoint(83.2506607, 17.746879), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank Of India, Visakhapatnam', 'Union Bank Of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.2506607, 17.746879), 4326), 10);
    END IF;
    -- Insert PEN School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'PEN School', ST_SetSRID(ST_MakePoint(83.3011546, 17.7149959), 4326), '{"PN SXL, P524"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'PEN School, Visakhapatnam', 'PEN School  PN SXL, P524', ST_SetSRID(ST_MakePoint(83.3011546, 17.7149959), 4326), 50);
    END IF;
    -- Insert Rasora Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rasora Restaurant', ST_SetSRID(ST_MakePoint(83.3010341, 17.7149245), 4326), '{"RSR RSTRNT, R266"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rasora Restaurant, Visakhapatnam', 'Rasora Restaurant  RSR RSTRNT, R266', ST_SetSRID(ST_MakePoint(83.3010341, 17.7149245), 4326), 10);
    END IF;
    -- Insert IDBI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IDBI Bank', ST_SetSRID(ST_MakePoint(83.3008734, 17.7147906), 4326), '{"ITB BNK, I311"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IDBI Bank, Visakhapatnam', 'IDBI Bank  ITB BNK, I311', ST_SetSRID(ST_MakePoint(83.3008734, 17.7147906), 4326), 10);
    END IF;
    -- Insert Punjab National Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Punjab National Bank', ST_SetSRID(ST_MakePoint(83.3010632, 17.7144083), 4326), '{"PNJB NXNL BNK, P521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Punjab National Bank, Visakhapatnam', 'Punjab National Bank  PNJB NXNL BNK, P521', ST_SetSRID(ST_MakePoint(83.3010632, 17.7144083), 4326), 10);
    END IF;
    -- Insert Alakpuri Family Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Alakpuri Family Restaurant', ST_SetSRID(ST_MakePoint(83.3008151, 17.7141827), 4326), '{"ALKPR FML RSTRNT, A421"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Alakpuri Family Restaurant, Visakhapatnam', 'Alakpuri Family Restaurant  ALKPR FML RSTRNT, A421', ST_SetSRID(ST_MakePoint(83.3008151, 17.7141827), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.3007919, 17.7142245), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.3007919, 17.7142245), 4326), 10);
    END IF;
    -- Insert Mahadev Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mahadev Restaurant', ST_SetSRID(ST_MakePoint(83.2991628, 17.7149675), 4326), '{"M316, MHTF RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mahadev Restaurant, Visakhapatnam', 'Mahadev Restaurant  M316, MHTF RSTRNT', ST_SetSRID(ST_MakePoint(83.2991628, 17.7149675), 4326), 10);
    END IF;
    -- Insert Tamilnad Mercantile Bank Limited (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tamilnad Mercantile Bank Limited', ST_SetSRID(ST_MakePoint(83.30041, 17.7149487), 4326), '{"TMLNT MRKNTL BNK LMTT, T545"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tamilnad Mercantile Bank Limited, Visakhapatnam', 'Tamilnad Mercantile Bank Limited  TMLNT MRKNTL BNK LMTT, T545', ST_SetSRID(ST_MakePoint(83.30041, 17.7149487), 4326), 10);
    END IF;
    -- Insert Andhra Pradesh Grammena Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Andhra Pradesh Grammena Bank', ST_SetSRID(ST_MakePoint(83.3003483, 17.714951), 4326), '{"ANTHR PRTX KRMN BNK, A536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Andhra Pradesh Grammena Bank, Visakhapatnam', 'Andhra Pradesh Grammena Bank  ANTHR PRTX KRMN BNK, A536', ST_SetSRID(ST_MakePoint(83.3003483, 17.714951), 4326), 10);
    END IF;
    -- Insert Tamilnad Mercantile Bank Limited (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tamilnad Mercantile Bank Limited', ST_SetSRID(ST_MakePoint(83.3006681, 17.7149866), 4326), '{"TMLNT MRKNTL BNK LMTT, T545"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tamilnad Mercantile Bank Limited, Visakhapatnam', 'Tamilnad Mercantile Bank Limited  TMLNT MRKNTL BNK LMTT, T545', ST_SetSRID(ST_MakePoint(83.3006681, 17.7149866), 4326), 10);
    END IF;
    -- Insert Vijaya Luke College Of Nursing (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijaya Luke College Of Nursing', ST_SetSRID(ST_MakePoint(83.3002167, 17.7151867), 4326), '{"FJY LK KLJ OF NRSNK, V242"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijaya Luke College Of Nursing, Visakhapatnam', 'Vijaya Luke College Of Nursing  FJY LK KLJ OF NRSNK, V242', ST_SetSRID(ST_MakePoint(83.3002167, 17.7151867), 4326), 50);
    END IF;
    -- Insert P.E.N. School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'P.E.N. School', ST_SetSRID(ST_MakePoint(83.3008254, 17.7157107), 4326), '{"PN SXL, P524"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'P.E.N. School, Visakhapatnam', 'P.E.N. School  PN SXL, P524', ST_SetSRID(ST_MakePoint(83.3008254, 17.7157107), 4326), 50);
    END IF;
    -- Insert Tarluvada SC Colony (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tarluvada SC Colony', ST_SetSRID(ST_MakePoint(83.3277092, 17.8957746), 4326), '{"T641, TRLFT SK KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tarluvada SC Colony, Visakhapatnam', 'Tarluvada SC Colony  T641, TRLFT SK KLN', ST_SetSRID(ST_MakePoint(83.3277092, 17.8957746), 4326), 10);
    END IF;
    -- Insert Manyapuchintuva (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Manyapuchintuva', ST_SetSRID(ST_MakePoint(82.9326341, 17.4793958), 4326), '{"MNYPXNTF, M512"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Manyapuchintuva, Visakhapatnam', 'Manyapuchintuva  MNYPXNTF, M512', ST_SetSRID(ST_MakePoint(82.9326341, 17.4793958), 4326), 40);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.3234133, 17.7408413), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.3234133, 17.7408413), 4326), 10);
    END IF;
    -- Insert Woodpeta (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Woodpeta', ST_SetSRID(ST_MakePoint(83.0079451, 17.6925811), 4326), '{"WTPT, W313"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Woodpeta, Visakhapatnam', 'Woodpeta  WTPT, W313', ST_SetSRID(ST_MakePoint(83.0079451, 17.6925811), 4326), 60);
    END IF;
    -- Insert Gavarapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gavarapalem', ST_SetSRID(ST_MakePoint(83.0125698, 17.6911204), 4326), '{"KFRPLM, G161"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gavarapalem, Visakhapatnam', 'Gavarapalem  KFRPLM, G161', ST_SetSRID(ST_MakePoint(83.0125698, 17.6911204), 4326), 60);
    END IF;
    -- Insert Arundhathi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Arundhathi Nagar', ST_SetSRID(ST_MakePoint(83.0167817, 17.6840276), 4326), '{"ARNTH0 NKR, A653"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Arundhathi Nagar, Visakhapatnam', 'Arundhathi Nagar  ARNTH0 NKR, A653', ST_SetSRID(ST_MakePoint(83.0167817, 17.6840276), 4326), 60);
    END IF;
    -- Insert Niddanam Doddi (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Niddanam Doddi', ST_SetSRID(ST_MakePoint(83.0121326, 17.6939891), 4326), '{"N355, NTNM TT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Niddanam Doddi, Visakhapatnam', 'Niddanam Doddi  N355, NTNM TT', ST_SetSRID(ST_MakePoint(83.0121326, 17.6939891), 4326), 60);
    END IF;
    -- Insert Sarada Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sarada Colony', ST_SetSRID(ST_MakePoint(82.9998309, 17.6844915), 4326), '{"SRT KLN, S632"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sarada Colony, Visakhapatnam', 'Sarada Colony  SRT KLN, S632', ST_SetSRID(ST_MakePoint(82.9998309, 17.6844915), 4326), 60);
    END IF;
    -- Insert Narasinga Rao Peta (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narasinga Rao Peta', ST_SetSRID(ST_MakePoint(83.0003665, 17.6916728), 4326), '{"N625, NRSNK R PT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narasinga Rao Peta, Visakhapatnam', 'Narasinga Rao Peta  N625, NRSNK R PT', ST_SetSRID(ST_MakePoint(83.0003665, 17.6916728), 4326), 60);
    END IF;
    -- Insert Gandhi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gandhi Nagar', ST_SetSRID(ST_MakePoint(82.9998506, 17.699467), 4326), '{"KNTH NKR, G535"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gandhi Nagar, Visakhapatnam', 'Gandhi Nagar  KNTH NKR, G535', ST_SetSRID(ST_MakePoint(82.9998506, 17.699467), 4326), 60);
    END IF;
    -- Insert Gundla Veedhi (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gundla Veedhi', ST_SetSRID(ST_MakePoint(83.0003029, 17.704956), 4326), '{"G534, KNTL FTH"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gundla Veedhi, Visakhapatnam', 'Gundla Veedhi  G534, KNTL FTH', ST_SetSRID(ST_MakePoint(83.0003029, 17.704956), 4326), 60);
    END IF;
    -- Insert Yeguvapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yeguvapeta', ST_SetSRID(ST_MakePoint(83.4502029, 17.8868462), 4326), '{"YKFPT, Y211"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yeguvapeta, Visakhapatnam', 'Yeguvapeta  YKFPT, Y211', ST_SetSRID(ST_MakePoint(83.4502029, 17.8868462), 4326), 10);
    END IF;
    -- Insert Konda Dabalu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Konda Dabalu', ST_SetSRID(ST_MakePoint(83.1551788, 17.9019637), 4326), '{"K533, KNT TBL"}', jsonb_build_object('te', 'కొండ డాబాలు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Konda Dabalu, Visakhapatnam', 'Konda Dabalu కొండ డాబాలు K533, KNT TBL', ST_SetSRID(ST_MakePoint(83.1551788, 17.9019637), 4326), 10);
    END IF;
    -- Insert Doctors colony park (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Doctors colony park', ST_SetSRID(ST_MakePoint(83.3165921, 17.7465662), 4326), '{"D236, TKTRS KLN PRK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Doctors colony park, Visakhapatnam', 'Doctors colony park  D236, TKTRS KLN PRK', ST_SetSRID(ST_MakePoint(83.3165921, 17.7465662), 4326), 10);
    END IF;
    -- Insert Ushodaya Junction (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ushodaya Junction', ST_SetSRID(ST_MakePoint(83.3348634, 17.7371569), 4326), '{"UXTY JNKXN, U232"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ushodaya Junction, Visakhapatnam', 'Ushodaya Junction  UXTY JNKXN, U232', ST_SetSRID(ST_MakePoint(83.3348634, 17.7371569), 4326), 60);
    END IF;
    -- Insert Darathota (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Darathota', ST_SetSRID(ST_MakePoint(83.407359, 17.893188), 4326), '{"TR0T, D633"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Darathota, Visakhapatnam', 'Darathota  TR0T, D633', ST_SetSRID(ST_MakePoint(83.407359, 17.893188), 4326), 40);
    END IF;
    -- Insert Gollapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapalem', ST_SetSRID(ST_MakePoint(83.4289579, 17.891985), 4326), '{"KLPLM, G414"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapalem, Visakhapatnam', 'Gollapalem  KLPLM, G414', ST_SetSRID(ST_MakePoint(83.4289579, 17.891985), 4326), 40);
    END IF;
    -- Insert Krishna Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Krishna Colony', ST_SetSRID(ST_MakePoint(83.4394475, 17.8935812), 4326), '{"K625, KRXN KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Krishna Colony, Visakhapatnam', 'Krishna Colony  K625, KRXN KLN', ST_SetSRID(ST_MakePoint(83.4394475, 17.8935812), 4326), 60);
    END IF;
    -- Insert Jodugullapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jodugullapalem', ST_SetSRID(ST_MakePoint(83.3492742, 17.7522343), 4326), '{"JTKLPLM, J324"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jodugullapalem, Visakhapatnam', 'Jodugullapalem  JTKLPLM, J324', ST_SetSRID(ST_MakePoint(83.3492742, 17.7522343), 4326), 10);
    END IF;
    -- Insert Simhachalam Hill (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simhachalam Hill', ST_SetSRID(ST_MakePoint(83.2482229, 17.7685338), 4326), '{"SMHXLM HL, S524"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simhachalam Hill, Visakhapatnam', 'Simhachalam Hill  SMHXLM HL, S524', ST_SetSRID(ST_MakePoint(83.2482229, 17.7685338), 4326), 40);
    END IF;
    -- Insert Pallavi Tiffin Center (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pallavi Tiffin Center', ST_SetSRID(ST_MakePoint(83.1185646, 17.7850665), 4326), '{"P413, PLF TFN SNTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pallavi Tiffin Center, Visakhapatnam', 'Pallavi Tiffin Center  P413, PLF TFN SNTR', ST_SetSRID(ST_MakePoint(83.1185646, 17.7850665), 4326), 10);
    END IF;
    -- Insert Swami Day & Night Tiffins (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Swami Day & Night Tiffins', ST_SetSRID(ST_MakePoint(83.205133, 17.8224909), 4326), '{"S535, SWM T NT TFNS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Swami Day & Night Tiffins, Visakhapatnam', 'Swami Day & Night Tiffins  S535, SWM T NT TFNS', ST_SetSRID(ST_MakePoint(83.205133, 17.8224909), 4326), 10);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.1212716, 17.7882908), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.1212716, 17.7882908), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.1235724, 17.7902129), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.1235724, 17.7902129), 4326), 10);
    END IF;
    -- Insert Adilakshmi Tiffins (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Adilakshmi Tiffins', ST_SetSRID(ST_MakePoint(83.1345562, 17.800369), 4326), '{"ATLKXM TFNS, A342"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Adilakshmi Tiffins, Visakhapatnam', 'Adilakshmi Tiffins  ATLKXM TFNS, A342', ST_SetSRID(ST_MakePoint(83.1345562, 17.800369), 4326), 10);
    END IF;
    -- Insert Yarravanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yarravanipalem', ST_SetSRID(ST_MakePoint(82.999769, 17.9158126), 4326), '{"Y615, YRFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yarravanipalem, Visakhapatnam', 'Yarravanipalem  Y615, YRFNPLM', ST_SetSRID(ST_MakePoint(82.999769, 17.9158126), 4326), 10);
    END IF;
    -- Insert Maharajupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maharajupeta', ST_SetSRID(ST_MakePoint(83.4177343, 17.9526507), 4326), '{"MHRJPT, M621"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maharajupeta, Visakhapatnam', 'Maharajupeta  MHRJPT, M621', ST_SetSRID(ST_MakePoint(83.4177343, 17.9526507), 4326), 40);
    END IF;
    -- Insert Vurukutavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vurukutavanipalem', ST_SetSRID(ST_MakePoint(83.2932142, 17.8987104), 4326), '{"V623, FRKTFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vurukutavanipalem, Visakhapatnam', 'Vurukutavanipalem  V623, FRKTFNPLM', ST_SetSRID(ST_MakePoint(83.2932142, 17.8987104), 4326), 10);
    END IF;
    -- Insert Appughar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appughar', ST_SetSRID(ST_MakePoint(83.3434105, 17.7421835), 4326), '{"APKHR, A126"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appughar, Visakhapatnam', 'Appughar  APKHR, A126', ST_SetSRID(ST_MakePoint(83.3434105, 17.7421835), 4326), 60);
    END IF;
    -- Insert Saraswathi Park (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Saraswathi Park', ST_SetSRID(ST_MakePoint(83.3002794, 17.7141847), 4326), '{"SRSW0 PRK, S623"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Saraswathi Park, Visakhapatnam', 'Saraswathi Park  SRSW0 PRK, S623', ST_SetSRID(ST_MakePoint(83.3002794, 17.7141847), 4326), 10);
    END IF;
    -- Insert Old Dairy Farm (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Old Dairy Farm', ST_SetSRID(ST_MakePoint(83.3341115, 17.7625553), 4326), '{"OLT TR FRM, O433"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Old Dairy Farm, Visakhapatnam', 'Old Dairy Farm  OLT TR FRM, O433', ST_SetSRID(ST_MakePoint(83.3341115, 17.7625553), 4326), 60);
    END IF;
    -- Insert KRM colony park (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'KRM colony park', ST_SetSRID(ST_MakePoint(83.316983, 17.7424587), 4326), '{"K652, KRM KLN PRK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'KRM colony park, Visakhapatnam', 'KRM colony park  K652, KRM KLN PRK', ST_SetSRID(ST_MakePoint(83.316983, 17.7424587), 4326), 10);
    END IF;
    -- Insert NBM Law college (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'NBM Law college', ST_SetSRID(ST_MakePoint(83.3118887, 17.7390226), 4326), '{"N154, NBM L KLJ"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'NBM Law college, Visakhapatnam', 'NBM Law college  N154, NBM L KLJ', ST_SetSRID(ST_MakePoint(83.3118887, 17.7390226), 4326), 50);
    END IF;
    -- Insert LIC Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'LIC Colony', ST_SetSRID(ST_MakePoint(83.2031778, 17.8270903), 4326), '{"L224, LK KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'LIC Colony, Visakhapatnam', 'LIC Colony  L224, LK KLN', ST_SetSRID(ST_MakePoint(83.2031778, 17.8270903), 4326), 60);
    END IF;
    -- Insert Sai Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sai Nagar', ST_SetSRID(ST_MakePoint(83.2035359, 17.8233778), 4326), '{"S NKR, S526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sai Nagar, Visakhapatnam', 'Sai Nagar  S NKR, S526', ST_SetSRID(ST_MakePoint(83.2035359, 17.8233778), 4326), 60);
    END IF;
    -- Insert MMTC Colony Park (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'MMTC Colony Park', ST_SetSRID(ST_MakePoint(83.3181993, 17.7452896), 4326), '{"M322, MTK KLN PRK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'MMTC Colony Park, Visakhapatnam', 'MMTC Colony Park  M322, MTK KLN PRK', ST_SetSRID(ST_MakePoint(83.3181993, 17.7452896), 4326), 10);
    END IF;
    -- Insert Darji Nagar (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Darji Nagar', ST_SetSRID(ST_MakePoint(82.9908955, 17.7490705), 4326), '{"D625, TRJ NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Darji Nagar, Visakhapatnam', 'Darji Nagar  D625, TRJ NKR', ST_SetSRID(ST_MakePoint(82.9908955, 17.7490705), 4326), 10);
    END IF;
    -- Insert Padmanabhaswamy Temple Hill | పద్మనాభస్వామి ఆలయం కొండ (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Padmanabhaswamy Temple Hill | పద్మనాభస్వామి ఆలయం కొండ', ST_SetSRID(ST_MakePoint(83.3282953, 17.9939916), 4326), '{"P355, PTMNBHSWM TMPL HL "}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Padmanabhaswamy Temple Hill | పద్మనాభస్వామి ఆలయం కొండ, Visakhapatnam', 'Padmanabhaswamy Temple Hill | పద్మనాభస్వామి ఆలయం కొండ  P355, PTMNBHSWM TMPL HL ', ST_SetSRID(ST_MakePoint(83.3282953, 17.9939916), 4326), 60);
    END IF;
    -- Insert Sandipini Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sandipini Nagar', ST_SetSRID(ST_MakePoint(83.3603212, 17.7832002), 4326), '{"S531, SNTPN NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sandipini Nagar, Visakhapatnam', 'Sandipini Nagar  S531, SNTPN NKR', ST_SetSRID(ST_MakePoint(83.3603212, 17.7832002), 4326), 60);
    END IF;
    -- Insert Nausena Bagh (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nausena Bagh', ST_SetSRID(ST_MakePoint(83.2558487, 17.6817208), 4326), '{"N251, NSN BKH"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nausena Bagh, Visakhapatnam', 'Nausena Bagh  N251, NSN BKH', ST_SetSRID(ST_MakePoint(83.2558487, 17.6817208), 4326), 60);
    END IF;
    -- Insert Prakash Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Prakash Nagar', ST_SetSRID(ST_MakePoint(83.2475104, 17.6782971), 4326), '{"PRKX NKR, P622"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Prakash Nagar, Visakhapatnam', 'Prakash Nagar  PRKX NKR, P622', ST_SetSRID(ST_MakePoint(83.2475104, 17.6782971), 4326), 60);
    END IF;
    -- Insert Boddimamidi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boddimamidi', ST_SetSRID(ST_MakePoint(82.8156397, 17.9095752), 4326), '{"B355, BTMMT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boddimamidi, Visakhapatnam', 'Boddimamidi  B355, BTMMT', ST_SetSRID(ST_MakePoint(82.8156397, 17.9095752), 4326), 40);
    END IF;
    -- Insert Miriyala Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Miriyala Colony', ST_SetSRID(ST_MakePoint(83.003408, 17.6935116), 4326), '{"MRYL KLN, M642"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Miriyala Colony, Visakhapatnam', 'Miriyala Colony  MRYL KLN, M642', ST_SetSRID(ST_MakePoint(83.003408, 17.6935116), 4326), 60);
    END IF;
    -- Insert Drivers Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Drivers Colony', ST_SetSRID(ST_MakePoint(83.1990451, 17.904775), 4326), '{"D616, TRFRS KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Drivers Colony, Visakhapatnam', 'Drivers Colony  D616, TRFRS KLN', ST_SetSRID(ST_MakePoint(83.1990451, 17.904775), 4326), 60);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.3075025, 17.7159758), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.3075025, 17.7159758), 4326), 10);
    END IF;
    -- Insert Raju Gari Military Hotel (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Raju Gari Military Hotel', ST_SetSRID(ST_MakePoint(83.3198111, 17.7172348), 4326), '{"RJ KR MLTR HTL, R226"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Raju Gari Military Hotel, Visakhapatnam', 'Raju Gari Military Hotel  RJ KR MLTR HTL, R226', ST_SetSRID(ST_MakePoint(83.3198111, 17.7172348), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.3199529, 17.7171947), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.3199529, 17.7171947), 4326), 10);
    END IF;
    -- Insert Axis Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Axis Bank', ST_SetSRID(ST_MakePoint(83.3210033, 17.7163667), 4326), '{"A221, AKSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Axis Bank, Visakhapatnam', 'Axis Bank  A221, AKSS BNK', ST_SetSRID(ST_MakePoint(83.3210033, 17.7163667), 4326), 10);
    END IF;
    -- Insert Rise Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rise Hospital', ST_SetSRID(ST_MakePoint(83.2022417, 17.6846933), 4326), '{"R221, RS HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rise Hospital, Visakhapatnam', 'Rise Hospital  R221, RS HSPTL', ST_SetSRID(ST_MakePoint(83.2022417, 17.6846933), 4326), 50);
    END IF;
    -- Insert Girija Parlour (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Girija Parlour', ST_SetSRID(ST_MakePoint(83.2014578, 17.6840022), 4326), '{"G621, JRJ PRLR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Girija Parlour, Visakhapatnam', 'Girija Parlour  G621, JRJ PRLR', ST_SetSRID(ST_MakePoint(83.2014578, 17.6840022), 4326), 10);
    END IF;
    -- Insert Saanvi Millet Tiffins (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Saanvi Millet Tiffins', ST_SetSRID(ST_MakePoint(83.2003113, 17.6837439), 4326), '{"SNF MLT TFNS, S515"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Saanvi Millet Tiffins, Visakhapatnam', 'Saanvi Millet Tiffins  SNF MLT TFNS, S515', ST_SetSRID(ST_MakePoint(83.2003113, 17.6837439), 4326), 10);
    END IF;
    -- Insert SVS Quality Foods (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SVS Quality Foods', ST_SetSRID(ST_MakePoint(83.1968925, 17.6835244), 4326), '{"S122, SFS KLT FTS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SVS Quality Foods, Visakhapatnam', 'SVS Quality Foods  S122, SFS KLT FTS', ST_SetSRID(ST_MakePoint(83.1968925, 17.6835244), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.1947742, 17.6838598), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.1947742, 17.6838598), 4326), 10);
    END IF;
    -- Insert Friends Tandoori Point (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Friends Tandoori Point', ST_SetSRID(ST_MakePoint(83.1945419, 17.6836515), 4326), '{"FRNTS TNTR PNT, F653"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Friends Tandoori Point, Visakhapatnam', 'Friends Tandoori Point  FRNTS TNTR PNT, F653', ST_SetSRID(ST_MakePoint(83.1945419, 17.6836515), 4326), 10);
    END IF;
    -- Insert Sujani Park (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sujani Park', ST_SetSRID(ST_MakePoint(83.313395, 17.7447985), 4326), '{"SJN PRK, S251"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sujani Park, Visakhapatnam', 'Sujani Park  SJN PRK, S251', ST_SetSRID(ST_MakePoint(83.313395, 17.7447985), 4326), 10);
    END IF;
    -- Insert Ganesh Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ganesh Nagar', ST_SetSRID(ST_MakePoint(83.3596983, 17.8221957), 4326), '{"KNX NKR, G525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ganesh Nagar, Visakhapatnam', 'Ganesh Nagar  KNX NKR, G525', ST_SetSRID(ST_MakePoint(83.3596983, 17.8221957), 4326), 60);
    END IF;
    -- Insert Simhadri Hotel (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simhadri Hotel', ST_SetSRID(ST_MakePoint(83.2445067, 17.7730439), 4326), '{"S536, SMHTR HTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simhadri Hotel, Visakhapatnam', 'Simhadri Hotel  S536, SMHTR HTL', ST_SetSRID(ST_MakePoint(83.2445067, 17.7730439), 4326), 10);
    END IF;
    -- Insert Tiffins (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tiffins', ST_SetSRID(ST_MakePoint(83.3004302, 17.7284576), 4326), '{"T152, TFNS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tiffins, Visakhapatnam', 'Tiffins  T152, TFNS', ST_SetSRID(ST_MakePoint(83.3004302, 17.7284576), 4326), 10);
    END IF;
    -- Insert Urban Primary Health Center Dondaparthy (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Urban Primary Health Center Dondaparthy', ST_SetSRID(ST_MakePoint(83.3007641, 17.7291423), 4326), '{"URBN PRMR HL0 SNTR TNTPR0, U615"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Urban Primary Health Center Dondaparthy, Visakhapatnam', 'Urban Primary Health Center Dondaparthy  URBN PRMR HL0 SNTR TNTPR0, U615', ST_SetSRID(ST_MakePoint(83.3007641, 17.7291423), 4326), 50);
    END IF;
    -- Insert The District Co-Operative Central Bank Ltd (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The District Co-Operative Central Bank Ltd', ST_SetSRID(ST_MakePoint(83.3036088, 17.7301172), 4326), '{"0 TSTRKT KPRTF SNTRL BNK LTT, T323"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The District Co-Operative Central Bank Ltd, Visakhapatnam', 'The District Co-Operative Central Bank Ltd  0 TSTRKT KPRTF SNTRL BNK LTT, T323', ST_SetSRID(ST_MakePoint(83.3036088, 17.7301172), 4326), 10);
    END IF;
    -- Insert GVMC Primary School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'GVMC Primary School', ST_SetSRID(ST_MakePoint(83.3020386, 17.7282409), 4326), '{"KFMK PRMR SXL, G152"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'GVMC Primary School, Visakhapatnam', 'GVMC Primary School  KFMK PRMR SXL, G152', ST_SetSRID(ST_MakePoint(83.3020386, 17.7282409), 4326), 50);
    END IF;
    -- Insert Bismillah Biriyani House (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bismillah Biriyani House', ST_SetSRID(ST_MakePoint(83.2089997, 17.804005), 4326), '{"BSML BRYN HS, B254"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bismillah Biriyani House, Visakhapatnam', 'Bismillah Biriyani House  BSML BRYN HS, B254', ST_SetSRID(ST_MakePoint(83.2089997, 17.804005), 4326), 10);
    END IF;
    -- Insert IDBI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IDBI Bank', ST_SetSRID(ST_MakePoint(83.3082836, 17.7376292), 4326), '{"ITB BNK, I311"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IDBI Bank, Visakhapatnam', 'IDBI Bank  ITB BNK, I311', ST_SetSRID(ST_MakePoint(83.3082836, 17.7376292), 4326), 10);
    END IF;
    -- Insert The Kakinada Cooperative Town Bank Limited (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Kakinada Cooperative Town Bank Limited', ST_SetSRID(ST_MakePoint(83.3079909, 17.7375968), 4326), '{"0 KKNT KPRTF TN BNK LMTT, T225"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Kakinada Cooperative Town Bank Limited, Visakhapatnam', 'The Kakinada Cooperative Town Bank Limited  0 KKNT KPRTF TN BNK LMTT, T225', ST_SetSRID(ST_MakePoint(83.3079909, 17.7375968), 4326), 10);
    END IF;
    -- Insert Royal Biryanis & Tiffins (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Royal Biryanis & Tiffins', ST_SetSRID(ST_MakePoint(83.3080262, 17.7374442), 4326), '{"RYL BRYNS TFNS, R416"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Royal Biryanis & Tiffins, Visakhapatnam', 'Royal Biryanis & Tiffins  RYL BRYNS TFNS, R416', ST_SetSRID(ST_MakePoint(83.3080262, 17.7374442), 4326), 10);
    END IF;
    -- Insert Foodwala.com (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Foodwala.com', ST_SetSRID(ST_MakePoint(83.312788, 17.7358663), 4326), '{"F342, FTWLKM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Foodwala.com, Visakhapatnam', 'Foodwala.com  F342, FTWLKM', ST_SetSRID(ST_MakePoint(83.312788, 17.7358663), 4326), 10);
    END IF;
    -- Insert Satya Krishna Parlour (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Satya Krishna Parlour', ST_SetSRID(ST_MakePoint(83.312847, 17.7360987), 4326), '{"S326, STY KRXN PRLR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Satya Krishna Parlour, Visakhapatnam', 'Satya Krishna Parlour  S326, STY KRXN PRLR', ST_SetSRID(ST_MakePoint(83.312847, 17.7360987), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.3137817, 17.7385784), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.3137817, 17.7385784), 4326), 10);
    END IF;
    -- Insert Samudram Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Samudram Restaurant', ST_SetSRID(ST_MakePoint(83.3132224, 17.7392656), 4326), '{"S536, SMTRM RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Samudram Restaurant, Visakhapatnam', 'Samudram Restaurant  S536, SMTRM RSTRNT', ST_SetSRID(ST_MakePoint(83.3132224, 17.7392656), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.3132948, 17.739491), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.3132948, 17.739491), 4326), 10);
    END IF;
    -- Insert Ratnagiri Housing Board Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ratnagiri Housing Board Colony', ST_SetSRID(ST_MakePoint(83.3498525, 17.8020623), 4326), '{"R352, RTNJR HSNK BRT KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ratnagiri Housing Board Colony, Visakhapatnam', 'Ratnagiri Housing Board Colony  R352, RTNJR HSNK BRT KLN', ST_SetSRID(ST_MakePoint(83.3498525, 17.8020623), 4326), 60);
    END IF;
    -- Insert Sri Sai Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Sai Nagar', ST_SetSRID(ST_MakePoint(83.2388129, 17.7744489), 4326), '{"SR S NKR, S625"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Sai Nagar, Visakhapatnam', 'Sri Sai Nagar  SR S NKR, S625', ST_SetSRID(ST_MakePoint(83.2388129, 17.7744489), 4326), 60);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.356819, 17.7612897), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.356819, 17.7612897), 4326), 10);
    END IF;
    -- Insert Wireless Station (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Wireless Station', ST_SetSRID(ST_MakePoint(83.2731086, 17.6723108), 4326), '{"WRLS STXN, W642"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Wireless Station, Visakhapatnam', 'Wireless Station  WRLS STXN, W642', ST_SetSRID(ST_MakePoint(83.2731086, 17.6723108), 4326), 60);
    END IF;
    -- Insert Gangavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gangavaram', ST_SetSRID(ST_MakePoint(83.2276032, 17.6433701), 4326), '{"KNKFRM, G521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gangavaram, Visakhapatnam', 'Gangavaram  KNKFRM, G521', ST_SetSRID(ST_MakePoint(83.2276032, 17.6433701), 4326), 40);
    END IF;
    -- Insert Scindia (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Scindia', ST_SetSRID(ST_MakePoint(83.2620968, 17.6880091), 4326), '{"S530, SSNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Scindia, Visakhapatnam', 'Scindia  S530, SSNT', ST_SetSRID(ST_MakePoint(83.2620968, 17.6880091), 4326), 80);
    END IF;
    -- Insert Sector L (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector L', ST_SetSRID(ST_MakePoint(83.2659241, 17.6799826), 4326), '{"S236, SKTR L"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector L, Visakhapatnam', 'Sector L  S236, SKTR L', ST_SetSRID(ST_MakePoint(83.2659241, 17.6799826), 4326), 60);
    END IF;
    -- Insert Sector M (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector M', ST_SetSRID(ST_MakePoint(83.2769244, 17.6754408), 4326), '{"SKTR M, S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector M, Visakhapatnam', 'Sector M  SKTR M, S236', ST_SetSRID(ST_MakePoint(83.2769244, 17.6754408), 4326), 60);
    END IF;
    -- Insert Sector E (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector E', ST_SetSRID(ST_MakePoint(83.2821479, 17.6746322), 4326), '{"SKTR E, S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector E, Visakhapatnam', 'Sector E  SKTR E, S236', ST_SetSRID(ST_MakePoint(83.2821479, 17.6746322), 4326), 60);
    END IF;
    -- Insert HPCL Steel Plant Area (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HPCL Steel Plant Area', ST_SetSRID(ST_MakePoint(83.2561458, 17.7022016), 4326), '{"H124, HPKL STL PLNT AR, Vizag Steel Plant, VSP"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HPCL Steel Plant Area, Visakhapatnam', 'HPCL Steel Plant Area  H124, HPKL STL PLNT AR, Vizag Steel Plant, VSP', ST_SetSRID(ST_MakePoint(83.2561458, 17.7022016), 4326), 60);
    END IF;
    -- Insert Jaindra Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jaindra Colony', ST_SetSRID(ST_MakePoint(83.261227, 17.6978297), 4326), '{"JNTR KLN, J536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jaindra Colony, Visakhapatnam', 'Jaindra Colony  JNTR KLN, J536', ST_SetSRID(ST_MakePoint(83.261227, 17.6978297), 4326), 60);
    END IF;
    -- Insert Dayal Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dayal Nagar', ST_SetSRID(ST_MakePoint(83.2149224, 17.6764208), 4326), '{"TYL NKR, D452"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dayal Nagar, Visakhapatnam', 'Dayal Nagar  TYL NKR, D452', ST_SetSRID(ST_MakePoint(83.2149224, 17.6764208), 4326), 60);
    END IF;
    -- Insert Priyadarshini Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Priyadarshini Colony', ST_SetSRID(ST_MakePoint(83.2157865, 17.6724518), 4326), '{"P636, PRYTRXN KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Priyadarshini Colony, Visakhapatnam', 'Priyadarshini Colony  P636, PRYTRXN KLN', ST_SetSRID(ST_MakePoint(83.2157865, 17.6724518), 4326), 60);
    END IF;
    -- Insert Jai Andhra Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jai Andhra Colony', ST_SetSRID(ST_MakePoint(83.2619223, 17.6803718), 4326), '{"J ANTHR KLN, J536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jai Andhra Colony, Visakhapatnam', 'Jai Andhra Colony  J ANTHR KLN, J536', ST_SetSRID(ST_MakePoint(83.2619223, 17.6803718), 4326), 60);
    END IF;
    -- Insert Chintalalova (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintalalova', ST_SetSRID(ST_MakePoint(83.2602572, 17.681877), 4326), '{"C534, XNTLLF"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintalalova, Visakhapatnam', 'Chintalalova  C534, XNTLLF', ST_SetSRID(ST_MakePoint(83.2602572, 17.681877), 4326), 60);
    END IF;
    -- Insert Gandhigram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gandhigram', ST_SetSRID(ST_MakePoint(83.2609553, 17.6847113), 4326), '{"KNTHKRM, G532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gandhigram, Visakhapatnam', 'Gandhigram  KNTHKRM, G532', ST_SetSRID(ST_MakePoint(83.2609553, 17.6847113), 4326), 60);
    END IF;
    -- Insert Kranti Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kranti Nagar', ST_SetSRID(ST_MakePoint(83.258261, 17.6824011), 4326), '{"KRNT NKR, K653"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kranti Nagar, Visakhapatnam', 'Kranti Nagar  KRNT NKR, K653', ST_SetSRID(ST_MakePoint(83.258261, 17.6824011), 4326), 60);
    END IF;
    -- Insert Naval Sailors Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Naval Sailors Colony', ST_SetSRID(ST_MakePoint(83.2679959, 17.6820289), 4326), '{"N142, NFL SLRS KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Naval Sailors Colony, Visakhapatnam', 'Naval Sailors Colony  N142, NFL SLRS KLN', ST_SetSRID(ST_MakePoint(83.2679959, 17.6820289), 4326), 60);
    END IF;
    -- Insert Kakaralova (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kakaralova', ST_SetSRID(ST_MakePoint(83.2629233, 17.6819593), 4326), '{"KKRLF, K264"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kakaralova, Visakhapatnam', 'Kakaralova  KKRLF, K264', ST_SetSRID(ST_MakePoint(83.2629233, 17.6819593), 4326), 60);
    END IF;
    -- Insert Kottavuru (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottavuru', ST_SetSRID(ST_MakePoint(83.1210454, 17.6905493), 4326), '{"K316, KTFR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottavuru, Visakhapatnam', 'Kottavuru  K316, KTFR', ST_SetSRID(ST_MakePoint(83.1210454, 17.6905493), 4326), 80);
    END IF;
    -- Insert Danaboyinapalem (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Danaboyinapalem', ST_SetSRID(ST_MakePoint(83.1329546, 17.6931654), 4326), '{"TNBYNPLM, D515"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Danaboyinapalem, Visakhapatnam', 'Danaboyinapalem  TNBYNPLM, D515', ST_SetSRID(ST_MakePoint(83.1329546, 17.6931654), 4326), 80);
    END IF;
    -- Insert Sai Nagar Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sai Nagar Colony', ST_SetSRID(ST_MakePoint(83.128413, 17.6408788), 4326), '{"S NKR KLN, S526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sai Nagar Colony, Visakhapatnam', 'Sai Nagar Colony  S NKR KLN, S526', ST_SetSRID(ST_MakePoint(83.128413, 17.6408788), 4326), 60);
    END IF;
    -- Insert Desa Pathrunipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Desa Pathrunipalem', ST_SetSRID(ST_MakePoint(83.1223306, 17.6390779), 4326), '{"TS P0RNPLM, D213"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Desa Pathrunipalem, Visakhapatnam', 'Desa Pathrunipalem  TS P0RNPLM, D213', ST_SetSRID(ST_MakePoint(83.1223306, 17.6390779), 4326), 40);
    END IF;
    -- Insert Phase 1 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Phase 1', ST_SetSRID(ST_MakePoint(83.102181, 17.6258146), 4326), '{"P200, FS "}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Phase 1, Visakhapatnam', 'Phase 1  P200, FS ', ST_SetSRID(ST_MakePoint(83.102181, 17.6258146), 4326), 60);
    END IF;
    -- Insert Dibbala Gorilivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dibbala Gorilivanipalem', ST_SetSRID(ST_MakePoint(83.0940229, 17.6243822), 4326), '{"TBL KRLFNPLM, D142"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dibbala Gorilivanipalem, Visakhapatnam', 'Dibbala Gorilivanipalem  TBL KRLFNPLM, D142', ST_SetSRID(ST_MakePoint(83.0940229, 17.6243822), 4326), 40);
    END IF;
    -- Insert Hanuman Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hanuman Colony', ST_SetSRID(ST_MakePoint(83.088641, 17.6232232), 4326), '{"H555, HNMN KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hanuman Colony, Visakhapatnam', 'Hanuman Colony  H555, HNMN KLN', ST_SetSRID(ST_MakePoint(83.088641, 17.6232232), 4326), 60);
    END IF;
    -- Insert Yatapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yatapalem', ST_SetSRID(ST_MakePoint(83.0907444, 17.6156209), 4326), '{"YTPLM, Y314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yatapalem, Visakhapatnam', 'Yatapalem  YTPLM, Y314', ST_SetSRID(ST_MakePoint(83.0907444, 17.6156209), 4326), 10);
    END IF;
    -- Insert Gowthulachhanna Nagar (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gowthulachhanna Nagar', ST_SetSRID(ST_MakePoint(83.1001707, 17.6337936), 4326), '{"G342, K0LXHN NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gowthulachhanna Nagar, Visakhapatnam', 'Gowthulachhanna Nagar  G342, K0LXHN NKR', ST_SetSRID(ST_MakePoint(83.1001707, 17.6337936), 4326), 80);
    END IF;
    -- Insert Edulapaka Bonangi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Edulapaka Bonangi', ST_SetSRID(ST_MakePoint(83.0954795, 17.6357759), 4326), '{"E341, ETLPK BNNJ"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Edulapaka Bonangi, Visakhapatnam', 'Edulapaka Bonangi  E341, ETLPK BNNJ', ST_SetSRID(ST_MakePoint(83.0954795, 17.6357759), 4326), 40);
    END IF;
    -- Insert Subbalaxmi Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Subbalaxmi Colony', ST_SetSRID(ST_MakePoint(83.119615, 17.6278853), 4326), '{"SBLKSM KLN, S142"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Subbalaxmi Colony, Visakhapatnam', 'Subbalaxmi Colony  SBLKSM KLN, S142', ST_SetSRID(ST_MakePoint(83.119615, 17.6278853), 4326), 60);
    END IF;
    -- Insert Bhavani Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhavani Nagar', ST_SetSRID(ST_MakePoint(83.1297592, 17.6375035), 4326), '{"B155, BHFN NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhavani Nagar, Visakhapatnam', 'Bhavani Nagar  B155, BHFN NKR', ST_SetSRID(ST_MakePoint(83.1297592, 17.6375035), 4326), 60);
    END IF;
    -- Insert Sector 10 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 10', ST_SetSRID(ST_MakePoint(83.1373946, 17.6446912), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 10, Visakhapatnam', 'Sector 10  SKTR , S236', ST_SetSRID(ST_MakePoint(83.1373946, 17.6446912), 4326), 60);
    END IF;
    -- Insert Sector 1 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 1', ST_SetSRID(ST_MakePoint(83.1569839, 17.6495116), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 1, Visakhapatnam', 'Sector 1  SKTR , S236', ST_SetSRID(ST_MakePoint(83.1569839, 17.6495116), 4326), 60);
    END IF;
    -- Insert Sector 2 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 2', ST_SetSRID(ST_MakePoint(83.1570464, 17.6536629), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 2, Visakhapatnam', 'Sector 2  SKTR , S236', ST_SetSRID(ST_MakePoint(83.1570464, 17.6536629), 4326), 60);
    END IF;
    -- Insert Sector 3 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 3', ST_SetSRID(ST_MakePoint(83.161124, 17.6578029), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 3, Visakhapatnam', 'Sector 3  SKTR , S236', ST_SetSRID(ST_MakePoint(83.161124, 17.6578029), 4326), 60);
    END IF;
    -- Insert Sector 4 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 4', ST_SetSRID(ST_MakePoint(83.1523654, 17.6493625), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 4, Visakhapatnam', 'Sector 4  SKTR , S236', ST_SetSRID(ST_MakePoint(83.1523654, 17.6493625), 4326), 60);
    END IF;
    -- Insert Sector 5 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 5', ST_SetSRID(ST_MakePoint(83.1519487, 17.652688), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 5, Visakhapatnam', 'Sector 5  SKTR , S236', ST_SetSRID(ST_MakePoint(83.1519487, 17.652688), 4326), 60);
    END IF;
    -- Insert Sector 6 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 6', ST_SetSRID(ST_MakePoint(83.14743, 17.6575985), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 6, Visakhapatnam', 'Sector 6  SKTR , S236', ST_SetSRID(ST_MakePoint(83.14743, 17.6575985), 4326), 60);
    END IF;
    -- Insert Sector 7 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 7', ST_SetSRID(ST_MakePoint(83.1438213, 17.6554269), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 7, Visakhapatnam', 'Sector 7  SKTR , S236', ST_SetSRID(ST_MakePoint(83.1438213, 17.6554269), 4326), 60);
    END IF;
    -- Insert Sector 9 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 9', ST_SetSRID(ST_MakePoint(83.1343633, 17.648102), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 9, Visakhapatnam', 'Sector 9  SKTR , S236', ST_SetSRID(ST_MakePoint(83.1343633, 17.648102), 4326), 60);
    END IF;
    -- Insert Sector 11 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 11', ST_SetSRID(ST_MakePoint(83.1298898, 17.6483581), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 11, Visakhapatnam', 'Sector 11  SKTR , S236', ST_SetSRID(ST_MakePoint(83.1298898, 17.6483581), 4326), 60);
    END IF;
    -- Insert Sector 12 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 12', ST_SetSRID(ST_MakePoint(83.1343753, 17.658251), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 12, Visakhapatnam', 'Sector 12  SKTR , S236', ST_SetSRID(ST_MakePoint(83.1343753, 17.658251), 4326), 60);
    END IF;
    -- Insert Gorusu Vani Palem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gorusu Vani Palem', ST_SetSRID(ST_MakePoint(83.1531508, 17.5848576), 4326), '{"G621, KRS FN PLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gorusu Vani Palem, Visakhapatnam', 'Gorusu Vani Palem  G621, KRS FN PLM', ST_SetSRID(ST_MakePoint(83.1531508, 17.5848576), 4326), 40);
    END IF;
    -- Insert K N Palem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'K N Palem', ST_SetSRID(ST_MakePoint(83.155204, 17.5942892), 4326), '{"K514, K N PLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'K N Palem, Visakhapatnam', 'K N Palem  K514, K N PLM', ST_SetSRID(ST_MakePoint(83.155204, 17.5942892), 4326), 40);
    END IF;
    -- Insert Islampet (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Islampet', ST_SetSRID(ST_MakePoint(83.1502288, 17.6100298), 4326), '{"ISLMPT, I245"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Islampet, Visakhapatnam', 'Islampet  ISLMPT, I245', ST_SetSRID(ST_MakePoint(83.1502288, 17.6100298), 4326), 40);
    END IF;
    -- Insert Madeena Bagh (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madeena Bagh', ST_SetSRID(ST_MakePoint(83.1555879, 17.6220232), 4326), '{"MTN BKH, M351"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madeena Bagh, Visakhapatnam', 'Madeena Bagh  MTN BKH, M351', ST_SetSRID(ST_MakePoint(83.1555879, 17.6220232), 4326), 80);
    END IF;
    -- Insert Pedapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedapalem', ST_SetSRID(ST_MakePoint(83.1444402, 17.6092874), 4326), '{"PTPLM, P314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedapalem, Visakhapatnam', 'Pedapalem  PTPLM, P314', ST_SetSRID(ST_MakePoint(83.1444402, 17.6092874), 4326), 40);
    END IF;
    -- Insert Dasaripeta M (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dasaripeta M', ST_SetSRID(ST_MakePoint(83.1352913, 17.5986659), 4326), '{"TSRPT M, D261"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dasaripeta M, Visakhapatnam', 'Dasaripeta M  TSRPT M, D261', ST_SetSRID(ST_MakePoint(83.1352913, 17.5986659), 4326), 40);
    END IF;
    -- Insert Chinapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinapalem', ST_SetSRID(ST_MakePoint(83.1336089, 17.6072494), 4326), '{"C514, XNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinapalem, Visakhapatnam', 'Chinapalem  C514, XNPLM', ST_SetSRID(ST_MakePoint(83.1336089, 17.6072494), 4326), 40);
    END IF;
    -- Insert Elamanchilidoddi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Elamanchilidoddi', ST_SetSRID(ST_MakePoint(83.1404422, 17.6000132), 4326), '{"ELMNXLTT, E455"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Elamanchilidoddi, Visakhapatnam', 'Elamanchilidoddi  ELMNXLTT, E455', ST_SetSRID(ST_MakePoint(83.1404422, 17.6000132), 4326), 40);
    END IF;
    -- Insert Pittavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pittavanipalem', ST_SetSRID(ST_MakePoint(83.1274449, 17.6001485), 4326), '{"PTFNPLM, P315"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pittavanipalem, Visakhapatnam', 'Pittavanipalem  PTFNPLM, P315', ST_SetSRID(ST_MakePoint(83.1274449, 17.6001485), 4326), 40);
    END IF;
    -- Insert Kalapaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kalapaka', ST_SetSRID(ST_MakePoint(83.1143562, 17.5992161), 4326), '{"KLPK, K412"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kalapaka, Visakhapatnam', 'Kalapaka  KLPK, K412', ST_SetSRID(ST_MakePoint(83.1143562, 17.5992161), 4326), 40);
    END IF;
    -- Insert Venna Palem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venna Palem', ST_SetSRID(ST_MakePoint(83.0880559, 17.6139022), 4326), '{"FN PLM, V514"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venna Palem, Visakhapatnam', 'Venna Palem  FN PLM, V514', ST_SetSRID(ST_MakePoint(83.0880559, 17.6139022), 4326), 40);
    END IF;
    -- Insert Payakaro Bhonangi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Payakaro Bhonangi', ST_SetSRID(ST_MakePoint(83.109864, 17.620782), 4326), '{"PYKR BHNNJ, P261"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Payakaro Bhonangi, Visakhapatnam', 'Payakaro Bhonangi  PYKR BHNNJ, P261', ST_SetSRID(ST_MakePoint(83.109864, 17.620782), 4326), 40);
    END IF;
    -- Insert Nadupura (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nadupura', ST_SetSRID(ST_MakePoint(83.1598168, 17.6231888), 4326), '{"NTPR, N316"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nadupura, Visakhapatnam', 'Nadupura  NTPR, N316', ST_SetSRID(ST_MakePoint(83.1598168, 17.6231888), 4326), 40);
    END IF;
    -- Insert CISF Quarters (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'CISF Quarters', ST_SetSRID(ST_MakePoint(83.1747248, 17.6498913), 4326), '{"SSF KRTRS, C212"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'CISF Quarters, Visakhapatnam', 'CISF Quarters  SSF KRTRS, C212', ST_SetSRID(ST_MakePoint(83.1747248, 17.6498913), 4326), 60);
    END IF;
    -- Insert Jajulavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jajulavanipalem', ST_SetSRID(ST_MakePoint(83.1092512, 17.6371366), 4326), '{"J241, JJLFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jajulavanipalem, Visakhapatnam', 'Jajulavanipalem  J241, JJLFNPLM', ST_SetSRID(ST_MakePoint(83.1092512, 17.6371366), 4326), 40);
    END IF;
    -- Insert R Narasapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'R Narasapuram', ST_SetSRID(ST_MakePoint(82.9389636, 17.5232298), 4326), '{"R562, R NRSPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'R Narasapuram, Visakhapatnam', 'R Narasapuram  R562, R NRSPRM', ST_SetSRID(ST_MakePoint(82.9389636, 17.5232298), 4326), 10);
    END IF;
    -- Insert Votagada (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Votagada', ST_SetSRID(ST_MakePoint(83.0719976, 17.6148357), 4326), '{"V323, FTKT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Votagada, Visakhapatnam', 'Votagada  V323, FTKT', ST_SetSRID(ST_MakePoint(83.0719976, 17.6148357), 4326), 10);
    END IF;
    -- Insert Bottavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bottavanipalem', ST_SetSRID(ST_MakePoint(83.0640992, 17.6102794), 4326), '{"BTFNPLM, B315"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bottavanipalem, Visakhapatnam', 'Bottavanipalem  BTFNPLM, B315', ST_SetSRID(ST_MakePoint(83.0640992, 17.6102794), 4326), 40);
    END IF;
    -- Insert Venkatapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkatapuram', ST_SetSRID(ST_MakePoint(82.944719, 17.5458049), 4326), '{"V523, FNKTPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkatapuram, Visakhapatnam', 'Venkatapuram  V523, FNKTPRM', ST_SetSRID(ST_MakePoint(82.944719, 17.5458049), 4326), 40);
    END IF;
    -- Insert Sanakaluva (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sanakaluva', ST_SetSRID(ST_MakePoint(83.0101589, 17.5794244), 4326), '{"SNKLF, S524"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sanakaluva, Visakhapatnam', 'Sanakaluva  SNKLF, S524', ST_SetSRID(ST_MakePoint(83.0101589, 17.5794244), 4326), 40);
    END IF;
    -- Insert Gollapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapeta', ST_SetSRID(ST_MakePoint(83.1538121, 17.588282), 4326), '{"G413, KLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapeta, Visakhapatnam', 'Gollapeta  G413, KLPT', ST_SetSRID(ST_MakePoint(83.1538121, 17.588282), 4326), 40);
    END IF;
    -- Insert Official Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Official Colony', ST_SetSRID(ST_MakePoint(83.1902468, 17.6828042), 4326), '{"O124, OFXL KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Official Colony, Visakhapatnam', 'Official Colony  O124, OFXL KLN', ST_SetSRID(ST_MakePoint(83.1902468, 17.6828042), 4326), 60);
    END IF;
    -- Insert Durga Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Durga Nagar', ST_SetSRID(ST_MakePoint(83.1828682, 17.6790787), 4326), '{"D625, TRK NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Durga Nagar, Visakhapatnam', 'Durga Nagar  D625, TRK NKR', ST_SetSRID(ST_MakePoint(83.1828682, 17.6790787), 4326), 60);
    END IF;
    -- Insert New Dibbapaleam (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'New Dibbapaleam', ST_SetSRID(ST_MakePoint(83.2187285, 17.6679658), 4326), '{"N311, N TBPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'New Dibbapaleam, Visakhapatnam', 'New Dibbapaleam  N311, N TBPLM', ST_SetSRID(ST_MakePoint(83.2187285, 17.6679658), 4326), 60);
    END IF;
    -- Insert Venkannapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkannapalem', ST_SetSRID(ST_MakePoint(83.2160304, 17.6626385), 4326), '{"FNKNPLM, V525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkannapalem, Visakhapatnam', 'Venkannapalem  FNKNPLM, V525', ST_SetSRID(ST_MakePoint(83.2160304, 17.6626385), 4326), 60);
    END IF;
    -- Insert Nellimuku (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nellimuku', ST_SetSRID(ST_MakePoint(83.2022397, 17.6688197), 4326), '{"N452, NLMK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nellimuku, Visakhapatnam', 'Nellimuku  N452, NLMK', ST_SetSRID(ST_MakePoint(83.2022397, 17.6688197), 4326), 60);
    END IF;
    -- Insert Dairy Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dairy Colony', ST_SetSRID(ST_MakePoint(83.1932721, 17.667779), 4326), '{"D624, TR KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dairy Colony, Visakhapatnam', 'Dairy Colony  D624, TR KLN', ST_SetSRID(ST_MakePoint(83.1932721, 17.667779), 4326), 60);
    END IF;
    -- Insert RH Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'RH Colony', ST_SetSRID(ST_MakePoint(83.1882149, 17.670269), 4326), '{"RH KLN, R245"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'RH Colony, Visakhapatnam', 'RH Colony  RH KLN, R245', ST_SetSRID(ST_MakePoint(83.1882149, 17.670269), 4326), 60);
    END IF;
    -- Insert Simhagiri Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simhagiri Colony', ST_SetSRID(ST_MakePoint(83.2100142, 17.6779863), 4326), '{"SMHJR KLN, S526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simhagiri Colony, Visakhapatnam', 'Simhagiri Colony  SMHJR KLN, S526', ST_SetSRID(ST_MakePoint(83.2100142, 17.6779863), 4326), 60);
    END IF;
    -- Insert Durga Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Durga Nagar', ST_SetSRID(ST_MakePoint(83.3569836, 17.8088782), 4326), '{"D625, TRK NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Durga Nagar, Visakhapatnam', 'Durga Nagar  D625, TRK NKR', ST_SetSRID(ST_MakePoint(83.3569836, 17.8088782), 4326), 60);
    END IF;
    -- Insert Saptagiri Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Saptagiri Nagar', ST_SetSRID(ST_MakePoint(83.3538906, 17.793496), 4326), '{"SPTJR NKR, S132"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Saptagiri Nagar, Visakhapatnam', 'Saptagiri Nagar  SPTJR NKR, S132', ST_SetSRID(ST_MakePoint(83.3538906, 17.793496), 4326), 60);
    END IF;
    -- Insert Punjab National Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Punjab National Bank', ST_SetSRID(ST_MakePoint(83.3039431, 17.7224459), 4326), '{"PNJB NXNL BNK, P521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Punjab National Bank, Visakhapatnam', 'Punjab National Bank  PNJB NXNL BNK, P521', ST_SetSRID(ST_MakePoint(83.3039431, 17.7224459), 4326), 10);
    END IF;
    -- Insert Central Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Central Bank of India', ST_SetSRID(ST_MakePoint(83.3038471, 17.7223038), 4326), '{"C536, SNTRL BNK OF INT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Central Bank of India, Visakhapatnam', 'Central Bank of India  C536, SNTRL BNK OF INT', ST_SetSRID(ST_MakePoint(83.3038471, 17.7223038), 4326), 10);
    END IF;
    -- Insert Sri Basara Junior College (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Basara Junior College', ST_SetSRID(ST_MakePoint(83.328155, 17.7423517), 4326), '{"SR BSR JNR KLJ, S612"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Basara Junior College, Visakhapatnam', 'Sri Basara Junior College  SR BSR JNR KLJ, S612', ST_SetSRID(ST_MakePoint(83.328155, 17.7423517), 4326), 50);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.328122, 17.7421959), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.328122, 17.7421959), 4326), 10);
    END IF;
    -- Insert Akshara English Medium School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Akshara English Medium School', ST_SetSRID(ST_MakePoint(83.3245672, 17.7415823), 4326), '{"A265, AKXR ENKLX MTM SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Akshara English Medium School, Visakhapatnam', 'Akshara English Medium School  A265, AKXR ENKLX MTM SXL', ST_SetSRID(ST_MakePoint(83.3245672, 17.7415823), 4326), 50);
    END IF;
END $$;