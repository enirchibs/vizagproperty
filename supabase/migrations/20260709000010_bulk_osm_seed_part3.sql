-- BULK OSM DATA SEED PART 3
DO $$
DECLARE
    vzg_city_id UUID;
    new_loc_id UUID;
BEGIN
    SELECT id INTO vzg_city_id FROM geo.cities WHERE name = 'Visakhapatnam' LIMIT 1;
    -- Insert Gompa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gompa', ST_SetSRID(ST_MakePoint(82.8151411, 17.7446981), 4326), '{"KMP, G510"}', jsonb_build_object('te', 'గొంప'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gompa, Visakhapatnam', 'Gompa గొంప KMP, G510', ST_SetSRID(ST_MakePoint(82.8151411, 17.7446981), 4326), 40);
    END IF;
    -- Insert Pangidi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pangidi', ST_SetSRID(ST_MakePoint(82.8280407, 17.6971203), 4326), '{"PNJT, P523"}', jsonb_build_object('te', 'పంగిది'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pangidi, Visakhapatnam', 'Pangidi పంగిది PNJT, P523', ST_SetSRID(ST_MakePoint(82.8280407, 17.6971203), 4326), 40);
    END IF;
    -- Insert Rajupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajupalem', ST_SetSRID(ST_MakePoint(82.8185472, 17.7168519), 4326), '{"R214, RJPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajupalem, Visakhapatnam', 'Rajupalem  R214, RJPLM', ST_SetSRID(ST_MakePoint(82.8185472, 17.7168519), 4326), 40);
    END IF;
    -- Insert Chinnayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinnayyapalem', ST_SetSRID(ST_MakePoint(82.8403102, 17.7096648), 4326), '{"C514, XNYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinnayyapalem, Visakhapatnam', 'Chinnayyapalem  C514, XNYPLM', ST_SetSRID(ST_MakePoint(82.8403102, 17.7096648), 4326), 40);
    END IF;
    -- Insert Karaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karaka', ST_SetSRID(ST_MakePoint(82.8406439, 17.7241357), 4326), '{"K620, KRK"}', jsonb_build_object('te', 'కరక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karaka, Visakhapatnam', 'Karaka కరక K620, KRK', ST_SetSRID(ST_MakePoint(82.8406439, 17.7241357), 4326), 40);
    END IF;
    -- Insert Chitteyyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chitteyyapalem', ST_SetSRID(ST_MakePoint(82.8685495, 17.7405682), 4326), '{"XTYPLM, C314"}', jsonb_build_object('te', 'చిట్టియ్యపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chitteyyapalem, Visakhapatnam', 'Chitteyyapalem చిట్టియ్యపాలెం XTYPLM, C314', ST_SetSRID(ST_MakePoint(82.8685495, 17.7405682), 4326), 40);
    END IF;
    -- Insert Gokiradapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gokiradapalem', ST_SetSRID(ST_MakePoint(82.8727809, 17.6770622), 4326), '{"G263, KKRTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gokiradapalem, Visakhapatnam', 'Gokiradapalem  G263, KKRTPLM', ST_SetSRID(ST_MakePoint(82.8727809, 17.6770622), 4326), 40);
    END IF;
    -- Insert Addam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Addam', ST_SetSRID(ST_MakePoint(82.8448187, 17.6516015), 4326), '{"ATM, A350"}', jsonb_build_object('te', 'అడ్డాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Addam, Visakhapatnam', 'Addam అడ్డాం ATM, A350', ST_SetSRID(ST_MakePoint(82.8448187, 17.6516015), 4326), 40);
    END IF;
    -- Insert Achcherla (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Achcherla', ST_SetSRID(ST_MakePoint(82.855256, 17.6561188), 4326), '{"A264, AXXRL"}', jsonb_build_object('te', 'అచ్చెర్ల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Achcherla, Visakhapatnam', 'Achcherla అచ్చెర్ల A264, AXXRL', ST_SetSRID(ST_MakePoint(82.855256, 17.6561188), 4326), 40);
    END IF;
    -- Insert Kotta Achcherla (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Achcherla', ST_SetSRID(ST_MakePoint(82.863086, 17.6512428), 4326), '{"K326, KT AXXRL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Achcherla, Visakhapatnam', 'Kotta Achcherla  K326, KT AXXRL', ST_SetSRID(ST_MakePoint(82.863086, 17.6512428), 4326), 40);
    END IF;
    -- Insert Masahebupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Masahebupeta', ST_SetSRID(ST_MakePoint(82.859285, 17.6655683), 4326), '{"M211, MSHBPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Masahebupeta, Visakhapatnam', 'Masahebupeta  M211, MSHBPT', ST_SetSRID(ST_MakePoint(82.859285, 17.6655683), 4326), 40);
    END IF;
    -- Insert Chinna Bhimavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Bhimavaram', ST_SetSRID(ST_MakePoint(82.8904446, 17.6974238), 4326), '{"C515, XN BHMFRM"}', jsonb_build_object('te', 'ఆర్. భీమవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Bhimavaram, Visakhapatnam', 'Chinna Bhimavaram ఆర్. భీమవరం C515, XN BHMFRM', ST_SetSRID(ST_MakePoint(82.8904446, 17.6974238), 4326), 40);
    END IF;
    -- Insert Chinna Mallam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Mallam', ST_SetSRID(ST_MakePoint(82.8807964, 17.6847053), 4326), '{"XN MLM, C554"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Mallam, Visakhapatnam', 'Chinna Mallam  XN MLM, C554', ST_SetSRID(ST_MakePoint(82.8807964, 17.6847053), 4326), 40);
    END IF;
    -- Insert Mallam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mallam', ST_SetSRID(ST_MakePoint(82.8879299, 17.6849346), 4326), '{"MLM, M450"}', jsonb_build_object('te', 'మల్లాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mallam, Visakhapatnam', 'Mallam మల్లాం MLM, M450', ST_SetSRID(ST_MakePoint(82.8879299, 17.6849346), 4326), 40);
    END IF;
    -- Insert Venkannapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkannapalem', ST_SetSRID(ST_MakePoint(82.8898002, 17.7133947), 4326), '{"FNKNPLM, V525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkannapalem, Visakhapatnam', 'Venkannapalem  FNKNPLM, V525', ST_SetSRID(ST_MakePoint(82.8898002, 17.7133947), 4326), 40);
    END IF;
    -- Insert Bhupatipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhupatipalem', ST_SetSRID(ST_MakePoint(82.8810928, 17.6988036), 4326), '{"BHPTPLM, B131"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhupatipalem, Visakhapatnam', 'Bhupatipalem  BHPTPLM, B131', ST_SetSRID(ST_MakePoint(82.8810928, 17.6988036), 4326), 40);
    END IF;
    -- Insert Appampalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appampalem', ST_SetSRID(ST_MakePoint(82.8872978, 17.7042714), 4326), '{"A151, APMPLM"}', jsonb_build_object('te', 'అప్పంపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appampalem, Visakhapatnam', 'Appampalem అప్పంపాలెం A151, APMPLM', ST_SetSRID(ST_MakePoint(82.8872978, 17.7042714), 4326), 40);
    END IF;
    -- Insert Sampatipuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sampatipuram', ST_SetSRID(ST_MakePoint(82.9530843, 17.6832868), 4326), '{"SMPTPRM, S513"}', jsonb_build_object('te', 'సంపత్ పురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sampatipuram, Visakhapatnam', 'Sampatipuram సంపత్ పురం SMPTPRM, S513', ST_SetSRID(ST_MakePoint(82.9530843, 17.6832868), 4326), 40);
    END IF;
    -- Insert Venkupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkupalem', ST_SetSRID(ST_MakePoint(82.9381377, 17.6827008), 4326), '{"V521, FNKPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkupalem, Visakhapatnam', 'Venkupalem  V521, FNKPLM', ST_SetSRID(ST_MakePoint(82.9381377, 17.6827008), 4326), 40);
    END IF;
    -- Insert Vissannapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vissannapeta', ST_SetSRID(ST_MakePoint(82.9351818, 17.6771599), 4326), '{"V251, FSNPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vissannapeta, Visakhapatnam', 'Vissannapeta  V251, FSNPT', ST_SetSRID(ST_MakePoint(82.9351818, 17.6771599), 4326), 40);
    END IF;
    -- Insert Urmalada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Urmalada', ST_SetSRID(ST_MakePoint(82.9952579, 17.6750103), 4326), '{"U654, URMLT"}', jsonb_build_object('te', 'ఉమ్మలడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Urmalada, Visakhapatnam', 'Urmalada ఉమ్మలడ U654, URMLT', ST_SetSRID(ST_MakePoint(82.9952579, 17.6750103), 4326), 40);
    END IF;
    -- Insert Kotturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(82.9892707, 17.6846208), 4326), '{"K360, KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu  K360, KTR', ST_SetSRID(ST_MakePoint(82.9892707, 17.6846208), 4326), 40);
    END IF;
    -- Insert Pishinikada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pishinikada', ST_SetSRID(ST_MakePoint(82.9794116, 17.6781846), 4326), '{"P252, PXNKT"}', jsonb_build_object('te', 'పిసినిగాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pishinikada, Visakhapatnam', 'Pishinikada పిసినిగాడ P252, PXNKT', ST_SetSRID(ST_MakePoint(82.9794116, 17.6781846), 4326), 40);
    END IF;
    -- Insert Satyanarayanapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Satyanarayanapuram', ST_SetSRID(ST_MakePoint(82.988389, 17.6917554), 4326), '{"STYNRYNPRM, S356"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Satyanarayanapuram, Visakhapatnam', 'Satyanarayanapuram  STYNRYNPRM, S356', ST_SetSRID(ST_MakePoint(82.988389, 17.6917554), 4326), 40);
    END IF;
    -- Insert Mudapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mudapeta', ST_SetSRID(ST_MakePoint(82.9919048, 17.6978353), 4326), '{"M313, MTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mudapeta, Visakhapatnam', 'Mudapeta  M313, MTPT', ST_SetSRID(ST_MakePoint(82.9919048, 17.6978353), 4326), 40);
    END IF;
    -- Insert Sundarayyapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sundarayyapeta', ST_SetSRID(ST_MakePoint(82.9646613, 17.7066099), 4326), '{"SNTRYPT, S536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sundarayyapeta, Visakhapatnam', 'Sundarayyapeta  SNTRYPT, S536', ST_SetSRID(ST_MakePoint(82.9646613, 17.7066099), 4326), 40);
    END IF;
    -- Insert Vetajangalipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vetajangalipalem', ST_SetSRID(ST_MakePoint(82.9491834, 17.7011223), 4326), '{"FTJNKLPLM, V325"}', jsonb_build_object('te', 'వేటజంగాలపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vetajangalipalem, Visakhapatnam', 'Vetajangalipalem వేటజంగాలపాలెం FTJNKLPLM, V325', ST_SetSRID(ST_MakePoint(82.9491834, 17.7011223), 4326), 40);
    END IF;
    -- Insert Aithampudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aithampudi', ST_SetSRID(ST_MakePoint(82.8599977, 17.7814571), 4326), '{"A0MPT, A351"}', jsonb_build_object('te', 'అయితంపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aithampudi, Visakhapatnam', 'Aithampudi అయితంపూడి A0MPT, A351', ST_SetSRID(ST_MakePoint(82.8599977, 17.7814571), 4326), 40);
    END IF;
    -- Insert Gollalapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(82.8415655, 17.7913287), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem  KLLPLM, G441', ST_SetSRID(ST_MakePoint(82.8415655, 17.7913287), 4326), 10);
    END IF;
    -- Insert Ayyarkapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ayyarkapalem', ST_SetSRID(ST_MakePoint(82.8337948, 17.7923016), 4326), '{"A621, AYRKPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ayyarkapalem, Visakhapatnam', 'Ayyarkapalem  A621, AYRKPLM', ST_SetSRID(ST_MakePoint(82.8337948, 17.7923016), 4326), 10);
    END IF;
    -- Insert Kondapalem Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondapalem Agraharam', ST_SetSRID(ST_MakePoint(82.8497484, 17.7882315), 4326), '{"KNTPLM AKRHRM, K531"}', jsonb_build_object('te', 'కొండపాలెం అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondapalem Agraharam, Visakhapatnam', 'Kondapalem Agraharam కొండపాలెం అగ్రహారం KNTPLM AKRHRM, K531', ST_SetSRID(ST_MakePoint(82.8497484, 17.7882315), 4326), 40);
    END IF;
    -- Insert Gollalapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(82.8634928, 17.7889031), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem  KLLPLM, G441', ST_SetSRID(ST_MakePoint(82.8634928, 17.7889031), 4326), 10);
    END IF;
    -- Insert Gunnempudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gunnempudi', ST_SetSRID(ST_MakePoint(82.8315508, 17.7630688), 4326), '{"KNMPT, G551"}', jsonb_build_object('te', 'గున్నెంపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gunnempudi, Visakhapatnam', 'Gunnempudi గున్నెంపూడి KNMPT, G551', ST_SetSRID(ST_MakePoint(82.8315508, 17.7630688), 4326), 40);
    END IF;
    -- Insert Pedda Madina (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Madina', ST_SetSRID(ST_MakePoint(82.8636849, 17.7662861), 4326), '{"P353, PT MTN"}', jsonb_build_object('te', 'పెద మదీనా'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Madina, Visakhapatnam', 'Pedda Madina పెద మదీనా P353, PT MTN', ST_SetSRID(ST_MakePoint(82.8636849, 17.7662861), 4326), 40);
    END IF;
    -- Insert China Madina (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'China Madina', ST_SetSRID(ST_MakePoint(82.8619763, 17.7553385), 4326), '{"XN MTN, C553"}', jsonb_build_object('te', 'చిన మదీనా'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'China Madina, Visakhapatnam', 'China Madina చిన మదీనా XN MTN, C553', ST_SetSRID(ST_MakePoint(82.8619763, 17.7553385), 4326), 40);
    END IF;
    -- Insert Kondapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondapalem', ST_SetSRID(ST_MakePoint(82.8490071, 17.7743045), 4326), '{"K531, KNTPLM"}', jsonb_build_object('te', 'కొండపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondapalem, Visakhapatnam', 'Kondapalem కొండపాలెం K531, KNTPLM', ST_SetSRID(ST_MakePoint(82.8490071, 17.7743045), 4326), 40);
    END IF;
    -- Insert Jannavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jannavaram', ST_SetSRID(ST_MakePoint(82.9163841, 17.7881906), 4326), '{"JNFRM, J516"}', jsonb_build_object('te', 'జన్నవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jannavaram, Visakhapatnam', 'Jannavaram జన్నవరం JNFRM, J516', ST_SetSRID(ST_MakePoint(82.9163841, 17.7881906), 4326), 40);
    END IF;
    -- Insert Kotturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(82.9107518, 17.7780767), 4326), '{"K360, KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu  K360, KTR', ST_SetSRID(ST_MakePoint(82.9107518, 17.7780767), 4326), 40);
    END IF;
    -- Insert Upparagudem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Upparagudem', ST_SetSRID(ST_MakePoint(82.8754542, 17.7638788), 4326), '{"U162, UPRKTM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Upparagudem, Visakhapatnam', 'Upparagudem  U162, UPRKTM', ST_SetSRID(ST_MakePoint(82.8754542, 17.7638788), 4326), 40);
    END IF;
    -- Insert Kottavuru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottavuru', ST_SetSRID(ST_MakePoint(82.888334, 17.7754506), 4326), '{"K316, KTFR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottavuru, Visakhapatnam', 'Kottavuru  K316, KTFR', ST_SetSRID(ST_MakePoint(82.888334, 17.7754506), 4326), 40);
    END IF;
    -- Insert Butchayyapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Butchayyapeta', ST_SetSRID(ST_MakePoint(82.8786685, 17.7862448), 4326), '{"BXYPT, B321"}', jsonb_build_object('te', 'బుచ్చెయ్యపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Butchayyapeta, Visakhapatnam', 'Butchayyapeta బుచ్చెయ్యపేట BXYPT, B321', ST_SetSRID(ST_MakePoint(82.8786685, 17.7862448), 4326), 40);
    END IF;
    -- Insert Kondapudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondapudi', ST_SetSRID(ST_MakePoint(82.8960378, 17.7753161), 4326), '{"KNTPT, K531"}', jsonb_build_object('te', 'కందిపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondapudi, Visakhapatnam', 'Kondapudi కందిపూడి KNTPT, K531', ST_SetSRID(ST_MakePoint(82.8960378, 17.7753161), 4326), 40);
    END IF;
    -- Insert Timmanapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Timmanapalem', ST_SetSRID(ST_MakePoint(82.9085174, 17.7719561), 4326), '{"TMNPLM, T551"}', jsonb_build_object('te', 'తిమ్మన్నపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Timmanapalem, Visakhapatnam', 'Timmanapalem తిమ్మన్నపాలెం TMNPLM, T551', ST_SetSRID(ST_MakePoint(82.9085174, 17.7719561), 4326), 40);
    END IF;
    -- Insert Ramayogipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramayogipalem', ST_SetSRID(ST_MakePoint(82.92809, 17.76909), 4326), '{"RMYJPLM, R521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramayogipalem, Visakhapatnam', 'Ramayogipalem  RMYJPLM, R521', ST_SetSRID(ST_MakePoint(82.92809, 17.76909), 4326), 40);
    END IF;
    -- Insert Sakipalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sakipalle', ST_SetSRID(ST_MakePoint(82.9318701, 17.7695197), 4326), '{"S214, SKPL"}', jsonb_build_object('te', 'చాకిపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sakipalle, Visakhapatnam', 'Sakipalle చాకిపల్లి S214, SKPL', ST_SetSRID(ST_MakePoint(82.9318701, 17.7695197), 4326), 40);
    END IF;
    -- Insert Mettapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mettapalem', ST_SetSRID(ST_MakePoint(82.9207667, 17.7533474), 4326), '{"M314, MTPLM"}', jsonb_build_object('te', 'మెట్టపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mettapalem, Visakhapatnam', 'Mettapalem మెట్టపాలెం M314, MTPLM', ST_SetSRID(ST_MakePoint(82.9207667, 17.7533474), 4326), 40);
    END IF;
    -- Insert Kannampalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kannampalem', ST_SetSRID(ST_MakePoint(82.9204723, 17.7633022), 4326), '{"KNMPLM, K551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kannampalem, Visakhapatnam', 'Kannampalem  KNMPLM, K551', ST_SetSRID(ST_MakePoint(82.9204723, 17.7633022), 4326), 40);
    END IF;
    -- Insert Nilakanthapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nilakanthapuram', ST_SetSRID(ST_MakePoint(82.904361, 17.7457487), 4326), '{"N425, NLKN0PRM"}', jsonb_build_object('te', 'నీలకంఠాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nilakanthapuram, Visakhapatnam', 'Nilakanthapuram నీలకంఠాపురం N425, NLKN0PRM', ST_SetSRID(ST_MakePoint(82.904361, 17.7457487), 4326), 40);
    END IF;
    -- Insert Taipuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Taipuram', ST_SetSRID(ST_MakePoint(82.8847149, 17.7451544), 4326), '{"TPRM, T165"}', jsonb_build_object('te', 'తయిపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Taipuram, Visakhapatnam', 'Taipuram తయిపురం TPRM, T165', ST_SetSRID(ST_MakePoint(82.8847149, 17.7451544), 4326), 40);
    END IF;
    -- Insert Jagannathapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jagannathapuram', ST_SetSRID(ST_MakePoint(82.9310419, 17.7527989), 4326), '{"JKN0PRM, J253"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jagannathapuram, Visakhapatnam', 'Jagannathapuram  JKN0PRM, J253', ST_SetSRID(ST_MakePoint(82.9310419, 17.7527989), 4326), 40);
    END IF;
    -- Insert Bhimavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhimavaram', ST_SetSRID(ST_MakePoint(82.9059452, 17.7174982), 4326), '{"BHMFRM, B516"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhimavaram, Visakhapatnam', 'Bhimavaram  BHMFRM, B516', ST_SetSRID(ST_MakePoint(82.9059452, 17.7174982), 4326), 40);
    END IF;
    -- Insert Kunchangi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kunchangi', ST_SetSRID(ST_MakePoint(82.9442494, 17.7265461), 4326), '{"K525, KNXNJ"}', jsonb_build_object('te', 'కుంచంగి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kunchangi, Visakhapatnam', 'Kunchangi కుంచంగి K525, KNXNJ', ST_SetSRID(ST_MakePoint(82.9442494, 17.7265461), 4326), 40);
    END IF;
    -- Insert Kundram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kundram', ST_SetSRID(ST_MakePoint(82.9174703, 17.7241954), 4326), '{"K536, KNTRM"}', jsonb_build_object('te', 'కూండ్రం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kundram, Visakhapatnam', 'Kundram కూండ్రం K536, KNTRM', ST_SetSRID(ST_MakePoint(82.9174703, 17.7241954), 4326), 40);
    END IF;
    -- Insert Rongalavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rongalavanipalem', ST_SetSRID(ST_MakePoint(82.9348333, 17.7265755), 4326), '{"R524, RNKLFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rongalavanipalem, Visakhapatnam', 'Rongalavanipalem  R524, RNKLFNPLM', ST_SetSRID(ST_MakePoint(82.9348333, 17.7265755), 4326), 40);
    END IF;
    -- Insert Mandipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mandipalem', ST_SetSRID(ST_MakePoint(82.9530207, 17.7120351), 4326), '{"MNTPLM, M531"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mandipalem, Visakhapatnam', 'Mandipalem  MNTPLM, M531', ST_SetSRID(ST_MakePoint(82.9530207, 17.7120351), 4326), 40);
    END IF;
    -- Insert Chinna Uppalam (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Uppalam', ST_SetSRID(ST_MakePoint(82.8296595, 17.4079155), 4326), '{"C514, XN UPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Uppalam, Visakhapatnam', 'Chinna Uppalam  C514, XN UPLM', ST_SetSRID(ST_MakePoint(82.8296595, 17.4079155), 4326), 10);
    END IF;
    -- Insert Vakapadu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vakapadu', ST_SetSRID(ST_MakePoint(82.8482397, 17.4402058), 4326), '{"V213, FKPT"}', jsonb_build_object('te', 'వాకపాడు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vakapadu, Visakhapatnam', 'Vakapadu వాకపాడు V213, FKPT', ST_SetSRID(ST_MakePoint(82.8482397, 17.4402058), 4326), 40);
    END IF;
    -- Insert Pittalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pittalapalem', ST_SetSRID(ST_MakePoint(82.824202, 17.4336561), 4326), '{"PTLPLM, P341"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pittalapalem, Visakhapatnam', 'Pittalapalem  PTLPLM, P341', ST_SetSRID(ST_MakePoint(82.824202, 17.4336561), 4326), 40);
    END IF;
    -- Insert Sarvasiddi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sarvasiddi', ST_SetSRID(ST_MakePoint(82.8315371, 17.4692221), 4326), '{"SRFST, S612"}', jsonb_build_object('te', 'సర్వసిద్ది'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sarvasiddi, Visakhapatnam', 'Sarvasiddi సర్వసిద్ది SRFST, S612', ST_SetSRID(ST_MakePoint(82.8315371, 17.4692221), 4326), 40);
    END IF;
    -- Insert Sarvasiddhi Rayavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sarvasiddhi Rayavaram', ST_SetSRID(ST_MakePoint(82.8050475, 17.4540577), 4326), '{"SRFSTH RYFRM, S612"}', jsonb_build_object('te', 'యస్. రాయవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sarvasiddhi Rayavaram, Visakhapatnam', 'Sarvasiddhi Rayavaram యస్. రాయవరం SRFSTH RYFRM, S612', ST_SetSRID(ST_MakePoint(82.8050475, 17.4540577), 4326), 40);
    END IF;
    -- Insert Upparapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Upparapalli', ST_SetSRID(ST_MakePoint(82.8293915, 17.449866), 4326), '{"UPRPL, U161"}', jsonb_build_object('te', 'ఉప్పరపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Upparapalli, Visakhapatnam', 'Upparapalli ఉప్పరపల్లి UPRPL, U161', ST_SetSRID(ST_MakePoint(82.8293915, 17.449866), 4326), 40);
    END IF;
    -- Insert Lingarajupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lingarajupalem', ST_SetSRID(ST_MakePoint(82.8109309, 17.4418779), 4326), '{"LNKRJPLM, L526"}', jsonb_build_object('te', 'లింగరాజుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lingarajupalem, Visakhapatnam', 'Lingarajupalem లింగరాజుపాలెం LNKRJPLM, L526', ST_SetSRID(ST_MakePoint(82.8109309, 17.4418779), 4326), 40);
    END IF;
    -- Insert Venkatapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkatapuram', ST_SetSRID(ST_MakePoint(82.8280171, 17.4398173), 4326), '{"V523, FNKTPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkatapuram, Visakhapatnam', 'Venkatapuram  V523, FNKTPRM', ST_SetSRID(ST_MakePoint(82.8280171, 17.4398173), 4326), 40);
    END IF;
    -- Insert Karrivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karrivanipalem', ST_SetSRID(ST_MakePoint(82.8226809, 17.4399247), 4326), '{"K615, KRFNPLM"}', jsonb_build_object('te', 'కర్రివానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karrivanipalem, Visakhapatnam', 'Karrivanipalem కర్రివానిపాలెం K615, KRFNPLM', ST_SetSRID(ST_MakePoint(82.8226809, 17.4399247), 4326), 40);
    END IF;
    -- Insert Saitarupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Saitarupeta', ST_SetSRID(ST_MakePoint(82.8375665, 17.4844237), 4326), '{"S361, STRPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Saitarupeta, Visakhapatnam', 'Saitarupeta  S361, STRPT', ST_SetSRID(ST_MakePoint(82.8375665, 17.4844237), 4326), 40);
    END IF;
    -- Insert Petasudipuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Petasudipuram', ST_SetSRID(ST_MakePoint(82.8204873, 17.4760653), 4326), '{"P323, PTSTPRM"}', jsonb_build_object('te', 'పేటసూదిపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Petasudipuram, Visakhapatnam', 'Petasudipuram పేటసూదిపురం P323, PTSTPRM', ST_SetSRID(ST_MakePoint(82.8204873, 17.4760653), 4326), 40);
    END IF;
    -- Insert Vemagiri (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vemagiri', ST_SetSRID(ST_MakePoint(82.8253145, 17.48842), 4326), '{"V526, FMJR"}', jsonb_build_object('te', 'వేమగిరి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vemagiri, Visakhapatnam', 'Vemagiri వేమగిరి V526, FMJR', ST_SetSRID(ST_MakePoint(82.8253145, 17.48842), 4326), 40);
    END IF;
    -- Insert Jnguluru Velamapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jnguluru Velamapalem', ST_SetSRID(ST_MakePoint(82.8390664, 17.5008897), 4326), '{"JNKLR FLMPLM, J524"}', jsonb_build_object('te', 'జంగులూరువేలంపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jnguluru Velamapalem, Visakhapatnam', 'Jnguluru Velamapalem జంగులూరువేలంపాలెం JNKLR FLMPLM, J524', ST_SetSRID(ST_MakePoint(82.8390664, 17.5008897), 4326), 40);
    END IF;
    -- Insert Velamapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Velamapalem', ST_SetSRID(ST_MakePoint(82.8460967, 17.5215003), 4326), '{"FLMPLM, V451"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Velamapalem, Visakhapatnam', 'Velamapalem  FLMPLM, V451', ST_SetSRID(ST_MakePoint(82.8460967, 17.5215003), 4326), 40);
    END IF;
    -- Insert Kattupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kattupalem', ST_SetSRID(ST_MakePoint(82.8836465, 17.5430022), 4326), '{"KTPLM, K314"}', jsonb_build_object('te', 'కట్టుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kattupalem, Visakhapatnam', 'Kattupalem కట్టుపాలెం KTPLM, K314', ST_SetSRID(ST_MakePoint(82.8836465, 17.5430022), 4326), 40);
    END IF;
    -- Insert Kallapalli Kampalu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kallapalli Kampalu', ST_SetSRID(ST_MakePoint(82.8846439, 17.5394297), 4326), '{"KLPL KMPL, K414"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kallapalli Kampalu, Visakhapatnam', 'Kallapalli Kampalu  KLPL KMPL, K414', ST_SetSRID(ST_MakePoint(82.8846439, 17.5394297), 4326), 40);
    END IF;
    -- Insert Kottapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottapalem', ST_SetSRID(ST_MakePoint(82.8793525, 17.5495855), 4326), '{"KTPLM, K314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottapalem, Visakhapatnam', 'Kottapalem  KTPLM, K314', ST_SetSRID(ST_MakePoint(82.8793525, 17.5495855), 4326), 40);
    END IF;
    -- Insert Gokivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gokivada', ST_SetSRID(ST_MakePoint(82.9053008, 17.5504418), 4326), '{"G213, KKFT"}', jsonb_build_object('te', 'గోకివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gokivada, Visakhapatnam', 'Gokivada గోకివాడ G213, KKFT', ST_SetSRID(ST_MakePoint(82.9053008, 17.5504418), 4326), 40);
    END IF;
    -- Insert Mamidivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mamidivada', ST_SetSRID(ST_MakePoint(82.8945509, 17.5281016), 4326), '{"MMTFT, M531"}', jsonb_build_object('te', 'మామిడివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mamidivada, Visakhapatnam', 'Mamidivada మామిడివాడ MMTFT, M531', ST_SetSRID(ST_MakePoint(82.8945509, 17.5281016), 4326), 40);
    END IF;
    -- Insert Kotturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(82.9012973, 17.525143), 4326), '{"K360, KTR"}', jsonb_build_object('te', 'కొత్తూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu కొత్తూరు K360, KTR', ST_SetSRID(ST_MakePoint(82.9012973, 17.525143), 4326), 40);
    END IF;
    -- Insert Narayanapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narayanapalem', ST_SetSRID(ST_MakePoint(82.88177, 17.534923), 4326), '{"N651, NRYNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narayanapalem, Visakhapatnam', 'Narayanapalem  N651, NRYNPLM', ST_SetSRID(ST_MakePoint(82.88177, 17.534923), 4326), 40);
    END IF;
    -- Insert Teruvupalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Teruvupalle', ST_SetSRID(ST_MakePoint(82.8737781, 17.5197674), 4326), '{"T611, TRFPL"}', jsonb_build_object('te', 'తెరువుపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Teruvupalle, Visakhapatnam', 'Teruvupalle తెరువుపల్లి T611, TRFPL', ST_SetSRID(ST_MakePoint(82.8737781, 17.5197674), 4326), 40);
    END IF;
    -- Insert Dimili (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dimili', ST_SetSRID(ST_MakePoint(82.8724133, 17.5120663), 4326), '{"TML, D540"}', jsonb_build_object('te', 'దిమిలి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dimili, Visakhapatnam', 'Dimili దిమిలి TML, D540', ST_SetSRID(ST_MakePoint(82.8724133, 17.5120663), 4326), 40);
    END IF;
    -- Insert Malapalle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Malapalle', ST_SetSRID(ST_MakePoint(82.8743851, 17.5226898), 4326), '{"M414, MLPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Malapalle, Visakhapatnam', 'Malapalle  M414, MLPL', ST_SetSRID(ST_MakePoint(82.8743851, 17.5226898), 4326), 10);
    END IF;
    -- Insert Kumarapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kumarapalle', ST_SetSRID(ST_MakePoint(82.8920249, 17.4976907), 4326), '{"K561, KMRPL"}', jsonb_build_object('te', 'కుమారపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kumarapalle, Visakhapatnam', 'Kumarapalle కుమారపల్లి K561, KMRPL', ST_SetSRID(ST_MakePoint(82.8920249, 17.4976907), 4326), 40);
    END IF;
    -- Insert Murakada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Murakada', ST_SetSRID(ST_MakePoint(82.8758714, 17.4977608), 4326), '{"MRKT, M623"}', jsonb_build_object('te', 'మురకడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Murakada, Visakhapatnam', 'Murakada మురకడ MRKT, M623', ST_SetSRID(ST_MakePoint(82.8758714, 17.4977608), 4326), 40);
    END IF;
    -- Insert Marripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marripalem', ST_SetSRID(ST_MakePoint(82.8744986, 17.483669), 4326), '{"MRPLM, M614"}', jsonb_build_object('te', 'మర్రిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marripalem, Visakhapatnam', 'Marripalem మర్రిపాలెం MRPLM, M614', ST_SetSRID(ST_MakePoint(82.8744986, 17.483669), 4326), 40);
    END IF;
    -- Insert Malapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Malapalli', ST_SetSRID(ST_MakePoint(82.8872279, 17.499584), 4326), '{"M414, MLPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Malapalli, Visakhapatnam', 'Malapalli  M414, MLPL', ST_SetSRID(ST_MakePoint(82.8872279, 17.499584), 4326), 40);
    END IF;
    -- Insert Kottubulu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottubulu', ST_SetSRID(ST_MakePoint(82.8732873, 17.5054536), 4326), '{"KTBL, K314"}', jsonb_build_object('te', 'కట్టబోలు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottubulu, Visakhapatnam', 'Kottubulu కట్టబోలు KTBL, K314', ST_SetSRID(ST_MakePoint(82.8732873, 17.5054536), 4326), 40);
    END IF;
    -- Insert Zirayati Chintuva (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Zirayati Chintuva', ST_SetSRID(ST_MakePoint(82.9531792, 17.478683), 4326), '{"SRYT XNTF, Z632"}', jsonb_build_object('te', 'జిరయతి చింతువ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Zirayati Chintuva, Visakhapatnam', 'Zirayati Chintuva జిరయతి చింతువ SRYT XNTF, Z632', ST_SetSRID(ST_MakePoint(82.9531792, 17.478683), 4326), 10);
    END IF;
    -- Insert Kalvalapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kalvalapalli', ST_SetSRID(ST_MakePoint(82.9130454, 17.4795858), 4326), '{"KLFLPL, K414"}', jsonb_build_object('te', 'కలవలపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kalvalapalli, Visakhapatnam', 'Kalvalapalli కలవలపల్లి KLFLPL, K414', ST_SetSRID(ST_MakePoint(82.9130454, 17.4795858), 4326), 40);
    END IF;
    -- Insert Boddivanilova (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boddivanilova', ST_SetSRID(ST_MakePoint(82.8971937, 17.4784611), 4326), '{"B315, BTFNLF"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boddivanilova, Visakhapatnam', 'Boddivanilova  B315, BTFNLF', ST_SetSRID(ST_MakePoint(82.8971937, 17.4784611), 4326), 40);
    END IF;
    -- Insert Vada Narsapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vada Narsapuram', ST_SetSRID(ST_MakePoint(82.9103236, 17.4453781), 4326), '{"V356, FT NRSPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vada Narsapuram, Visakhapatnam', 'Vada Narsapuram  V356, FT NRSPRM', ST_SetSRID(ST_MakePoint(82.9103236, 17.4453781), 4326), 40);
    END IF;
    -- Insert Yata Kottapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yata Kottapalem', ST_SetSRID(ST_MakePoint(82.8999893, 17.4402961), 4326), '{"Y323, YT KTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yata Kottapalem, Visakhapatnam', 'Yata Kottapalem  Y323, YT KTPLM', ST_SetSRID(ST_MakePoint(82.8999893, 17.4402961), 4326), 40);
    END IF;
    -- Insert Koppagondapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Koppagondapalem', ST_SetSRID(ST_MakePoint(82.9054732, 17.4623708), 4326), '{"K125, KPKNTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Koppagondapalem, Visakhapatnam', 'Koppagondapalem  K125, KPKNTPLM', ST_SetSRID(ST_MakePoint(82.9054732, 17.4623708), 4326), 40);
    END IF;
    -- Insert Govindapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Govindapalem', ST_SetSRID(ST_MakePoint(82.9173777, 17.4559248), 4326), '{"G153, KFNTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Govindapalem, Visakhapatnam', 'Govindapalem  G153, KFNTPLM', ST_SetSRID(ST_MakePoint(82.9173777, 17.4559248), 4326), 40);
    END IF;
    -- Insert Kottapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottapeta', ST_SetSRID(ST_MakePoint(82.9106226, 17.4595285), 4326), '{"K313, KTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottapeta, Visakhapatnam', 'Kottapeta  K313, KTPT', ST_SetSRID(ST_MakePoint(82.9106226, 17.4595285), 4326), 40);
    END IF;
    -- Insert Vadapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vadapalem', ST_SetSRID(ST_MakePoint(82.9269776, 17.4542179), 4326), '{"FTPLM, V314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vadapalem, Visakhapatnam', 'Vadapalem  FTPLM, V314', ST_SetSRID(ST_MakePoint(82.9269776, 17.4542179), 4326), 40);
    END IF;
    -- Insert Chinna Kalvalapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Kalvalapalli', ST_SetSRID(ST_MakePoint(82.909611, 17.4619304), 4326), '{"XN KLFLPL, C524"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Kalvalapalli, Visakhapatnam', 'Chinna Kalvalapalli  XN KLFLPL, C524', ST_SetSRID(ST_MakePoint(82.909611, 17.4619304), 4326), 40);
    END IF;
    -- Insert Kondavaripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondavaripalem', ST_SetSRID(ST_MakePoint(82.9397649, 17.478253), 4326), '{"K531, KNTFRPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondavaripalem, Visakhapatnam', 'Kondavaripalem  K531, KNTFRPLM', ST_SetSRID(ST_MakePoint(82.9397649, 17.478253), 4326), 40);
    END IF;
    -- Insert Vijayaramapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijayaramapalem', ST_SetSRID(ST_MakePoint(82.9352239, 17.492914), 4326), '{"FJYRMPLM, V265"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijayaramapalem, Visakhapatnam', 'Vijayaramapalem  FJYRMPLM, V265', ST_SetSRID(ST_MakePoint(82.9352239, 17.492914), 4326), 40);
    END IF;
    -- Insert Appannapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appannapalem', ST_SetSRID(ST_MakePoint(82.9407587, 17.4894524), 4326), '{"A151, APNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appannapalem, Visakhapatnam', 'Appannapalem  A151, APNPLM', ST_SetSRID(ST_MakePoint(82.9407587, 17.4894524), 4326), 40);
    END IF;
    -- Insert Velchuru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Velchuru', ST_SetSRID(ST_MakePoint(82.9242644, 17.4928866), 4326), '{"FLXR, V426"}', jsonb_build_object('te', 'వేల్చూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Velchuru, Visakhapatnam', 'Velchuru వేల్చూరు FLXR, V426', ST_SetSRID(ST_MakePoint(82.9242644, 17.4928866), 4326), 40);
    END IF;
    -- Insert Gajireddipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gajireddipalem', ST_SetSRID(ST_MakePoint(82.9534311, 17.4695159), 4326), '{"G263, KJRTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gajireddipalem, Visakhapatnam', 'Gajireddipalem  G263, KJRTPLM', ST_SetSRID(ST_MakePoint(82.9534311, 17.4695159), 4326), 40);
    END IF;
    -- Insert Venkayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkayyapalem', ST_SetSRID(ST_MakePoint(82.9527195, 17.4642656), 4326), '{"V521, FNKYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkayyapalem, Visakhapatnam', 'Venkayyapalem  V521, FNKYPLM', ST_SetSRID(ST_MakePoint(82.9527195, 17.4642656), 4326), 40);
    END IF;
    -- Insert Rambilli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rambilli', ST_SetSRID(ST_MakePoint(82.9285851, 17.4654942), 4326), '{"RMBL, R514"}', jsonb_build_object('te', 'రాంబిల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rambilli, Visakhapatnam', 'Rambilli రాంబిల్లి RMBL, R514', ST_SetSRID(ST_MakePoint(82.9285851, 17.4654942), 4326), 40);
    END IF;
    -- Insert Kondaladevunipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondaladevunipalem', ST_SetSRID(ST_MakePoint(82.9372684, 17.4671841), 4326), '{"KNTLTFNPLM, K534"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondaladevunipalem, Visakhapatnam', 'Kondaladevunipalem  KNTLTFNPLM, K534', ST_SetSRID(ST_MakePoint(82.9372684, 17.4671841), 4326), 40);
    END IF;
    -- Insert Krishnampalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Krishnampalem', ST_SetSRID(ST_MakePoint(82.9443076, 17.5050764), 4326), '{"K625, KRXNMPLM"}', jsonb_build_object('te', 'కృష్ణంపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Krishnampalem, Visakhapatnam', 'Krishnampalem కృష్ణంపాలెం K625, KRXNMPLM', ST_SetSRID(ST_MakePoint(82.9443076, 17.5050764), 4326), 40);
    END IF;
    -- Insert Dharpalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dharpalem', ST_SetSRID(ST_MakePoint(82.9250214, 17.534994), 4326), '{"THRPLM, D614"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dharpalem, Visakhapatnam', 'Dharpalem  THRPLM, D614', ST_SetSRID(ST_MakePoint(82.9250214, 17.534994), 4326), 40);
    END IF;
    -- Insert Bhogapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhogapuram', ST_SetSRID(ST_MakePoint(82.9305842, 17.5365689), 4326), '{"BHKPRM, B216"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhogapuram, Visakhapatnam', 'Bhogapuram  BHKPRM, B216', ST_SetSRID(ST_MakePoint(82.9305842, 17.5365689), 4326), 40);
    END IF;
    -- Insert Petlapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Petlapalem', ST_SetSRID(ST_MakePoint(82.9477404, 17.5239844), 4326), '{"PTLPLM, P341"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Petlapalem, Visakhapatnam', 'Petlapalem  PTLPLM, P341', ST_SetSRID(ST_MakePoint(82.9477404, 17.5239844), 4326), 40);
    END IF;
    -- Insert Gorle Dharmavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gorle Dharmavaram', ST_SetSRID(ST_MakePoint(82.9506358, 17.5499495), 4326), '{"KRL THRMFRM, G643"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gorle Dharmavaram, Visakhapatnam', 'Gorle Dharmavaram  KRL THRMFRM, G643', ST_SetSRID(ST_MakePoint(82.9506358, 17.5499495), 4326), 40);
    END IF;
    -- Insert Panchadarla (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Panchadarla', ST_SetSRID(ST_MakePoint(82.9183005, 17.5288269), 4326), '{"PNXTRL, P523"}', jsonb_build_object('te', 'పంచదార్ల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Panchadarla, Visakhapatnam', 'Panchadarla పంచదార్ల PNXTRL, P523', ST_SetSRID(ST_MakePoint(82.9183005, 17.5288269), 4326), 40);
    END IF;
    -- Insert Haripuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Haripuram', ST_SetSRID(ST_MakePoint(82.9404561, 17.5362317), 4326), '{"HRPRM, H616"}', jsonb_build_object('te', 'హరిపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Haripuram, Visakhapatnam', 'Haripuram హరిపురం HRPRM, H616', ST_SetSRID(ST_MakePoint(82.9404561, 17.5362317), 4326), 40);
    END IF;
    -- Insert Lanka Dharmavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lanka Dharmavaram', ST_SetSRID(ST_MakePoint(82.9496078, 17.5360529), 4326), '{"L523, LNK THRMFRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lanka Dharmavaram, Visakhapatnam', 'Lanka Dharmavaram  L523, LNK THRMFRM', ST_SetSRID(ST_MakePoint(82.9496078, 17.5360529), 4326), 40);
    END IF;
    -- Insert Apparayudupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Apparayudupalem', ST_SetSRID(ST_MakePoint(82.9320855, 17.5301428), 4326), '{"APRYTPLM, A163"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Apparayudupalem, Visakhapatnam', 'Apparayudupalem  APRYTPLM, A163', ST_SetSRID(ST_MakePoint(82.9320855, 17.5301428), 4326), 40);
    END IF;
    -- Insert Rajakoduru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajakoduru', ST_SetSRID(ST_MakePoint(82.9302413, 17.5120957), 4326), '{"RJKTR, R223"}', jsonb_build_object('te', 'రాజకోడూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajakoduru, Visakhapatnam', 'Rajakoduru రాజకోడూరు RJKTR, R223', ST_SetSRID(ST_MakePoint(82.9302413, 17.5120957), 4326), 40);
    END IF;
    -- Insert Dibbapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dibbapalem', ST_SetSRID(ST_MakePoint(82.952001, 17.516473), 4326), '{"D114, TBPLM"}', jsonb_build_object('te', 'దిబ్బపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dibbapalem, Visakhapatnam', 'Dibbapalem దిబ్బపాలెం D114, TBPLM', ST_SetSRID(ST_MakePoint(82.952001, 17.516473), 4326), 40);
    END IF;
    -- Insert Jangalaplem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jangalaplem', ST_SetSRID(ST_MakePoint(82.9460147, 17.5297906), 4326), '{"JNKLPLM, J524"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jangalaplem, Visakhapatnam', 'Jangalaplem  JNKLPLM, J524', ST_SetSRID(ST_MakePoint(82.9460147, 17.5297906), 4326), 40);
    END IF;
    -- Insert Gorle Dharmavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gorle Dharmavaram', ST_SetSRID(ST_MakePoint(82.9578635, 17.5454134), 4326), '{"KRL THRMFRM, G643"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gorle Dharmavaram, Visakhapatnam', 'Gorle Dharmavaram  KRL THRMFRM, G643', ST_SetSRID(ST_MakePoint(82.9578635, 17.5454134), 4326), 40);
    END IF;
    -- Insert Duppituru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Duppituru', ST_SetSRID(ST_MakePoint(82.9798978, 17.5343157), 4326), '{"TPTR, D136"}', jsonb_build_object('te', 'దుప్పిటూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Duppituru, Visakhapatnam', 'Duppituru దుప్పిటూరు TPTR, D136', ST_SetSRID(ST_MakePoint(82.9798978, 17.5343157), 4326), 40);
    END IF;
    -- Insert Veduruvada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Veduruvada', ST_SetSRID(ST_MakePoint(82.9651428, 17.541378), 4326), '{"FTRFT, V361"}', jsonb_build_object('te', 'వెదురువాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Veduruvada, Visakhapatnam', 'Veduruvada వెదురువాడ FTRFT, V361', ST_SetSRID(ST_MakePoint(82.9651428, 17.541378), 4326), 40);
    END IF;
    -- Insert Kumarupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kumarupalem', ST_SetSRID(ST_MakePoint(82.988891, 17.5414167), 4326), '{"K561, KMRPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kumarupalem, Visakhapatnam', 'Kumarupalem  K561, KMRPLM', ST_SetSRID(ST_MakePoint(82.988891, 17.5414167), 4326), 40);
    END IF;
    -- Insert Maratur (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maratur', ST_SetSRID(ST_MakePoint(82.9629028, 17.537184), 4326), '{"M636, MRTR"}', jsonb_build_object('te', 'మారుటూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maratur, Visakhapatnam', 'Maratur మారుటూరు M636, MRTR', ST_SetSRID(ST_MakePoint(82.9629028, 17.537184), 4326), 40);
    END IF;
    -- Insert Chinnapudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinnapudi', ST_SetSRID(ST_MakePoint(83.0020936, 17.5137058), 4326), '{"XNPT, C513"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinnapudi, Visakhapatnam', 'Chinnapudi  XNPT, C513', ST_SetSRID(ST_MakePoint(83.0020936, 17.5137058), 4326), 40);
    END IF;
    -- Insert Uddapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Uddapalem', ST_SetSRID(ST_MakePoint(83.0021089, 17.5254053), 4326), '{"U314, UTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Uddapalem, Visakhapatnam', 'Uddapalem  U314, UTPLM', ST_SetSRID(ST_MakePoint(83.0021089, 17.5254053), 4326), 40);
    END IF;
    -- Insert Tallapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tallapalem', ST_SetSRID(ST_MakePoint(83.011124, 17.5232311), 4326), '{"T414, TLPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tallapalem, Visakhapatnam', 'Tallapalem  T414, TLPLM', ST_SetSRID(ST_MakePoint(83.011124, 17.5232311), 4326), 40);
    END IF;
    -- Insert Chaitanya Public School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chaitanya Public School', ST_SetSRID(ST_MakePoint(83.132655, 17.6574107), 4326), '{"C351, XTNY PBLK SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chaitanya Public School, Visakhapatnam', 'Chaitanya Public School  C351, XTNY PBLK SXL', ST_SetSRID(ST_MakePoint(83.132655, 17.6574107), 4326), 50);
    END IF;
    -- Insert Delhi Public School Visakhapatnam (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Delhi Public School Visakhapatnam', ST_SetSRID(ST_MakePoint(83.1360611, 17.653747), 4326), '{"TLH PBLK SXL FSKHPTNM, D411"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Delhi Public School Visakhapatnam, Visakhapatnam', 'Delhi Public School Visakhapatnam  TLH PBLK SXL FSKHPTNM, D411', ST_SetSRID(ST_MakePoint(83.1360611, 17.653747), 4326), 50);
    END IF;
    -- Insert Gangavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gangavaram', ST_SetSRID(ST_MakePoint(83.1338366, 17.7193543), 4326), '{"KNKFRM, G521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gangavaram, Visakhapatnam', 'Gangavaram  KNKFRM, G521', ST_SetSRID(ST_MakePoint(83.1338366, 17.7193543), 4326), 40);
    END IF;
    -- Insert Vedurlanarava (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vedurlanarava', ST_SetSRID(ST_MakePoint(83.1410081, 17.722643), 4326), '{"V364, FTRLNRF"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vedurlanarava, Visakhapatnam', 'Vedurlanarava  V364, FTRLNRF', ST_SetSRID(ST_MakePoint(83.1410081, 17.722643), 4326), 40);
    END IF;
    -- Insert Settivanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Settivanipalem', ST_SetSRID(ST_MakePoint(83.1254641, 17.7338941), 4326), '{"STFNPLM, S315"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Settivanipalem, Visakhapatnam', 'Settivanipalem  STFNPLM, S315', ST_SetSRID(ST_MakePoint(83.1254641, 17.7338941), 4326), 10);
    END IF;
    -- Insert Kotturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(83.1464965, 17.7144902), 4326), '{"K360, KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu  K360, KTR', ST_SetSRID(ST_MakePoint(83.1464965, 17.7144902), 4326), 40);
    END IF;
    -- Insert Mangalipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mangalipalem', ST_SetSRID(ST_MakePoint(83.1416352, 17.7063581), 4326), '{"MNKLPLM, M524"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mangalipalem, Visakhapatnam', 'Mangalipalem  MNKLPLM, M524', ST_SetSRID(ST_MakePoint(83.1416352, 17.7063581), 4326), 40);
    END IF;
    -- Insert Etapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Etapalem', ST_SetSRID(ST_MakePoint(83.1549437, 17.6952144), 4326), '{"E314, ETPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Etapalem, Visakhapatnam', 'Etapalem  E314, ETPLM', ST_SetSRID(ST_MakePoint(83.1549437, 17.6952144), 4326), 40);
    END IF;
    -- Insert Satram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Satram', ST_SetSRID(ST_MakePoint(83.1294108, 17.6909871), 4326), '{"S365, STRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Satram, Visakhapatnam', 'Satram  S365, STRM', ST_SetSRID(ST_MakePoint(83.1294108, 17.6909871), 4326), 60);
    END IF;
    -- Insert Lakkarajupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lakkarajupalem', ST_SetSRID(ST_MakePoint(83.1460949, 17.693523), 4326), '{"LKRJPLM, L262"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lakkarajupalem, Visakhapatnam', 'Lakkarajupalem  LKRJPLM, L262', ST_SetSRID(ST_MakePoint(83.1460949, 17.693523), 4326), 40);
    END IF;
    -- Insert Erravanipalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Erravanipalem', ST_SetSRID(ST_MakePoint(83.1412986, 17.6857832), 4326), '{"E615, ERFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Erravanipalem, Visakhapatnam', 'Erravanipalem  E615, ERFNPLM', ST_SetSRID(ST_MakePoint(83.1412986, 17.6857832), 4326), 60);
    END IF;
    -- Insert Aganampudi (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aganampudi', ST_SetSRID(ST_MakePoint(83.1354763, 17.6860122), 4326), '{"AKNMPT, A255"}', jsonb_build_object('te', 'అగనంపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aganampudi, Visakhapatnam', 'Aganampudi అగనంపూడి AKNMPT, A255', ST_SetSRID(ST_MakePoint(83.1354763, 17.6860122), 4326), 80);
    END IF;
    -- Insert Talarivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Talarivanipalem', ST_SetSRID(ST_MakePoint(83.1386701, 17.696001), 4326), '{"TLRFNPLM, T461"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Talarivanipalem, Visakhapatnam', 'Talarivanipalem  TLRFNPLM, T461', ST_SetSRID(ST_MakePoint(83.1386701, 17.696001), 4326), 40);
    END IF;
    -- Insert Pedda Mushidivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Mushidivada', ST_SetSRID(ST_MakePoint(83.100851, 17.7182123), 4326), '{"P352, PT MXTFT"}', jsonb_build_object('te', 'పెదముసిడివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Mushidivada, Visakhapatnam', 'Pedda Mushidivada పెదముసిడివాడ P352, PT MXTFT', ST_SetSRID(ST_MakePoint(83.100851, 17.7182123), 4326), 40);
    END IF;
    -- Insert Marripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marripalem', ST_SetSRID(ST_MakePoint(83.1188343, 17.7052143), 4326), '{"MRPLM, M614"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marripalem, Visakhapatnam', 'Marripalem  MRPLM, M614', ST_SetSRID(ST_MakePoint(83.1188343, 17.7052143), 4326), 40);
    END IF;
    -- Insert Kannuru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kannuru', ST_SetSRID(ST_MakePoint(83.0988726, 17.7035717), 4326), '{"K560, KNR"}', jsonb_build_object('te', 'కన్నూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kannuru, Visakhapatnam', 'Kannuru కన్నూరు K560, KNR', ST_SetSRID(ST_MakePoint(83.0988726, 17.7035717), 4326), 40);
    END IF;
    -- Insert Gannuvanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gannuvanipalem', ST_SetSRID(ST_MakePoint(83.0784978, 17.6960913), 4326), '{"KNFNPLM, G515"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gannuvanipalem, Visakhapatnam', 'Gannuvanipalem  KNFNPLM, G515', ST_SetSRID(ST_MakePoint(83.0784978, 17.6960913), 4326), 40);
    END IF;
    -- Insert Mantripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mantripalem', ST_SetSRID(ST_MakePoint(83.0930273, 17.6968248), 4326), '{"M536, MNTRPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mantripalem, Visakhapatnam', 'Mantripalem  M536, MNTRPLM', ST_SetSRID(ST_MakePoint(83.0930273, 17.6968248), 4326), 40);
    END IF;
    -- Insert Maredupudi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maredupudi', ST_SetSRID(ST_MakePoint(83.0800618, 17.7011962), 4326), '{"MRTPT, M631"}', jsonb_build_object('te', 'మారేడుపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maredupudi, Visakhapatnam', 'Maredupudi మారేడుపూడి MRTPT, M631', ST_SetSRID(ST_MakePoint(83.0800618, 17.7011962), 4326), 10);
    END IF;
    -- Insert Mamidivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mamidivanipalem', ST_SetSRID(ST_MakePoint(83.0837118, 17.7087596), 4326), '{"M531, MMTFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mamidivanipalem, Visakhapatnam', 'Mamidivanipalem  M531, MMTFNPLM', ST_SetSRID(ST_MakePoint(83.0837118, 17.7087596), 4326), 40);
    END IF;
    -- Insert Madakapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madakapalem', ST_SetSRID(ST_MakePoint(83.0856591, 17.7054952), 4326), '{"MTKPLM, M321"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madakapalem, Visakhapatnam', 'Madakapalem  MTKPLM, M321', ST_SetSRID(ST_MakePoint(83.0856591, 17.7054952), 4326), 40);
    END IF;
    -- Insert Siramasettivanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Siramasettivanipalem', ST_SetSRID(ST_MakePoint(83.0803873, 17.7117561), 4326), '{"SRMSTFNPLM, S652"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Siramasettivanipalem, Visakhapatnam', 'Siramasettivanipalem  SRMSTFNPLM, S652', ST_SetSRID(ST_MakePoint(83.0803873, 17.7117561), 4326), 10);
    END IF;
    -- Insert Pitapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pitapalem', ST_SetSRID(ST_MakePoint(83.0955709, 17.7372314), 4326), '{"PTPLM, P314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pitapalem, Visakhapatnam', 'Pitapalem  PTPLM, P314', ST_SetSRID(ST_MakePoint(83.0955709, 17.7372314), 4326), 40);
    END IF;
    -- Insert Gannevanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gannevanipalem', ST_SetSRID(ST_MakePoint(83.0990853, 17.728522), 4326), '{"KNFNPLM, G515"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gannevanipalem, Visakhapatnam', 'Gannevanipalem  KNFNPLM, G515', ST_SetSRID(ST_MakePoint(83.0990853, 17.728522), 4326), 40);
    END IF;
    -- Insert Kotta Akkireddipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Akkireddipalem', ST_SetSRID(ST_MakePoint(83.0711644, 17.7125782), 4326), '{"KT AKRTPLM, K326"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Akkireddipalem, Visakhapatnam', 'Kotta Akkireddipalem  KT AKRTPLM, K326', ST_SetSRID(ST_MakePoint(83.0711644, 17.7125782), 4326), 40);
    END IF;
    -- Insert Pata Talarivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Talarivanipalem', ST_SetSRID(ST_MakePoint(83.0584254, 17.7159798), 4326), '{"P334, PT TLRFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Talarivanipalem, Visakhapatnam', 'Pata Talarivanipalem  P334, PT TLRFNPLM', ST_SetSRID(ST_MakePoint(83.0584254, 17.7159798), 4326), 40);
    END IF;
    -- Insert Gopalapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gopalapuram', ST_SetSRID(ST_MakePoint(83.0682808, 17.7208461), 4326), '{"KPLPRM, G141"}', jsonb_build_object('te', 'గోపాలపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gopalapuram, Visakhapatnam', 'Gopalapuram గోపాలపురం KPLPRM, G141', ST_SetSRID(ST_MakePoint(83.0682808, 17.7208461), 4326), 40);
    END IF;
    -- Insert Venkataramanapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkataramanapeta', ST_SetSRID(ST_MakePoint(83.0654342, 17.7082223), 4326), '{"V523, FNKTRMNPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkataramanapeta, Visakhapatnam', 'Venkataramanapeta  V523, FNKTRMNPT', ST_SetSRID(ST_MakePoint(83.0654342, 17.7082223), 4326), 40);
    END IF;
    -- Insert Koppaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Koppaka', ST_SetSRID(ST_MakePoint(83.0471836, 17.6974536), 4326), '{"K120, KPK"}', jsonb_build_object('te', 'కొప్పాక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Koppaka, Visakhapatnam', 'Koppaka కొప్పాక K120, KPK', ST_SetSRID(ST_MakePoint(83.0471836, 17.6974536), 4326), 40);
    END IF;
    -- Insert Kotta Talarivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Talarivanipalem', ST_SetSRID(ST_MakePoint(83.0574881, 17.7059129), 4326), '{"K334, KT TLRFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Talarivanipalem, Visakhapatnam', 'Kotta Talarivanipalem  K334, KT TLRFNPLM', ST_SetSRID(ST_MakePoint(83.0574881, 17.7059129), 4326), 40);
    END IF;
    -- Insert Bhatlapudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhatlapudi', ST_SetSRID(ST_MakePoint(83.0429654, 17.7077826), 4326), '{"B341, BHTLPT"}', jsonb_build_object('te', 'భట్లపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhatlapudi, Visakhapatnam', 'Bhatlapudi భట్లపూడి B341, BHTLPT', ST_SetSRID(ST_MakePoint(83.0429654, 17.7077826), 4326), 40);
    END IF;
    -- Insert Golagam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Golagam', ST_SetSRID(ST_MakePoint(83.0458326, 17.7116341), 4326), '{"G425, KLKM"}', jsonb_build_object('te', 'గొలగాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Golagam, Visakhapatnam', 'Golagam గొలగాం G425, KLKM', ST_SetSRID(ST_MakePoint(83.0458326, 17.7116341), 4326), 40);
    END IF;
    -- Insert Harijanapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Harijanapeta', ST_SetSRID(ST_MakePoint(83.0341673, 17.7126652), 4326), '{"HRJNPT, H625"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Harijanapeta, Visakhapatnam', 'Harijanapeta  HRJNPT, H625', ST_SetSRID(ST_MakePoint(83.0341673, 17.7126652), 4326), 40);
    END IF;
    -- Insert Aripaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aripaka', ST_SetSRID(ST_MakePoint(83.074711, 17.7974737), 4326), '{"A612, ARPK"}', jsonb_build_object('te', 'ఆరిపాక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aripaka, Visakhapatnam', 'Aripaka ఆరిపాక A612, ARPK', ST_SetSRID(ST_MakePoint(83.074711, 17.7974737), 4326), 40);
    END IF;
    -- Insert Narapadu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narapadu', ST_SetSRID(ST_MakePoint(83.0561625, 17.7727053), 4326), '{"NRPT, N613"}', jsonb_build_object('te', 'నారపాడు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narapadu, Visakhapatnam', 'Narapadu నారపాడు NRPT, N613', ST_SetSRID(ST_MakePoint(83.0561625, 17.7727053), 4326), 40);
    END IF;
    -- Insert Nallaregupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nallaregupalem', ST_SetSRID(ST_MakePoint(83.0629336, 17.7768498), 4326), '{"NLRKPLM, N462"}', jsonb_build_object('te', 'నల్లరేగులపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nallaregupalem, Visakhapatnam', 'Nallaregupalem నల్లరేగులపాలెం NLRKPLM, N462', ST_SetSRID(ST_MakePoint(83.0629336, 17.7768498), 4326), 40);
    END IF;
    -- Insert Pedda Nayudupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Nayudupalem', ST_SetSRID(ST_MakePoint(83.1394568, 17.7938035), 4326), '{"P353, PT NYTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Nayudupalem, Visakhapatnam', 'Pedda Nayudupalem  P353, PT NYTPLM', ST_SetSRID(ST_MakePoint(83.1394568, 17.7938035), 4326), 40);
    END IF;
    -- Insert Sureddivanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sureddivanipalem', ST_SetSRID(ST_MakePoint(83.1378992, 17.7872009), 4326), '{"S631, SRTFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sureddivanipalem, Visakhapatnam', 'Sureddivanipalem  S631, SRTFNPLM', ST_SetSRID(ST_MakePoint(83.1378992, 17.7872009), 4326), 10);
    END IF;
    -- Insert Tavvavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tavvavanipalem', ST_SetSRID(ST_MakePoint(83.1446574, 17.7927962), 4326), '{"T115, TFFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tavvavanipalem, Visakhapatnam', 'Tavvavanipalem  T115, TFFNPLM', ST_SetSRID(ST_MakePoint(83.1446574, 17.7927962), 4326), 40);
    END IF;
    -- Insert Amrutapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amrutapuram', ST_SetSRID(ST_MakePoint(83.1433556, 17.7845474), 4326), '{"AMRTPRM, A563"}', jsonb_build_object('te', 'అమృతాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amrutapuram, Visakhapatnam', 'Amrutapuram అమృతాపురం AMRTPRM, A563', ST_SetSRID(ST_MakePoint(83.1433556, 17.7845474), 4326), 40);
    END IF;
    -- Insert Iruvada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Iruvada', ST_SetSRID(ST_MakePoint(83.1274011, 17.7797278), 4326), '{"I613, IRFT"}', jsonb_build_object('te', 'ఇరువాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Iruvada, Visakhapatnam', 'Iruvada ఇరువాడ I613, IRFT', ST_SetSRID(ST_MakePoint(83.1274011, 17.7797278), 4326), 40);
    END IF;
    -- Insert Gollalapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(83.1313846, 17.7875276), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', 'గొల్లలపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem గొల్లలపాలెం KLLPLM, G441', ST_SetSRID(ST_MakePoint(83.1313846, 17.7875276), 4326), 10);
    END IF;
    -- Insert Patha Sabbavaram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Patha Sabbavaram', ST_SetSRID(ST_MakePoint(83.1168857, 17.7944541), 4326), '{"P321, P0 SBFRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Patha Sabbavaram, Visakhapatnam', 'Patha Sabbavaram  P321, P0 SBFRM', ST_SetSRID(ST_MakePoint(83.1168857, 17.7944541), 4326), 10);
    END IF;
    -- Insert Ravalammapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ravalammapalem', ST_SetSRID(ST_MakePoint(83.1240014, 17.8196144), 4326), '{"R145, RFLMPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ravalammapalem, Visakhapatnam', 'Ravalammapalem  R145, RFLMPLM', ST_SetSRID(ST_MakePoint(83.1240014, 17.8196144), 4326), 40);
    END IF;
    -- Insert Gotivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gotivada', ST_SetSRID(ST_MakePoint(83.1090781, 17.7961369), 4326), '{"KTFT, G313"}', jsonb_build_object('te', 'గొటివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gotivada, Visakhapatnam', 'Gotivada గొటివాడ KTFT, G313', ST_SetSRID(ST_MakePoint(83.1090781, 17.7961369), 4326), 40);
    END IF;
    -- Insert Nayanampalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nayanampalem', ST_SetSRID(ST_MakePoint(83.0994915, 17.8136855), 4326), '{"NYNMPLM, N551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nayanampalem, Visakhapatnam', 'Nayanampalem  NYNMPLM, N551', ST_SetSRID(ST_MakePoint(83.0994915, 17.8136855), 4326), 40);
    END IF;
    -- Insert Lagisettipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lagisettipalem', ST_SetSRID(ST_MakePoint(83.0860066, 17.7943301), 4326), '{"L223, LJSTPLM"}', jsonb_build_object('te', 'లగిసెట్టిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lagisettipalem, Visakhapatnam', 'Lagisettipalem లగిసెట్టిపాలెం L223, LJSTPLM', ST_SetSRID(ST_MakePoint(83.0860066, 17.7943301), 4326), 10);
    END IF;
    -- Insert Jangalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jangalapalem', ST_SetSRID(ST_MakePoint(83.1089405, 17.8103597), 4326), '{"JNKLPLM, J524"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jangalapalem, Visakhapatnam', 'Jangalapalem  JNKLPLM, J524', ST_SetSRID(ST_MakePoint(83.1089405, 17.8103597), 4326), 40);
    END IF;
    -- Insert Bondavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bondavanipalem', ST_SetSRID(ST_MakePoint(83.1042934, 17.8007869), 4326), '{"B531, BNTFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bondavanipalem, Visakhapatnam', 'Bondavanipalem  B531, BNTFNPLM', ST_SetSRID(ST_MakePoint(83.1042934, 17.8007869), 4326), 10);
    END IF;
    -- Insert Antakapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Antakapalli', ST_SetSRID(ST_MakePoint(83.1211647, 17.81469), 4326), '{"A532, ANTKPL"}', jsonb_build_object('te', 'అంతకపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Antakapalli, Visakhapatnam', 'Antakapalli అంతకపల్లి A532, ANTKPL', ST_SetSRID(ST_MakePoint(83.1211647, 17.81469), 4326), 40);
    END IF;
    -- Insert Chinna Vangali (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Vangali', ST_SetSRID(ST_MakePoint(83.0987628, 17.8214784), 4326), '{"C515, XN FNKL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Vangali, Visakhapatnam', 'Chinna Vangali  C515, XN FNKL', ST_SetSRID(ST_MakePoint(83.0987628, 17.8214784), 4326), 10);
    END IF;
    -- Insert Tekkalipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tekkalipalem', ST_SetSRID(ST_MakePoint(83.0879475, 17.8123199), 4326), '{"T241, TKLPLM"}', jsonb_build_object('te', 'టెక్కలిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tekkalipalem, Visakhapatnam', 'Tekkalipalem టెక్కలిపాలెం T241, TKLPLM', ST_SetSRID(ST_MakePoint(83.0879475, 17.8123199), 4326), 40);
    END IF;
    -- Insert Rayapuram Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rayapuram Agraharam', ST_SetSRID(ST_MakePoint(83.0787897, 17.8192851), 4326), '{"RYPRM AKRHRM, R165"}', jsonb_build_object('te', 'రాయపురం అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rayapuram Agraharam, Visakhapatnam', 'Rayapuram Agraharam రాయపురం అగ్రహారం RYPRM AKRHRM, R165', ST_SetSRID(ST_MakePoint(83.0787897, 17.8192851), 4326), 40);
    END IF;
    -- Insert Yatapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yatapalem', ST_SetSRID(ST_MakePoint(83.0666969, 17.8093289), 4326), '{"YTPLM, Y314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yatapalem, Visakhapatnam', 'Yatapalem  YTPLM, Y314', ST_SetSRID(ST_MakePoint(83.0666969, 17.8093289), 4326), 40);
    END IF;
    -- Insert Chinna Yatapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Yatapalem', ST_SetSRID(ST_MakePoint(83.0673305, 17.8013331), 4326), '{"C531, XN YTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Yatapalem, Visakhapatnam', 'Chinna Yatapalem  C531, XN YTPLM', ST_SetSRID(ST_MakePoint(83.0673305, 17.8013331), 4326), 40);
    END IF;
    -- Insert Sirasapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sirasapalli', ST_SetSRID(ST_MakePoint(83.0618328, 17.827339), 4326), '{"SRSPL, S621"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sirasapalli, Visakhapatnam', 'Sirasapalli  SRSPL, S621', ST_SetSRID(ST_MakePoint(83.0618328, 17.827339), 4326), 40);
    END IF;
    -- Insert Lingala Tirugudu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lingala Tirugudu', ST_SetSRID(ST_MakePoint(83.0527129, 17.8176985), 4326), '{"L524, LNKL TRKT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lingala Tirugudu, Visakhapatnam', 'Lingala Tirugudu  L524, LNKL TRKT', ST_SetSRID(ST_MakePoint(83.0527129, 17.8176985), 4326), 40);
    END IF;
    -- Insert Chinna Bangarammapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Bangarammapalem', ST_SetSRID(ST_MakePoint(83.0555705, 17.8140628), 4326), '{"C515, XN BNKRMPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Bangarammapalem, Visakhapatnam', 'Chinna Bangarammapalem  C515, XN BNKRMPLM', ST_SetSRID(ST_MakePoint(83.0555705, 17.8140628), 4326), 10);
    END IF;
    -- Insert Bangarammapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bangarammapalem', ST_SetSRID(ST_MakePoint(83.0652399, 17.8178244), 4326), '{"BNKRMPLM, B526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bangarammapalem, Visakhapatnam', 'Bangarammapalem  BNKRMPLM, B526', ST_SetSRID(ST_MakePoint(83.0652399, 17.8178244), 4326), 10);
    END IF;
    -- Insert Adduru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Adduru', ST_SetSRID(ST_MakePoint(83.0247969, 17.8184613), 4326), '{"A360, ATR"}', jsonb_build_object('te', 'అడ్డూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Adduru, Visakhapatnam', 'Adduru అడ్డూరు A360, ATR', ST_SetSRID(ST_MakePoint(83.0247969, 17.8184613), 4326), 40);
    END IF;
    -- Insert Gondupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gondupalem', ST_SetSRID(ST_MakePoint(83.026219, 17.8661688), 4326), '{"KNTPLM, G531"}', jsonb_build_object('te', 'గొండుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gondupalem, Visakhapatnam', 'Gondupalem గొండుపాలెం KNTPLM, G531', ST_SetSRID(ST_MakePoint(83.026219, 17.8661688), 4326), 40);
    END IF;
    -- Insert Sureddipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sureddipalem', ST_SetSRID(ST_MakePoint(83.0341833, 17.9142116), 4326), '{"S631, SRTPLM"}', jsonb_build_object('te', 'సూరెడ్డిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sureddipalem, Visakhapatnam', 'Sureddipalem సూరెడ్డిపాలెం S631, SRTPLM', ST_SetSRID(ST_MakePoint(83.0341833, 17.9142116), 4326), 40);
    END IF;
    -- Insert Kotha Agraharam ( Kottavuru ) (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotha Agraharam ( Kottavuru )', ST_SetSRID(ST_MakePoint(83.0524665, 17.9166415), 4326), '{"K0 AKRHRM KTFR , K326"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotha Agraharam ( Kottavuru ), Visakhapatnam', 'Kotha Agraharam ( Kottavuru )  K0 AKRHRM KTFR , K326', ST_SetSRID(ST_MakePoint(83.0524665, 17.9166415), 4326), 40);
    END IF;
    -- Insert Podugupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Podugupalem', ST_SetSRID(ST_MakePoint(83.0247601, 17.9152768), 4326), '{"PTKPLM, P321"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Podugupalem, Visakhapatnam', 'Podugupalem  PTKPLM, P321', ST_SetSRID(ST_MakePoint(83.0247601, 17.9152768), 4326), 40);
    END IF;
    -- Insert Bhimavaram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhimavaram', ST_SetSRID(ST_MakePoint(83.0225337, 17.9093506), 4326), '{"BHMFRM, B516"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhimavaram, Visakhapatnam', 'Bhimavaram  BHMFRM, B516', ST_SetSRID(ST_MakePoint(83.0225337, 17.9093506), 4326), 10);
    END IF;
    -- Insert Koduru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Koduru', ST_SetSRID(ST_MakePoint(83.0343571, 17.9223095), 4326), '{"K360, KTR"}', jsonb_build_object('te', 'అలమండకోడురు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Koduru, Visakhapatnam', 'Koduru అలమండకోడురు K360, KTR', ST_SetSRID(ST_MakePoint(83.0343571, 17.9223095), 4326), 40);
    END IF;
    -- Insert Sudivalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sudivalasa', ST_SetSRID(ST_MakePoint(83.1081411, 17.8753123), 4326), '{"STFLS, S314"}', jsonb_build_object('te', 'సూదివలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sudivalasa, Visakhapatnam', 'Sudivalasa సూదివలస STFLS, S314', ST_SetSRID(ST_MakePoint(83.1081411, 17.8753123), 4326), 40);
    END IF;
    -- Insert Errakannapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Errakannapalem', ST_SetSRID(ST_MakePoint(83.0782075, 17.8644144), 4326), '{"ERKNPLM, E625"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Errakannapalem, Visakhapatnam', 'Errakannapalem  ERKNPLM, E625', ST_SetSRID(ST_MakePoint(83.0782075, 17.8644144), 4326), 10);
    END IF;
    -- Insert Chandrayyapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chandrayyapeta', ST_SetSRID(ST_MakePoint(83.0914056, 17.8641738), 4326), '{"C536, XNTRYPT"}', jsonb_build_object('te', 'చంద్రయ్యపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chandrayyapeta, Visakhapatnam', 'Chandrayyapeta చంద్రయ్యపేట C536, XNTRYPT', ST_SetSRID(ST_MakePoint(83.0914056, 17.8641738), 4326), 40);
    END IF;
    -- Insert Arle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Arle', ST_SetSRID(ST_MakePoint(83.0616177, 17.8559054), 4326), '{"ARL, A640"}', jsonb_build_object('te', 'ఆర్లె'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Arle, Visakhapatnam', 'Arle ఆర్లె ARL, A640', ST_SetSRID(ST_MakePoint(83.0616177, 17.8559054), 4326), 40);
    END IF;
    -- Insert Jogannapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jogannapalem', ST_SetSRID(ST_MakePoint(83.0565706, 17.8791269), 4326), '{"JKNPLM, J251"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jogannapalem, Visakhapatnam', 'Jogannapalem  JKNPLM, J251', ST_SetSRID(ST_MakePoint(83.0565706, 17.8791269), 4326), 40);
    END IF;
    -- Insert Dalivalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dalivalasa', ST_SetSRID(ST_MakePoint(83.0672873, 17.895565), 4326), '{"D414, TLFLS"}', jsonb_build_object('te', 'దాలివలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dalivalasa, Visakhapatnam', 'Dalivalasa దాలివలస D414, TLFLS', ST_SetSRID(ST_MakePoint(83.0672873, 17.895565), 4326), 40);
    END IF;
    -- Insert K Santapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'K Santapalem', ST_SetSRID(ST_MakePoint(83.080484, 17.8732934), 4326), '{"K SNTPLM, K253"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'K Santapalem, Visakhapatnam', 'K Santapalem  K SNTPLM, K253', ST_SetSRID(ST_MakePoint(83.080484, 17.8732934), 4326), 40);
    END IF;
    -- Insert Ramachandrapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramachandrapuram', ST_SetSRID(ST_MakePoint(83.0589013, 17.881488), 4326), '{"RMXNTRPRM, R525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramachandrapuram, Visakhapatnam', 'Ramachandrapuram  RMXNTRPRM, R525', ST_SetSRID(ST_MakePoint(83.0589013, 17.881488), 4326), 40);
    END IF;
    -- Insert Kintada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kintada', ST_SetSRID(ST_MakePoint(83.0553091, 17.8738318), 4326), '{"KNTT, K533"}', jsonb_build_object('te', 'కింతాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kintada, Visakhapatnam', 'Kintada కింతాడ KNTT, K533', ST_SetSRID(ST_MakePoint(83.0553091, 17.8738318), 4326), 40);
    END IF;
    -- Insert Kintada Kotapadu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kintada Kotapadu', ST_SetSRID(ST_MakePoint(83.0425932, 17.8873597), 4326), '{"K533, KNTT KTPT"}', jsonb_build_object('te', 'కింతాడ కోటపాడు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kintada Kotapadu, Visakhapatnam', 'Kintada Kotapadu కింతాడ కోటపాడు K533, KNTT KTPT', ST_SetSRID(ST_MakePoint(83.0425932, 17.8873597), 4326), 40);
    END IF;
    -- Insert Gollalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(83.0631103, 17.8755234), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem  KLLPLM, G441', ST_SetSRID(ST_MakePoint(83.0631103, 17.8755234), 4326), 40);
    END IF;
    -- Insert Bottivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bottivanipalem', ST_SetSRID(ST_MakePoint(83.0425025, 17.8767251), 4326), '{"BTFNPLM, B315"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bottivanipalem, Visakhapatnam', 'Bottivanipalem  BTFNPLM, B315', ST_SetSRID(ST_MakePoint(83.0425025, 17.8767251), 4326), 40);
    END IF;
    -- Insert Kavi Konda Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kavi Konda Agraharam', ST_SetSRID(ST_MakePoint(83.0834964, 17.8762657), 4326), '{"KF KNT AKRHRM, K125"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kavi Konda Agraharam, Visakhapatnam', 'Kavi Konda Agraharam  KF KNT AKRHRM, K125', ST_SetSRID(ST_MakePoint(83.0834964, 17.8762657), 4326), 40);
    END IF;
    -- Insert Singannadorapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Singannadorapalem', ST_SetSRID(ST_MakePoint(83.052013, 17.8975482), 4326), '{"SNKNTRPLM, S525"}', jsonb_build_object('te', 'సింగన్నదొరపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Singannadorapalem, Visakhapatnam', 'Singannadorapalem సింగన్నదొరపాలెం SNKNTRPLM, S525', ST_SetSRID(ST_MakePoint(83.052013, 17.8975482), 4326), 40);
    END IF;
    -- Insert Gompavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gompavanipalem', ST_SetSRID(ST_MakePoint(83.0688979, 17.8720166), 4326), '{"G511, KMPFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gompavanipalem, Visakhapatnam', 'Gompavanipalem  G511, KMPFNPLM', ST_SetSRID(ST_MakePoint(83.0688979, 17.8720166), 4326), 10);
    END IF;
    -- Insert Chintalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintalapalem', ST_SetSRID(ST_MakePoint(83.0270123, 17.8466863), 4326), '{"C534, XNTLPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintalapalem, Visakhapatnam', 'Chintalapalem  C534, XNTLPLM', ST_SetSRID(ST_MakePoint(83.0270123, 17.8466863), 4326), 40);
    END IF;
    -- Insert Simhadripuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simhadripuram', ST_SetSRID(ST_MakePoint(82.960639, 17.833695), 4326), '{"S536, SMHTRPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simhadripuram, Visakhapatnam', 'Simhadripuram  S536, SMHTRPRM', ST_SetSRID(ST_MakePoint(82.960639, 17.833695), 4326), 40);
    END IF;
    -- Insert Seemunapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Seemunapalle', ST_SetSRID(ST_MakePoint(82.9853619, 17.8183195), 4326), '{"S551, SMNPL"}', jsonb_build_object('te', 'సీమనాపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Seemunapalle, Visakhapatnam', 'Seemunapalle సీమనాపల్లి S551, SMNPL', ST_SetSRID(ST_MakePoint(82.9853619, 17.8183195), 4326), 40);
    END IF;
    -- Insert Gajapatinagaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gajapatinagaram', ST_SetSRID(ST_MakePoint(82.963817, 17.813182), 4326), '{"G213, KJPTNKRM"}', jsonb_build_object('te', 'గజపతినగరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gajapatinagaram, Visakhapatnam', 'Gajapatinagaram గజపతినగరం G213, KJPTNKRM', ST_SetSRID(ST_MakePoint(82.963817, 17.813182), 4326), 40);
    END IF;
    -- Insert Juttada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Juttada', ST_SetSRID(ST_MakePoint(82.9665942, 17.8227926), 4326), '{"JTT, J330"}', jsonb_build_object('te', 'జుత్తాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Juttada, Visakhapatnam', 'Juttada జుత్తాడ JTT, J330', ST_SetSRID(ST_MakePoint(82.9665942, 17.8227926), 4326), 40);
    END IF;
    -- Insert Narasapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narasapuram', ST_SetSRID(ST_MakePoint(82.9841247, 17.801683), 4326), '{"NRSPRM, N621"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narasapuram, Visakhapatnam', 'Narasapuram  NRSPRM, N621', ST_SetSRID(ST_MakePoint(82.9841247, 17.801683), 4326), 40);
    END IF;
    -- Insert Rayapurajupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rayapurajupeta', ST_SetSRID(ST_MakePoint(82.9799823, 17.8109852), 4326), '{"R162, RYPRJPT"}', jsonb_build_object('te', 'రాయపురాజుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rayapurajupeta, Visakhapatnam', 'Rayapurajupeta రాయపురాజుపేట R162, RYPRJPT', ST_SetSRID(ST_MakePoint(82.9799823, 17.8109852), 4326), 40);
    END IF;
    -- Insert Amberupuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amberupuram', ST_SetSRID(ST_MakePoint(82.9678091, 17.8041619), 4326), '{"AMBRPRM, A516"}', jsonb_build_object('te', 'అంభేరుపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amberupuram, Visakhapatnam', 'Amberupuram అంభేరుపురం AMBRPRM, A516', ST_SetSRID(ST_MakePoint(82.9678091, 17.8041619), 4326), 40);
    END IF;
    -- Insert Bhogapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhogapuram', ST_SetSRID(ST_MakePoint(82.9546761, 17.7770841), 4326), '{"BHKPRM, B216"}', jsonb_build_object('te', 'భోగాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhogapuram, Visakhapatnam', 'Bhogapuram భోగాపురం BHKPRM, B216', ST_SetSRID(ST_MakePoint(82.9546761, 17.7770841), 4326), 40);
    END IF;
    -- Insert Kottapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottapalle', ST_SetSRID(ST_MakePoint(82.974278, 17.7781501), 4326), '{"KTPL, K314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottapalle, Visakhapatnam', 'Kottapalle  KTPL, K314', ST_SetSRID(ST_MakePoint(82.974278, 17.7781501), 4326), 40);
    END IF;
    -- Insert Muddurti (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Muddurti', ST_SetSRID(ST_MakePoint(82.9639419, 17.7706948), 4326), '{"M363, MTRT"}', jsonb_build_object('te', 'ముద్దుర్తి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Muddurti, Visakhapatnam', 'Muddurti ముద్దుర్తి M363, MTRT', ST_SetSRID(ST_MakePoint(82.9639419, 17.7706948), 4326), 40);
    END IF;
    -- Insert Chinna Kottapalle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Kottapalle', ST_SetSRID(ST_MakePoint(82.9674338, 17.7711163), 4326), '{"XN KTPL, C523"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Kottapalle, Visakhapatnam', 'Chinna Kottapalle  XN KTPL, C523', ST_SetSRID(ST_MakePoint(82.9674338, 17.7711163), 4326), 10);
    END IF;
    -- Insert Allikhanudupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Allikhanudupalem', ST_SetSRID(ST_MakePoint(82.9849665, 17.7623545), 4326), '{"ALKHNTPLM, A425"}', jsonb_build_object('te', 'అల్లికొండు పాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Allikhanudupalem, Visakhapatnam', 'Allikhanudupalem అల్లికొండు పాలెం ALKHNTPLM, A425', ST_SetSRID(ST_MakePoint(82.9849665, 17.7623545), 4326), 40);
    END IF;
    -- Insert Mamidipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mamidipalem', ST_SetSRID(ST_MakePoint(82.9983794, 17.759443), 4326), '{"MMTPLM, M531"}', jsonb_build_object('te', 'మామిడిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mamidipalem, Visakhapatnam', 'Mamidipalem మామిడిపాలెం MMTPLM, M531', ST_SetSRID(ST_MakePoint(82.9983794, 17.759443), 4326), 40);
    END IF;
    -- Insert Papayya Somapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Papayya Somapalem', ST_SetSRID(ST_MakePoint(83.0214887, 17.7684768), 4326), '{"P125, PPY SMPLM"}', jsonb_build_object('te', 'పాపయ్య సంత పాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Papayya Somapalem, Visakhapatnam', 'Papayya Somapalem పాపయ్య సంత పాలెం P125, PPY SMPLM', ST_SetSRID(ST_MakePoint(83.0214887, 17.7684768), 4326), 40);
    END IF;
    -- Insert Gurrannapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gurrannapalem', ST_SetSRID(ST_MakePoint(83.0203833, 17.75598), 4326), '{"G651, KRNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gurrannapalem, Visakhapatnam', 'Gurrannapalem  G651, KRNPLM', ST_SetSRID(ST_MakePoint(83.0203833, 17.75598), 4326), 40);
    END IF;
    -- Insert Makavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Makavaram', ST_SetSRID(ST_MakePoint(83.0251574, 17.7506796), 4326), '{"M216, MKFRM"}', jsonb_build_object('te', 'మాకవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Makavaram, Visakhapatnam', 'Makavaram మాకవరం M216, MKFRM', ST_SetSRID(ST_MakePoint(83.0251574, 17.7506796), 4326), 40);
    END IF;
    -- Insert Papayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Papayyapalem', ST_SetSRID(ST_MakePoint(83.0308629, 17.7616503), 4326), '{"P114, PPYPLM"}', jsonb_build_object('te', 'పాపయ్య పాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Papayyapalem, Visakhapatnam', 'Papayyapalem పాపయ్య పాలెం P114, PPYPLM', ST_SetSRID(ST_MakePoint(83.0308629, 17.7616503), 4326), 40);
    END IF;
    -- Insert Kondupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondupalem', ST_SetSRID(ST_MakePoint(83.0496655, 17.7669599), 4326), '{"K531, KNTPLM"}', jsonb_build_object('te', 'గొండుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondupalem, Visakhapatnam', 'Kondupalem గొండుపాలెం K531, KNTPLM', ST_SetSRID(ST_MakePoint(83.0496655, 17.7669599), 4326), 40);
    END IF;
    -- Insert Chenula Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chenula Agraharam', ST_SetSRID(ST_MakePoint(83.0471802, 17.7585169), 4326), '{"C542, XNL AKRHRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chenula Agraharam, Visakhapatnam', 'Chenula Agraharam  C542, XNL AKRHRM', ST_SetSRID(ST_MakePoint(83.0471802, 17.7585169), 4326), 40);
    END IF;
    -- Insert Ammulapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ammulapalem', ST_SetSRID(ST_MakePoint(83.0717667, 17.7596079), 4326), '{"AMLPLM, A541"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ammulapalem, Visakhapatnam', 'Ammulapalem  AMLPLM, A541', ST_SetSRID(ST_MakePoint(83.0717667, 17.7596079), 4326), 40);
    END IF;
    -- Insert Balijapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Balijapalem', ST_SetSRID(ST_MakePoint(83.0691793, 17.7660314), 4326), '{"B421, BLJPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Balijapalem, Visakhapatnam', 'Balijapalem  B421, BLJPLM', ST_SetSRID(ST_MakePoint(83.0691793, 17.7660314), 4326), 40);
    END IF;
    -- Insert Gali Bhimavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gali Bhimavaram', ST_SetSRID(ST_MakePoint(83.0944673, 17.7847331), 4326), '{"KL BHMFRM, G415"}', jsonb_build_object('te', 'గాలి భీమవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gali Bhimavaram, Visakhapatnam', 'Gali Bhimavaram గాలి భీమవరం KL BHMFRM, G415', ST_SetSRID(ST_MakePoint(83.0944673, 17.7847331), 4326), 40);
    END IF;
    -- Insert Erravanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Erravanipalem', ST_SetSRID(ST_MakePoint(83.1055423, 17.7823891), 4326), '{"E615, ERFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Erravanipalem, Visakhapatnam', 'Erravanipalem  E615, ERFNPLM', ST_SetSRID(ST_MakePoint(83.1055423, 17.7823891), 4326), 40);
    END IF;
    -- Insert Pallavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pallavanipalem', ST_SetSRID(ST_MakePoint(83.0959092, 17.7733088), 4326), '{"PLFNPLM, P415"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pallavanipalem, Visakhapatnam', 'Pallavanipalem  PLFNPLM, P415', ST_SetSRID(ST_MakePoint(83.0959092, 17.7733088), 4326), 40);
    END IF;
    -- Insert Jagaravanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jagaravanipalem', ST_SetSRID(ST_MakePoint(83.1002396, 17.7752352), 4326), '{"J261, JKRFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jagaravanipalem, Visakhapatnam', 'Jagaravanipalem  J261, JKRFNPLM', ST_SetSRID(ST_MakePoint(83.1002396, 17.7752352), 4326), 10);
    END IF;
    -- Insert Gollalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(83.1363666, 17.7476733), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem  KLLPLM, G441', ST_SetSRID(ST_MakePoint(83.1363666, 17.7476733), 4326), 40);
    END IF;
    -- Insert Tammayyapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tammayyapalem', ST_SetSRID(ST_MakePoint(83.1434575, 17.7615375), 4326), '{"T514, TMYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tammayyapalem, Visakhapatnam', 'Tammayyapalem  T514, TMYPLM', ST_SetSRID(ST_MakePoint(83.1434575, 17.7615375), 4326), 10);
    END IF;
    -- Insert Amarupinivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amarupinivanipalem', ST_SetSRID(ST_MakePoint(83.1421927, 17.7653308), 4326), '{"AMRPNFNPLM, A561"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amarupinivanipalem, Visakhapatnam', 'Amarupinivanipalem  AMRPNFNPLM, A561', ST_SetSRID(ST_MakePoint(83.1421927, 17.7653308), 4326), 40);
    END IF;
    -- Insert Appayyapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appayyapalem', ST_SetSRID(ST_MakePoint(83.1429223, 17.7571741), 4326), '{"A114, APYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appayyapalem, Visakhapatnam', 'Appayyapalem  A114, APYPLM', ST_SetSRID(ST_MakePoint(83.1429223, 17.7571741), 4326), 10);
    END IF;
    -- Insert Jagannathapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jagannathapuram', ST_SetSRID(ST_MakePoint(83.1212335, 17.7505173), 4326), '{"JKN0PRM, J253"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jagannathapuram, Visakhapatnam', 'Jagannathapuram  JKN0PRM, J253', ST_SetSRID(ST_MakePoint(83.1212335, 17.7505173), 4326), 40);
    END IF;
    -- Insert Paidivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Paidivada', ST_SetSRID(ST_MakePoint(83.119418, 17.7572814), 4326), '{"P313, PTFT"}', jsonb_build_object('te', 'పైడివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Paidivada, Visakhapatnam', 'Paidivada పైడివాడ P313, PTFT', ST_SetSRID(ST_MakePoint(83.119418, 17.7572814), 4326), 40);
    END IF;
    -- Insert Ippalavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ippalavanipalem', ST_SetSRID(ST_MakePoint(83.1637451, 17.7697275), 4326), '{"I141, IPLFNPLM"}', jsonb_build_object('te', 'ఇప్పలవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ippalavanipalem, Visakhapatnam', 'Ippalavanipalem ఇప్పలవానిపాలెం I141, IPLFNPLM', ST_SetSRID(ST_MakePoint(83.1637451, 17.7697275), 4326), 40);
    END IF;
    -- Insert Jerripotulapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jerripotulapalem', ST_SetSRID(ST_MakePoint(83.170652, 17.7682975), 4326), '{"JRPTLPLM, J613"}', jsonb_build_object('te', 'జెర్రిపొతులపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jerripotulapalem, Visakhapatnam', 'Jerripotulapalem జెర్రిపొతులపాలెం JRPTLPLM, J613', ST_SetSRID(ST_MakePoint(83.170652, 17.7682975), 4326), 40);
    END IF;
    -- Insert Chintagatla (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintagatla', ST_SetSRID(ST_MakePoint(83.1624446, 17.7820894), 4326), '{"XNTKTL, C532"}', jsonb_build_object('te', 'చింతగట్ల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintagatla, Visakhapatnam', 'Chintagatla చింతగట్ల XNTKTL, C532', ST_SetSRID(ST_MakePoint(83.1624446, 17.7820894), 4326), 40);
    END IF;
    -- Insert Pedagadi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedagadi', ST_SetSRID(ST_MakePoint(83.1771763, 17.7970882), 4326), '{"PTKT, P323"}', jsonb_build_object('te', 'పెదగాడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedagadi, Visakhapatnam', 'Pedagadi పెదగాడి PTKT, P323', ST_SetSRID(ST_MakePoint(83.1771763, 17.7970882), 4326), 40);
    END IF;
    -- Insert Rampuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rampuram', ST_SetSRID(ST_MakePoint(83.1814607, 17.8114557), 4326), '{"R516, RMPRM"}', jsonb_build_object('te', 'రాంపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rampuram, Visakhapatnam', 'Rampuram రాంపురం R516, RMPRM', ST_SetSRID(ST_MakePoint(83.1814607, 17.8114557), 4326), 40);
    END IF;
    -- Insert Pinagadi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pinagadi', ST_SetSRID(ST_MakePoint(83.1732188, 17.8055323), 4326), '{"PNKT, P523"}', jsonb_build_object('te', 'పినగాడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pinagadi, Visakhapatnam', 'Pinagadi పినగాడి PNKT, P523', ST_SetSRID(ST_MakePoint(83.1732188, 17.8055323), 4326), 40);
    END IF;
    -- Insert Shrirampuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Shrirampuram', ST_SetSRID(ST_MakePoint(83.1801631, 17.8060289), 4326), '{"S665, XRRMPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Shrirampuram, Visakhapatnam', 'Shrirampuram  S665, XRRMPRM', ST_SetSRID(ST_MakePoint(83.1801631, 17.8060289), 4326), 10);
    END IF;
    -- Insert Karakavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karakavanipalem', ST_SetSRID(ST_MakePoint(83.1831058, 17.8279494), 4326), '{"K621, KRKFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karakavanipalem, Visakhapatnam', 'Karakavanipalem  K621, KRKFNPLM', ST_SetSRID(ST_MakePoint(83.1831058, 17.8279494), 4326), 40);
    END IF;
    -- Insert Gurammapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gurammapalem', ST_SetSRID(ST_MakePoint(83.2154538, 17.8407365), 4326), '{"KRMPLM, G651"}', jsonb_build_object('te', 'గుర్రంపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gurammapalem, Visakhapatnam', 'Gurammapalem గుర్రంపాలెం KRMPLM, G651', ST_SetSRID(ST_MakePoint(83.2154538, 17.8407365), 4326), 40);
    END IF;
    -- Insert Rayavarapuvanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rayavarapuvanipalem', ST_SetSRID(ST_MakePoint(83.2066962, 17.8347269), 4326), '{"RYFRPFNPLM, R161"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rayavarapuvanipalem, Visakhapatnam', 'Rayavarapuvanipalem  RYFRPFNPLM, R161', ST_SetSRID(ST_MakePoint(83.2066962, 17.8347269), 4326), 10);
    END IF;
    -- Insert Nilakantapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nilakantapuram', ST_SetSRID(ST_MakePoint(83.2060547, 17.8364133), 4326), '{"N425, NLKNTPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nilakantapuram, Visakhapatnam', 'Nilakantapuram  N425, NLKNTPRM', ST_SetSRID(ST_MakePoint(83.2060547, 17.8364133), 4326), 10);
    END IF;
    -- Insert Govindapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Govindapuram', ST_SetSRID(ST_MakePoint(83.2153358, 17.8507581), 4326), '{"KFNTPRM, G153"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Govindapuram, Visakhapatnam', 'Govindapuram  KFNTPRM, G153', ST_SetSRID(ST_MakePoint(83.2153358, 17.8507581), 4326), 40);
    END IF;
    -- Insert Mudapaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mudapaka', ST_SetSRID(ST_MakePoint(83.2180617, 17.8560341), 4326), '{"MTPK, M312"}', jsonb_build_object('te', 'ముదపాక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mudapaka, Visakhapatnam', 'Mudapaka ముదపాక MTPK, M312', ST_SetSRID(ST_MakePoint(83.2180617, 17.8560341), 4326), 40);
    END IF;
    -- Insert Gollala Kanamam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollala Kanamam', ST_SetSRID(ST_MakePoint(83.2785155, 17.8706861), 4326), '{"G442, KLL KNMM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollala Kanamam, Visakhapatnam', 'Gollala Kanamam  G442, KLL KNMM', ST_SetSRID(ST_MakePoint(83.2785155, 17.8706861), 4326), 40);
    END IF;
    -- Insert Ayyavari Kanamam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ayyavari Kanamam', ST_SetSRID(ST_MakePoint(83.2775102, 17.8817634), 4326), '{"A162, AYFR KNMM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ayyavari Kanamam, Visakhapatnam', 'Ayyavari Kanamam  A162, AYFR KNMM', ST_SetSRID(ST_MakePoint(83.2775102, 17.8817634), 4326), 40);
    END IF;
    -- Insert Dibbadipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dibbadipalem', ST_SetSRID(ST_MakePoint(83.2916324, 17.8808963), 4326), '{"D131, TBTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dibbadipalem, Visakhapatnam', 'Dibbadipalem  D131, TBTPLM', ST_SetSRID(ST_MakePoint(83.2916324, 17.8808963), 4326), 40);
    END IF;
    -- Insert Abotuvanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Abotuvanipalem', ST_SetSRID(ST_MakePoint(83.2850126, 17.8719535), 4326), '{"ABTFNPLM, A131"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Abotuvanipalem, Visakhapatnam', 'Abotuvanipalem  ABTFNPLM, A131', ST_SetSRID(ST_MakePoint(83.2850126, 17.8719535), 4326), 10);
    END IF;
    -- Insert Vemakotipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vemakotipalem', ST_SetSRID(ST_MakePoint(83.2820585, 17.8949267), 4326), '{"V523, FMKTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vemakotipalem, Visakhapatnam', 'Vemakotipalem  V523, FMKTPLM', ST_SetSRID(ST_MakePoint(83.2820585, 17.8949267), 4326), 40);
    END IF;
    -- Insert Gidijala (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gidijala', ST_SetSRID(ST_MakePoint(83.2929309, 17.8935482), 4326), '{"G324, JTJL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gidijala, Visakhapatnam', 'Gidijala  G324, JTJL', ST_SetSRID(ST_MakePoint(83.2929309, 17.8935482), 4326), 40);
    END IF;
    -- Insert Muchcherla (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Muchcherla', ST_SetSRID(ST_MakePoint(83.2860067, 17.9052957), 4326), '{"M264, MXXRL"}', jsonb_build_object('te', 'ముచ్చెర్ల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Muchcherla, Visakhapatnam', 'Muchcherla ముచ్చెర్ల M264, MXXRL', ST_SetSRID(ST_MakePoint(83.2860067, 17.9052957), 4326), 40);
    END IF;
    -- Insert Tangudubilli Agraharam (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tangudubilli Agraharam', ST_SetSRID(ST_MakePoint(83.2739197, 17.9040316), 4326), '{"T523, TNKTBL AKRHRM"}', jsonb_build_object('te', 'తంగుడుబిల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tangudubilli Agraharam, Visakhapatnam', 'Tangudubilli Agraharam తంగుడుబిల్లి T523, TNKTBL AKRHRM', ST_SetSRID(ST_MakePoint(83.2739197, 17.9040316), 4326), 10);
    END IF;
    -- Insert Lakshmidevipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lakshmidevipeta', ST_SetSRID(ST_MakePoint(83.2859631, 17.902111), 4326), '{"L253, LKXMTFPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lakshmidevipeta, Visakhapatnam', 'Lakshmidevipeta  L253, LKXMTFPT', ST_SetSRID(ST_MakePoint(83.2859631, 17.902111), 4326), 40);
    END IF;
    -- Insert Chinna Chandrapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Chandrapuram', ST_SetSRID(ST_MakePoint(83.3158561, 17.9316456), 4326), '{"C525, XN XNTRPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Chandrapuram, Visakhapatnam', 'Chinna Chandrapuram  C525, XN XNTRPRM', ST_SetSRID(ST_MakePoint(83.3158561, 17.9316456), 4326), 10);
    END IF;
    -- Insert Reganagudem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Reganagudem', ST_SetSRID(ST_MakePoint(83.3214492, 17.9415131), 4326), '{"RKNKTM, R252"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Reganagudem, Visakhapatnam', 'Reganagudem  RKNKTM, R252', ST_SetSRID(ST_MakePoint(83.3214492, 17.9415131), 4326), 40);
    END IF;
    -- Insert Pedda Ichapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Ichapuram', ST_SetSRID(ST_MakePoint(83.2901277, 17.9201711), 4326), '{"PT IXPRM, P321"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Ichapuram, Visakhapatnam', 'Pedda Ichapuram  PT IXPRM, P321', ST_SetSRID(ST_MakePoint(83.2901277, 17.9201711), 4326), 10);
    END IF;
    -- Insert Bakurupalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bakurupalem', ST_SetSRID(ST_MakePoint(83.3047302, 17.9219952), 4326), '{"BKRPLM, B261"}', jsonb_build_object('te', 'బాకురుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bakurupalem, Visakhapatnam', 'Bakurupalem బాకురుపాలెం BKRPLM, B261', ST_SetSRID(ST_MakePoint(83.3047302, 17.9219952), 4326), 10);
    END IF;
    -- Insert Gompalapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gompalapuram', ST_SetSRID(ST_MakePoint(83.3115931, 17.9150634), 4326), '{"G514, KMPLPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gompalapuram, Visakhapatnam', 'Gompalapuram  G514, KMPLPRM', ST_SetSRID(ST_MakePoint(83.3115931, 17.9150634), 4326), 10);
    END IF;
    -- Insert Podugupalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Podugupalem', ST_SetSRID(ST_MakePoint(83.3631238, 17.9144436), 4326), '{"PTKPLM, P321"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Podugupalem, Visakhapatnam', 'Podugupalem  PTKPLM, P321', ST_SetSRID(ST_MakePoint(83.3631238, 17.9144436), 4326), 10);
    END IF;
    -- Insert Gollalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(83.2982257, 17.9560542), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem  KLLPLM, G441', ST_SetSRID(ST_MakePoint(83.2982257, 17.9560542), 4326), 40);
    END IF;
    -- Insert Pekeru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pekeru', ST_SetSRID(ST_MakePoint(83.3095816, 17.9596576), 4326), '{"P260, PKR"}', jsonb_build_object('te', 'పేకేరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pekeru, Visakhapatnam', 'Pekeru పేకేరు P260, PKR', ST_SetSRID(ST_MakePoint(83.3095816, 17.9596576), 4326), 40);
    END IF;
    -- Insert Sirlapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sirlapalem', ST_SetSRID(ST_MakePoint(83.3206607, 17.9591936), 4326), '{"S641, SRLPLM"}', jsonb_build_object('te', 'శిర్లపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sirlapalem, Visakhapatnam', 'Sirlapalem శిర్లపాలెం S641, SRLPLM', ST_SetSRID(ST_MakePoint(83.3206607, 17.9591936), 4326), 40);
    END IF;
    -- Insert Ramanayudupalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramanayudupalem', ST_SetSRID(ST_MakePoint(83.3345953, 17.951664), 4326), '{"R553, RMNYTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramanayudupalem, Visakhapatnam', 'Ramanayudupalem  R553, RMNYTPLM', ST_SetSRID(ST_MakePoint(83.3345953, 17.951664), 4326), 10);
    END IF;
    -- Insert Maddi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maddi', ST_SetSRID(ST_MakePoint(83.3241221, 17.9808418), 4326), '{"M300, MT"}', jsonb_build_object('te', 'మద్ది'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maddi, Visakhapatnam', 'Maddi మద్ది M300, MT', ST_SetSRID(ST_MakePoint(83.3241221, 17.9808418), 4326), 40);
    END IF;
    -- Insert Mukundapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mukundapuram', ST_SetSRID(ST_MakePoint(83.3280048, 17.9523718), 4326), '{"M253, MKNTPRM"}', jsonb_build_object('te', 'ముకుందపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mukundapuram, Visakhapatnam', 'Mukundapuram ముకుందపురం M253, MKNTPRM', ST_SetSRID(ST_MakePoint(83.3280048, 17.9523718), 4326), 40);
    END IF;
    -- Insert Boni (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boni', ST_SetSRID(ST_MakePoint(83.3430685, 17.964018), 4326), '{"BN, B500"}', jsonb_build_object('te', 'బోని'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boni, Visakhapatnam', 'Boni బోని BN, B500', ST_SetSRID(ST_MakePoint(83.3430685, 17.964018), 4326), 40);
    END IF;
    -- Insert Krishnapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Krishnapuram', ST_SetSRID(ST_MakePoint(83.3397612, 17.9802757), 4326), '{"K625, KRXNPRM"}', jsonb_build_object('te', 'కృష్ణాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Krishnapuram, Visakhapatnam', 'Krishnapuram కృష్ణాపురం K625, KRXNPRM', ST_SetSRID(ST_MakePoint(83.3397612, 17.9802757), 4326), 40);
    END IF;
    -- Insert Revidi Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Revidi Agraharam', ST_SetSRID(ST_MakePoint(83.3738426, 17.9666859), 4326), '{"R132, RFT AKRHRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Revidi Agraharam, Visakhapatnam', 'Revidi Agraharam  R132, RFT AKRHRM', ST_SetSRID(ST_MakePoint(83.3738426, 17.9666859), 4326), 40);
    END IF;
    -- Insert Vijayaramapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijayaramapuram', ST_SetSRID(ST_MakePoint(83.3776794, 17.9594056), 4326), '{"FJYRMPRM, V265"}', jsonb_build_object('te', 'విజయరామపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijayaramapuram, Visakhapatnam', 'Vijayaramapuram విజయరామపురం FJYRMPRM, V265', ST_SetSRID(ST_MakePoint(83.3776794, 17.9594056), 4326), 40);
    END IF;
    -- Insert Revidi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Revidi', ST_SetSRID(ST_MakePoint(83.3728604, 17.9641784), 4326), '{"RFT, R130"}', jsonb_build_object('te', 'రేవిడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Revidi, Visakhapatnam', 'Revidi రేవిడి RFT, R130', ST_SetSRID(ST_MakePoint(83.3728604, 17.9641784), 4326), 40);
    END IF;
    -- Insert Pandrangi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pandrangi', ST_SetSRID(ST_MakePoint(83.3664451, 17.9631019), 4326), '{"P536, PNTRNJ"}', jsonb_build_object('te', 'పాండ్రంగి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pandrangi, Visakhapatnam', 'Pandrangi పాండ్రంగి P536, PNTRNJ', ST_SetSRID(ST_MakePoint(83.3664451, 17.9631019), 4326), 40);
    END IF;
    -- Insert Iskalapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Iskalapalem', ST_SetSRID(ST_MakePoint(83.3279186, 17.9891911), 4326), '{"I241, ISKLPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Iskalapalem, Visakhapatnam', 'Iskalapalem  I241, ISKLPLM', ST_SetSRID(ST_MakePoint(83.3279186, 17.9891911), 4326), 10);
    END IF;
    -- Insert Archakunipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Archakunipalem', ST_SetSRID(ST_MakePoint(83.3353759, 17.9983427), 4326), '{"A622, ARXKNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Archakunipalem, Visakhapatnam', 'Archakunipalem  A622, ARXKNPLM', ST_SetSRID(ST_MakePoint(83.3353759, 17.9983427), 4326), 10);
    END IF;
    -- Insert Reddipalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Reddipalle', ST_SetSRID(ST_MakePoint(83.3397027, 18.0116679), 4326), '{"RTPL, R314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Reddipalle, Visakhapatnam', 'Reddipalle  RTPL, R314', ST_SetSRID(ST_MakePoint(83.3397027, 18.0116679), 4326), 40);
    END IF;
    -- Insert Padmanabham (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Padmanabham', ST_SetSRID(ST_MakePoint(83.3325255, 17.9894415), 4326), '{"PTMNBHM, P355"}', jsonb_build_object('te', 'పద్మనాభం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Padmanabham, Visakhapatnam', 'Padmanabham పద్మనాభం PTMNBHM, P355', ST_SetSRID(ST_MakePoint(83.3325255, 17.9894415), 4326), 40);
    END IF;
    -- Insert Geddapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Geddapeta', ST_SetSRID(ST_MakePoint(83.3942427, 17.9990428), 4326), '{"G313, JTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Geddapeta, Visakhapatnam', 'Geddapeta  G313, JTPT', ST_SetSRID(ST_MakePoint(83.3942427, 17.9990428), 4326), 10);
    END IF;
    -- Insert Sunkarapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sunkarapeta', ST_SetSRID(ST_MakePoint(83.3699271, 18.0051489), 4326), '{"S526, SNKRPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sunkarapeta, Visakhapatnam', 'Sunkarapeta  S526, SNKRPT', ST_SetSRID(ST_MakePoint(83.3699271, 18.0051489), 4326), 10);
    END IF;
    -- Insert Bhadrayyapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhadrayyapeta', ST_SetSRID(ST_MakePoint(83.3665012, 17.9933391), 4326), '{"B361, BHTRYPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhadrayyapeta, Visakhapatnam', 'Bhadrayyapeta  B361, BHTRYPT', ST_SetSRID(ST_MakePoint(83.3665012, 17.9933391), 4326), 40);
    END IF;
    -- Insert Goddapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Goddapeta', ST_SetSRID(ST_MakePoint(83.3916321, 18.0050966), 4326), '{"KTPT, G313"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Goddapeta, Visakhapatnam', 'Goddapeta  KTPT, G313', ST_SetSRID(ST_MakePoint(83.3916321, 18.0050966), 4326), 40);
    END IF;
    -- Insert Majjipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Majjipeta', ST_SetSRID(ST_MakePoint(83.3783211, 17.9883798), 4326), '{"MJPT, M213"}', jsonb_build_object('te', 'మజ్జిపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Majjipeta, Visakhapatnam', 'Majjipeta మజ్జిపేట MJPT, M213', ST_SetSRID(ST_MakePoint(83.3783211, 17.9883798), 4326), 40);
    END IF;
    -- Insert Korada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Korada', ST_SetSRID(ST_MakePoint(83.3802324, 17.9976377), 4326), '{"KRT, K630"}', jsonb_build_object('te', 'కోరాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Korada, Visakhapatnam', 'Korada కోరాడ KRT, K630', ST_SetSRID(ST_MakePoint(83.3802324, 17.9976377), 4326), 40);
    END IF;
    -- Insert Padagalapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Padagalapeta', ST_SetSRID(ST_MakePoint(83.3939231, 18.013617), 4326), '{"PTKLPT, P324"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Padagalapeta, Visakhapatnam', 'Padagalapeta  PTKLPT, P324', ST_SetSRID(ST_MakePoint(83.3939231, 18.013617), 4326), 10);
    END IF;
    -- Insert Marlapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marlapeta', ST_SetSRID(ST_MakePoint(83.3667493, 17.9862584), 4326), '{"M641, MRLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marlapeta, Visakhapatnam', 'Marlapeta  M641, MRLPT', ST_SetSRID(ST_MakePoint(83.3667493, 17.9862584), 4326), 10);
    END IF;
    -- Insert Satsadipeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Satsadipeta', ST_SetSRID(ST_MakePoint(82.8799622, 17.8462637), 4326), '{"STSTPT, S323"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Satsadipeta, Visakhapatnam', 'Satsadipeta  STSTPT, S323', ST_SetSRID(ST_MakePoint(82.8799622, 17.8462637), 4326), 10);
    END IF;
    -- Insert Bangarampalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bangarampalem', ST_SetSRID(ST_MakePoint(82.9372812, 17.8085693), 4326), '{"BNKRMPLM, B526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bangarampalem, Visakhapatnam', 'Bangarampalem  BNKRMPLM, B526', ST_SetSRID(ST_MakePoint(82.9372812, 17.8085693), 4326), 10);
    END IF;
    -- Insert Pakirsahebpeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pakirsahebpeta', ST_SetSRID(ST_MakePoint(82.9331788, 17.8081351), 4326), '{"PKRSHBPT, P262"}', jsonb_build_object('te', 'పకీర్ సాహెబ్ పేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pakirsahebpeta, Visakhapatnam', 'Pakirsahebpeta పకీర్ సాహెబ్ పేట PKRSHBPT, P262', ST_SetSRID(ST_MakePoint(82.9331788, 17.8081351), 4326), 40);
    END IF;
    -- Insert Ankupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ankupalem', ST_SetSRID(ST_MakePoint(82.9283644, 17.8156181), 4326), '{"ANKPLM, A521"}', jsonb_build_object('te', 'అంకుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ankupalem, Visakhapatnam', 'Ankupalem అంకుపాలెం ANKPLM, A521', ST_SetSRID(ST_MakePoint(82.9283644, 17.8156181), 4326), 40);
    END IF;
    -- Insert Srirampuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srirampuram', ST_SetSRID(ST_MakePoint(82.9266593, 17.8154708), 4326), '{"S665, SRRMPRM"}', jsonb_build_object('te', 'శ్రీరాంపట్నం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srirampuram, Visakhapatnam', 'Srirampuram శ్రీరాంపట్నం S665, SRRMPRM', ST_SetSRID(ST_MakePoint(82.9266593, 17.8154708), 4326), 40);
    END IF;
    -- Insert Chinnaappanapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinnaappanapalem', ST_SetSRID(ST_MakePoint(82.8835882, 17.8216292), 4326), '{"XNPNPLM, C515"}', jsonb_build_object('te', 'చిన్నప్పన్నపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinnaappanapalem, Visakhapatnam', 'Chinnaappanapalem చిన్నప్పన్నపాలెం XNPNPLM, C515', ST_SetSRID(ST_MakePoint(82.8835882, 17.8216292), 4326), 40);
    END IF;
    -- Insert Malapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Malapalle', ST_SetSRID(ST_MakePoint(82.9109472, 17.8155855), 4326), '{"M414, MLPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Malapalle, Visakhapatnam', 'Malapalle  M414, MLPL', ST_SetSRID(ST_MakePoint(82.9109472, 17.8155855), 4326), 40);
    END IF;
    -- Insert Gauripatnam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gauripatnam', ST_SetSRID(ST_MakePoint(82.9126583, 17.8184446), 4326), '{"KRPTNM, G613"}', jsonb_build_object('te', 'గౌరీపట్నం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gauripatnam, Visakhapatnam', 'Gauripatnam గౌరీపట్నం KRPTNM, G613', ST_SetSRID(ST_MakePoint(82.9126583, 17.8184446), 4326), 40);
    END IF;
    -- Insert Narendrapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narendrapuram', ST_SetSRID(ST_MakePoint(82.9384232, 17.5837555), 4326), '{"N653, NRNTRPRM"}', jsonb_build_object('te', 'నరేంద్రపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narendrapuram, Visakhapatnam', 'Narendrapuram నరేంద్రపురం N653, NRNTRPRM', ST_SetSRID(ST_MakePoint(82.9384232, 17.5837555), 4326), 40);
    END IF;
    -- Insert Madakapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madakapalem', ST_SetSRID(ST_MakePoint(82.9167452, 17.5753631), 4326), '{"MTKPLM, M321"}', jsonb_build_object('te', 'మడకపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madakapalem, Visakhapatnam', 'Madakapalem మడకపాలెం MTKPLM, M321', ST_SetSRID(ST_MakePoint(82.9167452, 17.5753631), 4326), 40);
    END IF;
    -- Insert Cherlopalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cherlopalem', ST_SetSRID(ST_MakePoint(82.9283111, 17.5781493), 4326), '{"XRLPLM, C641"}', jsonb_build_object('te', 'చెర్లోపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cherlopalem, Visakhapatnam', 'Cherlopalem చెర్లోపాలెం XRLPLM, C641', ST_SetSRID(ST_MakePoint(82.9283111, 17.5781493), 4326), 40);
    END IF;
    -- Insert Ramagiri (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramagiri', ST_SetSRID(ST_MakePoint(82.9231057, 17.5830395), 4326), '{"RMJR, R526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramagiri, Visakhapatnam', 'Ramagiri  RMJR, R526', ST_SetSRID(ST_MakePoint(82.9231057, 17.5830395), 4326), 40);
    END IF;
    -- Insert Melupaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Melupaka', ST_SetSRID(ST_MakePoint(82.9064241, 17.5860065), 4326), '{"MLPK, M412"}', jsonb_build_object('te', 'నేలుపాక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Melupaka, Visakhapatnam', 'Melupaka నేలుపాక MLPK, M412', ST_SetSRID(ST_MakePoint(82.9064241, 17.5860065), 4326), 40);
    END IF;
    -- Insert Tipurayunipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tipurayunipalem', ST_SetSRID(ST_MakePoint(82.8682993, 17.5993214), 4326), '{"TPRYNPLM, T165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tipurayunipalem, Visakhapatnam', 'Tipurayunipalem  TPRYNPLM, T165', ST_SetSRID(ST_MakePoint(82.8682993, 17.5993214), 4326), 10);
    END IF;
    -- Insert Nutulaguntlapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nutulaguntlapalem', ST_SetSRID(ST_MakePoint(82.8738909, 17.594958), 4326), '{"N342, NTLKNTLPLM"}', jsonb_build_object('te', 'నూతులగుంట్ల పాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nutulaguntlapalem, Visakhapatnam', 'Nutulaguntlapalem నూతులగుంట్ల పాలెం N342, NTLKNTLPLM', ST_SetSRID(ST_MakePoint(82.8738909, 17.594958), 4326), 40);
    END IF;
    -- Insert Sheikillapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sheikillapalem', ST_SetSRID(ST_MakePoint(82.8576115, 17.583409), 4326), '{"XKLPLM, S241"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sheikillapalem, Visakhapatnam', 'Sheikillapalem  XKLPLM, S241', ST_SetSRID(ST_MakePoint(82.8576115, 17.583409), 4326), 40);
    END IF;
    -- Insert Chinna Kokkirapallle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Kokkirapallle', ST_SetSRID(ST_MakePoint(82.8512374, 17.5842621), 4326), '{"XN KKRPL, C522"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Kokkirapallle, Visakhapatnam', 'Chinna Kokkirapallle  XN KKRPL, C522', ST_SetSRID(ST_MakePoint(82.8512374, 17.5842621), 4326), 10);
    END IF;
    -- Insert Turangalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Turangalapalem', ST_SetSRID(ST_MakePoint(82.8780895, 17.5760456), 4326), '{"T652, TRNKLPLM"}', jsonb_build_object('te', 'తురంగలపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Turangalapalem, Visakhapatnam', 'Turangalapalem తురంగలపాలెం T652, TRNKLPLM', ST_SetSRID(ST_MakePoint(82.8780895, 17.5760456), 4326), 40);
    END IF;
    -- Insert Jampapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jampapalem', ST_SetSRID(ST_MakePoint(82.892249, 17.5805333), 4326), '{"JMPPLM, J511"}', jsonb_build_object('te', 'జంపపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jampapalem, Visakhapatnam', 'Jampapalem జంపపాలెం JMPPLM, J511', ST_SetSRID(ST_MakePoint(82.892249, 17.5805333), 4326), 40);
    END IF;
    -- Insert Yenugu Tuni (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yenugu Tuni', ST_SetSRID(ST_MakePoint(82.8860353, 17.5885026), 4326), '{"YNK TN, Y523"}', jsonb_build_object('te', 'యేనుగుతుని'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yenugu Tuni, Visakhapatnam', 'Yenugu Tuni యేనుగుతుని YNK TN, Y523', ST_SetSRID(ST_MakePoint(82.8860353, 17.5885026), 4326), 40);
    END IF;
    -- Insert Achchutapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Achchutapuram', ST_SetSRID(ST_MakePoint(82.8669899, 17.5847959), 4326), '{"A231, AXXTPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Achchutapuram, Visakhapatnam', 'Achchutapuram  A231, AXXTPRM', ST_SetSRID(ST_MakePoint(82.8669899, 17.5847959), 4326), 40);
    END IF;
    -- Insert Kotta Sheikillapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Sheikillapalem', ST_SetSRID(ST_MakePoint(82.8654541, 17.5853522), 4326), '{"K322, KT XKLPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Sheikillapalem, Visakhapatnam', 'Kotta Sheikillapalem  K322, KT XKLPLM', ST_SetSRID(ST_MakePoint(82.8654541, 17.5853522), 4326), 10);
    END IF;
    -- Insert Malajampa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Malajampa', ST_SetSRID(ST_MakePoint(82.9033923, 17.5638937), 4326), '{"M425, MLJMP"}', jsonb_build_object('te', 'మూలజంప'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Malajampa, Visakhapatnam', 'Malajampa మూలజంప M425, MLJMP', ST_SetSRID(ST_MakePoint(82.9033923, 17.5638937), 4326), 40);
    END IF;
    -- Insert Somilingapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Somilingapalem', ST_SetSRID(ST_MakePoint(82.8882833, 17.5577052), 4326), '{"S545, SMLNKPLM"}', jsonb_build_object('te', 'సోమలింగపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Somilingapalem, Visakhapatnam', 'Somilingapalem సోమలింగపాలెం S545, SMLNKPLM', ST_SetSRID(ST_MakePoint(82.8882833, 17.5577052), 4326), 40);
    END IF;
    -- Insert Mulakotturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mulakotturu', ST_SetSRID(ST_MakePoint(82.903929, 17.5606652), 4326), '{"M423, MLKTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mulakotturu, Visakhapatnam', 'Mulakotturu  M423, MLKTR', ST_SetSRID(ST_MakePoint(82.903929, 17.5606652), 4326), 40);
    END IF;
    -- Insert Ramarayudupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramarayudupalem', ST_SetSRID(ST_MakePoint(82.8761892, 17.5618018), 4326), '{"RMRYTPLM, R563"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramarayudupalem, Visakhapatnam', 'Ramarayudupalem  RMRYTPLM, R563', ST_SetSRID(ST_MakePoint(82.8761892, 17.5618018), 4326), 40);
    END IF;
    -- Insert Kokkirapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kokkirapalle', ST_SetSRID(ST_MakePoint(82.8508258, 17.5708725), 4326), '{"KKRPL, K261"}', jsonb_build_object('te', 'కొక్కెరపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kokkirapalle, Visakhapatnam', 'Kokkirapalle కొక్కెరపల్లి KKRPL, K261', ST_SetSRID(ST_MakePoint(82.8508258, 17.5708725), 4326), 40);
    END IF;
    -- Insert Chinna Gollapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Gollapalem', ST_SetSRID(ST_MakePoint(82.8345203, 17.5704592), 4326), '{"XN KLPLM, C524"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Gollapalem, Visakhapatnam', 'Chinna Gollapalem  XN KLPLM, C524', ST_SetSRID(ST_MakePoint(82.8345203, 17.5704592), 4326), 40);
    END IF;
    -- Insert Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Agraharam', ST_SetSRID(ST_MakePoint(82.8503908, 17.5686005), 4326), '{"A266, AKRHRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Agraharam, Visakhapatnam', 'Agraharam  A266, AKRHRM', ST_SetSRID(ST_MakePoint(82.8503908, 17.5686005), 4326), 40);
    END IF;
    -- Insert Venkatapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkatapuram', ST_SetSRID(ST_MakePoint(82.8394454, 17.5662194), 4326), '{"V523, FNKTPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkatapuram, Visakhapatnam', 'Venkatapuram  V523, FNKTPRM', ST_SetSRID(ST_MakePoint(82.8394454, 17.5662194), 4326), 40);
    END IF;
    -- Insert Pedda Gollapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Gollapalem', ST_SetSRID(ST_MakePoint(82.8327905, 17.5689808), 4326), '{"PT KLPLM, P324"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Gollapalem, Visakhapatnam', 'Pedda Gollapalem  PT KLPLM, P324', ST_SetSRID(ST_MakePoint(82.8327905, 17.5689808), 4326), 40);
    END IF;
    -- Insert Mantripalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mantripalle', ST_SetSRID(ST_MakePoint(82.8330347, 17.5646763), 4326), '{"MNTRPL, M536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mantripalle, Visakhapatnam', 'Mantripalle  MNTRPL, M536', ST_SetSRID(ST_MakePoint(82.8330347, 17.5646763), 4326), 40);
    END IF;
    -- Insert Peddapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Peddapalle', ST_SetSRID(ST_MakePoint(82.8327333, 17.5619842), 4326), '{"PTPL, P314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Peddapalle, Visakhapatnam', 'Peddapalle  PTPL, P314', ST_SetSRID(ST_MakePoint(82.8327333, 17.5619842), 4326), 40);
    END IF;
    -- Insert Nawabpeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nawabpeta', ST_SetSRID(ST_MakePoint(82.8396614, 17.5672469), 4326), '{"N130, NWBPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nawabpeta, Visakhapatnam', 'Nawabpeta  N130, NWBPT', ST_SetSRID(ST_MakePoint(82.8396614, 17.5672469), 4326), 10);
    END IF;
    -- Insert Yerravaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yerravaram', ST_SetSRID(ST_MakePoint(82.8435129, 17.5459911), 4326), '{"YRFRM, Y616"}', jsonb_build_object('te', 'యెర్రవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yerravaram, Visakhapatnam', 'Yerravaram యెర్రవరం YRFRM, Y616', ST_SetSRID(ST_MakePoint(82.8435129, 17.5459911), 4326), 40);
    END IF;
    -- Insert Marrikonda (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marrikonda', ST_SetSRID(ST_MakePoint(82.8278082, 17.5359626), 4326), '{"M625, MRKNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marrikonda, Visakhapatnam', 'Marrikonda  M625, MRKNT', ST_SetSRID(ST_MakePoint(82.8278082, 17.5359626), 4326), 10);
    END IF;
    -- Insert Rukminipuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rukminipuram', ST_SetSRID(ST_MakePoint(82.8097119, 17.5046284), 4326), '{"RKMNPRM, R255"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rukminipuram, Visakhapatnam', 'Rukminipuram  RKMNPRM, R255', ST_SetSRID(ST_MakePoint(82.8097119, 17.5046284), 4326), 40);
    END IF;
    -- Insert Potureddipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Potureddipalem', ST_SetSRID(ST_MakePoint(82.8095278, 17.5012996), 4326), '{"PTRTPLM, P363"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Potureddipalem, Visakhapatnam', 'Potureddipalem  PTRTPLM, P363', ST_SetSRID(ST_MakePoint(82.8095278, 17.5012996), 4326), 10);
    END IF;
    -- Insert Regupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Regupalem', ST_SetSRID(ST_MakePoint(82.8166992, 17.5180638), 4326), '{"RKPLM, R214"}', jsonb_build_object('te', 'రేగుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Regupalem, Visakhapatnam', 'Regupalem రేగుపాలెం RKPLM, R214', ST_SetSRID(ST_MakePoint(82.8166992, 17.5180638), 4326), 40);
    END IF;
    -- Insert Ramabhadrapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramabhadrapuram', ST_SetSRID(ST_MakePoint(82.8099313, 17.5107448), 4326), '{"R513, RMBHTRPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramabhadrapuram, Visakhapatnam', 'Ramabhadrapuram  R513, RMBHTRPRM', ST_SetSRID(ST_MakePoint(82.8099313, 17.5107448), 4326), 40);
    END IF;
    -- Insert Kotturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(82.8231599, 17.5272504), 4326), '{"K360, KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu  K360, KTR', ST_SetSRID(ST_MakePoint(82.8231599, 17.5272504), 4326), 40);
    END IF;
    -- Insert Mallayyapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mallayyapeta', ST_SetSRID(ST_MakePoint(82.820748, 17.5255331), 4326), '{"M413, MLYPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mallayyapeta, Visakhapatnam', 'Mallayyapeta  M413, MLYPT', ST_SetSRID(ST_MakePoint(82.820748, 17.5255331), 4326), 10);
    END IF;
    -- Insert Mettapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mettapalem', ST_SetSRID(ST_MakePoint(82.8036922, 17.5202916), 4326), '{"M314, MTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mettapalem, Visakhapatnam', 'Mettapalem  M314, MTPLM', ST_SetSRID(ST_MakePoint(82.8036922, 17.5202916), 4326), 40);
    END IF;
    -- Insert Saldigedda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Saldigedda', ST_SetSRID(ST_MakePoint(82.81678, 18.02525), 4326), '{"SLTJT, S432"}', jsonb_build_object('te', 'సల్దిగెడ్డ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Saldigedda, Visakhapatnam', 'Saldigedda సల్దిగెడ్డ SLTJT, S432', ST_SetSRID(ST_MakePoint(82.81678, 18.02525), 4326), 40);
    END IF;
    -- Insert Peddapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Peddapalem', ST_SetSRID(ST_MakePoint(82.8242951, 18.041454), 4326), '{"PTPLM, P314"}', jsonb_build_object('te', 'పెదపొలం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Peddapalem, Visakhapatnam', 'Peddapalem పెదపొలం PTPLM, P314', ST_SetSRID(ST_MakePoint(82.8242951, 18.041454), 4326), 10);
    END IF;
    -- Insert Galipalle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Galipalle', ST_SetSRID(ST_MakePoint(82.8310345, 18.045895), 4326), '{"KLPL, G414"}', jsonb_build_object('te', 'గుల్లిపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Galipalle, Visakhapatnam', 'Galipalle గుల్లిపల్లి KLPL, G414', ST_SetSRID(ST_MakePoint(82.8310345, 18.045895), 4326), 10);
    END IF;
    -- Insert Goonagummi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Goonagummi', ST_SetSRID(ST_MakePoint(82.8020965, 18.0389442), 4326), '{"KNKM, G525"}', jsonb_build_object('te', 'గూనగుమ్మి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Goonagummi, Visakhapatnam', 'Goonagummi గూనగుమ్మి KNKM, G525', ST_SetSRID(ST_MakePoint(82.8020965, 18.0389442), 4326), 10);
    END IF;
    -- Insert Jarakanda (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jarakanda', ST_SetSRID(ST_MakePoint(82.8475149, 18.0330447), 4326), '{"J625, JRKNT"}', jsonb_build_object('te', 'జర్రకొండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jarakanda, Visakhapatnam', 'Jarakanda జర్రకొండ J625, JRKNT', ST_SetSRID(ST_MakePoint(82.8475149, 18.0330447), 4326), 10);
    END IF;
    -- Insert Sariya (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sariya', ST_SetSRID(ST_MakePoint(82.8897352, 18.0371435), 4326), '{"SRY, S600"}', jsonb_build_object('te', 'సరియ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sariya, Visakhapatnam', 'Sariya సరియ SRY, S600', ST_SetSRID(ST_MakePoint(82.8897352, 18.0371435), 4326), 10);
    END IF;
    -- Insert Dabbalapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dabbalapalem', ST_SetSRID(ST_MakePoint(82.9355614, 18.0329138), 4326), '{"D141, TBLPLM"}', jsonb_build_object('te', 'దిబ్బపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dabbalapalem, Visakhapatnam', 'Dabbalapalem దిబ్బపాలెం D141, TBLPLM', ST_SetSRID(ST_MakePoint(82.9355614, 18.0329138), 4326), 10);
    END IF;
    -- Insert Korapurti (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Korapurti', ST_SetSRID(ST_MakePoint(82.9343003, 18.035014), 4326), '{"KRPRT, K616"}', jsonb_build_object('te', 'కోటపర్తి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Korapurti, Visakhapatnam', 'Korapurti కోటపర్తి KRPRT, K616', ST_SetSRID(ST_MakePoint(82.9343003, 18.035014), 4326), 10);
    END IF;
    -- Insert Lenipadu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lenipadu', ST_SetSRID(ST_MakePoint(82.9598465, 18.013869), 4326), '{"L513, LNPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lenipadu, Visakhapatnam', 'Lenipadu  L513, LNPT', ST_SetSRID(ST_MakePoint(82.9598465, 18.013869), 4326), 40);
    END IF;
    -- Insert Valasalagaruvu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Valasalagaruvu', ST_SetSRID(ST_MakePoint(82.9594885, 18.0269443), 4326), '{"FLSLKRF, V424"}', jsonb_build_object('te', 'వలసలగరువు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Valasalagaruvu, Visakhapatnam', 'Valasalagaruvu వలసలగరువు FLSLKRF, V424', ST_SetSRID(ST_MakePoint(82.9594885, 18.0269443), 4326), 10);
    END IF;
    -- Insert Venkatarajupuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkatarajupuram', ST_SetSRID(ST_MakePoint(82.9575654, 17.9577165), 4326), '{"V523, FNKTRJPRM"}', jsonb_build_object('te', 'వెంకటరాజుపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkatarajupuram, Visakhapatnam', 'Venkatarajupuram వెంకటరాజుపురం V523, FNKTRJPRM', ST_SetSRID(ST_MakePoint(82.9575654, 17.9577165), 4326), 40);
    END IF;
    -- Insert Tenugubudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tenugubudi', ST_SetSRID(ST_MakePoint(82.9561963, 17.963445), 4326), '{"TNKBT, T521"}', jsonb_build_object('te', 'తెనుగుపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tenugubudi, Visakhapatnam', 'Tenugubudi తెనుగుపూడి TNKBT, T521', ST_SetSRID(ST_MakePoint(82.9561963, 17.963445), 4326), 40);
    END IF;
    -- Insert Marepalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marepalle', ST_SetSRID(ST_MakePoint(82.9736854, 17.959659), 4326), '{"MRPL, M614"}', jsonb_build_object('te', 'మారెపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marepalle, Visakhapatnam', 'Marepalle మారెపల్లి MRPL, M614', ST_SetSRID(ST_MakePoint(82.9736854, 17.959659), 4326), 40);
    END IF;
    -- Insert Sriramapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sriramapuram', ST_SetSRID(ST_MakePoint(82.9536988, 17.992583), 4326), '{"S665, SRRMPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sriramapuram, Visakhapatnam', 'Sriramapuram  S665, SRRMPRM', ST_SetSRID(ST_MakePoint(82.9536988, 17.992583), 4326), 10);
    END IF;
    -- Insert Chimmidipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chimmidipalem', ST_SetSRID(ST_MakePoint(82.9658542, 17.9815858), 4326), '{"C531, XMTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chimmidipalem, Visakhapatnam', 'Chimmidipalem  C531, XMTPLM', ST_SetSRID(ST_MakePoint(82.9658542, 17.9815858), 4326), 10);
    END IF;
    -- Insert Yalagavaru (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yalagavaru', ST_SetSRID(ST_MakePoint(82.9267358, 17.988635), 4326), '{"YLKFR, Y421"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yalagavaru, Visakhapatnam', 'Yalagavaru  YLKFR, Y421', ST_SetSRID(ST_MakePoint(82.9267358, 17.988635), 4326), 10);
    END IF;
    -- Insert Revalabanda (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Revalabanda', ST_SetSRID(ST_MakePoint(82.9305682, 17.9851121), 4326), '{"R141, RFLBNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Revalabanda, Visakhapatnam', 'Revalabanda  R141, RFLBNT', ST_SetSRID(ST_MakePoint(82.9305682, 17.9851121), 4326), 10);
    END IF;
    -- Insert Pedda Gangavaram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Gangavaram', ST_SetSRID(ST_MakePoint(82.9399715, 17.9940863), 4326), '{"PT KNKFRM, P325"}', jsonb_build_object('te', 'పెద్ద గంగవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Gangavaram, Visakhapatnam', 'Pedda Gangavaram పెద్ద గంగవరం PT KNKFRM, P325', ST_SetSRID(ST_MakePoint(82.9399715, 17.9940863), 4326), 10);
    END IF;
    -- Insert Chinna Gangavaram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Gangavaram', ST_SetSRID(ST_MakePoint(82.9399811, 17.9860323), 4326), '{"C525, XN KNKFRM"}', jsonb_build_object('te', 'చిన్న గంగవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Gangavaram, Visakhapatnam', 'Chinna Gangavaram చిన్న గంగవరం C525, XN KNKFRM', ST_SetSRID(ST_MakePoint(82.9399811, 17.9860323), 4326), 10);
    END IF;
    -- Insert Chintalapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintalapalem', ST_SetSRID(ST_MakePoint(82.9186974, 17.9915132), 4326), '{"C534, XNTLPLM"}', jsonb_build_object('te', 'చింతలపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintalapalem, Visakhapatnam', 'Chintalapalem చింతలపాలెం C534, XNTLPLM', ST_SetSRID(ST_MakePoint(82.9186974, 17.9915132), 4326), 10);
    END IF;
    -- Insert Kotturu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(82.9243608, 17.97113), 4326), '{"K360, KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu  K360, KTR', ST_SetSRID(ST_MakePoint(82.9243608, 17.97113), 4326), 10);
    END IF;
    -- Insert Daricheruvu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Daricheruvu', ST_SetSRID(ST_MakePoint(82.9196778, 17.9756379), 4326), '{"D626, TRXRF"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Daricheruvu, Visakhapatnam', 'Daricheruvu  D626, TRXRF', ST_SetSRID(ST_MakePoint(82.9196778, 17.9756379), 4326), 10);
    END IF;
    -- Insert Kinchimada (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kinchimada', ST_SetSRID(ST_MakePoint(82.905959, 17.9792403), 4326), '{"K525, KNXMT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kinchimada, Visakhapatnam', 'Kinchimada  K525, KNXMT', ST_SetSRID(ST_MakePoint(82.905959, 17.9792403), 4326), 10);
    END IF;
    -- Insert Garisingi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Garisingi', ST_SetSRID(ST_MakePoint(82.9359066, 17.9699941), 4326), '{"KRSNJ, G625"}', jsonb_build_object('te', 'గరిసింగి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Garisingi, Visakhapatnam', 'Garisingi గరిసింగి KRSNJ, G625', ST_SetSRID(ST_MakePoint(82.9359066, 17.9699941), 4326), 40);
    END IF;
    -- Insert Manchala (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Manchala', ST_SetSRID(ST_MakePoint(82.8837709, 17.9478998), 4326), '{"M524, MNXL"}', jsonb_build_object('te', 'మంచాల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Manchala, Visakhapatnam', 'Manchala మంచాల M524, MNXL', ST_SetSRID(ST_MakePoint(82.8837709, 17.9478998), 4326), 40);
    END IF;
    -- Insert Marlagammu Kotturu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marlagammu Kotturu', ST_SetSRID(ST_MakePoint(82.8756252, 17.9157469), 4326), '{"M642, MRLKM KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marlagammu Kotturu, Visakhapatnam', 'Marlagammu Kotturu  M642, MRLKM KTR', ST_SetSRID(ST_MakePoint(82.8756252, 17.9157469), 4326), 10);
    END IF;
    -- Insert Virabhadrapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Virabhadrapuram', ST_SetSRID(ST_MakePoint(82.8561414, 17.9247843), 4326), '{"V613, FRBHTRPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Virabhadrapuram, Visakhapatnam', 'Virabhadrapuram  V613, FRBHTRPRM', ST_SetSRID(ST_MakePoint(82.8561414, 17.9247843), 4326), 40);
    END IF;
    -- Insert Suryanarayanapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Suryanarayanapuram', ST_SetSRID(ST_MakePoint(82.878215, 17.9266186), 4326), '{"SRYNRYNPRM, S656"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Suryanarayanapuram, Visakhapatnam', 'Suryanarayanapuram  SRYNRYNPRM, S656', ST_SetSRID(ST_MakePoint(82.878215, 17.9266186), 4326), 10);
    END IF;
    -- Insert Khandevaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Khandevaram', ST_SetSRID(ST_MakePoint(82.8605405, 17.9159839), 4326), '{"KHNTFRM, K531"}', jsonb_build_object('te', 'ఖండివరం అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Khandevaram, Visakhapatnam', 'Khandevaram ఖండివరం అగ్రహారం KHNTFRM, K531', ST_SetSRID(ST_MakePoint(82.8605405, 17.9159839), 4326), 40);
    END IF;
    -- Insert Cheedikada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cheedikada', ST_SetSRID(ST_MakePoint(82.8917871, 17.9277574), 4326), '{"XTKT, C323"}', jsonb_build_object('te', 'చీడికాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cheedikada, Visakhapatnam', 'Cheedikada చీడికాడ XTKT, C323', ST_SetSRID(ST_MakePoint(82.8917871, 17.9277574), 4326), 40);
    END IF;
    -- Insert Tangudupalle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tangudupalle', ST_SetSRID(ST_MakePoint(82.9061106, 17.9291738), 4326), '{"TNKTPL, T523"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tangudupalle, Visakhapatnam', 'Tangudupalle  TNKTPL, T523', ST_SetSRID(ST_MakePoint(82.9061106, 17.9291738), 4326), 10);
    END IF;
    -- Insert Konam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Konam', ST_SetSRID(ST_MakePoint(82.8577278, 17.972488), 4326), '{"K550, KNM"}', jsonb_build_object('te', 'కోనాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Konam, Visakhapatnam', 'Konam కోనాం K550, KNM', ST_SetSRID(ST_MakePoint(82.8577278, 17.972488), 4326), 40);
    END IF;
    -- Insert Gunti (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gunti', ST_SetSRID(ST_MakePoint(82.8739237, 17.9675053), 4326), '{"G530, KNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gunti, Visakhapatnam', 'Gunti  G530, KNT', ST_SetSRID(ST_MakePoint(82.8739237, 17.9675053), 4326), 10);
    END IF;
    -- Insert Kotturu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(82.8720121, 17.9663669), 4326), '{"K360, KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu  K360, KTR', ST_SetSRID(ST_MakePoint(82.8720121, 17.9663669), 4326), 10);
    END IF;
    -- Insert Gadabavidi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gadabavidi', ST_SetSRID(ST_MakePoint(82.8676829, 17.9490065), 4326), '{"G311, KTBFT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gadabavidi, Visakhapatnam', 'Gadabavidi  G311, KTBFT', ST_SetSRID(ST_MakePoint(82.8676829, 17.9490065), 4326), 10);
    END IF;
    -- Insert Kondavidi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondavidi', ST_SetSRID(ST_MakePoint(82.8615366, 17.9536852), 4326), '{"K531, KNTFT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondavidi, Visakhapatnam', 'Kondavidi  K531, KNTFT', ST_SetSRID(ST_MakePoint(82.8615366, 17.9536852), 4326), 10);
    END IF;
    -- Insert Chinna Konam (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Konam', ST_SetSRID(ST_MakePoint(82.8615346, 17.9569563), 4326), '{"XN KNM, C525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Konam, Visakhapatnam', 'Chinna Konam  XN KNM, C525', ST_SetSRID(ST_MakePoint(82.8615346, 17.9569563), 4326), 10);
    END IF;
    -- Insert Gadabapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gadabapalem', ST_SetSRID(ST_MakePoint(82.8662427, 17.9386224), 4326), '{"G311, KTBPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gadabapalem, Visakhapatnam', 'Gadabapalem  G311, KTBPLM', ST_SetSRID(ST_MakePoint(82.8662427, 17.9386224), 4326), 10);
    END IF;
    -- Insert Sirijam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sirijam', ST_SetSRID(ST_MakePoint(82.8695778, 17.9337432), 4326), '{"SRJM, S625"}', jsonb_build_object('te', 'శిరిజాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sirijam, Visakhapatnam', 'Sirijam శిరిజాం SRJM, S625', ST_SetSRID(ST_MakePoint(82.8695778, 17.9337432), 4326), 40);
    END IF;
    -- Insert Patha Vallabu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Patha Vallabu', ST_SetSRID(ST_MakePoint(82.8984487, 18.0085328), 4326), '{"P314, P0 FLB"}', jsonb_build_object('te', 'పాత వాలాబు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Patha Vallabu, Visakhapatnam', 'Patha Vallabu పాత వాలాబు P314, P0 FLB', ST_SetSRID(ST_MakePoint(82.8984487, 18.0085328), 4326), 10);
    END IF;
    -- Insert Cherakupalli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cherakupalli', ST_SetSRID(ST_MakePoint(82.8665655, 17.9975875), 4326), '{"XRKPL, C621"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cherakupalli, Visakhapatnam', 'Cherakupalli  XRKPL, C621', ST_SetSRID(ST_MakePoint(82.8665655, 17.9975875), 4326), 10);
    END IF;
    -- Insert Valabu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Valabu', ST_SetSRID(ST_MakePoint(82.8834081, 18.0082169), 4326), '{"V410, FLB"}', jsonb_build_object('te', 'వలబు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Valabu, Visakhapatnam', 'Valabu వలబు V410, FLB', ST_SetSRID(ST_MakePoint(82.8834081, 18.0082169), 4326), 10);
    END IF;
    -- Insert Panasaputtu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Panasaputtu', ST_SetSRID(ST_MakePoint(82.8122625, 17.9897768), 4326), '{"PNSPT, P521"}', jsonb_build_object('te', 'పనసపుట్టు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Panasaputtu, Visakhapatnam', 'Panasaputtu పనసపుట్టు PNSPT, P521', ST_SetSRID(ST_MakePoint(82.8122625, 17.9897768), 4326), 10);
    END IF;
    -- Insert Sikupanala (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sikupanala', ST_SetSRID(ST_MakePoint(82.8065035, 17.9771768), 4326), '{"SKPNL, S215"}', jsonb_build_object('te', 'సీకుపనస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sikupanala, Visakhapatnam', 'Sikupanala సీకుపనస SKPNL, S215', ST_SetSRID(ST_MakePoint(82.8065035, 17.9771768), 4326), 10);
    END IF;
    -- Insert Antilova (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Antilova', ST_SetSRID(ST_MakePoint(82.8003322, 17.9666192), 4326), '{"A534, ANTLF"}', jsonb_build_object('te', 'అంటిలోవ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Antilova, Visakhapatnam', 'Antilova అంటిలోవ A534, ANTLF', ST_SetSRID(ST_MakePoint(82.8003322, 17.9666192), 4326), 10);
    END IF;
    -- Insert Aluguru (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aluguru', ST_SetSRID(ST_MakePoint(82.8001183, 17.9775382), 4326), '{"ALKR, A426"}', jsonb_build_object('te', 'అలుగూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aluguru, Visakhapatnam', 'Aluguru అలుగూరు ALKR, A426', ST_SetSRID(ST_MakePoint(82.8001183, 17.9775382), 4326), 10);
    END IF;
    -- Insert Rayapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rayapalem', ST_SetSRID(ST_MakePoint(82.8400946, 17.9717931), 4326), '{"R145, RYPLM"}', jsonb_build_object('te', 'రాయిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rayapalem, Visakhapatnam', 'Rayapalem రాయిపాలెం R145, RYPLM', ST_SetSRID(ST_MakePoint(82.8400946, 17.9717931), 4326), 10);
    END IF;
    -- Insert Gatapanuka (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gatapanuka', ST_SetSRID(ST_MakePoint(82.8275769, 17.9614882), 4326), '{"KTPNK, G315"}', jsonb_build_object('te', 'గాచపణుకు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gatapanuka, Visakhapatnam', 'Gatapanuka గాచపణుకు KTPNK, G315', ST_SetSRID(ST_MakePoint(82.8275769, 17.9614882), 4326), 10);
    END IF;
    -- Insert Rellibanda (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rellibanda', ST_SetSRID(ST_MakePoint(82.8295336, 17.9709668), 4326), '{"R415, RLBNT"}', jsonb_build_object('te', 'రెల్లబండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rellibanda, Visakhapatnam', 'Rellibanda రెల్లబండ R415, RLBNT', ST_SetSRID(ST_MakePoint(82.8295336, 17.9709668), 4326), 10);
    END IF;
    -- Insert Ayinada (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ayinada', ST_SetSRID(ST_MakePoint(82.830655, 17.9816719), 4326), '{"AYNT, A530"}', jsonb_build_object('te', 'అయినాడ (పాడేరు)'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ayinada, Visakhapatnam', 'Ayinada అయినాడ (పాడేరు) AYNT, A530', ST_SetSRID(ST_MakePoint(82.830655, 17.9816719), 4326), 10);
    END IF;
    -- Insert Gadabavalasa (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gadabavalasa', ST_SetSRID(ST_MakePoint(82.8255139, 17.9832519), 4326), '{"G311, KTBFLS"}', jsonb_build_object('te', 'గదబవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gadabavalasa, Visakhapatnam', 'Gadabavalasa గదబవలస G311, KTBFLS', ST_SetSRID(ST_MakePoint(82.8255139, 17.9832519), 4326), 10);
    END IF;
    -- Insert Kondajiruku (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondajiruku', ST_SetSRID(ST_MakePoint(82.832926, 17.9794695), 4326), '{"KNTJRK, K532"}', jsonb_build_object('te', 'కొండజీలుగు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondajiruku, Visakhapatnam', 'Kondajiruku కొండజీలుగు KNTJRK, K532', ST_SetSRID(ST_MakePoint(82.832926, 17.9794695), 4326), 10);
    END IF;
    -- Insert Vanilamamidi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vanilamamidi', ST_SetSRID(ST_MakePoint(82.8170284, 17.9802626), 4326), '{"V545, FNLMMT"}', jsonb_build_object('te', 'వంటలమామిడి @ గాదిలమెట్ట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vanilamamidi, Visakhapatnam', 'Vanilamamidi వంటలమామిడి @ గాదిలమెట్ట V545, FNLMMT', ST_SetSRID(ST_MakePoint(82.8170284, 17.9802626), 4326), 10);
    END IF;
    -- Insert Jajulapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jajulapalem', ST_SetSRID(ST_MakePoint(82.8254066, 17.9876665), 4326), '{"JJLPLM, J241"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jajulapalem, Visakhapatnam', 'Jajulapalem  JJLPLM, J241', ST_SetSRID(ST_MakePoint(82.8254066, 17.9876665), 4326), 10);
    END IF;
    -- Insert Gudivada (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gudivada', ST_SetSRID(ST_MakePoint(82.8361629, 17.9931524), 4326), '{"KTFT, G313"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gudivada, Visakhapatnam', 'Gudivada  KTFT, G313', ST_SetSRID(ST_MakePoint(82.8361629, 17.9931524), 4326), 10);
    END IF;
    -- Insert Okapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Okapalem', ST_SetSRID(ST_MakePoint(82.8422605, 17.9954275), 4326), '{"O214, OKPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Okapalem, Visakhapatnam', 'Okapalem  O214, OKPLM', ST_SetSRID(ST_MakePoint(82.8422605, 17.9954275), 4326), 10);
    END IF;
    -- Insert Simalapalle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simalapalle', ST_SetSRID(ST_MakePoint(82.8498689, 18.001326), 4326), '{"S541, SMLPL"}', jsonb_build_object('te', 'చీమలపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simalapalle, Visakhapatnam', 'Simalapalle చీమలపల్లి S541, SMLPL', ST_SetSRID(ST_MakePoint(82.8498689, 18.001326), 4326), 10);
    END IF;
    -- Insert Tagulamamidi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tagulamamidi', ST_SetSRID(ST_MakePoint(82.8429032, 18.0000931), 4326), '{"TKLMMT, T245"}', jsonb_build_object('te', 'తగవులమామిడి గరువు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tagulamamidi, Visakhapatnam', 'Tagulamamidi తగవులమామిడి గరువు TKLMMT, T245', ST_SetSRID(ST_MakePoint(82.8429032, 18.0000931), 4326), 10);
    END IF;
    -- Insert Pothampalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pothampalem', ST_SetSRID(ST_MakePoint(82.8360284, 17.9952196), 4326), '{"P351, P0MPLM"}', jsonb_build_object('te', 'పోతంపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pothampalem, Visakhapatnam', 'Pothampalem పోతంపాలెం P351, P0MPLM', ST_SetSRID(ST_MakePoint(82.8360284, 17.9952196), 4326), 10);
    END IF;
    -- Insert Panasagedda (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Panasagedda', ST_SetSRID(ST_MakePoint(82.8514325, 17.9963399), 4326), '{"P522, PNSJT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Panasagedda, Visakhapatnam', 'Panasagedda  P522, PNSJT', ST_SetSRID(ST_MakePoint(82.8514325, 17.9963399), 4326), 10);
    END IF;
    -- Insert Bembi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bembi', ST_SetSRID(ST_MakePoint(82.8653667, 18.0060792), 4326), '{"BMB, B510"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bembi, Visakhapatnam', 'Bembi  BMB, B510', ST_SetSRID(ST_MakePoint(82.8653667, 18.0060792), 4326), 10);
    END IF;
    -- Insert Venkupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkupalem', ST_SetSRID(ST_MakePoint(82.9693214, 17.7221316), 4326), '{"V521, FNKPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkupalem, Visakhapatnam', 'Venkupalem  V521, FNKPLM', ST_SetSRID(ST_MakePoint(82.9693214, 17.7221316), 4326), 40);
    END IF;
    -- Insert Bavulavada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bavulavada', ST_SetSRID(ST_MakePoint(82.9852645, 17.7326523), 4326), '{"BFLFT, B141"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bavulavada, Visakhapatnam', 'Bavulavada  BFLFT, B141', ST_SetSRID(ST_MakePoint(82.9852645, 17.7326523), 4326), 40);
    END IF;
    -- Insert Thummapala (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Thummapala', ST_SetSRID(ST_MakePoint(82.9980839, 17.7182108), 4326), '{"T514, 0MPL"}', jsonb_build_object('te', 'తుమ్మపాల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Thummapala, Visakhapatnam', 'Thummapala తుమ్మపాల T514, 0MPL', ST_SetSRID(ST_MakePoint(82.9980839, 17.7182108), 4326), 40);
    END IF;
    -- Insert Munagapaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Munagapaka', ST_SetSRID(ST_MakePoint(82.9943311, 17.6368082), 4326), '{"MNKPK, M521"}', jsonb_build_object('te', 'మునగపాక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Munagapaka, Visakhapatnam', 'Munagapaka మునగపాక MNKPK, M521', ST_SetSRID(ST_MakePoint(82.9943311, 17.6368082), 4326), 40);
    END IF;
    -- Insert Rajupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajupeta', ST_SetSRID(ST_MakePoint(83.036815, 17.6224441), 4326), '{"RJPT, R213"}', jsonb_build_object('te', 'రాజుపేట అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajupeta, Visakhapatnam', 'Rajupeta రాజుపేట అగ్రహారం RJPT, R213', ST_SetSRID(ST_MakePoint(83.036815, 17.6224441), 4326), 40);
    END IF;
    -- Insert Bapadupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bapadupalem', ST_SetSRID(ST_MakePoint(83.0566752, 17.6205958), 4326), '{"B131, BPTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bapadupalem, Visakhapatnam', 'Bapadupalem  B131, BPTPLM', ST_SetSRID(ST_MakePoint(83.0566752, 17.6205958), 4326), 40);
    END IF;
    -- Insert Kottavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottavanipalem', ST_SetSRID(ST_MakePoint(83.0480053, 17.6173154), 4326), '{"K315, KTFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottavanipalem, Visakhapatnam', 'Kottavanipalem  K315, KTFNPLM', ST_SetSRID(ST_MakePoint(83.0480053, 17.6173154), 4326), 10);
    END IF;
    -- Insert Chittiboinapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chittiboinapalem', ST_SetSRID(ST_MakePoint(83.0514255, 17.6149363), 4326), '{"C315, XTBNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chittiboinapalem, Visakhapatnam', 'Chittiboinapalem  C315, XTBNPLM', ST_SetSRID(ST_MakePoint(83.0514255, 17.6149363), 4326), 40);
    END IF;
    -- Insert Paravada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Paravada', ST_SetSRID(ST_MakePoint(83.0842313, 17.6285455), 4326), '{"PRFT, P613"}', jsonb_build_object('te', 'పరవాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Paravada, Visakhapatnam', 'Paravada పరవాడ PRFT, P613', ST_SetSRID(ST_MakePoint(83.0842313, 17.6285455), 4326), 40);
    END IF;
    -- Insert Ramarayudupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramarayudupeta', ST_SetSRID(ST_MakePoint(83.0486221, 17.65922), 4326), '{"RMRYTPT, R563"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramarayudupeta, Visakhapatnam', 'Ramarayudupeta  RMRYTPT, R563', ST_SetSRID(ST_MakePoint(83.0486221, 17.65922), 4326), 40);
    END IF;
    -- Insert Gorlivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gorlivanipalem', ST_SetSRID(ST_MakePoint(83.0472362, 17.6741228), 4326), '{"G641, KRLFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gorlivanipalem, Visakhapatnam', 'Gorlivanipalem  G641, KRLFNPLM', ST_SetSRID(ST_MakePoint(83.0472362, 17.6741228), 4326), 40);
    END IF;
    -- Insert Rajupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajupalem', ST_SetSRID(ST_MakePoint(83.0530817, 17.6759819), 4326), '{"R214, RJPLM"}', jsonb_build_object('te', 'రాజుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajupalem, Visakhapatnam', 'Rajupalem రాజుపాలెం R214, RJPLM', ST_SetSRID(ST_MakePoint(83.0530817, 17.6759819), 4326), 40);
    END IF;
    -- Insert Erukuvanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Erukuvanipalem', ST_SetSRID(ST_MakePoint(83.0613464, 17.6777764), 4326), '{"ERKFNPLM, E621"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Erukuvanipalem, Visakhapatnam', 'Erukuvanipalem  ERKFNPLM, E621', ST_SetSRID(ST_MakePoint(83.0613464, 17.6777764), 4326), 40);
    END IF;
    -- Insert Valluru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Valluru', ST_SetSRID(ST_MakePoint(83.0449123, 17.6679993), 4326), '{"V460, FLR"}', jsonb_build_object('te', 'వల్లూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Valluru, Visakhapatnam', 'Valluru వల్లూరు V460, FLR', ST_SetSRID(ST_MakePoint(83.0449123, 17.6679993), 4326), 40);
    END IF;
    -- Insert Nagulapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nagulapalle', ST_SetSRID(ST_MakePoint(82.9979492, 17.6642883), 4326), '{"NKLPL, N241"}', jsonb_build_object('te', 'నాగులపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nagulapalle, Visakhapatnam', 'Nagulapalle నాగులపల్లి NKLPL, N241', ST_SetSRID(ST_MakePoint(82.9979492, 17.6642883), 4326), 40);
    END IF;
    -- Insert Vampolu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vampolu', ST_SetSRID(ST_MakePoint(82.9931247, 17.6555581), 4326), '{"V514, FMPL"}', jsonb_build_object('te', 'వొంపోలు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vampolu, Visakhapatnam', 'Vampolu వొంపోలు V514, FMPL', ST_SetSRID(ST_MakePoint(82.9931247, 17.6555581), 4326), 40);
    END IF;
    -- Insert Mulapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mulapeta', ST_SetSRID(ST_MakePoint(83.0114713, 17.6435096), 4326), '{"M413, MLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mulapeta, Visakhapatnam', 'Mulapeta  M413, MLPT', ST_SetSRID(ST_MakePoint(83.0114713, 17.6435096), 4326), 40);
    END IF;
    -- Insert Gangadevipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gangadevipeta', ST_SetSRID(ST_MakePoint(83.001339, 17.6519618), 4326), '{"KNKTFPT, G523"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gangadevipeta, Visakhapatnam', 'Gangadevipeta  KNKTFPT, G523', ST_SetSRID(ST_MakePoint(83.001339, 17.6519618), 4326), 40);
    END IF;
    -- Insert Gollapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapeta', ST_SetSRID(ST_MakePoint(83.0251427, 17.6335022), 4326), '{"G413, KLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapeta, Visakhapatnam', 'Gollapeta  G413, KLPT', ST_SetSRID(ST_MakePoint(83.0251427, 17.6335022), 4326), 40);
    END IF;
    -- Insert Patipalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Patipalli', ST_SetSRID(ST_MakePoint(83.0164554, 17.6332946), 4326), '{"PTPL, P314"}', jsonb_build_object('te', 'పాటిపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Patipalli, Visakhapatnam', 'Patipalli పాటిపల్లి PTPL, P314', ST_SetSRID(ST_MakePoint(83.0164554, 17.6332946), 4326), 40);
    END IF;
    -- Insert Kakarapalle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kakarapalle', ST_SetSRID(ST_MakePoint(83.0240477, 17.6289358), 4326), '{"KKRPL, K261"}', jsonb_build_object('te', 'కాకరపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kakarapalle, Visakhapatnam', 'Kakarapalle కాకరపల్లి KKRPL, K261', ST_SetSRID(ST_MakePoint(83.0240477, 17.6289358), 4326), 10);
    END IF;
    -- Insert Venkatapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkatapuram', ST_SetSRID(ST_MakePoint(83.0441404, 17.646618), 4326), '{"V523, FNKTPRM"}', jsonb_build_object('te', 'వెంకటాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkatapuram, Visakhapatnam', 'Venkatapuram వెంకటాపురం V523, FNKTPRM', ST_SetSRID(ST_MakePoint(83.0441404, 17.646618), 4326), 40);
    END IF;
    -- Insert Thotada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Thotada', ST_SetSRID(ST_MakePoint(83.0235075, 17.653688), 4326), '{"0TT, T330"}', jsonb_build_object('te', 'తోటాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Thotada, Visakhapatnam', 'Thotada తోటాడ 0TT, T330', ST_SetSRID(ST_MakePoint(83.0235075, 17.653688), 4326), 40);
    END IF;
    -- Insert Gorla Anakapllle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gorla Anakapllle', ST_SetSRID(ST_MakePoint(83.0225794, 17.657324), 4326), '{"G645, KRL ANKPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gorla Anakapllle, Visakhapatnam', 'Gorla Anakapllle  G645, KRL ANKPL', ST_SetSRID(ST_MakePoint(83.0225794, 17.657324), 4326), 40);
    END IF;
    -- Insert Narayudupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narayudupalem', ST_SetSRID(ST_MakePoint(83.0236628, 17.6503115), 4326), '{"N631, NRYTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narayudupalem, Visakhapatnam', 'Narayudupalem  N631, NRYTPLM', ST_SetSRID(ST_MakePoint(83.0236628, 17.6503115), 4326), 40);
    END IF;
    -- Insert T.Sirasapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'T.Sirasapalle', ST_SetSRID(ST_MakePoint(83.0305837, 17.6538122), 4326), '{"TSRSPL, T262"}', jsonb_build_object('te', 'టీ.సిరసపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'T.Sirasapalle, Visakhapatnam', 'T.Sirasapalle టీ.సిరసపల్లి TSRSPL, T262', ST_SetSRID(ST_MakePoint(83.0305837, 17.6538122), 4326), 40);
    END IF;
    -- Insert Pattepalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pattepalle', ST_SetSRID(ST_MakePoint(82.8441116, 18.0717615), 4326), '{"PTPL, P314"}', jsonb_build_object('te', 'పాటిపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pattepalle, Visakhapatnam', 'Pattepalle పాటిపల్లి PTPL, P314', ST_SetSRID(ST_MakePoint(82.8441116, 18.0717615), 4326), 40);
    END IF;
    -- Insert Bangarampudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bangarampudi', ST_SetSRID(ST_MakePoint(82.8226503, 18.0785833), 4326), '{"BNKRMPT, B526"}', jsonb_build_object('te', 'బంగారుబుడ్డి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bangarampudi, Visakhapatnam', 'Bangarampudi బంగారుబుడ్డి BNKRMPT, B526', ST_SetSRID(ST_MakePoint(82.8226503, 18.0785833), 4326), 40);
    END IF;
    -- Insert Biyyamgaruvu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Biyyamgaruvu', ST_SetSRID(ST_MakePoint(82.8373119, 18.091267), 4326), '{"B526, BYMKRF"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Biyyamgaruvu, Visakhapatnam', 'Biyyamgaruvu  B526, BYMKRF', ST_SetSRID(ST_MakePoint(82.8373119, 18.091267), 4326), 10);
    END IF;
    -- Insert Allaputtuvalasa (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Allaputtuvalasa', ST_SetSRID(ST_MakePoint(82.8494223, 18.0924449), 4326), '{"A413, ALPTFLS"}', jsonb_build_object('te', 'అల్లంపుట్టు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Allaputtuvalasa, Visakhapatnam', 'Allaputtuvalasa అల్లంపుట్టు A413, ALPTFLS', ST_SetSRID(ST_MakePoint(82.8494223, 18.0924449), 4326), 10);
    END IF;
    -- Insert Pathalu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pathalu', ST_SetSRID(ST_MakePoint(82.8519419, 18.0876477), 4326), '{"P0L, P340"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pathalu, Visakhapatnam', 'Pathalu  P0L, P340', ST_SetSRID(ST_MakePoint(82.8519419, 18.0876477), 4326), 10);
    END IF;
    -- Insert Nandiputtu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nandiputtu', ST_SetSRID(ST_MakePoint(82.8470507, 18.0965827), 4326), '{"N531, NNTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nandiputtu, Visakhapatnam', 'Nandiputtu  N531, NNTPT', ST_SetSRID(ST_MakePoint(82.8470507, 18.0965827), 4326), 10);
    END IF;
    -- Insert Ranakatta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ranakatta', ST_SetSRID(ST_MakePoint(82.8373553, 18.0832555), 4326), '{"RNKT, R523"}', jsonb_build_object('te', 'రణంకోట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ranakatta, Visakhapatnam', 'Ranakatta రణంకోట RNKT, R523', ST_SetSRID(ST_MakePoint(82.8373553, 18.0832555), 4326), 10);
    END IF;
    -- Insert Sampangiputtu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sampangiputtu', ST_SetSRID(ST_MakePoint(82.8382361, 18.0960225), 4326), '{"SMPNJPT, S515"}', jsonb_build_object('te', 'సంపంగిపుట్టు-2'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sampangiputtu, Visakhapatnam', 'Sampangiputtu సంపంగిపుట్టు-2 SMPNJPT, S515', ST_SetSRID(ST_MakePoint(82.8382361, 18.0960225), 4326), 10);
    END IF;
    -- Insert Sembi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sembi', ST_SetSRID(ST_MakePoint(82.822602, 18.0989594), 4326), '{"S510, SMB"}', jsonb_build_object('te', 'సెంబి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sembi, Visakhapatnam', 'Sembi సెంబి S510, SMB', ST_SetSRID(ST_MakePoint(82.822602, 18.0989594), 4326), 10);
    END IF;
    -- Insert Kammidipundu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kammidipundu', ST_SetSRID(ST_MakePoint(82.815948, 18.0937974), 4326), '{"K531, KMTPNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kammidipundu, Visakhapatnam', 'Kammidipundu  K531, KMTPNT', ST_SetSRID(ST_MakePoint(82.815948, 18.0937974), 4326), 10);
    END IF;
    -- Insert Bangarumetta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bangarumetta', ST_SetSRID(ST_MakePoint(82.8206501, 18.095075), 4326), '{"BNKRMT, B526"}', jsonb_build_object('te', 'బంగారుగరువు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bangarumetta, Visakhapatnam', 'Bangarumetta బంగారుగరువు BNKRMT, B526', ST_SetSRID(ST_MakePoint(82.8206501, 18.095075), 4326), 10);
    END IF;
    -- Insert Burgal (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Burgal', ST_SetSRID(ST_MakePoint(82.8106372, 18.0941889), 4326), '{"BRKL, B624"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Burgal, Visakhapatnam', 'Burgal  BRKL, B624', ST_SetSRID(ST_MakePoint(82.8106372, 18.0941889), 4326), 10);
    END IF;
    -- Insert Sesaipanuku (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sesaipanuku', ST_SetSRID(ST_MakePoint(82.8132855, 18.06497), 4326), '{"S215, SSPNK"}', jsonb_build_object('te', 'శేసాయిపానుకు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sesaipanuku, Visakhapatnam', 'Sesaipanuku శేసాయిపానుకు S215, SSPNK', ST_SetSRID(ST_MakePoint(82.8132855, 18.06497), 4326), 10);
    END IF;
    -- Insert Bandagur (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bandagur', ST_SetSRID(ST_MakePoint(82.8223448, 18.0643797), 4326), '{"BNTKR, B532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bandagur, Visakhapatnam', 'Bandagur  BNTKR, B532', ST_SetSRID(ST_MakePoint(82.8223448, 18.0643797), 4326), 10);
    END IF;
    -- Insert Palemadi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Palemadi', ST_SetSRID(ST_MakePoint(82.8190685, 18.0644234), 4326), '{"PLMT, P453"}', jsonb_build_object('te', 'పీసుమామిడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Palemadi, Visakhapatnam', 'Palemadi పీసుమామిడి PLMT, P453', ST_SetSRID(ST_MakePoint(82.8190685, 18.0644234), 4326), 10);
    END IF;
    -- Insert Ganake (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ganake', ST_SetSRID(ST_MakePoint(82.8608546, 18.0557643), 4326), '{"KNK, G520"}', jsonb_build_object('te', 'గణిక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ganake, Visakhapatnam', 'Ganake గణిక KNK, G520', ST_SetSRID(ST_MakePoint(82.8608546, 18.0557643), 4326), 10);
    END IF;
    -- Insert Madriba (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madriba', ST_SetSRID(ST_MakePoint(82.8793984, 18.0619328), 4326), '{"M361, MTRB"}', jsonb_build_object('te', 'మాద్రెబు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madriba, Visakhapatnam', 'Madriba మాద్రెబు M361, MTRB', ST_SetSRID(ST_MakePoint(82.8793984, 18.0619328), 4326), 10);
    END IF;
    -- Insert Dayarti (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dayarti', ST_SetSRID(ST_MakePoint(82.8963142, 18.0616134), 4326), '{"TYRT, D630"}', jsonb_build_object('te', 'దయర్తి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dayarti, Visakhapatnam', 'Dayarti దయర్తి TYRT, D630', ST_SetSRID(ST_MakePoint(82.8963142, 18.0616134), 4326), 10);
    END IF;
    -- Insert Tonkota (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tonkota', ST_SetSRID(ST_MakePoint(82.8741234, 18.0882959), 4326), '{"TNKT, T523"}', jsonb_build_object('te', 'తంకోట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tonkota, Visakhapatnam', 'Tonkota తంకోట TNKT, T523', ST_SetSRID(ST_MakePoint(82.8741234, 18.0882959), 4326), 10);
    END IF;
    -- Insert Tunisebu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tunisebu', ST_SetSRID(ST_MakePoint(82.8618633, 18.0759832), 4326), '{"T521, TNSB"}', jsonb_build_object('te', 'తునిసెబు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tunisebu, Visakhapatnam', 'Tunisebu తునిసెబు T521, TNSB', ST_SetSRID(ST_MakePoint(82.8618633, 18.0759832), 4326), 10);
    END IF;
    -- Insert Kondakodabu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondakodabu', ST_SetSRID(ST_MakePoint(83.0125022, 18.0357808), 4326), '{"KNTKTB, K532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondakodabu, Visakhapatnam', 'Kondakodabu  KNTKTB, K532', ST_SetSRID(ST_MakePoint(83.0125022, 18.0357808), 4326), 10);
    END IF;
    -- Insert Tamarabba (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tamarabba', ST_SetSRID(ST_MakePoint(83.0089942, 18.0488532), 4326), '{"TMRB, T561"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tamarabba, Visakhapatnam', 'Tamarabba  TMRB, T561', ST_SetSRID(ST_MakePoint(83.0089942, 18.0488532), 4326), 40);
    END IF;
    -- Insert Bodapadu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bodapadu', ST_SetSRID(ST_MakePoint(82.9926844, 18.0363872), 4326), '{"BTPT, B313"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bodapadu, Visakhapatnam', 'Bodapadu  BTPT, B313', ST_SetSRID(ST_MakePoint(82.9926844, 18.0363872), 4326), 10);
    END IF;
    -- Insert Pllapukondalu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pllapukondalu', ST_SetSRID(ST_MakePoint(83.0137051, 18.0472259), 4326), '{"P412, PLPKNTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pllapukondalu, Visakhapatnam', 'Pllapukondalu  P412, PLPKNTL', ST_SetSRID(ST_MakePoint(83.0137051, 18.0472259), 4326), 10);
    END IF;
    -- Insert Gummanti (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gummanti', ST_SetSRID(ST_MakePoint(82.9121916, 18.0642776), 4326), '{"KMNT, G553"}', jsonb_build_object('te', 'గుమ్మంటి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gummanti, Visakhapatnam', 'Gummanti గుమ్మంటి KMNT, G553', ST_SetSRID(ST_MakePoint(82.9121916, 18.0642776), 4326), 10);
    END IF;
    -- Insert Ballagaruvu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ballagaruvu', ST_SetSRID(ST_MakePoint(82.9365277, 18.0603312), 4326), '{"B426, BLKRF"}', jsonb_build_object('te', 'బల్లగరువు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ballagaruvu, Visakhapatnam', 'Ballagaruvu బల్లగరువు B426, BLKRF', ST_SetSRID(ST_MakePoint(82.9365277, 18.0603312), 4326), 10);
    END IF;
    -- Insert Malampeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Malampeta', ST_SetSRID(ST_MakePoint(82.9431613, 18.0600091), 4326), '{"M451, MLMPT"}', jsonb_build_object('te', 'మల్లంపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Malampeta, Visakhapatnam', 'Malampeta మల్లంపేట M451, MLMPT', ST_SetSRID(ST_MakePoint(82.9431613, 18.0600091), 4326), 10);
    END IF;
    -- Insert Chintapaka (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintapaka', ST_SetSRID(ST_MakePoint(82.9519124, 18.0565706), 4326), '{"XNTPK, C531"}', jsonb_build_object('te', 'చింతపాక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintapaka, Visakhapatnam', 'Chintapaka చింతపాక XNTPK, C531', ST_SetSRID(ST_MakePoint(82.9519124, 18.0565706), 4326), 10);
    END IF;
    -- Insert Engalapadu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Engalapadu', ST_SetSRID(ST_MakePoint(82.9470632, 18.0488501), 4326), '{"E524, ENKLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Engalapadu, Visakhapatnam', 'Engalapadu  E524, ENKLPT', ST_SetSRID(ST_MakePoint(82.9470632, 18.0488501), 4326), 10);
    END IF;
    -- Insert Tamatu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tamatu', ST_SetSRID(ST_MakePoint(82.9243129, 18.0893267), 4326), '{"TMT, T530"}', jsonb_build_object('te', 'టముట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tamatu, Visakhapatnam', 'Tamatu టముట TMT, T530', ST_SetSRID(ST_MakePoint(82.9243129, 18.0893267), 4326), 10);
    END IF;
    -- Insert Kondemkota (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondemkota', ST_SetSRID(ST_MakePoint(82.9258685, 18.0858777), 4326), '{"K535, KNTMKT"}', jsonb_build_object('te', 'కొండెంకోట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondemkota, Visakhapatnam', 'Kondemkota కొండెంకోట K535, KNTMKT', ST_SetSRID(ST_MakePoint(82.9258685, 18.0858777), 4326), 10);
    END IF;
    -- Insert Pinakota (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pinakota', ST_SetSRID(ST_MakePoint(82.9508869, 18.0805113), 4326), '{"PNKT, P523"}', jsonb_build_object('te', 'పినకోట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pinakota, Visakhapatnam', 'Pinakota పినకోట PNKT, P523', ST_SetSRID(ST_MakePoint(82.9508869, 18.0805113), 4326), 40);
    END IF;
    -- Insert Chatakamba (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chatakamba', ST_SetSRID(ST_MakePoint(82.9637582, 18.0921547), 4326), '{"XTKMB, C325"}', jsonb_build_object('te', 'చాటకంబ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chatakamba, Visakhapatnam', 'Chatakamba చాటకంబ XTKMB, C325', ST_SetSRID(ST_MakePoint(82.9637582, 18.0921547), 4326), 10);
    END IF;
    -- Insert Chintalapudi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintalapudi', ST_SetSRID(ST_MakePoint(83.0442774, 18.071963), 4326), '{"C534, XNTLPT"}', jsonb_build_object('te', 'చింతలపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintalapudi, Visakhapatnam', 'Chintalapudi చింతలపూడి C534, XNTLPT', ST_SetSRID(ST_MakePoint(83.0442774, 18.071963), 4326), 10);
    END IF;
    -- Insert Pandirimamidi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pandirimamidi', ST_SetSRID(ST_MakePoint(82.9974904, 18.0772976), 4326), '{"P536, PNTRMMT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pandirimamidi, Visakhapatnam', 'Pandirimamidi  P536, PNTRMMT', ST_SetSRID(ST_MakePoint(82.9974904, 18.0772976), 4326), 10);
    END IF;
    -- Insert Kotturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(83.0295167, 18.0728652), 4326), '{"K360, KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu  K360, KTR', ST_SetSRID(ST_MakePoint(83.0295167, 18.0728652), 4326), 40);
    END IF;
    -- Insert Sammeda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sammeda', ST_SetSRID(ST_MakePoint(83.0217422, 18.0772039), 4326), '{"S530, SMT"}', jsonb_build_object('te', 'సమ్మెద'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sammeda, Visakhapatnam', 'Sammeda సమ్మెద S530, SMT', ST_SetSRID(ST_MakePoint(83.0217422, 18.0772039), 4326), 40);
    END IF;
    -- Insert Korada (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Korada', ST_SetSRID(ST_MakePoint(83.0310128, 18.069732), 4326), '{"KRT, K630"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Korada, Visakhapatnam', 'Korada  KRT, K630', ST_SetSRID(ST_MakePoint(83.0310128, 18.069732), 4326), 10);
    END IF;
    -- Insert Bandigaruvu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bandigaruvu', ST_SetSRID(ST_MakePoint(83.017939, 18.0949245), 4326), '{"B532, BNTKRF"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bandigaruvu, Visakhapatnam', 'Bandigaruvu  B532, BNTKRF', ST_SetSRID(ST_MakePoint(83.017939, 18.0949245), 4326), 10);
    END IF;
    -- Insert Kovelapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kovelapalle', ST_SetSRID(ST_MakePoint(82.8964476, 17.7942111), 4326), '{"K141, KFLPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kovelapalle, Visakhapatnam', 'Kovelapalle  K141, KFLPL', ST_SetSRID(ST_MakePoint(82.8964476, 17.7942111), 4326), 40);
    END IF;
    -- Insert Bennavolu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bennavolu', ST_SetSRID(ST_MakePoint(82.9118292, 17.7995426), 4326), '{"B514, BNFL"}', jsonb_build_object('te', 'బెన్నవోలు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bennavolu, Visakhapatnam', 'Bennavolu బెన్నవోలు B514, BNFL', ST_SetSRID(ST_MakePoint(82.9118292, 17.7995426), 4326), 40);
    END IF;
    -- Insert Uderu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Uderu', ST_SetSRID(ST_MakePoint(82.982039, 17.753215), 4326), '{"U360, UTR"}', jsonb_build_object('te', 'వూడేరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Uderu, Visakhapatnam', 'Uderu వూడేరు U360, UTR', ST_SetSRID(ST_MakePoint(82.982039, 17.753215), 4326), 40);
    END IF;
    -- Insert Sitanagaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sitanagaram', ST_SetSRID(ST_MakePoint(82.962739, 17.7360856), 4326), '{"STNKRM, S352"}', jsonb_build_object('te', 'సీతానగరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sitanagaram, Visakhapatnam', 'Sitanagaram సీతానగరం STNKRM, S352', ST_SetSRID(ST_MakePoint(82.962739, 17.7360856), 4326), 40);
    END IF;
    -- Insert Dibbapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dibbapalem', ST_SetSRID(ST_MakePoint(82.968281, 17.7423852), 4326), '{"D114, TBPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dibbapalem, Visakhapatnam', 'Dibbapalem  D114, TBPLM', ST_SetSRID(ST_MakePoint(82.968281, 17.7423852), 4326), 40);
    END IF;
    -- Insert Tagarampudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tagarampudi', ST_SetSRID(ST_MakePoint(82.9526898, 17.7526846), 4326), '{"T265, TKRMPT"}', jsonb_build_object('te', 'తగరంపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tagarampudi, Visakhapatnam', 'Tagarampudi తగరంపూడి T265, TKRMPT', ST_SetSRID(ST_MakePoint(82.9526898, 17.7526846), 4326), 40);
    END IF;
    -- Insert Duddupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Duddupalem', ST_SetSRID(ST_MakePoint(82.9925062, 17.78822), 4326), '{"TTPLM, D314"}', jsonb_build_object('te', 'దుడ్డుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Duddupalem, Visakhapatnam', 'Duddupalem దుడ్డుపాలెం TTPLM, D314', ST_SetSRID(ST_MakePoint(82.9925062, 17.78822), 4326), 40);
    END IF;
    -- Insert Varada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Varada', ST_SetSRID(ST_MakePoint(83.0397856, 17.935816), 4326), '{"V630, FRT"}', jsonb_build_object('te', 'వారడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Varada, Visakhapatnam', 'Varada వారడ V630, FRT', ST_SetSRID(ST_MakePoint(83.0397856, 17.935816), 4326), 40);
    END IF;
    -- Insert M. Alamanda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'M. Alamanda', ST_SetSRID(ST_MakePoint(83.003157, 17.931495), 4326), '{"M455, M ALMNT"}', jsonb_build_object('te', 'అలమండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'M. Alamanda, Visakhapatnam', 'M. Alamanda అలమండ M455, M ALMNT', ST_SetSRID(ST_MakePoint(83.003157, 17.931495), 4326), 40);
    END IF;
    -- Insert Yandapallipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yandapallipalem', ST_SetSRID(ST_MakePoint(83.020529, 17.9310782), 4326), '{"Y531, YNTPLPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yandapallipalem, Visakhapatnam', 'Yandapallipalem  Y531, YNTPLPLM', ST_SetSRID(ST_MakePoint(83.020529, 17.9310782), 4326), 10);
    END IF;
    -- Insert Taruva (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Taruva', ST_SetSRID(ST_MakePoint(82.9750244, 17.9367399), 4326), '{"TRF, T610"}', jsonb_build_object('te', 'తారువ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Taruva, Visakhapatnam', 'Taruva తారువ TRF, T610', ST_SetSRID(ST_MakePoint(82.9750244, 17.9367399), 4326), 40);
    END IF;
    -- Insert Timiram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Timiram', ST_SetSRID(ST_MakePoint(82.9631449, 17.9247536), 4326), '{"T565, TMRM"}', jsonb_build_object('te', 'తిమిరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Timiram, Visakhapatnam', 'Timiram తిమిరం T565, TMRM', ST_SetSRID(ST_MakePoint(82.9631449, 17.9247536), 4326), 40);
    END IF;
    -- Insert Mamidipalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mamidipalle', ST_SetSRID(ST_MakePoint(82.9715728, 17.923362), 4326), '{"M531, MMTPL"}', jsonb_build_object('te', 'మామిడిపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mamidipalle, Visakhapatnam', 'Mamidipalle మామిడిపల్లి M531, MMTPL', ST_SetSRID(ST_MakePoint(82.9715728, 17.923362), 4326), 40);
    END IF;
    -- Insert Chidipalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chidipalle', ST_SetSRID(ST_MakePoint(82.9434572, 17.9325061), 4326), '{"XTPL, C314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chidipalle, Visakhapatnam', 'Chidipalle  XTPL, C314', ST_SetSRID(ST_MakePoint(82.9434572, 17.9325061), 4326), 40);
    END IF;
    -- Insert Vellanki (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vellanki', ST_SetSRID(ST_MakePoint(82.9333987, 17.9355588), 4326), '{"V452, FLNK"}', jsonb_build_object('te', 'వెల్లంకి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vellanki, Visakhapatnam', 'Vellanki వెల్లంకి V452, FLNK', ST_SetSRID(ST_MakePoint(82.9333987, 17.9355588), 4326), 10);
    END IF;
    -- Insert Kotturu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(82.9436499, 17.9384037), 4326), '{"K360, KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu  K360, KTR', ST_SetSRID(ST_MakePoint(82.9436499, 17.9384037), 4326), 10);
    END IF;
    -- Insert Vakapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vakapalle', ST_SetSRID(ST_MakePoint(82.9489229, 17.9346833), 4326), '{"FKPL, V214"}', jsonb_build_object('te', 'వాకపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vakapalle, Visakhapatnam', 'Vakapalle వాకపల్లి FKPL, V214', ST_SetSRID(ST_MakePoint(82.9489229, 17.9346833), 4326), 40);
    END IF;
    -- Insert Neelampeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Neelampeta', ST_SetSRID(ST_MakePoint(82.9403213, 17.937974), 4326), '{"NLMPT, N451"}', jsonb_build_object('te', 'నీలంపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Neelampeta, Visakhapatnam', 'Neelampeta నీలంపేట NLMPT, N451', ST_SetSRID(ST_MakePoint(82.9403213, 17.937974), 4326), 10);
    END IF;
    -- Insert Turuvolu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Turuvolu', ST_SetSRID(ST_MakePoint(82.92452, 17.9259654), 4326), '{"T614, TRFL"}', jsonb_build_object('te', 'తురువోలు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Turuvolu, Visakhapatnam', 'Turuvolu తురువోలు T614, TRFL', ST_SetSRID(ST_MakePoint(82.92452, 17.9259654), 4326), 40);
    END IF;
    -- Insert Gedduru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gedduru', ST_SetSRID(ST_MakePoint(82.8294644, 17.9237076), 4326), '{"G360, JTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gedduru, Visakhapatnam', 'Gedduru  G360, JTR', ST_SetSRID(ST_MakePoint(82.8294644, 17.9237076), 4326), 40);
    END IF;
    -- Insert Medacharla (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Medacharla', ST_SetSRID(ST_MakePoint(82.8461607, 17.9362682), 4326), '{"MTXRL, M326"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Medacharla, Visakhapatnam', 'Medacharla  MTXRL, M326', ST_SetSRID(ST_MakePoint(82.8461607, 17.9362682), 4326), 10);
    END IF;
    -- Insert Kotta Boyapadu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Boyapadu', ST_SetSRID(ST_MakePoint(82.8418494, 17.9106414), 4326), '{"KT BYPT, K311"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Boyapadu, Visakhapatnam', 'Kotta Boyapadu  KT BYPT, K311', ST_SetSRID(ST_MakePoint(82.8418494, 17.9106414), 4326), 40);
    END IF;
    -- Insert Lingabhupalapatnam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lingabhupalapatnam', ST_SetSRID(ST_MakePoint(82.8622389, 17.9111491), 4326), '{"L521, LNKBHPLPTNM"}', jsonb_build_object('te', 'లింగభూపాల పట్నం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lingabhupalapatnam, Visakhapatnam', 'Lingabhupalapatnam లింగభూపాల పట్నం L521, LNKBHPLPTNM', ST_SetSRID(ST_MakePoint(82.8622389, 17.9111491), 4326), 40);
    END IF;
    -- Insert Jaitavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jaitavaram', ST_SetSRID(ST_MakePoint(82.8755137, 17.9031298), 4326), '{"JTFRM, J316"}', jsonb_build_object('te', 'జైతవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jaitavaram, Visakhapatnam', 'Jaitavaram జైతవరం JTFRM, J316', ST_SetSRID(ST_MakePoint(82.8755137, 17.9031298), 4326), 40);
    END IF;
    -- Insert Singavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Singavaram', ST_SetSRID(ST_MakePoint(82.870574, 17.8963932), 4326), '{"SNKFRM, S521"}', jsonb_build_object('te', 'బైలపూడి సింగవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Singavaram, Visakhapatnam', 'Singavaram బైలపూడి సింగవరం SNKFRM, S521', ST_SetSRID(ST_MakePoint(82.870574, 17.8963932), 4326), 40);
    END IF;
    -- Insert Appalarajupuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appalarajupuram', ST_SetSRID(ST_MakePoint(82.8650531, 17.8957029), 4326), '{"A146, APLRJPRM"}', jsonb_build_object('te', 'అప్పలరాజుపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appalarajupuram, Visakhapatnam', 'Appalarajupuram అప్పలరాజుపురం A146, APLRJPRM', ST_SetSRID(ST_MakePoint(82.8650531, 17.8957029), 4326), 40);
    END IF;
    -- Insert Gattamamidi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gattamamidi', ST_SetSRID(ST_MakePoint(82.8029107, 18.0771372), 4326), '{"G355, KTMMT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gattamamidi, Visakhapatnam', 'Gattamamidi  G355, KTMMT', ST_SetSRID(ST_MakePoint(82.8029107, 18.0771372), 4326), 10);
    END IF;
    -- Insert Anandapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Anandapuram', ST_SetSRID(ST_MakePoint(82.8291128, 17.6425704), 4326), '{"ANNTPRM, A553"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Anandapuram, Visakhapatnam', 'Anandapuram  ANNTPRM, A553', ST_SetSRID(ST_MakePoint(82.8291128, 17.6425704), 4326), 10);
    END IF;
    -- Insert Pata Kannurupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Kannurupalem', ST_SetSRID(ST_MakePoint(82.8123643, 17.6389971), 4326), '{"PT KNRPLM, P325"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Kannurupalem, Visakhapatnam', 'Pata Kannurupalem  PT KNRPLM, P325', ST_SetSRID(ST_MakePoint(82.8123643, 17.6389971), 4326), 40);
    END IF;
    -- Insert Theeda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Theeda', ST_SetSRID(ST_MakePoint(82.8139958, 17.6491665), 4326), '{"T300, 0T"}', jsonb_build_object('te', 'తీడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Theeda, Visakhapatnam', 'Theeda తీడ T300, 0T', ST_SetSRID(ST_MakePoint(82.8139958, 17.6491665), 4326), 40);
    END IF;
    -- Insert Kannurupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kannurupalem', ST_SetSRID(ST_MakePoint(82.8198956, 17.6338735), 4326), '{"K561, KNRPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kannurupalem, Visakhapatnam', 'Kannurupalem  K561, KNRPLM', ST_SetSRID(ST_MakePoint(82.8198956, 17.6338735), 4326), 40);
    END IF;
    -- Insert Sundarayyapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sundarayyapeta', ST_SetSRID(ST_MakePoint(82.8350208, 17.6333977), 4326), '{"SNTRYPT, S536"}', jsonb_build_object('te', 'సుందరయ్యపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sundarayyapeta, Visakhapatnam', 'Sundarayyapeta సుందరయ్యపేట SNTRYPT, S536', ST_SetSRID(ST_MakePoint(82.8350208, 17.6333977), 4326), 10);
    END IF;
    -- Insert Narayanapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narayanapalem', ST_SetSRID(ST_MakePoint(82.8429632, 17.636724), 4326), '{"N651, NRYNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narayanapalem, Visakhapatnam', 'Narayanapalem  N651, NRYNPLM', ST_SetSRID(ST_MakePoint(82.8429632, 17.636724), 4326), 10);
    END IF;
    -- Insert Kotturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(82.837356, 17.6375959), 4326), '{"K360, KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu  K360, KTR', ST_SetSRID(ST_MakePoint(82.837356, 17.6375959), 4326), 40);
    END IF;
    -- Insert Totakurapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Totakurapalem', ST_SetSRID(ST_MakePoint(82.8060716, 17.689285), 4326), '{"TTKRPLM, T326"}', jsonb_build_object('te', 'తోటకూరపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Totakurapalem, Visakhapatnam', 'Totakurapalem తోటకూరపాలెం TTKRPLM, T326', ST_SetSRID(ST_MakePoint(82.8060716, 17.689285), 4326), 40);
    END IF;
    -- Insert Dr. VJs Cosmetic Surgery& Hair Transplantation Centre (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr. VJs Cosmetic Surgery& Hair Transplantation Centre', ST_SetSRID(ST_MakePoint(83.2984784, 17.7236037), 4326), '{"D612, TR FJS KSMTK SRJR HR TRNSPLNTXN SNTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr. VJs Cosmetic Surgery& Hair Transplantation Centre, Visakhapatnam', 'Dr. VJs Cosmetic Surgery& Hair Transplantation Centre  D612, TR FJS KSMTK SRJR HR TRNSPLNTXN SNTR', ST_SetSRID(ST_MakePoint(83.2984784, 17.7236037), 4326), 50);
    END IF;
    -- Insert Maa Kitchen (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maa Kitchen', ST_SetSRID(ST_MakePoint(83.2208551, 17.7577154), 4326), '{"M232, M KXN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maa Kitchen, Visakhapatnam', 'Maa Kitchen  M232, M KXN', ST_SetSRID(ST_MakePoint(83.2208551, 17.7577154), 4326), 10);
    END IF;
    -- Insert Lankelapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lankelapalem', ST_SetSRID(ST_MakePoint(83.0961764, 17.687132), 4326), '{"L524, LNKLPLM"}', jsonb_build_object('te', 'లంకెలపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lankelapalem, Visakhapatnam', 'Lankelapalem లంకెలపాలెం L524, LNKLPLM', ST_SetSRID(ST_MakePoint(83.0961764, 17.687132), 4326), 60);
    END IF;
    -- Insert Padmavathi Nagar (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Padmavathi Nagar', ST_SetSRID(ST_MakePoint(83.2323093, 17.7755482), 4326), '{"P351, PTMF0 NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Padmavathi Nagar, Visakhapatnam', 'Padmavathi Nagar  P351, PTMF0 NKR', ST_SetSRID(ST_MakePoint(83.2323093, 17.7755482), 4326), 10);
    END IF;
    -- Insert HSBC BPO (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HSBC BPO', ST_SetSRID(ST_MakePoint(83.317566, 17.7222129), 4326), '{"H212, HSBK BP"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HSBC BPO, Visakhapatnam', 'HSBC BPO  H212, HSBK BP', ST_SetSRID(ST_MakePoint(83.317566, 17.7222129), 4326), 10);
    END IF;
    -- Insert Srinivasa Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srinivasa Nagar', ST_SetSRID(ST_MakePoint(83.2804763, 17.7421223), 4326), '{"SRNFS NKR, S651"}', jsonb_build_object('te', 'శ్రీనివాసా నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srinivasa Nagar, Visakhapatnam', 'Srinivasa Nagar శ్రీనివాసా నగర్ SRNFS NKR, S651', ST_SetSRID(ST_MakePoint(83.2804763, 17.7421223), 4326), 60);
    END IF;
    -- Insert sri gawri degree and PG College (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'sri gawri degree and PG College', ST_SetSRID(ST_MakePoint(83.2716113, 17.7354822), 4326), '{"SR KR TKR ANT PK KLJ, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'sri gawri degree and PG College, Visakhapatnam', 'sri gawri degree and PG College  SR KR TKR ANT PK KLJ, S626', ST_SetSRID(ST_MakePoint(83.2716113, 17.7354822), 4326), 50);
    END IF;
    -- Insert BOI (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'BOI', ST_SetSRID(ST_MakePoint(83.2726273, 17.7342382), 4326), '{"B, B000"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'BOI, Visakhapatnam', 'BOI  B, B000', ST_SetSRID(ST_MakePoint(83.2726273, 17.7342382), 4326), 10);
    END IF;
    -- Insert SBI (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SBI', ST_SetSRID(ST_MakePoint(83.2703989, 17.7353485), 4326), '{"S100, SB"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SBI, Visakhapatnam', 'SBI  S100, SB', ST_SetSRID(ST_MakePoint(83.2703989, 17.7353485), 4326), 10);
    END IF;
END $$;