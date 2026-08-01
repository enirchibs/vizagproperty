-- BULK OSM DATA SEED PART 4
DO $$
DECLARE
    vzg_city_id UUID;
    new_loc_id UUID;
BEGIN
    SELECT id INTO vzg_city_id FROM geo.cities WHERE name = 'Visakhapatnam' LIMIT 1;
    -- Insert Shivashanthi Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Shivashanthi Restaurant', ST_SetSRID(ST_MakePoint(83.3011842, 17.7121488), 4326), '{"S125, XFXN0 RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Shivashanthi Restaurant, Visakhapatnam', 'Shivashanthi Restaurant  S125, XFXN0 RSTRNT', ST_SetSRID(ST_MakePoint(83.3011842, 17.7121488), 4326), 10);
    END IF;
    -- Insert Helapuri (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Helapuri', ST_SetSRID(ST_MakePoint(83.3016479, 17.711948), 4326), '{"HLPR, H416"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Helapuri, Visakhapatnam', 'Helapuri  HLPR, H416', ST_SetSRID(ST_MakePoint(83.3016479, 17.711948), 4326), 10);
    END IF;
    -- Insert St. Joseph''s Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'St. Joseph''s Hospital', ST_SetSRID(ST_MakePoint(83.3120581, 17.7113427), 4326), '{"ST JSFS HSPTL, S322"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'St. Joseph''s Hospital, Visakhapatnam', 'St. Joseph''s Hospital  ST JSFS HSPTL, S322', ST_SetSRID(ST_MakePoint(83.3120581, 17.7113427), 4326), 50);
    END IF;
    -- Insert shantiniketan mental health centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'shantiniketan mental health centre', ST_SetSRID(ST_MakePoint(83.3118425, 17.710893), 4326), '{"S535, XNTNKTN MNTL HL0 SNTR"}', jsonb_build_object('te', 'శాంతినికేతం మెంటల్ హెల్త్ సెంటర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'shantiniketan mental health centre, Visakhapatnam', 'shantiniketan mental health centre శాంతినికేతం మెంటల్ హెల్త్ సెంటర్ S535, XNTNKTN MNTL HL0 SNTR', ST_SetSRID(ST_MakePoint(83.3118425, 17.710893), 4326), 50);
    END IF;
    -- Insert Mycure hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mycure hospital', ST_SetSRID(ST_MakePoint(83.3146963, 17.7120173), 4326), '{"M262, MKR HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mycure hospital, Visakhapatnam', 'Mycure hospital  M262, MKR HSPTL', ST_SetSRID(ST_MakePoint(83.3146963, 17.7120173), 4326), 50);
    END IF;
    -- Insert Baskinrobins (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Baskinrobins', ST_SetSRID(ST_MakePoint(83.314632, 17.7126305), 4326), '{"BSKNRBNS, B256"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Baskinrobins, Visakhapatnam', 'Baskinrobins  BSKNRBNS, B256', ST_SetSRID(ST_MakePoint(83.314632, 17.7126305), 4326), 10);
    END IF;
    -- Insert Surya skin care (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Surya skin care', ST_SetSRID(ST_MakePoint(83.3143316, 17.7141226), 4326), '{"S625, SRY SKN KR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Surya skin care, Visakhapatnam', 'Surya skin care  S625, SRY SKN KR', ST_SetSRID(ST_MakePoint(83.3143316, 17.7141226), 4326), 50);
    END IF;
    -- Insert NBM law college (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'NBM law college', ST_SetSRID(ST_MakePoint(83.3136878, 17.7135912), 4326), '{"N154, NBM L KLJ"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'NBM law college, Visakhapatnam', 'NBM law college  N154, NBM L KLJ', ST_SetSRID(ST_MakePoint(83.3136878, 17.7135912), 4326), 50);
    END IF;
    -- Insert Krishna Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Krishna Hospital', ST_SetSRID(ST_MakePoint(83.3109627, 17.7100754), 4326), '{"K625, KRXN HSPTL"}', jsonb_build_object('te', 'కృష్ణ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Krishna Hospital, Visakhapatnam', 'Krishna Hospital కృష్ణ హాస్పిటల్ K625, KRXN HSPTL', ST_SetSRID(ST_MakePoint(83.3109627, 17.7100754), 4326), 50);
    END IF;
    -- Insert Aaradhya fertility centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aaradhya fertility centre', ST_SetSRID(ST_MakePoint(83.3128724, 17.7149198), 4326), '{"RTHY FRTLT SNTR, A631"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aaradhya fertility centre, Visakhapatnam', 'Aaradhya fertility centre  RTHY FRTLT SNTR, A631', ST_SetSRID(ST_MakePoint(83.3128724, 17.7149198), 4326), 50);
    END IF;
    -- Insert Sagar Durga Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sagar Durga Hospital', ST_SetSRID(ST_MakePoint(83.3109667, 17.7086688), 4326), '{"SKR TRK HSPTL, S263"}', jsonb_build_object('te', 'సాగర్ దుర్గ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sagar Durga Hospital, Visakhapatnam', 'Sagar Durga Hospital సాగర్ దుర్గ హాస్పిటల్ SKR TRK HSPTL, S263', ST_SetSRID(ST_MakePoint(83.3109667, 17.7086688), 4326), 50);
    END IF;
    -- Insert Simply south tiffins (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simply south tiffins', ST_SetSRID(ST_MakePoint(83.3113275, 17.7101163), 4326), '{"SMPL S0 TFNS, S514"}', jsonb_build_object('te', 'సింప్లీ సౌత్ టిఫిన్స్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simply south tiffins, Visakhapatnam', 'Simply south tiffins సింప్లీ సౌత్ టిఫిన్స్ SMPL S0 TFNS, S514', ST_SetSRID(ST_MakePoint(83.3113275, 17.7101163), 4326), 10);
    END IF;
    -- Insert Shri Venkataramana Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Shri Venkataramana Hospital', ST_SetSRID(ST_MakePoint(83.3111357, 17.7090399), 4326), '{"S615, XR FNKTRMN HSPTL"}', jsonb_build_object('te', 'శ్రీ వెంకటరమణ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Shri Venkataramana Hospital, Visakhapatnam', 'Shri Venkataramana Hospital శ్రీ వెంకటరమణ హాస్పిటల్ S615, XR FNKTRMN HSPTL', ST_SetSRID(ST_MakePoint(83.3111357, 17.7090399), 4326), 50);
    END IF;
    -- Insert sai siddhartha biryani house (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'sai siddhartha biryani house', ST_SetSRID(ST_MakePoint(83.3103619, 17.7090943), 4326), '{"S STHR0 BRYN HS, S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'sai siddhartha biryani house, Visakhapatnam', 'sai siddhartha biryani house  S STHR0 BRYN HS, S236', ST_SetSRID(ST_MakePoint(83.3103619, 17.7090943), 4326), 10);
    END IF;
    -- Insert SKML noodles point (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SKML noodles point', ST_SetSRID(ST_MakePoint(83.3114777, 17.7144701), 4326), '{"S545, SKML NTLS PNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SKML noodles point, Visakhapatnam', 'SKML noodles point  S545, SKML NTLS PNT', ST_SetSRID(ST_MakePoint(83.3114777, 17.7144701), 4326), 10);
    END IF;
    -- Insert Indian Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Bank', ST_SetSRID(ST_MakePoint(83.3135668, 17.7107329), 4326), '{"I535, INTN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Bank, Visakhapatnam', 'Indian Bank  I535, INTN BNK', ST_SetSRID(ST_MakePoint(83.3135668, 17.7107329), 4326), 10);
    END IF;
    -- Insert Bethany school (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bethany school', ST_SetSRID(ST_MakePoint(83.3137921, 17.7105591), 4326), '{"B352, B0N SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bethany school, Visakhapatnam', 'Bethany school  B352, B0N SXL', ST_SetSRID(ST_MakePoint(83.3137921, 17.7105591), 4326), 50);
    END IF;
    -- Insert Andhra bank staff college (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Andhra bank staff college', ST_SetSRID(ST_MakePoint(83.3134488, 17.7089852), 4326), '{"ANTHR BNK STF KLJ, A536"}', jsonb_build_object('te', 'ఆంధ్ర బాంక్ స్టాఫ్ కాలేజ్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Andhra bank staff college, Visakhapatnam', 'Andhra bank staff college ఆంధ్ర బాంక్ స్టాఫ్ కాలేజ్ ANTHR BNK STF KLJ, A536', ST_SetSRID(ST_MakePoint(83.3134488, 17.7089852), 4326), 10);
    END IF;
    -- Insert ABC hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ABC hospital', ST_SetSRID(ST_MakePoint(83.3090178, 17.7070739), 4326), '{"ABK HSPTL, A122"}', jsonb_build_object('te', 'ఏబీసీ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ABC hospital, Visakhapatnam', 'ABC hospital ఏబీసీ హాస్పిటల్ ABK HSPTL, A122', ST_SetSRID(ST_MakePoint(83.3090178, 17.7070739), 4326), 50);
    END IF;
    -- Insert Apex hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Apex hospital', ST_SetSRID(ST_MakePoint(83.3089749, 17.7075645), 4326), '{"APKS HSPTL, A122"}', jsonb_build_object('te', 'ఏపెక్స్ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Apex hospital, Visakhapatnam', 'Apex hospital ఏపెక్స్ హాస్పిటల్ APKS HSPTL, A122', ST_SetSRID(ST_MakePoint(83.3089749, 17.7075645), 4326), 50);
    END IF;
    -- Insert Usa hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Usa hospital', ST_SetSRID(ST_MakePoint(83.3087882, 17.7078558), 4326), '{"U221, US HSPTL"}', jsonb_build_object('te', 'ఉష హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Usa hospital, Visakhapatnam', 'Usa hospital ఉష హాస్పిటల్ U221, US HSPTL', ST_SetSRID(ST_MakePoint(83.3087882, 17.7078558), 4326), 50);
    END IF;
    -- Insert Simhadri Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simhadri Hospital', ST_SetSRID(ST_MakePoint(83.3104939, 17.7082343), 4326), '{"S536, SMHTR HSPTL"}', jsonb_build_object('te', 'సింహాద్రి హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simhadri Hospital, Visakhapatnam', 'Simhadri Hospital సింహాద్రి హాస్పిటల్ S536, SMHTR HSPTL', ST_SetSRID(ST_MakePoint(83.3104939, 17.7082343), 4326), 50);
    END IF;
    -- Insert Apollow pharmacy (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Apollow pharmacy', ST_SetSRID(ST_MakePoint(83.3099146, 17.7082036), 4326), '{"A141, APL FRMS"}', jsonb_build_object('te', 'అపోలొ ఫార్మసీ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Apollow pharmacy, Visakhapatnam', 'Apollow pharmacy అపోలొ ఫార్మసీ A141, APL FRMS', ST_SetSRID(ST_MakePoint(83.3099146, 17.7082036), 4326), 50);
    END IF;
    -- Insert Nature cure hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nature cure hospital', ST_SetSRID(ST_MakePoint(83.3111377, 17.7076415), 4326), '{"N362, NTR KR HSPTL"}', jsonb_build_object('te', 'నేచర్ క్యూర్ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nature cure hospital, Visakhapatnam', 'Nature cure hospital నేచర్ క్యూర్ హాస్పిటల్ N362, NTR KR HSPTL', ST_SetSRID(ST_MakePoint(83.3111377, 17.7076415), 4326), 50);
    END IF;
    -- Insert Life  medical centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Life  medical centre', ST_SetSRID(ST_MakePoint(83.308198, 17.7076108), 4326), '{"L153, LF MTKL SNTR"}', jsonb_build_object('te', 'లైఫ్  మెడికల్ సెంటర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Life  medical centre, Visakhapatnam', 'Life  medical centre లైఫ్  మెడికల్ సెంటర్ L153, LF MTKL SNTR', ST_SetSRID(ST_MakePoint(83.308198, 17.7076108), 4326), 50);
    END IF;
    -- Insert Doctors care medical centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Doctors care medical centre', ST_SetSRID(ST_MakePoint(83.3093781, 17.7079072), 4326), '{"D236, TKTRS KR MTKL SNTR"}', jsonb_build_object('te', 'డాక్టర్స్ కేర్ మెడికల్ సెంటర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Doctors care medical centre, Visakhapatnam', 'Doctors care medical centre డాక్టర్స్ కేర్ మెడికల్ సెంటర్ D236, TKTRS KR MTKL SNTR', ST_SetSRID(ST_MakePoint(83.3093781, 17.7079072), 4326), 50);
    END IF;
    -- Insert Sriddha hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sriddha hospital', ST_SetSRID(ST_MakePoint(83.3094103, 17.7081218), 4326), '{"S632, SRTH HSPTL"}', jsonb_build_object('te', 'స్రిద్ధ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sriddha hospital, Visakhapatnam', 'Sriddha hospital స్రిద్ధ హాస్పిటల్ S632, SRTH HSPTL', ST_SetSRID(ST_MakePoint(83.3094103, 17.7081218), 4326), 50);
    END IF;
    -- Insert Pinnacle (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pinnacle', ST_SetSRID(ST_MakePoint(83.3082425, 17.7636985), 4326), '{"PNKL, P524"}', jsonb_build_object('te', 'పిన్నాకిల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pinnacle, Visakhapatnam', 'Pinnacle పిన్నాకిల్ PNKL, P524', ST_SetSRID(ST_MakePoint(83.3082425, 17.7636985), 4326), 50);
    END IF;
    -- Insert Q1 Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Q1 Hospitals', ST_SetSRID(ST_MakePoint(83.3078726, 17.7624241), 4326), '{"K HSPTLS, Q213"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Q1 Hospitals, Visakhapatnam', 'Q1 Hospitals  K HSPTLS, Q213', ST_SetSRID(ST_MakePoint(83.3078726, 17.7624241), 4326), 50);
    END IF;
    -- Insert GIMS (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'GIMS', ST_SetSRID(ST_MakePoint(83.3116458, 17.7620819), 4326), '{"JMS, G520"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'GIMS, Visakhapatnam', 'GIMS  JMS, G520', ST_SetSRID(ST_MakePoint(83.3116458, 17.7620819), 4326), 50);
    END IF;
    -- Insert Triangle Gym and Park (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Triangle Gym and Park', ST_SetSRID(ST_MakePoint(82.9986596, 17.700263), 4326), '{"T652, TRNKL JM ANT PRK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Triangle Gym and Park, Visakhapatnam', 'Triangle Gym and Park  T652, TRNKL JM ANT PRK', ST_SetSRID(ST_MakePoint(82.9986596, 17.700263), 4326), 10);
    END IF;
    -- Insert park ketcric (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'park ketcric', ST_SetSRID(ST_MakePoint(82.9991988, 17.6989303), 4326), '{"PRK KTKRK, P622"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'park ketcric, Visakhapatnam', 'park ketcric  PRK KTKRK, P622', ST_SetSRID(ST_MakePoint(82.9991988, 17.6989303), 4326), 10);
    END IF;
    -- Insert samyuktha public school (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'samyuktha public school', ST_SetSRID(ST_MakePoint(82.9986088, 17.7006249), 4326), '{"SMYK0 PBLK SXL, S523"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'samyuktha public school, Visakhapatnam', 'samyuktha public school  SMYK0 PBLK SXL, S523', ST_SetSRID(ST_MakePoint(82.9986088, 17.7006249), 4326), 50);
    END IF;
    -- Insert samyuktha degree college (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'samyuktha degree college', ST_SetSRID(ST_MakePoint(82.9988644, 17.7004791), 4326), '{"SMYK0 TKR KLJ, S523"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'samyuktha degree college, Visakhapatnam', 'samyuktha degree college  SMYK0 TKR KLJ, S523', ST_SetSRID(ST_MakePoint(82.9988644, 17.7004791), 4326), 50);
    END IF;
    -- Insert Apex Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Apex Hospital', ST_SetSRID(ST_MakePoint(83.3090204, 17.7067706), 4326), '{"APKS HSPTL, A122"}', jsonb_build_object('te', 'ఏపెక్స్ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Apex Hospital, Visakhapatnam', 'Apex Hospital ఏపెక్స్ హాస్పిటల్ APKS HSPTL, A122', ST_SetSRID(ST_MakePoint(83.3090204, 17.7067706), 4326), 50);
    END IF;
    -- Insert Dj Clinic (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dj Clinic', ST_SetSRID(ST_MakePoint(83.3354643, 17.7440297), 4326), '{"TJ KLNK, D224"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dj Clinic, Visakhapatnam', 'Dj Clinic  TJ KLNK, D224', ST_SetSRID(ST_MakePoint(83.3354643, 17.7440297), 4326), 50);
    END IF;
    -- Insert Ramyasai Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramyasai Nursing Home', ST_SetSRID(ST_MakePoint(83.0016124, 17.6861622), 4326), '{"RMYS NRSNK HM, R525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramyasai Nursing Home, Visakhapatnam', 'Ramyasai Nursing Home  RMYS NRSNK HM, R525', ST_SetSRID(ST_MakePoint(83.0016124, 17.6861622), 4326), 50);
    END IF;
    -- Insert Vision Care Centre (Super Speciality Eye Hospital) (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vision Care Centre (Super Speciality Eye Hospital)', ST_SetSRID(ST_MakePoint(83.295486, 17.7277139), 4326), '{"V252, FXN KR SNTR SPR SPXLT EY HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vision Care Centre (Super Speciality Eye Hospital), Visakhapatnam', 'Vision Care Centre (Super Speciality Eye Hospital)  V252, FXN KR SNTR SPR SPXLT EY HSPTL', ST_SetSRID(ST_MakePoint(83.295486, 17.7277139), 4326), 50);
    END IF;
    -- Insert Apoorva Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Apoorva Hospital', ST_SetSRID(ST_MakePoint(83.3075653, 17.7300554), 4326), '{"APRF HSPTL, A161"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Apoorva Hospital, Visakhapatnam', 'Apoorva Hospital  APRF HSPTL, A161', ST_SetSRID(ST_MakePoint(83.3075653, 17.7300554), 4326), 50);
    END IF;
    -- Insert Anapoorna Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Anapoorna Hospital', ST_SetSRID(ST_MakePoint(83.3047865, 17.7273371), 4326), '{"A516, ANPRN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Anapoorna Hospital, Visakhapatnam', 'Anapoorna Hospital  A516, ANPRN HSPTL', ST_SetSRID(ST_MakePoint(83.3047865, 17.7273371), 4326), 50);
    END IF;
    -- Insert Maxivision Super Speciality Eye Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maxivision Super Speciality Eye Hospitals', ST_SetSRID(ST_MakePoint(83.304584, 17.7269219), 4326), '{"M212, MKSFXN SPR SPXLT EY HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maxivision Super Speciality Eye Hospitals, Visakhapatnam', 'Maxivision Super Speciality Eye Hospitals  M212, MKSFXN SPR SPXLT EY HSPTLS', ST_SetSRID(ST_MakePoint(83.304584, 17.7269219), 4326), 50);
    END IF;
    -- Insert Care Dental Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Care Dental Hospital', ST_SetSRID(ST_MakePoint(83.307247, 17.7363435), 4326), '{"C635, KR TNTL HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Care Dental Hospital, Visakhapatnam', 'Care Dental Hospital  C635, KR TNTL HSPTL', ST_SetSRID(ST_MakePoint(83.307247, 17.7363435), 4326), 50);
    END IF;
    -- Insert M.G.R. Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'M.G.R. Hospital', ST_SetSRID(ST_MakePoint(83.3309823, 17.7325361), 4326), '{"M262, MKR HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'M.G.R. Hospital, Visakhapatnam', 'M.G.R. Hospital  M262, MKR HSPTL', ST_SetSRID(ST_MakePoint(83.3309823, 17.7325361), 4326), 50);
    END IF;
    -- Insert Rhea Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rhea Hospital', ST_SetSRID(ST_MakePoint(83.3041777, 17.7092414), 4326), '{"R213, RH HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rhea Hospital, Visakhapatnam', 'Rhea Hospital  R213, RH HSPTL', ST_SetSRID(ST_MakePoint(83.3041777, 17.7092414), 4326), 50);
    END IF;
    -- Insert Adarsha Orthopaedic Center (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Adarsha Orthopaedic Center', ST_SetSRID(ST_MakePoint(83.3117884, 17.7109406), 4326), '{"ATRX OR0PTK SNTR, A362"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Adarsha Orthopaedic Center, Visakhapatnam', 'Adarsha Orthopaedic Center  ATRX OR0PTK SNTR, A362', ST_SetSRID(ST_MakePoint(83.3117884, 17.7109406), 4326), 50);
    END IF;
    -- Insert Prabha Clinic and Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Prabha Clinic and Nursing Home', ST_SetSRID(ST_MakePoint(83.3041039, 17.7162921), 4326), '{"PRBH KLNK ANT NRSNK HM, P612"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Prabha Clinic and Nursing Home, Visakhapatnam', 'Prabha Clinic and Nursing Home  PRBH KLNK ANT NRSNK HM, P612', ST_SetSRID(ST_MakePoint(83.3041039, 17.7162921), 4326), 50);
    END IF;
    -- Insert Mythri Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mythri Nursing Home', ST_SetSRID(ST_MakePoint(83.3089118, 17.7071258), 4326), '{"M0R NRSNK HM, M365"}', jsonb_build_object('te', 'మైత్రి నర్సింగ్ హోమ్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mythri Nursing Home, Visakhapatnam', 'Mythri Nursing Home మైత్రి నర్సింగ్ హోమ్ M0R NRSNK HM, M365', ST_SetSRID(ST_MakePoint(83.3089118, 17.7071258), 4326), 50);
    END IF;
    -- Insert Gowtami Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gowtami Hospital', ST_SetSRID(ST_MakePoint(83.2063977, 17.6825514), 4326), '{"KTM HSPTL, G352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gowtami Hospital, Visakhapatnam', 'Gowtami Hospital  KTM HSPTL, G352', ST_SetSRID(ST_MakePoint(83.2063977, 17.6825514), 4326), 50);
    END IF;
    -- Insert Satyam Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Satyam Hospital', ST_SetSRID(ST_MakePoint(83.2187018, 17.7499948), 4326), '{"STYM HSPTL, S352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Satyam Hospital, Visakhapatnam', 'Satyam Hospital  STYM HSPTL, S352', ST_SetSRID(ST_MakePoint(83.2187018, 17.7499948), 4326), 50);
    END IF;
    -- Insert Venkatarama Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkatarama Hospital', ST_SetSRID(ST_MakePoint(83.3031356, 17.7278327), 4326), '{"FNKTRM HSPTL, V523"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkatarama Hospital, Visakhapatnam', 'Venkatarama Hospital  FNKTRM HSPTL, V523', ST_SetSRID(ST_MakePoint(83.3031356, 17.7278327), 4326), 50);
    END IF;
    -- Insert SR Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SR Hospital', ST_SetSRID(ST_MakePoint(83.2173438, 17.752968), 4326), '{"SR HSPTL, S621"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SR Hospital, Visakhapatnam', 'SR Hospital  SR HSPTL, S621', ST_SetSRID(ST_MakePoint(83.2173438, 17.752968), 4326), 50);
    END IF;
    -- Insert Good Health New Central Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Good Health New Central Hospital', ST_SetSRID(ST_MakePoint(83.3055443, 17.7379611), 4326), '{"KT HL0 N SNTRL HSPTL, G343"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Good Health New Central Hospital, Visakhapatnam', 'Good Health New Central Hospital  KT HL0 N SNTRL HSPTL, G343', ST_SetSRID(ST_MakePoint(83.3055443, 17.7379611), 4326), 50);
    END IF;
    -- Insert Dr Rama Rao Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr Rama Rao Hospital', ST_SetSRID(ST_MakePoint(83.2790163, 17.7332163), 4326), '{"D665, TR RM R HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr Rama Rao Hospital, Visakhapatnam', 'Dr Rama Rao Hospital  D665, TR RM R HSPTL', ST_SetSRID(ST_MakePoint(83.2790163, 17.7332163), 4326), 50);
    END IF;
    -- Insert Vijetha Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijetha Hospital', ST_SetSRID(ST_MakePoint(83.3030283, 17.7106199), 4326), '{"FJ0 HSPTL, V232"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijetha Hospital, Visakhapatnam', 'Vijetha Hospital  FJ0 HSPTL, V232', ST_SetSRID(ST_MakePoint(83.3030283, 17.7106199), 4326), 50);
    END IF;
    -- Insert Yarada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yarada', ST_SetSRID(ST_MakePoint(83.2759809, 17.6594956), 4326), '{"Y630, YRT"}', jsonb_build_object('te', 'యారాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yarada, Visakhapatnam', 'Yarada యారాడ Y630, YRT', ST_SetSRID(ST_MakePoint(83.2759809, 17.6594956), 4326), 40);
    END IF;
    -- Insert Sun Multi Speciality Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sun Multi Speciality Hospital', ST_SetSRID(ST_MakePoint(83.277593, 17.7350755), 4326), '{"S554, SN MLT SPXLT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sun Multi Speciality Hospital, Visakhapatnam', 'Sun Multi Speciality Hospital  S554, SN MLT SPXLT HSPTL', ST_SetSRID(ST_MakePoint(83.277593, 17.7350755), 4326), 50);
    END IF;
    -- Insert Abc Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Abc Hospital', ST_SetSRID(ST_MakePoint(83.3092725, 17.7061715), 4326), '{"ABK HSPTL, A122"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Abc Hospital, Visakhapatnam', 'Abc Hospital  ABK HSPTL, A122', ST_SetSRID(ST_MakePoint(83.3092725, 17.7061715), 4326), 50);
    END IF;
    -- Insert Suma Maternity Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Suma Maternity Home', ST_SetSRID(ST_MakePoint(83.2642758, 17.7463633), 4326), '{"SM MTRNT HM, S553"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Suma Maternity Home, Visakhapatnam', 'Suma Maternity Home  SM MTRNT HM, S553', ST_SetSRID(ST_MakePoint(83.2642758, 17.7463633), 4326), 50);
    END IF;
    -- Insert Lion Dist 324 C, Cancer Treatment and Research Center (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lion Dist 324 C, Cancer Treatment and Research Center', ST_SetSRID(ST_MakePoint(83.3083713, 17.7443962), 4326), '{"LN TST K KNSR TRTMNT ANT RSRX SNTR, L532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lion Dist 324 C, Cancer Treatment and Research Center, Visakhapatnam', 'Lion Dist 324 C, Cancer Treatment and Research Center  LN TST K KNSR TRTMNT ANT RSRX SNTR, L532', ST_SetSRID(ST_MakePoint(83.3083713, 17.7443962), 4326), 50);
    END IF;
    -- Insert Amg Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amg Hospital', ST_SetSRID(ST_MakePoint(83.3146349, 17.7382076), 4326), '{"AMK HSPTL, A522"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amg Hospital, Visakhapatnam', 'Amg Hospital  AMK HSPTL, A522', ST_SetSRID(ST_MakePoint(83.3146349, 17.7382076), 4326), 50);
    END IF;
    -- Insert Indus Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indus Hospitals', ST_SetSRID(ST_MakePoint(83.3026153, 17.7108601), 4326), '{"INTS HSPTLS, I532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indus Hospitals, Visakhapatnam', 'Indus Hospitals  INTS HSPTLS, I532', ST_SetSRID(ST_MakePoint(83.3026153, 17.7108601), 4326), 50);
    END IF;
    -- Insert St.Ann''s Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'St.Ann''s Hospital', ST_SetSRID(ST_MakePoint(82.8137411, 17.9135879), 4326), '{"STNS HSPTL, S352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'St.Ann''s Hospital, Visakhapatnam', 'St.Ann''s Hospital  STNS HSPTL, S352', ST_SetSRID(ST_MakePoint(82.8137411, 17.9135879), 4326), 50);
    END IF;
    -- Insert Visakha Ent Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Visakha Ent Hospital', ST_SetSRID(ST_MakePoint(83.3107545, 17.7264096), 4326), '{"FSKH ENT HSPTL, V225"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Visakha Ent Hospital, Visakhapatnam', 'Visakha Ent Hospital  FSKH ENT HSPTL, V225', ST_SetSRID(ST_MakePoint(83.3107545, 17.7264096), 4326), 50);
    END IF;
    -- Insert Susruta Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Susruta Hospital', ST_SetSRID(ST_MakePoint(83.208107, 17.6853215), 4326), '{"SSRT HSPTL, S263"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Susruta Hospital, Visakhapatnam', 'Susruta Hospital  SSRT HSPTL, S263', ST_SetSRID(ST_MakePoint(83.208107, 17.6853215), 4326), 50);
    END IF;
    -- Insert R K Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'R K Hospital', ST_SetSRID(ST_MakePoint(83.1970797, 17.6824479), 4326), '{"R221, R K HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'R K Hospital, Visakhapatnam', 'R K Hospital  R221, R K HSPTL', ST_SetSRID(ST_MakePoint(83.1970797, 17.6824479), 4326), 50);
    END IF;
    -- Insert Padmasri Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Padmasri Hospital', ST_SetSRID(ST_MakePoint(83.3036815, 17.7382447), 4326), '{"PTMSR HSPTL, P352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Padmasri Hospital, Visakhapatnam', 'Padmasri Hospital  PTMSR HSPTL, P352', ST_SetSRID(ST_MakePoint(83.3036815, 17.7382447), 4326), 50);
    END IF;
    -- Insert Raghavendra Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Raghavendra Hospital', ST_SetSRID(ST_MakePoint(83.3041066, 17.739964), 4326), '{"R215, RKHFNTR HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Raghavendra Hospital, Visakhapatnam', 'Raghavendra Hospital  R215, RKHFNTR HSPTL', ST_SetSRID(ST_MakePoint(83.3041066, 17.739964), 4326), 50);
    END IF;
    -- Insert Sujatha Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sujatha Hospital', ST_SetSRID(ST_MakePoint(83.1985898, 17.6840514), 4326), '{"SJ0 HSPTL, S232"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sujatha Hospital, Visakhapatnam', 'Sujatha Hospital  SJ0 HSPTL, S232', ST_SetSRID(ST_MakePoint(83.1985898, 17.6840514), 4326), 50);
    END IF;
    -- Insert Centre For Sight (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Centre For Sight', ST_SetSRID(ST_MakePoint(83.3044016, 17.7364998), 4326), '{"SNTR FR ST, C536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Centre For Sight, Visakhapatnam', 'Centre For Sight  SNTR FR ST, C536', ST_SetSRID(ST_MakePoint(83.3044016, 17.7364998), 4326), 50);
    END IF;
    -- Insert Krishna Maternity And Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Krishna Maternity And Nursing Home', ST_SetSRID(ST_MakePoint(83.293823, 17.7288061), 4326), '{"K625, KRXN MTRNT ANT NRSNK HM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Krishna Maternity And Nursing Home, Visakhapatnam', 'Krishna Maternity And Nursing Home  K625, KRXN MTRNT ANT NRSNK HM', ST_SetSRID(ST_MakePoint(83.293823, 17.7288061), 4326), 50);
    END IF;
    -- Insert Amrutha Nursing Home Private Limited (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amrutha Nursing Home Private Limited', ST_SetSRID(ST_MakePoint(83.2960858, 17.69981), 4326), '{"AMR0 NRSNK HM PRFT LMTT, A563"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amrutha Nursing Home Private Limited, Visakhapatnam', 'Amrutha Nursing Home Private Limited  AMR0 NRSNK HM PRFT LMTT, A563', ST_SetSRID(ST_MakePoint(83.2960858, 17.69981), 4326), 50);
    END IF;
    -- Insert Padmaja Hospital - Gajuwaka (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Padmaja Hospital - Gajuwaka', ST_SetSRID(ST_MakePoint(83.203619, 17.6867743), 4326), '{"P352, PTMJ HSPTL KJWK, Old Gajuwaka, New Gajuwaka"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Padmaja Hospital - Gajuwaka, Visakhapatnam', 'Padmaja Hospital - Gajuwaka  P352, PTMJ HSPTL KJWK, Old Gajuwaka, New Gajuwaka', ST_SetSRID(ST_MakePoint(83.203619, 17.6867743), 4326), 50);
    END IF;
    -- Insert Care Hospital - Maharanipet (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Care Hospital - Maharanipet', ST_SetSRID(ST_MakePoint(83.3054544, 17.7097505), 4326), '{"KR HSPTL MHRNPT, C621"}', jsonb_build_object('te', 'కేర్ హాస్పిటల్ - మహారానీపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Care Hospital - Maharanipet, Visakhapatnam', 'Care Hospital - Maharanipet కేర్ హాస్పిటల్ - మహారానీపేట KR HSPTL MHRNPT, C621', ST_SetSRID(ST_MakePoint(83.3054544, 17.7097505), 4326), 50);
    END IF;
    -- Insert Samudra Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Samudra Hospitals', ST_SetSRID(ST_MakePoint(83.3037458, 17.7103989), 4326), '{"S536, SMTR HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Samudra Hospitals, Visakhapatnam', 'Samudra Hospitals  S536, SMTR HSPTLS', ST_SetSRID(ST_MakePoint(83.3037458, 17.7103989), 4326), 50);
    END IF;
    -- Insert Vikram Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vikram Hospital', ST_SetSRID(ST_MakePoint(83.0013013, 17.6870707), 4326), '{"FKRM HSPTL, V265"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vikram Hospital, Visakhapatnam', 'Vikram Hospital  FKRM HSPTL, V265', ST_SetSRID(ST_MakePoint(83.0013013, 17.6870707), 4326), 50);
    END IF;
    -- Insert Abhaya Critical Care (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Abhaya Critical Care', ST_SetSRID(ST_MakePoint(83.3043534, 17.7102328), 4326), '{"ABHY KRTKL KR, A126"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Abhaya Critical Care, Visakhapatnam', 'Abhaya Critical Care  ABHY KRTKL KR, A126', ST_SetSRID(ST_MakePoint(83.3043534, 17.7102328), 4326), 50);
    END IF;
    -- Insert Sunita Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sunita Nursing Home', ST_SetSRID(ST_MakePoint(83.3115497, 17.7362763), 4326), '{"S535, SNT NRSNK HM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sunita Nursing Home, Visakhapatnam', 'Sunita Nursing Home  S535, SNT NRSNK HM', ST_SetSRID(ST_MakePoint(83.3115497, 17.7362763), 4326), 50);
    END IF;
    -- Insert Waltair Multicare Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Waltair Multicare Hospital', ST_SetSRID(ST_MakePoint(83.333627, 17.7320085), 4326), '{"W436, WLTR MLTKR HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Waltair Multicare Hospital, Visakhapatnam', 'Waltair Multicare Hospital  W436, WLTR MLTKR HSPTL', ST_SetSRID(ST_MakePoint(83.333627, 17.7320085), 4326), 50);
    END IF;
    -- Insert Siddharth Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Siddharth Hospital', ST_SetSRID(ST_MakePoint(83.3038954, 17.7118451), 4326), '{"S363, STHR0 HSPTL"}', jsonb_build_object('te', 'సిద్ధార్థ్ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Siddharth Hospital, Visakhapatnam', 'Siddharth Hospital సిద్ధార్థ్ హాస్పిటల్ S363, STHR0 HSPTL', ST_SetSRID(ST_MakePoint(83.3038954, 17.7118451), 4326), 50);
    END IF;
    -- Insert Visakha Children Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Visakha Children Hospital', ST_SetSRID(ST_MakePoint(83.3125274, 17.7108448), 4326), '{"FSKH XLTRN HSPTL, V222"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Visakha Children Hospital, Visakhapatnam', 'Visakha Children Hospital  FSKH XLTRN HSPTL, V222', ST_SetSRID(ST_MakePoint(83.3125274, 17.7108448), 4326), 50);
    END IF;
    -- Insert Sraddha Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sraddha Hospital', ST_SetSRID(ST_MakePoint(83.3086663, 17.7083599), 4326), '{"S632, SRTH HSPTL"}', jsonb_build_object('te', 'శ్రద్ధ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sraddha Hospital, Visakhapatnam', 'Sraddha Hospital శ్రద్ధ హాస్పిటల్ S632, SRTH HSPTL', ST_SetSRID(ST_MakePoint(83.3086663, 17.7083599), 4326), 50);
    END IF;
    -- Insert Tirumala Vijaya Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tirumala Vijaya Hospital', ST_SetSRID(ST_MakePoint(83.3352873, 17.7440143), 4326), '{"T654, TRML FJY HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tirumala Vijaya Hospital, Visakhapatnam', 'Tirumala Vijaya Hospital  T654, TRML FJY HSPTL', ST_SetSRID(ST_MakePoint(83.3352873, 17.7440143), 4326), 50);
    END IF;
    -- Insert Aarif Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aarif Nursing Home', ST_SetSRID(ST_MakePoint(83.309819, 17.7224323), 4326), '{"A615, RF NRSNK HM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aarif Nursing Home, Visakhapatnam', 'Aarif Nursing Home  A615, RF NRSNK HM', ST_SetSRID(ST_MakePoint(83.309819, 17.7224323), 4326), 50);
    END IF;
    -- Insert Vijaya Medical Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijaya Medical Centre', ST_SetSRID(ST_MakePoint(83.3107518, 17.7099032), 4326), '{"V253, FJY MTKL SNTR"}', jsonb_build_object('te', 'విజయ మెడికల్ సెంటర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijaya Medical Centre, Visakhapatnam', 'Vijaya Medical Centre విజయ మెడికల్ సెంటర్ V253, FJY MTKL SNTR', ST_SetSRID(ST_MakePoint(83.3107518, 17.7099032), 4326), 50);
    END IF;
    -- Insert OMNI RK Super Specialty Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'OMNI RK Super Specialty Hospital', ST_SetSRID(ST_MakePoint(83.3116168, 17.7186287), 4326), '{"OMN RK SPR SPXLT HSPTL, O562"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'OMNI RK Super Specialty Hospital, Visakhapatnam', 'OMNI RK Super Specialty Hospital  OMN RK SPR SPXLT HSPTL, O562', ST_SetSRID(ST_MakePoint(83.3116168, 17.7186287), 4326), 50);
    END IF;
    -- Insert Sri Rama Mother and Child Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Rama Mother and Child Hospital', ST_SetSRID(ST_MakePoint(82.9366171, 17.8269229), 4326), '{"S665, SR RM M0R ANT XLT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Rama Mother and Child Hospital, Visakhapatnam', 'Sri Rama Mother and Child Hospital  S665, SR RM M0R ANT XLT HSPTL', ST_SetSRID(ST_MakePoint(82.9366171, 17.8269229), 4326), 50);
    END IF;
    -- Insert Vasan Eye Care Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vasan Eye Care Hospital', ST_SetSRID(ST_MakePoint(83.3087254, 17.7168287), 4326), '{"FSN EY KR HSPTL, V252"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vasan Eye Care Hospital, Visakhapatnam', 'Vasan Eye Care Hospital  FSN EY KR HSPTL, V252', ST_SetSRID(ST_MakePoint(83.3087254, 17.7168287), 4326), 50);
    END IF;
    -- Insert Lazarus Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lazarus Hospital', ST_SetSRID(ST_MakePoint(83.3083036, 17.7171512), 4326), '{"LSRS HSPTL, L262"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lazarus Hospital, Visakhapatnam', 'Lazarus Hospital  LSRS HSPTL, L262', ST_SetSRID(ST_MakePoint(83.3083036, 17.7171512), 4326), 50);
    END IF;
    -- Insert Sai Satya Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sai Satya Hospital', ST_SetSRID(ST_MakePoint(83.3147241, 17.7685126), 4326), '{"S STY HSPTL, S232"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sai Satya Hospital, Visakhapatnam', 'Sai Satya Hospital  S STY HSPTL, S232', ST_SetSRID(ST_MakePoint(83.3147241, 17.7685126), 4326), 50);
    END IF;
    -- Insert Bharathi Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bharathi Hospital', ST_SetSRID(ST_MakePoint(83.3085356, 17.7108505), 4326), '{"BHR0 HSPTL, B632"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bharathi Hospital, Visakhapatnam', 'Bharathi Hospital  BHR0 HSPTL, B632', ST_SetSRID(ST_MakePoint(83.3085356, 17.7108505), 4326), 50);
    END IF;
    -- Insert Lawrance and Mayo Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lawrance and Mayo Hospital', ST_SetSRID(ST_MakePoint(83.302677, 17.7124353), 4326), '{"LRNS ANT MY HSPTL, L652"}', jsonb_build_object('te', 'లారెన్స్ అండ్ మేయొ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lawrance and Mayo Hospital, Visakhapatnam', 'Lawrance and Mayo Hospital లారెన్స్ అండ్ మేయొ LRNS ANT MY HSPTL, L652', ST_SetSRID(ST_MakePoint(83.302677, 17.7124353), 4326), 50);
    END IF;
    -- Insert Babai Hotel (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Babai Hotel', ST_SetSRID(ST_MakePoint(83.3562687, 17.8250924), 4326), '{"B134, BB HTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Babai Hotel, Visakhapatnam', 'Babai Hotel  B134, BB HTL', ST_SetSRID(ST_MakePoint(83.3562687, 17.8250924), 4326), 10);
    END IF;
    -- Insert Prema Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Prema Hospital', ST_SetSRID(ST_MakePoint(83.3740931, 17.8796711), 4326), '{"P652, PRM HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Prema Hospital, Visakhapatnam', 'Prema Hospital  P652, PRM HSPTL', ST_SetSRID(ST_MakePoint(83.3740931, 17.8796711), 4326), 50);
    END IF;
    -- Insert City Care Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'City Care Hospital', ST_SetSRID(ST_MakePoint(83.3090506, 17.7066084), 4326), '{"ST KR HSPTL, C326"}', jsonb_build_object('te', 'సిటీ కేర్ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'City Care Hospital, Visakhapatnam', 'City Care Hospital సిటీ కేర్ హాస్పిటల్ ST KR HSPTL, C326', ST_SetSRID(ST_MakePoint(83.3090506, 17.7066084), 4326), 50);
    END IF;
    -- Insert Kamala Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kamala Nursing Home', ST_SetSRID(ST_MakePoint(83.250969, 17.7404309), 4326), '{"KML NRSNK HM, K545"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kamala Nursing Home, Visakhapatnam', 'Kamala Nursing Home  KML NRSNK HM, K545', ST_SetSRID(ST_MakePoint(83.250969, 17.7404309), 4326), 50);
    END IF;
    -- Insert Kalavathi Surgical Hospital and Laparoscopic Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kalavathi Surgical Hospital and Laparoscopic Centre', ST_SetSRID(ST_MakePoint(83.2990453, 17.7265297), 4326), '{"KLF0 SRJKL HSPTL ANT LPRSKPK SNTR, K413"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kalavathi Surgical Hospital and Laparoscopic Centre, Visakhapatnam', 'Kalavathi Surgical Hospital and Laparoscopic Centre  KLF0 SRJKL HSPTL ANT LPRSKPK SNTR, K413', ST_SetSRID(ST_MakePoint(83.2990453, 17.7265297), 4326), 50);
    END IF;
    -- Insert Subham Prema Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Subham Prema Hospital', ST_SetSRID(ST_MakePoint(83.3123571, 17.728124), 4326), '{"SBHM PRM HSPTL, S151"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Subham Prema Hospital, Visakhapatnam', 'Subham Prema Hospital  SBHM PRM HSPTL, S151', ST_SetSRID(ST_MakePoint(83.3123571, 17.728124), 4326), 50);
    END IF;
    -- Insert Care Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Care Hospitals', ST_SetSRID(ST_MakePoint(83.3127339, 17.7203686), 4326), '{"C621, KR HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Care Hospitals, Visakhapatnam', 'Care Hospitals  C621, KR HSPTLS', ST_SetSRID(ST_MakePoint(83.3127339, 17.7203686), 4326), 50);
    END IF;
    -- Insert Indian (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian', ST_SetSRID(ST_MakePoint(83.3310397, 17.7423175), 4326), '{"I535, INTN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian, Visakhapatnam', 'Indian  I535, INTN', ST_SetSRID(ST_MakePoint(83.3310397, 17.7423175), 4326), 10);
    END IF;
    -- Insert Narayana Em school (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narayana Em school', ST_SetSRID(ST_MakePoint(83.3004644, 17.7360659), 4326), '{"N655, NRYN EM SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narayana Em school, Visakhapatnam', 'Narayana Em school  N655, NRYN EM SXL', ST_SetSRID(ST_MakePoint(83.3004644, 17.7360659), 4326), 50);
    END IF;
    -- Insert Karnataka Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karnataka Bank', ST_SetSRID(ST_MakePoint(83.2230086, 17.7458138), 4326), '{"K653, KRNTK BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karnataka Bank, Visakhapatnam', 'Karnataka Bank  K653, KRNTK BNK', ST_SetSRID(ST_MakePoint(83.2230086, 17.7458138), 4326), 10);
    END IF;
    -- Insert MyCure Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'MyCure Hospital', ST_SetSRID(ST_MakePoint(83.3023683, 17.7109237), 4326), '{"M262, MKR HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'MyCure Hospital, Visakhapatnam', 'MyCure Hospital  M262, MKR HSPTL', ST_SetSRID(ST_MakePoint(83.3023683, 17.7109237), 4326), 50);
    END IF;
    -- Insert SKML junior college gotivada sabbavaram (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SKML junior college gotivada sabbavaram', ST_SetSRID(ST_MakePoint(83.1094283, 17.7972825), 4326), '{"SKML JNR KLJ KTFT SBFRM, S542"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SKML junior college gotivada sabbavaram, Visakhapatnam', 'SKML junior college gotivada sabbavaram  SKML JNR KLJ KTFT SBFRM, S542', ST_SetSRID(ST_MakePoint(83.1094283, 17.7972825), 4326), 50);
    END IF;
    -- Insert Anandapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Anandapuram', ST_SetSRID(ST_MakePoint(83.3704973, 17.9038926), 4326), '{"ANNTPRM, A553"}', jsonb_build_object('te', 'ఆనందపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Anandapuram, Visakhapatnam', 'Anandapuram ఆనందపురం ANNTPRM, A553', ST_SetSRID(ST_MakePoint(83.3704973, 17.9038926), 4326), 40);
    END IF;
    -- Insert Tikkavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tikkavanipalem', ST_SetSRID(ST_MakePoint(83.1117482, 17.5483736), 4326), '{"TKFNPLM, T215"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tikkavanipalem, Visakhapatnam', 'Tikkavanipalem  TKFNPLM, T215', ST_SetSRID(ST_MakePoint(83.1117482, 17.5483736), 4326), 40);
    END IF;
    -- Insert Government Hospital,Viyyampeta (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital,Viyyampeta', ST_SetSRID(ST_MakePoint(83.1486536, 17.9231609), 4326), '{"KFRNMNT HSPTLFYMPT, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital,Viyyampeta, Visakhapatnam', 'Government Hospital,Viyyampeta  KFRNMNT HSPTLFYMPT, G165', ST_SetSRID(ST_MakePoint(83.1486536, 17.9231609), 4326), 50);
    END IF;
    -- Insert Government Hospital,Bheemili (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital,Bheemili', ST_SetSRID(ST_MakePoint(83.4513908, 17.8877592), 4326), '{"KFRNMNT HSPTLBHML, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital,Bheemili, Visakhapatnam', 'Government Hospital,Bheemili  KFRNMNT HSPTLBHML, G165', ST_SetSRID(ST_MakePoint(83.4513908, 17.8877592), 4326), 50);
    END IF;
    -- Insert Government Hospital,Cheedikada (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital,Cheedikada', ST_SetSRID(ST_MakePoint(82.8931162, 17.927342), 4326), '{"KFRNMNT HSPTLXTKT, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital,Cheedikada, Visakhapatnam', 'Government Hospital,Cheedikada  KFRNMNT HSPTLXTKT, G165', ST_SetSRID(ST_MakePoint(82.8931162, 17.927342), 4326), 50);
    END IF;
    -- Insert GVMC hospital,FRU Arilova (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'GVMC hospital,FRU Arilova', ST_SetSRID(ST_MakePoint(83.3172347, 17.7686588), 4326), '{"KFMK HSPTLFR ARLF, G152"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'GVMC hospital,FRU Arilova, Visakhapatnam', 'GVMC hospital,FRU Arilova  KFMK HSPTLFR ARLF, G152', ST_SetSRID(ST_MakePoint(83.3172347, 17.7686588), 4326), 50);
    END IF;
    -- Insert Government Hospital, Jami (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital, Jami', ST_SetSRID(ST_MakePoint(83.2657175, 18.0515574), 4326), '{"G165, KFRNMNT HSPTL JM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital, Jami, Visakhapatnam', 'Government Hospital, Jami  G165, KFRNMNT HSPTL JM', ST_SetSRID(ST_MakePoint(83.2657175, 18.0515574), 4326), 50);
    END IF;
    -- Insert Government Hospital,Lakkavarapukota (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital,Lakkavarapukota', ST_SetSRID(ST_MakePoint(83.1526432, 18.0184435), 4326), '{"KFRNMNT HSPTLLKFRPKT, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital,Lakkavarapukota, Visakhapatnam', 'Government Hospital,Lakkavarapukota  KFRNMNT HSPTLLKFRPKT, G165', ST_SetSRID(ST_MakePoint(83.1526432, 18.0184435), 4326), 50);
    END IF;
    -- Insert Government hospital, Rambili (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government hospital, Rambili', ST_SetSRID(ST_MakePoint(82.9301819, 17.465312), 4326), '{"G165, KFRNMNT HSPTL RMBL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government hospital, Rambili, Visakhapatnam', 'Government hospital, Rambili  G165, KFRNMNT HSPTL RMBL', ST_SetSRID(ST_MakePoint(82.9301819, 17.465312), 4326), 50);
    END IF;
    -- Insert Government Hospital,Pusapatirega (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital,Pusapatirega', ST_SetSRID(ST_MakePoint(83.552523, 18.0917189), 4326), '{"KFRNMNT HSPTLPSPTRK, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital,Pusapatirega, Visakhapatnam', 'Government Hospital,Pusapatirega  KFRNMNT HSPTLPSPTRK, G165', ST_SetSRID(ST_MakePoint(83.552523, 18.0917189), 4326), 50);
    END IF;
    -- Insert NTR Government Hospital,Anakapalle (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'NTR Government Hospital,Anakapalle', ST_SetSRID(ST_MakePoint(83.0067163, 17.6845257), 4326), '{"NTR KFRNMNT HSPTLNKPL, N362"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'NTR Government Hospital,Anakapalle, Visakhapatnam', 'NTR Government Hospital,Anakapalle  NTR KFRNMNT HSPTLNKPL, N362', ST_SetSRID(ST_MakePoint(83.0067163, 17.6845257), 4326), 50);
    END IF;
    -- Insert Government Hospital, Munagapaka (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital, Munagapaka', ST_SetSRID(ST_MakePoint(82.986613, 17.633837), 4326), '{"G165, KFRNMNT HSPTL MNKPK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital, Munagapaka, Visakhapatnam', 'Government Hospital, Munagapaka  G165, KFRNMNT HSPTL MNKPK', ST_SetSRID(ST_MakePoint(82.986613, 17.633837), 4326), 50);
    END IF;
    -- Insert Government Hospital,Govindapuram (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital,Govindapuram', ST_SetSRID(ST_MakePoint(83.6129037, 18.0938621), 4326), '{"KFRNMNT HSPTLKFNTPRM, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital,Govindapuram, Visakhapatnam', 'Government Hospital,Govindapuram  KFRNMNT HSPTLKFNTPRM, G165', ST_SetSRID(ST_MakePoint(83.6129037, 18.0938621), 4326), 50);
    END IF;
    -- Insert Government Hospital, K Kotapadu (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital, K Kotapadu', ST_SetSRID(ST_MakePoint(83.0408116, 17.8883305), 4326), '{"KFRNMNT HSPTL K KTPT, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital, K Kotapadu, Visakhapatnam', 'Government Hospital, K Kotapadu  KFRNMNT HSPTL K KTPT, G165', ST_SetSRID(ST_MakePoint(83.0408116, 17.8883305), 4326), 50);
    END IF;
    -- Insert Government Hospital,Madugula (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital,Madugula', ST_SetSRID(ST_MakePoint(82.8185393, 17.9183224), 4326), '{"KFRNMNT HSPTLMTKL, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital,Madugula, Visakhapatnam', 'Government Hospital,Madugula  KFRNMNT HSPTLMTKL, G165', ST_SetSRID(ST_MakePoint(82.8185393, 17.9183224), 4326), 50);
    END IF;
    -- Insert Government Hospital,Regupalem (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital,Regupalem', ST_SetSRID(ST_MakePoint(82.816752, 17.5178218), 4326), '{"KFRNMNT HSPTLRKPLM, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital,Regupalem, Visakhapatnam', 'Government Hospital,Regupalem  KFRNMNT HSPTLRKPLM, G165', ST_SetSRID(ST_MakePoint(82.816752, 17.5178218), 4326), 50);
    END IF;
    -- Insert Hotel Arina (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hotel Arina', ST_SetSRID(ST_MakePoint(83.20336, 17.718636), 4326), '{"H346, HTL ARN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hotel Arina, Visakhapatnam', 'Hotel Arina  H346, HTL ARN', ST_SetSRID(ST_MakePoint(83.20336, 17.718636), 4326), 10);
    END IF;
    -- Insert dipolama college (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'dipolama college', ST_SetSRID(ST_MakePoint(83.4184802, 18.0999984), 4326), '{"D145, TPLM KLJ"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'dipolama college, Visakhapatnam', 'dipolama college  D145, TPLM KLJ', ST_SetSRID(ST_MakePoint(83.4184802, 18.0999984), 4326), 50);
    END IF;
    -- Insert Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of India', ST_SetSRID(ST_MakePoint(83.3099303, 17.7239926), 4326), '{"BNK OF INT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of India, Visakhapatnam', 'Bank of India  BNK OF INT, B521', ST_SetSRID(ST_MakePoint(83.3099303, 17.7239926), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3149166, 17.7133209), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3149166, 17.7133209), 4326), 10);
    END IF;
    -- Insert Sri Venkata Sai Multi Specialty Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Venkata Sai Multi Specialty Hospital', ST_SetSRID(ST_MakePoint(83.1863316, 17.8951943), 4326), '{"SR FNKT S MLT SPXLT HSPTL, S615"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Venkata Sai Multi Specialty Hospital, Visakhapatnam', 'Sri Venkata Sai Multi Specialty Hospital  SR FNKT S MLT SPXLT HSPTL, S615', ST_SetSRID(ST_MakePoint(83.1863316, 17.8951943), 4326), 50);
    END IF;
    -- Insert Niharika Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Niharika Hospital', ST_SetSRID(ST_MakePoint(83.1856362, 17.8999331), 4326), '{"N622, NHRK HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Niharika Hospital, Visakhapatnam', 'Niharika Hospital  N622, NHRK HSPTL', ST_SetSRID(ST_MakePoint(83.1856362, 17.8999331), 4326), 50);
    END IF;
    -- Insert Simhachalam Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simhachalam Hospital', ST_SetSRID(ST_MakePoint(83.5535387, 18.093818), 4326), '{"SMHXLM HSPTL, S524"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simhachalam Hospital, Visakhapatnam', 'Simhachalam Hospital  SMHXLM HSPTL, S524', ST_SetSRID(ST_MakePoint(83.5535387, 18.093818), 4326), 50);
    END IF;
    -- Insert Dr. B Ramarao Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr. B Ramarao Hospital', ST_SetSRID(ST_MakePoint(83.1862515, 17.8976322), 4326), '{"D616, TR B RMR HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr. B Ramarao Hospital, Visakhapatnam', 'Dr. B Ramarao Hospital  D616, TR B RMR HSPTL', ST_SetSRID(ST_MakePoint(83.1862515, 17.8976322), 4326), 50);
    END IF;
    -- Insert Government Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital', ST_SetSRID(ST_MakePoint(83.3866502, 18.0944637), 4326), '{"G165, KFRNMNT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital, Visakhapatnam', 'Government Hospital  G165, KFRNMNT HSPTL', ST_SetSRID(ST_MakePoint(83.3866502, 18.0944637), 4326), 50);
    END IF;
    -- Insert Leprosy Mission Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Leprosy Mission Hospital', ST_SetSRID(ST_MakePoint(83.39122, 18.064523), 4326), '{"L162, LPRS MXN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Leprosy Mission Hospital, Visakhapatnam', 'Leprosy Mission Hospital  L162, LPRS MXN HSPTL', ST_SetSRID(ST_MakePoint(83.39122, 18.064523), 4326), 50);
    END IF;
    -- Insert Swamy Eye Hospial (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Swamy Eye Hospial', ST_SetSRID(ST_MakePoint(83.4014713, 18.0998794), 4326), '{"SWM EY HSPL, S521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Swamy Eye Hospial, Visakhapatnam', 'Swamy Eye Hospial  SWM EY HSPL, S521', ST_SetSRID(ST_MakePoint(83.4014713, 18.0998794), 4326), 50);
    END IF;
    -- Insert Dr. Y. V. Siva Sankara Murty Children Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr. Y. V. Siva Sankara Murty Children Hospital', ST_SetSRID(ST_MakePoint(83.4163525, 18.0990583), 4326), '{"D612, TR F SF SNKR MRT XLTRN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr. Y. V. Siva Sankara Murty Children Hospital, Visakhapatnam', 'Dr. Y. V. Siva Sankara Murty Children Hospital  D612, TR F SF SNKR MRT XLTRN HSPTL', ST_SetSRID(ST_MakePoint(83.4163525, 18.0990583), 4326), 50);
    END IF;
    -- Insert Bethany Christian Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bethany Christian Hospital', ST_SetSRID(ST_MakePoint(83.347569, 17.8027947), 4326), '{"B352, B0N XRSXN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bethany Christian Hospital, Visakhapatnam', 'Bethany Christian Hospital  B352, B0N XRSXN HSPTL', ST_SetSRID(ST_MakePoint(83.347569, 17.8027947), 4326), 50);
    END IF;
    -- Insert Dr. Adams Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr. Adams Hospital', ST_SetSRID(ST_MakePoint(83.3508178, 17.7998444), 4326), '{"D635, TR ATMS HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr. Adams Hospital, Visakhapatnam', 'Dr. Adams Hospital  D635, TR ATMS HSPTL', ST_SetSRID(ST_MakePoint(83.3508178, 17.7998444), 4326), 50);
    END IF;
    -- Insert Master Homeo Vaidyalayam (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Master Homeo Vaidyalayam', ST_SetSRID(ST_MakePoint(83.298429, 17.7341833), 4326), '{"MSTR HM FTYLYM, M236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Master Homeo Vaidyalayam, Visakhapatnam', 'Master Homeo Vaidyalayam  MSTR HM FTYLYM, M236', ST_SetSRID(ST_MakePoint(83.298429, 17.7341833), 4326), 50);
    END IF;
    -- Insert Dr. Hedgewar School Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr. Hedgewar School Hospital', ST_SetSRID(ST_MakePoint(83.3251813, 17.8830152), 4326), '{"D632, TR HJWR SXL HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr. Hedgewar School Hospital, Visakhapatnam', 'Dr. Hedgewar School Hospital  D632, TR HJWR SXL HSPTL', ST_SetSRID(ST_MakePoint(83.3251813, 17.8830152), 4326), 50);
    END IF;
    -- Insert Ramakrishna ENT Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramakrishna ENT Hospital', ST_SetSRID(ST_MakePoint(83.3557704, 17.8118168), 4326), '{"R526, RMKRXN ENT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramakrishna ENT Hospital, Visakhapatnam', 'Ramakrishna ENT Hospital  R526, RMKRXN ENT HSPTL', ST_SetSRID(ST_MakePoint(83.3557704, 17.8118168), 4326), 50);
    END IF;
    -- Insert Day & Night Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Day & Night Hospital', ST_SetSRID(ST_MakePoint(83.310741, 17.7289618), 4326), '{"D523, T NT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Day & Night Hospital, Visakhapatnam', 'Day & Night Hospital  D523, T NT HSPTL', ST_SetSRID(ST_MakePoint(83.310741, 17.7289618), 4326), 50);
    END IF;
    -- Insert NRI General Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'NRI General Hospital', ST_SetSRID(ST_MakePoint(83.426394, 17.921695), 4326), '{"N625, NR JNRL HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'NRI General Hospital, Visakhapatnam', 'NRI General Hospital  N625, NR JNRL HSPTL', ST_SetSRID(ST_MakePoint(83.426394, 17.921695), 4326), 50);
    END IF;
    -- Insert ESI Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ESI Hospital', ST_SetSRID(ST_MakePoint(83.423953, 17.927652), 4326), '{"ES HSPTL, E221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ESI Hospital, Visakhapatnam', 'ESI Hospital  ES HSPTL, E221', ST_SetSRID(ST_MakePoint(83.423953, 17.927652), 4326), 50);
    END IF;
    -- Insert Sanjivi Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sanjivi Hospital', ST_SetSRID(ST_MakePoint(83.328678, 17.743927), 4326), '{"SNJF HSPTL, S521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sanjivi Hospital, Visakhapatnam', 'Sanjivi Hospital  SNJF HSPTL, S521', ST_SetSRID(ST_MakePoint(83.328678, 17.743927), 4326), 50);
    END IF;
    -- Insert Government Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital', ST_SetSRID(ST_MakePoint(83.296865, 17.735493), 4326), '{"G165, KFRNMNT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital, Visakhapatnam', 'Government Hospital  G165, KFRNMNT HSPTL', ST_SetSRID(ST_MakePoint(83.296865, 17.735493), 4326), 50);
    END IF;
    -- Insert Sai Spoorthy Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sai Spoorthy Hospital', ST_SetSRID(ST_MakePoint(83.3043823, 17.7274681), 4326), '{"S216, S SPR0 HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sai Spoorthy Hospital, Visakhapatnam', 'Sai Spoorthy Hospital  S216, S SPR0 HSPTL', ST_SetSRID(ST_MakePoint(83.3043823, 17.7274681), 4326), 50);
    END IF;
    -- Insert Amma Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amma Hospital', ST_SetSRID(ST_MakePoint(83.3307524, 17.7468553), 4326), '{"AM HSPTL, A521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amma Hospital, Visakhapatnam', 'Amma Hospital  AM HSPTL, A521', ST_SetSRID(ST_MakePoint(83.3307524, 17.7468553), 4326), 50);
    END IF;
    -- Insert Sandhya Eye Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sandhya Eye Hospitals', ST_SetSRID(ST_MakePoint(83.3169337, 17.7322507), 4326), '{"S532, SNTHY EY HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sandhya Eye Hospitals, Visakhapatnam', 'Sandhya Eye Hospitals  S532, SNTHY EY HSPTLS', ST_SetSRID(ST_MakePoint(83.3169337, 17.7322507), 4326), 50);
    END IF;
    -- Insert Arogya Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Arogya Hospital', ST_SetSRID(ST_MakePoint(83.427302, 17.9310994), 4326), '{"A622, ARJY HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Arogya Hospital, Visakhapatnam', 'Arogya Hospital  A622, ARJY HSPTL', ST_SetSRID(ST_MakePoint(83.427302, 17.9310994), 4326), 50);
    END IF;
    -- Insert Sri Krishna Hospital And Mrudula Kidney Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Krishna Hospital And Mrudula Kidney Centre', ST_SetSRID(ST_MakePoint(83.3381086, 17.7398696), 4326), '{"SR KRXN HSPTL ANT MRTL KTN SNTR, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Krishna Hospital And Mrudula Kidney Centre, Visakhapatnam', 'Sri Krishna Hospital And Mrudula Kidney Centre  SR KRXN HSPTL ANT MRTL KTN SNTR, S626', ST_SetSRID(ST_MakePoint(83.3381086, 17.7398696), 4326), 50);
    END IF;
    -- Insert Ramkumar Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramkumar Hospital', ST_SetSRID(ST_MakePoint(83.2989253, 17.7347439), 4326), '{"RMKMR HSPTL, R525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramkumar Hospital, Visakhapatnam', 'Ramkumar Hospital  RMKMR HSPTL, R525', ST_SetSRID(ST_MakePoint(83.2989253, 17.7347439), 4326), 50);
    END IF;
    -- Insert Reddy Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Reddy Hospital', ST_SetSRID(ST_MakePoint(83.3099357, 17.7295515), 4326), '{"R321, RT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Reddy Hospital, Visakhapatnam', 'Reddy Hospital  R321, RT HSPTL', ST_SetSRID(ST_MakePoint(83.3099357, 17.7295515), 4326), 50);
    END IF;
    -- Insert Kalavathy Maternity Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kalavathy Maternity Hospital', ST_SetSRID(ST_MakePoint(83.2912686, 17.7301424), 4326), '{"KLF0 MTRNT HSPTL, K413"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kalavathy Maternity Hospital, Visakhapatnam', 'Kalavathy Maternity Hospital  KLF0 MTRNT HSPTL, K413', ST_SetSRID(ST_MakePoint(83.2912686, 17.7301424), 4326), 50);
    END IF;
    -- Insert S.V Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'S.V Hospital', ST_SetSRID(ST_MakePoint(83.2982102, 17.7315298), 4326), '{"SF HSPTL, S121"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'S.V Hospital, Visakhapatnam', 'S.V Hospital  SF HSPTL, S121', ST_SetSRID(ST_MakePoint(83.2982102, 17.7315298), 4326), 50);
    END IF;
    -- Insert Naidu Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Naidu Hospital', ST_SetSRID(ST_MakePoint(83.4480273, 17.8948381), 4326), '{"NT HSPTL, N321"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Naidu Hospital, Visakhapatnam', 'Naidu Hospital  NT HSPTL, N321', ST_SetSRID(ST_MakePoint(83.4480273, 17.8948381), 4326), 50);
    END IF;
    -- Insert Lakshmi Gayathri Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lakshmi Gayathri Hospital', ST_SetSRID(ST_MakePoint(83.2988976, 17.7360864), 4326), '{"L252, LKXM KY0R HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lakshmi Gayathri Hospital, Visakhapatnam', 'Lakshmi Gayathri Hospital  L252, LKXM KY0R HSPTL', ST_SetSRID(ST_MakePoint(83.2988976, 17.7360864), 4326), 50);
    END IF;
    -- Insert Saroja Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Saroja Hospital', ST_SetSRID(ST_MakePoint(83.300686, 17.733482), 4326), '{"SRJ HSPTL, S622"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Saroja Hospital, Visakhapatnam', 'Saroja Hospital  SRJ HSPTL, S622', ST_SetSRID(ST_MakePoint(83.300686, 17.733482), 4326), 50);
    END IF;
    -- Insert Surya Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Surya Hospital', ST_SetSRID(ST_MakePoint(83.3397326, 17.8059869), 4326), '{"SRY HSPTL, S621"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Surya Hospital, Visakhapatnam', 'Surya Hospital  SRY HSPTL, S621', ST_SetSRID(ST_MakePoint(83.3397326, 17.8059869), 4326), 50);
    END IF;
    -- Insert A1 Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'A1 Hospital', ST_SetSRID(ST_MakePoint(83.2994272, 17.739424), 4326), '{"A HSPTL, A213"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'A1 Hospital, Visakhapatnam', 'A1 Hospital  A HSPTL, A213', ST_SetSRID(ST_MakePoint(83.2994272, 17.739424), 4326), 50);
    END IF;
    -- Insert Mukyamantri Arogya Kendram (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mukyamantri Arogya Kendram', ST_SetSRID(ST_MakePoint(83.4451285, 17.8952319), 4326), '{"MKYMNTR ARJY KNTRM, M255"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mukyamantri Arogya Kendram, Visakhapatnam', 'Mukyamantri Arogya Kendram  MKYMNTR ARJY KNTRM, M255', ST_SetSRID(ST_MakePoint(83.4451285, 17.8952319), 4326), 50);
    END IF;
    -- Insert CARE Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'CARE Hospitals', ST_SetSRID(ST_MakePoint(83.294103, 17.7275716), 4326), '{"C621, KR HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'CARE Hospitals, Visakhapatnam', 'CARE Hospitals  C621, KR HSPTLS', ST_SetSRID(ST_MakePoint(83.294103, 17.7275716), 4326), 50);
    END IF;
    -- Insert Surya Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Surya Nursing Home', ST_SetSRID(ST_MakePoint(83.423704, 17.9321277), 4326), '{"SRY NRSNK HM, S656"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Surya Nursing Home, Visakhapatnam', 'Surya Nursing Home  SRY NRSNK HM, S656', ST_SetSRID(ST_MakePoint(83.423704, 17.9321277), 4326), 50);
    END IF;
    -- Insert Medi Cos Den Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Medi Cos Den Hospital', ST_SetSRID(ST_MakePoint(83.3591053, 17.7636399), 4326), '{"M322, MT KS TN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Medi Cos Den Hospital, Visakhapatnam', 'Medi Cos Den Hospital  M322, MT KS TN HSPTL', ST_SetSRID(ST_MakePoint(83.3591053, 17.7636399), 4326), 50);
    END IF;
    -- Insert Sri Surya Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Surya Hospital', ST_SetSRID(ST_MakePoint(83.340338, 17.7427806), 4326), '{"SR SRY HSPTL, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Surya Hospital, Visakhapatnam', 'Sri Surya Hospital  SR SRY HSPTL, S626', ST_SetSRID(ST_MakePoint(83.340338, 17.7427806), 4326), 50);
    END IF;
    -- Insert Sri Krishna Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Krishna Hospital', ST_SetSRID(ST_MakePoint(83.3003628, 17.7346615), 4326), '{"SR KRXN HSPTL, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Krishna Hospital, Visakhapatnam', 'Sri Krishna Hospital  SR KRXN HSPTL, S626', ST_SetSRID(ST_MakePoint(83.3003628, 17.7346615), 4326), 50);
    END IF;
    -- Insert Ujhwal Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ujhwal Hospitals', ST_SetSRID(ST_MakePoint(83.3555939, 17.8131242), 4326), '{"U242, UJHWL HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ujhwal Hospitals, Visakhapatnam', 'Ujhwal Hospitals  U242, UJHWL HSPTLS', ST_SetSRID(ST_MakePoint(83.3555939, 17.8131242), 4326), 50);
    END IF;
    -- Insert Navratna Kesava Rao Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Navratna Kesava Rao Hospital', ST_SetSRID(ST_MakePoint(83.4536651, 17.8900803), 4326), '{"NFRTN KSF R HSPTL, N163"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Navratna Kesava Rao Hospital, Visakhapatnam', 'Navratna Kesava Rao Hospital  NFRTN KSF R HSPTL, N163', ST_SetSRID(ST_MakePoint(83.4536651, 17.8900803), 4326), 50);
    END IF;
    -- Insert Dr. Kamalamma Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr. Kamalamma Hospital', ST_SetSRID(ST_MakePoint(83.2936785, 17.7289528), 4326), '{"D625, TR KMLM HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr. Kamalamma Hospital, Visakhapatnam', 'Dr. Kamalamma Hospital  D625, TR KMLM HSPTL', ST_SetSRID(ST_MakePoint(83.2936785, 17.7289528), 4326), 50);
    END IF;
    -- Insert National Orthopaedic Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'National Orthopaedic Centre', ST_SetSRID(ST_MakePoint(83.3116732, 17.7364007), 4326), '{"N354, NXNL OR0PTK SNTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'National Orthopaedic Centre, Visakhapatnam', 'National Orthopaedic Centre  N354, NXNL OR0PTK SNTR', ST_SetSRID(ST_MakePoint(83.3116732, 17.7364007), 4326), 50);
    END IF;
    -- Insert Vivekanandha Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vivekanandha Hospital', ST_SetSRID(ST_MakePoint(83.2982472, 17.7318218), 4326), '{"V125, FFKNNTH HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vivekanandha Hospital, Visakhapatnam', 'Vivekanandha Hospital  V125, FFKNNTH HSPTL', ST_SetSRID(ST_MakePoint(83.2982472, 17.7318218), 4326), 50);
    END IF;
    -- Insert Government ENT Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government ENT Hospital', ST_SetSRID(ST_MakePoint(83.3141989, 17.745865), 4326), '{"KFRNMNT ENT HSPTL, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government ENT Hospital, Visakhapatnam', 'Government ENT Hospital  KFRNMNT ENT HSPTL, G165', ST_SetSRID(ST_MakePoint(83.3141989, 17.745865), 4326), 50);
    END IF;
    -- Insert Padmavathi Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Padmavathi Hospital', ST_SetSRID(ST_MakePoint(83.3075918, 17.7414689), 4326), '{"P351, PTMF0 HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Padmavathi Hospital, Visakhapatnam', 'Padmavathi Hospital  P351, PTMF0 HSPTL', ST_SetSRID(ST_MakePoint(83.3075918, 17.7414689), 4326), 50);
    END IF;
    -- Insert GITAM Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'GITAM Hospital', ST_SetSRID(ST_MakePoint(83.3746555, 17.7846774), 4326), '{"JTM HSPTL, G352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'GITAM Hospital, Visakhapatnam', 'GITAM Hospital  JTM HSPTL, G352', ST_SetSRID(ST_MakePoint(83.3746555, 17.7846774), 4326), 50);
    END IF;
    -- Insert Krishnaveni Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Krishnaveni Hospital', ST_SetSRID(ST_MakePoint(83.2947484, 17.7301583), 4326), '{"K625, KRXNFN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Krishnaveni Hospital, Visakhapatnam', 'Krishnaveni Hospital  K625, KRXNFN HSPTL', ST_SetSRID(ST_MakePoint(83.2947484, 17.7301583), 4326), 50);
    END IF;
    -- Insert Morpheus Padmasri International IVF Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Morpheus Padmasri International IVF Centre', ST_SetSRID(ST_MakePoint(83.3034712, 17.7380243), 4326), '{"MRFS PTMSR INTRNXNL IFF SNTR, M612"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Morpheus Padmasri International IVF Centre, Visakhapatnam', 'Morpheus Padmasri International IVF Centre  MRFS PTMSR INTRNXNL IFF SNTR, M612', ST_SetSRID(ST_MakePoint(83.3034712, 17.7380243), 4326), 50);
    END IF;
    -- Insert GK''s Rainbow Dental Superspeciality Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'GK''s Rainbow Dental Superspeciality Hospital', ST_SetSRID(ST_MakePoint(83.3535257, 17.8024524), 4326), '{"G265, KKS RNB TNTL SPRSPXLT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'GK''s Rainbow Dental Superspeciality Hospital, Visakhapatnam', 'GK''s Rainbow Dental Superspeciality Hospital  G265, KKS RNB TNTL SPRSPXLT HSPTL', ST_SetSRID(ST_MakePoint(83.3535257, 17.8024524), 4326), 50);
    END IF;
    -- Insert Krishna Children Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Krishna Children Hospital', ST_SetSRID(ST_MakePoint(83.293632, 17.7289115), 4326), '{"K625, KRXN XLTRN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Krishna Children Hospital, Visakhapatnam', 'Krishna Children Hospital  K625, KRXN XLTRN HSPTL', ST_SetSRID(ST_MakePoint(83.293632, 17.7289115), 4326), 50);
    END IF;
    -- Insert Master Homoeo Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Master Homoeo Home', ST_SetSRID(ST_MakePoint(83.3077406, 17.7274279), 4326), '{"MSTR HM HM, M236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Master Homoeo Home, Visakhapatnam', 'Master Homoeo Home  MSTR HM HM, M236', ST_SetSRID(ST_MakePoint(83.3077406, 17.7274279), 4326), 50);
    END IF;
    -- Insert Sri Sai Ram Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Sai Ram Hospital', ST_SetSRID(ST_MakePoint(83.2918881, 17.7322439), 4326), '{"SR S RM HSPTL, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Sai Ram Hospital, Visakhapatnam', 'Sri Sai Ram Hospital  SR S RM HSPTL, S626', ST_SetSRID(ST_MakePoint(83.2918881, 17.7322439), 4326), 50);
    END IF;
    -- Insert Dr. Ramakrishna Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr. Ramakrishna Hospital', ST_SetSRID(ST_MakePoint(83.4260617, 17.9309318), 4326), '{"TR RMKRXN HSPTL, D665"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr. Ramakrishna Hospital, Visakhapatnam', 'Dr. Ramakrishna Hospital  TR RMKRXN HSPTL, D665', ST_SetSRID(ST_MakePoint(83.4260617, 17.9309318), 4326), 50);
    END IF;
    -- Insert Soham ENT Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Soham ENT Hospital', ST_SetSRID(ST_MakePoint(83.297657, 17.7442418), 4326), '{"S553, SHM ENT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Soham ENT Hospital, Visakhapatnam', 'Soham ENT Hospital  S553, SHM ENT HSPTL', ST_SetSRID(ST_MakePoint(83.297657, 17.7442418), 4326), 50);
    END IF;
    -- Insert Keerthana Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Keerthana Nursing Home', ST_SetSRID(ST_MakePoint(83.3467145, 17.8040379), 4326), '{"K635, KR0N NRSNK HM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Keerthana Nursing Home, Visakhapatnam', 'Keerthana Nursing Home  K635, KR0N NRSNK HM', ST_SetSRID(ST_MakePoint(83.3467145, 17.8040379), 4326), 50);
    END IF;
    -- Insert Padmavathi Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Padmavathi Nursing Home', ST_SetSRID(ST_MakePoint(83.4191803, 17.9307079), 4326), '{"PTMF0 NRSNK HM, P351"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Padmavathi Nursing Home, Visakhapatnam', 'Padmavathi Nursing Home  PTMF0 NRSNK HM, P351', ST_SetSRID(ST_MakePoint(83.4191803, 17.9307079), 4326), 50);
    END IF;
    -- Insert Sri Gayatri Nursing Home & Kasturi Maternity Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Gayatri Nursing Home & Kasturi Maternity Hospital', ST_SetSRID(ST_MakePoint(83.3331524, 17.7244631), 4326), '{"SR KYTR NRSNK HM KSTR MTRNT HSPTL, S623"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Gayatri Nursing Home & Kasturi Maternity Hospital, Visakhapatnam', 'Sri Gayatri Nursing Home & Kasturi Maternity Hospital  SR KYTR NRSNK HM KSTR MTRNT HSPTL, S623', ST_SetSRID(ST_MakePoint(83.3331524, 17.7244631), 4326), 50);
    END IF;
    -- Insert Tirumala Jyoti Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tirumala Jyoti Hospital', ST_SetSRID(ST_MakePoint(83.001827, 17.683136), 4326), '{"T654, TRML JYT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tirumala Jyoti Hospital, Visakhapatnam', 'Tirumala Jyoti Hospital  T654, TRML JYT HSPTL', ST_SetSRID(ST_MakePoint(83.001827, 17.683136), 4326), 50);
    END IF;
    -- Insert Government Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital', ST_SetSRID(ST_MakePoint(82.9560418, 17.7467671), 4326), '{"G165, KFRNMNT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital, Visakhapatnam', 'Government Hospital  G165, KFRNMNT HSPTL', ST_SetSRID(ST_MakePoint(82.9560418, 17.7467671), 4326), 50);
    END IF;
    -- Insert Dr. Soma Raju Children Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr. Soma Raju Children Hospital', ST_SetSRID(ST_MakePoint(83.0101255, 17.6882064), 4326), '{"TR SM RJ XLTRN HSPTL, D625"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr. Soma Raju Children Hospital, Visakhapatnam', 'Dr. Soma Raju Children Hospital  TR SM RJ XLTRN HSPTL, D625', ST_SetSRID(ST_MakePoint(83.0101255, 17.6882064), 4326), 50);
    END IF;
    -- Insert Kalyani Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kalyani Nursing Home', ST_SetSRID(ST_MakePoint(83.001839, 17.687728), 4326), '{"KLYN NRSNK HM, K455"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kalyani Nursing Home, Visakhapatnam', 'Kalyani Nursing Home  KLYN NRSNK HM, K455', ST_SetSRID(ST_MakePoint(83.001839, 17.687728), 4326), 50);
    END IF;
    -- Insert Annapurna Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Annapurna Hospital', ST_SetSRID(ST_MakePoint(83.011245, 17.6842691), 4326), '{"A516, ANPRN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Annapurna Hospital, Visakhapatnam', 'Annapurna Hospital  A516, ANPRN HSPTL', ST_SetSRID(ST_MakePoint(83.011245, 17.6842691), 4326), 50);
    END IF;
    -- Insert SS Dental Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SS Dental Hospital', ST_SetSRID(ST_MakePoint(83.009283, 17.688264), 4326), '{"S353, S TNTL HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SS Dental Hospital, Visakhapatnam', 'SS Dental Hospital  S353, S TNTL HSPTL', ST_SetSRID(ST_MakePoint(83.009283, 17.688264), 4326), 50);
    END IF;
    -- Insert Maternity Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maternity Hospital', ST_SetSRID(ST_MakePoint(83.0101274, 17.6848737), 4326), '{"MTRNT HSPTL, M365"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maternity Hospital, Visakhapatnam', 'Maternity Hospital  MTRNT HSPTL, M365', ST_SetSRID(ST_MakePoint(83.0101274, 17.6848737), 4326), 50);
    END IF;
    -- Insert Sai Teja Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sai Teja Hospital', ST_SetSRID(ST_MakePoint(83.00072, 17.686424), 4326), '{"S TJ HSPTL, S322"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sai Teja Hospital, Visakhapatnam', 'Sai Teja Hospital  S TJ HSPTL, S322', ST_SetSRID(ST_MakePoint(83.00072, 17.686424), 4326), 50);
    END IF;
    -- Insert Benargy Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Benargy Hospital', ST_SetSRID(ST_MakePoint(83.0010632, 17.6753904), 4326), '{"BNRJ HSPTL, B562"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Benargy Hospital, Visakhapatnam', 'Benargy Hospital  BNRJ HSPTL, B562', ST_SetSRID(ST_MakePoint(83.0010632, 17.6753904), 4326), 50);
    END IF;
    -- Insert Sri Sagar Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Sagar Hospital', ST_SetSRID(ST_MakePoint(83.0021022, 17.6892581), 4326), '{"SR SKR HSPTL, S622"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Sagar Hospital, Visakhapatnam', 'Sri Sagar Hospital  SR SKR HSPTL, S622', ST_SetSRID(ST_MakePoint(83.0021022, 17.6892581), 4326), 50);
    END IF;
    -- Insert Abhay Arogya Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Abhay Arogya Hospital', ST_SetSRID(ST_MakePoint(82.9368591, 17.8278456), 4326), '{"ABH ARJY HSPTL, A162"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Abhay Arogya Hospital, Visakhapatnam', 'Abhay Arogya Hospital  ABH ARJY HSPTL, A162', ST_SetSRID(ST_MakePoint(82.9368591, 17.8278456), 4326), 50);
    END IF;
    -- Insert Sri Vijaya Lakshmi Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Vijaya Lakshmi Hospital', ST_SetSRID(ST_MakePoint(82.9274015, 17.8297069), 4326), '{"SR FJY LKXM HSPTL, S612"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Vijaya Lakshmi Hospital, Visakhapatnam', 'Sri Vijaya Lakshmi Hospital  SR FJY LKXM HSPTL, S612', ST_SetSRID(ST_MakePoint(82.9274015, 17.8297069), 4326), 50);
    END IF;
    -- Insert Sri Srinivasa Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Srinivasa Hospital', ST_SetSRID(ST_MakePoint(82.8128916, 17.9169656), 4326), '{"SR SRNFS HSPTL, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Srinivasa Hospital, Visakhapatnam', 'Sri Srinivasa Hospital  SR SRNFS HSPTL, S626', ST_SetSRID(ST_MakePoint(82.8128916, 17.9169656), 4326), 50);
    END IF;
    -- Insert Srinivasa Children''s Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srinivasa Children''s Hospital', ST_SetSRID(ST_MakePoint(83.002889, 17.688484), 4326), '{"SRNFS XLTRNS HSPTL, S651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srinivasa Children''s Hospital, Visakhapatnam', 'Srinivasa Children''s Hospital  SRNFS XLTRNS HSPTL, S651', ST_SetSRID(ST_MakePoint(83.002889, 17.688484), 4326), 50);
    END IF;
    -- Insert Government Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital', ST_SetSRID(ST_MakePoint(82.9828155, 17.9925538), 4326), '{"G165, KFRNMNT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital, Visakhapatnam', 'Government Hospital  G165, KFRNMNT HSPTL', ST_SetSRID(ST_MakePoint(82.9828155, 17.9925538), 4326), 50);
    END IF;
    -- Insert Thummapala Primary Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Thummapala Primary Hospital', ST_SetSRID(ST_MakePoint(82.9985248, 17.7092053), 4326), '{"T514, 0MPL PRMR HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Thummapala Primary Hospital, Visakhapatnam', 'Thummapala Primary Hospital  T514, 0MPL PRMR HSPTL', ST_SetSRID(ST_MakePoint(82.9985248, 17.7092053), 4326), 50);
    END IF;
    -- Insert London Children''s Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'London Children''s Hospital', ST_SetSRID(ST_MakePoint(83.0024749, 17.6852716), 4326), '{"LNTN XLTRNS HSPTL, L535"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'London Children''s Hospital, Visakhapatnam', 'London Children''s Hospital  LNTN XLTRNS HSPTL, L535', ST_SetSRID(ST_MakePoint(83.0024749, 17.6852716), 4326), 50);
    END IF;
    -- Insert Gollaprolu Children''s Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollaprolu Children''s Hospital', ST_SetSRID(ST_MakePoint(82.8529786, 17.5478426), 4326), '{"KLPRL XLTRNS HSPTL, G416"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollaprolu Children''s Hospital, Visakhapatnam', 'Gollaprolu Children''s Hospital  KLPRL XLTRNS HSPTL, G416', ST_SetSRID(ST_MakePoint(82.8529786, 17.5478426), 4326), 50);
    END IF;
    -- Insert Lakshmi Children Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lakshmi Children Hospital', ST_SetSRID(ST_MakePoint(82.9417718, 17.8250127), 4326), '{"LKXM XLTRN HSPTL, L252"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lakshmi Children Hospital, Visakhapatnam', 'Lakshmi Children Hospital  LKXM XLTRN HSPTL, L252', ST_SetSRID(ST_MakePoint(82.9417718, 17.8250127), 4326), 50);
    END IF;
    -- Insert Nirmala Maternity Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nirmala Maternity Hospital', ST_SetSRID(ST_MakePoint(83.00227, 17.6854923), 4326), '{"NRML MTRNT HSPTL, N654"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nirmala Maternity Hospital, Visakhapatnam', 'Nirmala Maternity Hospital  NRML MTRNT HSPTL, N654', ST_SetSRID(ST_MakePoint(83.00227, 17.6854923), 4326), 50);
    END IF;
    -- Insert Ayyappa Gupta Eye Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ayyappa Gupta Eye Hospital', ST_SetSRID(ST_MakePoint(83.0037356, 17.6916683), 4326), '{"A121, AYP KPT EY HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ayyappa Gupta Eye Hospital, Visakhapatnam', 'Ayyappa Gupta Eye Hospital  A121, AYP KPT EY HSPTL', ST_SetSRID(ST_MakePoint(83.0037356, 17.6916683), 4326), 50);
    END IF;
    -- Insert Government Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital', ST_SetSRID(ST_MakePoint(82.9988148, 17.8402661), 4326), '{"G165, KFRNMNT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital, Visakhapatnam', 'Government Hospital  G165, KFRNMNT HSPTL', ST_SetSRID(ST_MakePoint(82.9988148, 17.8402661), 4326), 50);
    END IF;
    -- Insert Usha Prime Multispeciality Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Usha Prime Multispeciality Hospital', ST_SetSRID(ST_MakePoint(83.001744, 17.687618), 4326), '{"U216, UX PRM MLTSPXLT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Usha Prime Multispeciality Hospital, Visakhapatnam', 'Usha Prime Multispeciality Hospital  U216, UX PRM MLTSPXLT HSPTL', ST_SetSRID(ST_MakePoint(83.001744, 17.687618), 4326), 50);
    END IF;
    -- Insert Janaseva Eye Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Janaseva Eye Hospital', ST_SetSRID(ST_MakePoint(82.8533103, 17.5516438), 4326), '{"J521, JNSF EY HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Janaseva Eye Hospital, Visakhapatnam', 'Janaseva Eye Hospital  J521, JNSF EY HSPTL', ST_SetSRID(ST_MakePoint(82.8533103, 17.5516438), 4326), 50);
    END IF;
    -- Insert Dr. K. Venkatesh Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr. K. Venkatesh Hospital', ST_SetSRID(ST_MakePoint(82.8906247, 17.9272601), 4326), '{"TR K FNKTX HSPTL, D621"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr. K. Venkatesh Hospital, Visakhapatnam', 'Dr. K. Venkatesh Hospital  TR K FNKTX HSPTL, D621', ST_SetSRID(ST_MakePoint(82.8906247, 17.9272601), 4326), 50);
    END IF;
    -- Insert Spark Dental Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Spark Dental Hospital', ST_SetSRID(ST_MakePoint(82.9391521, 17.82508), 4326), '{"S162, SPRK TNTL HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Spark Dental Hospital, Visakhapatnam', 'Spark Dental Hospital  S162, SPRK TNTL HSPTL', ST_SetSRID(ST_MakePoint(82.9391521, 17.82508), 4326), 50);
    END IF;
    -- Insert Sree Seshapadma Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sree Seshapadma Hospital', ST_SetSRID(ST_MakePoint(82.8517581, 17.5534898), 4326), '{"S622, SR SXPTM HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sree Seshapadma Hospital, Visakhapatnam', 'Sree Seshapadma Hospital  S622, SR SXPTM HSPTL', ST_SetSRID(ST_MakePoint(82.8517581, 17.5534898), 4326), 50);
    END IF;
    -- Insert Gadam Dental Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gadam Dental Hospital', ST_SetSRID(ST_MakePoint(83.002401, 17.687646), 4326), '{"KTM TNTL HSPTL, G353"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gadam Dental Hospital, Visakhapatnam', 'Gadam Dental Hospital  KTM TNTL HSPTL, G353', ST_SetSRID(ST_MakePoint(83.002401, 17.687646), 4326), 50);
    END IF;
    -- Insert Medikon Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Medikon Hospital', ST_SetSRID(ST_MakePoint(83.001142, 17.680999), 4326), '{"MTKN HSPTL, M325"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Medikon Hospital, Visakhapatnam', 'Medikon Hospital  MTKN HSPTL, M325', ST_SetSRID(ST_MakePoint(83.001142, 17.680999), 4326), 50);
    END IF;
    -- Insert Ravi Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ravi Hospital', ST_SetSRID(ST_MakePoint(83.009456, 17.686005), 4326), '{"R121, RF HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ravi Hospital, Visakhapatnam', 'Ravi Hospital  R121, RF HSPTL', ST_SetSRID(ST_MakePoint(83.009456, 17.686005), 4326), 50);
    END IF;
    -- Insert Laxmi Orthopaedic Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Laxmi Orthopaedic Hospital', ST_SetSRID(ST_MakePoint(83.005706, 17.68721), 4326), '{"L256, LKSM OR0PTK HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Laxmi Orthopaedic Hospital, Visakhapatnam', 'Laxmi Orthopaedic Hospital  L256, LKSM OR0PTK HSPTL', ST_SetSRID(ST_MakePoint(83.005706, 17.68721), 4326), 50);
    END IF;
    -- Insert Sapthagiri Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sapthagiri Hospital', ST_SetSRID(ST_MakePoint(83.0099047, 17.69098), 4326), '{"SP0JR HSPTL, S132"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sapthagiri Hospital, Visakhapatnam', 'Sapthagiri Hospital  SP0JR HSPTL, S132', ST_SetSRID(ST_MakePoint(83.0099047, 17.69098), 4326), 50);
    END IF;
    -- Insert Dr. Thrinadh Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr. Thrinadh Hospital', ST_SetSRID(ST_MakePoint(82.8498751, 17.5452357), 4326), '{"TR 0RNTH HSPTL, D636"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr. Thrinadh Hospital, Visakhapatnam', 'Dr. Thrinadh Hospital  TR 0RNTH HSPTL, D636', ST_SetSRID(ST_MakePoint(82.8498751, 17.5452357), 4326), 50);
    END IF;
    -- Insert Dr. Ram Mohan Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr. Ram Mohan Hospital', ST_SetSRID(ST_MakePoint(83.0015806, 17.685712), 4326), '{"D665, TR RM MHN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr. Ram Mohan Hospital, Visakhapatnam', 'Dr. Ram Mohan Hospital  D665, TR RM MHN HSPTL', ST_SetSRID(ST_MakePoint(83.0015806, 17.685712), 4326), 50);
    END IF;
    -- Insert Mother and Child Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mother and Child Hospital', ST_SetSRID(ST_MakePoint(83.001269, 17.685934), 4326), '{"M0R ANT XLT HSPTL, M365"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mother and Child Hospital, Visakhapatnam', 'Mother and Child Hospital  M0R ANT XLT HSPTL, M365', ST_SetSRID(ST_MakePoint(83.001269, 17.685934), 4326), 50);
    END IF;
    -- Insert Siddhartha Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Siddhartha Nursing Home', ST_SetSRID(ST_MakePoint(83.0022801, 17.6843742), 4326), '{"STHR0 NRSNK HM, S363"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Siddhartha Nursing Home, Visakhapatnam', 'Siddhartha Nursing Home  STHR0 NRSNK HM, S363', ST_SetSRID(ST_MakePoint(83.0022801, 17.6843742), 4326), 50);
    END IF;
    -- Insert Vijaya Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijaya Hospital', ST_SetSRID(ST_MakePoint(82.849726, 17.544446), 4326), '{"V221, FJY HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijaya Hospital, Visakhapatnam', 'Vijaya Hospital  V221, FJY HSPTL', ST_SetSRID(ST_MakePoint(82.849726, 17.544446), 4326), 50);
    END IF;
    -- Insert Sri Venkateswara Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Venkateswara Hospital', ST_SetSRID(ST_MakePoint(83.0006719, 17.6777911), 4326), '{"S615, SR FNKTSWR HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Venkateswara Hospital, Visakhapatnam', 'Sri Venkateswara Hospital  S615, SR FNKTSWR HSPTL', ST_SetSRID(ST_MakePoint(83.0006719, 17.6777911), 4326), 50);
    END IF;
    -- Insert Kanakadurga Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kanakadurga Hospital', ST_SetSRID(ST_MakePoint(83.312939, 17.7101086), 4326), '{"K523, KNKTRK HSPTL"}', jsonb_build_object('te', 'కనకదుర్గ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kanakadurga Hospital, Visakhapatnam', 'Kanakadurga Hospital కనకదుర్గ హాస్పిటల్ K523, KNKTRK HSPTL', ST_SetSRID(ST_MakePoint(83.312939, 17.7101086), 4326), 50);
    END IF;
    -- Insert Sunrise Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sunrise Hospitals', ST_SetSRID(ST_MakePoint(83.2662977, 17.7409007), 4326), '{"SNRS HSPTLS, S562"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sunrise Hospitals, Visakhapatnam', 'Sunrise Hospitals  SNRS HSPTLS, S562', ST_SetSRID(ST_MakePoint(83.2662977, 17.7409007), 4326), 50);
    END IF;
    -- Insert Sunrise Childern Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sunrise Childern Hospital', ST_SetSRID(ST_MakePoint(83.2053903, 17.687897), 4326), '{"S562, SNRS XLTRN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sunrise Childern Hospital, Visakhapatnam', 'Sunrise Childern Hospital  S562, SNRS XLTRN HSPTL', ST_SetSRID(ST_MakePoint(83.2053903, 17.687897), 4326), 50);
    END IF;
    -- Insert Sri Krishna Orthopaedic Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Krishna Orthopaedic Hospital', ST_SetSRID(ST_MakePoint(83.193854, 17.6843101), 4326), '{"S626, SR KRXN OR0PTK HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Krishna Orthopaedic Hospital, Visakhapatnam', 'Sri Krishna Orthopaedic Hospital  S626, SR KRXN OR0PTK HSPTL', ST_SetSRID(ST_MakePoint(83.193854, 17.6843101), 4326), 50);
    END IF;
    -- Insert A N Beach Hospital - Multi Speciality Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'A N Beach Hospital - Multi Speciality Hospital', ST_SetSRID(ST_MakePoint(83.3197589, 17.7129243), 4326), '{"A N BX HSPTL MLT SPXLT HSPTL, A512"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'A N Beach Hospital - Multi Speciality Hospital, Visakhapatnam', 'A N Beach Hospital - Multi Speciality Hospital  A N BX HSPTL MLT SPXLT HSPTL, A512', ST_SetSRID(ST_MakePoint(83.3197589, 17.7129243), 4326), 50);
    END IF;
    -- Insert Dr. Mangamma Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr. Mangamma Hospital', ST_SetSRID(ST_MakePoint(83.3045397, 17.7100946), 4326), '{"TR MNKM HSPTL, D655"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr. Mangamma Hospital, Visakhapatnam', 'Dr. Mangamma Hospital  TR MNKM HSPTL, D655', ST_SetSRID(ST_MakePoint(83.3045397, 17.7100946), 4326), 50);
    END IF;
    -- Insert Sri Lakhmi ENT Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Lakhmi ENT Hospital', ST_SetSRID(ST_MakePoint(83.1975029, 17.6829789), 4326), '{"S642, SR LKHM ENT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Lakhmi ENT Hospital, Visakhapatnam', 'Sri Lakhmi ENT Hospital  S642, SR LKHM ENT HSPTL', ST_SetSRID(ST_MakePoint(83.1975029, 17.6829789), 4326), 50);
    END IF;
    -- Insert BHEL Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'BHEL Hospital', ST_SetSRID(ST_MakePoint(83.199526, 17.702135), 4326), '{"B421, BHL HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'BHEL Hospital, Visakhapatnam', 'BHEL Hospital  B421, BHL HSPTL', ST_SetSRID(ST_MakePoint(83.199526, 17.702135), 4326), 50);
    END IF;
    -- Insert Visakha Child Care Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Visakha Child Care Centre', ST_SetSRID(ST_MakePoint(83.2016314, 17.6846529), 4326), '{"FSKH XLT KR SNTR, V222"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Visakha Child Care Centre, Visakhapatnam', 'Visakha Child Care Centre  FSKH XLT KR SNTR, V222', ST_SetSRID(ST_MakePoint(83.2016314, 17.6846529), 4326), 50);
    END IF;
    -- Insert Piles Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Piles Hospital', ST_SetSRID(ST_MakePoint(83.2133794, 17.6871805), 4326), '{"PLS HSPTL, P422"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Piles Hospital, Visakhapatnam', 'Piles Hospital  PLS HSPTL, P422', ST_SetSRID(ST_MakePoint(83.2133794, 17.6871805), 4326), 50);
    END IF;
    -- Insert Visakha Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Visakha Hospital', ST_SetSRID(ST_MakePoint(83.304361, 17.710144), 4326), '{"FSKH HSPTL, V222"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Visakha Hospital, Visakhapatnam', 'Visakha Hospital  FSKH HSPTL, V222', ST_SetSRID(ST_MakePoint(83.304361, 17.710144), 4326), 50);
    END IF;
    -- Insert Sreenivasa Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sreenivasa Hospital', ST_SetSRID(ST_MakePoint(83.2060963, 17.8231815), 4326), '{"SRNFS HSPTL, S651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sreenivasa Hospital, Visakhapatnam', 'Sreenivasa Hospital  SRNFS HSPTL, S651', ST_SetSRID(ST_MakePoint(83.2060963, 17.8231815), 4326), 50);
    END IF;
    -- Insert Simhagiri Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simhagiri Hospital', ST_SetSRID(ST_MakePoint(83.2127666, 17.6863477), 4326), '{"S526, SMHJR HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simhagiri Hospital, Visakhapatnam', 'Simhagiri Hospital  S526, SMHJR HSPTL', ST_SetSRID(ST_MakePoint(83.2127666, 17.6863477), 4326), 50);
    END IF;
    -- Insert City Hospital Ortho & Specialities (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'City Hospital Ortho & Specialities', ST_SetSRID(ST_MakePoint(83.2053196, 17.6852466), 4326), '{"ST HSPTL OR0 SPXLTS, C321"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'City Hospital Ortho & Specialities, Visakhapatnam', 'City Hospital Ortho & Specialities  ST HSPTL OR0 SPXLTS, C321', ST_SetSRID(ST_MakePoint(83.2053196, 17.6852466), 4326), 50);
    END IF;
    -- Insert Medicover Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Medicover Hospital', ST_SetSRID(ST_MakePoint(83.313972, 17.712323), 4326), '{"MTKFR HSPTL, M321"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Medicover Hospital, Visakhapatnam', 'Medicover Hospital  MTKFR HSPTL, M321', ST_SetSRID(ST_MakePoint(83.313972, 17.712323), 4326), 50);
    END IF;
    -- Insert KIMS ICON Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'KIMS ICON Hospitals', ST_SetSRID(ST_MakePoint(83.1956548, 17.7141817), 4326), '{"K522, KMS IKN HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'KIMS ICON Hospitals, Visakhapatnam', 'KIMS ICON Hospitals  K522, KMS IKN HSPTLS', ST_SetSRID(ST_MakePoint(83.1956548, 17.7141817), 4326), 50);
    END IF;
    -- Insert Life Spring Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Life Spring Hospital', ST_SetSRID(ST_MakePoint(83.243601, 17.688339), 4326), '{"L121, LF SPRNK HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Life Spring Hospital, Visakhapatnam', 'Life Spring Hospital  L121, LF SPRNK HSPTL', ST_SetSRID(ST_MakePoint(83.243601, 17.688339), 4326), 50);
    END IF;
    -- Insert Starzen Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Starzen Hospital', ST_SetSRID(ST_MakePoint(82.9771482, 17.562306), 4326), '{"S362, STRSN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Starzen Hospital, Visakhapatnam', 'Starzen Hospital  S362, STRSN HSPTL', ST_SetSRID(ST_MakePoint(82.9771482, 17.562306), 4326), 50);
    END IF;
    -- Insert Sri Lakshmi Children Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Lakshmi Children Hospital', ST_SetSRID(ST_MakePoint(83.2078579, 17.6854195), 4326), '{"SR LKXM XLTRN HSPTL, S642"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Lakshmi Children Hospital, Visakhapatnam', 'Sri Lakshmi Children Hospital  SR LKXM XLTRN HSPTL, S642', ST_SetSRID(ST_MakePoint(83.2078579, 17.6854195), 4326), 50);
    END IF;
    -- Insert Ankitha Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ankitha Hospital', ST_SetSRID(ST_MakePoint(83.1989654, 17.6827868), 4326), '{"A523, ANK0 HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ankitha Hospital, Visakhapatnam', 'Ankitha Hospital  A523, ANK0 HSPTL', ST_SetSRID(ST_MakePoint(83.1989654, 17.6827868), 4326), 50);
    END IF;
    -- Insert Jai Srikrishna Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jai Srikrishna Hospital', ST_SetSRID(ST_MakePoint(82.9768678, 17.5619762), 4326), '{"J SRKRXN HSPTL, J262"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jai Srikrishna Hospital, Visakhapatnam', 'Jai Srikrishna Hospital  J SRKRXN HSPTL, J262', ST_SetSRID(ST_MakePoint(82.9768678, 17.5619762), 4326), 50);
    END IF;
    -- Insert Hymavathi Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hymavathi Hospital', ST_SetSRID(ST_MakePoint(83.2192385, 17.7480338), 4326), '{"H513, HMF0 HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hymavathi Hospital, Visakhapatnam', 'Hymavathi Hospital  H513, HMF0 HSPTL', ST_SetSRID(ST_MakePoint(83.2192385, 17.7480338), 4326), 50);
    END IF;
    -- Insert Pujitha Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pujitha Hospital', ST_SetSRID(ST_MakePoint(83.2100702, 17.6844753), 4326), '{"P232, PJ0 HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pujitha Hospital, Visakhapatnam', 'Pujitha Hospital  P232, PJ0 HSPTL', ST_SetSRID(ST_MakePoint(83.2100702, 17.6844753), 4326), 50);
    END IF;
    -- Insert Sarojini Children''s Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sarojini Children''s Hospital', ST_SetSRID(ST_MakePoint(83.2265444, 17.7445712), 4326), '{"S625, SRJN XLTRNS HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sarojini Children''s Hospital, Visakhapatnam', 'Sarojini Children''s Hospital  S625, SRJN XLTRNS HSPTL', ST_SetSRID(ST_MakePoint(83.2265444, 17.7445712), 4326), 50);
    END IF;
    -- Insert SMS Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SMS Hospital', ST_SetSRID(ST_MakePoint(83.2261912, 17.7452036), 4326), '{"SMS HSPTL, S522"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SMS Hospital, Visakhapatnam', 'SMS Hospital  SMS HSPTL, S522', ST_SetSRID(ST_MakePoint(83.2261912, 17.7452036), 4326), 50);
    END IF;
    -- Insert Navaratnam - Kesava Rao Charitable Health Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Navaratnam - Kesava Rao Charitable Health Centre', ST_SetSRID(ST_MakePoint(83.2049981, 17.6872165), 4326), '{"NFRTNM KSF R XRTBL HL0 SNTR, N163"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Navaratnam - Kesava Rao Charitable Health Centre, Visakhapatnam', 'Navaratnam - Kesava Rao Charitable Health Centre  NFRTNM KSF R XRTBL HL0 SNTR, N163', ST_SetSRID(ST_MakePoint(83.2049981, 17.6872165), 4326), 50);
    END IF;
    -- Insert Visakha Gynaec & Obst Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Visakha Gynaec & Obst Hospital', ST_SetSRID(ST_MakePoint(83.2042804, 17.8148001), 4326), '{"FSKH JNK OBST HSPTL, V222"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Visakha Gynaec & Obst Hospital, Visakhapatnam', 'Visakha Gynaec & Obst Hospital  FSKH JNK OBST HSPTL, V222', ST_SetSRID(ST_MakePoint(83.2042804, 17.8148001), 4326), 50);
    END IF;
    -- Insert Suryanarayana Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Suryanarayana Hospital', ST_SetSRID(ST_MakePoint(83.2186331, 17.7508459), 4326), '{"SRYNRYN HSPTL, S656"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Suryanarayana Hospital, Visakhapatnam', 'Suryanarayana Hospital  SRYNRYN HSPTL, S656', ST_SetSRID(ST_MakePoint(83.2186331, 17.7508459), 4326), 50);
    END IF;
    -- Insert Simhadri Women & Child Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simhadri Women & Child Hospital', ST_SetSRID(ST_MakePoint(83.2256151, 17.7656255), 4326), '{"SMHTR WMN XLT HSPTL, S536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simhadri Women & Child Hospital, Visakhapatnam', 'Simhadri Women & Child Hospital  SMHTR WMN XLT HSPTL, S536', ST_SetSRID(ST_MakePoint(83.2256151, 17.7656255), 4326), 50);
    END IF;
    -- Insert Vizag Ortho & Spine Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vizag Ortho & Spine Centre', ST_SetSRID(ST_MakePoint(83.312442, 17.7104), 4326), '{"FSK OR0 SPN SNTR, V226"}', jsonb_build_object('te', 'వైజాగ్ ఓర్‌తో & స్పైన్ సెంటర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vizag Ortho & Spine Centre, Visakhapatnam', 'Vizag Ortho & Spine Centre వైజాగ్ ఓర్‌తో & స్పైన్ సెంటర్ FSK OR0 SPN SNTR, V226', ST_SetSRID(ST_MakePoint(83.312442, 17.7104), 4326), 50);
    END IF;
    -- Insert Sri Amrutha Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Amrutha Hospital', ST_SetSRID(ST_MakePoint(83.302862, 17.710327), 4326), '{"SR AMR0 HSPTL, S656"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Amrutha Hospital, Visakhapatnam', 'Sri Amrutha Hospital  SR AMR0 HSPTL, S656', ST_SetSRID(ST_MakePoint(83.302862, 17.710327), 4326), 50);
    END IF;
    -- Insert Mamata Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mamata Hospital', ST_SetSRID(ST_MakePoint(83.2079845, 17.6869092), 4326), '{"M532, MMT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mamata Hospital, Visakhapatnam', 'Mamata Hospital  M532, MMT HSPTL', ST_SetSRID(ST_MakePoint(83.2079845, 17.6869092), 4326), 50);
    END IF;
    -- Insert Sri Surya Dental Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Surya Dental Hospital', ST_SetSRID(ST_MakePoint(83.3103498, 17.709779), 4326), '{"SR SRY TNTL HSPTL, S626"}', jsonb_build_object('te', 'శ్రీ సూర్య డెంటల్ హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Surya Dental Hospital, Visakhapatnam', 'Sri Surya Dental Hospital శ్రీ సూర్య డెంటల్ హాస్పిటల్ SR SRY TNTL HSPTL, S626', ST_SetSRID(ST_MakePoint(83.3103498, 17.709779), 4326), 50);
    END IF;
    -- Insert Sri Surya Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Surya Hospital', ST_SetSRID(ST_MakePoint(83.309857, 17.708149), 4326), '{"SR SRY HSPTL, S626"}', jsonb_build_object('te', 'శ్రీ సూర్య హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Surya Hospital, Visakhapatnam', 'Sri Surya Hospital శ్రీ సూర్య హాస్పిటల్ SR SRY HSPTL, S626', ST_SetSRID(ST_MakePoint(83.309857, 17.708149), 4326), 50);
    END IF;
    -- Insert Lata Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lata Hospital', ST_SetSRID(ST_MakePoint(83.205361, 17.6877091), 4326), '{"L321, LT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lata Hospital, Visakhapatnam', 'Lata Hospital  L321, LT HSPTL', ST_SetSRID(ST_MakePoint(83.205361, 17.6877091), 4326), 50);
    END IF;
    -- Insert Janani Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Janani Hospital', ST_SetSRID(ST_MakePoint(83.2073838, 17.6865547), 4326), '{"J552, JNN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Janani Hospital, Visakhapatnam', 'Janani Hospital  J552, JNN HSPTL', ST_SetSRID(ST_MakePoint(83.2073838, 17.6865547), 4326), 50);
    END IF;
    -- Insert Geetha Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Geetha Hospital', ST_SetSRID(ST_MakePoint(83.2145015, 17.6860522), 4326), '{"G321, J0 HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Geetha Hospital, Visakhapatnam', 'Geetha Hospital  G321, J0 HSPTL', ST_SetSRID(ST_MakePoint(83.2145015, 17.6860522), 4326), 50);
    END IF;
    -- Insert Shree Krishna Health Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Shree Krishna Health Centre', ST_SetSRID(ST_MakePoint(83.3105799, 17.7104023), 4326), '{"XR KRXN HL0 SNTR, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Shree Krishna Health Centre, Visakhapatnam', 'Shree Krishna Health Centre  XR KRXN HL0 SNTR, S626', ST_SetSRID(ST_MakePoint(83.3105799, 17.7104023), 4326), 50);
    END IF;
    -- Insert Aditya Obstetrics & Gynecology Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aditya Obstetrics & Gynecology Hospital', ST_SetSRID(ST_MakePoint(83.269641, 17.745985), 4326), '{"A331, ATTY OBSTTRKS JNKLJ HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aditya Obstetrics & Gynecology Hospital, Visakhapatnam', 'Aditya Obstetrics & Gynecology Hospital  A331, ATTY OBSTTRKS JNKLJ HSPTL', ST_SetSRID(ST_MakePoint(83.269641, 17.745985), 4326), 50);
    END IF;
    -- Insert NTPC Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'NTPC Hospital', ST_SetSRID(ST_MakePoint(83.0939853, 17.5685137), 4326), '{"NTPK HSPTL, N312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'NTPC Hospital, Visakhapatnam', 'NTPC Hospital  NTPK HSPTL, N312', ST_SetSRID(ST_MakePoint(83.0939853, 17.5685137), 4326), 50);
    END IF;
    -- Insert Rotary Netra Rural Eye Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rotary Netra Rural Eye Hospital', ST_SetSRID(ST_MakePoint(83.202451, 17.831088), 4326), '{"R365, RTR NTR RRL EY HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rotary Netra Rural Eye Hospital, Visakhapatnam', 'Rotary Netra Rural Eye Hospital  R365, RTR NTR RRL EY HSPTL', ST_SetSRID(ST_MakePoint(83.202451, 17.831088), 4326), 50);
    END IF;
    -- Insert Sri Surya Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Surya Hospital', ST_SetSRID(ST_MakePoint(83.2092812, 17.6849028), 4326), '{"SR SRY HSPTL, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Surya Hospital, Visakhapatnam', 'Sri Surya Hospital  SR SRY HSPTL, S626', ST_SetSRID(ST_MakePoint(83.2092812, 17.6849028), 4326), 50);
    END IF;
    -- Insert Harshitha Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Harshitha Hospital', ST_SetSRID(ST_MakePoint(83.2101897, 17.6863384), 4326), '{"H623, HRX0 HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Harshitha Hospital, Visakhapatnam', 'Harshitha Hospital  H623, HRX0 HSPTL', ST_SetSRID(ST_MakePoint(83.2101897, 17.6863384), 4326), 50);
    END IF;
    -- Insert Mother and Child Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mother and Child Hospital', ST_SetSRID(ST_MakePoint(83.12163, 17.790161), 4326), '{"M0R ANT XLT HSPTL, M365"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mother and Child Hospital, Visakhapatnam', 'Mother and Child Hospital  M0R ANT XLT HSPTL, M365', ST_SetSRID(ST_MakePoint(83.12163, 17.790161), 4326), 50);
    END IF;
    -- Insert Pendurthi Govt Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pendurthi Govt Hospital', ST_SetSRID(ST_MakePoint(83.2070778, 17.8094151), 4326), '{"PNTR0 KFT HSPTL, P536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pendurthi Govt Hospital, Visakhapatnam', 'Pendurthi Govt Hospital  PNTR0 KFT HSPTL, P536', ST_SetSRID(ST_MakePoint(83.2070778, 17.8094151), 4326), 50);
    END IF;
    -- Insert Sri Sai Aditya Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Sai Aditya Hospital', ST_SetSRID(ST_MakePoint(83.269671, 17.746278), 4326), '{"S623, SR S ATTY HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Sai Aditya Hospital, Visakhapatnam', 'Sri Sai Aditya Hospital  S623, SR S ATTY HSPTL', ST_SetSRID(ST_MakePoint(83.269671, 17.746278), 4326), 50);
    END IF;
    -- Insert Gothis Doctor Chambers (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gothis Doctor Chambers', ST_SetSRID(ST_MakePoint(83.312125, 17.710382), 4326), '{"K0S TKTR XMBRS, G323"}', jsonb_build_object('te', 'గోతిస్ డాక్టర్ చేంబర్స్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gothis Doctor Chambers, Visakhapatnam', 'Gothis Doctor Chambers గోతిస్ డాక్టర్ చేంబర్స్ K0S TKTR XMBRS, G323', ST_SetSRID(ST_MakePoint(83.312125, 17.710382), 4326), 50);
    END IF;
    -- Insert Harini Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Harini Hospital', ST_SetSRID(ST_MakePoint(83.2055093, 17.6795765), 4326), '{"HRN HSPTL, H652"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Harini Hospital, Visakhapatnam', 'Harini Hospital  HRN HSPTL, H652', ST_SetSRID(ST_MakePoint(83.2055093, 17.6795765), 4326), 50);
    END IF;
    -- Insert Heritage Kerala Ayurveda Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Heritage Kerala Ayurveda Hospital', ST_SetSRID(ST_MakePoint(83.2120798, 17.7671455), 4326), '{"HRTJ KRL AYRFT HSPTL, H632"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Heritage Kerala Ayurveda Hospital, Visakhapatnam', 'Heritage Kerala Ayurveda Hospital  HRTJ KRL AYRFT HSPTL, H632', ST_SetSRID(ST_MakePoint(83.2120798, 17.7671455), 4326), 50);
    END IF;
    -- Insert Sharan Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sharan Hospital', ST_SetSRID(ST_MakePoint(83.077059, 17.6297105), 4326), '{"XRN HSPTL, S652"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sharan Hospital, Visakhapatnam', 'Sharan Hospital  XRN HSPTL, S652', ST_SetSRID(ST_MakePoint(83.077059, 17.6297105), 4326), 50);
    END IF;
    -- Insert Ramya Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramya Hospital', ST_SetSRID(ST_MakePoint(83.304302, 17.710544), 4326), '{"R521, RMY HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramya Hospital, Visakhapatnam', 'Ramya Hospital  R521, RMY HSPTL', ST_SetSRID(ST_MakePoint(83.304302, 17.710544), 4326), 50);
    END IF;
    -- Insert Sri Sapthagiri Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Sapthagiri Hospitals', ST_SetSRID(ST_MakePoint(83.213061, 17.805851), 4326), '{"S621, SR SP0JR HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Sapthagiri Hospitals, Visakhapatnam', 'Sri Sapthagiri Hospitals  S621, SR SP0JR HSPTLS', ST_SetSRID(ST_MakePoint(83.213061, 17.805851), 4326), 50);
    END IF;
    -- Insert Government Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital', ST_SetSRID(ST_MakePoint(83.2161371, 17.7524734), 4326), '{"G165, KFRNMNT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital, Visakhapatnam', 'Government Hospital  G165, KFRNMNT HSPTL', ST_SetSRID(ST_MakePoint(83.2161371, 17.7524734), 4326), 50);
    END IF;
    -- Insert Raghavendra Eye Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Raghavendra Eye Hospital', ST_SetSRID(ST_MakePoint(83.2199593, 17.7476896), 4326), '{"R215, RKHFNTR EY HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Raghavendra Eye Hospital, Visakhapatnam', 'Raghavendra Eye Hospital  R215, RKHFNTR EY HSPTL', ST_SetSRID(ST_MakePoint(83.2199593, 17.7476896), 4326), 50);
    END IF;
    -- Insert Asha Hospital Diabetes & Multi Speciality (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Asha Hospital Diabetes & Multi Speciality', ST_SetSRID(ST_MakePoint(83.08184, 17.6212637), 4326), '{"AX HSPTL TBTS MLT SPXLT, A221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Asha Hospital Diabetes & Multi Speciality, Visakhapatnam', 'Asha Hospital Diabetes & Multi Speciality  AX HSPTL TBTS MLT SPXLT, A221', ST_SetSRID(ST_MakePoint(83.08184, 17.6212637), 4326), 50);
    END IF;
    -- Insert Muddu Krishna Children Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Muddu Krishna Children Hospital', ST_SetSRID(ST_MakePoint(83.2046951, 17.6852715), 4326), '{"M326, MT KRXN XLTRN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Muddu Krishna Children Hospital, Visakhapatnam', 'Muddu Krishna Children Hospital  M326, MT KRXN XLTRN HSPTL', ST_SetSRID(ST_MakePoint(83.2046951, 17.6852715), 4326), 50);
    END IF;
    -- Insert Surya Teja Multispeciality Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Surya Teja Multispeciality Hospital', ST_SetSRID(ST_MakePoint(82.9784452, 17.5659385), 4326), '{"S632, SRY TJ MLTSPXLT HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Surya Teja Multispeciality Hospital, Visakhapatnam', 'Surya Teja Multispeciality Hospital  S632, SRY TJ MLTSPXLT HSPTL', ST_SetSRID(ST_MakePoint(82.9784452, 17.5659385), 4326), 50);
    END IF;
    -- Insert Sarojini Devi Skin Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sarojini Devi Skin Hospital', ST_SetSRID(ST_MakePoint(83.3090277, 17.7166466), 4326), '{"S625, SRJN TF SKN HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sarojini Devi Skin Hospital, Visakhapatnam', 'Sarojini Devi Skin Hospital  S625, SRJN TF SKN HSPTL', ST_SetSRID(ST_MakePoint(83.3090277, 17.7166466), 4326), 50);
    END IF;
    -- Insert Ramsaranya Child Care Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramsaranya Child Care Hospital', ST_SetSRID(ST_MakePoint(83.3143316, 17.7102508), 4326), '{"RMSRNY XLT KR HSPTL, R526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramsaranya Child Care Hospital, Visakhapatnam', 'Ramsaranya Child Care Hospital  RMSRNY XLT KR HSPTL, R526', ST_SetSRID(ST_MakePoint(83.3143316, 17.7102508), 4326), 50);
    END IF;
    -- Insert Baba Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Baba Hospital', ST_SetSRID(ST_MakePoint(83.308867, 17.708177), 4326), '{"BB HSPTL, B121"}', jsonb_build_object('te', 'బాబా హాస్పిటల్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Baba Hospital, Visakhapatnam', 'Baba Hospital బాబా హాస్పిటల్ BB HSPTL, B121', ST_SetSRID(ST_MakePoint(83.308867, 17.708177), 4326), 50);
    END IF;
    -- Insert Triveni Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Triveni Hospitals', ST_SetSRID(ST_MakePoint(83.2064302, 17.8177533), 4326), '{"TRFN HSPTLS, T615"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Triveni Hospitals, Visakhapatnam', 'Triveni Hospitals  TRFN HSPTLS, T615', ST_SetSRID(ST_MakePoint(83.2064302, 17.8177533), 4326), 50);
    END IF;
    -- Insert Amma Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amma Hospital', ST_SetSRID(ST_MakePoint(83.0901428, 17.6288271), 4326), '{"AM HSPTL, A521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amma Hospital, Visakhapatnam', 'Amma Hospital  AM HSPTL, A521', ST_SetSRID(ST_MakePoint(83.0901428, 17.6288271), 4326), 50);
    END IF;
    -- Insert Aditya Multi Care Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aditya Multi Care Hospital', ST_SetSRID(ST_MakePoint(83.3046802, 17.7100474), 4326), '{"ATTY MLT KR HSPTL, A335"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aditya Multi Care Hospital, Visakhapatnam', 'Aditya Multi Care Hospital  ATTY MLT KR HSPTL, A335', ST_SetSRID(ST_MakePoint(83.3046802, 17.7100474), 4326), 50);
    END IF;
    -- Insert M.B. Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'M.B. Hospitals', ST_SetSRID(ST_MakePoint(83.3106082, 17.763448), 4326), '{"M121, MB HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'M.B. Hospitals, Visakhapatnam', 'M.B. Hospitals  M121, MB HSPTLS', ST_SetSRID(ST_MakePoint(83.3106082, 17.763448), 4326), 50);
    END IF;
    -- Insert ApolloHospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ApolloHospitals', ST_SetSRID(ST_MakePoint(83.3091374, 17.7171444), 4326), '{"A142, APLHSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ApolloHospitals, Visakhapatnam', 'ApolloHospitals  A142, APLHSPTLS', ST_SetSRID(ST_MakePoint(83.3091374, 17.7171444), 4326), 50);
    END IF;
    -- Insert HCG Cancer Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HCG Cancer Centre', ST_SetSRID(ST_MakePoint(83.3057236, 17.7638753), 4326), '{"H225, HKK KNSR SNTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HCG Cancer Centre, Visakhapatnam', 'HCG Cancer Centre  H225, HKK KNSR SNTR', ST_SetSRID(ST_MakePoint(83.3057236, 17.7638753), 4326), 50);
    END IF;
    -- Insert Star Pinnacle Heart Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Star Pinnacle Heart Centre', ST_SetSRID(ST_MakePoint(83.3078391, 17.7632652), 4326), '{"STR PNKL HRT SNTR, S361"}', jsonb_build_object('te', 'స్టార్ పిన్నకిల్ హార్ట్ సెంటర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Star Pinnacle Heart Centre, Visakhapatnam', 'Star Pinnacle Heart Centre స్టార్ పిన్నకిల్ హార్ట్ సెంటర్ STR PNKL HRT SNTR, S361', ST_SetSRID(ST_MakePoint(83.3078391, 17.7632652), 4326), 50);
    END IF;
    -- Insert Homi Bhabha Cancer Hospital & Research Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Homi Bhabha Cancer Hospital & Research Centre', ST_SetSRID(ST_MakePoint(83.1144238, 17.6898831), 4326), '{"HM BHBH KNSR HSPTL RSRX SNTR, H511"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Homi Bhabha Cancer Hospital & Research Centre, Visakhapatnam', 'Homi Bhabha Cancer Hospital & Research Centre  HM BHBH KNSR HSPTL RSRX SNTR, H511', ST_SetSRID(ST_MakePoint(83.1144238, 17.6898831), 4326), 50);
    END IF;
    -- Insert Ramsaranya Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramsaranya Hospitals', ST_SetSRID(ST_MakePoint(83.3106734, 17.7097535), 4326), '{"RMSRNY HSPTLS, R526"}', jsonb_build_object('te', 'రాంశరణ్య హాస్పిటల్స్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramsaranya Hospitals, Visakhapatnam', 'Ramsaranya Hospitals రాంశరణ్య హాస్పిటల్స్ RMSRNY HSPTLS, R526', ST_SetSRID(ST_MakePoint(83.3106734, 17.7097535), 4326), 50);
    END IF;
    -- Insert Visakha Hospitals And Diagnostics (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Visakha Hospitals And Diagnostics', ST_SetSRID(ST_MakePoint(83.3130073, 17.7202856), 4326), '{"FSKH HSPTLS ANT TKNSTKS, V222"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Visakha Hospitals And Diagnostics, Visakhapatnam', 'Visakha Hospitals And Diagnostics  FSKH HSPTLS ANT TKNSTKS, V222', ST_SetSRID(ST_MakePoint(83.3130073, 17.7202856), 4326), 50);
    END IF;
    -- Insert SevenHills Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SevenHills Hospital', ST_SetSRID(ST_MakePoint(83.3094245, 17.7173631), 4326), '{"SFNHLS HSPTL, S154"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SevenHills Hospital, Visakhapatnam', 'SevenHills Hospital  SFNHLS HSPTL, S154', ST_SetSRID(ST_MakePoint(83.3094245, 17.7173631), 4326), 50);
    END IF;
    -- Insert St Anns Jubilee Memorial Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'St Anns Jubilee Memorial Hospital', ST_SetSRID(ST_MakePoint(83.2377236, 17.6843531), 4326), '{"ST ANS JBL MMRL HSPTL, S352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'St Anns Jubilee Memorial Hospital, Visakhapatnam', 'St Anns Jubilee Memorial Hospital  ST ANS JBL MMRL HSPTL, S352', ST_SetSRID(ST_MakePoint(83.2377236, 17.6843531), 4326), 50);
    END IF;
    -- Insert govt.primaryschool (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'govt.primaryschool', ST_SetSRID(ST_MakePoint(82.8906965, 17.7361067), 4326), '{"KFTPRMRSXL, G131"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'govt.primaryschool, Visakhapatnam', 'govt.primaryschool  KFTPRMRSXL, G131', ST_SetSRID(ST_MakePoint(82.8906965, 17.7361067), 4326), 50);
    END IF;
    -- Insert Rajam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajam', ST_SetSRID(ST_MakePoint(82.892628, 17.736509), 4326), '{"RJM, R250"}', jsonb_build_object('te', 'రాజాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajam, Visakhapatnam', 'Rajam రాజాం RJM, R250', ST_SetSRID(ST_MakePoint(82.892628, 17.736509), 4326), 40);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(82.8920122, 17.7370955), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(82.8920122, 17.7370955), 4326), 10);
    END IF;
    -- Insert High school (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'High school', ST_SetSRID(ST_MakePoint(82.8880807, 17.7396843), 4326), '{"H224, H SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'High school, Visakhapatnam', 'High school  H224, H SXL', ST_SetSRID(ST_MakePoint(82.8880807, 17.7396843), 4326), 50);
    END IF;
    -- Insert Sri Narayana Defence Academy Junior & Degree College (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Narayana Defence Academy Junior & Degree College', ST_SetSRID(ST_MakePoint(83.2975325, 17.8934834), 4326), '{"SR NRYN TFNS AKTM JNR TKR KLJ, S656"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Narayana Defence Academy Junior & Degree College, Visakhapatnam', 'Sri Narayana Defence Academy Junior & Degree College  SR NRYN TFNS AKTM JNR TKR KLJ, S656', ST_SetSRID(ST_MakePoint(83.2975325, 17.8934834), 4326), 50);
    END IF;
    -- Insert Vijnana Vihara Residential School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijnana Vihara Residential School', ST_SetSRID(ST_MakePoint(83.3240093, 17.8832002), 4326), '{"V255, FJNN FHR RSTNXL SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijnana Vihara Residential School, Visakhapatnam', 'Vijnana Vihara Residential School  V255, FJNN FHR RSTNXL SXL', ST_SetSRID(ST_MakePoint(83.3240093, 17.8832002), 4326), 50);
    END IF;
    -- Insert Vijnana Vihara Residential School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijnana Vihara Residential School', ST_SetSRID(ST_MakePoint(83.3239894, 17.8832006), 4326), '{"V255, FJNN FHR RSTNXL SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijnana Vihara Residential School, Visakhapatnam', 'Vijnana Vihara Residential School  V255, FJNN FHR RSTNXL SXL', ST_SetSRID(ST_MakePoint(83.3239894, 17.8832006), 4326), 50);
    END IF;
    -- Insert Suraksha Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Suraksha Hospital', ST_SetSRID(ST_MakePoint(83.2555653, 17.7396152), 4326), '{"SRKX HSPTL, S622"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Suraksha Hospital, Visakhapatnam', 'Suraksha Hospital  SRKX HSPTL, S622', ST_SetSRID(ST_MakePoint(83.2555653, 17.7396152), 4326), 50);
    END IF;
    -- Insert Varma Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Varma Hospitals', ST_SetSRID(ST_MakePoint(83.3113995, 17.7640286), 4326), '{"V652, FRM HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Varma Hospitals, Visakhapatnam', 'Varma Hospitals  V652, FRM HSPTLS', ST_SetSRID(ST_MakePoint(83.3113995, 17.7640286), 4326), 50);
    END IF;
    -- Insert Sai Spoorthy Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sai Spoorthy Hospital', ST_SetSRID(ST_MakePoint(83.309347, 17.7295406), 4326), '{"S216, S SPR0 HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sai Spoorthy Hospital, Visakhapatnam', 'Sai Spoorthy Hospital  S216, S SPR0 HSPTL', ST_SetSRID(ST_MakePoint(83.309347, 17.7295406), 4326), 50);
    END IF;
    -- Insert Government Regional Eye Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Regional Eye Hospital', ST_SetSRID(ST_MakePoint(83.3113942, 17.7304744), 4326), '{"KFRNMNT RJNL EY HSPTL, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Regional Eye Hospital, Visakhapatnam', 'Government Regional Eye Hospital  KFRNMNT RJNL EY HSPTL, G165', ST_SetSRID(ST_MakePoint(83.3113942, 17.7304744), 4326), 50);
    END IF;
    -- Insert LG Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'LG Hospitals', ST_SetSRID(ST_MakePoint(83.3045894, 17.710174), 4326), '{"L221, LK HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'LG Hospitals, Visakhapatnam', 'LG Hospitals  L221, LK HSPTLS', ST_SetSRID(ST_MakePoint(83.3045894, 17.710174), 4326), 50);
    END IF;
    -- Insert Omega Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Omega Hospitals', ST_SetSRID(ST_MakePoint(83.3124349, 17.763791), 4326), '{"OMK HSPTLS, O522"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Omega Hospitals, Visakhapatnam', 'Omega Hospitals  OMK HSPTLS, O522', ST_SetSRID(ST_MakePoint(83.3124349, 17.763791), 4326), 50);
    END IF;
    -- Insert Medicover Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Medicover Hospitals', ST_SetSRID(ST_MakePoint(83.3121251, 17.7638179), 4326), '{"MTKFR HSPTLS, M321"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Medicover Hospitals, Visakhapatnam', 'Medicover Hospitals  MTKFR HSPTLS, M321', ST_SetSRID(ST_MakePoint(83.3121251, 17.7638179), 4326), 50);
    END IF;
    -- Insert Ramsaranya Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramsaranya Hospitals', ST_SetSRID(ST_MakePoint(83.3109067, 17.7100054), 4326), '{"RMSRNY HSPTLS, R526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramsaranya Hospitals, Visakhapatnam', 'Ramsaranya Hospitals  RMSRNY HSPTLS, R526', ST_SetSRID(ST_MakePoint(83.3109067, 17.7100054), 4326), 50);
    END IF;
    -- Insert GJ Hospitals And Trauma Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'GJ Hospitals And Trauma Centre', ST_SetSRID(ST_MakePoint(83.3324401, 17.7336653), 4326), '{"KJ HSPTLS ANT TRM SNTR, G213"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'GJ Hospitals And Trauma Centre, Visakhapatnam', 'GJ Hospitals And Trauma Centre  KJ HSPTLS ANT TRM SNTR, G213', ST_SetSRID(ST_MakePoint(83.3324401, 17.7336653), 4326), 50);
    END IF;
    -- Insert Sankar Foundation Eye Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sankar Foundation Eye Hospital', ST_SetSRID(ST_MakePoint(83.2159491, 17.6812931), 4326), '{"SNKR FNTXN EY HSPTL, S526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sankar Foundation Eye Hospital, Visakhapatnam', 'Sankar Foundation Eye Hospital  SNKR FNTXN EY HSPTL, S526', ST_SetSRID(ST_MakePoint(83.2159491, 17.6812931), 4326), 50);
    END IF;
    -- Insert Government Hospital, Rakodu (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government Hospital, Rakodu', ST_SetSRID(ST_MakePoint(83.3410607, 18.0924766), 4326), '{"KFRNMNT HSPTL RKT, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government Hospital, Rakodu, Visakhapatnam', 'Government Hospital, Rakodu  KFRNMNT HSPTL RKT, G165', ST_SetSRID(ST_MakePoint(83.3410607, 18.0924766), 4326), 50);
    END IF;
    -- Insert Arabupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Arabupalem', ST_SetSRID(ST_MakePoint(82.98244, 17.6461691), 4326), '{"ARBPLM, A611"}', jsonb_build_object('te', 'అరబుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Arabupalem, Visakhapatnam', 'Arabupalem అరబుపాలెం ARBPLM, A611', ST_SetSRID(ST_MakePoint(82.98244, 17.6461691), 4326), 40);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.3322949, 17.7229521), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.3322949, 17.7229521), 4326), 10);
    END IF;
    -- Insert Kotak Mahindra Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotak Mahindra Bank', ST_SetSRID(ST_MakePoint(83.3321742, 17.7229764), 4326), '{"K325, KTK MHNTR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotak Mahindra Bank, Visakhapatnam', 'Kotak Mahindra Bank  K325, KTK MHNTR BNK', ST_SetSRID(ST_MakePoint(83.3321742, 17.7229764), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2463246, 17.746747), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2463246, 17.746747), 4326), 10);
    END IF;
    -- Insert Chest Hospital and Medical Store (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chest Hospital and Medical Store', ST_SetSRID(ST_MakePoint(83.2191542, 17.7493798), 4326), '{"C232, XST HSPTL ANT MTKL STR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chest Hospital and Medical Store, Visakhapatnam', 'Chest Hospital and Medical Store  C232, XST HSPTL ANT MTKL STR', ST_SetSRID(ST_MakePoint(83.2191542, 17.7493798), 4326), 50);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2190557, 17.7493754), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2190557, 17.7493754), 4326), 10);
    END IF;
    -- Insert Balaji 99 Uplands (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Balaji 99 Uplands', ST_SetSRID(ST_MakePoint(83.3140428, 17.7216719), 4326), '{"B421, BLJ UPLNTS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Balaji 99 Uplands, Visakhapatnam', 'Balaji 99 Uplands  B421, BLJ UPLNTS', ST_SetSRID(ST_MakePoint(83.3140428, 17.7216719), 4326), 60);
    END IF;
    -- Insert Gnanapuram (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gnanapuram', ST_SetSRID(ST_MakePoint(83.2854974, 17.7204005), 4326), '{"NNPRM, G551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gnanapuram, Visakhapatnam', 'Gnanapuram  NNPRM, G551', ST_SetSRID(ST_MakePoint(83.2854974, 17.7204005), 4326), 80);
    END IF;
    -- Insert Arabica (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Arabica', ST_SetSRID(ST_MakePoint(83.3387927, 17.7264206), 4326), '{"ARBK, A612"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Arabica, Visakhapatnam', 'Arabica  ARBK, A612', ST_SetSRID(ST_MakePoint(83.3387927, 17.7264206), 4326), 10);
    END IF;
    -- Insert Paradise (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Paradise', ST_SetSRID(ST_MakePoint(83.3330963, 17.7195637), 4326), '{"PRTS, P632"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Paradise, Visakhapatnam', 'Paradise  PRTS, P632', ST_SetSRID(ST_MakePoint(83.3330963, 17.7195637), 4326), 10);
    END IF;
    -- Insert Cabrilos (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cabrilos', ST_SetSRID(ST_MakePoint(83.3154924, 17.7111181), 4326), '{"C164, KBRLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cabrilos, Visakhapatnam', 'Cabrilos  C164, KBRLS', ST_SetSRID(ST_MakePoint(83.3154924, 17.7111181), 4326), 10);
    END IF;
    -- Insert Kirlampudi Layout (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kirlampudi Layout', ST_SetSRID(ST_MakePoint(83.3321498, 17.7212248), 4326), '{"K645, KRLMPT LYT"}', jsonb_build_object('te', 'కిర్లంపూడి లేఅవుట్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kirlampudi Layout, Visakhapatnam', 'Kirlampudi Layout కిర్లంపూడి లేఅవుట్ K645, KRLMPT LYT', ST_SetSRID(ST_MakePoint(83.3321498, 17.7212248), 4326), 60);
    END IF;
    -- Insert Axis Bank ATM (atm)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Axis Bank ATM', ST_SetSRID(ST_MakePoint(83.2080391, 17.8095703), 4326), '{"A221, AKSS BNK ATM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Axis Bank ATM, Visakhapatnam', 'Axis Bank ATM  A221, AKSS BNK ATM', ST_SetSRID(ST_MakePoint(83.2080391, 17.8095703), 4326), 10);
    END IF;
    -- Insert VFC V3 Fried chicken (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'VFC V3 Fried chicken', ST_SetSRID(ST_MakePoint(83.2081242, 17.8076169), 4326), '{"V211, FFK F FRT XKN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'VFC V3 Fried chicken, Visakhapatnam', 'VFC V3 Fried chicken  V211, FFK F FRT XKN', ST_SetSRID(ST_MakePoint(83.2081242, 17.8076169), 4326), 10);
    END IF;
    -- Insert Food club (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Food club', ST_SetSRID(ST_MakePoint(83.2082848, 17.8088443), 4326), '{"FT KLB, F324"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Food club, Visakhapatnam', 'Food club  FT KLB, F324', ST_SetSRID(ST_MakePoint(83.2082848, 17.8088443), 4326), 10);
    END IF;
    -- Insert Celebrations Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Celebrations Restaurant', ST_SetSRID(ST_MakePoint(83.2083207, 17.8087407), 4326), '{"C416, SLBRXNS RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Celebrations Restaurant, Visakhapatnam', 'Celebrations Restaurant  C416, SLBRXNS RSTRNT', ST_SetSRID(ST_MakePoint(83.2083207, 17.8087407), 4326), 10);
    END IF;
    -- Insert Eye Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Eye Hospitals', ST_SetSRID(ST_MakePoint(83.2082462, 17.809861), 4326), '{"EY HSPTLS, E213"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Eye Hospitals, Visakhapatnam', 'Eye Hospitals  EY HSPTLS, E213', ST_SetSRID(ST_MakePoint(83.2082462, 17.809861), 4326), 50);
    END IF;
    -- Insert Sri ramanjaneya foods (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri ramanjaneya foods', ST_SetSRID(ST_MakePoint(83.2044675, 17.8097234), 4326), '{"S665, SR RMNJNY FTS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri ramanjaneya foods, Visakhapatnam', 'Sri ramanjaneya foods  S665, SR RMNJNY FTS', ST_SetSRID(ST_MakePoint(83.2044675, 17.8097234), 4326), 10);
    END IF;
    -- Insert Lovapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lovapalem', ST_SetSRID(ST_MakePoint(82.9612475, 17.4663599), 4326), '{"LFPLM, L114"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lovapalem, Visakhapatnam', 'Lovapalem  LFPLM, L114', ST_SetSRID(ST_MakePoint(82.9612475, 17.4663599), 4326), 40);
    END IF;
    -- Insert Mutyalammapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mutyalammapalem', ST_SetSRID(ST_MakePoint(83.085457, 17.5382065), 4326), '{"M345, MTYLMPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mutyalammapalem, Visakhapatnam', 'Mutyalammapalem  M345, MTYLMPLM', ST_SetSRID(ST_MakePoint(83.085457, 17.5382065), 4326), 40);
    END IF;
    -- Insert Bangarayyapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bangarayyapeta', ST_SetSRID(ST_MakePoint(82.8860388, 17.6357871), 4326), '{"BNKRYPT, B526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bangarayyapeta, Visakhapatnam', 'Bangarayyapeta  BNKRYPT, B526', ST_SetSRID(ST_MakePoint(82.8860388, 17.6357871), 4326), 40);
    END IF;
    -- Insert Thammayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Thammayyapalem', ST_SetSRID(ST_MakePoint(83.6126854, 18.0453714), 4326), '{"T514, 0MYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Thammayyapalem, Visakhapatnam', 'Thammayyapalem  T514, 0MYPLM', ST_SetSRID(ST_MakePoint(83.6126854, 18.0453714), 4326), 40);
    END IF;
    -- Insert Thanthadhi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Thanthadhi', ST_SetSRID(ST_MakePoint(83.0617251, 17.5260192), 4326), '{"0N0TH, T533"}', jsonb_build_object('te', 'తంటడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Thanthadhi, Visakhapatnam', 'Thanthadhi తంటడి 0N0TH, T533', ST_SetSRID(ST_MakePoint(83.0617251, 17.5260192), 4326), 40);
    END IF;
    -- Insert Appikonda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appikonda', ST_SetSRID(ST_MakePoint(83.1710044, 17.5739572), 4326), '{"APKNT, A125"}', jsonb_build_object('te', 'అప్పికొండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appikonda, Visakhapatnam', 'Appikonda అప్పికొండ APKNT, A125', ST_SetSRID(ST_MakePoint(83.1710044, 17.5739572), 4326), 40);
    END IF;
    -- Insert Murubai (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Murubai', ST_SetSRID(ST_MakePoint(83.161454, 17.5800536), 4326), '{"MRB, M610"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Murubai, Visakhapatnam', 'Murubai  MRB, M610', ST_SetSRID(ST_MakePoint(83.161454, 17.5800536), 4326), 40);
    END IF;
    -- Insert Palavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Palavalasa', ST_SetSRID(ST_MakePoint(83.1493404, 17.5735741), 4326), '{"PLFLS, P414"}', jsonb_build_object('te', 'పాలవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Palavalasa, Visakhapatnam', 'Palavalasa పాలవలస PLFLS, P414', ST_SetSRID(ST_MakePoint(83.1493404, 17.5735741), 4326), 40);
    END IF;
    -- Insert Athidi Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Athidi Restaurant', ST_SetSRID(ST_MakePoint(83.1861571, 17.9079093), 4326), '{"A336, A0T RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Athidi Restaurant, Visakhapatnam', 'Athidi Restaurant  A336, A0T RSTRNT', ST_SetSRID(ST_MakePoint(83.1861571, 17.9079093), 4326), 10);
    END IF;
    -- Insert Bank of Baroda (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of Baroda', ST_SetSRID(ST_MakePoint(83.1861538, 17.907805), 4326), '{"BNK OF BRT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of Baroda, Visakhapatnam', 'Bank of Baroda  BNK OF BRT, B521', ST_SetSRID(ST_MakePoint(83.1861538, 17.907805), 4326), 10);
    END IF;
    -- Insert SSL Food House (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SSL Food House', ST_SetSRID(ST_MakePoint(83.1861043, 17.9075392), 4326), '{"SL FT HS, S413"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SSL Food House, Visakhapatnam', 'SSL Food House  SL FT HS, S413', ST_SetSRID(ST_MakePoint(83.1861043, 17.9075392), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.1896752, 17.9014208), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.1896752, 17.9014208), 4326), 10);
    END IF;
    -- Insert Jammadevipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jammadevipeta', ST_SetSRID(ST_MakePoint(83.1674604, 17.9864402), 4326), '{"J531, JMTFPT"}', jsonb_build_object('te', 'జమ్మాదేవిపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jammadevipeta, Visakhapatnam', 'Jammadevipeta జమ్మాదేవిపేట J531, JMTFPT', ST_SetSRID(ST_MakePoint(83.1674604, 17.9864402), 4326), 40);
    END IF;
    -- Insert Pata Kondempudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Kondempudi', ST_SetSRID(ST_MakePoint(82.8438045, 17.7953929), 4326), '{"P325, PT KNTMPT"}', jsonb_build_object('te', 'పాత కొండెంపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Kondempudi, Visakhapatnam', 'Pata Kondempudi పాత కొండెంపూడి P325, PT KNTMPT', ST_SetSRID(ST_MakePoint(82.8438045, 17.7953929), 4326), 40);
    END IF;
    -- Insert Urban Treats Ruchi Family Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Urban Treats Ruchi Family Restaurant', ST_SetSRID(ST_MakePoint(83.3562943, 17.8253473), 4326), '{"URBN TRTS RX FML RSTRNT, U615"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Urban Treats Ruchi Family Restaurant, Visakhapatnam', 'Urban Treats Ruchi Family Restaurant  URBN TRTS RX FML RSTRNT, U615', ST_SetSRID(ST_MakePoint(83.3562943, 17.8253473), 4326), 10);
    END IF;
    -- Insert Padmavathi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Padmavathi Nagar', ST_SetSRID(ST_MakePoint(83.4081817, 18.099498), 4326), '{"P351, PTMF0 NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Padmavathi Nagar, Visakhapatnam', 'Padmavathi Nagar  P351, PTMF0 NKR', ST_SetSRID(ST_MakePoint(83.4081817, 18.099498), 4326), 60);
    END IF;
    -- Insert Bharanikam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bharanikam', ST_SetSRID(ST_MakePoint(83.6203203, 18.0910676), 4326), '{"B652, BHRNKM"}', jsonb_build_object('te', 'భరణికం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bharanikam, Visakhapatnam', 'Bharanikam భరణికం B652, BHRNKM', ST_SetSRID(ST_MakePoint(83.6203203, 18.0910676), 4326), 40);
    END IF;
    -- Insert Peddavuru (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Peddavuru', ST_SetSRID(ST_MakePoint(83.6521648, 18.0721936), 4326), '{"P316, PTFR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Peddavuru, Visakhapatnam', 'Peddavuru  P316, PTFR', ST_SetSRID(ST_MakePoint(83.6521648, 18.0721936), 4326), 10);
    END IF;
    -- Insert Kopperla (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kopperla', ST_SetSRID(ST_MakePoint(83.5473113, 18.0653532), 4326), '{"K164, KPRL"}', jsonb_build_object('te', 'కొప్పెర్ల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kopperla, Visakhapatnam', 'Kopperla కొప్పెర్ల K164, KPRL', ST_SetSRID(ST_MakePoint(83.5473113, 18.0653532), 4326), 40);
    END IF;
    -- Insert Gulivindalapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gulivindalapeta', ST_SetSRID(ST_MakePoint(83.6128, 18.0821858), 4326), '{"KLFNTLPT, G415"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gulivindalapeta, Visakhapatnam', 'Gulivindalapeta  KLFNTLPT, G415', ST_SetSRID(ST_MakePoint(83.6128, 18.0821858), 4326), 40);
    END IF;
    -- Insert Kovvada Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kovvada Agraharam', ST_SetSRID(ST_MakePoint(83.5724219, 18.0922701), 4326), '{"KFT AKRHRM, K132"}', jsonb_build_object('te', 'కొవ్వాడ అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kovvada Agraharam, Visakhapatnam', 'Kovvada Agraharam కొవ్వాడ అగ్రహారం KFT AKRHRM, K132', ST_SetSRID(ST_MakePoint(83.5724219, 18.0922701), 4326), 40);
    END IF;
    -- Insert Nakkanapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nakkanapeta', ST_SetSRID(ST_MakePoint(83.5972324, 18.0987598), 4326), '{"NKNPT, N251"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nakkanapeta, Visakhapatnam', 'Nakkanapeta  NKNPT, N251', ST_SetSRID(ST_MakePoint(83.5972324, 18.0987598), 4326), 40);
    END IF;
    -- Insert Nilageddapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nilageddapeta', ST_SetSRID(ST_MakePoint(83.6510606, 18.0743331), 4326), '{"N423, NLJTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nilageddapeta, Visakhapatnam', 'Nilageddapeta  N423, NLJTPT', ST_SetSRID(ST_MakePoint(83.6510606, 18.0743331), 4326), 10);
    END IF;
    -- Insert Bheemasingi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bheemasingi', ST_SetSRID(ST_MakePoint(83.2903382, 18.0352253), 4326), '{"BHMSNJ, B525"}', jsonb_build_object('te', 'భీమసింగి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bheemasingi, Visakhapatnam', 'Bheemasingi భీమసింగి BHMSNJ, B525', ST_SetSRID(ST_MakePoint(83.2903382, 18.0352253), 4326), 40);
    END IF;
    -- Insert Chillapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chillapalem', ST_SetSRID(ST_MakePoint(83.2825075, 18.0321905), 4326), '{"C414, XLPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chillapalem, Visakhapatnam', 'Chillapalem  C414, XLPLM', ST_SetSRID(ST_MakePoint(83.2825075, 18.0321905), 4326), 40);
    END IF;
    -- Insert Alamanda Santa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Alamanda Santa', ST_SetSRID(ST_MakePoint(83.2673074, 18.0143275), 4326), '{"ALMNT SNT, A455"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Alamanda Santa, Visakhapatnam', 'Alamanda Santa  ALMNT SNT, A455', ST_SetSRID(ST_MakePoint(83.2673074, 18.0143275), 4326), 40);
    END IF;
    -- Insert Thimmapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Thimmapuram', ST_SetSRID(ST_MakePoint(83.2740717, 18.0015409), 4326), '{"T516, 0MPRM"}', jsonb_build_object('te', 'తిమ్మాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Thimmapuram, Visakhapatnam', 'Thimmapuram తిమ్మాపురం T516, 0MPRM', ST_SetSRID(ST_MakePoint(83.2740717, 18.0015409), 4326), 40);
    END IF;
    -- Insert Marripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marripalem', ST_SetSRID(ST_MakePoint(83.0669779, 17.7439176), 4326), '{"MRPLM, M614"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marripalem, Visakhapatnam', 'Marripalem  MRPLM, M614', ST_SetSRID(ST_MakePoint(83.0669779, 17.7439176), 4326), 40);
    END IF;
    -- Insert Kotta Koduru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Koduru', ST_SetSRID(ST_MakePoint(83.0669978, 17.736198), 4326), '{"K323, KT KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Koduru, Visakhapatnam', 'Kotta Koduru  K323, KT KTR', ST_SetSRID(ST_MakePoint(83.0669978, 17.736198), 4326), 40);
    END IF;
    -- Insert Koduru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Koduru', ST_SetSRID(ST_MakePoint(83.069003, 17.7327449), 4326), '{"K360, KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Koduru, Visakhapatnam', 'Koduru  K360, KTR', ST_SetSRID(ST_MakePoint(83.069003, 17.7327449), 4326), 40);
    END IF;
    -- Insert Bhupatipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhupatipalem', ST_SetSRID(ST_MakePoint(83.0557278, 17.7325063), 4326), '{"BHPTPLM, B131"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhupatipalem, Visakhapatnam', 'Bhupatipalem  BHPTPLM, B131', ST_SetSRID(ST_MakePoint(83.0557278, 17.7325063), 4326), 40);
    END IF;
    -- Insert Gollapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapeta', ST_SetSRID(ST_MakePoint(83.0560297, 17.7373783), 4326), '{"G413, KLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapeta, Visakhapatnam', 'Gollapeta  G413, KLPT', ST_SetSRID(ST_MakePoint(83.0560297, 17.7373783), 4326), 40);
    END IF;
    -- Insert Pata Talarivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Talarivanipalem', ST_SetSRID(ST_MakePoint(83.0499012, 17.7185182), 4326), '{"P334, PT TLRFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Talarivanipalem, Visakhapatnam', 'Pata Talarivanipalem  P334, PT TLRFNPLM', ST_SetSRID(ST_MakePoint(83.0499012, 17.7185182), 4326), 40);
    END IF;
    -- Insert Gytulapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gytulapalem', ST_SetSRID(ST_MakePoint(82.8779559, 17.6325577), 4326), '{"JTLPLM, G341"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gytulapalem, Visakhapatnam', 'Gytulapalem  JTLPLM, G341', ST_SetSRID(ST_MakePoint(82.8779559, 17.6325577), 4326), 40);
    END IF;
    -- Insert Singavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Singavaram', ST_SetSRID(ST_MakePoint(82.8706579, 17.6431211), 4326), '{"SNKFRM, S521"}', jsonb_build_object('te', 'సింగవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Singavaram, Visakhapatnam', 'Singavaram సింగవరం SNKFRM, S521', ST_SetSRID(ST_MakePoint(82.8706579, 17.6431211), 4326), 40);
    END IF;
    -- Insert New Hope Jeevan Jyothi High School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'New Hope Jeevan Jyothi High School', ST_SetSRID(ST_MakePoint(83.1943513, 17.9315806), 4326), '{"N HP JFN JY0 H SXL, N121"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'New Hope Jeevan Jyothi High School, Visakhapatnam', 'New Hope Jeevan Jyothi High School  N HP JFN JY0 H SXL, N121', ST_SetSRID(ST_MakePoint(83.1943513, 17.9315806), 4326), 50);
    END IF;
    -- Insert Hotel Raani (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hotel Raani', ST_SetSRID(ST_MakePoint(83.3859836, 18.0836511), 4326), '{"H346, HTL RN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hotel Raani, Visakhapatnam', 'Hotel Raani  H346, HTL RN', ST_SetSRID(ST_MakePoint(83.3859836, 18.0836511), 4326), 10);
    END IF;
    -- Insert Visvam Healthcare Center (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Visvam Healthcare Center', ST_SetSRID(ST_MakePoint(83.2171766, 17.9582444), 4326), '{"V215, FSFM HL0KR SNTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Visvam Healthcare Center, Visakhapatnam', 'Visvam Healthcare Center  V215, FSFM HL0KR SNTR', ST_SetSRID(ST_MakePoint(83.2171766, 17.9582444), 4326), 50);
    END IF;
    -- Insert 99 The Royal Biryani House (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, '99 The Royal Biryani House', ST_SetSRID(ST_MakePoint(83.4074419, 18.0587809), 4326), '{"9364, 0 RYL BRYN HS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', '99 The Royal Biryani House, Visakhapatnam', '99 The Royal Biryani House  9364, 0 RYL BRYN HS', ST_SetSRID(ST_MakePoint(83.4074419, 18.0587809), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3363935, 18.0535482), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3363935, 18.0535482), 4326), 10);
    END IF;
    -- Insert Danasri Hotel (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Danasri Hotel', ST_SetSRID(ST_MakePoint(83.1854931, 17.9030512), 4326), '{"D526, TNSR HTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Danasri Hotel, Visakhapatnam', 'Danasri Hotel  D526, TNSR HTL', ST_SetSRID(ST_MakePoint(83.1854931, 17.9030512), 4326), 10);
    END IF;
    -- Insert Nawabs Biryani (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nawabs Biryani', ST_SetSRID(ST_MakePoint(83.3567741, 17.8240869), 4326), '{"N121, NWBS BRYN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nawabs Biryani, Visakhapatnam', 'Nawabs Biryani  N121, NWBS BRYN', ST_SetSRID(ST_MakePoint(83.3567741, 17.8240869), 4326), 10);
    END IF;
    -- Insert Treet Food Court (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Treet Food Court', ST_SetSRID(ST_MakePoint(83.3562356, 17.8252237), 4326), '{"T631, TRT FT KRT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Treet Food Court, Visakhapatnam', 'Treet Food Court  T631, TRT FT KRT', ST_SetSRID(ST_MakePoint(83.3562356, 17.8252237), 4326), 10);
    END IF;
    -- Insert Village Kitchen (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Village Kitchen', ST_SetSRID(ST_MakePoint(82.9756378, 17.597528), 4326), '{"FLJ KXN, V422"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Village Kitchen, Visakhapatnam', 'Village Kitchen  FLJ KXN, V422', ST_SetSRID(ST_MakePoint(82.9756378, 17.597528), 4326), 10);
    END IF;
    -- Insert ZPHS High School Atchutapuram (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ZPHS High School Atchutapuram', ST_SetSRID(ST_MakePoint(82.9780492, 17.5671463), 4326), '{"Z122, SFS H SXL AXTPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ZPHS High School Atchutapuram, Visakhapatnam', 'ZPHS High School Atchutapuram  Z122, SFS H SXL AXTPRM', ST_SetSRID(ST_MakePoint(82.9780492, 17.5671463), 4326), 50);
    END IF;
    -- Insert Indian Overseas Bank Atchutapuram (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Overseas Bank Atchutapuram', ST_SetSRID(ST_MakePoint(82.9787694, 17.5674106), 4326), '{"I535, INTN OFRSS BNK AXTPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Overseas Bank Atchutapuram, Visakhapatnam', 'Indian Overseas Bank Atchutapuram  I535, INTN OFRSS BNK AXTPRM', ST_SetSRID(ST_MakePoint(82.9787694, 17.5674106), 4326), 10);
    END IF;
    -- Insert DJ Dhaba (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'DJ Dhaba', ST_SetSRID(ST_MakePoint(83.2158726, 17.9510465), 4326), '{"TJ THB, D231"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'DJ Dhaba, Visakhapatnam', 'DJ Dhaba  TJ THB, D231', ST_SetSRID(ST_MakePoint(83.2158726, 17.9510465), 4326), 10);
    END IF;
    -- Insert Amogha (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amogha', ST_SetSRID(ST_MakePoint(83.40406, 18.0467871), 4326), '{"A520, AMKH"}', jsonb_build_object('te', 'అమొగా'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amogha, Visakhapatnam', 'Amogha అమొగా A520, AMKH', ST_SetSRID(ST_MakePoint(83.40406, 18.0467871), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.2938293, 18.0456262), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.2938293, 18.0456262), 4326), 10);
    END IF;
    -- Insert Srinivasa Hotel (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srinivasa Hotel', ST_SetSRID(ST_MakePoint(83.1855765, 17.8963585), 4326), '{"SRNFS HTL, S651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srinivasa Hotel, Visakhapatnam', 'Srinivasa Hotel  SRNFS HTL, S651', ST_SetSRID(ST_MakePoint(83.1855765, 17.8963585), 4326), 10);
    END IF;
    -- Insert The Capital Grill (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Capital Grill', ST_SetSRID(ST_MakePoint(83.1902331, 17.873521), 4326), '{"T213, 0 KPTL KRL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Capital Grill, Visakhapatnam', 'The Capital Grill  T213, 0 KPTL KRL', ST_SetSRID(ST_MakePoint(83.1902331, 17.873521), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.1963252, 17.8499761), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.1963252, 17.8499761), 4326), 10);
    END IF;
    -- Insert Bakasura Hotel (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bakasura Hotel', ST_SetSRID(ST_MakePoint(83.1979626, 17.8445308), 4326), '{"B226, BKSR HTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bakasura Hotel, Visakhapatnam', 'Bakasura Hotel  B226, BKSR HTL', ST_SetSRID(ST_MakePoint(83.1979626, 17.8445308), 4326), 10);
    END IF;
    -- Insert Alekhya Biryani (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Alekhya Biryani', ST_SetSRID(ST_MakePoint(83.2048884, 17.8218709), 4326), '{"A421, ALKHY BRYN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Alekhya Biryani, Visakhapatnam', 'Alekhya Biryani  A421, ALKHY BRYN', ST_SetSRID(ST_MakePoint(83.2048884, 17.8218709), 4326), 10);
    END IF;
    -- Insert Kanka Mahalaxmi Cooperative (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kanka Mahalaxmi Cooperative', ST_SetSRID(ST_MakePoint(83.2059576, 17.8197838), 4326), '{"K525, KNK MHLKSM KPRTF"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kanka Mahalaxmi Cooperative, Visakhapatnam', 'Kanka Mahalaxmi Cooperative  K525, KNK MHLKSM KPRTF', ST_SetSRID(ST_MakePoint(83.2059576, 17.8197838), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.2064043, 17.8177056), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.2064043, 17.8177056), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2107762, 17.7977463), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2107762, 17.7977463), 4326), 10);
    END IF;
    -- Insert MPP school (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'MPP school', ST_SetSRID(ST_MakePoint(83.2163785, 17.777915), 4326), '{"M124, MP SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'MPP school, Visakhapatnam', 'MPP school  M124, MP SXL', ST_SetSRID(ST_MakePoint(83.2163785, 17.777915), 4326), 50);
    END IF;
    -- Insert Visakhapatnam Cooperative Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Visakhapatnam Cooperative Bank', ST_SetSRID(ST_MakePoint(83.2181636, 17.7519994), 4326), '{"V221, FSKHPTNM KPRTF BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Visakhapatnam Cooperative Bank, Visakhapatnam', 'Visakhapatnam Cooperative Bank  V221, FSKHPTNM KPRTF BNK', ST_SetSRID(ST_MakePoint(83.2181636, 17.7519994), 4326), 10);
    END IF;
    -- Insert Axis Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Axis Bank', ST_SetSRID(ST_MakePoint(83.2248957, 17.7449734), 4326), '{"A221, AKSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Axis Bank, Visakhapatnam', 'Axis Bank  A221, AKSS BNK', ST_SetSRID(ST_MakePoint(83.2248957, 17.7449734), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2382736, 17.7421207), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2382736, 17.7421207), 4326), 10);
    END IF;
    -- Insert Federal Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Federal Bank', ST_SetSRID(ST_MakePoint(83.2381573, 17.7421467), 4326), '{"FTRL BNK, F364"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Federal Bank, Visakhapatnam', 'Federal Bank  FTRL BNK, F364', ST_SetSRID(ST_MakePoint(83.2381573, 17.7421467), 4326), 10);
    END IF;
    -- Insert Ravindra Bharathi School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ravindra Bharathi School', ST_SetSRID(ST_MakePoint(83.2096569, 17.79843), 4326), '{"R153, RFNTR BHR0 SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ravindra Bharathi School, Visakhapatnam', 'Ravindra Bharathi School  R153, RFNTR BHR0 SXL', ST_SetSRID(ST_MakePoint(83.2096569, 17.79843), 4326), 50);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.2088062, 17.8049159), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.2088062, 17.8049159), 4326), 10);
    END IF;
    -- Insert Karur Vysya Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karur Vysya Bank', ST_SetSRID(ST_MakePoint(83.2078775, 17.8082706), 4326), '{"K661, KRR FSY BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karur Vysya Bank, Visakhapatnam', 'Karur Vysya Bank  K661, KRR FSY BNK', ST_SetSRID(ST_MakePoint(83.2078775, 17.8082706), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.2591469, 17.7384348), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.2591469, 17.7384348), 4326), 10);
    END IF;
    -- Insert Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of India', ST_SetSRID(ST_MakePoint(83.2318057, 17.7438324), 4326), '{"BNK OF INT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of India, Visakhapatnam', 'Bank of India  BNK OF INT, B521', ST_SetSRID(ST_MakePoint(83.2318057, 17.7438324), 4326), 10);
    END IF;
    -- Insert Sri Chaitanya Techno School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Chaitanya Techno School', ST_SetSRID(ST_MakePoint(83.3287958, 17.7428792), 4326), '{"S623, SR XTNY TXN SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Chaitanya Techno School, Visakhapatnam', 'Sri Chaitanya Techno School  S623, SR XTNY TXN SXL', ST_SetSRID(ST_MakePoint(83.3287958, 17.7428792), 4326), 50);
    END IF;
    -- Insert Inspiiro (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Inspiiro', ST_SetSRID(ST_MakePoint(83.389795, 18.0710838), 4326), '{"I521, INSPR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Inspiiro, Visakhapatnam', 'Inspiiro  I521, INSPR', ST_SetSRID(ST_MakePoint(83.389795, 18.0710838), 4326), 50);
    END IF;
    -- Insert Kasturiba Gandi (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kasturiba Gandi', ST_SetSRID(ST_MakePoint(83.3275218, 18.0509155), 4326), '{"KSTRB KNT, K236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kasturiba Gandi, Visakhapatnam', 'Kasturiba Gandi  KSTRB KNT, K236', ST_SetSRID(ST_MakePoint(83.3275218, 18.0509155), 4326), 50);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2167274, 17.953006), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2167274, 17.953006), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.1874118, 17.8991473), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.1874118, 17.8991473), 4326), 10);
    END IF;
    -- Insert Centurion English Medium School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Centurion English Medium School', ST_SetSRID(ST_MakePoint(83.1955969, 17.9072453), 4326), '{"C536, SNTRN ENKLX MTM SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Centurion English Medium School, Visakhapatnam', 'Centurion English Medium School  C536, SNTRN ENKLX MTM SXL', ST_SetSRID(ST_MakePoint(83.1955969, 17.9072453), 4326), 50);
    END IF;
    -- Insert IndusInd Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IndusInd Bank', ST_SetSRID(ST_MakePoint(83.1905971, 17.9020785), 4326), '{"I532, INTSNT BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IndusInd Bank, Visakhapatnam', 'IndusInd Bank  I532, INTSNT BNK', ST_SetSRID(ST_MakePoint(83.1905971, 17.9020785), 4326), 10);
    END IF;
    -- Insert Karur Vysya Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karur Vysya Bank', ST_SetSRID(ST_MakePoint(83.1900164, 17.901545), 4326), '{"K661, KRR FSY BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karur Vysya Bank, Visakhapatnam', 'Karur Vysya Bank  K661, KRR FSY BNK', ST_SetSRID(ST_MakePoint(83.1900164, 17.901545), 4326), 10);
    END IF;
    -- Insert Axis Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Axis Bank', ST_SetSRID(ST_MakePoint(83.190174, 17.9017871), 4326), '{"A221, AKSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Axis Bank, Visakhapatnam', 'Axis Bank  A221, AKSS BNK', ST_SetSRID(ST_MakePoint(83.190174, 17.9017871), 4326), 10);
    END IF;
    -- Insert Vidya vikas (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vidya vikas', ST_SetSRID(ST_MakePoint(83.1876426, 17.8867958), 4326), '{"V312, FTY FKS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vidya vikas, Visakhapatnam', 'Vidya vikas  V312, FTY FKS', ST_SetSRID(ST_MakePoint(83.1876426, 17.8867958), 4326), 50);
    END IF;
    -- Insert KGN Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'KGN Restaurant', ST_SetSRID(ST_MakePoint(83.1878613, 17.8836904), 4326), '{"K562, KKN RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'KGN Restaurant, Visakhapatnam', 'KGN Restaurant  K562, KKN RSTRNT', ST_SetSRID(ST_MakePoint(83.1878613, 17.8836904), 4326), 10);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.1894091, 17.8779085), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.1894091, 17.8779085), 4326), 10);
    END IF;
    -- Insert Ambica Dhaba (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ambica Dhaba', ST_SetSRID(ST_MakePoint(83.1896285, 17.8748282), 4326), '{"AMBK THB, A512"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ambica Dhaba, Visakhapatnam', 'Ambica Dhaba  AMBK THB, A512', ST_SetSRID(ST_MakePoint(83.1896285, 17.8748282), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2088061, 17.8044525), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2088061, 17.8044525), 4326), 10);
    END IF;
    -- Insert Paakashala Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Paakashala Restaurant', ST_SetSRID(ST_MakePoint(83.2102647, 17.7998399), 4326), '{"PKXL RSTRNT, P224"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Paakashala Restaurant, Visakhapatnam', 'Paakashala Restaurant  PKXL RSTRNT, P224', ST_SetSRID(ST_MakePoint(83.2102647, 17.7998399), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.3058912, 17.7251977), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.3058912, 17.7251977), 4326), 10);
    END IF;
    -- Insert Donne Biryani House Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Donne Biryani House Restaurant', ST_SetSRID(ST_MakePoint(83.305777, 17.7249978), 4326), '{"D516, TN BRYN HS RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Donne Biryani House Restaurant, Visakhapatnam', 'Donne Biryani House Restaurant  D516, TN BRYN HS RSTRNT', ST_SetSRID(ST_MakePoint(83.305777, 17.7249978), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.3092599, 17.7237607), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.3092599, 17.7237607), 4326), 10);
    END IF;
    -- Insert Punjab National Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Punjab National Bank', ST_SetSRID(ST_MakePoint(83.3100375, 17.7239634), 4326), '{"PNJB NXNL BNK, P521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Punjab National Bank, Visakhapatnam', 'Punjab National Bank  PNJB NXNL BNK, P521', ST_SetSRID(ST_MakePoint(83.3100375, 17.7239634), 4326), 10);
    END IF;
    -- Insert Indian Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Bank', ST_SetSRID(ST_MakePoint(83.3109513, 17.7245633), 4326), '{"I535, INTN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Bank, Visakhapatnam', 'Indian Bank  I535, INTN BNK', ST_SetSRID(ST_MakePoint(83.3109513, 17.7245633), 4326), 10);
    END IF;
    -- Insert Amritsar Haveli (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amritsar Haveli', ST_SetSRID(ST_MakePoint(83.3099803, 17.7234725), 4326), '{"AMRTSR HFL, A563"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amritsar Haveli, Visakhapatnam', 'Amritsar Haveli  AMRTSR HFL, A563', ST_SetSRID(ST_MakePoint(83.3099803, 17.7234725), 4326), 10);
    END IF;
    -- Insert Biriyanis Lounge Restarant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Biriyanis Lounge Restarant', ST_SetSRID(ST_MakePoint(83.303254, 17.725587), 4326), '{"BRYNS LNJ RSTRNT, B652"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Biriyanis Lounge Restarant, Visakhapatnam', 'Biriyanis Lounge Restarant  BRYNS LNJ RSTRNT, B652', ST_SetSRID(ST_MakePoint(83.303254, 17.725587), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3181993, 17.7241807), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3181993, 17.7241807), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3089987, 17.7242399), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3089987, 17.7242399), 4326), 10);
    END IF;
    -- Insert Rajdhani Multi cuisine (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajdhani Multi cuisine', ST_SetSRID(ST_MakePoint(83.3032252, 17.7256929), 4326), '{"RJTHN MLT KSN, R235"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajdhani Multi cuisine, Visakhapatnam', 'Rajdhani Multi cuisine  RJTHN MLT KSN, R235', ST_SetSRID(ST_MakePoint(83.3032252, 17.7256929), 4326), 10);
    END IF;
    -- Insert Dr.Mohan''s Diabetes Specialities Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr.Mohan''s Diabetes Specialities Centre', ST_SetSRID(ST_MakePoint(83.3147147, 17.7251141), 4326), '{"TRMHNS TBTS SPXLTS SNTR, D655"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr.Mohan''s Diabetes Specialities Centre, Visakhapatnam', 'Dr.Mohan''s Diabetes Specialities Centre  TRMHNS TBTS SPXLTS SNTR, D655', ST_SetSRID(ST_MakePoint(83.3147147, 17.7251141), 4326), 50);
    END IF;
    -- Insert Majils Darbar (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Majils Darbar', ST_SetSRID(ST_MakePoint(83.3036875, 17.7256404), 4326), '{"M242, MJLS TRBR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Majils Darbar, Visakhapatnam', 'Majils Darbar  M242, MJLS TRBR', ST_SetSRID(ST_MakePoint(83.3036875, 17.7256404), 4326), 10);
    END IF;
    -- Insert The Invitation 365 (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Invitation 365', ST_SetSRID(ST_MakePoint(83.318478, 17.7240756), 4326), '{"0 INFTXN , T513"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Invitation 365, Visakhapatnam', 'The Invitation 365  0 INFTXN , T513', ST_SetSRID(ST_MakePoint(83.318478, 17.7240756), 4326), 10);
    END IF;
    -- Insert Kotak Mahindra Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotak Mahindra Bank', ST_SetSRID(ST_MakePoint(83.3142081, 17.7247653), 4326), '{"K325, KTK MHNTR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotak Mahindra Bank, Visakhapatnam', 'Kotak Mahindra Bank  K325, KTK MHNTR BNK', ST_SetSRID(ST_MakePoint(83.3142081, 17.7247653), 4326), 10);
    END IF;
    -- Insert The Invitation 365 (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Invitation 365', ST_SetSRID(ST_MakePoint(83.3182068, 17.723802), 4326), '{"0 INFTXN , T513"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Invitation 365, Visakhapatnam', 'The Invitation 365  0 INFTXN , T513', ST_SetSRID(ST_MakePoint(83.3182068, 17.723802), 4326), 10);
    END IF;
    -- Insert Tandoori Treats (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tandoori Treats', ST_SetSRID(ST_MakePoint(83.3167223, 17.7252861), 4326), '{"T536, TNTR TRTS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tandoori Treats, Visakhapatnam', 'Tandoori Treats  T536, TNTR TRTS', ST_SetSRID(ST_MakePoint(83.3167223, 17.7252861), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.3170989, 17.7253315), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.3170989, 17.7253315), 4326), 10);
    END IF;
    -- Insert Kotak Mahindra Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotak Mahindra Bank', ST_SetSRID(ST_MakePoint(83.3144677, 17.7247219), 4326), '{"K325, KTK MHNTR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotak Mahindra Bank, Visakhapatnam', 'Kotak Mahindra Bank  K325, KTK MHNTR BNK', ST_SetSRID(ST_MakePoint(83.3144677, 17.7247219), 4326), 10);
    END IF;
    -- Insert Kritunga (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kritunga', ST_SetSRID(ST_MakePoint(83.3039546, 17.7262237), 4326), '{"K635, KRTNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kritunga, Visakhapatnam', 'Kritunga  K635, KRTNK', ST_SetSRID(ST_MakePoint(83.3039546, 17.7262237), 4326), 10);
    END IF;
    -- Insert Sree Kamat (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sree Kamat', ST_SetSRID(ST_MakePoint(83.3039449, 17.726071), 4326), '{"S625, SR KMT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sree Kamat, Visakhapatnam', 'Sree Kamat  S625, SR KMT', ST_SetSRID(ST_MakePoint(83.3039449, 17.726071), 4326), 10);
    END IF;
    -- Insert Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of India', ST_SetSRID(ST_MakePoint(83.3049632, 17.7260709), 4326), '{"BNK OF INT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of India, Visakhapatnam', 'Bank of India  BNK OF INT, B521', ST_SetSRID(ST_MakePoint(83.3049632, 17.7260709), 4326), 10);
    END IF;
    -- Insert Sai Parlour Tiffins (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sai Parlour Tiffins', ST_SetSRID(ST_MakePoint(83.2173214, 17.766173), 4326), '{"S164, S PRLR TFNS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sai Parlour Tiffins, Visakhapatnam', 'Sai Parlour Tiffins  S164, S PRLR TFNS', ST_SetSRID(ST_MakePoint(83.2173214, 17.766173), 4326), 10);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.2172691, 17.7684152), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.2172691, 17.7684152), 4326), 10);
    END IF;
    -- Insert The Adavivaram Co - Operative Credit Society Ltd. (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Adavivaram Co - Operative Credit Society Ltd.', ST_SetSRID(ST_MakePoint(83.2167083, 17.7753172), 4326), '{"0 ATFFRM K OPRTF KRTT SST LTT, T311"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Adavivaram Co - Operative Credit Society Ltd., Visakhapatnam', 'The Adavivaram Co - Operative Credit Society Ltd.  0 ATFFRM K OPRTF KRTT SST LTT, T311', ST_SetSRID(ST_MakePoint(83.2167083, 17.7753172), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3037869, 17.7222242), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3037869, 17.7222242), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2775821, 17.7327775), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2775821, 17.7327775), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.2583852, 17.7386052), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.2583852, 17.7386052), 4326), 10);
    END IF;
    -- Insert Celebrations (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Celebrations', ST_SetSRID(ST_MakePoint(83.247516, 17.7406766), 4326), '{"C416, SLBRXNS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Celebrations, Visakhapatnam', 'Celebrations  C416, SLBRXNS', ST_SetSRID(ST_MakePoint(83.247516, 17.7406766), 4326), 10);
    END IF;
    -- Insert City Union Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'City Union Bank', ST_SetSRID(ST_MakePoint(83.2391825, 17.7418266), 4326), '{"ST UNN BNK, C355"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'City Union Bank, Visakhapatnam', 'City Union Bank  ST UNN BNK, C355', ST_SetSRID(ST_MakePoint(83.2391825, 17.7418266), 4326), 10);
    END IF;
    -- Insert Hotel Prabha (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hotel Prabha', ST_SetSRID(ST_MakePoint(83.2352378, 17.7431242), 4326), '{"HTL PRBH, H341"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hotel Prabha, Visakhapatnam', 'Hotel Prabha  HTL PRBH, H341', ST_SetSRID(ST_MakePoint(83.2352378, 17.7431242), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.2322712, 17.743739), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.2322712, 17.743739), 4326), 10);
    END IF;
    -- Insert Kanaka mahalaxmi Cooperative Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kanaka mahalaxmi Cooperative Bank', ST_SetSRID(ST_MakePoint(83.2282535, 17.74436), 4326), '{"K525, KNK MHLKSM KPRTF BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kanaka mahalaxmi Cooperative Bank, Visakhapatnam', 'Kanaka mahalaxmi Cooperative Bank  K525, KNK MHLKSM KPRTF BNK', ST_SetSRID(ST_MakePoint(83.2282535, 17.74436), 4326), 10);
    END IF;
    -- Insert Masaledaar Desi Rasoi (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Masaledaar Desi Rasoi', ST_SetSRID(ST_MakePoint(83.3036399, 17.7253366), 4326), '{"M243, MSLTR TS RS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Masaledaar Desi Rasoi, Visakhapatnam', 'Masaledaar Desi Rasoi  M243, MSLTR TS RS', ST_SetSRID(ST_MakePoint(83.3036399, 17.7253366), 4326), 10);
    END IF;
    -- Insert Absolute Barbecues (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Absolute Barbecues', ST_SetSRID(ST_MakePoint(83.3036774, 17.7254213), 4326), '{"A124, ABSLT BRBKS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Absolute Barbecues, Visakhapatnam', 'Absolute Barbecues  A124, ABSLT BRBKS', ST_SetSRID(ST_MakePoint(83.3036774, 17.7254213), 4326), 10);
    END IF;
    -- Insert Sai Ram Mess (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sai Ram Mess', ST_SetSRID(ST_MakePoint(83.185992, 17.8974314), 4326), '{"S655, S RM MS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sai Ram Mess, Visakhapatnam', 'Sai Ram Mess  S655, S RM MS', ST_SetSRID(ST_MakePoint(83.185992, 17.8974314), 4326), 10);
    END IF;
    -- Insert Babai Biryani (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Babai Biryani', ST_SetSRID(ST_MakePoint(83.307157, 17.73597), 4326), '{"B116, BB BRYN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Babai Biryani, Visakhapatnam', 'Babai Biryani  B116, BB BRYN', ST_SetSRID(ST_MakePoint(83.307157, 17.73597), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.2538537, 17.7448167), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.2538537, 17.7448167), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2537005, 17.7448841), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2537005, 17.7448841), 4326), 10);
    END IF;
    -- Insert Indian Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Bank', ST_SetSRID(ST_MakePoint(83.2059934, 17.7020392), 4326), '{"I535, INTN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Bank, Visakhapatnam', 'Indian Bank  I535, INTN BNK', ST_SetSRID(ST_MakePoint(83.2059934, 17.7020392), 4326), 10);
    END IF;
    -- Insert Karur Vysya Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karur Vysya Bank', ST_SetSRID(ST_MakePoint(83.2048993, 17.6872185), 4326), '{"K661, KRR FSY BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karur Vysya Bank, Visakhapatnam', 'Karur Vysya Bank  K661, KRR FSY BNK', ST_SetSRID(ST_MakePoint(83.2048993, 17.6872185), 4326), 10);
    END IF;
    -- Insert Hotel Alpha (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hotel Alpha', ST_SetSRID(ST_MakePoint(83.203902, 17.6850483), 4326), '{"HTL ALF, H344"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hotel Alpha, Visakhapatnam', 'Hotel Alpha  HTL ALF, H344', ST_SetSRID(ST_MakePoint(83.203902, 17.6850483), 4326), 10);
    END IF;
    -- Insert Kotak Mahindra Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotak Mahindra Bank', ST_SetSRID(ST_MakePoint(83.2032064, 17.6844933), 4326), '{"K325, KTK MHNTR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotak Mahindra Bank, Visakhapatnam', 'Kotak Mahindra Bank  K325, KTK MHNTR BNK', ST_SetSRID(ST_MakePoint(83.2032064, 17.6844933), 4326), 10);
    END IF;
    -- Insert Axis Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Axis Bank', ST_SetSRID(ST_MakePoint(83.1964277, 17.6831589), 4326), '{"A221, AKSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Axis Bank, Visakhapatnam', 'Axis Bank  A221, AKSS BNK', ST_SetSRID(ST_MakePoint(83.1964277, 17.6831589), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.1954276, 17.6829737), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.1954276, 17.6829737), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.1338896, 17.6881064), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.1338896, 17.6881064), 4326), 10);
    END IF;
    -- Insert Singh Bihar Dhaba (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Singh Bihar Dhaba', ST_SetSRID(ST_MakePoint(82.9493103, 17.6649566), 4326), '{"SN BHR THB, S521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Singh Bihar Dhaba, Visakhapatnam', 'Singh Bihar Dhaba  SN BHR THB, S521', ST_SetSRID(ST_MakePoint(82.9493103, 17.6649566), 4326), 10);
    END IF;
    -- Insert Punjabi Dhaba (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Punjabi Dhaba', ST_SetSRID(ST_MakePoint(82.9318987, 17.656068), 4326), '{"PNJB THB, P521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Punjabi Dhaba, Visakhapatnam', 'Punjabi Dhaba  PNJB THB, P521', ST_SetSRID(ST_MakePoint(82.9318987, 17.656068), 4326), 10);
    END IF;
    -- Insert A P Model School patipalli (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'A P Model School patipalli', ST_SetSRID(ST_MakePoint(83.0329025, 17.6364789), 4326), '{"A153, A P MTL SXL PTPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'A P Model School patipalli, Visakhapatnam', 'A P Model School patipalli  A153, A P MTL SXL PTPL', ST_SetSRID(ST_MakePoint(83.0329025, 17.6364789), 4326), 50);
    END IF;
    -- Insert Eaters Stop Restaurant 4th Town (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Eaters Stop Restaurant 4th Town', ST_SetSRID(ST_MakePoint(83.3041844, 17.7387366), 4326), '{"ETRS STP RSTRNT 0 TN, E362"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Eaters Stop Restaurant 4th Town, Visakhapatnam', 'Eaters Stop Restaurant 4th Town  ETRS STP RSTRNT 0 TN, E362', ST_SetSRID(ST_MakePoint(83.3041844, 17.7387366), 4326), 10);
    END IF;
    -- Insert Sri Viswa School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Viswa School', ST_SetSRID(ST_MakePoint(83.3058704, 17.739898), 4326), '{"SR FSW SXL, S612"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Viswa School, Visakhapatnam', 'Sri Viswa School  SR FSW SXL, S612', ST_SetSRID(ST_MakePoint(83.3058704, 17.739898), 4326), 50);
    END IF;
    -- Insert Coffee And Kitchen (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Coffee And Kitchen', ST_SetSRID(ST_MakePoint(83.3060877, 17.7417274), 4326), '{"KF ANT KXN, C153"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Coffee And Kitchen, Visakhapatnam', 'Coffee And Kitchen  KF ANT KXN, C153', ST_SetSRID(ST_MakePoint(83.3060877, 17.7417274), 4326), 10);
    END IF;
    -- Insert Abhiruchi Tiffin Center (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Abhiruchi Tiffin Center', ST_SetSRID(ST_MakePoint(83.3058933, 17.7417089), 4326), '{"A162, ABHRX TFN SNTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Abhiruchi Tiffin Center, Visakhapatnam', 'Abhiruchi Tiffin Center  A162, ABHRX TFN SNTR', ST_SetSRID(ST_MakePoint(83.3058933, 17.7417089), 4326), 10);
    END IF;
    -- Insert Nanak Bakery & Sweets (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nanak Bakery & Sweets', ST_SetSRID(ST_MakePoint(83.3080621, 17.7371558), 4326), '{"NNK BKR SWTS, N521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nanak Bakery & Sweets, Visakhapatnam', 'Nanak Bakery & Sweets  NNK BKR SWTS, N521', ST_SetSRID(ST_MakePoint(83.3080621, 17.7371558), 4326), 10);
    END IF;
    -- Insert Karur Vysya Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karur Vysya Bank', ST_SetSRID(ST_MakePoint(83.3094423, 17.7375378), 4326), '{"K661, KRR FSY BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karur Vysya Bank, Visakhapatnam', 'Karur Vysya Bank  K661, KRR FSY BNK', ST_SetSRID(ST_MakePoint(83.3094423, 17.7375378), 4326), 10);
    END IF;
    -- Insert B''treats (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'B''treats', ST_SetSRID(ST_MakePoint(83.3071621, 17.7422461), 4326), '{"B363, BTRTS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'B''treats, Visakhapatnam', 'B''treats  B363, BTRTS', ST_SetSRID(ST_MakePoint(83.3071621, 17.7422461), 4326), 10);
    END IF;
    -- Insert Kotak Mahindra Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotak Mahindra Bank', ST_SetSRID(ST_MakePoint(83.3076673, 17.7409506), 4326), '{"K325, KTK MHNTR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotak Mahindra Bank, Visakhapatnam', 'Kotak Mahindra Bank  K325, KTK MHNTR BNK', ST_SetSRID(ST_MakePoint(83.3076673, 17.7409506), 4326), 10);
    END IF;
    -- Insert New Deepak Punjabi Dhaba (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'New Deepak Punjabi Dhaba', ST_SetSRID(ST_MakePoint(83.3045788, 17.7357544), 4326), '{"N TPK PNJB THB, N312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'New Deepak Punjabi Dhaba, Visakhapatnam', 'New Deepak Punjabi Dhaba  N TPK PNJB THB, N312', ST_SetSRID(ST_MakePoint(83.3045788, 17.7357544), 4326), 10);
    END IF;
    -- Insert AMG Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'AMG Hospital', ST_SetSRID(ST_MakePoint(83.3118352, 17.7414668), 4326), '{"AMK HSPTL, A522"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'AMG Hospital, Visakhapatnam', 'AMG Hospital  AMK HSPTL, A522', ST_SetSRID(ST_MakePoint(83.3118352, 17.7414668), 4326), 50);
    END IF;
    -- Insert Real Deepak Punjab Dhaba (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Real Deepak Punjab Dhaba', ST_SetSRID(ST_MakePoint(83.3099326, 17.7378816), 4326), '{"RL TPK PNJB THB, R431"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Real Deepak Punjab Dhaba, Visakhapatnam', 'Real Deepak Punjab Dhaba  RL TPK PNJB THB, R431', ST_SetSRID(ST_MakePoint(83.3099326, 17.7378816), 4326), 10);
    END IF;
    -- Insert The Shawarma Co (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Shawarma Co', ST_SetSRID(ST_MakePoint(83.2997632, 17.7400837), 4326), '{"0 XWRM K, T265"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Shawarma Co, Visakhapatnam', 'The Shawarma Co  0 XWRM K, T265', ST_SetSRID(ST_MakePoint(83.2997632, 17.7400837), 4326), 10);
    END IF;
    -- Insert IndusInd Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IndusInd Bank', ST_SetSRID(ST_MakePoint(83.2997621, 17.7381952), 4326), '{"I532, INTSNT BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IndusInd Bank, Visakhapatnam', 'IndusInd Bank  I532, INTSNT BNK', ST_SetSRID(ST_MakePoint(83.2997621, 17.7381952), 4326), 10);
    END IF;
    -- Insert Moonlight Dhaba (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Moonlight Dhaba', ST_SetSRID(ST_MakePoint(82.9961301, 17.7248242), 4326), '{"M542, MNLT THB"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Moonlight Dhaba, Visakhapatnam', 'Moonlight Dhaba  M542, MNLT THB', ST_SetSRID(ST_MakePoint(82.9961301, 17.7248242), 4326), 10);
    END IF;
    -- Insert ZP High School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ZP High School', ST_SetSRID(ST_MakePoint(83.0145646, 17.7322705), 4326), '{"Z122, SP H SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ZP High School, Visakhapatnam', 'ZP High School  Z122, SP H SXL', ST_SetSRID(ST_MakePoint(83.0145646, 17.7322705), 4326), 50);
    END IF;
    -- Insert kailasagiri park (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'kailasagiri park', ST_SetSRID(ST_MakePoint(83.3403614, 17.7499266), 4326), '{"K422, KLSJR PRK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'kailasagiri park, Visakhapatnam', 'kailasagiri park  K422, KLSJR PRK', ST_SetSRID(ST_MakePoint(83.3403614, 17.7499266), 4326), 10);
    END IF;
    -- Insert Red Velvet (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Red Velvet', ST_SetSRID(ST_MakePoint(83.247286, 17.740738), 4326), '{"RT FLFT, R314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Red Velvet, Visakhapatnam', 'Red Velvet  RT FLFT, R314', ST_SetSRID(ST_MakePoint(83.247286, 17.740738), 4326), 10);
    END IF;
    -- Insert DBS Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'DBS Bank', ST_SetSRID(ST_MakePoint(83.2239122, 17.7454366), 4326), '{"D121, TBS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'DBS Bank, Visakhapatnam', 'DBS Bank  D121, TBS BNK', ST_SetSRID(ST_MakePoint(83.2239122, 17.7454366), 4326), 10);
    END IF;
    -- Insert Sri Vijaya Food Court (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Vijaya Food Court', ST_SetSRID(ST_MakePoint(83.4085572, 18.0614368), 4326), '{"SR FJY FT KRT, S612"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Vijaya Food Court, Visakhapatnam', 'Sri Vijaya Food Court  SR FJY FT KRT, S612', ST_SetSRID(ST_MakePoint(83.4085572, 18.0614368), 4326), 10);
    END IF;
    -- Insert South Indian Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'South Indian Bank', ST_SetSRID(ST_MakePoint(83.1900833, 17.9016285), 4326), '{"S353, S0 INTN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'South Indian Bank, Visakhapatnam', 'South Indian Bank  S353, S0 INTN BNK', ST_SetSRID(ST_MakePoint(83.1900833, 17.9016285), 4326), 10);
    END IF;
    -- Insert Children Multi Speciality Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Children Multi Speciality Hospital', ST_SetSRID(ST_MakePoint(83.1881834, 17.899753), 4326), '{"XLTRN MLT SPXLT HSPTL, C436"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Children Multi Speciality Hospital, Visakhapatnam', 'Children Multi Speciality Hospital  XLTRN MLT SPXLT HSPTL, C436', ST_SetSRID(ST_MakePoint(83.1881834, 17.899753), 4326), 50);
    END IF;
    -- Insert bucket biriyani (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'bucket biriyani', ST_SetSRID(ST_MakePoint(83.3114725, 17.727333), 4326), '{"BKT BRYN, B231"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'bucket biriyani, Visakhapatnam', 'bucket biriyani  BKT BRYN, B231', ST_SetSRID(ST_MakePoint(83.3114725, 17.727333), 4326), 10);
    END IF;
    -- Insert Tycoon (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tycoon', ST_SetSRID(ST_MakePoint(83.317058, 17.7254922), 4326), '{"T250, TKN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tycoon, Visakhapatnam', 'Tycoon  T250, TKN', ST_SetSRID(ST_MakePoint(83.317058, 17.7254922), 4326), 10);
    END IF;
    -- Insert Red Pepper (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Red Pepper', ST_SetSRID(ST_MakePoint(83.3130516, 17.7348593), 4326), '{"R311, RT PPR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Red Pepper, Visakhapatnam', 'Red Pepper  R311, RT PPR', ST_SetSRID(ST_MakePoint(83.3130516, 17.7348593), 4326), 10);
    END IF;
    -- Insert Dasarivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dasarivanipalem', ST_SetSRID(ST_MakePoint(83.1751951, 17.9099102), 4326), '{"D261, TSRFNPLM"}', jsonb_build_object('te', 'దాసరవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dasarivanipalem, Visakhapatnam', 'Dasarivanipalem దాసరవానిపాలెం D261, TSRFNPLM', ST_SetSRID(ST_MakePoint(83.1751951, 17.9099102), 4326), 40);
    END IF;
    -- Insert Madhura (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madhura', ST_SetSRID(ST_MakePoint(83.41704, 17.9195292), 4326), '{"M360, MTHR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madhura, Visakhapatnam', 'Madhura  M360, MTHR', ST_SetSRID(ST_MakePoint(83.41704, 17.9195292), 4326), 10);
    END IF;
    -- Insert Kamat (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kamat', ST_SetSRID(ST_MakePoint(83.3770966, 17.8834107), 4326), '{"K530, KMT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kamat, Visakhapatnam', 'Kamat  K530, KMT', ST_SetSRID(ST_MakePoint(83.3770966, 17.8834107), 4326), 10);
    END IF;
    -- Insert Food Plaza (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Food Plaza', ST_SetSRID(ST_MakePoint(83.3763233, 17.8819073), 4326), '{"FT PLS, F314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Food Plaza, Visakhapatnam', 'Food Plaza  FT PLS, F314', ST_SetSRID(ST_MakePoint(83.3763233, 17.8819073), 4326), 10);
    END IF;
    -- Insert Zeeshan (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Zeeshan', ST_SetSRID(ST_MakePoint(83.3528357, 17.8043638), 4326), '{"SXN, Z250"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Zeeshan, Visakhapatnam', 'Zeeshan  SXN, Z250', ST_SetSRID(ST_MakePoint(83.3528357, 17.8043638), 4326), 10);
    END IF;
    -- Insert Element E7 Restrobar (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Element E7 Restrobar', ST_SetSRID(ST_MakePoint(83.3530204, 17.8045659), 4326), '{"ELMNT E RSTRBR, E455"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Element E7 Restrobar, Visakhapatnam', 'Element E7 Restrobar  ELMNT E RSTRBR, E455', ST_SetSRID(ST_MakePoint(83.3530204, 17.8045659), 4326), 10);
    END IF;
    -- Insert Pizza Hut (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pizza Hut', ST_SetSRID(ST_MakePoint(83.3536058, 17.8025089), 4326), '{"P230, PS HT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pizza Hut, Visakhapatnam', 'Pizza Hut  P230, PS HT', ST_SetSRID(ST_MakePoint(83.3536058, 17.8025089), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3537099, 17.7954852), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3537099, 17.7954852), 4326), 10);
    END IF;
    -- Insert Somaa (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Somaa', ST_SetSRID(ST_MakePoint(83.3542709, 17.7782046), 4326), '{"SM, S500"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Somaa, Visakhapatnam', 'Somaa  SM, S500', ST_SetSRID(ST_MakePoint(83.3542709, 17.7782046), 4326), 10);
    END IF;
    -- Insert Medicover Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Medicover Hospitals', ST_SetSRID(ST_MakePoint(83.3318795, 17.7478206), 4326), '{"MTKFR HSPTLS, M321"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Medicover Hospitals, Visakhapatnam', 'Medicover Hospitals  MTKFR HSPTLS, M321', ST_SetSRID(ST_MakePoint(83.3318795, 17.7478206), 4326), 50);
    END IF;
    -- Insert Hotel Muntaj (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hotel Muntaj', ST_SetSRID(ST_MakePoint(83.3277855, 17.744045), 4326), '{"H345, HTL MNTJ"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hotel Muntaj, Visakhapatnam', 'Hotel Muntaj  H345, HTL MNTJ', ST_SetSRID(ST_MakePoint(83.3277855, 17.744045), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.3206723, 17.7354008), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.3206723, 17.7354008), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.3203947, 17.7350086), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.3203947, 17.7350086), 4326), 10);
    END IF;
    -- Insert Kritunga (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kritunga', ST_SetSRID(ST_MakePoint(83.3534138, 17.8020126), 4326), '{"K635, KRTNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kritunga, Visakhapatnam', 'Kritunga  K635, KRTNK', ST_SetSRID(ST_MakePoint(83.3534138, 17.8020126), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.35337, 17.8019538), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.35337, 17.8019538), 4326), 10);
    END IF;
    -- Insert Kanaka Mahalaxmi Co-operative Bank Ltd. (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kanaka Mahalaxmi Co-operative Bank Ltd.', ST_SetSRID(ST_MakePoint(83.3533642, 17.8020167), 4326), '{"KNK MHLKSM KPRTF BNK LTT, K525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kanaka Mahalaxmi Co-operative Bank Ltd., Visakhapatnam', 'Kanaka Mahalaxmi Co-operative Bank Ltd.  KNK MHLKSM KPRTF BNK LTT, K525', ST_SetSRID(ST_MakePoint(83.3533642, 17.8020167), 4326), 10);
    END IF;
    -- Insert Dr BR Ambedkar Gurukulam (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr BR Ambedkar Gurukulam', ST_SetSRID(ST_MakePoint(83.2812434, 17.7695657), 4326), '{"TR BR AMBTKR KRKLM, D616"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr BR Ambedkar Gurukulam, Visakhapatnam', 'Dr BR Ambedkar Gurukulam  TR BR AMBTKR KRKLM, D616', ST_SetSRID(ST_MakePoint(83.2812434, 17.7695657), 4326), 50);
    END IF;
    -- Insert Hotel Sitara Grand (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hotel Sitara Grand', ST_SetSRID(ST_MakePoint(83.2384029, 17.7712985), 4326), '{"HTL STR KRNT, H342"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hotel Sitara Grand, Visakhapatnam', 'Hotel Sitara Grand  HTL STR KRNT, H342', ST_SetSRID(ST_MakePoint(83.2384029, 17.7712985), 4326), 10);
    END IF;
    -- Insert IndusInd Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IndusInd Bank', ST_SetSRID(ST_MakePoint(83.2092008, 17.8033907), 4326), '{"I532, INTSNT BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IndusInd Bank, Visakhapatnam', 'IndusInd Bank  I532, INTSNT BNK', ST_SetSRID(ST_MakePoint(83.2092008, 17.8033907), 4326), 10);
    END IF;
    -- Insert Federal Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Federal Bank', ST_SetSRID(ST_MakePoint(83.2095148, 17.8023474), 4326), '{"FTRL BNK, F364"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Federal Bank, Visakhapatnam', 'Federal Bank  FTRL BNK, F364', ST_SetSRID(ST_MakePoint(83.2095148, 17.8023474), 4326), 10);
    END IF;
END $$;