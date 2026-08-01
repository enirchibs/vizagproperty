-- BULK OSM DATA SEED PART 2
DO $$
DECLARE
    vzg_city_id UUID;
    new_loc_id UUID;
BEGIN
    SELECT id INTO vzg_city_id FROM geo.cities WHERE name = 'Visakhapatnam' LIMIT 1;
    -- Insert Chintalavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintalavalasa', ST_SetSRID(ST_MakePoint(83.4077536, 18.0676716), 4326), '{"C534, XNTLFLS"}', jsonb_build_object('te', 'చింతలవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintalavalasa, Visakhapatnam', 'Chintalavalasa చింతలవలస C534, XNTLFLS', ST_SetSRID(ST_MakePoint(83.4077536, 18.0676716), 4326), 40);
    END IF;
    -- Insert Gundalapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gundalapeta', ST_SetSRID(ST_MakePoint(83.4229184, 18.0681569), 4326), '{"G534, KNTLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gundalapeta, Visakhapatnam', 'Gundalapeta  G534, KNTLPT', ST_SetSRID(ST_MakePoint(83.4229184, 18.0681569), 4326), 40);
    END IF;
    -- Insert Dharmapuri (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dharmapuri', ST_SetSRID(ST_MakePoint(83.4124881, 18.0875182), 4326), '{"THRMPR, D651"}', jsonb_build_object('te', 'ధర్మపురి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dharmapuri, Visakhapatnam', 'Dharmapuri ధర్మపురి THRMPR, D651', ST_SetSRID(ST_MakePoint(83.4124881, 18.0875182), 4326), 40);
    END IF;
    -- Insert Vontitadi Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vontitadi Agraharam', ST_SetSRID(ST_MakePoint(83.3918185, 18.0865915), 4326), '{"FNTTT AKRHRM, V533"}', jsonb_build_object('te', 'వొంటీడి అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vontitadi Agraharam, Visakhapatnam', 'Vontitadi Agraharam వొంటీడి అగ్రహారం FNTTT AKRHRM, V533', ST_SetSRID(ST_MakePoint(83.3918185, 18.0865915), 4326), 40);
    END IF;
    -- Insert Gokavanipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gokavanipeta', ST_SetSRID(ST_MakePoint(83.3849167, 18.0931915), 4326), '{"G215, KKFNPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gokavanipeta, Visakhapatnam', 'Gokavanipeta  G215, KKFNPT', ST_SetSRID(ST_MakePoint(83.3849167, 18.0931915), 4326), 40);
    END IF;
    -- Insert Jonnavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jonnavalasa', ST_SetSRID(ST_MakePoint(83.3604099, 18.0930478), 4326), '{"JNFLS, J514"}', jsonb_build_object('te', 'జగన్నాధపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jonnavalasa, Visakhapatnam', 'Jonnavalasa జగన్నాధపురం JNFLS, J514', ST_SetSRID(ST_MakePoint(83.3604099, 18.0930478), 4326), 40);
    END IF;
    -- Insert Chillapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chillapeta', ST_SetSRID(ST_MakePoint(83.3758664, 18.089674), 4326), '{"XLPT, C413"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chillapeta, Visakhapatnam', 'Chillapeta  XLPT, C413', ST_SetSRID(ST_MakePoint(83.3758664, 18.089674), 4326), 40);
    END IF;
    -- Insert Gollalapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapeta', ST_SetSRID(ST_MakePoint(83.378813, 18.0659908), 4326), '{"KLLPT, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapeta, Visakhapatnam', 'Gollalapeta  KLLPT, G441', ST_SetSRID(ST_MakePoint(83.378813, 18.0659908), 4326), 40);
    END IF;
    -- Insert Sarika (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sarika', ST_SetSRID(ST_MakePoint(83.3619573, 18.079367), 4326), '{"S620, SRK"}', jsonb_build_object('te', 'సరిక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sarika, Visakhapatnam', 'Sarika సరిక S620, SRK', ST_SetSRID(ST_MakePoint(83.3619573, 18.079367), 4326), 40);
    END IF;
    -- Insert Ambativalasa (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ambativalasa', ST_SetSRID(ST_MakePoint(83.3739526, 18.070837), 4326), '{"A513, AMBTFLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ambativalasa, Visakhapatnam', 'Ambativalasa  A513, AMBTFLS', ST_SetSRID(ST_MakePoint(83.3739526, 18.070837), 4326), 10);
    END IF;
    -- Insert Badukundapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Badukundapeta', ST_SetSRID(ST_MakePoint(83.381117, 18.0547471), 4326), '{"BTKNTPT, B325"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Badukundapeta, Visakhapatnam', 'Badukundapeta  BTKNTPT, B325', ST_SetSRID(ST_MakePoint(83.381117, 18.0547471), 4326), 10);
    END IF;
    -- Insert Gundalapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gundalapeta', ST_SetSRID(ST_MakePoint(83.3596669, 18.0722889), 4326), '{"G534, KNTLPT"}', jsonb_build_object('te', 'గుండలపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gundalapeta, Visakhapatnam', 'Gundalapeta గుండలపేట G534, KNTLPT', ST_SetSRID(ST_MakePoint(83.3596669, 18.0722889), 4326), 10);
    END IF;
    -- Insert Koradapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Koradapeta', ST_SetSRID(ST_MakePoint(83.3685776, 18.0669304), 4326), '{"K631, KRTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Koradapeta, Visakhapatnam', 'Koradapeta  K631, KRTPT', ST_SetSRID(ST_MakePoint(83.3685776, 18.0669304), 4326), 10);
    END IF;
    -- Insert Chelavuru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chelavuru', ST_SetSRID(ST_MakePoint(83.3958906, 18.0607152), 4326), '{"C416, XLFR"}', jsonb_build_object('te', 'చెలువూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chelavuru, Visakhapatnam', 'Chelavuru చెలువూరు C416, XLFR', ST_SetSRID(ST_MakePoint(83.3958906, 18.0607152), 4326), 40);
    END IF;
    -- Insert Rimapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rimapeta', ST_SetSRID(ST_MakePoint(83.3873428, 18.0756955), 4326), '{"R513, RMPT"}', jsonb_build_object('te', 'రీమపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rimapeta, Visakhapatnam', 'Rimapeta రీమపేట R513, RMPT', ST_SetSRID(ST_MakePoint(83.3873428, 18.0756955), 4326), 40);
    END IF;
    -- Insert Malicherla (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Malicherla', ST_SetSRID(ST_MakePoint(83.4001617, 18.0706077), 4326), '{"MLXRL, M426"}', jsonb_build_object('te', 'మలిచెర్ల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Malicherla, Visakhapatnam', 'Malicherla మలిచెర్ల MLXRL, M426', ST_SetSRID(ST_MakePoint(83.4001617, 18.0706077), 4326), 40);
    END IF;
    -- Insert Gaddavaalluru (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gaddavaalluru', ST_SetSRID(ST_MakePoint(83.4089813, 18.0338971), 4326), '{"G314, KTFLR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gaddavaalluru, Visakhapatnam', 'Gaddavaalluru  G314, KTFLR', ST_SetSRID(ST_MakePoint(83.4089813, 18.0338971), 4326), 10);
    END IF;
    -- Insert Lingannapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lingannapeta', ST_SetSRID(ST_MakePoint(83.3839706, 18.0196001), 4326), '{"LNKNPT, L525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lingannapeta, Visakhapatnam', 'Lingannapeta  LNKNPT, L525', ST_SetSRID(ST_MakePoint(83.3839706, 18.0196001), 4326), 40);
    END IF;
    -- Insert Akulapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Akulapeta', ST_SetSRID(ST_MakePoint(83.4185101, 18.0283855), 4326), '{"A241, AKLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Akulapeta, Visakhapatnam', 'Akulapeta  A241, AKLPT', ST_SetSRID(ST_MakePoint(83.4185101, 18.0283855), 4326), 40);
    END IF;
    -- Insert Buddivalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Buddivalasa', ST_SetSRID(ST_MakePoint(83.3700775, 18.0271665), 4326), '{"B314, BTFLS"}', jsonb_build_object('te', 'బుద్దివలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Buddivalasa, Visakhapatnam', 'Buddivalasa బుద్దివలస B314, BTFLS', ST_SetSRID(ST_MakePoint(83.3700775, 18.0271665), 4326), 40);
    END IF;
    -- Insert Duvvupeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Duvvupeta', ST_SetSRID(ST_MakePoint(83.4069187, 18.0199784), 4326), '{"D113, TFPT"}', jsonb_build_object('te', 'దువ్వుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Duvvupeta, Visakhapatnam', 'Duvvupeta దువ్వుపేట D113, TFPT', ST_SetSRID(ST_MakePoint(83.4069187, 18.0199784), 4326), 10);
    END IF;
    -- Insert Ayinada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ayinada', ST_SetSRID(ST_MakePoint(83.3974039, 18.045436), 4326), '{"AYNT, A530"}', jsonb_build_object('te', 'అయినాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ayinada, Visakhapatnam', 'Ayinada అయినాడ AYNT, A530', ST_SetSRID(ST_MakePoint(83.3974039, 18.045436), 4326), 40);
    END IF;
    -- Insert Koyyapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Koyyapeta', ST_SetSRID(ST_MakePoint(83.3676552, 18.0423671), 4326), '{"KYPT, K130"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Koyyapeta, Visakhapatnam', 'Koyyapeta  KYPT, K130', ST_SetSRID(ST_MakePoint(83.3676552, 18.0423671), 4326), 40);
    END IF;
    -- Insert Jonnada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jonnada', ST_SetSRID(ST_MakePoint(83.4061689, 18.0265966), 4326), '{"JNT, J530"}', jsonb_build_object('te', 'జొన్నాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jonnada, Visakhapatnam', 'Jonnada జొన్నాడ JNT, J530', ST_SetSRID(ST_MakePoint(83.4061689, 18.0265966), 4326), 40);
    END IF;
    -- Insert Bapiraju Tallavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bapiraju Tallavalasa', ST_SetSRID(ST_MakePoint(83.3869602, 18.030426), 4326), '{"B162, BPRJ TLFLS"}', jsonb_build_object('te', 'బాపిరాజుతాళ్ళవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bapiraju Tallavalasa, Visakhapatnam', 'Bapiraju Tallavalasa బాపిరాజుతాళ్ళవలస B162, BPRJ TLFLS', ST_SetSRID(ST_MakePoint(83.3869602, 18.030426), 4326), 40);
    END IF;
    -- Insert Chinnapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinnapuram', ST_SetSRID(ST_MakePoint(83.3718685, 18.0456209), 4326), '{"XNPRM, C516"}', jsonb_build_object('te', 'చిన్నాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinnapuram, Visakhapatnam', 'Chinnapuram చిన్నాపురం XNPRM, C516', ST_SetSRID(ST_MakePoint(83.3718685, 18.0456209), 4326), 40);
    END IF;
    -- Insert Barsapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Barsapeta', ST_SetSRID(ST_MakePoint(83.3939793, 18.0373702), 4326), '{"B621, BRSPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Barsapeta, Visakhapatnam', 'Barsapeta  B621, BRSPT', ST_SetSRID(ST_MakePoint(83.3939793, 18.0373702), 4326), 40);
    END IF;
    -- Insert Golagandapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Golagandapeta', ST_SetSRID(ST_MakePoint(83.4023076, 18.0336718), 4326), '{"G425, KLKNTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Golagandapeta, Visakhapatnam', 'Golagandapeta  G425, KLKNTPT', ST_SetSRID(ST_MakePoint(83.4023076, 18.0336718), 4326), 10);
    END IF;
    -- Insert Boddavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boddavalasa', ST_SetSRID(ST_MakePoint(83.4086201, 18.0396151), 4326), '{"B314, BTFLS"}', jsonb_build_object('te', 'బొద్దవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boddavalasa, Visakhapatnam', 'Boddavalasa బొద్దవలస B314, BTFLS', ST_SetSRID(ST_MakePoint(83.4086201, 18.0396151), 4326), 40);
    END IF;
    -- Insert Dindivari Tallavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dindivari Tallavalasa', ST_SetSRID(ST_MakePoint(83.4299678, 18.0238342), 4326), '{"TNTFR TLFLS, D531"}', jsonb_build_object('te', 'డీ.తాళ్లవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dindivari Tallavalasa, Visakhapatnam', 'Dindivari Tallavalasa డీ.తాళ్లవలస TNTFR TLFLS, D531', ST_SetSRID(ST_MakePoint(83.4299678, 18.0238342), 4326), 40);
    END IF;
    -- Insert Gantlam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gantlam', ST_SetSRID(ST_MakePoint(83.4484398, 18.0234444), 4326), '{"G534, KNTLM"}', jsonb_build_object('te', 'గంట్లాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gantlam, Visakhapatnam', 'Gantlam గంట్లాం G534, KNTLM', ST_SetSRID(ST_MakePoint(83.4484398, 18.0234444), 4326), 40);
    END IF;
    -- Insert Akkivaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Akkivaram', ST_SetSRID(ST_MakePoint(83.4661214, 18.017289), 4326), '{"AKFRM, A216"}', jsonb_build_object('te', 'అక్కివరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Akkivaram, Visakhapatnam', 'Akkivaram అక్కివరం AKFRM, A216', ST_SetSRID(ST_MakePoint(83.4661214, 18.017289), 4326), 40);
    END IF;
    -- Insert Vedullavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vedullavalasa', ST_SetSRID(ST_MakePoint(83.4418051, 18.0512108), 4326), '{"FTLFLS, V341"}', jsonb_build_object('te', 'వెదుళ్ళవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vedullavalasa, Visakhapatnam', 'Vedullavalasa వెదుళ్ళవలస FTLFLS, V341', ST_SetSRID(ST_MakePoint(83.4418051, 18.0512108), 4326), 40);
    END IF;
    -- Insert Godipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Godipalem', ST_SetSRID(ST_MakePoint(83.4534033, 18.0518977), 4326), '{"G314, KTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Godipalem, Visakhapatnam', 'Godipalem  G314, KTPLM', ST_SetSRID(ST_MakePoint(83.4534033, 18.0518977), 4326), 40);
    END IF;
    -- Insert Bontupalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bontupalle', ST_SetSRID(ST_MakePoint(83.4793003, 18.0423662), 4326), '{"BNTPL, B531"}', jsonb_build_object('te', 'బంటుపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bontupalle, Visakhapatnam', 'Bontupalle బంటుపల్లి BNTPL, B531', ST_SetSRID(ST_MakePoint(83.4793003, 18.0423662), 4326), 40);
    END IF;
    -- Insert Cittigunkalam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cittigunkalam', ST_SetSRID(ST_MakePoint(83.4230484, 18.0398551), 4326), '{"STKNKLM, C325"}', jsonb_build_object('te', 'చిట్టిగుంకలం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cittigunkalam, Visakhapatnam', 'Cittigunkalam చిట్టిగుంకలం STKNKLM, C325', ST_SetSRID(ST_MakePoint(83.4230484, 18.0398551), 4326), 40);
    END IF;
    -- Insert Telagapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Telagapeta', ST_SetSRID(ST_MakePoint(83.4310078, 18.0359711), 4326), '{"T421, TLKPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Telagapeta, Visakhapatnam', 'Telagapeta  T421, TLKPT', ST_SetSRID(ST_MakePoint(83.4310078, 18.0359711), 4326), 40);
    END IF;
    -- Insert Gollapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapeta', ST_SetSRID(ST_MakePoint(83.4262974, 18.0382567), 4326), '{"G413, KLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapeta, Visakhapatnam', 'Gollapeta  G413, KLPT', ST_SetSRID(ST_MakePoint(83.4262974, 18.0382567), 4326), 10);
    END IF;
    -- Insert Bellam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bellam', ST_SetSRID(ST_MakePoint(83.4402871, 18.0363031), 4326), '{"B450, BLM"}', jsonb_build_object('te', 'బెల్లం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bellam, Visakhapatnam', 'Bellam బెల్లం B450, BLM', ST_SetSRID(ST_MakePoint(83.4402871, 18.0363031), 4326), 40);
    END IF;
    -- Insert Amakam (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amakam', ST_SetSRID(ST_MakePoint(83.4317677, 18.0451736), 4326), '{"AMKM, A525"}', jsonb_build_object('te', 'అమకం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amakam, Visakhapatnam', 'Amakam అమకం AMKM, A525', ST_SetSRID(ST_MakePoint(83.4317677, 18.0451736), 4326), 10);
    END IF;
    -- Insert Rajula Tammapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajula Tammapuram', ST_SetSRID(ST_MakePoint(83.4542281, 18.0398109), 4326), '{"R243, RJL TMPRM"}', jsonb_build_object('te', 'రాజులతమ్మాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajula Tammapuram, Visakhapatnam', 'Rajula Tammapuram రాజులతమ్మాపురం R243, RJL TMPRM', ST_SetSRID(ST_MakePoint(83.4542281, 18.0398109), 4326), 10);
    END IF;
    -- Insert Raghumanda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Raghumanda', ST_SetSRID(ST_MakePoint(83.4296689, 18.0541534), 4326), '{"R255, RKHMNT"}', jsonb_build_object('te', 'రఘుమండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Raghumanda, Visakhapatnam', 'Raghumanda రఘుమండ R255, RKHMNT', ST_SetSRID(ST_MakePoint(83.4296689, 18.0541534), 4326), 40);
    END IF;
    -- Insert Pedada (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedada', ST_SetSRID(ST_MakePoint(83.4665469, 18.0439015), 4326), '{"PTT, P330"}', jsonb_build_object('te', 'పెదడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedada, Visakhapatnam', 'Pedada పెదడ PTT, P330', ST_SetSRID(ST_MakePoint(83.4665469, 18.0439015), 4326), 10);
    END IF;
    -- Insert Natavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Natavalasa', ST_SetSRID(ST_MakePoint(83.5244902, 18.0638917), 4326), '{"N314, NTFLS"}', jsonb_build_object('te', 'నటవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Natavalasa, Visakhapatnam', 'Natavalasa నటవలస N314, NTFLS', ST_SetSRID(ST_MakePoint(83.5244902, 18.0638917), 4326), 40);
    END IF;
    -- Insert Sundarapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sundarapeta', ST_SetSRID(ST_MakePoint(83.5189422, 18.0433263), 4326), '{"S536, SNTRPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sundarapeta, Visakhapatnam', 'Sundarapeta  S536, SNTRPT', ST_SetSRID(ST_MakePoint(83.5189422, 18.0433263), 4326), 10);
    END IF;
    -- Insert Subbannapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Subbannapeta', ST_SetSRID(ST_MakePoint(83.5482365, 18.0202262), 4326), '{"SBNPT, S151"}', jsonb_build_object('te', 'సుబ్బన్నపేట @ పిలకవాని అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Subbannapeta, Visakhapatnam', 'Subbannapeta సుబ్బన్నపేట @ పిలకవాని అగ్రహారం SBNPT, S151', ST_SetSRID(ST_MakePoint(83.5482365, 18.0202262), 4326), 10);
    END IF;
    -- Insert Nandigam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nandigam', ST_SetSRID(ST_MakePoint(83.5478617, 18.0254605), 4326), '{"N532, NNTKM"}', jsonb_build_object('te', 'నందిగం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nandigam, Visakhapatnam', 'Nandigam నందిగం N532, NNTKM', ST_SetSRID(ST_MakePoint(83.5478617, 18.0254605), 4326), 40);
    END IF;
    -- Insert Betanapalli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Betanapalli', ST_SetSRID(ST_MakePoint(83.4543808, 18.0956607), 4326), '{"B351, BTNPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Betanapalli, Visakhapatnam', 'Betanapalli  B351, BTNPL', ST_SetSRID(ST_MakePoint(83.4543808, 18.0956607), 4326), 10);
    END IF;
    -- Insert Pinatadivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pinatadivada', ST_SetSRID(ST_MakePoint(83.4566555, 18.0745479), 4326), '{"P533, PNTTFT"}', jsonb_build_object('te', 'పినతడివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pinatadivada, Visakhapatnam', 'Pinatadivada పినతడివాడ P533, PNTTFT', ST_SetSRID(ST_MakePoint(83.4566555, 18.0745479), 4326), 40);
    END IF;
    -- Insert Jammunarayanapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jammunarayanapuram', ST_SetSRID(ST_MakePoint(83.4323715, 18.0929426), 4326), '{"J556, JMNRYNPRM"}', jsonb_build_object('te', 'జమ్ము నారాయణపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jammunarayanapuram, Visakhapatnam', 'Jammunarayanapuram జమ్ము నారాయణపురం J556, JMNRYNPRM', ST_SetSRID(ST_MakePoint(83.4323715, 18.0929426), 4326), 40);
    END IF;
    -- Insert Pedda Tadivagu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Tadivagu', ST_SetSRID(ST_MakePoint(83.4404749, 18.0848601), 4326), '{"PT TTFK, P333"}', jsonb_build_object('te', 'పెదతడివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Tadivagu, Visakhapatnam', 'Pedda Tadivagu పెదతడివాడ PT TTFK, P333', ST_SetSRID(ST_MakePoint(83.4404749, 18.0848601), 4326), 40);
    END IF;
    -- Insert Kadipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kadipeta', ST_SetSRID(ST_MakePoint(83.4377363, 18.0938642), 4326), '{"K313, KTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kadipeta, Visakhapatnam', 'Kadipeta  K313, KTPT', ST_SetSRID(ST_MakePoint(83.4377363, 18.0938642), 4326), 40);
    END IF;
    -- Insert Gunupurupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gunupurupeta', ST_SetSRID(ST_MakePoint(83.4621459, 18.0927324), 4326), '{"KNPRPT, G516"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gunupurupeta, Visakhapatnam', 'Gunupurupeta  KNPRPT, G516', ST_SetSRID(ST_MakePoint(83.4621459, 18.0927324), 4326), 40);
    END IF;
    -- Insert Ramabhadrapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramabhadrapuram', ST_SetSRID(ST_MakePoint(83.4540495, 18.0923662), 4326), '{"R513, RMBHTRPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramabhadrapuram, Visakhapatnam', 'Ramabhadrapuram  R513, RMBHTRPRM', ST_SetSRID(ST_MakePoint(83.4540495, 18.0923662), 4326), 10);
    END IF;
    -- Insert Chandakapaeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chandakapaeta', ST_SetSRID(ST_MakePoint(83.5026771, 18.0717637), 4326), '{"C532, XNTKPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chandakapaeta, Visakhapatnam', 'Chandakapaeta  C532, XNTKPT', ST_SetSRID(ST_MakePoint(83.5026771, 18.0717637), 4326), 40);
    END IF;
    -- Insert Pottayapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pottayapalem', ST_SetSRID(ST_MakePoint(83.4807946, 18.097996), 4326), '{"P314, PTYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pottayapalem, Visakhapatnam', 'Pottayapalem  P314, PTYPLM', ST_SetSRID(ST_MakePoint(83.4807946, 18.097996), 4326), 40);
    END IF;
    -- Insert Dwarapureddipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dwarapureddipalem', ST_SetSRID(ST_MakePoint(83.4934821, 18.0833088), 4326), '{"D616, TWRPRTPLM"}', jsonb_build_object('te', 'ద్వారపురెడ్డిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dwarapureddipalem, Visakhapatnam', 'Dwarapureddipalem ద్వారపురెడ్డిపాలెం D616, TWRPRTPLM', ST_SetSRID(ST_MakePoint(83.4934821, 18.0833088), 4326), 10);
    END IF;
    -- Insert Doddibaduva (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Doddibaduva', ST_SetSRID(ST_MakePoint(83.4978271, 18.0731758), 4326), '{"TTBTF, D313"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Doddibaduva, Visakhapatnam', 'Doddibaduva  TTBTF, D313', ST_SetSRID(ST_MakePoint(83.4978271, 18.0731758), 4326), 40);
    END IF;
    -- Insert Yatapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yatapeta', ST_SetSRID(ST_MakePoint(83.5039835, 18.0909244), 4326), '{"Y313, YTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yatapeta, Visakhapatnam', 'Yatapeta  Y313, YTPT', ST_SetSRID(ST_MakePoint(83.5039835, 18.0909244), 4326), 10);
    END IF;
    -- Insert Nagarapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nagarapeta', ST_SetSRID(ST_MakePoint(83.4919613, 18.0921506), 4326), '{"NKRPT, N261"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nagarapeta, Visakhapatnam', 'Nagarapeta  NKRPT, N261', ST_SetSRID(ST_MakePoint(83.4919613, 18.0921506), 4326), 10);
    END IF;
    -- Insert Rellivalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rellivalasa', ST_SetSRID(ST_MakePoint(83.5238358, 18.0916486), 4326), '{"R414, RLFLS"}', jsonb_build_object('te', 'రెల్లివలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rellivalasa, Visakhapatnam', 'Rellivalasa రెల్లివలస R414, RLFLS', ST_SetSRID(ST_MakePoint(83.5238358, 18.0916486), 4326), 40);
    END IF;
    -- Insert Gollapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapeta', ST_SetSRID(ST_MakePoint(83.5600078, 18.0984211), 4326), '{"G413, KLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapeta, Visakhapatnam', 'Gollapeta  G413, KLPT', ST_SetSRID(ST_MakePoint(83.5600078, 18.0984211), 4326), 40);
    END IF;
    -- Insert Zivvipadu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Zivvipadu', ST_SetSRID(ST_MakePoint(83.5151805, 18.0779437), 4326), '{"SFPT, Z113"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Zivvipadu, Visakhapatnam', 'Zivvipadu  SFPT, Z113', ST_SetSRID(ST_MakePoint(83.5151805, 18.0779437), 4326), 10);
    END IF;
    -- Insert Gumpamuru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gumpamuru', ST_SetSRID(ST_MakePoint(83.5909336, 18.0829898), 4326), '{"KMPMR, G515"}', jsonb_build_object('te', 'గుంపం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gumpamuru, Visakhapatnam', 'Gumpamuru గుంపం KMPMR, G515', ST_SetSRID(ST_MakePoint(83.5909336, 18.0829898), 4326), 40);
    END IF;
    -- Insert Vempadam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vempadam', ST_SetSRID(ST_MakePoint(83.5720563, 18.0781948), 4326), '{"FMPTM, V513"}', jsonb_build_object('te', 'వెంపడం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vempadam, Visakhapatnam', 'Vempadam వెంపడం FMPTM, V513', ST_SetSRID(ST_MakePoint(83.5720563, 18.0781948), 4326), 40);
    END IF;
    -- Insert Tallapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tallapeta', ST_SetSRID(ST_MakePoint(83.578368, 18.081403), 4326), '{"T413, TLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tallapeta, Visakhapatnam', 'Tallapeta  T413, TLPT', ST_SetSRID(ST_MakePoint(83.578368, 18.081403), 4326), 40);
    END IF;
    -- Insert Perapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Perapuram', ST_SetSRID(ST_MakePoint(83.55108, 18.0802353), 4326), '{"PRPRM, P616"}', jsonb_build_object('te', 'పేరపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Perapuram, Visakhapatnam', 'Perapuram పేరపురం PRPRM, P616', ST_SetSRID(ST_MakePoint(83.55108, 18.0802353), 4326), 40);
    END IF;
    -- Insert Pata Kopperla (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Kopperla', ST_SetSRID(ST_MakePoint(83.5328535, 18.0706915), 4326), '{"PT KPRL, P321"}', jsonb_build_object('te', 'పాత కొప్పెర్ల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Kopperla, Visakhapatnam', 'Pata Kopperla పాత కొప్పెర్ల PT KPRL, P321', ST_SetSRID(ST_MakePoint(83.5328535, 18.0706915), 4326), 40);
    END IF;
    -- Insert Pusapatipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pusapatipalem', ST_SetSRID(ST_MakePoint(83.5387862, 18.0833453), 4326), '{"PSPTPLM, P213"}', jsonb_build_object('te', 'పూసపాటిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pusapatipalem, Visakhapatnam', 'Pusapatipalem పూసపాటిపాలెం PSPTPLM, P213', ST_SetSRID(ST_MakePoint(83.5387862, 18.0833453), 4326), 40);
    END IF;
    -- Insert Boddugurayappapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boddugurayappapeta', ST_SetSRID(ST_MakePoint(83.5709102, 18.0183705), 4326), '{"BTKRYPPT, B326"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boddugurayappapeta, Visakhapatnam', 'Boddugurayappapeta  BTKRYPPT, B326', ST_SetSRID(ST_MakePoint(83.5709102, 18.0183705), 4326), 40);
    END IF;
    -- Insert Konada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Konada', ST_SetSRID(ST_MakePoint(83.5631501, 18.0164999), 4326), '{"K530, KNT"}', jsonb_build_object('te', 'కోనాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Konada, Visakhapatnam', 'Konada కోనాడ K530, KNT', ST_SetSRID(ST_MakePoint(83.5631501, 18.0164999), 4326), 40);
    END IF;
    -- Insert Tippalavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tippalavalasa', ST_SetSRID(ST_MakePoint(83.5901614, 18.0273569), 4326), '{"T141, TPLFLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tippalavalasa, Visakhapatnam', 'Tippalavalasa  T141, TPLFLS', ST_SetSRID(ST_MakePoint(83.5901614, 18.0273569), 4326), 40);
    END IF;
    -- Insert Kalapureddipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kalapureddipeta', ST_SetSRID(ST_MakePoint(83.5753381, 18.0432416), 4326), '{"KLPRTPT, K416"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kalapureddipeta, Visakhapatnam', 'Kalapureddipeta  KLPRTPT, K416', ST_SetSRID(ST_MakePoint(83.5753381, 18.0432416), 4326), 40);
    END IF;
    -- Insert Kollayavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kollayavalasa', ST_SetSRID(ST_MakePoint(83.5968443, 18.0580492), 4326), '{"KLYFLS, K414"}', jsonb_build_object('te', 'కొల్లయవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kollayavalasa, Visakhapatnam', 'Kollayavalasa కొల్లయవలస KLYFLS, K414', ST_SetSRID(ST_MakePoint(83.5968443, 18.0580492), 4326), 40);
    END IF;
    -- Insert Yerukonda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yerukonda', ST_SetSRID(ST_MakePoint(83.5672726, 18.0534543), 4326), '{"YRKNT, Y625"}', jsonb_build_object('te', 'యేరుకొండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yerukonda, Visakhapatnam', 'Yerukonda యేరుకొండ YRKNT, Y625', ST_SetSRID(ST_MakePoint(83.5672726, 18.0534543), 4326), 40);
    END IF;
    -- Insert Pasupam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pasupam', ST_SetSRID(ST_MakePoint(83.5794967, 18.0564038), 4326), '{"PSPM, P215"}', jsonb_build_object('te', 'పసుపం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pasupam, Visakhapatnam', 'Pasupam పసుపం PSPM, P215', ST_SetSRID(ST_MakePoint(83.5794967, 18.0564038), 4326), 40);
    END IF;
    -- Insert Burapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Burapeta', ST_SetSRID(ST_MakePoint(83.5653025, 18.0463511), 4326), '{"B613, BRPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Burapeta, Visakhapatnam', 'Burapeta  B613, BRPT', ST_SetSRID(ST_MakePoint(83.5653025, 18.0463511), 4326), 40);
    END IF;
    -- Insert Kilugupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kilugupeta', ST_SetSRID(ST_MakePoint(83.5883085, 18.0343257), 4326), '{"KLKPT, K421"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kilugupeta, Visakhapatnam', 'Kilugupeta  KLKPT, K421', ST_SetSRID(ST_MakePoint(83.5883085, 18.0343257), 4326), 40);
    END IF;
    -- Insert Velduru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Velduru', ST_SetSRID(ST_MakePoint(83.5755416, 18.0402753), 4326), '{"V436, FLTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Velduru, Visakhapatnam', 'Velduru  V436, FLTR', ST_SetSRID(ST_MakePoint(83.5755416, 18.0402753), 4326), 40);
    END IF;
    -- Insert Marripeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marripeta', ST_SetSRID(ST_MakePoint(83.5877744, 18.0604222), 4326), '{"M613, MRPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marripeta, Visakhapatnam', 'Marripeta  M613, MRPT', ST_SetSRID(ST_MakePoint(83.5877744, 18.0604222), 4326), 40);
    END IF;
    -- Insert Rayudupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rayudupeta', ST_SetSRID(ST_MakePoint(83.6176543, 18.0542218), 4326), '{"RYTPT, R313"}', jsonb_build_object('te', 'రాయుడుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rayudupeta, Visakhapatnam', 'Rayudupeta రాయుడుపేట RYTPT, R313', ST_SetSRID(ST_MakePoint(83.6176543, 18.0542218), 4326), 40);
    END IF;
    -- Insert Barripeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Barripeta', ST_SetSRID(ST_MakePoint(83.6245664, 18.0525389), 4326), '{"B613, BRPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Barripeta, Visakhapatnam', 'Barripeta  B613, BRPT', ST_SetSRID(ST_MakePoint(83.6245664, 18.0525389), 4326), 40);
    END IF;
    -- Insert Chinna Pathivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Pathivada', ST_SetSRID(ST_MakePoint(83.62791, 18.0585798), 4326), '{"XN P0FT, C513"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Pathivada, Visakhapatnam', 'Chinna Pathivada  XN P0FT, C513', ST_SetSRID(ST_MakePoint(83.62791, 18.0585798), 4326), 40);
    END IF;
    -- Insert Vasanta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vasanta', ST_SetSRID(ST_MakePoint(83.2609173, 18.0996339), 4326), '{"V253, FSNT"}', jsonb_build_object('te', 'వసంత'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vasanta, Visakhapatnam', 'Vasanta వసంత V253, FSNT', ST_SetSRID(ST_MakePoint(83.2609173, 18.0996339), 4326), 40);
    END IF;
    -- Insert Venne (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venne', ST_SetSRID(ST_MakePoint(83.2755937, 18.0891827), 4326), '{"FN, V500"}', jsonb_build_object('te', 'వెన్నె'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venne, Visakhapatnam', 'Venne వెన్నె FN, V500', ST_SetSRID(ST_MakePoint(83.2755937, 18.0891827), 4326), 10);
    END IF;
    -- Insert Gopalapalle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gopalapalle', ST_SetSRID(ST_MakePoint(83.2447776, 18.0774505), 4326), '{"KPLPL, G141"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gopalapalle, Visakhapatnam', 'Gopalapalle  KPLPL, G141', ST_SetSRID(ST_MakePoint(83.2447776, 18.0774505), 4326), 10);
    END IF;
    -- Insert Vizinigiri (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vizinigiri', ST_SetSRID(ST_MakePoint(83.2320101, 18.0719193), 4326), '{"FSNJR, V252"}', jsonb_build_object('te', 'విజినగిరి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vizinigiri, Visakhapatnam', 'Vizinigiri విజినగిరి FSNJR, V252', ST_SetSRID(ST_MakePoint(83.2320101, 18.0719193), 4326), 40);
    END IF;
    -- Insert Tanavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tanavaram', ST_SetSRID(ST_MakePoint(83.2296425, 18.0751363), 4326), '{"TNFRM, T516"}', jsonb_build_object('te', 'తానవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tanavaram, Visakhapatnam', 'Tanavaram తానవరం TNFRM, T516', ST_SetSRID(ST_MakePoint(83.2296425, 18.0751363), 4326), 40);
    END IF;
    -- Insert Tandrangi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tandrangi', ST_SetSRID(ST_MakePoint(83.2344739, 18.0889982), 4326), '{"T536, TNTRNJ"}', jsonb_build_object('te', 'తాండ్రంగి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tandrangi, Visakhapatnam', 'Tandrangi తాండ్రంగి T536, TNTRNJ', ST_SetSRID(ST_MakePoint(83.2344739, 18.0889982), 4326), 40);
    END IF;
    -- Insert Jannivalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jannivalasa', ST_SetSRID(ST_MakePoint(83.2638624, 18.0738326), 4326), '{"JNFLS, J514"}', jsonb_build_object('te', 'జన్నివలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jannivalasa, Visakhapatnam', 'Jannivalasa జన్నివలస JNFLS, J514', ST_SetSRID(ST_MakePoint(83.2638624, 18.0738326), 4326), 40);
    END IF;
    -- Insert Venkatrajupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkatrajupalem', ST_SetSRID(ST_MakePoint(83.2764335, 18.0718256), 4326), '{"V523, FNKTRJPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkatrajupalem, Visakhapatnam', 'Venkatrajupalem  V523, FNKTRJPLM', ST_SetSRID(ST_MakePoint(83.2764335, 18.0718256), 4326), 40);
    END IF;
    -- Insert Telagapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Telagapalem', ST_SetSRID(ST_MakePoint(83.2899232, 18.0575992), 4326), '{"T421, TLKPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Telagapalem, Visakhapatnam', 'Telagapalem  T421, TLKPLM', ST_SetSRID(ST_MakePoint(83.2899232, 18.0575992), 4326), 40);
    END IF;
    -- Insert Pata Bhimasingi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Bhimasingi', ST_SetSRID(ST_MakePoint(83.2960718, 18.0457491), 4326), '{"PT BHMSNJ, P315"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Bhimasingi, Visakhapatnam', 'Pata Bhimasingi  PT BHMSNJ, P315', ST_SetSRID(ST_MakePoint(83.2960718, 18.0457491), 4326), 40);
    END IF;
    -- Insert Devunipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Devunipalem', ST_SetSRID(ST_MakePoint(83.2848613, 18.0509182), 4326), '{"TFNPLM, D151"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Devunipalem, Visakhapatnam', 'Devunipalem  TFNPLM, D151', ST_SetSRID(ST_MakePoint(83.2848613, 18.0509182), 4326), 10);
    END IF;
    -- Insert Mokasa Kottavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mokasa Kottavalasa', ST_SetSRID(ST_MakePoint(83.3181903, 18.0328618), 4326), '{"M222, MKS KTFLS"}', jsonb_build_object('te', 'మొకాస కొత్తవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mokasa Kottavalasa, Visakhapatnam', 'Mokasa Kottavalasa మొకాస కొత్తవలస M222, MKS KTFLS', ST_SetSRID(ST_MakePoint(83.3181903, 18.0328618), 4326), 40);
    END IF;
    -- Insert Tanivalasa Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tanivalasa Agraharam', ST_SetSRID(ST_MakePoint(83.3446052, 18.0361145), 4326), '{"TNFLS AKRHRM, T514"}', jsonb_build_object('te', 'తనివలస అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tanivalasa Agraharam, Visakhapatnam', 'Tanivalasa Agraharam తనివలస అగ్రహారం TNFLS AKRHRM, T514', ST_SetSRID(ST_MakePoint(83.3446052, 18.0361145), 4326), 40);
    END IF;
    -- Insert Narasapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narasapuram', ST_SetSRID(ST_MakePoint(83.3508635, 18.0240743), 4326), '{"NRSPRM, N621"}', jsonb_build_object('te', 'నరసాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narasapuram, Visakhapatnam', 'Narasapuram నరసాపురం NRSPRM, N621', ST_SetSRID(ST_MakePoint(83.3508635, 18.0240743), 4326), 40);
    END IF;
    -- Insert Vijayanandapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijayanandapuram', ST_SetSRID(ST_MakePoint(83.3568087, 18.0550219), 4326), '{"V255, FJYNNTPRM"}', jsonb_build_object('te', 'విజయానందపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijayanandapuram, Visakhapatnam', 'Vijayanandapuram విజయానందపురం V255, FJYNNTPRM', ST_SetSRID(ST_MakePoint(83.3568087, 18.0550219), 4326), 40);
    END IF;
    -- Insert Kumaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kumaram', ST_SetSRID(ST_MakePoint(83.3216122, 18.0459233), 4326), '{"K565, KMRM"}', jsonb_build_object('te', 'కుమరాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kumaram, Visakhapatnam', 'Kumaram కుమరాం K565, KMRM', ST_SetSRID(ST_MakePoint(83.3216122, 18.0459233), 4326), 40);
    END IF;
    -- Insert Sasanapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sasanapalle', ST_SetSRID(ST_MakePoint(83.2894335, 18.0811407), 4326), '{"SSNPL, S251"}', jsonb_build_object('te', 'శాసనపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sasanapalle, Visakhapatnam', 'Sasanapalle శాసనపల్లి SSNPL, S251', ST_SetSRID(ST_MakePoint(83.2894335, 18.0811407), 4326), 40);
    END IF;
    -- Insert Murapaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Murapaka', ST_SetSRID(ST_MakePoint(83.3069838, 18.098844), 4326), '{"M612, MRPK"}', jsonb_build_object('te', 'మురపాక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Murapaka, Visakhapatnam', 'Murapaka మురపాక M612, MRPK', ST_SetSRID(ST_MakePoint(83.3069838, 18.098844), 4326), 40);
    END IF;
    -- Insert Peddavemal (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Peddavemal', ST_SetSRID(ST_MakePoint(83.3030812, 18.0885549), 4326), '{"PTFML, P315"}', jsonb_build_object('te', 'పెదవేమలి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Peddavemal, Visakhapatnam', 'Peddavemal పెదవేమలి PTFML, P315', ST_SetSRID(ST_MakePoint(83.3030812, 18.0885549), 4326), 40);
    END IF;
    -- Insert Rakadu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rakadu', ST_SetSRID(ST_MakePoint(83.329618, 18.09951), 4326), '{"R230, RKT"}', jsonb_build_object('te', 'రాకోడు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rakadu, Visakhapatnam', 'Rakadu రాకోడు R230, RKT', ST_SetSRID(ST_MakePoint(83.329618, 18.09951), 4326), 40);
    END IF;
    -- Insert Polem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Polem', ST_SetSRID(ST_MakePoint(83.320108, 18.0708337), 4326), '{"P450, PLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Polem, Visakhapatnam', 'Polem  P450, PLM', ST_SetSRID(ST_MakePoint(83.320108, 18.0708337), 4326), 40);
    END IF;
    -- Insert Pinavemal (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pinavemal', ST_SetSRID(ST_MakePoint(83.3308452, 18.0851686), 4326), '{"P515, PNFML"}', jsonb_build_object('te', 'పినవెమలి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pinavemal, Visakhapatnam', 'Pinavemal పినవెమలి P515, PNFML', ST_SetSRID(ST_MakePoint(83.3308452, 18.0851686), 4326), 40);
    END IF;
    -- Insert Korukonda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Korukonda', ST_SetSRID(ST_MakePoint(83.3349717, 18.0641785), 4326), '{"K625, KRKNT"}', jsonb_build_object('te', 'కోరుకొండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Korukonda, Visakhapatnam', 'Korukonda కోరుకొండ K625, KRKNT', ST_SetSRID(ST_MakePoint(83.3349717, 18.0641785), 4326), 40);
    END IF;
    -- Insert Atada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Atada', ST_SetSRID(ST_MakePoint(83.3110467, 18.0682792), 4326), '{"A330, ATT"}', jsonb_build_object('te', 'అట్టాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Atada, Visakhapatnam', 'Atada అట్టాడ A330, ATT', ST_SetSRID(ST_MakePoint(83.3110467, 18.0682792), 4326), 40);
    END IF;
    -- Insert Gorinta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gorinta', ST_SetSRID(ST_MakePoint(83.254384, 17.8764091), 4326), '{"KRNT, G653"}', jsonb_build_object('te', 'గోరింట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gorinta, Visakhapatnam', 'Gorinta గోరింట KRNT, G653', ST_SetSRID(ST_MakePoint(83.254384, 17.8764091), 4326), 10);
    END IF;
    -- Insert Ramavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramavaram', ST_SetSRID(ST_MakePoint(83.2441595, 17.866398), 4326), '{"R516, RMFRM"}', jsonb_build_object('te', 'రామవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramavaram, Visakhapatnam', 'Ramavaram రామవరం R516, RMFRM', ST_SetSRID(ST_MakePoint(83.2441595, 17.866398), 4326), 40);
    END IF;
    -- Insert Pappulavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pappulavanipalem', ST_SetSRID(ST_MakePoint(83.2562191, 17.8948946), 4326), '{"PPLFNPLM, P141"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pappulavanipalem, Visakhapatnam', 'Pappulavanipalem  PPLFNPLM, P141', ST_SetSRID(ST_MakePoint(83.2562191, 17.8948946), 4326), 10);
    END IF;
    -- Insert Erravanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Erravanipalem', ST_SetSRID(ST_MakePoint(83.2532299, 17.8841915), 4326), '{"E615, ERFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Erravanipalem, Visakhapatnam', 'Erravanipalem  E615, ERFNPLM', ST_SetSRID(ST_MakePoint(83.2532299, 17.8841915), 4326), 10);
    END IF;
    -- Insert Tummivanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tummivanipalem', ST_SetSRID(ST_MakePoint(83.2460293, 17.8887682), 4326), '{"T515, TMFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tummivanipalem, Visakhapatnam', 'Tummivanipalem  T515, TMFNPLM', ST_SetSRID(ST_MakePoint(83.2460293, 17.8887682), 4326), 10);
    END IF;
    -- Insert Appannadorapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appannadorapalem', ST_SetSRID(ST_MakePoint(83.218941, 17.9106768), 4326), '{"APNTRPLM, A153"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appannadorapalem, Visakhapatnam', 'Appannadorapalem  APNTRPLM, A153', ST_SetSRID(ST_MakePoint(83.218941, 17.9106768), 4326), 10);
    END IF;
    -- Insert Relli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Relli', ST_SetSRID(ST_MakePoint(83.2262306, 17.8915127), 4326), '{"R400, RL"}', jsonb_build_object('te', 'రెల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Relli, Visakhapatnam', 'Relli రెల్లి R400, RL', ST_SetSRID(ST_MakePoint(83.2262306, 17.8915127), 4326), 10);
    END IF;
    -- Insert Kolavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kolavanipalem', ST_SetSRID(ST_MakePoint(83.2527032, 17.8893136), 4326), '{"KLFNPLM, K415"}', jsonb_build_object('te', 'కోలవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kolavanipalem, Visakhapatnam', 'Kolavanipalem కోలవానిపాలెం KLFNPLM, K415', ST_SetSRID(ST_MakePoint(83.2527032, 17.8893136), 4326), 40);
    END IF;
    -- Insert Bhimannadorapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhimannadorapalem', ST_SetSRID(ST_MakePoint(83.2446956, 17.892589), 4326), '{"BHMNTRPLM, B553"}', jsonb_build_object('te', 'భీమన్నదొరపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhimannadorapalem, Visakhapatnam', 'Bhimannadorapalem భీమన్నదొరపాలెం BHMNTRPLM, B553', ST_SetSRID(ST_MakePoint(83.2446956, 17.892589), 4326), 40);
    END IF;
    -- Insert Mummanavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mummanavanipalem', ST_SetSRID(ST_MakePoint(83.235956, 17.8966018), 4326), '{"M551, MMNFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mummanavanipalem, Visakhapatnam', 'Mummanavanipalem  M551, MMNFNPLM', ST_SetSRID(ST_MakePoint(83.235956, 17.8966018), 4326), 10);
    END IF;
    -- Insert Appannadorapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appannadorapalem', ST_SetSRID(ST_MakePoint(83.2252073, 17.9015598), 4326), '{"APNTRPLM, A153"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appannadorapalem, Visakhapatnam', 'Appannadorapalem  APNTRPLM, A153', ST_SetSRID(ST_MakePoint(83.2252073, 17.9015598), 4326), 10);
    END IF;
    -- Insert Rajapatrunipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajapatrunipalem', ST_SetSRID(ST_MakePoint(83.1677356, 17.898689), 4326), '{"R213, RJPTRNPLM"}', jsonb_build_object('te', 'రాజపత్రునిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajapatrunipalem, Visakhapatnam', 'Rajapatrunipalem రాజపత్రునిపాలెం R213, RJPTRNPLM', ST_SetSRID(ST_MakePoint(83.1677356, 17.898689), 4326), 40);
    END IF;
    -- Insert Gavarapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gavarapalem', ST_SetSRID(ST_MakePoint(83.1795304, 17.8872571), 4326), '{"KFRPLM, G161"}', jsonb_build_object('te', 'గవరపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gavarapalem, Visakhapatnam', 'Gavarapalem గవరపాలెం KFRPLM, G161', ST_SetSRID(ST_MakePoint(83.1795304, 17.8872571), 4326), 10);
    END IF;
    -- Insert Ramachandrapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramachandrapuram', ST_SetSRID(ST_MakePoint(83.1692195, 17.8820973), 4326), '{"RMXNTRPRM, R525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramachandrapuram, Visakhapatnam', 'Ramachandrapuram  RMXNTRPRM, R525', ST_SetSRID(ST_MakePoint(83.1692195, 17.8820973), 4326), 40);
    END IF;
    -- Insert Mindivalasa (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mindivalasa', ST_SetSRID(ST_MakePoint(83.1684507, 17.8862131), 4326), '{"M531, MNTFLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mindivalasa, Visakhapatnam', 'Mindivalasa  M531, MNTFLS', ST_SetSRID(ST_MakePoint(83.1684507, 17.8862131), 4326), 10);
    END IF;
    -- Insert Kothavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kothavalasa', ST_SetSRID(ST_MakePoint(83.1837095, 17.8958429), 4326), '{"K0FLS, K314"}', jsonb_build_object('te', 'కొత్తవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kothavalasa, Visakhapatnam', 'Kothavalasa కొత్తవలస K0FLS, K314', ST_SetSRID(ST_MakePoint(83.1837095, 17.8958429), 4326), 40);
    END IF;
    -- Insert Desapatrunipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Desapatrunipalem', ST_SetSRID(ST_MakePoint(83.1980862, 17.8666309), 4326), '{"TSPTRNPLM, D213"}', jsonb_build_object('te', 'దేశపాత్రునిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Desapatrunipalem, Visakhapatnam', 'Desapatrunipalem దేశపాత్రునిపాలెం TSPTRNPLM, D213', ST_SetSRID(ST_MakePoint(83.1980862, 17.8666309), 4326), 40);
    END IF;
    -- Insert Boddunayudupalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boddunayudupalem', ST_SetSRID(ST_MakePoint(83.2117396, 17.8675595), 4326), '{"BTNYTPLM, B353"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boddunayudupalem, Visakhapatnam', 'Boddunayudupalem  BTNYTPLM, B353', ST_SetSRID(ST_MakePoint(83.2117396, 17.8675595), 4326), 10);
    END IF;
    -- Insert Mangalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mangalapalem', ST_SetSRID(ST_MakePoint(83.1883242, 17.876042), 4326), '{"MNKLPLM, M524"}', jsonb_build_object('te', 'మంగలపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mangalapalem, Visakhapatnam', 'Mangalapalem మంగలపాలెం MNKLPLM, M524', ST_SetSRID(ST_MakePoint(83.1883242, 17.876042), 4326), 40);
    END IF;
    -- Insert Tadivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tadivanipalem', ST_SetSRID(ST_MakePoint(83.1905813, 17.857059), 4326), '{"TTFNPLM, T315"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tadivanipalem, Visakhapatnam', 'Tadivanipalem  TTFNPLM, T315', ST_SetSRID(ST_MakePoint(83.1905813, 17.857059), 4326), 40);
    END IF;
    -- Insert Gollapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapeta', ST_SetSRID(ST_MakePoint(83.1956559, 17.8494588), 4326), '{"G413, KLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapeta, Visakhapatnam', 'Gollapeta  G413, KLPT', ST_SetSRID(ST_MakePoint(83.1956559, 17.8494588), 4326), 40);
    END IF;
    -- Insert Chintalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintalapalem', ST_SetSRID(ST_MakePoint(83.2017212, 17.8557053), 4326), '{"C534, XNTLPLM"}', jsonb_build_object('te', 'చింతలపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintalapalem, Visakhapatnam', 'Chintalapalem చింతలపాలెం C534, XNTLPLM', ST_SetSRID(ST_MakePoint(83.2017212, 17.8557053), 4326), 40);
    END IF;
    -- Insert Gangammapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gangammapeta', ST_SetSRID(ST_MakePoint(83.1776759, 17.8318981), 4326), '{"KNKMPT, G525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gangammapeta, Visakhapatnam', 'Gangammapeta  KNKMPT, G525', ST_SetSRID(ST_MakePoint(83.1776759, 17.8318981), 4326), 10);
    END IF;
    -- Insert Gorapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gorapalli', ST_SetSRID(ST_MakePoint(83.177385, 17.8346808), 4326), '{"KRPL, G614"}', jsonb_build_object('te', 'గొరపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gorapalli, Visakhapatnam', 'Gorapalli గొరపల్లి KRPL, G614', ST_SetSRID(ST_MakePoint(83.177385, 17.8346808), 4326), 40);
    END IF;
    -- Insert Kotnivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotnivanipalem', ST_SetSRID(ST_MakePoint(83.1713375, 17.8323893), 4326), '{"KTNFNPLM, K351"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotnivanipalem, Visakhapatnam', 'Kotnivanipalem  KTNFNPLM, K351', ST_SetSRID(ST_MakePoint(83.1713375, 17.8323893), 4326), 40);
    END IF;
    -- Insert Gavarapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gavarapalem', ST_SetSRID(ST_MakePoint(83.1802708, 17.8454044), 4326), '{"KFRPLM, G161"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gavarapalem, Visakhapatnam', 'Gavarapalem  KFRPLM, G161', ST_SetSRID(ST_MakePoint(83.1802708, 17.8454044), 4326), 40);
    END IF;
    -- Insert Mallunayudupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mallunayudupalem', ST_SetSRID(ST_MakePoint(83.1511447, 17.8244126), 4326), '{"MLNYTPLM, M453"}', jsonb_build_object('te', 'మల్లనాయుడుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mallunayudupalem, Visakhapatnam', 'Mallunayudupalem మల్లనాయుడుపాలెం MLNYTPLM, M453', ST_SetSRID(ST_MakePoint(83.1511447, 17.8244126), 4326), 40);
    END IF;
    -- Insert Mogalipuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mogalipuram', ST_SetSRID(ST_MakePoint(83.158073, 17.8272216), 4326), '{"MKLPRM, M241"}', jsonb_build_object('te', 'మొగలిపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mogalipuram, Visakhapatnam', 'Mogalipuram మొగలిపురం MKLPRM, M241', ST_SetSRID(ST_MakePoint(83.158073, 17.8272216), 4326), 40);
    END IF;
    -- Insert Gullipalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gullipalle', ST_SetSRID(ST_MakePoint(83.1403256, 17.8340415), 4326), '{"KLPL, G414"}', jsonb_build_object('te', 'గుల్లిపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gullipalle, Visakhapatnam', 'Gullipalle గుల్లిపల్లి KLPL, G414', ST_SetSRID(ST_MakePoint(83.1403256, 17.8340415), 4326), 40);
    END IF;
    -- Insert Ganisettipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ganisettipalem', ST_SetSRID(ST_MakePoint(83.1648502, 17.8690266), 4326), '{"KNSTPLM, G523"}', jsonb_build_object('te', 'గనిశెట్టిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ganisettipalem, Visakhapatnam', 'Ganisettipalem గనిశెట్టిపాలెం KNSTPLM, G523', ST_SetSRID(ST_MakePoint(83.1648502, 17.8690266), 4326), 40);
    END IF;
    -- Insert Gulivindada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gulivindada', ST_SetSRID(ST_MakePoint(83.1600779, 17.8724125), 4326), '{"KLFNTT, G415"}', jsonb_build_object('te', 'గులివిందాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gulivindada, Visakhapatnam', 'Gulivindada గులివిందాడ KLFNTT, G415', ST_SetSRID(ST_MakePoint(83.1600779, 17.8724125), 4326), 40);
    END IF;
    -- Insert Gollapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapalem', ST_SetSRID(ST_MakePoint(83.1702602, 17.8460327), 4326), '{"KLPLM, G414"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapalem, Visakhapatnam', 'Gollapalem  KLPLM, G414', ST_SetSRID(ST_MakePoint(83.1702602, 17.8460327), 4326), 10);
    END IF;
    -- Insert Santapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Santapalem', ST_SetSRID(ST_MakePoint(83.1719338, 17.852318), 4326), '{"S531, SNTPLM"}', jsonb_build_object('te', 'సంతపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Santapalem, Visakhapatnam', 'Santapalem సంతపాలెం S531, SNTPLM', ST_SetSRID(ST_MakePoint(83.1719338, 17.852318), 4326), 40);
    END IF;
    -- Insert Dudduwaka (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dudduwaka', ST_SetSRID(ST_MakePoint(83.1103678, 17.8550562), 4326), '{"D320, TTWK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dudduwaka, Visakhapatnam', 'Dudduwaka  D320, TTWK', ST_SetSRID(ST_MakePoint(83.1103678, 17.8550562), 4326), 10);
    END IF;
    -- Insert Boduvalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boduvalasa', ST_SetSRID(ST_MakePoint(83.1370031, 17.8450896), 4326), '{"B314, BTFLS"}', jsonb_build_object('te', 'బోడువలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boduvalasa, Visakhapatnam', 'Boduvalasa బోడువలస B314, BTFLS', ST_SetSRID(ST_MakePoint(83.1370031, 17.8450896), 4326), 40);
    END IF;
    -- Insert Budiredlavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Budiredlavanipalem', ST_SetSRID(ST_MakePoint(83.1254433, 17.8523225), 4326), '{"BTRTLFNPLM, B363"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Budiredlavanipalem, Visakhapatnam', 'Budiredlavanipalem  BTRTLFNPLM, B363', ST_SetSRID(ST_MakePoint(83.1254433, 17.8523225), 4326), 40);
    END IF;
    -- Insert Ayyannapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ayyannapalem', ST_SetSRID(ST_MakePoint(83.123162, 17.8469761), 4326), '{"A514, AYNPLM"}', jsonb_build_object('te', 'అయ్యన్నపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ayyannapalem, Visakhapatnam', 'Ayyannapalem అయ్యన్నపాలెం A514, AYNPLM', ST_SetSRID(ST_MakePoint(83.123162, 17.8469761), 4326), 40);
    END IF;
    -- Insert Malapalli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Malapalli', ST_SetSRID(ST_MakePoint(83.1203324, 17.8492203), 4326), '{"M414, MLPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Malapalli, Visakhapatnam', 'Malapalli  M414, MLPL', ST_SetSRID(ST_MakePoint(83.1203324, 17.8492203), 4326), 10);
    END IF;
    -- Insert Marripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marripalem', ST_SetSRID(ST_MakePoint(83.125906, 17.8574085), 4326), '{"MRPLM, M614"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marripalem, Visakhapatnam', 'Marripalem  MRPLM, M614', ST_SetSRID(ST_MakePoint(83.125906, 17.8574085), 4326), 40);
    END IF;
    -- Insert Ellappi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ellappi', ST_SetSRID(ST_MakePoint(83.1380066, 17.8578521), 4326), '{"ELP, E410"}', jsonb_build_object('te', 'ఎల్లుప్పి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ellappi, Visakhapatnam', 'Ellappi ఎల్లుప్పి ELP, E410', ST_SetSRID(ST_MakePoint(83.1380066, 17.8578521), 4326), 40);
    END IF;
    -- Insert Ramalingapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramalingapuram', ST_SetSRID(ST_MakePoint(83.1300818, 17.9189053), 4326), '{"RMLNKPRM, R545"}', jsonb_build_object('te', 'రామలింగాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramalingapuram, Visakhapatnam', 'Ramalingapuram రామలింగాపురం RMLNKPRM, R545', ST_SetSRID(ST_MakePoint(83.1300818, 17.9189053), 4326), 40);
    END IF;
    -- Insert Erravanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Erravanipalem', ST_SetSRID(ST_MakePoint(83.1331522, 17.890666), 4326), '{"E615, ERFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Erravanipalem, Visakhapatnam', 'Erravanipalem  E615, ERFNPLM', ST_SetSRID(ST_MakePoint(83.1331522, 17.890666), 4326), 10);
    END IF;
    -- Insert Sundarayyapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sundarayyapeta', ST_SetSRID(ST_MakePoint(83.1408906, 17.9053872), 4326), '{"SNTRYPT, S536"}', jsonb_build_object('te', 'సుందరయ్యపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sundarayyapeta, Visakhapatnam', 'Sundarayyapeta సుందరయ్యపేట SNTRYPT, S536', ST_SetSRID(ST_MakePoint(83.1408906, 17.9053872), 4326), 10);
    END IF;
    -- Insert Kottavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottavanipalem', ST_SetSRID(ST_MakePoint(83.1482103, 17.9136243), 4326), '{"K315, KTFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottavanipalem, Visakhapatnam', 'Kottavanipalem  K315, KTFNPLM', ST_SetSRID(ST_MakePoint(83.1482103, 17.9136243), 4326), 40);
    END IF;
    -- Insert Cheedivalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cheedivalasa', ST_SetSRID(ST_MakePoint(83.139159, 17.9015296), 4326), '{"XTFLS, C314"}', jsonb_build_object('te', 'చీడివలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cheedivalasa, Visakhapatnam', 'Cheedivalasa చీడివలస XTFLS, C314', ST_SetSRID(ST_MakePoint(83.139159, 17.9015296), 4326), 40);
    END IF;
    -- Insert Chipuruvalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chipuruvalasa', ST_SetSRID(ST_MakePoint(83.1522662, 17.8898738), 4326), '{"XPRFLS, C161"}', jsonb_build_object('te', 'చీపురువలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chipuruvalasa, Visakhapatnam', 'Chipuruvalasa చీపురువలస XPRFLS, C161', ST_SetSRID(ST_MakePoint(83.1522662, 17.8898738), 4326), 40);
    END IF;
    -- Insert Gollalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(83.1551035, 17.9056047), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem  KLLPLM, G441', ST_SetSRID(ST_MakePoint(83.1551035, 17.9056047), 4326), 40);
    END IF;
    -- Insert Marrivalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marrivalasa', ST_SetSRID(ST_MakePoint(83.1032463, 17.8935267), 4326), '{"M614, MRFLS"}', jsonb_build_object('te', 'మర్రివలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marrivalasa, Visakhapatnam', 'Marrivalasa మర్రివలస M614, MRFLS', ST_SetSRID(ST_MakePoint(83.1032463, 17.8935267), 4326), 40);
    END IF;
    -- Insert Srungavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srungavaram', ST_SetSRID(ST_MakePoint(83.1134011, 17.9035388), 4326), '{"SRNKFRM, S652"}', jsonb_build_object('te', 'శృంగవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srungavaram, Visakhapatnam', 'Srungavaram శృంగవరం SRNKFRM, S652', ST_SetSRID(ST_MakePoint(83.1134011, 17.9035388), 4326), 40);
    END IF;
    -- Insert Gollalapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(83.1184938, 17.914093), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem  KLLPLM, G441', ST_SetSRID(ST_MakePoint(83.1184938, 17.914093), 4326), 10);
    END IF;
    -- Insert Patavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Patavalasa', ST_SetSRID(ST_MakePoint(83.1060125, 17.8851663), 4326), '{"P314, PTFLS"}', jsonb_build_object('te', 'పాతవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Patavalasa, Visakhapatnam', 'Patavalasa పాతవలస P314, PTFLS', ST_SetSRID(ST_MakePoint(83.1060125, 17.8851663), 4326), 40);
    END IF;
    -- Insert Goum (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Goum', ST_SetSRID(ST_MakePoint(83.1195661, 17.8891682), 4326), '{"G500, KM"}', jsonb_build_object('te', 'గొట్లం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Goum, Visakhapatnam', 'Goum గొట్లం G500, KM', ST_SetSRID(ST_MakePoint(83.1195661, 17.8891682), 4326), 40);
    END IF;
    -- Insert Pindrangi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pindrangi', ST_SetSRID(ST_MakePoint(83.1006297, 17.9202918), 4326), '{"P536, PNTRNJ"}', jsonb_build_object('te', 'పిండ్రంగి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pindrangi, Visakhapatnam', 'Pindrangi పిండ్రంగి P536, PNTRNJ', ST_SetSRID(ST_MakePoint(83.1006297, 17.9202918), 4326), 40);
    END IF;
    -- Insert Dikshitulapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dikshitulapalem', ST_SetSRID(ST_MakePoint(83.0932008, 17.9311667), 4326), '{"TKXTLPLM, D234"}', jsonb_build_object('te', 'దీక్షితుల అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dikshitulapalem, Visakhapatnam', 'Dikshitulapalem దీక్షితుల అగ్రహారం TKXTLPLM, D234', ST_SetSRID(ST_MakePoint(83.0932008, 17.9311667), 4326), 40);
    END IF;
    -- Insert Gavarapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gavarapalem', ST_SetSRID(ST_MakePoint(83.0802964, 17.9166455), 4326), '{"KFRPLM, G161"}', jsonb_build_object('te', 'గవరపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gavarapalem, Visakhapatnam', 'Gavarapalem గవరపాలెం KFRPLM, G161', ST_SetSRID(ST_MakePoint(83.0802964, 17.9166455), 4326), 40);
    END IF;
    -- Insert Lankavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lankavanipalem', ST_SetSRID(ST_MakePoint(83.1056422, 17.937853), 4326), '{"L521, LNKFNPLM"}', jsonb_build_object('te', 'లంకవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lankavanipalem, Visakhapatnam', 'Lankavanipalem లంకవానిపాలెం L521, LNKFNPLM', ST_SetSRID(ST_MakePoint(83.1056422, 17.937853), 4326), 40);
    END IF;
    -- Insert Jagannadhapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jagannadhapuram', ST_SetSRID(ST_MakePoint(83.0679318, 17.9210796), 4326), '{"JKNTHPRM, J253"}', jsonb_build_object('te', 'కొరువాడ జగన్నాధపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jagannadhapuram, Visakhapatnam', 'Jagannadhapuram కొరువాడ జగన్నాధపురం JKNTHPRM, J253', ST_SetSRID(ST_MakePoint(83.0679318, 17.9210796), 4326), 40);
    END IF;
    -- Insert Korovada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Korovada', ST_SetSRID(ST_MakePoint(83.0797837, 17.9323756), 4326), '{"K613, KRFT"}', jsonb_build_object('te', 'కొరువాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Korovada, Visakhapatnam', 'Korovada కొరువాడ K613, KRFT', ST_SetSRID(ST_MakePoint(83.0797837, 17.9323756), 4326), 40);
    END IF;
    -- Insert Sambayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sambayyapalem', ST_SetSRID(ST_MakePoint(83.0924381, 17.9665965), 4326), '{"S511, SMBYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sambayyapalem, Visakhapatnam', 'Sambayyapalem  S511, SMBYPLM', ST_SetSRID(ST_MakePoint(83.0924381, 17.9665965), 4326), 40);
    END IF;
    -- Insert Potampeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Potampeta', ST_SetSRID(ST_MakePoint(83.0982938, 17.9778525), 4326), '{"P351, PTMPT"}', jsonb_build_object('te', 'పొతంపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Potampeta, Visakhapatnam', 'Potampeta పొతంపేట P351, PTMPT', ST_SetSRID(ST_MakePoint(83.0982938, 17.9778525), 4326), 40);
    END IF;
    -- Insert Banadi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Banadi', ST_SetSRID(ST_MakePoint(83.0835202, 17.9838812), 4326), '{"B530, BNT"}', jsonb_build_object('te', 'బానాది'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Banadi, Visakhapatnam', 'Banadi బానాది B530, BNT', ST_SetSRID(ST_MakePoint(83.0835202, 17.9838812), 4326), 40);
    END IF;
    -- Insert Ballanki (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ballanki', ST_SetSRID(ST_MakePoint(83.0736258, 17.9766888), 4326), '{"B452, BLNK"}', jsonb_build_object('te', 'బల్లంకి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ballanki, Visakhapatnam', 'Ballanki బల్లంకి B452, BLNK', ST_SetSRID(ST_MakePoint(83.0736258, 17.9766888), 4326), 40);
    END IF;
    -- Insert Maicherla Singavaram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maicherla Singavaram', ST_SetSRID(ST_MakePoint(83.0827088, 17.9891962), 4326), '{"MXRL SNKFRM, M264"}', jsonb_build_object('te', 'మైచెర్ల సింగవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maicherla Singavaram, Visakhapatnam', 'Maicherla Singavaram మైచెర్ల సింగవరం MXRL SNKFRM, M264', ST_SetSRID(ST_MakePoint(83.0827088, 17.9891962), 4326), 10);
    END IF;
    -- Insert Achchayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Achchayyapalem', ST_SetSRID(ST_MakePoint(83.0132029, 17.9644655), 4326), '{"A214, AXXYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Achchayyapalem, Visakhapatnam', 'Achchayyapalem  A214, AXXYPLM', ST_SetSRID(ST_MakePoint(83.0132029, 17.9644655), 4326), 40);
    END IF;
    -- Insert Musidipalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Musidipalle', ST_SetSRID(ST_MakePoint(83.0286069, 17.954693), 4326), '{"MSTPL, M231"}', jsonb_build_object('te', 'ముషిడిపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Musidipalle, Visakhapatnam', 'Musidipalle ముషిడిపల్లి MSTPL, M231', ST_SetSRID(ST_MakePoint(83.0286069, 17.954693), 4326), 40);
    END IF;
    -- Insert Panduripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Panduripalem', ST_SetSRID(ST_MakePoint(83.0124591, 17.9574174), 4326), '{"PNTRPLM, P536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Panduripalem, Visakhapatnam', 'Panduripalem  PNTRPLM, P536', ST_SetSRID(ST_MakePoint(83.0124591, 17.9574174), 4326), 40);
    END IF;
    -- Insert Mutyalammapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mutyalammapalem', ST_SetSRID(ST_MakePoint(83.0190591, 17.9449199), 4326), '{"M345, MTYLMPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mutyalammapalem, Visakhapatnam', 'Mutyalammapalem  M345, MTYLMPLM', ST_SetSRID(ST_MakePoint(83.0190591, 17.9449199), 4326), 40);
    END IF;
    -- Insert Kottapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottapalle', ST_SetSRID(ST_MakePoint(83.0124843, 17.94647), 4326), '{"KTPL, K314"}', jsonb_build_object('te', 'అలమండకొత్తపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottapalle, Visakhapatnam', 'Kottapalle అలమండకొత్తపల్లి KTPL, K314', ST_SetSRID(ST_MakePoint(83.0124843, 17.94647), 4326), 40);
    END IF;
    -- Insert Potanavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Potanavalasa', ST_SetSRID(ST_MakePoint(83.0605345, 17.9471022), 4326), '{"P351, PTNFLS"}', jsonb_build_object('te', 'పొతనవలస అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Potanavalasa, Visakhapatnam', 'Potanavalasa పొతనవలస అగ్రహారం P351, PTNFLS', ST_SetSRID(ST_MakePoint(83.0605345, 17.9471022), 4326), 40);
    END IF;
    -- Insert Ramayogi Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramayogi Agraharam', ST_SetSRID(ST_MakePoint(83.0589277, 17.9317327), 4326), '{"RMYJ AKRHRM, R522"}', jsonb_build_object('te', 'రామాయొగి అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramayogi Agraharam, Visakhapatnam', 'Ramayogi Agraharam రామాయొగి అగ్రహారం RMYJ AKRHRM, R522', ST_SetSRID(ST_MakePoint(83.0589277, 17.9317327), 4326), 40);
    END IF;
    -- Insert Ugginavalasa (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ugginavalasa', ST_SetSRID(ST_MakePoint(83.0623452, 17.9426147), 4326), '{"U251, UJNFLS"}', jsonb_build_object('te', 'ఉగ్గినవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ugginavalasa, Visakhapatnam', 'Ugginavalasa ఉగ్గినవలస U251, UJNFLS', ST_SetSRID(ST_MakePoint(83.0623452, 17.9426147), 4326), 10);
    END IF;
    -- Insert Varada Satapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Varada Satapalem', ST_SetSRID(ST_MakePoint(83.0462, 17.9477216), 4326), '{"V632, FRT STPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Varada Satapalem, Visakhapatnam', 'Varada Satapalem  V632, FRT STPLM', ST_SetSRID(ST_MakePoint(83.0462, 17.9477216), 4326), 40);
    END IF;
    -- Insert Krishnarayudupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Krishnarayudupeta', ST_SetSRID(ST_MakePoint(83.0726461, 17.9557965), 4326), '{"K625, KRXNRYTPT"}', jsonb_build_object('te', 'కృష్ణరాయుడుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Krishnarayudupeta, Visakhapatnam', 'Krishnarayudupeta కృష్ణరాయుడుపేట K625, KRXNRYTPT', ST_SetSRID(ST_MakePoint(83.0726461, 17.9557965), 4326), 40);
    END IF;
    -- Insert Ankajosyunipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ankajosyunipalem', ST_SetSRID(ST_MakePoint(83.0629474, 17.9555998), 4326), '{"ANKJSYNPLM, A522"}', jsonb_build_object('te', 'అంకజోశ్యులపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ankajosyunipalem, Visakhapatnam', 'Ankajosyunipalem అంకజోశ్యులపాలెం ANKJSYNPLM, A522', ST_SetSRID(ST_MakePoint(83.0629474, 17.9555998), 4326), 10);
    END IF;
    -- Insert Anandapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Anandapuram', ST_SetSRID(ST_MakePoint(83.0531227, 17.9569454), 4326), '{"ANNTPRM, A553"}', jsonb_build_object('te', 'ఆనందపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Anandapuram, Visakhapatnam', 'Anandapuram ఆనందపురం ANNTPRM, A553', ST_SetSRID(ST_MakePoint(83.0531227, 17.9569454), 4326), 40);
    END IF;
    -- Insert Nilakantharajapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nilakantharajapuram', ST_SetSRID(ST_MakePoint(83.0543384, 17.9726263), 4326), '{"N425, NLKN0RJPRM"}', jsonb_build_object('te', 'నీలకంఠరాజపురం అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nilakantharajapuram, Visakhapatnam', 'Nilakantharajapuram నీలకంఠరాజపురం అగ్రహారం N425, NLKN0RJPRM', ST_SetSRID(ST_MakePoint(83.0543384, 17.9726263), 4326), 40);
    END IF;
    -- Insert Chinna Gudipala (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Gudipala', ST_SetSRID(ST_MakePoint(83.0463036, 17.976897), 4326), '{"XN KTPL, C523"}', jsonb_build_object('te', 'చినగుడిపాల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Gudipala, Visakhapatnam', 'Chinna Gudipala చినగుడిపాల XN KTPL, C523', ST_SetSRID(ST_MakePoint(83.0463036, 17.976897), 4326), 40);
    END IF;
    -- Insert Jammadevipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jammadevipeta', ST_SetSRID(ST_MakePoint(83.0434778, 17.9682933), 4326), '{"J531, JMTFPT"}', jsonb_build_object('te', 'జమ్మదేవిపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jammadevipeta, Visakhapatnam', 'Jammadevipeta జమ్మదేవిపేట J531, JMTFPT', ST_SetSRID(ST_MakePoint(83.0434778, 17.9682933), 4326), 40);
    END IF;
    -- Insert Pedda Gudipala (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Gudipala', ST_SetSRID(ST_MakePoint(83.0592549, 17.9809388), 4326), '{"P323, PT KTPL"}', jsonb_build_object('te', 'పెదగుడిపాల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Gudipala, Visakhapatnam', 'Pedda Gudipala పెదగుడిపాల P323, PT KTPL', ST_SetSRID(ST_MakePoint(83.0592549, 17.9809388), 4326), 40);
    END IF;
    -- Insert Bharathavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bharathavanipalem', ST_SetSRID(ST_MakePoint(83.0612563, 17.9858472), 4326), '{"B631, BHR0FNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bharathavanipalem, Visakhapatnam', 'Bharathavanipalem  B631, BHR0FNPLM', ST_SetSRID(ST_MakePoint(83.0612563, 17.9858472), 4326), 40);
    END IF;
    -- Insert Anandapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Anandapuram', ST_SetSRID(ST_MakePoint(83.0521821, 17.9922897), 4326), '{"ANNTPRM, A553"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Anandapuram, Visakhapatnam', 'Anandapuram  ANNTPRM, A553', ST_SetSRID(ST_MakePoint(83.0521821, 17.9922897), 4326), 40);
    END IF;
    -- Insert Rayudupeta Agraharam (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rayudupeta Agraharam', ST_SetSRID(ST_MakePoint(83.0457595, 17.9925712), 4326), '{"RYTPT AKRHRM, R313"}', jsonb_build_object('te', 'రాయుడుపేట అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rayudupeta Agraharam, Visakhapatnam', 'Rayudupeta Agraharam రాయుడుపేట అగ్రహారం RYTPT AKRHRM, R313', ST_SetSRID(ST_MakePoint(83.0457595, 17.9925712), 4326), 10);
    END IF;
    -- Insert Bakkunayudupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bakkunayudupeta', ST_SetSRID(ST_MakePoint(83.0625874, 17.9977895), 4326), '{"B253, BKNYTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bakkunayudupeta, Visakhapatnam', 'Bakkunayudupeta  B253, BKNYTPT', ST_SetSRID(ST_MakePoint(83.0625874, 17.9977895), 4326), 40);
    END IF;
    -- Insert Rayudupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rayudupeta', ST_SetSRID(ST_MakePoint(83.0578701, 17.9995696), 4326), '{"RYTPT, R313"}', jsonb_build_object('te', 'రాయుడుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rayudupeta, Visakhapatnam', 'Rayudupeta రాయుడుపేట RYTPT, R313', ST_SetSRID(ST_MakePoint(83.0578701, 17.9995696), 4326), 40);
    END IF;
    -- Insert Chinna Nallabilli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Nallabilli', ST_SetSRID(ST_MakePoint(83.0380502, 17.9885446), 4326), '{"C554, XN NLBL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Nallabilli, Visakhapatnam', 'Chinna Nallabilli  C554, XN NLBL', ST_SetSRID(ST_MakePoint(83.0380502, 17.9885446), 4326), 10);
    END IF;
    -- Insert Chamaladevi Agraharam (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chamaladevi Agraharam', ST_SetSRID(ST_MakePoint(83.0346404, 17.9969623), 4326), '{"XMLTF AKRHRM, C543"}', jsonb_build_object('te', 'చామలదీవి అగ్రహరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chamaladevi Agraharam, Visakhapatnam', 'Chamaladevi Agraharam చామలదీవి అగ్రహరం XMLTF AKRHRM, C543', ST_SetSRID(ST_MakePoint(83.0346404, 17.9969623), 4326), 10);
    END IF;
    -- Insert Vavilapadu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vavilapadu', ST_SetSRID(ST_MakePoint(83.0221721, 17.9930937), 4326), '{"FFLPT, V141"}', jsonb_build_object('te', 'వావిళ్లపాడు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vavilapadu, Visakhapatnam', 'Vavilapadu వావిళ్లపాడు FFLPT, V141', ST_SetSRID(ST_MakePoint(83.0221721, 17.9930937), 4326), 40);
    END IF;
    -- Insert Srirampuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srirampuram', ST_SetSRID(ST_MakePoint(83.0260544, 17.9742408), 4326), '{"S665, SRRMPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srirampuram, Visakhapatnam', 'Srirampuram  S665, SRRMPRM', ST_SetSRID(ST_MakePoint(83.0260544, 17.9742408), 4326), 10);
    END IF;
    -- Insert Nallabilli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nallabilli', ST_SetSRID(ST_MakePoint(83.0302923, 17.9798264), 4326), '{"N414, NLBL"}', jsonb_build_object('te', 'నల్లబిల్లి కాశీపతిరాజపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nallabilli, Visakhapatnam', 'Nallabilli నల్లబిల్లి కాశీపతిరాజపురం N414, NLBL', ST_SetSRID(ST_MakePoint(83.0302923, 17.9798264), 4326), 40);
    END IF;
    -- Insert Kasipuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kasipuram', ST_SetSRID(ST_MakePoint(83.0005533, 17.9830016), 4326), '{"K216, KSPRM"}', jsonb_build_object('te', 'కాశీపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kasipuram, Visakhapatnam', 'Kasipuram కాశీపురం K216, KSPRM', ST_SetSRID(ST_MakePoint(83.0005533, 17.9830016), 4326), 40);
    END IF;
    -- Insert Sanjivapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sanjivapuram', ST_SetSRID(ST_MakePoint(83.0104397, 17.9772559), 4326), '{"SNJFPRM, S521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sanjivapuram, Visakhapatnam', 'Sanjivapuram  SNJFPRM, S521', ST_SetSRID(ST_MakePoint(83.0104397, 17.9772559), 4326), 40);
    END IF;
    -- Insert Chandrayyapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chandrayyapeta', ST_SetSRID(ST_MakePoint(82.9978178, 17.9762061), 4326), '{"C536, XNTRYPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chandrayyapeta, Visakhapatnam', 'Chandrayyapeta  C536, XNTRYPT', ST_SetSRID(ST_MakePoint(82.9978178, 17.9762061), 4326), 10);
    END IF;
    -- Insert Chamalapalle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chamalapalle', ST_SetSRID(ST_MakePoint(83.2106693, 18.0960161), 4326), '{"C541, XMLPL"}', jsonb_build_object('te', 'చామలాపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chamalapalle, Visakhapatnam', 'Chamalapalle చామలాపల్లి C541, XMLPL', ST_SetSRID(ST_MakePoint(83.2106693, 18.0960161), 4326), 10);
    END IF;
    -- Insert Chukkavaripalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chukkavaripalem', ST_SetSRID(ST_MakePoint(83.1882832, 18.095201), 4326), '{"XKFRPLM, C216"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chukkavaripalem, Visakhapatnam', 'Chukkavaripalem  XKFRPLM, C216', ST_SetSRID(ST_MakePoint(83.1882832, 18.095201), 4326), 10);
    END IF;
    -- Insert Santa Gavarampeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Santa Gavarampeta', ST_SetSRID(ST_MakePoint(83.1766607, 18.0999802), 4326), '{"S532, SNT KFRMPT"}', jsonb_build_object('te', 'సంతగవరంపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Santa Gavarampeta, Visakhapatnam', 'Santa Gavarampeta సంతగవరంపేట S532, SNT KFRMPT', ST_SetSRID(ST_MakePoint(83.1766607, 18.0999802), 4326), 40);
    END IF;
    -- Insert Kondamallapudi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondamallapudi', ST_SetSRID(ST_MakePoint(83.1104819, 18.0921842), 4326), '{"K535, KNTMLPT"}', jsonb_build_object('te', 'కొండమల్లిపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondamallapudi, Visakhapatnam', 'Kondamallapudi కొండమల్లిపూడి K535, KNTMLPT', ST_SetSRID(ST_MakePoint(83.1104819, 18.0921842), 4326), 10);
    END IF;
    -- Insert Venkataramanipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkataramanipeta', ST_SetSRID(ST_MakePoint(83.1368108, 18.0833547), 4326), '{"V523, FNKTRMNPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkataramanipeta, Visakhapatnam', 'Venkataramanipeta  V523, FNKTRMNPT', ST_SetSRID(ST_MakePoint(83.1368108, 18.0833547), 4326), 40);
    END IF;
    -- Insert Kottavuru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottavuru', ST_SetSRID(ST_MakePoint(83.1376347, 18.0910683), 4326), '{"K316, KTFR"}', jsonb_build_object('te', 'కొత్తవూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottavuru, Visakhapatnam', 'Kottavuru కొత్తవూరు K316, KTFR', ST_SetSRID(ST_MakePoint(83.1376347, 18.0910683), 4326), 40);
    END IF;
    -- Insert Dampuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dampuram', ST_SetSRID(ST_MakePoint(83.136784, 18.0746912), 4326), '{"D516, TMPRM"}', jsonb_build_object('te', 'దాంపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dampuram, Visakhapatnam', 'Dampuram దాంపురం D516, TMPRM', ST_SetSRID(ST_MakePoint(83.136784, 18.0746912), 4326), 10);
    END IF;
    -- Insert Sivaramarajupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sivaramarajupeta', ST_SetSRID(ST_MakePoint(83.1520011, 18.0912775), 4326), '{"SFRMRJPT, S165"}', jsonb_build_object('te', 'బాలకృష్ణరాజపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sivaramarajupeta, Visakhapatnam', 'Sivaramarajupeta బాలకృష్ణరాజపురం SFRMRJPT, S165', ST_SetSRID(ST_MakePoint(83.1520011, 18.0912775), 4326), 40);
    END IF;
    -- Insert Sitarampuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sitarampuram', ST_SetSRID(ST_MakePoint(83.0917654, 18.0721903), 4326), '{"STRMPRM, S365"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sitarampuram, Visakhapatnam', 'Sitarampuram  STRMPRM, S365', ST_SetSRID(ST_MakePoint(83.0917654, 18.0721903), 4326), 10);
    END IF;
    -- Insert Bangarayyapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bangarayyapeta', ST_SetSRID(ST_MakePoint(83.0862958, 18.0846427), 4326), '{"BNKRYPT, B526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bangarayyapeta, Visakhapatnam', 'Bangarayyapeta  BNKRYPT, B526', ST_SetSRID(ST_MakePoint(83.0862958, 18.0846427), 4326), 10);
    END IF;
    -- Insert Pedda Krishnarajapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Krishnarajapuram', ST_SetSRID(ST_MakePoint(83.1032534, 18.0703935), 4326), '{"PT KRXNRJPRM, P326"}', jsonb_build_object('te', 'పెదకృష్ణరాజ పురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Krishnarajapuram, Visakhapatnam', 'Pedda Krishnarajapuram పెదకృష్ణరాజ పురం PT KRXNRJPRM, P326', ST_SetSRID(ST_MakePoint(83.1032534, 18.0703935), 4326), 10);
    END IF;
    -- Insert Santivanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Santivanipalem', ST_SetSRID(ST_MakePoint(83.0763911, 18.0781355), 4326), '{"S531, SNTFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Santivanipalem, Visakhapatnam', 'Santivanipalem  S531, SNTFNPLM', ST_SetSRID(ST_MakePoint(83.0763911, 18.0781355), 4326), 10);
    END IF;
    -- Insert Konda Gangupudi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Konda Gangupudi', ST_SetSRID(ST_MakePoint(83.080529, 18.0665775), 4326), '{"KNT KNKPT, K532"}', jsonb_build_object('te', 'కొండగంగుపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Konda Gangupudi, Visakhapatnam', 'Konda Gangupudi కొండగంగుపూడి KNT KNKPT, K532', ST_SetSRID(ST_MakePoint(83.080529, 18.0665775), 4326), 10);
    END IF;
    -- Insert Mallepudi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mallepudi', ST_SetSRID(ST_MakePoint(83.118195, 18.0830129), 4326), '{"M413, MLPT"}', jsonb_build_object('te', 'మల్లిపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mallepudi, Visakhapatnam', 'Mallepudi మల్లిపూడి M413, MLPT', ST_SetSRID(ST_MakePoint(83.118195, 18.0830129), 4326), 10);
    END IF;
    -- Insert Devarapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Devarapalli', ST_SetSRID(ST_MakePoint(82.9809311, 17.9894427), 4326), '{"D161, TFRPL"}', jsonb_build_object('te', 'దేవరాపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Devarapalli, Visakhapatnam', 'Devarapalli దేవరాపల్లి D161, TFRPL', ST_SetSRID(ST_MakePoint(82.9809311, 17.9894427), 4326), 40);
    END IF;
    -- Insert Raivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Raivada', ST_SetSRID(ST_MakePoint(82.9873867, 18.0056008), 4326), '{"RFT, R130"}', jsonb_build_object('te', 'రైవాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Raivada, Visakhapatnam', 'Raivada రైవాడ RFT, R130', ST_SetSRID(ST_MakePoint(82.9873867, 18.0056008), 4326), 40);
    END IF;
    -- Insert Pedda Kadakonda (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Kadakonda', ST_SetSRID(ST_MakePoint(83.0091974, 18.0119602), 4326), '{"P323, PT KTKNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Kadakonda, Visakhapatnam', 'Pedda Kadakonda  P323, PT KTKNT', ST_SetSRID(ST_MakePoint(83.0091974, 18.0119602), 4326), 10);
    END IF;
    -- Insert Kappalavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kappalavanipalem', ST_SetSRID(ST_MakePoint(83.0200595, 18.0195977), 4326), '{"K141, KPLFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kappalavanipalem, Visakhapatnam', 'Kappalavanipalem  K141, KPLFNPLM', ST_SetSRID(ST_MakePoint(83.0200595, 18.0195977), 4326), 10);
    END IF;
    -- Insert Sampura (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sampura', ST_SetSRID(ST_MakePoint(82.9958339, 18.0182721), 4326), '{"S516, SMPR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sampura, Visakhapatnam', 'Sampura  S516, SMPR', ST_SetSRID(ST_MakePoint(82.9958339, 18.0182721), 4326), 10);
    END IF;
    -- Insert Juttadavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Juttadavanipalem', ST_SetSRID(ST_MakePoint(83.0023359, 18.0131038), 4326), '{"J331, JTTFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Juttadavanipalem, Visakhapatnam', 'Juttadavanipalem  J331, JTTFNPLM', ST_SetSRID(ST_MakePoint(83.0023359, 18.0131038), 4326), 10);
    END IF;
    -- Insert Korkapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Korkapalem', ST_SetSRID(ST_MakePoint(83.0408949, 18.0145708), 4326), '{"KRKPLM, K621"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Korkapalem, Visakhapatnam', 'Korkapalem  KRKPLM, K621', ST_SetSRID(ST_MakePoint(83.0408949, 18.0145708), 4326), 10);
    END IF;
    -- Insert Veladam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Veladam', ST_SetSRID(ST_MakePoint(83.0512947, 18.0113621), 4326), '{"V435, FLTM"}', jsonb_build_object('te', 'వెల్దాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Veladam, Visakhapatnam', 'Veladam వెల్దాం V435, FLTM', ST_SetSRID(ST_MakePoint(83.0512947, 18.0113621), 4326), 40);
    END IF;
    -- Insert Sitammapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sitammapeta', ST_SetSRID(ST_MakePoint(83.1009703, 18.0181709), 4326), '{"STMPT, S351"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sitammapeta, Visakhapatnam', 'Sitammapeta  STMPT, S351', ST_SetSRID(ST_MakePoint(83.1009703, 18.0181709), 4326), 10);
    END IF;
    -- Insert Vellampadu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vellampadu', ST_SetSRID(ST_MakePoint(83.0770658, 18.0175285), 4326), '{"V451, FLMPT"}', jsonb_build_object('te', 'వల్లంపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vellampadu, Visakhapatnam', 'Vellampadu వల్లంపూడి V451, FLMPT', ST_SetSRID(ST_MakePoint(83.0770658, 18.0175285), 4326), 10);
    END IF;
    -- Insert Musiram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Musiram', ST_SetSRID(ST_MakePoint(83.1231624, 17.9305454), 4326), '{"M265, MSRM"}', jsonb_build_object('te', 'ముసిరాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Musiram, Visakhapatnam', 'Musiram ముసిరాం M265, MSRM', ST_SetSRID(ST_MakePoint(83.1231624, 17.9305454), 4326), 40);
    END IF;
    -- Insert Narasammapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narasammapeta', ST_SetSRID(ST_MakePoint(83.0971328, 17.9614382), 4326), '{"N625, NRSMPT"}', jsonb_build_object('te', 'నరసంపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narasammapeta, Visakhapatnam', 'Narasammapeta నరసంపేట N625, NRSMPT', ST_SetSRID(ST_MakePoint(83.0971328, 17.9614382), 4326), 40);
    END IF;
    -- Insert Kummapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kummapalli', ST_SetSRID(ST_MakePoint(83.0900997, 17.9492391), 4326), '{"KMPL, K514"}', jsonb_build_object('te', 'కుమ్మపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kummapalli, Visakhapatnam', 'Kummapalli కుమ్మపల్లి KMPL, K514', ST_SetSRID(ST_MakePoint(83.0900997, 17.9492391), 4326), 40);
    END IF;
    -- Insert Kallepalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kallepalli', ST_SetSRID(ST_MakePoint(83.1259951, 17.95217), 4326), '{"KLPL, K414"}', jsonb_build_object('te', 'కల్లెపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kallepalli, Visakhapatnam', 'Kallepalli కల్లెపల్లి KLPL, K414', ST_SetSRID(ST_MakePoint(83.1259951, 17.95217), 4326), 40);
    END IF;
    -- Insert Nilkanthapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nilkanthapuram', ST_SetSRID(ST_MakePoint(83.1053968, 17.9575298), 4326), '{"N425, NLKN0PRM"}', jsonb_build_object('te', 'నీలకంటాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nilkanthapuram, Visakhapatnam', 'Nilkanthapuram నీలకంటాపురం N425, NLKN0PRM', ST_SetSRID(ST_MakePoint(83.1053968, 17.9575298), 4326), 10);
    END IF;
    -- Insert Rega (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rega', ST_SetSRID(ST_MakePoint(83.1195788, 17.9514994), 4326), '{"R200, RK"}', jsonb_build_object('te', 'రేగ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rega, Visakhapatnam', 'Rega రేగ R200, RK', ST_SetSRID(ST_MakePoint(83.1195788, 17.9514994), 4326), 40);
    END IF;
    -- Insert Masivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Masivanipalem', ST_SetSRID(ST_MakePoint(83.1386874, 17.9367175), 4326), '{"M215, MSFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Masivanipalem, Visakhapatnam', 'Masivanipalem  M215, MSFNPLM', ST_SetSRID(ST_MakePoint(83.1386874, 17.9367175), 4326), 40);
    END IF;
    -- Insert Pednedlapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pednedlapalem', ST_SetSRID(ST_MakePoint(83.1079992, 17.9510064), 4326), '{"P353, PTNTLPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pednedlapalem, Visakhapatnam', 'Pednedlapalem  P353, PTNTLPLM', ST_SetSRID(ST_MakePoint(83.1079992, 17.9510064), 4326), 10);
    END IF;
    -- Insert Tamarapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tamarapalli', ST_SetSRID(ST_MakePoint(83.1470024, 17.9517495), 4326), '{"TMRPL, T561"}', jsonb_build_object('te', 'తామరాపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tamarapalli, Visakhapatnam', 'Tamarapalli తామరాపల్లి TMRPL, T561', ST_SetSRID(ST_MakePoint(83.1470024, 17.9517495), 4326), 40);
    END IF;
    -- Insert Devada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Devada', ST_SetSRID(ST_MakePoint(83.1433882, 17.9258706), 4326), '{"TFT, D130"}', jsonb_build_object('te', 'దేవాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Devada, Visakhapatnam', 'Devada దేవాడ TFT, D130', ST_SetSRID(ST_MakePoint(83.1433882, 17.9258706), 4326), 40);
    END IF;
    -- Insert Viyyammapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Viyyammapeta', ST_SetSRID(ST_MakePoint(83.1511327, 17.9217034), 4326), '{"V513, FYMPT"}', jsonb_build_object('te', 'వియ్యంపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Viyyammapeta, Visakhapatnam', 'Viyyammapeta వియ్యంపేట V513, FYMPT', ST_SetSRID(ST_MakePoint(83.1511327, 17.9217034), 4326), 40);
    END IF;
    -- Insert Virabhadrapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Virabhadrapuram', ST_SetSRID(ST_MakePoint(83.1673058, 17.9217997), 4326), '{"V613, FRBHTRPRM"}', jsonb_build_object('te', 'వీరభద్రపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Virabhadrapuram, Visakhapatnam', 'Virabhadrapuram వీరభద్రపురం V613, FRBHTRPRM', ST_SetSRID(ST_MakePoint(83.1673058, 17.9217997), 4326), 40);
    END IF;
    -- Insert Narapam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narapam', ST_SetSRID(ST_MakePoint(83.1622096, 17.9282273), 4326), '{"N615, NRPM"}', jsonb_build_object('te', 'నరపాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narapam, Visakhapatnam', 'Narapam నరపాం N615, NRPM', ST_SetSRID(ST_MakePoint(83.1622096, 17.9282273), 4326), 40);
    END IF;
    -- Insert Tummikapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tummikapalle', ST_SetSRID(ST_MakePoint(83.1788231, 17.912637), 4326), '{"TMKPL, T521"}', jsonb_build_object('te', 'తుమ్మికాపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tummikapalle, Visakhapatnam', 'Tummikapalle తుమ్మికాపల్లి TMKPL, T521', ST_SetSRID(ST_MakePoint(83.1788231, 17.912637), 4326), 40);
    END IF;
    -- Insert Tummikapalli Gate (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tummikapalli Gate', ST_SetSRID(ST_MakePoint(83.1864944, 17.9087449), 4326), '{"TMKPL KT, T521"}', jsonb_build_object('te', 'తుమ్మికాపల్లి గేటు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tummikapalli Gate, Visakhapatnam', 'Tummikapalli Gate తుమ్మికాపల్లి గేటు TMKPL KT, T521', ST_SetSRID(ST_MakePoint(83.1864944, 17.9087449), 4326), 40);
    END IF;
    -- Insert Karrichennayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karrichennayyapalem', ST_SetSRID(ST_MakePoint(83.1756778, 17.9227291), 4326), '{"KRXNYPLM, K625"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karrichennayyapalem, Visakhapatnam', 'Karrichennayyapalem  KRXNYPLM, K625', ST_SetSRID(ST_MakePoint(83.1756778, 17.9227291), 4326), 40);
    END IF;
    -- Insert Addupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Addupalem', ST_SetSRID(ST_MakePoint(83.1853538, 17.9240913), 4326), '{"A314, ATPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Addupalem, Visakhapatnam', 'Addupalem  A314, ATPLM', ST_SetSRID(ST_MakePoint(83.1853538, 17.9240913), 4326), 40);
    END IF;
    -- Insert Nimmalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nimmalapalem', ST_SetSRID(ST_MakePoint(83.1792974, 17.9304113), 4326), '{"NMLPLM, N541"}', jsonb_build_object('te', 'నిమ్మలపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nimmalapalem, Visakhapatnam', 'Nimmalapalem నిమ్మలపాలెం NMLPLM, N541', ST_SetSRID(ST_MakePoint(83.1792974, 17.9304113), 4326), 40);
    END IF;
    -- Insert Appannapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appannapalem', ST_SetSRID(ST_MakePoint(83.1838238, 17.9420248), 4326), '{"A151, APNPLM"}', jsonb_build_object('te', 'ఆప్పన్నపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appannapalem, Visakhapatnam', 'Appannapalem ఆప్పన్నపాలెం A151, APNPLM', ST_SetSRID(ST_MakePoint(83.1838238, 17.9420248), 4326), 40);
    END IF;
    -- Insert Rayapurajupeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rayapurajupeta', ST_SetSRID(ST_MakePoint(83.1782276, 17.9446705), 4326), '{"R162, RYPRJPT"}', jsonb_build_object('te', 'రాయపురాజుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rayapurajupeta, Visakhapatnam', 'Rayapurajupeta రాయపురాజుపేట R162, RYPRJPT', ST_SetSRID(ST_MakePoint(83.1782276, 17.9446705), 4326), 10);
    END IF;
    -- Insert Kottapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottapalem', ST_SetSRID(ST_MakePoint(83.1641142, 17.968523), 4326), '{"KTPLM, K314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottapalem, Visakhapatnam', 'Kottapalem  KTPLM, K314', ST_SetSRID(ST_MakePoint(83.1641142, 17.968523), 4326), 40);
    END IF;
    -- Insert Gajapatinagaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gajapatinagaram', ST_SetSRID(ST_MakePoint(83.1713262, 17.9578372), 4326), '{"G213, KJPTNKRM"}', jsonb_build_object('te', 'గజపతినగరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gajapatinagaram, Visakhapatnam', 'Gajapatinagaram గజపతినగరం G213, KJPTNKRM', ST_SetSRID(ST_MakePoint(83.1713262, 17.9578372), 4326), 40);
    END IF;
    -- Insert Mallividu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mallividu', ST_SetSRID(ST_MakePoint(83.1757593, 17.9688033), 4326), '{"M413, MLFT"}', jsonb_build_object('te', 'మల్లివీడు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mallividu, Visakhapatnam', 'Mallividu మల్లివీడు M413, MLFT', ST_SetSRID(ST_MakePoint(83.1757593, 17.9688033), 4326), 40);
    END IF;
    -- Insert Srirampuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srirampuram', ST_SetSRID(ST_MakePoint(83.1542189, 17.9630908), 4326), '{"S665, SRRMPRM"}', jsonb_build_object('te', 'శ్రీరాంపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srirampuram, Visakhapatnam', 'Srirampuram శ్రీరాంపురం S665, SRRMPRM', ST_SetSRID(ST_MakePoint(83.1542189, 17.9630908), 4326), 10);
    END IF;
    -- Insert Relligavirammapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Relligavirammapeta', ST_SetSRID(ST_MakePoint(83.1565067, 17.9753212), 4326), '{"RLKFRMPT, R421"}', jsonb_build_object('te', 'రెల్లిగవిరమ్మపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Relligavirammapeta, Visakhapatnam', 'Relligavirammapeta రెల్లిగవిరమ్మపేట RLKFRMPT, R421', ST_SetSRID(ST_MakePoint(83.1565067, 17.9753212), 4326), 40);
    END IF;
    -- Insert Pudivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pudivanipalem', ST_SetSRID(ST_MakePoint(83.1305809, 17.9730556), 4326), '{"PTFNPLM, P315"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pudivanipalem, Visakhapatnam', 'Pudivanipalem  PTFNPLM, P315', ST_SetSRID(ST_MakePoint(83.1305809, 17.9730556), 4326), 40);
    END IF;
    -- Insert Lachchampeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lachchampeta', ST_SetSRID(ST_MakePoint(83.1149281, 17.9664939), 4326), '{"L251, LXXMPT"}', jsonb_build_object('te', 'లచ్చంపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lachchampeta, Visakhapatnam', 'Lachchampeta లచ్చంపేట L251, LXXMPT', ST_SetSRID(ST_MakePoint(83.1149281, 17.9664939), 4326), 40);
    END IF;
    -- Insert Bumireddipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bumireddipalem', ST_SetSRID(ST_MakePoint(83.1123297, 17.9774104), 4326), '{"B563, BMRTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bumireddipalem, Visakhapatnam', 'Bumireddipalem  B563, BMRTPLM', ST_SetSRID(ST_MakePoint(83.1123297, 17.9774104), 4326), 10);
    END IF;
    -- Insert Khudduvalasa (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Khudduvalasa', ST_SetSRID(ST_MakePoint(83.1145452, 17.9851844), 4326), '{"KHTFLS, K314"}', jsonb_build_object('te', 'కుద్దువలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Khudduvalasa, Visakhapatnam', 'Khudduvalasa కుద్దువలస KHTFLS, K314', ST_SetSRID(ST_MakePoint(83.1145452, 17.9851844), 4326), 10);
    END IF;
    -- Insert Lingampeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lingampeta', ST_SetSRID(ST_MakePoint(83.140377, 17.9829341), 4326), '{"LNKMPT, L525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lingampeta, Visakhapatnam', 'Lingampeta  LNKMPT, L525', ST_SetSRID(ST_MakePoint(83.140377, 17.9829341), 4326), 40);
    END IF;
    -- Insert Rangaradevunipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rangaradevunipalem', ST_SetSRID(ST_MakePoint(83.1271517, 17.9787822), 4326), '{"RNKRTFNPLM, R526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rangaradevunipalem, Visakhapatnam', 'Rangaradevunipalem  RNKRTFNPLM, R526', ST_SetSRID(ST_MakePoint(83.1271517, 17.9787822), 4326), 10);
    END IF;
    -- Insert Atava (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Atava', ST_SetSRID(ST_MakePoint(83.1036232, 17.9970366), 4326), '{"A310, ATF"}', jsonb_build_object('te', 'అతవ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Atava, Visakhapatnam', 'Atava అతవ A310, ATF', ST_SetSRID(ST_MakePoint(83.1036232, 17.9970366), 4326), 40);
    END IF;
    -- Insert Marlapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marlapalli', ST_SetSRID(ST_MakePoint(83.1452765, 17.9970794), 4326), '{"MRLPL, M641"}', jsonb_build_object('te', 'మార్లపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marlapalli, Visakhapatnam', 'Marlapalli మార్లపల్లి MRLPL, M641', ST_SetSRID(ST_MakePoint(83.1452765, 17.9970794), 4326), 40);
    END IF;
    -- Insert Kasireddipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kasireddipalem', ST_SetSRID(ST_MakePoint(83.1234382, 17.9958357), 4326), '{"KSRTPLM, K263"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kasireddipalem, Visakhapatnam', 'Kasireddipalem  KSRTPLM, K263', ST_SetSRID(ST_MakePoint(83.1234382, 17.9958357), 4326), 10);
    END IF;
    -- Insert Chanduluru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chanduluru', ST_SetSRID(ST_MakePoint(83.1308539, 17.994752), 4326), '{"C534, XNTLR"}', jsonb_build_object('te', 'చందులూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chanduluru, Visakhapatnam', 'Chanduluru చందులూరు C534, XNTLR', ST_SetSRID(ST_MakePoint(83.1308539, 17.994752), 4326), 40);
    END IF;
    -- Insert Kotta Boddam (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Boddam', ST_SetSRID(ST_MakePoint(83.1427989, 18.0687411), 4326), '{"K313, KT BTM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Boddam, Visakhapatnam', 'Kotta Boddam  K313, KT BTM', ST_SetSRID(ST_MakePoint(83.1427989, 18.0687411), 4326), 10);
    END IF;
    -- Insert Boddam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boddam', ST_SetSRID(ST_MakePoint(83.1434639, 18.0606133), 4326), '{"BTM, B350"}', jsonb_build_object('te', 'బొడ్డం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boddam, Visakhapatnam', 'Boddam బొడ్డం BTM, B350', ST_SetSRID(ST_MakePoint(83.1434639, 18.0606133), 4326), 40);
    END IF;
    -- Insert Viranarayanapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Viranarayanapuram', ST_SetSRID(ST_MakePoint(83.1273993, 18.0650138), 4326), '{"V656, FRNRYNPRM"}', jsonb_build_object('te', 'వీరనారాయణం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Viranarayanapuram, Visakhapatnam', 'Viranarayanapuram వీరనారాయణం V656, FRNRYNPRM', ST_SetSRID(ST_MakePoint(83.1273993, 18.0650138), 4326), 40);
    END IF;
    -- Insert Ramaswamipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramaswamipeta', ST_SetSRID(ST_MakePoint(83.1265286, 18.062502), 4326), '{"RMSWMPT, R525"}', jsonb_build_object('te', 'రామస్వామిపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramaswamipeta, Visakhapatnam', 'Ramaswamipeta రామస్వామిపేట RMSWMPT, R525', ST_SetSRID(ST_MakePoint(83.1265286, 18.062502), 4326), 40);
    END IF;
    -- Insert Dabbirajupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dabbirajupeta', ST_SetSRID(ST_MakePoint(83.0841858, 18.0244904), 4326), '{"D162, TBRJPT"}', jsonb_build_object('te', 'దబ్బిరాజుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dabbirajupeta, Visakhapatnam', 'Dabbirajupeta దబ్బిరాజుపేట D162, TBRJPT', ST_SetSRID(ST_MakePoint(83.0841858, 18.0244904), 4326), 40);
    END IF;
    -- Insert Karakavalasa (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karakavalasa', ST_SetSRID(ST_MakePoint(83.0984058, 18.037804), 4326), '{"K621, KRKFLS"}', jsonb_build_object('te', 'కారకవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karakavalasa, Visakhapatnam', 'Karakavalasa కారకవలస K621, KRKFLS', ST_SetSRID(ST_MakePoint(83.0984058, 18.037804), 4326), 10);
    END IF;
    -- Insert Chamalpalle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chamalpalle', ST_SetSRID(ST_MakePoint(83.0900558, 18.0329428), 4326), '{"C541, XMLPL"}', jsonb_build_object('te', 'చామలపల్లి (వేపాడ మండలం)'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chamalpalle, Visakhapatnam', 'Chamalpalle చామలపల్లి (వేపాడ మండలం) C541, XMLPL', ST_SetSRID(ST_MakePoint(83.0900558, 18.0329428), 4326), 10);
    END IF;
    -- Insert Singarayi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Singarayi', ST_SetSRID(ST_MakePoint(83.1199734, 18.0093522), 4326), '{"SNKRY, S526"}', jsonb_build_object('te', 'సింగరాయి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Singarayi, Visakhapatnam', 'Singarayi సింగరాయి SNKRY, S526', ST_SetSRID(ST_MakePoint(83.1199734, 18.0093522), 4326), 40);
    END IF;
    -- Insert Jaggayapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jaggayapeta', ST_SetSRID(ST_MakePoint(83.1176107, 18.0233354), 4326), '{"JKYPT, J213"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jaggayapeta, Visakhapatnam', 'Jaggayapeta  JKYPT, J213', ST_SetSRID(ST_MakePoint(83.1176107, 18.0233354), 4326), 40);
    END IF;
    -- Insert Kotta Singarayi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Singarayi', ST_SetSRID(ST_MakePoint(83.1242117, 18.0187057), 4326), '{"K325, KT SNKRY"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Singarayi, Visakhapatnam', 'Kotta Singarayi  K325, KT SNKRY', ST_SetSRID(ST_MakePoint(83.1242117, 18.0187057), 4326), 10);
    END IF;
    -- Insert Santapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Santapeta', ST_SetSRID(ST_MakePoint(83.1512337, 18.0129626), 4326), '{"S531, SNTPT"}', jsonb_build_object('te', 'సంతపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Santapeta, Visakhapatnam', 'Santapeta సంతపేట S531, SNTPT', ST_SetSRID(ST_MakePoint(83.1512337, 18.0129626), 4326), 10);
    END IF;
    -- Insert Ragarayapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ragarayapuram', ST_SetSRID(ST_MakePoint(83.1579676, 18.0098853), 4326), '{"RKRYPRM, R261"}', jsonb_build_object('te', 'రంగరాయపురం అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ragarayapuram, Visakhapatnam', 'Ragarayapuram రంగరాయపురం అగ్రహారం RKRYPRM, R261', ST_SetSRID(ST_MakePoint(83.1579676, 18.0098853), 4326), 40);
    END IF;
    -- Insert Kittannapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kittannapeta', ST_SetSRID(ST_MakePoint(83.1360968, 18.0096028), 4326), '{"KTNPT, K351"}', jsonb_build_object('te', 'కిత్తన్నపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kittannapeta, Visakhapatnam', 'Kittannapeta కిత్తన్నపేట KTNPT, K351', ST_SetSRID(ST_MakePoint(83.1360968, 18.0096028), 4326), 40);
    END IF;
    -- Insert Lakkavarapukota (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lakkavarapukota', ST_SetSRID(ST_MakePoint(83.1566269, 18.0235644), 4326), '{"L216, LKFRPKT"}', jsonb_build_object('te', 'లక్కవరపుకోట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lakkavarapukota, Visakhapatnam', 'Lakkavarapukota లక్కవరపుకోట L216, LKFRPKT', ST_SetSRID(ST_MakePoint(83.1566269, 18.0235644), 4326), 40);
    END IF;
    -- Insert Jakkeru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jakkeru', ST_SetSRID(ST_MakePoint(83.1146591, 18.0433434), 4326), '{"JKR, J260"}', jsonb_build_object('te', 'జక్కేరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jakkeru, Visakhapatnam', 'Jakkeru జక్కేరు JKR, J260', ST_SetSRID(ST_MakePoint(83.1146591, 18.0433434), 4326), 40);
    END IF;
    -- Insert Gudivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gudivada', ST_SetSRID(ST_MakePoint(83.1097564, 18.0312792), 4326), '{"KTFT, G313"}', jsonb_build_object('te', 'గుడివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gudivada, Visakhapatnam', 'Gudivada గుడివాడ KTFT, G313', ST_SetSRID(ST_MakePoint(83.1097564, 18.0312792), 4326), 40);
    END IF;
    -- Insert Golazam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Golazam', ST_SetSRID(ST_MakePoint(83.167967, 18.0475935), 4326), '{"KLSM, G425"}', jsonb_build_object('te', 'గొల్జాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Golazam, Visakhapatnam', 'Golazam గొల్జాం KLSM, G425', ST_SetSRID(ST_MakePoint(83.167967, 18.0475935), 4326), 40);
    END IF;
    -- Insert Pothalavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pothalavanipalem', ST_SetSRID(ST_MakePoint(83.1827663, 18.0389205), 4326), '{"P341, P0LFNPLM"}', jsonb_build_object('te', 'పోతలవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pothalavanipalem, Visakhapatnam', 'Pothalavanipalem పోతలవానిపాలెం P341, P0LFNPLM', ST_SetSRID(ST_MakePoint(83.1827663, 18.0389205), 4326), 10);
    END IF;
    -- Insert Metturu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Metturu', ST_SetSRID(ST_MakePoint(83.2258627, 18.0087401), 4326), '{"M360, MTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Metturu, Visakhapatnam', 'Metturu  M360, MTR', ST_SetSRID(ST_MakePoint(83.2258627, 18.0087401), 4326), 10);
    END IF;
    -- Insert Paturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Paturu', ST_SetSRID(ST_MakePoint(83.1459536, 18.0507831), 4326), '{"P360, PTR"}', jsonb_build_object('te', 'పాతూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Paturu, Visakhapatnam', 'Paturu పాతూరు P360, PTR', ST_SetSRID(ST_MakePoint(83.1459536, 18.0507831), 4326), 40);
    END IF;
    -- Insert Sitarampuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sitarampuram', ST_SetSRID(ST_MakePoint(83.1469064, 18.0431174), 4326), '{"STRMPRM, S365"}', jsonb_build_object('te', 'లక్కవరపుకోట సీతారాంపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sitarampuram, Visakhapatnam', 'Sitarampuram లక్కవరపుకోట సీతారాంపురం STRMPRM, S365', ST_SetSRID(ST_MakePoint(83.1469064, 18.0431174), 4326), 40);
    END IF;
    -- Insert Sompuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sompuram', ST_SetSRID(ST_MakePoint(83.1339954, 18.0371191), 4326), '{"S516, SMPRM"}', jsonb_build_object('te', 'సోంపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sompuram, Visakhapatnam', 'Sompuram సోంపురం S516, SMPRM', ST_SetSRID(ST_MakePoint(83.1339954, 18.0371191), 4326), 40);
    END IF;
    -- Insert Arigipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Arigipalem', ST_SetSRID(ST_MakePoint(83.1434336, 18.0369441), 4326), '{"A621, ARJPLM"}', jsonb_build_object('te', 'అరిగిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Arigipalem, Visakhapatnam', 'Arigipalem అరిగిపాలెం A621, ARJPLM', ST_SetSRID(ST_MakePoint(83.1434336, 18.0369441), 4326), 10);
    END IF;
    -- Insert Mukundapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mukundapuram', ST_SetSRID(ST_MakePoint(83.1664758, 18.0585558), 4326), '{"M253, MKNTPRM"}', jsonb_build_object('te', 'ముకుందపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mukundapuram, Visakhapatnam', 'Mukundapuram ముకుందపురం M253, MKNTPRM', ST_SetSRID(ST_MakePoint(83.1664758, 18.0585558), 4326), 40);
    END IF;
    -- Insert Vobalayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vobalayyapalem', ST_SetSRID(ST_MakePoint(83.1591516, 18.0573932), 4326), '{"V141, FBLYPLM"}', jsonb_build_object('te', 'ఓబులయ్య పాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vobalayyapalem, Visakhapatnam', 'Vobalayyapalem ఓబులయ్య పాలెం V141, FBLYPLM', ST_SetSRID(ST_MakePoint(83.1591516, 18.0573932), 4326), 40);
    END IF;
    -- Insert Vasi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vasi', ST_SetSRID(ST_MakePoint(83.171893, 18.0737225), 4326), '{"FS, V200"}', jsonb_build_object('te', 'వాసి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vasi, Visakhapatnam', 'Vasi వాసి FS, V200', ST_SetSRID(ST_MakePoint(83.171893, 18.0737225), 4326), 40);
    END IF;
    -- Insert Timidi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Timidi', ST_SetSRID(ST_MakePoint(83.1668076, 18.0752934), 4326), '{"TMT, T530"}', jsonb_build_object('te', 'తిమిడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Timidi, Visakhapatnam', 'Timidi తిమిడి TMT, T530', ST_SetSRID(ST_MakePoint(83.1668076, 18.0752934), 4326), 40);
    END IF;
    -- Insert Usiri (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Usiri', ST_SetSRID(ST_MakePoint(83.1934897, 18.0791347), 4326), '{"USR, U260"}', jsonb_build_object('te', 'ఉసిరి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Usiri, Visakhapatnam', 'Usiri ఉసిరి USR, U260', ST_SetSRID(ST_MakePoint(83.1934897, 18.0791347), 4326), 40);
    END IF;
    -- Insert Talari (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Talari', ST_SetSRID(ST_MakePoint(83.1877981, 18.0848837), 4326), '{"TLR, T460"}', jsonb_build_object('te', 'ఎస్. కోటతలారి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Talari, Visakhapatnam', 'Talari ఎస్. కోటతలారి TLR, T460', ST_SetSRID(ST_MakePoint(83.1877981, 18.0848837), 4326), 40);
    END IF;
    -- Insert Vinayakapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vinayakapalli', ST_SetSRID(ST_MakePoint(83.1805134, 18.0887541), 4326), '{"FNYKPL, V521"}', jsonb_build_object('te', 'వినాయకవల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vinayakapalli, Visakhapatnam', 'Vinayakapalli వినాయకవల్లి FNYKPL, V521', ST_SetSRID(ST_MakePoint(83.1805134, 18.0887541), 4326), 40);
    END IF;
    -- Insert Musalinayudupalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Musalinayudupalem', ST_SetSRID(ST_MakePoint(83.1737523, 18.087663), 4326), '{"M245, MSLNYTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Musalinayudupalem, Visakhapatnam', 'Musalinayudupalem  M245, MSLNYTPLM', ST_SetSRID(ST_MakePoint(83.1737523, 18.087663), 4326), 10);
    END IF;
    -- Insert Alagubilli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Alagubilli', ST_SetSRID(ST_MakePoint(83.2133807, 18.0852305), 4326), '{"ALKBL, A421"}', jsonb_build_object('te', 'అలుగుబిల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Alagubilli, Visakhapatnam', 'Alagubilli అలుగుబిల్లి ALKBL, A421', ST_SetSRID(ST_MakePoint(83.2133807, 18.0852305), 4326), 40);
    END IF;
    -- Insert Pata Alagubilli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Alagubilli', ST_SetSRID(ST_MakePoint(83.2048937, 18.0873026), 4326), '{"PT ALKBL, P342"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Alagubilli, Visakhapatnam', 'Pata Alagubilli  PT ALKBL, P342', ST_SetSRID(ST_MakePoint(83.2048937, 18.0873026), 4326), 40);
    END IF;
    -- Insert Kallempadu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kallempadu', ST_SetSRID(ST_MakePoint(83.1766204, 18.0539045), 4326), '{"KLMPT, K451"}', jsonb_build_object('te', 'కల్లెంపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kallempadu, Visakhapatnam', 'Kallempadu కల్లెంపూడి KLMPT, K451', ST_SetSRID(ST_MakePoint(83.1766204, 18.0539045), 4326), 40);
    END IF;
    -- Insert Chintada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintada', ST_SetSRID(ST_MakePoint(83.1913954, 18.0706879), 4326), '{"C533, XNTT"}', jsonb_build_object('te', 'చింతాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintada, Visakhapatnam', 'Chintada చింతాడ C533, XNTT', ST_SetSRID(ST_MakePoint(83.1913954, 18.0706879), 4326), 40);
    END IF;
    -- Insert Virabadrapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Virabadrapeta', ST_SetSRID(ST_MakePoint(83.1992066, 18.0434661), 4326), '{"FRBTRPT, V613"}', jsonb_build_object('te', 'వీరభద్రపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Virabadrapeta, Visakhapatnam', 'Virabadrapeta వీరభద్రపేట FRBTRPT, V613', ST_SetSRID(ST_MakePoint(83.1992066, 18.0434661), 4326), 40);
    END IF;
    -- Insert Pavada (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pavada', ST_SetSRID(ST_MakePoint(83.2015431, 18.0621155), 4326), '{"P130, PFT"}', jsonb_build_object('te', 'పావాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pavada, Visakhapatnam', 'Pavada పావాడ P130, PFT', ST_SetSRID(ST_MakePoint(83.2015431, 18.0621155), 4326), 10);
    END IF;
    -- Insert Jagaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jagaram', ST_SetSRID(ST_MakePoint(83.2140845, 18.062825), 4326), '{"J265, JKRM"}', jsonb_build_object('te', 'జాగరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jagaram, Visakhapatnam', 'Jagaram జాగరం J265, JKRM', ST_SetSRID(ST_MakePoint(83.2140845, 18.062825), 4326), 40);
    END IF;
    -- Insert Jami (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jami', ST_SetSRID(ST_MakePoint(83.2629541, 18.0517982), 4326), '{"J500, JM"}', jsonb_build_object('te', 'జామి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jami, Visakhapatnam', 'Jami జామి J500, JM', ST_SetSRID(ST_MakePoint(83.2629541, 18.0517982), 4326), 40);
    END IF;
    -- Insert Kotyada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotyada', ST_SetSRID(ST_MakePoint(83.2030232, 18.0202288), 4326), '{"K330, KTYT"}', jsonb_build_object('te', 'కొట్యాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotyada, Visakhapatnam', 'Kotyada కొట్యాడ K330, KTYT', ST_SetSRID(ST_MakePoint(83.2030232, 18.0202288), 4326), 40);
    END IF;
    -- Insert Talari (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Talari', ST_SetSRID(ST_MakePoint(83.1971859, 18.0177267), 4326), '{"TLR, T460"}', jsonb_build_object('te', 'తలారి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Talari, Visakhapatnam', 'Talari తలారి TLR, T460', ST_SetSRID(ST_MakePoint(83.1971859, 18.0177267), 4326), 40);
    END IF;
    -- Insert Kirla (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kirla', ST_SetSRID(ST_MakePoint(83.2332385, 18.0161084), 4326), '{"K640, KRL"}', jsonb_build_object('te', 'కిర్ల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kirla, Visakhapatnam', 'Kirla కిర్ల K640, KRL', ST_SetSRID(ST_MakePoint(83.2332385, 18.0161084), 4326), 10);
    END IF;
    -- Insert Jaddetivalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jaddetivalasa', ST_SetSRID(ST_MakePoint(83.2393079, 18.0267757), 4326), '{"JTTFLS, J331"}', jsonb_build_object('te', 'జడ్డేటివలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jaddetivalasa, Visakhapatnam', 'Jaddetivalasa జడ్డేటివలస JTTFLS, J331', ST_SetSRID(ST_MakePoint(83.2393079, 18.0267757), 4326), 40);
    END IF;
    -- Insert Laxmipuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Laxmipuram', ST_SetSRID(ST_MakePoint(83.2330615, 18.0427177), 4326), '{"L251, LKSMPRM"}', jsonb_build_object('te', 'లక్ష్మీపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Laxmipuram, Visakhapatnam', 'Laxmipuram లక్ష్మీపురం L251, LKSMPRM', ST_SetSRID(ST_MakePoint(83.2330615, 18.0427177), 4326), 40);
    END IF;
    -- Insert Ramabadrapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramabadrapuram', ST_SetSRID(ST_MakePoint(83.2233848, 18.0254465), 4326), '{"R513, RMBTRPRM"}', jsonb_build_object('te', 'రామభద్రపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramabadrapuram, Visakhapatnam', 'Ramabadrapuram రామభద్రపురం R513, RMBTRPRM', ST_SetSRID(ST_MakePoint(83.2233848, 18.0254465), 4326), 40);
    END IF;
    -- Insert Bheemali (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bheemali', ST_SetSRID(ST_MakePoint(83.2228145, 17.9796734), 4326), '{"B540, BHML"}', jsonb_build_object('te', 'భీమాలి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bheemali, Visakhapatnam', 'Bheemali భీమాలి B540, BHML', ST_SetSRID(ST_MakePoint(83.2228145, 17.9796734), 4326), 40);
    END IF;
    -- Insert Chinnipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinnipalem', ST_SetSRID(ST_MakePoint(83.1946572, 17.9633358), 4326), '{"C514, XNPLM"}', jsonb_build_object('te', 'చిన్నిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinnipalem, Visakhapatnam', 'Chinnipalem చిన్నిపాలెం C514, XNPLM', ST_SetSRID(ST_MakePoint(83.1946572, 17.9633358), 4326), 10);
    END IF;
    -- Insert Gangubudigudem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gangubudigudem', ST_SetSRID(ST_MakePoint(83.1781223, 17.9621628), 4326), '{"KNKBTKTM, G521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gangubudigudem, Visakhapatnam', 'Gangubudigudem  KNKBTKTM, G521', ST_SetSRID(ST_MakePoint(83.1781223, 17.9621628), 4326), 10);
    END IF;
    -- Insert Nidigattu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nidigattu', ST_SetSRID(ST_MakePoint(83.2054321, 17.9724128), 4326), '{"NTKT, N323"}', jsonb_build_object('te', 'నిడుగట్టు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nidigattu, Visakhapatnam', 'Nidigattu నిడుగట్టు NTKT, N323', ST_SetSRID(ST_MakePoint(83.2054321, 17.9724128), 4326), 40);
    END IF;
    -- Insert Ganivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ganivada', ST_SetSRID(ST_MakePoint(83.192927, 17.9760214), 4326), '{"KNFT, G513"}', jsonb_build_object('te', 'గనివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ganivada, Visakhapatnam', 'Ganivada గనివాడ KNFT, G513', ST_SetSRID(ST_MakePoint(83.192927, 17.9760214), 4326), 40);
    END IF;
    -- Insert Jogayyapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jogayyapalem', ST_SetSRID(ST_MakePoint(83.2000372, 17.9658635), 4326), '{"J214, JKYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jogayyapalem, Visakhapatnam', 'Jogayyapalem  J214, JKYPLM', ST_SetSRID(ST_MakePoint(83.2000372, 17.9658635), 4326), 10);
    END IF;
    -- Insert Gedalavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gedalavanipalem', ST_SetSRID(ST_MakePoint(83.2037144, 17.9848119), 4326), '{"JTLFNPLM, G341"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gedalavanipalem, Visakhapatnam', 'Gedalavanipalem  JTLFNPLM, G341', ST_SetSRID(ST_MakePoint(83.2037144, 17.9848119), 4326), 40);
    END IF;
    -- Insert Dasullapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dasullapalem', ST_SetSRID(ST_MakePoint(83.190509, 17.9962953), 4326), '{"TSLPLM, D241"}', jsonb_build_object('te', 'దాసుళ్ళపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dasullapalem, Visakhapatnam', 'Dasullapalem దాసుళ్ళపాలెం TSLPLM, D241', ST_SetSRID(ST_MakePoint(83.190509, 17.9962953), 4326), 40);
    END IF;
    -- Insert Yasalapudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yasalapudi', ST_SetSRID(ST_MakePoint(83.1963724, 17.991821), 4326), '{"YSLPT, Y241"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yasalapudi, Visakhapatnam', 'Yasalapudi  YSLPT, Y241', ST_SetSRID(ST_MakePoint(83.1963724, 17.991821), 4326), 40);
    END IF;
    -- Insert Mamidipalli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mamidipalli', ST_SetSRID(ST_MakePoint(83.206427, 17.9993277), 4326), '{"M531, MMTPL"}', jsonb_build_object('te', 'మామిడిపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mamidipalli, Visakhapatnam', 'Mamidipalli మామిడిపల్లి M531, MMTPL', ST_SetSRID(ST_MakePoint(83.206427, 17.9993277), 4326), 10);
    END IF;
    -- Insert Kalagada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kalagada', ST_SetSRID(ST_MakePoint(83.2091769, 18.0027833), 4326), '{"KLKT, K423"}', jsonb_build_object('te', 'కలగాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kalagada, Visakhapatnam', 'Kalagada కలగాడ KLKT, K423', ST_SetSRID(ST_MakePoint(83.2091769, 18.0027833), 4326), 40);
    END IF;
    -- Insert Chandrammapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chandrammapeta', ST_SetSRID(ST_MakePoint(83.2147267, 17.998305), 4326), '{"XNTRMPT, C536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chandrammapeta, Visakhapatnam', 'Chandrammapeta  XNTRMPT, C536', ST_SetSRID(ST_MakePoint(83.2147267, 17.998305), 4326), 10);
    END IF;
    -- Insert Alamanda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Alamanda', ST_SetSRID(ST_MakePoint(83.240278, 17.9945175), 4326), '{"ALMNT, A455"}', jsonb_build_object('te', 'ఆలమండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Alamanda, Visakhapatnam', 'Alamanda ఆలమండ ALMNT, A455', ST_SetSRID(ST_MakePoint(83.240278, 17.9945175), 4326), 40);
    END IF;
    -- Insert Sirikipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sirikipalem', ST_SetSRID(ST_MakePoint(83.2322698, 17.992723), 4326), '{"S621, SRKPLM"}', jsonb_build_object('te', 'సిరికిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sirikipalem, Visakhapatnam', 'Sirikipalem సిరికిపాలెం S621, SRKPLM', ST_SetSRID(ST_MakePoint(83.2322698, 17.992723), 4326), 40);
    END IF;
    -- Insert Yetapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yetapalem', ST_SetSRID(ST_MakePoint(83.2861579, 18.0277768), 4326), '{"YTPLM, Y314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yetapalem, Visakhapatnam', 'Yetapalem  YTPLM, Y314', ST_SetSRID(ST_MakePoint(83.2861579, 18.0277768), 4326), 10);
    END IF;
    -- Insert Kotturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(83.2655884, 18.031362), 4326), '{"K360, KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu  K360, KTR', ST_SetSRID(ST_MakePoint(83.2655884, 18.031362), 4326), 40);
    END IF;
    -- Insert Vilakshanpalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vilakshanpalem', ST_SetSRID(ST_MakePoint(83.3144837, 18.0041651), 4326), '{"FLKXNPLM, V425"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vilakshanpalem, Visakhapatnam', 'Vilakshanpalem  FLKXNPLM, V425', ST_SetSRID(ST_MakePoint(83.3144837, 18.0041651), 4326), 40);
    END IF;
    -- Insert Potnuru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Potnuru', ST_SetSRID(ST_MakePoint(83.3205066, 18.0198759), 4326), '{"PTNR, P356"}', jsonb_build_object('te', 'పొట్నూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Potnuru, Visakhapatnam', 'Potnuru పొట్నూరు PTNR, P356', ST_SetSRID(ST_MakePoint(83.3205066, 18.0198759), 4326), 40);
    END IF;
    -- Insert Annamrajupeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Annamrajupeta', ST_SetSRID(ST_MakePoint(83.3000017, 18.0198482), 4326), '{"A556, ANMRJPT"}', jsonb_build_object('te', 'అన్నంరాజుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Annamrajupeta, Visakhapatnam', 'Annamrajupeta అన్నంరాజుపేట A556, ANMRJPT', ST_SetSRID(ST_MakePoint(83.3000017, 18.0198482), 4326), 10);
    END IF;
    -- Insert Sitanagaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sitanagaram', ST_SetSRID(ST_MakePoint(83.3063506, 18.0153372), 4326), '{"STNKRM, S352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sitanagaram, Visakhapatnam', 'Sitanagaram  STNKRM, S352', ST_SetSRID(ST_MakePoint(83.3063506, 18.0153372), 4326), 40);
    END IF;
    -- Insert Pushpagiri (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pushpagiri', ST_SetSRID(ST_MakePoint(83.3097774, 18.0168732), 4326), '{"PXPJR, P212"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pushpagiri, Visakhapatnam', 'Pushpagiri  PXPJR, P212', ST_SetSRID(ST_MakePoint(83.3097774, 18.0168732), 4326), 10);
    END IF;
    -- Insert Jaggalapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jaggalapeta', ST_SetSRID(ST_MakePoint(83.3015394, 18.0177256), 4326), '{"JKLPT, J241"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jaggalapeta, Visakhapatnam', 'Jaggalapeta  JKLPT, J241', ST_SetSRID(ST_MakePoint(83.3015394, 18.0177256), 4326), 40);
    END IF;
    -- Insert Lotlapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lotlapalli', ST_SetSRID(ST_MakePoint(83.2669227, 18.0202457), 4326), '{"L341, LTLPL"}', jsonb_build_object('te', 'లొట్లపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lotlapalli, Visakhapatnam', 'Lotlapalli లొట్లపల్లి L341, LTLPL', ST_SetSRID(ST_MakePoint(83.2669227, 18.0202457), 4326), 40);
    END IF;
    -- Insert Godikommu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Godikommu', ST_SetSRID(ST_MakePoint(83.2573862, 18.0122423), 4326), '{"KTKM, G325"}', jsonb_build_object('te', 'గొడికొమ్ము'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Godikommu, Visakhapatnam', 'Godikommu గొడికొమ్ము KTKM, G325', ST_SetSRID(ST_MakePoint(83.2573862, 18.0122423), 4326), 40);
    END IF;
    -- Insert Singavaram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Singavaram', ST_SetSRID(ST_MakePoint(83.2706584, 18.0034702), 4326), '{"SNKFRM, S521"}', jsonb_build_object('te', 'గొడికొమ్ము సింగవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Singavaram, Visakhapatnam', 'Singavaram గొడికొమ్ము సింగవరం SNKFRM, S521', ST_SetSRID(ST_MakePoint(83.2706584, 18.0034702), 4326), 10);
    END IF;
    -- Insert Bandevupuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bandevupuram', ST_SetSRID(ST_MakePoint(83.2965812, 17.9971272), 4326), '{"BNTFPRM, B531"}', jsonb_build_object('te', 'బాందేవుపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bandevupuram, Visakhapatnam', 'Bandevupuram బాందేవుపురం BNTFPRM, B531', ST_SetSRID(ST_MakePoint(83.2965812, 17.9971272), 4326), 40);
    END IF;
    -- Insert Tunipalam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tunipalam', ST_SetSRID(ST_MakePoint(83.303052, 17.9806222), 4326), '{"T514, TNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tunipalam, Visakhapatnam', 'Tunipalam  T514, TNPLM', ST_SetSRID(ST_MakePoint(83.303052, 17.9806222), 4326), 40);
    END IF;
    -- Insert Anantavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Anantavaram', ST_SetSRID(ST_MakePoint(83.2938791, 17.9679253), 4326), '{"ANNTFRM, A553"}', jsonb_build_object('te', 'అనంతవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Anantavaram, Visakhapatnam', 'Anantavaram అనంతవరం ANNTFRM, A553', ST_SetSRID(ST_MakePoint(83.2938791, 17.9679253), 4326), 40);
    END IF;
    -- Insert Palle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Palle', ST_SetSRID(ST_MakePoint(83.294442, 17.9866847), 4326), '{"PL, P400"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Palle, Visakhapatnam', 'Palle  PL, P400', ST_SetSRID(ST_MakePoint(83.294442, 17.9866847), 4326), 40);
    END IF;
    -- Insert Narayanapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narayanapuram', ST_SetSRID(ST_MakePoint(83.2610075, 17.9814014), 4326), '{"N651, NRYNPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narayanapuram, Visakhapatnam', 'Narayanapuram  N651, NRYNPRM', ST_SetSRID(ST_MakePoint(83.2610075, 17.9814014), 4326), 40);
    END IF;
    -- Insert Gandhavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gandhavaram', ST_SetSRID(ST_MakePoint(83.2776922, 17.9831762), 4326), '{"KNTHFRM, G531"}', jsonb_build_object('te', 'గంధవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gandhavaram, Visakhapatnam', 'Gandhavaram గంధవరం KNTHFRM, G531', ST_SetSRID(ST_MakePoint(83.2776922, 17.9831762), 4326), 40);
    END IF;
    -- Insert Penta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Penta', ST_SetSRID(ST_MakePoint(83.2781282, 17.9621379), 4326), '{"P530, PNT"}', jsonb_build_object('te', 'పెంట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Penta, Visakhapatnam', 'Penta పెంట P530, PNT', ST_SetSRID(ST_MakePoint(83.2781282, 17.9621379), 4326), 40);
    END IF;
    -- Insert Kotta Kovvada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Kovvada', ST_SetSRID(ST_MakePoint(83.2573952, 17.9652857), 4326), '{"K321, KT KFT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Kovvada, Visakhapatnam', 'Kotta Kovvada  K321, KT KFT', ST_SetSRID(ST_MakePoint(83.2573952, 17.9652857), 4326), 40);
    END IF;
    -- Insert Pata Kovvada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Kovvada', ST_SetSRID(ST_MakePoint(83.2656546, 17.9561827), 4326), '{"PT KFT, P321"}', jsonb_build_object('te', 'పాత కొవ్వాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Kovvada, Visakhapatnam', 'Pata Kovvada పాత కొవ్వాడ PT KFT, P321', ST_SetSRID(ST_MakePoint(83.2656546, 17.9561827), 4326), 40);
    END IF;
    -- Insert Sambayyapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sambayyapalem', ST_SetSRID(ST_MakePoint(83.2069587, 17.95576), 4326), '{"S511, SMBYPLM"}', jsonb_build_object('te', 'సాంబయ్యపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sambayyapalem, Visakhapatnam', 'Sambayyapalem సాంబయ్యపాలెం S511, SMBYPLM', ST_SetSRID(ST_MakePoint(83.2069587, 17.95576), 4326), 10);
    END IF;
    -- Insert Chinaraopalli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinaraopalli', ST_SetSRID(ST_MakePoint(83.2281307, 17.9667395), 4326), '{"XNRPL, C561"}', jsonb_build_object('te', 'చినరావుపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinaraopalli, Visakhapatnam', 'Chinaraopalli చినరావుపల్లి XNRPL, C561', ST_SetSRID(ST_MakePoint(83.2281307, 17.9667395), 4326), 10);
    END IF;
    -- Insert Kotturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(83.2091897, 17.9513123), 4326), '{"K360, KTR"}', jsonb_build_object('te', 'కొత్తూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu కొత్తూరు K360, KTR', ST_SetSRID(ST_MakePoint(83.2091897, 17.9513123), 4326), 40);
    END IF;
    -- Insert Gollapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapeta', ST_SetSRID(ST_MakePoint(83.2306445, 17.9604468), 4326), '{"G413, KLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapeta, Visakhapatnam', 'Gollapeta  G413, KLPT', ST_SetSRID(ST_MakePoint(83.2306445, 17.9604468), 4326), 10);
    END IF;
    -- Insert Kantakapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kantakapalli', ST_SetSRID(ST_MakePoint(83.2179112, 17.951986), 4326), '{"KNTKPL, K532"}', jsonb_build_object('te', 'కంటకాపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kantakapalli, Visakhapatnam', 'Kantakapalli కంటకాపల్లి KNTKPL, K532', ST_SetSRID(ST_MakePoint(83.2179112, 17.951986), 4326), 40);
    END IF;
    -- Insert Katakapalli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Katakapalli', ST_SetSRID(ST_MakePoint(83.2299831, 17.9559471), 4326), '{"KTKPL, K321"}', jsonb_build_object('te', 'కతకపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Katakapalli, Visakhapatnam', 'Katakapalli కతకపల్లి KTKPL, K321', ST_SetSRID(ST_MakePoint(83.2299831, 17.9559471), 4326), 10);
    END IF;
    -- Insert Datti (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Datti', ST_SetSRID(ST_MakePoint(83.2016669, 17.9399558), 4326), '{"TT, D300"}', jsonb_build_object('te', 'దతి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Datti, Visakhapatnam', 'Datti దతి TT, D300', ST_SetSRID(ST_MakePoint(83.2016669, 17.9399558), 4326), 10);
    END IF;
    -- Insert Pata Sunkarapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Sunkarapalem', ST_SetSRID(ST_MakePoint(83.2111242, 17.9330908), 4326), '{"P325, PT SNKRPLM"}', jsonb_build_object('te', 'పాత సుంకరపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Sunkarapalem, Visakhapatnam', 'Pata Sunkarapalem పాత సుంకరపాలెం P325, PT SNKRPLM', ST_SetSRID(ST_MakePoint(83.2111242, 17.9330908), 4326), 10);
    END IF;
    -- Insert Dannipeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dannipeta', ST_SetSRID(ST_MakePoint(83.1990348, 17.9427277), 4326), '{"D513, TNPT"}', jsonb_build_object('te', 'దన్నిపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dannipeta, Visakhapatnam', 'Dannipeta దన్నిపేట D513, TNPT', ST_SetSRID(ST_MakePoint(83.1990348, 17.9427277), 4326), 10);
    END IF;
    -- Insert Kotta Sunkarapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Sunkarapalem', ST_SetSRID(ST_MakePoint(83.2092729, 17.9409524), 4326), '{"K325, KT SNKRPLM"}', jsonb_build_object('te', 'కొత్త సుంకరపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Sunkarapalem, Visakhapatnam', 'Kotta Sunkarapalem కొత్త సుంకరపాలెం K325, KT SNKRPLM', ST_SetSRID(ST_MakePoint(83.2092729, 17.9409524), 4326), 10);
    END IF;
    -- Insert Erravadiplem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Erravadiplem', ST_SetSRID(ST_MakePoint(83.2048699, 17.9313646), 4326), '{"ERFTPLM, E613"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Erravadiplem, Visakhapatnam', 'Erravadiplem  ERFTPLM, E613', ST_SetSRID(ST_MakePoint(83.2048699, 17.9313646), 4326), 10);
    END IF;
    -- Insert Balighattam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Balighattam', ST_SetSRID(ST_MakePoint(83.2013779, 17.9312098), 4326), '{"BLKHTM, B423"}', jsonb_build_object('te', 'బలిఘట్టం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Balighattam, Visakhapatnam', 'Balighattam బలిఘట్టం BLKHTM, B423', ST_SetSRID(ST_MakePoint(83.2013779, 17.9312098), 4326), 40);
    END IF;
    -- Insert Gollalapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(83.2003996, 17.9142956), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem  KLLPLM, G441', ST_SetSRID(ST_MakePoint(83.2003996, 17.9142956), 4326), 10);
    END IF;
    -- Insert Ardhannapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ardhannapalem', ST_SetSRID(ST_MakePoint(83.1990896, 17.9176008), 4326), '{"ARTHNPLM, A635"}', jsonb_build_object('te', 'అర్ధన్నపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ardhannapalem, Visakhapatnam', 'Ardhannapalem అర్ధన్నపాలెం ARTHNPLM, A635', ST_SetSRID(ST_MakePoint(83.1990896, 17.9176008), 4326), 10);
    END IF;
    -- Insert Vepada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vepada', ST_SetSRID(ST_MakePoint(83.0811408, 18.0116544), 4326), '{"V130, FPT"}', jsonb_build_object('te', 'వేపాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vepada, Visakhapatnam', 'Vepada వేపాడ V130, FPT', ST_SetSRID(ST_MakePoint(83.0811408, 18.0116544), 4326), 40);
    END IF;
    -- Insert Chinna Nagamayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Nagamayyapalem', ST_SetSRID(ST_MakePoint(83.4674677, 17.9143067), 4326), '{"XN NKMYPLM, C552"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Nagamayyapalem, Visakhapatnam', 'Chinna Nagamayyapalem  XN NKMYPLM, C552', ST_SetSRID(ST_MakePoint(83.4674677, 17.9143067), 4326), 40);
    END IF;
    -- Insert Pedda Nagamayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Nagamayyapalem', ST_SetSRID(ST_MakePoint(83.4619059, 17.9151335), 4326), '{"PT NKMYPLM, P352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Nagamayyapalem, Visakhapatnam', 'Pedda Nagamayyapalem  PT NKMYPLM, P352', ST_SetSRID(ST_MakePoint(83.4619059, 17.9151335), 4326), 40);
    END IF;
    -- Insert Chakivalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chakivalasa', ST_SetSRID(ST_MakePoint(83.4995279, 18.008626), 4326), '{"XKFLS, C214"}', jsonb_build_object('te', 'చాకివలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chakivalasa, Visakhapatnam', 'Chakivalasa చాకివలస XKFLS, C214', ST_SetSRID(ST_MakePoint(83.4995279, 18.008626), 4326), 40);
    END IF;
    -- Insert Dasaripeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dasaripeta', ST_SetSRID(ST_MakePoint(83.4081704, 17.9802951), 4326), '{"TSRPT, D261"}', jsonb_build_object('te', 'దాసరిపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dasaripeta, Visakhapatnam', 'Dasaripeta దాసరిపేట TSRPT, D261', ST_SetSRID(ST_MakePoint(83.4081704, 17.9802951), 4326), 40);
    END IF;
    -- Insert Santapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Santapeta', ST_SetSRID(ST_MakePoint(83.4264265, 17.9964229), 4326), '{"S531, SNTPT"}', jsonb_build_object('te', 'సంతపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Santapeta, Visakhapatnam', 'Santapeta సంతపేట S531, SNTPT', ST_SetSRID(ST_MakePoint(83.4264265, 17.9964229), 4326), 40);
    END IF;
    -- Insert Dakamarri (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dakamarri', ST_SetSRID(ST_MakePoint(83.4009707, 17.9889945), 4326), '{"D256, TKMR"}', jsonb_build_object('te', 'దాకమర్రి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dakamarri, Visakhapatnam', 'Dakamarri దాకమర్రి D256, TKMR', ST_SetSRID(ST_MakePoint(83.4009707, 17.9889945), 4326), 40);
    END IF;
    -- Insert Muddadapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Muddadapeta', ST_SetSRID(ST_MakePoint(83.4127491, 18.0026878), 4326), '{"M331, MTTPT"}', jsonb_build_object('te', 'ముద్దాడపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Muddadapeta, Visakhapatnam', 'Muddadapeta ముద్దాడపేట M331, MTTPT', ST_SetSRID(ST_MakePoint(83.4127491, 18.0026878), 4326), 40);
    END IF;
    -- Insert Kondarajupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondarajupeta', ST_SetSRID(ST_MakePoint(83.4252166, 17.9890878), 4326), '{"KNTRJPT, K536"}', jsonb_build_object('te', 'కొండరాజుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondarajupeta, Visakhapatnam', 'Kondarajupeta కొండరాజుపేట KNTRJPT, K536', ST_SetSRID(ST_MakePoint(83.4252166, 17.9890878), 4326), 40);
    END IF;
    -- Insert Mopada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mopada', ST_SetSRID(ST_MakePoint(83.4315562, 18.0041297), 4326), '{"M130, MPT"}', jsonb_build_object('te', 'మోపాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mopada, Visakhapatnam', 'Mopada మోపాడ M130, MPT', ST_SetSRID(ST_MakePoint(83.4315562, 18.0041297), 4326), 40);
    END IF;
    -- Insert Ramunayudupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramunayudupeta', ST_SetSRID(ST_MakePoint(83.4195491, 18.0021125), 4326), '{"R553, RMNYTPT"}', jsonb_build_object('te', 'రామునాయుడుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramunayudupeta, Visakhapatnam', 'Ramunayudupeta రామునాయుడుపేట R553, RMNYTPT', ST_SetSRID(ST_MakePoint(83.4195491, 18.0021125), 4326), 40);
    END IF;
    -- Insert Allupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Allupeta', ST_SetSRID(ST_MakePoint(83.4128385, 17.9767041), 4326), '{"ALPT, A413"}', jsonb_build_object('te', 'అల్లుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Allupeta, Visakhapatnam', 'Allupeta అల్లుపేట ALPT, A413', ST_SetSRID(ST_MakePoint(83.4128385, 17.9767041), 4326), 40);
    END IF;
    -- Insert Valluru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Valluru', ST_SetSRID(ST_MakePoint(83.4259958, 17.9777185), 4326), '{"V460, FLR"}', jsonb_build_object('te', 'వల్లూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Valluru, Visakhapatnam', 'Valluru వల్లూరు V460, FLR', ST_SetSRID(ST_MakePoint(83.4259958, 17.9777185), 4326), 40);
    END IF;
    -- Insert Bangarurajupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bangarurajupeta', ST_SetSRID(ST_MakePoint(83.4356029, 17.9842216), 4326), '{"BNKRRJPT, B526"}', jsonb_build_object('te', 'బంగార్రాజుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bangarurajupeta, Visakhapatnam', 'Bangarurajupeta బంగార్రాజుపేట BNKRRJPT, B526', ST_SetSRID(ST_MakePoint(83.4356029, 17.9842216), 4326), 40);
    END IF;
    -- Insert Ravada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ravada', ST_SetSRID(ST_MakePoint(83.4596109, 17.9703654), 4326), '{"RFT, R130"}', jsonb_build_object('te', 'రావాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ravada, Visakhapatnam', 'Ravada రావాడ RFT, R130', ST_SetSRID(ST_MakePoint(83.4596109, 17.9703654), 4326), 40);
    END IF;
    -- Insert Galagam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Galagam', ST_SetSRID(ST_MakePoint(83.4495167, 18.0027687), 4326), '{"G425, KLKM"}', jsonb_build_object('te', 'గొలగం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Galagam, Visakhapatnam', 'Galagam గొలగం G425, KLKM', ST_SetSRID(ST_MakePoint(83.4495167, 18.0027687), 4326), 40);
    END IF;
    -- Insert Kannuvanipeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kannuvanipeta', ST_SetSRID(ST_MakePoint(83.464211, 17.9963209), 4326), '{"K515, KNFNPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kannuvanipeta, Visakhapatnam', 'Kannuvanipeta  K515, KNFNPT', ST_SetSRID(ST_MakePoint(83.464211, 17.9963209), 4326), 10);
    END IF;
    -- Insert Uppadapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Uppadapeta', ST_SetSRID(ST_MakePoint(83.4755579, 17.9915519), 4326), '{"UPTPT, U131"}', jsonb_build_object('te', 'ఉప్పాడపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Uppadapeta, Visakhapatnam', 'Uppadapeta ఉప్పాడపేట UPTPT, U131', ST_SetSRID(ST_MakePoint(83.4755579, 17.9915519), 4326), 10);
    END IF;
    -- Insert Dongapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dongapeta', ST_SetSRID(ST_MakePoint(83.4686791, 17.9947115), 4326), '{"TNKPT, D521"}', jsonb_build_object('te', 'దొంగపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dongapeta, Visakhapatnam', 'Dongapeta దొంగపేట TNKPT, D521', ST_SetSRID(ST_MakePoint(83.4686791, 17.9947115), 4326), 10);
    END IF;
    -- Insert Savaravilli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Savaravilli', ST_SetSRID(ST_MakePoint(83.4594455, 17.98781), 4326), '{"S161, SFRFL"}', jsonb_build_object('te', 'సవరవిల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Savaravilli, Visakhapatnam', 'Savaravilli సవరవిల్లి S161, SFRFL', ST_SetSRID(ST_MakePoint(83.4594455, 17.98781), 4326), 40);
    END IF;
    -- Insert Patnavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Patnavanipalem', ST_SetSRID(ST_MakePoint(83.4774878, 17.9893257), 4326), '{"P351, PTNFNPLM"}', jsonb_build_object('te', 'పట్నవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Patnavanipalem, Visakhapatnam', 'Patnavanipalem పట్నవానిపాలెం P351, PTNFNPLM', ST_SetSRID(ST_MakePoint(83.4774878, 17.9893257), 4326), 10);
    END IF;
    -- Insert Chetanipeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chetanipeta', ST_SetSRID(ST_MakePoint(83.4608127, 17.9986328), 4326), '{"C351, XTNPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chetanipeta, Visakhapatnam', 'Chetanipeta  C351, XTNPT', ST_SetSRID(ST_MakePoint(83.4608127, 17.9986328), 4326), 10);
    END IF;
    -- Insert Patnapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Patnapeta', ST_SetSRID(ST_MakePoint(83.466178, 17.9988208), 4326), '{"P351, PTNPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Patnapeta, Visakhapatnam', 'Patnapeta  P351, PTNPT', ST_SetSRID(ST_MakePoint(83.466178, 17.9988208), 4326), 10);
    END IF;
    -- Insert Jogipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jogipeta', ST_SetSRID(ST_MakePoint(83.4855569, 17.9935517), 4326), '{"JJPT, J213"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jogipeta, Visakhapatnam', 'Jogipeta  JJPT, J213', ST_SetSRID(ST_MakePoint(83.4855569, 17.9935517), 4326), 40);
    END IF;
    -- Insert Amtam Ravivalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amtam Ravivalasa', ST_SetSRID(ST_MakePoint(83.4825493, 17.9949773), 4326), '{"AMTM RFFLS, A535"}', jsonb_build_object('te', 'అమతం రావివలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amtam Ravivalasa, Visakhapatnam', 'Amtam Ravivalasa అమతం రావివలస AMTM RFFLS, A535', ST_SetSRID(ST_MakePoint(83.4825493, 17.9949773), 4326), 40);
    END IF;
    -- Insert Nandikapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nandikapeta', ST_SetSRID(ST_MakePoint(83.4681752, 17.9924481), 4326), '{"N532, NNTKPT"}', jsonb_build_object('te', 'నందికపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nandikapeta, Visakhapatnam', 'Nandikapeta నందికపేట N532, NNTKPT', ST_SetSRID(ST_MakePoint(83.4681752, 17.9924481), 4326), 10);
    END IF;
    -- Insert Chinnipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinnipeta', ST_SetSRID(ST_MakePoint(83.4836226, 17.9923233), 4326), '{"XNPT, C513"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinnipeta, Visakhapatnam', 'Chinnipeta  XNPT, C513', ST_SetSRID(ST_MakePoint(83.4836226, 17.9923233), 4326), 40);
    END IF;
    -- Insert Amtam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amtam', ST_SetSRID(ST_MakePoint(83.4868709, 17.9807813), 4326), '{"AMTM, A535"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amtam, Visakhapatnam', 'Amtam  AMTM, A535', ST_SetSRID(ST_MakePoint(83.4868709, 17.9807813), 4326), 40);
    END IF;
    -- Insert Chinna Kavulavada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Kavulavada', ST_SetSRID(ST_MakePoint(83.4923429, 17.9647622), 4326), '{"C521, XN KFLFT"}', jsonb_build_object('te', 'కవులవాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Kavulavada, Visakhapatnam', 'Chinna Kavulavada కవులవాడ C521, XN KFLFT', ST_SetSRID(ST_MakePoint(83.4923429, 17.9647622), 4326), 40);
    END IF;
    -- Insert Jammayapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jammayapeta', ST_SetSRID(ST_MakePoint(83.4886669, 17.9709283), 4326), '{"JMYPT, J513"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jammayapeta, Visakhapatnam', 'Jammayapeta  JMYPT, J513', ST_SetSRID(ST_MakePoint(83.4886669, 17.9709283), 4326), 40);
    END IF;
    -- Insert Maradapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maradapalem', ST_SetSRID(ST_MakePoint(83.4985294, 17.9613284), 4326), '{"MRTPLM, M631"}', jsonb_build_object('te', 'మరదపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maradapalem, Visakhapatnam', 'Maradapalem మరదపాలెం MRTPLM, M631', ST_SetSRID(ST_MakePoint(83.4985294, 17.9613284), 4326), 10);
    END IF;
    -- Insert Chepala Kancheru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chepala Kancheru', ST_SetSRID(ST_MakePoint(83.5443266, 17.969727), 4326), '{"XPL KNXR, C142"}', jsonb_build_object('te', 'చేపల కంచేరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chepala Kancheru, Visakhapatnam', 'Chepala Kancheru చేపల కంచేరు XPL KNXR, C142', ST_SetSRID(ST_MakePoint(83.5443266, 17.969727), 4326), 40);
    END IF;
    -- Insert Erramusalayyapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Erramusalayyapalem', ST_SetSRID(ST_MakePoint(83.547218, 17.9741497), 4326), '{"ERMSLYPLM, E652"}', jsonb_build_object('te', 'ఎర్రముసలయ్యపలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Erramusalayyapalem, Visakhapatnam', 'Erramusalayyapalem ఎర్రముసలయ్యపలెం ERMSLYPLM, E652', ST_SetSRID(ST_MakePoint(83.547218, 17.9741497), 4326), 10);
    END IF;
    -- Insert Kaicherlapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kaicherlapalem', ST_SetSRID(ST_MakePoint(83.4778471, 17.9291534), 4326), '{"KXRLPLM, K264"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kaicherlapalem, Visakhapatnam', 'Kaicherlapalem  KXRLPLM, K264', ST_SetSRID(ST_MakePoint(83.4778471, 17.9291534), 4326), 40);
    END IF;
    -- Insert Nammivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nammivanipalem', ST_SetSRID(ST_MakePoint(83.4653665, 17.9285908), 4326), '{"NMFNPLM, N515"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nammivanipalem, Visakhapatnam', 'Nammivanipalem  NMFNPLM, N515', ST_SetSRID(ST_MakePoint(83.4653665, 17.9285908), 4326), 40);
    END IF;
    -- Insert Kammapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kammapalem', ST_SetSRID(ST_MakePoint(83.467424, 17.927003), 4326), '{"KMPLM, K514"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kammapalem, Visakhapatnam', 'Kammapalem  KMPLM, K514', ST_SetSRID(ST_MakePoint(83.467424, 17.927003), 4326), 40);
    END IF;
    -- Insert Siripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Siripalem', ST_SetSRID(ST_MakePoint(83.4669198, 17.9232239), 4326), '{"S614, SRPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Siripalem, Visakhapatnam', 'Siripalem  S614, SRPLM', ST_SetSRID(ST_MakePoint(83.4669198, 17.9232239), 4326), 40);
    END IF;
    -- Insert Asapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Asapalem', ST_SetSRID(ST_MakePoint(83.4609182, 17.9299709), 4326), '{"ASPLM, A214"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Asapalem, Visakhapatnam', 'Asapalem  ASPLM, A214', ST_SetSRID(ST_MakePoint(83.4609182, 17.9299709), 4326), 40);
    END IF;
    -- Insert Patapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Patapalem', ST_SetSRID(ST_MakePoint(83.462212, 17.9218448), 4326), '{"PTPLM, P314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Patapalem, Visakhapatnam', 'Patapalem  PTPLM, P314', ST_SetSRID(ST_MakePoint(83.462212, 17.9218448), 4326), 40);
    END IF;
    -- Insert Annavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Annavaram', ST_SetSRID(ST_MakePoint(83.4948959, 17.9361838), 4326), '{"ANFRM, A516"}', jsonb_build_object('te', 'అన్నవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Annavaram, Visakhapatnam', 'Annavaram అన్నవరం ANFRM, A516', ST_SetSRID(ST_MakePoint(83.4948959, 17.9361838), 4326), 40);
    END IF;
    -- Insert Errayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Errayyapalem', ST_SetSRID(ST_MakePoint(83.4944752, 17.9309967), 4326), '{"E614, ERYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Errayyapalem, Visakhapatnam', 'Errayyapalem  E614, ERYPLM', ST_SetSRID(ST_MakePoint(83.4944752, 17.9309967), 4326), 40);
    END IF;
    -- Insert Failipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Failipeta', ST_SetSRID(ST_MakePoint(83.4967406, 17.9405205), 4326), '{"F413, FLPT"}', jsonb_build_object('te', 'ఫైలిపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Failipeta, Visakhapatnam', 'Failipeta ఫైలిపేట F413, FLPT', ST_SetSRID(ST_MakePoint(83.4967406, 17.9405205), 4326), 40);
    END IF;
    -- Insert Risipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Risipeta', ST_SetSRID(ST_MakePoint(83.4868006, 17.9566142), 4326), '{"RSPT, R213"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Risipeta, Visakhapatnam', 'Risipeta  RSPT, R213', ST_SetSRID(ST_MakePoint(83.4868006, 17.9566142), 4326), 40);
    END IF;
    -- Insert Jagannathapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jagannathapuram', ST_SetSRID(ST_MakePoint(82.9292355, 17.5930731), 4326), '{"JKN0PRM, J253"}', jsonb_build_object('te', 'మేలుపాక జగన్నాధపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jagannathapuram, Visakhapatnam', 'Jagannathapuram మేలుపాక జగన్నాధపురం JKN0PRM, J253', ST_SetSRID(ST_MakePoint(82.9292355, 17.5930731), 4326), 40);
    END IF;
    -- Insert Suchikonda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Suchikonda', ST_SetSRID(ST_MakePoint(82.9187797, 17.6000463), 4326), '{"SXKNT, S225"}', jsonb_build_object('te', 'చూచికొండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Suchikonda, Visakhapatnam', 'Suchikonda చూచికొండ SXKNT, S225', ST_SetSRID(ST_MakePoint(82.9187797, 17.6000463), 4326), 40);
    END IF;
    -- Insert Somavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Somavaram', ST_SetSRID(ST_MakePoint(82.8963719, 17.6053894), 4326), '{"S516, SMFRM"}', jsonb_build_object('te', 'సోమవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Somavaram, Visakhapatnam', 'Somavaram సోమవరం S516, SMFRM', ST_SetSRID(ST_MakePoint(82.8963719, 17.6053894), 4326), 40);
    END IF;
    -- Insert Narasapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narasapuram', ST_SetSRID(ST_MakePoint(82.9031615, 17.6168996), 4326), '{"NRSPRM, N621"}', jsonb_build_object('te', 'నరసపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narasapuram, Visakhapatnam', 'Narasapuram నరసపురం NRSPRM, N621', ST_SetSRID(ST_MakePoint(82.9031615, 17.6168996), 4326), 40);
    END IF;
    -- Insert Ganaparti (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ganaparti', ST_SetSRID(ST_MakePoint(82.9147235, 17.6007118), 4326), '{"KNPRT, G516"}', jsonb_build_object('te', 'గణపర్తి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ganaparti, Visakhapatnam', 'Ganaparti గణపర్తి KNPRT, G516', ST_SetSRID(ST_MakePoint(82.9147235, 17.6007118), 4326), 40);
    END IF;
    -- Insert Aminasahebupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aminasahebupeta', ST_SetSRID(ST_MakePoint(82.9029764, 17.6155157), 4326), '{"AMNSHBPT, A552"}', jsonb_build_object('te', 'అమీన్ సాహెబ్ పేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aminasahebupeta, Visakhapatnam', 'Aminasahebupeta అమీన్ సాహెబ్ పేట AMNSHBPT, A552', ST_SetSRID(ST_MakePoint(82.9029764, 17.6155157), 4326), 40);
    END IF;
    -- Insert Gobburupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gobburupalem', ST_SetSRID(ST_MakePoint(82.8995243, 17.6172749), 4326), '{"G161, KBRPLM"}', jsonb_build_object('te', 'గొబ్బూరుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gobburupalem, Visakhapatnam', 'Gobburupalem గొబ్బూరుపాలెం G161, KBRPLM', ST_SetSRID(ST_MakePoint(82.8995243, 17.6172749), 4326), 40);
    END IF;
    -- Insert Pallapu Anandapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pallapu Anandapuram', ST_SetSRID(ST_MakePoint(82.9423797, 17.6111474), 4326), '{"PLP ANNTPRM, P415"}', jsonb_build_object('te', 'పల్లపు ఆనందపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pallapu Anandapuram, Visakhapatnam', 'Pallapu Anandapuram పల్లపు ఆనందపురం PLP ANNTPRM, P415', ST_SetSRID(ST_MakePoint(82.9423797, 17.6111474), 4326), 40);
    END IF;
    -- Insert Jagardapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jagardapeta', ST_SetSRID(ST_MakePoint(82.9221801, 17.6178254), 4326), '{"JKRTPT, J263"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jagardapeta, Visakhapatnam', 'Jagardapeta  JKRTPT, J263', ST_SetSRID(ST_MakePoint(82.9221801, 17.6178254), 4326), 40);
    END IF;
    -- Insert Kumarapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kumarapuram', ST_SetSRID(ST_MakePoint(82.9352737, 17.6071922), 4326), '{"K561, KMRPRM"}', jsonb_build_object('te', 'కుమారపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kumarapuram, Visakhapatnam', 'Kumarapuram కుమారపురం K561, KMRPRM', ST_SetSRID(ST_MakePoint(82.9352737, 17.6071922), 4326), 40);
    END IF;
    -- Insert Mallavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mallavaram', ST_SetSRID(ST_MakePoint(82.9452688, 17.5953338), 4326), '{"MLFRM, M416"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mallavaram, Visakhapatnam', 'Mallavaram  MLFRM, M416', ST_SetSRID(ST_MakePoint(82.9452688, 17.5953338), 4326), 40);
    END IF;
    -- Insert Erravaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Erravaram', ST_SetSRID(ST_MakePoint(82.9631295, 17.5978876), 4326), '{"ERFRM, E616"}', jsonb_build_object('te', 'యెర్రవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Erravaram, Visakhapatnam', 'Erravaram యెర్రవరం ERFRM, E616', ST_SetSRID(ST_MakePoint(82.9631295, 17.5978876), 4326), 40);
    END IF;
    -- Insert Uppavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Uppavaram', ST_SetSRID(ST_MakePoint(82.9523953, 17.5973036), 4326), '{"UPFRM, U116"}', jsonb_build_object('te', 'ఉప్పవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Uppavaram, Visakhapatnam', 'Uppavaram ఉప్పవరం UPFRM, U116', ST_SetSRID(ST_MakePoint(82.9523953, 17.5973036), 4326), 40);
    END IF;
    -- Insert Andalapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Andalapalli', ST_SetSRID(ST_MakePoint(82.985637, 17.5979125), 4326), '{"A534, ANTLPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Andalapalli, Visakhapatnam', 'Andalapalli  A534, ANTLPL', ST_SetSRID(ST_MakePoint(82.985637, 17.5979125), 4326), 40);
    END IF;
    -- Insert Kondakarla (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondakarla', ST_SetSRID(ST_MakePoint(82.9830892, 17.5963242), 4326), '{"KNTKRL, K532"}', jsonb_build_object('te', 'కొండకర్ల పక్షుల సంరక్షణ కేంద్రం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondakarla, Visakhapatnam', 'Kondakarla కొండకర్ల పక్షుల సంరక్షణ కేంద్రం KNTKRL, K532', ST_SetSRID(ST_MakePoint(82.9830892, 17.5963242), 4326), 40);
    END IF;
    -- Insert Masahebupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Masahebupeta', ST_SetSRID(ST_MakePoint(82.9767099, 17.5678346), 4326), '{"M211, MSHBPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Masahebupeta, Visakhapatnam', 'Masahebupeta  M211, MSHBPT', ST_SetSRID(ST_MakePoint(82.9767099, 17.5678346), 4326), 40);
    END IF;
    -- Insert Ramannapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramannapalem', ST_SetSRID(ST_MakePoint(82.9892669, 17.568634), 4326), '{"RMNPLM, R551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramannapalem, Visakhapatnam', 'Ramannapalem  RMNPLM, R551', ST_SetSRID(ST_MakePoint(82.9892669, 17.568634), 4326), 40);
    END IF;
    -- Insert Chodapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chodapalli', ST_SetSRID(ST_MakePoint(82.9797163, 17.5751711), 4326), '{"XTPL, C314"}', jsonb_build_object('te', 'చోడపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chodapalli, Visakhapatnam', 'Chodapalli చోడపల్లి XTPL, C314', ST_SetSRID(ST_MakePoint(82.9797163, 17.5751711), 4326), 40);
    END IF;
    -- Insert Bhogapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhogapuram', ST_SetSRID(ST_MakePoint(82.991739, 17.5562328), 4326), '{"BHKPRM, B216"}', jsonb_build_object('te', 'భోగాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhogapuram, Visakhapatnam', 'Bhogapuram భోగాపురం BHKPRM, B216', ST_SetSRID(ST_MakePoint(82.991739, 17.5562328), 4326), 40);
    END IF;
    -- Insert Achchutapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Achchutapuram', ST_SetSRID(ST_MakePoint(82.9784264, 17.5621599), 4326), '{"A231, AXXTPRM"}', jsonb_build_object('te', 'అచ్యుతాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Achchutapuram, Visakhapatnam', 'Achchutapuram అచ్యుతాపురం A231, AXXTPRM', ST_SetSRID(ST_MakePoint(82.9784264, 17.5621599), 4326), 40);
    END IF;
    -- Insert Gondivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gondivanipalem', ST_SetSRID(ST_MakePoint(83.0477716, 17.5450843), 4326), '{"KNTFNPLM, G531"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gondivanipalem, Visakhapatnam', 'Gondivanipalem  KNTFNPLM, G531', ST_SetSRID(ST_MakePoint(83.0477716, 17.5450843), 4326), 40);
    END IF;
    -- Insert Kollavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kollavanipalem', ST_SetSRID(ST_MakePoint(83.0523462, 17.5519104), 4326), '{"KLFNPLM, K415"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kollavanipalem, Visakhapatnam', 'Kollavanipalem  KLFNPLM, K415', ST_SetSRID(ST_MakePoint(83.0523462, 17.5519104), 4326), 40);
    END IF;
    -- Insert Dosuru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dosuru', ST_SetSRID(ST_MakePoint(83.0351046, 17.5473024), 4326), '{"D260, TSR"}', jsonb_build_object('te', 'దోసూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dosuru, Visakhapatnam', 'Dosuru దోసూరు D260, TSR', ST_SetSRID(ST_MakePoint(83.0351046, 17.5473024), 4326), 40);
    END IF;
    -- Insert Yerkireddipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yerkireddipalem', ST_SetSRID(ST_MakePoint(83.0282676, 17.5556494), 4326), '{"YRKRTPLM, Y626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yerkireddipalem, Visakhapatnam', 'Yerkireddipalem  YRKRTPLM, Y626', ST_SetSRID(ST_MakePoint(83.0282676, 17.5556494), 4326), 40);
    END IF;
    -- Insert Nadimpalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nadimpalle', ST_SetSRID(ST_MakePoint(83.0484281, 17.5681574), 4326), '{"N351, NTMPL"}', jsonb_build_object('te', 'నడింపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nadimpalle, Visakhapatnam', 'Nadimpalle నడింపల్లి N351, NTMPL', ST_SetSRID(ST_MakePoint(83.0484281, 17.5681574), 4326), 40);
    END IF;
    -- Insert Gollalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(83.0475794, 17.5511864), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem  KLLPLM, G441', ST_SetSRID(ST_MakePoint(83.0475794, 17.5511864), 4326), 40);
    END IF;
    -- Insert Nettimvanipallem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nettimvanipallem', ST_SetSRID(ST_MakePoint(83.0408163, 17.5513425), 4326), '{"N351, NTMFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nettimvanipallem, Visakhapatnam', 'Nettimvanipallem  N351, NTMFNPLM', ST_SetSRID(ST_MakePoint(83.0408163, 17.5513425), 4326), 40);
    END IF;
    -- Insert Maduturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maduturu', ST_SetSRID(ST_MakePoint(83.0130272, 17.557981), 4326), '{"MTTR, M336"}', jsonb_build_object('te', 'మద్దుటూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maduturu, Visakhapatnam', 'Maduturu మద్దుటూరు MTTR, M336', ST_SetSRID(ST_MakePoint(83.0130272, 17.557981), 4326), 40);
    END IF;
    -- Insert Appannapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appannapalem', ST_SetSRID(ST_MakePoint(83.0139557, 17.5768918), 4326), '{"A151, APNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appannapalem, Visakhapatnam', 'Appannapalem  A151, APNPLM', ST_SetSRID(ST_MakePoint(83.0139557, 17.5768918), 4326), 10);
    END IF;
    -- Insert Pillavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pillavanipalem', ST_SetSRID(ST_MakePoint(83.0192073, 17.5727426), 4326), '{"PLFNPLM, P415"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pillavanipalem, Visakhapatnam', 'Pillavanipalem  PLFNPLM, P415', ST_SetSRID(ST_MakePoint(83.0192073, 17.5727426), 4326), 40);
    END IF;
    -- Insert Tammayyapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tammayyapalem', ST_SetSRID(ST_MakePoint(83.0256878, 17.5668562), 4326), '{"T514, TMYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tammayyapalem, Visakhapatnam', 'Tammayyapalem  T514, TMYPLM', ST_SetSRID(ST_MakePoint(83.0256878, 17.5668562), 4326), 10);
    END IF;
    -- Insert Gollagunta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollagunta', ST_SetSRID(ST_MakePoint(83.0579135, 17.5795194), 4326), '{"G425, KLKNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollagunta, Visakhapatnam', 'Gollagunta  G425, KLKNT', ST_SetSRID(ST_MakePoint(83.0579135, 17.5795194), 4326), 10);
    END IF;
    -- Insert Rekavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rekavanipalem', ST_SetSRID(ST_MakePoint(83.067344, 17.5874649), 4326), '{"RKFNPLM, R215"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rekavanipalem, Visakhapatnam', 'Rekavanipalem  RKFNPLM, R215', ST_SetSRID(ST_MakePoint(83.067344, 17.5874649), 4326), 10);
    END IF;
    -- Insert Gangamambapuram Agraharam (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gangamambapuram Agraharam', ST_SetSRID(ST_MakePoint(83.0566057, 17.5768454), 4326), '{"G525, KNKMMBPRM AKRHRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gangamambapuram Agraharam, Visakhapatnam', 'Gangamambapuram Agraharam  G525, KNKMMBPRM AKRHRM', ST_SetSRID(ST_MakePoint(83.0566057, 17.5768454), 4326), 10);
    END IF;
    -- Insert Narapaka (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narapaka', ST_SetSRID(ST_MakePoint(83.0243072, 17.5871986), 4326), '{"NRPK, N612"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narapaka, Visakhapatnam', 'Narapaka  NRPK, N612', ST_SetSRID(ST_MakePoint(83.0243072, 17.5871986), 4326), 10);
    END IF;
    -- Insert Karnavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karnavanipalem', ST_SetSRID(ST_MakePoint(83.0318967, 17.5953887), 4326), '{"K651, KRNFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karnavanipalem, Visakhapatnam', 'Karnavanipalem  K651, KRNFNPLM', ST_SetSRID(ST_MakePoint(83.0318967, 17.5953887), 4326), 40);
    END IF;
    -- Insert Kotta Nagavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Nagavaram', ST_SetSRID(ST_MakePoint(83.0366804, 17.596303), 4326), '{"KT NKFRM, K352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Nagavaram, Visakhapatnam', 'Kotta Nagavaram  KT NKFRM, K352', ST_SetSRID(ST_MakePoint(83.0366804, 17.596303), 4326), 40);
    END IF;
    -- Insert Iruvada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Iruvada', ST_SetSRID(ST_MakePoint(83.0437745, 17.6016926), 4326), '{"I613, IRFT"}', jsonb_build_object('te', 'ఇరవాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Iruvada, Visakhapatnam', 'Iruvada ఇరవాడ I613, IRFT', ST_SetSRID(ST_MakePoint(83.0437745, 17.6016926), 4326), 40);
    END IF;
    -- Insert Chimalapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chimalapalle', ST_SetSRID(ST_MakePoint(83.0018176, 17.5872103), 4326), '{"C541, XMLPL"}', jsonb_build_object('te', 'చీమలపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chimalapalle, Visakhapatnam', 'Chimalapalle చీమలపల్లి C541, XMLPL', ST_SetSRID(ST_MakePoint(83.0018176, 17.5872103), 4326), 40);
    END IF;
    -- Insert Somavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Somavaram', ST_SetSRID(ST_MakePoint(83.0111747, 17.5870348), 4326), '{"S516, SMFRM"}', jsonb_build_object('te', 'సోమవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Somavaram, Visakhapatnam', 'Somavaram సోమవరం S516, SMFRM', ST_SetSRID(ST_MakePoint(83.0111747, 17.5870348), 4326), 40);
    END IF;
    -- Insert Joguvanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Joguvanipalem', ST_SetSRID(ST_MakePoint(83.0542647, 17.6005541), 4326), '{"JKFNPLM, J215"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Joguvanipalem, Visakhapatnam', 'Joguvanipalem  JKFNPLM, J215', ST_SetSRID(ST_MakePoint(83.0542647, 17.6005541), 4326), 40);
    END IF;
    -- Insert Rajam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajam', ST_SetSRID(ST_MakePoint(83.0173559, 17.5925245), 4326), '{"RJM, R250"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajam, Visakhapatnam', 'Rajam  RJM, R250', ST_SetSRID(ST_MakePoint(83.0173559, 17.5925245), 4326), 40);
    END IF;
    -- Insert Gollapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapalem', ST_SetSRID(ST_MakePoint(83.012379, 17.60666), 4326), '{"KLPLM, G414"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapalem, Visakhapatnam', 'Gollapalem  KLPLM, G414', ST_SetSRID(ST_MakePoint(83.012379, 17.60666), 4326), 40);
    END IF;
    -- Insert Vadrapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vadrapalle', ST_SetSRID(ST_MakePoint(83.0026702, 17.6164166), 4326), '{"FTRPL, V361"}', jsonb_build_object('te', 'వడ్రపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vadrapalle, Visakhapatnam', 'Vadrapalle వడ్రపల్లి FTRPL, V361', ST_SetSRID(ST_MakePoint(83.0026702, 17.6164166), 4326), 40);
    END IF;
    -- Insert Mallavaram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mallavaram', ST_SetSRID(ST_MakePoint(83.0141705, 17.6112765), 4326), '{"MLFRM, M416"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mallavaram, Visakhapatnam', 'Mallavaram  MLFRM, M416', ST_SetSRID(ST_MakePoint(83.0141705, 17.6112765), 4326), 10);
    END IF;
    -- Insert Kundhavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kundhavanipalem', ST_SetSRID(ST_MakePoint(83.0204227, 17.6123952), 4326), '{"K531, KNTHFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kundhavanipalem, Visakhapatnam', 'Kundhavanipalem  K531, KNTHFNPLM', ST_SetSRID(ST_MakePoint(83.0204227, 17.6123952), 4326), 40);
    END IF;
    -- Insert Nagavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nagavaram', ST_SetSRID(ST_MakePoint(83.0282438, 17.6041483), 4326), '{"NKFRM, N216"}', jsonb_build_object('te', 'నాగవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nagavaram, Visakhapatnam', 'Nagavaram నాగవరం NKFRM, N216', ST_SetSRID(ST_MakePoint(83.0282438, 17.6041483), 4326), 40);
    END IF;
    -- Insert Appikondavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appikondavanipalem', ST_SetSRID(ST_MakePoint(83.0186481, 17.6059063), 4326), '{"A125, APKNTFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appikondavanipalem, Visakhapatnam', 'Appikondavanipalem  A125, APKNTFNPLM', ST_SetSRID(ST_MakePoint(83.0186481, 17.6059063), 4326), 10);
    END IF;
    -- Insert Jaggannapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jaggannapeta', ST_SetSRID(ST_MakePoint(82.9501425, 17.6150957), 4326), '{"JKNPT, J251"}', jsonb_build_object('te', 'జగ్గన్నపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jaggannapeta, Visakhapatnam', 'Jaggannapeta జగ్గన్నపేట JKNPT, J251', ST_SetSRID(ST_MakePoint(82.9501425, 17.6150957), 4326), 40);
    END IF;
    -- Insert Purushottapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Purushottapuram', ST_SetSRID(ST_MakePoint(82.9482887, 17.6173161), 4326), '{"PRXTPRM, P623"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Purushottapuram, Visakhapatnam', 'Purushottapuram  PRXTPRM, P623', ST_SetSRID(ST_MakePoint(82.9482887, 17.6173161), 4326), 40);
    END IF;
    -- Insert Khajipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Khajipalem', ST_SetSRID(ST_MakePoint(82.9509318, 17.6183883), 4326), '{"KHJPLM, K214"}', jsonb_build_object('te', 'ఖాజీపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Khajipalem, Visakhapatnam', 'Khajipalem ఖాజీపాలెం KHJPLM, K214', ST_SetSRID(ST_MakePoint(82.9509318, 17.6183883), 4326), 40);
    END IF;
    -- Insert Peddapadu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Peddapadu', ST_SetSRID(ST_MakePoint(82.9658106, 17.6233358), 4326), '{"P313, PTPT"}', jsonb_build_object('te', 'పెదపాడు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Peddapadu, Visakhapatnam', 'Peddapadu పెదపాడు P313, PTPT', ST_SetSRID(ST_MakePoint(82.9658106, 17.6233358), 4326), 40);
    END IF;
    -- Insert Ammaralupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ammaralupeta', ST_SetSRID(ST_MakePoint(82.9818873, 17.6213663), 4326), '{"AMRLPT, A564"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ammaralupeta, Visakhapatnam', 'Ammaralupeta  AMRLPT, A564', ST_SetSRID(ST_MakePoint(82.9818873, 17.6213663), 4326), 40);
    END IF;
    -- Insert Timmarajupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Timmarajupeta', ST_SetSRID(ST_MakePoint(82.9786682, 17.618873), 4326), '{"T562, TMRJPT"}', jsonb_build_object('te', 'తిమ్మరాజుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Timmarajupeta, Visakhapatnam', 'Timmarajupeta తిమ్మరాజుపేట T562, TMRJPT', ST_SetSRID(ST_MakePoint(82.9786682, 17.618873), 4326), 40);
    END IF;
    -- Insert Haripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Haripalem', ST_SetSRID(ST_MakePoint(82.9788751, 17.6097819), 4326), '{"HRPLM, H614"}', jsonb_build_object('te', 'హరిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Haripalem, Visakhapatnam', 'Haripalem హరిపాలెం HRPLM, H614', ST_SetSRID(ST_MakePoint(82.9788751, 17.6097819), 4326), 40);
    END IF;
    -- Insert Veduruparti (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Veduruparti', ST_SetSRID(ST_MakePoint(82.9514801, 17.6343825), 4326), '{"FTRPRT, V361"}', jsonb_build_object('te', 'వెదురుపర్తి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Veduruparti, Visakhapatnam', 'Veduruparti వెదురుపర్తి FTRPRT, V361', ST_SetSRID(ST_MakePoint(82.9514801, 17.6343825), 4326), 40);
    END IF;
    -- Insert Kottapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottapalli', ST_SetSRID(ST_MakePoint(82.91894, 17.6356315), 4326), '{"KTPL, K314"}', jsonb_build_object('te', 'కొత్తపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottapalli, Visakhapatnam', 'Kottapalli కొత్తపల్లి KTPL, K314', ST_SetSRID(ST_MakePoint(82.91894, 17.6356315), 4326), 40);
    END IF;
    -- Insert Paragalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Paragalapalem', ST_SetSRID(ST_MakePoint(82.9271694, 17.6315797), 4326), '{"P624, PRKLPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Paragalapalem, Visakhapatnam', 'Paragalapalem  P624, PRKLPLM', ST_SetSRID(ST_MakePoint(82.9271694, 17.6315797), 4326), 40);
    END IF;
    -- Insert Gontavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gontavanipalem', ST_SetSRID(ST_MakePoint(82.9291875, 17.6326462), 4326), '{"KNTFNPLM, G531"}', jsonb_build_object('te', 'గంటవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gontavanipalem, Visakhapatnam', 'Gontavanipalem గంటవానిపాలెం KNTFNPLM, G531', ST_SetSRID(ST_MakePoint(82.9291875, 17.6326462), 4326), 40);
    END IF;
    -- Insert Tegada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tegada', ST_SetSRID(ST_MakePoint(82.9387637, 17.6432544), 4326), '{"TKT, T230"}', jsonb_build_object('te', 'తేగాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tegada, Visakhapatnam', 'Tegada తేగాడ TKT, T230', ST_SetSRID(ST_MakePoint(82.9387637, 17.6432544), 4326), 40);
    END IF;
    -- Insert Ramannapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramannapalem', ST_SetSRID(ST_MakePoint(82.9331203, 17.6640864), 4326), '{"RMNPLM, R551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramannapalem, Visakhapatnam', 'Ramannapalem  RMNPLM, R551', ST_SetSRID(ST_MakePoint(82.9331203, 17.6640864), 4326), 40);
    END IF;
    -- Insert Ugginapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ugginapalem', ST_SetSRID(ST_MakePoint(82.897148, 17.6474176), 4326), '{"U251, UJNPLM"}', jsonb_build_object('te', 'ఉగ్గినపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ugginapalem, Visakhapatnam', 'Ugginapalem ఉగ్గినపాలెం U251, UJNPLM', ST_SetSRID(ST_MakePoint(82.897148, 17.6474176), 4326), 40);
    END IF;
    -- Insert Jammatulapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jammatulapalem', ST_SetSRID(ST_MakePoint(82.912521, 17.6601383), 4326), '{"JMTLPLM, J534"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jammatulapalem, Visakhapatnam', 'Jammatulapalem  JMTLPLM, J534', ST_SetSRID(ST_MakePoint(82.912521, 17.6601383), 4326), 40);
    END IF;
    -- Insert Paravadapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Paravadapalem', ST_SetSRID(ST_MakePoint(82.9098215, 17.653615), 4326), '{"P613, PRFTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Paravadapalem, Visakhapatnam', 'Paravadapalem  P613, PRFTPLM', ST_SetSRID(ST_MakePoint(82.9098215, 17.653615), 4326), 40);
    END IF;
    -- Insert Dibbidi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dibbidi', ST_SetSRID(ST_MakePoint(82.8791874, 17.7981181), 4326), '{"D130, TBT"}', jsonb_build_object('te', 'దిబ్బిడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dibbidi, Visakhapatnam', 'Dibbidi దిబ్బిడి D130, TBT', ST_SetSRID(ST_MakePoint(82.8791874, 17.7981181), 4326), 40);
    END IF;
    -- Insert Bhimavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhimavaram', ST_SetSRID(ST_MakePoint(82.8590842, 17.8022848), 4326), '{"BHMFRM, B516"}', jsonb_build_object('te', 'పి. భీమవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhimavaram, Visakhapatnam', 'Bhimavaram పి. భీమవరం BHMFRM, B516', ST_SetSRID(ST_MakePoint(82.8590842, 17.8022848), 4326), 40);
    END IF;
    -- Insert Kannavaripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kannavaripalem', ST_SetSRID(ST_MakePoint(82.8678035, 17.8047579), 4326), '{"KNFRPLM, K516"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kannavaripalem, Visakhapatnam', 'Kannavaripalem  KNFRPLM, K516', ST_SetSRID(ST_MakePoint(82.8678035, 17.8047579), 4326), 40);
    END IF;
    -- Insert Kondepudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondepudi', ST_SetSRID(ST_MakePoint(82.8456893, 17.8015757), 4326), '{"KNTPT, K531"}', jsonb_build_object('te', 'కొండెంపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondepudi, Visakhapatnam', 'Kondepudi కొండెంపూడి KNTPT, K531', ST_SetSRID(ST_MakePoint(82.8456893, 17.8015757), 4326), 40);
    END IF;
    -- Insert Bangarumetta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bangarumetta', ST_SetSRID(ST_MakePoint(82.8651359, 17.8373948), 4326), '{"BNKRMT, B526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bangarumetta, Visakhapatnam', 'Bangarumetta  BNKRMT, B526', ST_SetSRID(ST_MakePoint(82.8651359, 17.8373948), 4326), 40);
    END IF;
    -- Insert Singavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Singavaram', ST_SetSRID(ST_MakePoint(82.8423634, 17.8208117), 4326), '{"SNKFRM, S521"}', jsonb_build_object('te', 'ఎల్. సింగవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Singavaram, Visakhapatnam', 'Singavaram ఎల్. సింగవరం SNKFRM, S521', ST_SetSRID(ST_MakePoint(82.8423634, 17.8208117), 4326), 40);
    END IF;
    -- Insert Lopudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lopudi', ST_SetSRID(ST_MakePoint(82.8468855, 17.8230488), 4326), '{"LPT, L130"}', jsonb_build_object('te', 'లోపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lopudi, Visakhapatnam', 'Lopudi లోపూడి LPT, L130', ST_SetSRID(ST_MakePoint(82.8468855, 17.8230488), 4326), 40);
    END IF;
    -- Insert Viravalli Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Viravalli Agraharam', ST_SetSRID(ST_MakePoint(82.855829, 17.8529366), 4326), '{"FRFL AKRHRM, V614"}', jsonb_build_object('te', 'వీరవిల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Viravalli Agraharam, Visakhapatnam', 'Viravalli Agraharam వీరవిల్లి FRFL AKRHRM, V614', ST_SetSRID(ST_MakePoint(82.855829, 17.8529366), 4326), 40);
    END IF;
    -- Insert Lakshmipuram Agraharam (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lakshmipuram Agraharam', ST_SetSRID(ST_MakePoint(82.8492724, 17.8575341), 4326), '{"L251, LKXMPRM AKRHRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lakshmipuram Agraharam, Visakhapatnam', 'Lakshmipuram Agraharam  L251, LKXMPRM AKRHRM', ST_SetSRID(ST_MakePoint(82.8492724, 17.8575341), 4326), 10);
    END IF;
    -- Insert Potanapudi Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Potanapudi Agraharam', ST_SetSRID(ST_MakePoint(82.8509646, 17.8447998), 4326), '{"P351, PTNPT AKRHRM"}', jsonb_build_object('te', 'పోతనపూడి అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Potanapudi Agraharam, Visakhapatnam', 'Potanapudi Agraharam పోతనపూడి అగ్రహారం P351, PTNPT AKRHRM', ST_SetSRID(ST_MakePoint(82.8509646, 17.8447998), 4326), 40);
    END IF;
    -- Insert Kumdampeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kumdampeta', ST_SetSRID(ST_MakePoint(82.8787375, 17.8680442), 4326), '{"K535, KMTMPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kumdampeta, Visakhapatnam', 'Kumdampeta  K535, KMTMPT', ST_SetSRID(ST_MakePoint(82.8787375, 17.8680442), 4326), 40);
    END IF;
    -- Insert Mangalapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mangalapuram', ST_SetSRID(ST_MakePoint(82.873098, 17.8713981), 4326), '{"MNKLPRM, M524"}', jsonb_build_object('te', 'మంగళాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mangalapuram, Visakhapatnam', 'Mangalapuram మంగళాపురం MNKLPRM, M524', ST_SetSRID(ST_MakePoint(82.873098, 17.8713981), 4326), 40);
    END IF;
    -- Insert Mukundapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mukundapuram', ST_SetSRID(ST_MakePoint(82.8546137, 17.86347), 4326), '{"M253, MKNTPRM"}', jsonb_build_object('te', 'ముకుందపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mukundapuram, Visakhapatnam', 'Mukundapuram ముకుందపురం M253, MKNTPRM', ST_SetSRID(ST_MakePoint(82.8546137, 17.86347), 4326), 40);
    END IF;
    -- Insert Vantarlapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vantarlapalem', ST_SetSRID(ST_MakePoint(82.8542816, 17.8818432), 4326), '{"FNTRLPLM, V536"}', jsonb_build_object('te', 'వంటర్లపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vantarlapalem, Visakhapatnam', 'Vantarlapalem వంటర్లపాలెం FNTRLPLM, V536', ST_SetSRID(ST_MakePoint(82.8542816, 17.8818432), 4326), 40);
    END IF;
    -- Insert Kaspa Jagannadhapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kaspa Jagannadhapuram', ST_SetSRID(ST_MakePoint(82.8487992, 17.8868742), 4326), '{"K212, KSP JKNTHPRM"}', jsonb_build_object('te', 'కస్పా జగన్నాధపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kaspa Jagannadhapuram, Visakhapatnam', 'Kaspa Jagannadhapuram కస్పా జగన్నాధపురం K212, KSP JKNTHPRM', ST_SetSRID(ST_MakePoint(82.8487992, 17.8868742), 4326), 40);
    END IF;
    -- Insert Suravaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Suravaram', ST_SetSRID(ST_MakePoint(82.8081366, 17.8878953), 4326), '{"SRFRM, S616"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Suravaram, Visakhapatnam', 'Suravaram  SRFRM, S616', ST_SetSRID(ST_MakePoint(82.8081366, 17.8878953), 4326), 40);
    END IF;
    -- Insert Vadapadu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vadapadu', ST_SetSRID(ST_MakePoint(82.8154827, 17.8787693), 4326), '{"V313, FTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vadapadu, Visakhapatnam', 'Vadapadu  V313, FTPT', ST_SetSRID(ST_MakePoint(82.8154827, 17.8787693), 4326), 40);
    END IF;
    -- Insert Kotapadu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotapadu', ST_SetSRID(ST_MakePoint(82.826295, 17.8782769), 4326), '{"K313, KTPT"}', jsonb_build_object('te', 'మాడుగుల కోటపాడు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotapadu, Visakhapatnam', 'Kotapadu మాడుగుల కోటపాడు K313, KTPT', ST_SetSRID(ST_MakePoint(82.826295, 17.8782769), 4326), 40);
    END IF;
    -- Insert Chintaluru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintaluru', ST_SetSRID(ST_MakePoint(82.8144754, 17.8576182), 4326), '{"C534, XNTLR"}', jsonb_build_object('te', 'చింతలూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintaluru, Visakhapatnam', 'Chintaluru చింతలూరు C534, XNTLR', ST_SetSRID(ST_MakePoint(82.8144754, 17.8576182), 4326), 40);
    END IF;
    -- Insert Gadvidi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gadvidi', ST_SetSRID(ST_MakePoint(82.8074646, 17.8554422), 4326), '{"KTFT, G313"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gadvidi, Visakhapatnam', 'Gadvidi  KTFT, G313', ST_SetSRID(ST_MakePoint(82.8074646, 17.8554422), 4326), 40);
    END IF;
    -- Insert Jampena (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jampena', ST_SetSRID(ST_MakePoint(82.8084732, 17.8737293), 4326), '{"J515, JMPN"}', jsonb_build_object('te', 'జంపన'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jampena, Visakhapatnam', 'Jampena జంపన J515, JMPN', ST_SetSRID(ST_MakePoint(82.8084732, 17.8737293), 4326), 40);
    END IF;
    -- Insert Viranarayanam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Viranarayanam', ST_SetSRID(ST_MakePoint(82.8181541, 17.8672941), 4326), '{"V656, FRNRYNM"}', jsonb_build_object('te', 'వీరనారాయణం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Viranarayanam, Visakhapatnam', 'Viranarayanam వీరనారాయణం V656, FRNRYNM', ST_SetSRID(ST_MakePoint(82.8181541, 17.8672941), 4326), 40);
    END IF;
    -- Insert Gottivada Agaraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gottivada Agaraharam', ST_SetSRID(ST_MakePoint(82.8309069, 17.8611766), 4326), '{"G313, KTFT AKRHRM"}', jsonb_build_object('te', 'గొటివాడ అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gottivada Agaraharam, Visakhapatnam', 'Gottivada Agaraharam గొటివాడ అగ్రహారం G313, KTFT AKRHRM', ST_SetSRID(ST_MakePoint(82.8309069, 17.8611766), 4326), 40);
    END IF;
    -- Insert Pottidorapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pottidorapalem', ST_SetSRID(ST_MakePoint(82.8302976, 17.8154947), 4326), '{"P336, PTTRPLM"}', jsonb_build_object('te', 'పొట్టిదొరపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pottidorapalem, Visakhapatnam', 'Pottidorapalem పొట్టిదొరపాలెం P336, PTTRPLM', ST_SetSRID(ST_MakePoint(82.8302976, 17.8154947), 4326), 40);
    END IF;
    -- Insert Buddiredlapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Buddiredlapalem', ST_SetSRID(ST_MakePoint(82.8199633, 17.8048732), 4326), '{"BTRTLPLM, B363"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Buddiredlapalem, Visakhapatnam', 'Buddiredlapalem  BTRTLPLM, B363', ST_SetSRID(ST_MakePoint(82.8199633, 17.8048732), 4326), 40);
    END IF;
    -- Insert Gollalapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(82.8227883, 17.8077112), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem  KLLPLM, G441', ST_SetSRID(ST_MakePoint(82.8227883, 17.8077112), 4326), 10);
    END IF;
    -- Insert Komallapudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Komallapudi', ST_SetSRID(ST_MakePoint(82.8181737, 17.7999808), 4326), '{"KMLPT, K541"}', jsonb_build_object('te', 'కొమళ్ళపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Komallapudi, Visakhapatnam', 'Komallapudi కొమళ్ళపూడి KMLPT, K541', ST_SetSRID(ST_MakePoint(82.8181737, 17.7999808), 4326), 40);
    END IF;
    -- Insert Gantikortam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gantikortam', ST_SetSRID(ST_MakePoint(82.8074673, 17.8115151), 4326), '{"G532, KNTKRTM"}', jsonb_build_object('te', 'గంటికొర్లాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gantikortam, Visakhapatnam', 'Gantikortam గంటికొర్లాం G532, KNTKRTM', ST_SetSRID(ST_MakePoint(82.8074673, 17.8115151), 4326), 40);
    END IF;
    -- Insert Gudivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gudivada', ST_SetSRID(ST_MakePoint(82.8168963, 17.78118), 4326), '{"KTFT, G313"}', jsonb_build_object('te', 'గుడివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gudivada, Visakhapatnam', 'Gudivada గుడివాడ KTFT, G313', ST_SetSRID(ST_MakePoint(82.8168963, 17.78118), 4326), 40);
    END IF;
    -- Insert Mattavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mattavanipalem', ST_SetSRID(ST_MakePoint(82.8178151, 17.7880849), 4326), '{"M315, MTFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mattavanipalem, Visakhapatnam', 'Mattavanipalem  M315, MTFNPLM', ST_SetSRID(ST_MakePoint(82.8178151, 17.7880849), 4326), 40);
    END IF;
    -- Insert Dasarayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dasarayyapalem', ST_SetSRID(ST_MakePoint(82.8048101, 17.78249), 4326), '{"D261, TSRYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dasarayyapalem, Visakhapatnam', 'Dasarayyapalem  D261, TSRYPLM', ST_SetSRID(ST_MakePoint(82.8048101, 17.78249), 4326), 40);
    END IF;
    -- Insert Ravikamatam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ravikamatam', ST_SetSRID(ST_MakePoint(82.8003858, 17.7932971), 4326), '{"RFKMTM, R125"}', jsonb_build_object('te', 'రావికమతం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ravikamatam, Visakhapatnam', 'Ravikamatam రావికమతం RFKMTM, R125', ST_SetSRID(ST_MakePoint(82.8003858, 17.7932971), 4326), 40);
    END IF;
    -- Insert Guddepa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Guddepa', ST_SetSRID(ST_MakePoint(82.8034714, 17.7395529), 4326), '{"G310, KTP"}', jsonb_build_object('te', 'గుడ్డిప'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Guddepa, Visakhapatnam', 'Guddepa గుడ్డిప G310, KTP', ST_SetSRID(ST_MakePoint(82.8034714, 17.7395529), 4326), 40);
    END IF;
    -- Insert Tattabanda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tattabanda', ST_SetSRID(ST_MakePoint(82.8014558, 17.714556), 4326), '{"T315, TTBNT"}', jsonb_build_object('te', 'తట్టబండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tattabanda, Visakhapatnam', 'Tattabanda తట్టబండ T315, TTBNT', ST_SetSRID(ST_MakePoint(82.8014558, 17.714556), 4326), 40);
    END IF;
    -- Insert Upparagudem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Upparagudem', ST_SetSRID(ST_MakePoint(82.8290574, 17.7189271), 4326), '{"U162, UPRKTM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Upparagudem, Visakhapatnam', 'Upparagudem  U162, UPRKTM', ST_SetSRID(ST_MakePoint(82.8290574, 17.7189271), 4326), 40);
    END IF;
    -- Insert Gorlapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gorlapalem', ST_SetSRID(ST_MakePoint(82.8151187, 17.7264292), 4326), '{"KRLPLM, G641"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gorlapalem, Visakhapatnam', 'Gorlapalem  KRLPLM, G641', ST_SetSRID(ST_MakePoint(82.8151187, 17.7264292), 4326), 40);
    END IF;
    -- Insert Chandakapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chandakapalem', ST_SetSRID(ST_MakePoint(82.8440678, 17.7046154), 4326), '{"C532, XNTKPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chandakapalem, Visakhapatnam', 'Chandakapalem  C532, XNTKPLM', ST_SetSRID(ST_MakePoint(82.8440678, 17.7046154), 4326), 40);
    END IF;
    -- Insert Turakalapudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Turakalapudi', ST_SetSRID(ST_MakePoint(82.8597885, 17.7343902), 4326), '{"T624, TRKLPT"}', jsonb_build_object('te', 'తురకలపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Turakalapudi, Visakhapatnam', 'Turakalapudi తురకలపూడి T624, TRKLPT', ST_SetSRID(ST_MakePoint(82.8597885, 17.7343902), 4326), 40);
    END IF;
    -- Insert Sitayyapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sitayyapeta', ST_SetSRID(ST_MakePoint(82.8311061, 17.7317051), 4326), '{"S313, STYPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sitayyapeta, Visakhapatnam', 'Sitayyapeta  S313, STYPT', ST_SetSRID(ST_MakePoint(82.8311061, 17.7317051), 4326), 40);
    END IF;
    -- Insert Peddapudi Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Peddapudi Agraharam', ST_SetSRID(ST_MakePoint(82.8252113, 17.7269807), 4326), '{"P313, PTPT AKRHRM"}', jsonb_build_object('te', 'పెదపూడి అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Peddapudi Agraharam, Visakhapatnam', 'Peddapudi Agraharam పెదపూడి అగ్రహారం P313, PTPT AKRHRM', ST_SetSRID(ST_MakePoint(82.8252113, 17.7269807), 4326), 40);
    END IF;
    -- Insert Chintapaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintapaka', ST_SetSRID(ST_MakePoint(82.8406297, 17.74161), 4326), '{"XNTPK, C531"}', jsonb_build_object('te', 'చింతపాక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintapaka, Visakhapatnam', 'Chintapaka చింతపాక XNTPK, C531', ST_SetSRID(ST_MakePoint(82.8406297, 17.74161), 4326), 40);
    END IF;
    -- Insert Peddapudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Peddapudi', ST_SetSRID(ST_MakePoint(82.8300478, 17.7112474), 4326), '{"P313, PTPT"}', jsonb_build_object('te', 'పెదపూడి (బుచ్చయ్యపేట)'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Peddapudi, Visakhapatnam', 'Peddapudi పెదపూడి (బుచ్చయ్యపేట) P313, PTPT', ST_SetSRID(ST_MakePoint(82.8300478, 17.7112474), 4326), 40);
    END IF;
END $$;