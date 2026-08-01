-- ==============================================================================
-- 10. BULK OSM DATA SEED (GVMC + 50km RADIUS)
-- ==============================================================================
DO $$
DECLARE
    vzg_city_id UUID;
    new_loc_id UUID;
BEGIN
    SELECT id INTO vzg_city_id FROM geo.cities WHERE name = 'Visakhapatnam' LIMIT 1;
    
    IF vzg_city_id IS NULL THEN
        RAISE EXCEPTION 'Visakhapatnam city not found. Run previous seeds first.';
    END IF;
    
    -- Insert Pata Polavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Polavaram', ST_SetSRID(ST_MakePoint(82.818375, 17.398922), 4326), '{"P314, PT PLFRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Polavaram, Visakhapatnam', 'Pata Polavaram  P314, PT PLFRM', ST_SetSRID(ST_MakePoint(82.818375, 17.398922), 4326), 40);
    END IF;
    -- Insert Pudimadaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pudimadaka', ST_SetSRID(ST_MakePoint(83.0030712, 17.4924469), 4326), '{"P353, PTMTK"}', jsonb_build_object('te', 'పూడిమడక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pudimadaka, Visakhapatnam', 'Pudimadaka పూడిమడక P353, PTMTK', ST_SetSRID(ST_MakePoint(83.0030712, 17.4924469), 4326), 40);
    END IF;
    -- Insert Visakhapatnam (city)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Visakhapatnam', ST_SetSRID(ST_MakePoint(83.2921297, 17.6935526), 4326), '{"V221, FSKHPTNM"}', jsonb_build_object('te', 'విశాఖపట్నం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Visakhapatnam, Visakhapatnam', 'Visakhapatnam విశాఖపట్నం V221, FSKHPTNM', ST_SetSRID(ST_MakePoint(83.2921297, 17.6935526), 4326), 10);
    END IF;
    -- Insert Sabbavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sabbavaram', ST_SetSRID(ST_MakePoint(83.1244927, 17.7905129), 4326), '{"S116, SBFRM"}', jsonb_build_object('te', 'సబ్బవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sabbavaram, Visakhapatnam', 'Sabbavaram సబ్బవరం S116, SBFRM', ST_SetSRID(ST_MakePoint(83.1244927, 17.7905129), 4326), 40);
    END IF;
    -- Insert Chodavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chodavaram', ST_SetSRID(ST_MakePoint(82.9344845, 17.8296788), 4326), '{"XTFRM, C316"}', jsonb_build_object('te', 'చోడవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chodavaram, Visakhapatnam', 'Chodavaram చోడవరం XTFRM, C316', ST_SetSRID(ST_MakePoint(82.9344845, 17.8296788), 4326), 40);
    END IF;
    -- Insert Vaddadi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vaddadi', ST_SetSRID(ST_MakePoint(82.8746874, 17.8480307), 4326), '{"FTT, V330"}', jsonb_build_object('te', 'వడ్డాది'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vaddadi, Visakhapatnam', 'Vaddadi వడ్డాది FTT, V330', ST_SetSRID(ST_MakePoint(82.8746874, 17.8480307), 4326), 40);
    END IF;
    -- Insert Bheemunipatnam ( Bheemili ) (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bheemunipatnam ( Bheemili )', ST_SetSRID(ST_MakePoint(83.4508737, 17.8913852), 4326), '{"B551, BHMNPTNM BHML "}', jsonb_build_object('te', 'భీమునిపట్నం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bheemunipatnam ( Bheemili ), Visakhapatnam', 'Bheemunipatnam ( Bheemili ) భీమునిపట్నం B551, BHMNPTNM BHML ', ST_SetSRID(ST_MakePoint(83.4508737, 17.8913852), 4326), 80);
    END IF;
    -- Insert Madugula (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madugula', ST_SetSRID(ST_MakePoint(82.8145453, 17.9155283), 4326), '{"M324, MTKL"}', jsonb_build_object('te', 'మాడుగుల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madugula, Visakhapatnam', 'Madugula మాడుగుల M324, MTKL', ST_SetSRID(ST_MakePoint(82.8145453, 17.9155283), 4326), 40);
    END IF;
    -- Insert Bhogapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhogapuram', ST_SetSRID(ST_MakePoint(83.4978188, 18.0321195), 4326), '{"BHKPRM, B216"}', jsonb_build_object('te', 'భోగాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhogapuram, Visakhapatnam', 'Bhogapuram భోగాపురం BHKPRM, B216', ST_SetSRID(ST_MakePoint(83.4978188, 18.0321195), 4326), 40);
    END IF;
    -- Insert Denkada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Denkada', ST_SetSRID(ST_MakePoint(83.4750949, 18.076142), 4326), '{"TNKT, D523"}', jsonb_build_object('te', 'డెంకాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Denkada, Visakhapatnam', 'Denkada డెంకాడ TNKT, D523', ST_SetSRID(ST_MakePoint(83.4750949, 18.076142), 4326), 40);
    END IF;
    -- Insert Pusapatirega (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pusapatirega', ST_SetSRID(ST_MakePoint(83.551775, 18.0914739), 4326), '{"PSPTRK, P213"}', jsonb_build_object('te', 'పూసపాటిరేగ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pusapatirega, Visakhapatnam', 'Pusapatirega పూసపాటిరేగ PSPTRK, P213', ST_SetSRID(ST_MakePoint(83.551775, 18.0914739), 4326), 40);
    END IF;
    -- Insert Rushikonda (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rushikonda', ST_SetSRID(ST_MakePoint(83.3848672, 17.7930699), 4326), '{"R225, RXKNT, Rushikonda Beach, Rushikonda Hills"}', jsonb_build_object('te', 'ఋషి కొండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rushikonda, Visakhapatnam', 'Rushikonda ఋషి కొండ R225, RXKNT, Rushikonda Beach, Rushikonda Hills', ST_SetSRID(ST_MakePoint(83.3848672, 17.7930699), 4326), 80);
    END IF;
    -- Insert Chittivalasa (town)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chittivalasa', ST_SetSRID(ST_MakePoint(83.4290865, 17.9345148), 4326), '{"XTFLS, C314"}', jsonb_build_object('te', 'చిట్టివలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chittivalasa, Visakhapatnam', 'Chittivalasa చిట్టివలస XTFLS, C314', ST_SetSRID(ST_MakePoint(83.4290865, 17.9345148), 4326), 10);
    END IF;
    -- Insert Ukkunagaram Township (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ukkunagaram Township', ST_SetSRID(ST_MakePoint(83.1486506, 17.6551095), 4326), '{"UKNKRM TNXP, U252"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ukkunagaram Township, Visakhapatnam', 'Ukkunagaram Township  UKNKRM TNXP, U252', ST_SetSRID(ST_MakePoint(83.1486506, 17.6551095), 4326), 80);
    END IF;
    -- Insert Simhachalam (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simhachalam', ST_SetSRID(ST_MakePoint(83.2433486, 17.7726291), 4326), '{"SMHXLM, S524"}', jsonb_build_object('te', 'సింహాచలం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simhachalam, Visakhapatnam', 'Simhachalam సింహాచలం SMHXLM, S524', ST_SetSRID(ST_MakePoint(83.2433486, 17.7726291), 4326), 80);
    END IF;
    -- Insert Vepagunta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vepagunta', ST_SetSRID(ST_MakePoint(83.2153678, 17.7744273), 4326), '{"V125, FPKNT"}', jsonb_build_object('te', 'వేపగుంట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vepagunta, Visakhapatnam', 'Vepagunta వేపగుంట V125, FPKNT', ST_SetSRID(ST_MakePoint(83.2153678, 17.7744273), 4326), 40);
    END IF;
    -- Insert Childrens Theatre (locality)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Childrens Theatre', ST_SetSRID(ST_MakePoint(83.3192048, 17.720553), 4326), '{"C436, XLTRNS 0TR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Childrens Theatre, Visakhapatnam', 'Childrens Theatre  C436, XLTRNS 0TR', ST_SetSRID(ST_MakePoint(83.3192048, 17.720553), 4326), 10);
    END IF;
    -- Insert Chrome (locality)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chrome', ST_SetSRID(ST_MakePoint(83.3196816, 17.7199683), 4326), '{"C650, XRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chrome, Visakhapatnam', 'Chrome  C650, XRM', ST_SetSRID(ST_MakePoint(83.3196816, 17.7199683), 4326), 10);
    END IF;
    -- Insert Waltair Club (locality)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Waltair Club', ST_SetSRID(ST_MakePoint(83.3171163, 17.7199605), 4326), '{"W436, WLTR KLB"}', jsonb_build_object('te', 'వాల్తేరు క్లబ్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Waltair Club, Visakhapatnam', 'Waltair Club వాల్తేరు క్లబ్ W436, WLTR KLB', ST_SetSRID(ST_MakePoint(83.3171163, 17.7199605), 4326), 10);
    END IF;
    -- Insert Icici ATM (atm)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Icici ATM', ST_SetSRID(ST_MakePoint(83.3032397, 17.7120988), 4326), '{"I223, ISS ATM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Icici ATM, Visakhapatnam', 'Icici ATM  I223, ISS ATM', ST_SetSRID(ST_MakePoint(83.3032397, 17.7120988), 4326), 10);
    END IF;
    -- Insert Siva Sivani Public School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Siva Sivani Public School', ST_SetSRID(ST_MakePoint(83.3315061, 17.7209547), 4326), '{"SF SFN PBLK SXL, S121"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Siva Sivani Public School, Visakhapatnam', 'Siva Sivani Public School  SF SFN PBLK SXL, S121', ST_SetSRID(ST_MakePoint(83.3315061, 17.7209547), 4326), 50);
    END IF;
    -- Insert Visakha Homeo Clinic (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Visakha Homeo Clinic', ST_SetSRID(ST_MakePoint(83.3094001, 17.7224616), 4326), '{"FSKH HM KLNK, V225"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Visakha Homeo Clinic, Visakhapatnam', 'Visakha Homeo Clinic  FSKH HM KLNK, V225', ST_SetSRID(ST_MakePoint(83.3094001, 17.7224616), 4326), 50);
    END IF;
    -- Insert Nikitha Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nikitha Hospital', ST_SetSRID(ST_MakePoint(83.3145614, 17.7426752), 4326), '{"N232, NK0 HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nikitha Hospital, Visakhapatnam', 'Nikitha Hospital  N232, NK0 HSPTL', ST_SetSRID(ST_MakePoint(83.3145614, 17.7426752), 4326), 50);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3145202, 17.7424614), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3145202, 17.7424614), 4326), 10);
    END IF;
    -- Insert Sri Sairam Tiffins & Meals (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Sairam Tiffins & Meals', ST_SetSRID(ST_MakePoint(83.3211329, 17.7358516), 4326), '{"SR SRM TFNS MLS, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Sairam Tiffins & Meals, Visakhapatnam', 'Sri Sairam Tiffins & Meals  SR SRM TFNS MLS, S626', ST_SetSRID(ST_MakePoint(83.3211329, 17.7358516), 4326), 10);
    END IF;
    -- Insert Dolphin Park (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dolphin Park', ST_SetSRID(ST_MakePoint(83.2828576, 17.6711304), 4326), '{"TLFN PRK, D415"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dolphin Park, Visakhapatnam', 'Dolphin Park  TLFN PRK, D415', ST_SetSRID(ST_MakePoint(83.2828576, 17.6711304), 4326), 10);
    END IF;
    -- Insert Bayyavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bayyavaram', ST_SetSRID(ST_MakePoint(82.9422895, 17.6631375), 4326), '{"B165, BYFRM"}', jsonb_build_object('te', 'బయ్యవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bayyavaram, Visakhapatnam', 'Bayyavaram బయ్యవరం B165, BYFRM', ST_SetSRID(ST_MakePoint(82.9422895, 17.6631375), 4326), 40);
    END IF;
    -- Insert Narasingapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narasingapalli', ST_SetSRID(ST_MakePoint(82.8766572, 17.6093829), 4326), '{"N625, NRSNKPL"}', jsonb_build_object('te', 'నరసింగపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narasingapalli, Visakhapatnam', 'Narasingapalli నరసింగపల్లి N625, NRSNKPL', ST_SetSRID(ST_MakePoint(82.8766572, 17.6093829), 4326), 40);
    END IF;
    -- Insert Peddipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Peddipalem', ST_SetSRID(ST_MakePoint(83.4002829, 17.908119), 4326), '{"PTPLM, P314"}', jsonb_build_object('te', 'పెద్దిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Peddipalem, Visakhapatnam', 'Peddipalem పెద్దిపాలెం PTPLM, P314', ST_SetSRID(ST_MakePoint(83.4002829, 17.908119), 4326), 40);
    END IF;
    -- Insert Polipalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Polipalle', ST_SetSRID(ST_MakePoint(83.4383252, 17.9667254), 4326), '{"PLPL, P414"}', jsonb_build_object('te', 'పోలిపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Polipalle, Visakhapatnam', 'Polipalle పోలిపల్లి PLPL, P414', ST_SetSRID(ST_MakePoint(83.4383252, 17.9667254), 4326), 40);
    END IF;
    -- Insert Vemulavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vemulavalasa', ST_SetSRID(ST_MakePoint(83.3800054, 17.8950305), 4326), '{"V541, FMLFLS"}', jsonb_build_object('te', 'వేములవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vemulavalasa, Visakhapatnam', 'Vemulavalasa వేములవలస V541, FMLFLS', ST_SetSRID(ST_MakePoint(83.3800054, 17.8950305), 4326), 40);
    END IF;
    -- Insert Union Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank', ST_SetSRID(ST_MakePoint(83.3184421, 17.7233671), 4326), '{"UNN BNK, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank, Visakhapatnam', 'Union Bank  UNN BNK, U551', ST_SetSRID(ST_MakePoint(83.3184421, 17.7233671), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.337881, 17.7433577), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.337881, 17.7433577), 4326), 10);
    END IF;
    -- Insert Bank of Baroda (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of Baroda', ST_SetSRID(ST_MakePoint(83.3383985, 17.7432733), 4326), '{"BNK OF BRT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of Baroda, Visakhapatnam', 'Bank of Baroda  BNK OF BRT, B521', ST_SetSRID(ST_MakePoint(83.3383985, 17.7432733), 4326), 10);
    END IF;
    -- Insert Maruthinagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maruthinagar', ST_SetSRID(ST_MakePoint(83.2225143, 17.762211), 4326), '{"MR0NKR, M635"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maruthinagar, Visakhapatnam', 'Maruthinagar  MR0NKR, M635', ST_SetSRID(ST_MakePoint(83.2225143, 17.762211), 4326), 60);
    END IF;
    -- Insert Maharani Peta (town)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maharani Peta', ST_SetSRID(ST_MakePoint(83.3018491, 17.7080097), 4326), '{"MHRN PT, M651"}', jsonb_build_object('te', 'మహారాణి పేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maharani Peta, Visakhapatnam', 'Maharani Peta మహారాణి పేట MHRN PT, M651', ST_SetSRID(ST_MakePoint(83.3018491, 17.7080097), 4326), 10);
    END IF;
    -- Insert Srinivasa Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srinivasa Nagar', ST_SetSRID(ST_MakePoint(83.3555399, 17.8276866), 4326), '{"SRNFS NKR, S651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srinivasa Nagar, Visakhapatnam', 'Srinivasa Nagar  SRNFS NKR, S651', ST_SetSRID(ST_MakePoint(83.3555399, 17.8276866), 4326), 60);
    END IF;
    -- Insert Elamanchilli (town)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Elamanchilli', ST_SetSRID(ST_MakePoint(82.8539515, 17.5499609), 4326), '{"ELMNXL, E455"}', jsonb_build_object('te', 'ఎలమంచిలి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Elamanchilli, Visakhapatnam', 'Elamanchilli ఎలమంచిలి ELMNXL, E455', ST_SetSRID(ST_MakePoint(82.8539515, 17.5499609), 4326), 10);
    END IF;
    -- Insert Kasimkota (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kasimkota', ST_SetSRID(ST_MakePoint(82.9653539, 17.6664544), 4326), '{"KSMKT, K252"}', jsonb_build_object('te', 'కశింకోట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kasimkota, Visakhapatnam', 'Kasimkota కశింకోట KSMKT, K252', ST_SetSRID(ST_MakePoint(82.9653539, 17.6664544), 4326), 40);
    END IF;
    -- Insert Tallapalem (town)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tallapalem', ST_SetSRID(ST_MakePoint(82.8913199, 17.6342447), 4326), '{"T414, TLPLM"}', jsonb_build_object('te', 'తాళ్ళపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tallapalem, Visakhapatnam', 'Tallapalem తాళ్ళపాలెం T414, TLPLM', ST_SetSRID(ST_MakePoint(82.8913199, 17.6342447), 4326), 10);
    END IF;
    -- Insert Foodland (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Foodland', ST_SetSRID(ST_MakePoint(83.316728, 17.7433132), 4326), '{"F345, FTLNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Foodland, Visakhapatnam', 'Foodland  F345, FTLNT', ST_SetSRID(ST_MakePoint(83.316728, 17.7433132), 4326), 10);
    END IF;
    -- Insert Padmaja Hospital - Seethammadhara (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Padmaja Hospital - Seethammadhara', ST_SetSRID(ST_MakePoint(83.3146125, 17.7436298), 4326), '{"PTMJ HSPTL S0MTHR, P352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Padmaja Hospital - Seethammadhara, Visakhapatnam', 'Padmaja Hospital - Seethammadhara  PTMJ HSPTL S0MTHR, P352', ST_SetSRID(ST_MakePoint(83.3146125, 17.7436298), 4326), 50);
    END IF;
    -- Insert Sairam Parlour (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sairam Parlour', ST_SetSRID(ST_MakePoint(83.303268, 17.7263144), 4326), '{"SRM PRLR, S651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sairam Parlour, Visakhapatnam', 'Sairam Parlour  SRM PRLR, S651', ST_SetSRID(ST_MakePoint(83.303268, 17.7263144), 4326), 10);
    END IF;
    -- Insert State Bank of India (atm)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.4537491, 17.8921411), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.4537491, 17.8921411), 4326), 10);
    END IF;
    -- Insert Kotthapatnam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotthapatnam', ST_SetSRID(ST_MakePoint(82.8936269, 17.4336451), 4326), '{"K313, K0PTNM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotthapatnam, Visakhapatnam', 'Kotthapatnam  K313, K0PTNM', ST_SetSRID(ST_MakePoint(82.8936269, 17.4336451), 4326), 40);
    END IF;
    -- Insert Janguluru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Janguluru', ST_SetSRID(ST_MakePoint(82.9957308, 17.5465175), 4326), '{"JNKLR, J524"}', jsonb_build_object('te', 'జంగులూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Janguluru, Visakhapatnam', 'Janguluru జంగులూరు JNKLR, J524', ST_SetSRID(ST_MakePoint(82.9957308, 17.5465175), 4326), 40);
    END IF;
    -- Insert Dopperla (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dopperla', ST_SetSRID(ST_MakePoint(83.0402397, 17.5773753), 4326), '{"TPRL, D164"}', jsonb_build_object('te', 'దొప్పెర్ల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dopperla, Visakhapatnam', 'Dopperla దొప్పెర్ల TPRL, D164', ST_SetSRID(ST_MakePoint(83.0402397, 17.5773753), 4326), 40);
    END IF;
    -- Insert Cheepurupalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cheepurupalle', ST_SetSRID(ST_MakePoint(83.0829736, 17.5601656), 4326), '{"XPRPL, C161"}', jsonb_build_object('te', 'చీపురపల్లి పశ్చిమ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cheepurupalle, Visakhapatnam', 'Cheepurupalle చీపురపల్లి పశ్చిమ XPRPL, C161', ST_SetSRID(ST_MakePoint(83.0829736, 17.5601656), 4326), 40);
    END IF;
    -- Insert Bharinikam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bharinikam', ST_SetSRID(ST_MakePoint(83.0608179, 17.630669), 4326), '{"B652, BHRNKM"}', jsonb_build_object('te', 'భరిణికం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bharinikam, Visakhapatnam', 'Bharinikam భరిణికం B652, BHRNKM', ST_SetSRID(ST_MakePoint(83.0608179, 17.630669), 4326), 40);
    END IF;
    -- Insert Pinamadaka (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pinamadaka', ST_SetSRID(ST_MakePoint(83.0914006, 17.63826), 4326), '{"PNMTK, P553"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pinamadaka, Visakhapatnam', 'Pinamadaka  PNMTK, P553', ST_SetSRID(ST_MakePoint(83.0914006, 17.63826), 4326), 80);
    END IF;
    -- Insert Thanam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Thanam', ST_SetSRID(ST_MakePoint(83.0697999, 17.6478136), 4326), '{"T550, 0NM"}', jsonb_build_object('te', 'తానం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Thanam, Visakhapatnam', 'Thanam తానం T550, 0NM', ST_SetSRID(ST_MakePoint(83.0697999, 17.6478136), 4326), 40);
    END IF;
    -- Insert Sector8;Sector 8 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector8;Sector 8', ST_SetSRID(ST_MakePoint(83.1367972, 17.6513772), 4326), '{"SKTRSKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector8;Sector 8, Visakhapatnam', 'Sector8;Sector 8  SKTRSKTR , S236', ST_SetSRID(ST_MakePoint(83.1367972, 17.6513772), 4326), 60);
    END IF;
    -- Insert Pedagantyada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedagantyada', ST_SetSRID(ST_MakePoint(83.2098232, 17.6656664), 4326), '{"PTKNTYT, P325"}', jsonb_build_object('te', 'పెదగంట్యాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedagantyada, Visakhapatnam', 'Pedagantyada పెదగంట్యాడ PTKNTYT, P325', ST_SetSRID(ST_MakePoint(83.2098232, 17.6656664), 4326), 40);
    END IF;
    -- Insert Gonthina Vani Palem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gonthina Vani Palem', ST_SetSRID(ST_MakePoint(83.201799, 17.6765959), 4326), '{"G535, KN0N FN PLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gonthina Vani Palem, Visakhapatnam', 'Gonthina Vani Palem  G535, KN0N FN PLM', ST_SetSRID(ST_MakePoint(83.201799, 17.6765959), 4326), 60);
    END IF;
    -- Insert Azeemabad (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Azeemabad', ST_SetSRID(ST_MakePoint(83.2138532, 17.6778401), 4326), '{"ASMBT, A251"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Azeemabad, Visakhapatnam', 'Azeemabad  ASMBT, A251', ST_SetSRID(ST_MakePoint(83.2138532, 17.6778401), 4326), 60);
    END IF;
    -- Insert Sri Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Nagar', ST_SetSRID(ST_MakePoint(83.1849322, 17.6829907), 4326), '{"SR NKR, S652"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Nagar, Visakhapatnam', 'Sri Nagar  SR NKR, S652', ST_SetSRID(ST_MakePoint(83.1849322, 17.6829907), 4326), 60);
    END IF;
    -- Insert Chaitanya Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chaitanya Nagar', ST_SetSRID(ST_MakePoint(83.1999909, 17.6816684), 4326), '{"C355, XTNY NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chaitanya Nagar, Visakhapatnam', 'Chaitanya Nagar  C355, XTNY NKR', ST_SetSRID(ST_MakePoint(83.1999909, 17.6816684), 4326), 60);
    END IF;
    -- Insert Sector J (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector J', ST_SetSRID(ST_MakePoint(83.2733287, 17.6832431), 4326), '{"SKTR J, S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector J, Visakhapatnam', 'Sector J  SKTR J, S236', ST_SetSRID(ST_MakePoint(83.2733287, 17.6832431), 4326), 60);
    END IF;
    -- Insert CISF Quarters (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'CISF Quarters', ST_SetSRID(ST_MakePoint(83.2437876, 17.6843481), 4326), '{"SSF KRTRS, C212"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'CISF Quarters, Visakhapatnam', 'CISF Quarters  SSF KRTRS, C212', ST_SetSRID(ST_MakePoint(83.2437876, 17.6843481), 4326), 60);
    END IF;
    -- Insert Visweswara Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Visweswara Nagar', ST_SetSRID(ST_MakePoint(83.184421, 17.6854009), 4326), '{"FSWSWR NKR, V226"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Visweswara Nagar, Visakhapatnam', 'Visweswara Nagar  FSWSWR NKR, V226', ST_SetSRID(ST_MakePoint(83.184421, 17.6854009), 4326), 60);
    END IF;
    -- Insert Hindhusthan Ship Yard Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hindhusthan Ship Yard Colony', ST_SetSRID(ST_MakePoint(83.2650832, 17.6855923), 4326), '{"H532, HNTHS0N XP YRT KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hindhusthan Ship Yard Colony, Visakhapatnam', 'Hindhusthan Ship Yard Colony  H532, HNTHS0N XP YRT KLN', ST_SetSRID(ST_MakePoint(83.2650832, 17.6855923), 4326), 60);
    END IF;
    -- Insert Malkapuram (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Malkapuram', ST_SetSRID(ST_MakePoint(83.24264, 17.6868347), 4326), '{"M421, MLKPRM"}', jsonb_build_object('te', 'మల్కాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Malkapuram, Visakhapatnam', 'Malkapuram మల్కాపురం M421, MLKPRM', ST_SetSRID(ST_MakePoint(83.24264, 17.6868347), 4326), 80);
    END IF;
    -- Insert Sri Haripuram (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Haripuram', ST_SetSRID(ST_MakePoint(83.2334411, 17.6887505), 4326), '{"SR HRPRM, S661"}', jsonb_build_object('te', 'శ్రీహరిపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Haripuram, Visakhapatnam', 'Sri Haripuram శ్రీహరిపురం SR HRPRM, S661', ST_SetSRID(ST_MakePoint(83.2334411, 17.6887505), 4326), 80);
    END IF;
    -- Insert Ex Service Men Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ex Service Men Colony', ST_SetSRID(ST_MakePoint(83.225606, 17.6889419), 4326), '{"EKS SRFS MN KLN, E226"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ex Service Men Colony, Visakhapatnam', 'Ex Service Men Colony  EKS SRFS MN KLN, E226', ST_SetSRID(ST_MakePoint(83.225606, 17.6889419), 4326), 60);
    END IF;
    -- Insert Naval Park (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Naval Park', ST_SetSRID(ST_MakePoint(83.2666904, 17.6897075), 4326), '{"N141, NFL PRK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Naval Park, Visakhapatnam', 'Naval Park  N141, NFL PRK', ST_SetSRID(ST_MakePoint(83.2666904, 17.6897075), 4326), 60);
    END IF;
    -- Insert Ajanta Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ajanta Colony', ST_SetSRID(ST_MakePoint(83.2333407, 17.6916215), 4326), '{"AJNT KLN, A253"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ajanta Colony, Visakhapatnam', 'Ajanta Colony  AJNT KLN, A253', ST_SetSRID(ST_MakePoint(83.2333407, 17.6916215), 4326), 60);
    END IF;
    -- Insert Pittalayyavanipalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pittalayyavanipalem', ST_SetSRID(ST_MakePoint(83.2291217, 17.6941575), 4326), '{"P341, PTLYFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pittalayyavanipalem, Visakhapatnam', 'Pittalayyavanipalem  P341, PTLYFNPLM', ST_SetSRID(ST_MakePoint(83.2291217, 17.6941575), 4326), 60);
    END IF;
    -- Insert Soldier Peta (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Soldier Peta', ST_SetSRID(ST_MakePoint(83.2936513, 17.6943898), 4326), '{"S436, SLTR PT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Soldier Peta, Visakhapatnam', 'Soldier Peta  S436, SLTR PT', ST_SetSRID(ST_MakePoint(83.2936513, 17.6943898), 4326), 60);
    END IF;
    -- Insert Zinc Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Zinc Colony', ST_SetSRID(ST_MakePoint(83.2195789, 17.6953059), 4326), '{"Z522, SNK KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Zinc Colony, Visakhapatnam', 'Zinc Colony  Z522, SNK KLN', ST_SetSRID(ST_MakePoint(83.2195789, 17.6953059), 4326), 60);
    END IF;
    -- Insert Govdesivanipalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Govdesivanipalem', ST_SetSRID(ST_MakePoint(83.2251037, 17.6963586), 4326), '{"G132, KFTSFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Govdesivanipalem, Visakhapatnam', 'Govdesivanipalem  G132, KFTSFNPLM', ST_SetSRID(ST_MakePoint(83.2251037, 17.6963586), 4326), 60);
    END IF;
    -- Insert Auto Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Auto Nagar', ST_SetSRID(ST_MakePoint(83.1892427, 17.6967414), 4326), '{"A352, AT NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Auto Nagar, Visakhapatnam', 'Auto Nagar  A352, AT NKR', ST_SetSRID(ST_MakePoint(83.1892427, 17.6967414), 4326), 60);
    END IF;
    -- Insert Chengala Rao Peta (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chengala Rao Peta', ST_SetSRID(ST_MakePoint(83.2994655, 17.6985995), 4326), '{"C524, XNKL R PT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chengala Rao Peta, Visakhapatnam', 'Chengala Rao Peta  C524, XNKL R PT', ST_SetSRID(ST_MakePoint(83.2994655, 17.6985995), 4326), 60);
    END IF;
    -- Insert Mulagada (town)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mulagada', ST_SetSRID(ST_MakePoint(83.2251037, 17.6988467), 4326), '{"MLKT, M423"}', jsonb_build_object('te', 'ములగాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mulagada, Visakhapatnam', 'Mulagada ములగాడ MLKT, M423', ST_SetSRID(ST_MakePoint(83.2251037, 17.6988467), 4326), 10);
    END IF;
    -- Insert Jalari Peta (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jalari Peta', ST_SetSRID(ST_MakePoint(83.3422501, 17.7280255), 4326), '{"J461, JLR PT"}', jsonb_build_object('te', 'జలారి పేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jalari Peta, Visakhapatnam', 'Jalari Peta జలారి పేట J461, JLR PT', ST_SetSRID(ST_MakePoint(83.3422501, 17.7280255), 4326), 60);
    END IF;
    -- Insert Gajuwaka (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gajuwaka', ST_SetSRID(ST_MakePoint(83.2130062, 17.6813983), 4326), '{"KJWK, G220, Old Gajuwaka, New Gajuwaka"}', jsonb_build_object('te', 'గాజువాక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gajuwaka, Visakhapatnam', 'Gajuwaka గాజువాక KJWK, G220, Old Gajuwaka, New Gajuwaka', ST_SetSRID(ST_MakePoint(83.2130062, 17.6813983), 4326), 80);
    END IF;
    -- Insert MTC Palem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'MTC Palem', ST_SetSRID(ST_MakePoint(83.2956742, 17.7032234), 4326), '{"MTK PLM, M321"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'MTC Palem, Visakhapatnam', 'MTC Palem  MTK PLM, M321', ST_SetSRID(ST_MakePoint(83.2956742, 17.7032234), 4326), 60);
    END IF;
    -- Insert Pullam Botlapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pullam Botlapalem', ST_SetSRID(ST_MakePoint(83.1889413, 17.7024832), 4326), '{"PLM BTLPLM, P451"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pullam Botlapalem, Visakhapatnam', 'Pullam Botlapalem  PLM BTLPLM, P451', ST_SetSRID(ST_MakePoint(83.1889413, 17.7024832), 4326), 60);
    END IF;
    -- Insert Akkireddipalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Akkireddipalem', ST_SetSRID(ST_MakePoint(83.208027, 17.7091817), 4326), '{"A263, AKRTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Akkireddipalem, Visakhapatnam', 'Akkireddipalem  A263, AKRTPLM', ST_SetSRID(ST_MakePoint(83.208027, 17.7091817), 4326), 60);
    END IF;
    -- Insert Nathayyapalem (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nathayyapalem', ST_SetSRID(ST_MakePoint(83.2015569, 17.7103596), 4326), '{"N314, N0YPLM"}', jsonb_build_object('te', 'నాతయ్యపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nathayyapalem, Visakhapatnam', 'Nathayyapalem నాతయ్యపాలెం N314, N0YPLM', ST_SetSRID(ST_MakePoint(83.2015569, 17.7103596), 4326), 80);
    END IF;
    -- Insert Daspalla Hills (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Daspalla Hills', ST_SetSRID(ST_MakePoint(83.314629, 17.7160909), 4326), '{"D214, TSPL HLS"}', jsonb_build_object('te', 'దస్‌పల్లా హిల్స్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Daspalla Hills, Visakhapatnam', 'Daspalla Hills దస్‌పల్లా హిల్స్ D214, TSPL HLS', ST_SetSRID(ST_MakePoint(83.314629, 17.7160909), 4326), 60);
    END IF;
    -- Insert Ram Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ram Nagar', ST_SetSRID(ST_MakePoint(83.3092799, 17.7189376), 4326), '{"RM NKR, R552"}', jsonb_build_object('te', 'రాంనగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ram Nagar, Visakhapatnam', 'Ram Nagar రాంనగర్ RM NKR, R552', ST_SetSRID(ST_MakePoint(83.3092799, 17.7189376), 4326), 60);
    END IF;
    -- Insert Siripuram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Siripuram', ST_SetSRID(ST_MakePoint(83.3172191, 17.7208185), 4326), '{"S616, SRPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Siripuram, Visakhapatnam', 'Siripuram  S616, SRPRM', ST_SetSRID(ST_MakePoint(83.3172191, 17.7208185), 4326), 60);
    END IF;
    -- Insert Meghadripeta Defence Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Meghadripeta Defence Colony', ST_SetSRID(ST_MakePoint(83.2688953, 17.7255663), 4326), '{"MKHTRPT TFNS KLN, M236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Meghadripeta Defence Colony, Visakhapatnam', 'Meghadripeta Defence Colony  MKHTRPT TFNS KLN, M236', ST_SetSRID(ST_MakePoint(83.2688953, 17.7255663), 4326), 60);
    END IF;
    -- Insert Sathyavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sathyavanipalem', ST_SetSRID(ST_MakePoint(83.1851543, 17.7291981), 4326), '{"S0YFNPLM, S315"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sathyavanipalem, Visakhapatnam', 'Sathyavanipalem  S0YFNPLM, S315', ST_SetSRID(ST_MakePoint(83.1851543, 17.7291981), 4326), 40);
    END IF;
    -- Insert Kancharapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kancharapalem', ST_SetSRID(ST_MakePoint(83.2779065, 17.7300104), 4326), '{"KNXRPLM, K526"}', jsonb_build_object('te', 'కంచరపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kancharapalem, Visakhapatnam', 'Kancharapalem కంచరపాలెం KNXRPLM, K526', ST_SetSRID(ST_MakePoint(83.2779065, 17.7300104), 4326), 60);
    END IF;
    -- Insert Marturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marturu', ST_SetSRID(ST_MakePoint(83.0158907, 17.7322375), 4326), '{"M636, MRTR"}', jsonb_build_object('te', 'మర్టూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marturu, Visakhapatnam', 'Marturu మర్టూరు M636, MRTR', ST_SetSRID(ST_MakePoint(83.0158907, 17.7322375), 4326), 40);
    END IF;
    -- Insert Pedda Waltair (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Waltair', ST_SetSRID(ST_MakePoint(83.3330434, 17.7313942), 4326), '{"P343, PT WLTR"}', jsonb_build_object('te', 'పెద్ద వాల్తేరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Waltair, Visakhapatnam', 'Pedda Waltair పెద్ద వాల్తేరు P343, PT WLTR', ST_SetSRID(ST_MakePoint(83.3330434, 17.7313942), 4326), 80);
    END IF;
    -- Insert Lawsons Bay Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lawsons Bay Colony', ST_SetSRID(ST_MakePoint(83.3396009, 17.7317145), 4326), '{"LSNS B KLN, L252"}', jsonb_build_object('te', 'లాసన్స్ బే కాలనీ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lawsons Bay Colony, Visakhapatnam', 'Lawsons Bay Colony లాసన్స్ బే కాలనీ LSNS B KLN, L252', ST_SetSRID(ST_MakePoint(83.3396009, 17.7317145), 4326), 60);
    END IF;
    -- Insert Srinivasa Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srinivasa Nagar', ST_SetSRID(ST_MakePoint(83.2988143, 17.7318084), 4326), '{"SRNFS NKR, S651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srinivasa Nagar, Visakhapatnam', 'Srinivasa Nagar  SRNFS NKR, S651', ST_SetSRID(ST_MakePoint(83.2988143, 17.7318084), 4326), 60);
    END IF;
    -- Insert Ahmed Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ahmed Nagar', ST_SetSRID(ST_MakePoint(83.1769242, 17.7343668), 4326), '{"A535, AMT NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ahmed Nagar, Visakhapatnam', 'Ahmed Nagar  A535, AMT NKR', ST_SetSRID(ST_MakePoint(83.1769242, 17.7343668), 4326), 60);
    END IF;
    -- Insert Ganesh Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ganesh Nagar', ST_SetSRID(ST_MakePoint(83.3079061, 17.7337191), 4326), '{"KNX NKR, G525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ganesh Nagar, Visakhapatnam', 'Ganesh Nagar  KNX NKR, G525', ST_SetSRID(ST_MakePoint(83.3079061, 17.7337191), 4326), 60);
    END IF;
    -- Insert Resavani Palem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Resavani Palem', ST_SetSRID(ST_MakePoint(83.3153267, 17.7332704), 4326), '{"R215, RSFN PLM"}', jsonb_build_object('te', 'రెసవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Resavani Palem, Visakhapatnam', 'Resavani Palem రెసవానిపాలెం R215, RSFN PLM', ST_SetSRID(ST_MakePoint(83.3153267, 17.7332704), 4326), 60);
    END IF;
    -- Insert Dharma Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dharma Nagar', ST_SetSRID(ST_MakePoint(83.2826337, 17.7338564), 4326), '{"D655, THRM NKR"}', jsonb_build_object('te', 'దర్మా నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dharma Nagar, Visakhapatnam', 'Dharma Nagar దర్మా నగర్ D655, THRM NKR', ST_SetSRID(ST_MakePoint(83.2826337, 17.7338564), 4326), 60);
    END IF;
    -- Insert Lalitha Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lalitha Nagar', ST_SetSRID(ST_MakePoint(83.3012039, 17.7345008), 4326), '{"L435, LL0 NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lalitha Nagar, Visakhapatnam', 'Lalitha Nagar  L435, LL0 NKR', ST_SetSRID(ST_MakePoint(83.3012039, 17.7345008), 4326), 60);
    END IF;
    -- Insert Sector 12 (locality)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 12', ST_SetSRID(ST_MakePoint(83.3400493, 17.735096), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ ౧౨'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 12, Visakhapatnam', 'Sector 12 సెక్టార్ ౧౨ SKTR , S236', ST_SetSRID(ST_MakePoint(83.3400493, 17.735096), 4326), 10);
    END IF;
    -- Insert Maddilapalem (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maddilapalem', ST_SetSRID(ST_MakePoint(83.3209373, 17.7352245), 4326), '{"MTLPLM, M341"}', jsonb_build_object('te', 'మద్దిలపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maddilapalem, Visakhapatnam', 'Maddilapalem మద్దిలపాలెం MTLPLM, M341', ST_SetSRID(ST_MakePoint(83.3209373, 17.7352245), 4326), 80);
    END IF;
    -- Insert Nirman Park (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nirman Park', ST_SetSRID(ST_MakePoint(83.2643651, 17.7358731), 4326), '{"N655, NRMN PRK"}', jsonb_build_object('te', 'నిర్మాన్ పార్క్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nirman Park, Visakhapatnam', 'Nirman Park నిర్మాన్ పార్క్ N655, NRMN PRK', ST_SetSRID(ST_MakePoint(83.2643651, 17.7358731), 4326), 60);
    END IF;
    -- Insert Jawaharlal Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jawaharlal Nagar', ST_SetSRID(ST_MakePoint(83.2784482, 17.7362483), 4326), '{"J644, JWHRLL NKR"}', jsonb_build_object('te', 'జవహర్లాల్ నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jawaharlal Nagar, Visakhapatnam', 'Jawaharlal Nagar జవహర్లాల్ నగర్ J644, JWHRLL NKR', ST_SetSRID(ST_MakePoint(83.2784482, 17.7362483), 4326), 60);
    END IF;
    -- Insert Santhipuram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Santhipuram', ST_SetSRID(ST_MakePoint(83.3068147, 17.7365488), 4326), '{"S531, SN0PRM"}', jsonb_build_object('te', 'శాంతిపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Santhipuram, Visakhapatnam', 'Santhipuram శాంతిపురం S531, SN0PRM', ST_SetSRID(ST_MakePoint(83.3068147, 17.7365488), 4326), 60);
    END IF;
    -- Insert Santosh Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Santosh Nagar', ST_SetSRID(ST_MakePoint(83.2889069, 17.7366818), 4326), '{"SNTX NKR, S532"}', jsonb_build_object('te', 'సంతోష్ నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Santosh Nagar, Visakhapatnam', 'Santosh Nagar సంతోష్ నగర్ SNTX NKR, S532', ST_SetSRID(ST_MakePoint(83.2889069, 17.7366818), 4326), 60);
    END IF;
    -- Insert Marshalling Yard (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marshalling Yard', ST_SetSRID(ST_MakePoint(83.2369992, 17.736905), 4326), '{"MRXLNK YRT, M624"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marshalling Yard, Visakhapatnam', 'Marshalling Yard  MRXLNK YRT, M624', ST_SetSRID(ST_MakePoint(83.2369992, 17.736905), 4326), 60);
    END IF;
    -- Insert Paidivada Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Paidivada Agraharam', ST_SetSRID(ST_MakePoint(83.1013139, 17.7383525), 4326), '{"P313, PTFT AKRHRM"}', jsonb_build_object('te', 'పైడివాడ అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Paidivada Agraharam, Visakhapatnam', 'Paidivada Agraharam పైడివాడ అగ్రహారం P313, PTFT AKRHRM', ST_SetSRID(ST_MakePoint(83.1013139, 17.7383525), 4326), 40);
    END IF;
    -- Insert Kakani Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kakani Nagar', ST_SetSRID(ST_MakePoint(83.2284312, 17.7382416), 4326), '{"KKN NKR, K255"}', jsonb_build_object('te', 'కాకాని నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kakani Nagar, Visakhapatnam', 'Kakani Nagar కాకాని నగర్ KKN NKR, K255', ST_SetSRID(ST_MakePoint(83.2284312, 17.7382416), 4326), 60);
    END IF;
    -- Insert Shanti Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Shanti Nagar', ST_SetSRID(ST_MakePoint(83.2889069, 17.7383209), 4326), '{"S535, XNT NKR"}', jsonb_build_object('te', 'సాంతి నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Shanti Nagar, Visakhapatnam', 'Shanti Nagar సాంతి నగర్ S535, XNT NKR', ST_SetSRID(ST_MakePoint(83.2889069, 17.7383209), 4326), 60);
    END IF;
    -- Insert Dhayala Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dhayala Nagar', ST_SetSRID(ST_MakePoint(83.2595395, 17.7386403), 4326), '{"D452, THYL NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dhayala Nagar, Visakhapatnam', 'Dhayala Nagar  D452, THYL NKR', ST_SetSRID(ST_MakePoint(83.2595395, 17.7386403), 4326), 60);
    END IF;
    -- Insert Yallapuvanipalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yallapuvanipalem', ST_SetSRID(ST_MakePoint(83.2201586, 17.7398362), 4326), '{"YLPFNPLM, Y411"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yallapuvanipalem, Visakhapatnam', 'Yallapuvanipalem  YLPFNPLM, Y411', ST_SetSRID(ST_MakePoint(83.2201586, 17.7398362), 4326), 60);
    END IF;
    -- Insert Karasa (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karasa', ST_SetSRID(ST_MakePoint(83.2425635, 17.7399769), 4326), '{"K620, KRS"}', jsonb_build_object('te', 'కరాస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karasa, Visakhapatnam', 'Karasa కరాస K620, KRS', ST_SetSRID(ST_MakePoint(83.2425635, 17.7399769), 4326), 60);
    END IF;
    -- Insert Industrial Estate (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Industrial Estate', ST_SetSRID(ST_MakePoint(83.2644636, 17.7400004), 4326), '{"INTSTRL ESTT, I532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Industrial Estate, Visakhapatnam', 'Industrial Estate  INTSTRL ESTT, I532', ST_SetSRID(ST_MakePoint(83.2644636, 17.7400004), 4326), 60);
    END IF;
    -- Insert Marripalem (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marripalem', ST_SetSRID(ST_MakePoint(83.2482755, 17.7409149), 4326), '{"MRPLM, M614"}', jsonb_build_object('te', 'మర్రిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marripalem, Visakhapatnam', 'Marripalem మర్రిపాలెం MRPLM, M614', ST_SetSRID(ST_MakePoint(83.2482755, 17.7409149), 4326), 80);
    END IF;
    -- Insert Kailasapuram (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kailasapuram', ST_SetSRID(ST_MakePoint(83.2881627, 17.7409348), 4326), '{"KLSPRM, K421"}', jsonb_build_object('te', 'కైలాసపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kailasapuram, Visakhapatnam', 'Kailasapuram కైలాసపురం KLSPRM, K421', ST_SetSRID(ST_MakePoint(83.2881627, 17.7409348), 4326), 80);
    END IF;
    -- Insert Narsimha Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narsimha Nagar', ST_SetSRID(ST_MakePoint(83.2989538, 17.7414664), 4326), '{"N625, NRSMH NKR"}', jsonb_build_object('te', 'నరసింహా నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narsimha Nagar, Visakhapatnam', 'Narsimha Nagar నరసింహా నగర్ N625, NRSMH NKR', ST_SetSRID(ST_MakePoint(83.2989538, 17.7414664), 4326), 60);
    END IF;
    -- Insert Chandra Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chandra Nagar', ST_SetSRID(ST_MakePoint(83.2191245, 17.7417591), 4326), '{"C536, XNTR NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chandra Nagar, Visakhapatnam', 'Chandra Nagar  C536, XNTR NKR', ST_SetSRID(ST_MakePoint(83.2191245, 17.7417591), 4326), 60);
    END IF;
    -- Insert Ganesh Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ganesh Nagar', ST_SetSRID(ST_MakePoint(83.2359159, 17.7419936), 4326), '{"KNX NKR, G525"}', jsonb_build_object('te', 'గనేశ్ నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ganesh Nagar, Visakhapatnam', 'Ganesh Nagar గనేశ్ నగర్ KNX NKR, G525', ST_SetSRID(ST_MakePoint(83.2359159, 17.7419936), 4326), 60);
    END IF;
    -- Insert Sector 2 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 2', ST_SetSRID(ST_MakePoint(83.3285036, 17.7424844), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 2, Visakhapatnam', 'Sector 2  SKTR , S236', ST_SetSRID(ST_MakePoint(83.3285036, 17.7424844), 4326), 60);
    END IF;
    -- Insert Sai Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sai Nagar', ST_SetSRID(ST_MakePoint(83.2564865, 17.7426737), 4326), '{"S NKR, S526"}', jsonb_build_object('te', 'సాయి నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sai Nagar, Visakhapatnam', 'Sai Nagar సాయి నగర్ S NKR, S526', ST_SetSRID(ST_MakePoint(83.2564865, 17.7426737), 4326), 60);
    END IF;
    -- Insert Kothapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kothapalem', ST_SetSRID(ST_MakePoint(83.2170071, 17.7431192), 4326), '{"K0PLM, K314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kothapalem, Visakhapatnam', 'Kothapalem  K0PLM, K314', ST_SetSRID(ST_MakePoint(83.2170071, 17.7431192), 4326), 60);
    END IF;
    -- Insert Pattabhi Reddy Thota (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pattabhi Reddy Thota', ST_SetSRID(ST_MakePoint(83.2710127, 17.7434709), 4326), '{"PTBH RT 0T, P316"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pattabhi Reddy Thota, Visakhapatnam', 'Pattabhi Reddy Thota  PTBH RT 0T, P316', ST_SetSRID(ST_MakePoint(83.2710127, 17.7434709), 4326), 60);
    END IF;
    -- Insert Pedda Narava (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Narava', ST_SetSRID(ST_MakePoint(83.182482, 17.7452616), 4326), '{"PT NRF, P356"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Narava, Visakhapatnam', 'Pedda Narava  PT NRF, P356', ST_SetSRID(ST_MakePoint(83.182482, 17.7452616), 4326), 40);
    END IF;
    -- Insert Srinivasa Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srinivasa Nagar', ST_SetSRID(ST_MakePoint(83.226757, 17.7447138), 4326), '{"SRNFS NKR, S651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srinivasa Nagar, Visakhapatnam', 'Srinivasa Nagar  SRNFS NKR, S651', ST_SetSRID(ST_MakePoint(83.226757, 17.7447138), 4326), 60);
    END IF;
    -- Insert NAD Junction (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'NAD Junction', ST_SetSRID(ST_MakePoint(83.2334046, 17.7447607), 4326), '{"N325, NT JNKXN"}', jsonb_build_object('te', 'ఎన్ఏడి ఎక్స్ రోడ్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'NAD Junction, Visakhapatnam', 'NAD Junction ఎన్ఏడి ఎక్స్ రోడ్ N325, NT JNKXN', ST_SetSRID(ST_MakePoint(83.2334046, 17.7447607), 4326), 60);
    END IF;
    -- Insert Marripalem VUDA Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marripalem VUDA Colony', ST_SetSRID(ST_MakePoint(83.2445783, 17.7460814), 4326), '{"MRPLM FT KLN, M614"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marripalem VUDA Colony, Visakhapatnam', 'Marripalem VUDA Colony  MRPLM FT KLN, M614', ST_SetSRID(ST_MakePoint(83.2445783, 17.7460814), 4326), 60);
    END IF;
    -- Insert Sector 1 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 1', ST_SetSRID(ST_MakePoint(83.330389, 17.7441703), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ ౧'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 1, Visakhapatnam', 'Sector 1 సెక్టార్ ౧ SKTR , S236', ST_SetSRID(ST_MakePoint(83.330389, 17.7441703), 4326), 60);
    END IF;
    -- Insert Parvathi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Parvathi Nagar', ST_SetSRID(ST_MakePoint(83.2518209, 17.7454172), 4326), '{"P613, PRF0 NKR"}', jsonb_build_object('te', 'పార్వతీ నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Parvathi Nagar, Visakhapatnam', 'Parvathi Nagar పార్వతీ నగర్ P613, PRF0 NKR', ST_SetSRID(ST_MakePoint(83.2518209, 17.7454172), 4326), 60);
    END IF;
    -- Insert Sector 2 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 2', ST_SetSRID(ST_MakePoint(83.3339962, 17.7460609), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ ౨'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 2, Visakhapatnam', 'Sector 2 సెక్టార్ ౨ SKTR , S236', ST_SetSRID(ST_MakePoint(83.3339962, 17.7460609), 4326), 60);
    END IF;
    -- Insert Madhava Dhara (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madhava Dhara', ST_SetSRID(ST_MakePoint(83.2696463, 17.7464959), 4326), '{"M313, MTHF THR"}', jsonb_build_object('te', 'మాధవధార'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madhava Dhara, Visakhapatnam', 'Madhava Dhara మాధవధార M313, MTHF THR', ST_SetSRID(ST_MakePoint(83.2696463, 17.7464959), 4326), 60);
    END IF;
    -- Insert Susarla Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Susarla Colony', ST_SetSRID(ST_MakePoint(83.232469, 17.7466366), 4326), '{"SSRL KLN, S264"}', jsonb_build_object('te', 'సుసర్లా కాలనీ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Susarla Colony, Visakhapatnam', 'Susarla Colony సుసర్లా కాలనీ SSRL KLN, S264', ST_SetSRID(ST_MakePoint(83.232469, 17.7466366), 4326), 60);
    END IF;
    -- Insert Durga Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Durga Nagar', ST_SetSRID(ST_MakePoint(83.3247305, 17.7489041), 4326), '{"D625, TRK NKR"}', jsonb_build_object('te', 'దుర్గా నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Durga Nagar, Visakhapatnam', 'Durga Nagar దుర్గా నగర్ D625, TRK NKR', ST_SetSRID(ST_MakePoint(83.3247305, 17.7489041), 4326), 60);
    END IF;
    -- Insert Nagendra Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nagendra Colony', ST_SetSRID(ST_MakePoint(83.2131171, 17.7476215), 4326), '{"N253, NJNTR KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nagendra Colony, Visakhapatnam', 'Nagendra Colony  N253, NJNTR KLN', ST_SetSRID(ST_MakePoint(83.2131171, 17.7476215), 4326), 60);
    END IF;
    -- Insert Santosh Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Santosh Nagar', ST_SetSRID(ST_MakePoint(83.2089316, 17.747856), 4326), '{"SNTX NKR, S532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Santosh Nagar, Visakhapatnam', 'Santosh Nagar  SNTX NKR, S532', ST_SetSRID(ST_MakePoint(83.2089316, 17.747856), 4326), 60);
    END IF;
    -- Insert Burma Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Burma Colony', ST_SetSRID(ST_MakePoint(83.2688092, 17.7479497), 4326), '{"B652, BRM KLN"}', jsonb_build_object('te', 'బర్మా కాలనీ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Burma Colony, Visakhapatnam', 'Burma Colony బర్మా కాలనీ B652, BRM KLN', ST_SetSRID(ST_MakePoint(83.2688092, 17.7479497), 4326), 60);
    END IF;
    -- Insert Kalinga Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kalinga Nagar', ST_SetSRID(ST_MakePoint(83.2518701, 17.7480904), 4326), '{"K452, KLNK NKR"}', jsonb_build_object('te', 'కలింగా నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kalinga Nagar, Visakhapatnam', 'Kalinga Nagar కలింగా నగర్ K452, KLNK NKR', ST_SetSRID(ST_MakePoint(83.2518701, 17.7480904), 4326), 60);
    END IF;
    -- Insert Gopalapatnam (town)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gopalapatnam', ST_SetSRID(ST_MakePoint(83.2200109, 17.7483718), 4326), '{"KPLPTNM, G141"}', jsonb_build_object('te', 'గోపాలపట్నం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gopalapatnam, Visakhapatnam', 'Gopalapatnam గోపాలపట్నం KPLPTNM, G141', ST_SetSRID(ST_MakePoint(83.2200109, 17.7483718), 4326), 10);
    END IF;
    -- Insert Tenneti Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tenneti Nagar', ST_SetSRID(ST_MakePoint(83.2570281, 17.7491339), 4326), '{"T535, TNT NKR"}', jsonb_build_object('te', 'తెన్నేటి నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tenneti Nagar, Visakhapatnam', 'Tenneti Nagar తెన్నేటి నగర్ T535, TNT NKR', ST_SetSRID(ST_MakePoint(83.2570281, 17.7491339), 4326), 60);
    END IF;
    -- Insert VUDA Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'VUDA Colony', ST_SetSRID(ST_MakePoint(83.2487679, 17.7513733), 4326), '{"V324, FT KLN"}', jsonb_build_object('te', 'వుడా కాలనీ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'VUDA Colony, Visakhapatnam', 'VUDA Colony వుడా కాలనీ V324, FT KLN', ST_SetSRID(ST_MakePoint(83.2487679, 17.7513733), 4326), 60);
    END IF;
    -- Insert Vishalakshi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vishalakshi Nagar', ST_SetSRID(ST_MakePoint(83.3362195, 17.7566367), 4326), '{"V242, FXLKX NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vishalakshi Nagar, Visakhapatnam', 'Vishalakshi Nagar  V242, FXLKX NKR', ST_SetSRID(ST_MakePoint(83.3362195, 17.7566367), 4326), 60);
    END IF;
    -- Insert Cheemalapalle (R) (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cheemalapalle (R)', ST_SetSRID(ST_MakePoint(83.1774676, 17.7585379), 4326), '{"XMLPL R, C541"}', jsonb_build_object('te', 'చీమలాపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cheemalapalle (R), Visakhapatnam', 'Cheemalapalle (R) చీమలాపల్లి XMLPL R, C541', ST_SetSRID(ST_MakePoint(83.1774676, 17.7585379), 4326), 10);
    END IF;
    -- Insert RRV Puram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'RRV Puram', ST_SetSRID(ST_MakePoint(83.2167609, 17.7565436), 4326), '{"R116, RF PRM"}', jsonb_build_object('te', 'ఆర్.ఆర్. వెంకటపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'RRV Puram, Visakhapatnam', 'RRV Puram ఆర్.ఆర్. వెంకటపురం R116, RF PRM', ST_SetSRID(ST_MakePoint(83.2167609, 17.7565436), 4326), 60);
    END IF;
    -- Insert Padmanabha Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Padmanabha Nagar', ST_SetSRID(ST_MakePoint(83.2026286, 17.7610924), 4326), '{"PTMNBH NKR, P355"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Padmanabha Nagar, Visakhapatnam', 'Padmanabha Nagar  PTMNBH NKR, P355', ST_SetSRID(ST_MakePoint(83.2026286, 17.7610924), 4326), 60);
    END IF;
    -- Insert Sundar Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sundar Nagar', ST_SetSRID(ST_MakePoint(83.3277308, 17.7656568), 4326), '{"SNTR NKR, S536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sundar Nagar, Visakhapatnam', 'Sundar Nagar  SNTR NKR, S536', ST_SetSRID(ST_MakePoint(83.3277308, 17.7656568), 4326), 60);
    END IF;
    -- Insert Apsara Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Apsara Colony', ST_SetSRID(ST_MakePoint(83.3207677, 17.7683415), 4326), '{"APSR KLN, A126"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Apsara Colony, Visakhapatnam', 'Apsara Colony  APSR KLN, A126', ST_SetSRID(ST_MakePoint(83.3207677, 17.7683415), 4326), 60);
    END IF;
    -- Insert Mustafa Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mustafa Colony', ST_SetSRID(ST_MakePoint(83.3169696, 17.7685318), 4326), '{"MSTF KLN, M231"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mustafa Colony, Visakhapatnam', 'Mustafa Colony  MSTF KLN, M231', ST_SetSRID(ST_MakePoint(83.3169696, 17.7685318), 4326), 60);
    END IF;
    -- Insert Sector 4 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 4', ST_SetSRID(ST_MakePoint(83.3109653, 17.7700347), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 4, Visakhapatnam', 'Sector 4  SKTR , S236', ST_SetSRID(ST_MakePoint(83.3109653, 17.7700347), 4326), 60);
    END IF;
    -- Insert Gandhavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gandhavaram', ST_SetSRID(ST_MakePoint(82.9879934, 17.7725443), 4326), '{"KNTHFRM, G531"}', jsonb_build_object('te', 'గంధవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gandhavaram, Visakhapatnam', 'Gandhavaram గంధవరం KNTHFRM, G531', ST_SetSRID(ST_MakePoint(82.9879934, 17.7725443), 4326), 40);
    END IF;
    -- Insert Porlu Palem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Porlu Palem', ST_SetSRID(ST_MakePoint(83.1955995, 17.7744649), 4326), '{"P641, PRL PLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Porlu Palem, Visakhapatnam', 'Porlu Palem  P641, PRL PLM', ST_SetSRID(ST_MakePoint(83.1955995, 17.7744649), 4326), 40);
    END IF;
    -- Insert Pineapple Colony (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pineapple Colony', ST_SetSRID(ST_MakePoint(83.2714, 17.7802655), 4326), '{"P514, PNPL KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pineapple Colony, Visakhapatnam', 'Pineapple Colony  P514, PNPL KLN', ST_SetSRID(ST_MakePoint(83.2714, 17.7802655), 4326), 80);
    END IF;
    -- Insert Simhapuri Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simhapuri Colony', ST_SetSRID(ST_MakePoint(83.2243934, 17.7805994), 4326), '{"S516, SMHPR KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simhapuri Colony, Visakhapatnam', 'Simhapuri Colony  S516, SMHPR KLN', ST_SetSRID(ST_MakePoint(83.2243934, 17.7805994), 4326), 60);
    END IF;
    -- Insert Mandavari Palem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mandavari Palem', ST_SetSRID(ST_MakePoint(83.1669723, 17.7791975), 4326), '{"M531, MNTFR PLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mandavari Palem, Visakhapatnam', 'Mandavari Palem  M531, MNTFR PLM', ST_SetSRID(ST_MakePoint(83.1669723, 17.7791975), 4326), 40);
    END IF;
    -- Insert Krishnaraya Puram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Krishnaraya Puram', ST_SetSRID(ST_MakePoint(83.213433, 17.7828028), 4326), '{"KRXNRY PRM, K625"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Krishnaraya Puram, Visakhapatnam', 'Krishnaraya Puram  KRXNRY PRM, K625', ST_SetSRID(ST_MakePoint(83.213433, 17.7828028), 4326), 60);
    END IF;
    -- Insert Senathivani Palem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Senathivani Palem', ST_SetSRID(ST_MakePoint(83.2169579, 17.7857572), 4326), '{"S531, SN0FN PLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Senathivani Palem, Visakhapatnam', 'Senathivani Palem  S531, SN0FN PLM', ST_SetSRID(ST_MakePoint(83.2169579, 17.7857572), 4326), 60);
    END IF;
    -- Insert Purushottapuram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Purushottapuram', ST_SetSRID(ST_MakePoint(83.21228, 17.7890627), 4326), '{"PRXTPRM, P623"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Purushottapuram, Visakhapatnam', 'Purushottapuram  PRXTPRM, P623', ST_SetSRID(ST_MakePoint(83.21228, 17.7890627), 4326), 60);
    END IF;
    -- Insert Venkanna Palem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkanna Palem', ST_SetSRID(ST_MakePoint(82.974356, 17.7941963), 4326), '{"FNKN PLM, V525"}', jsonb_build_object('te', 'వెంకన్నపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkanna Palem, Visakhapatnam', 'Venkanna Palem వెంకన్నపాలెం FNKN PLM, V525', ST_SetSRID(ST_MakePoint(82.974356, 17.7941963), 4326), 40);
    END IF;
    -- Insert Sujatha Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sujatha Nagar', ST_SetSRID(ST_MakePoint(83.2154314, 17.7979242), 4326), '{"SJ0 NKR, S235"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sujatha Nagar, Visakhapatnam', 'Sujatha Nagar  SJ0 NKR, S235', ST_SetSRID(ST_MakePoint(83.2154314, 17.7979242), 4326), 60);
    END IF;
    -- Insert Ratnagiri Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ratnagiri Nagar', ST_SetSRID(ST_MakePoint(83.2100149, 17.798393), 4326), '{"RTNJR NKR, R352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ratnagiri Nagar, Visakhapatnam', 'Ratnagiri Nagar  RTNJR NKR, R352', ST_SetSRID(ST_MakePoint(83.2100149, 17.798393), 4326), 60);
    END IF;
    -- Insert Pedda Vangali (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Vangali', ST_SetSRID(ST_MakePoint(83.0970641, 17.8254609), 4326), '{"PT FNKL, P315"}', jsonb_build_object('te', 'వంగలి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Vangali, Visakhapatnam', 'Pedda Vangali వంగలి PT FNKL, P315', ST_SetSRID(ST_MakePoint(83.0970641, 17.8254609), 4326), 40);
    END IF;
    -- Insert Kanthi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kanthi Nagar', ST_SetSRID(ST_MakePoint(83.2164163, 17.804277), 4326), '{"K535, KN0 NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kanthi Nagar, Visakhapatnam', 'Kanthi Nagar  K535, KN0 NKR', ST_SetSRID(ST_MakePoint(83.2164163, 17.804277), 4326), 60);
    END IF;
    -- Insert Govada (town)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Govada', ST_SetSRID(ST_MakePoint(82.9639561, 17.805197), 4326), '{"G130, KFT"}', jsonb_build_object('te', 'గోవాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Govada, Visakhapatnam', 'Govada గోవాడ G130, KFT', ST_SetSRID(ST_MakePoint(82.9639561, 17.805197), 4326), 10);
    END IF;
    -- Insert Veera Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Veera Nagar', ST_SetSRID(ST_MakePoint(83.2241964, 17.8054022), 4326), '{"V652, FR NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Veera Nagar, Visakhapatnam', 'Veera Nagar  V652, FR NKR', ST_SetSRID(ST_MakePoint(83.2241964, 17.8054022), 4326), 60);
    END IF;
    -- Insert VUDA Karmika Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'VUDA Karmika Nagar', ST_SetSRID(ST_MakePoint(83.2187798, 17.8076994), 4326), '{"FT KRMK NKR, V326"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'VUDA Karmika Nagar, Visakhapatnam', 'VUDA Karmika Nagar  FT KRMK NKR, V326', ST_SetSRID(ST_MakePoint(83.2187798, 17.8076994), 4326), 60);
    END IF;
    -- Insert Rtc Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rtc Colony', ST_SetSRID(ST_MakePoint(83.3706221, 17.8122566), 4326), '{"R322, RTK KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rtc Colony, Visakhapatnam', 'Rtc Colony  R322, RTK KLN', ST_SetSRID(ST_MakePoint(83.3706221, 17.8122566), 4326), 60);
    END IF;
    -- Insert Srinivasa Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srinivasa Nagar', ST_SetSRID(ST_MakePoint(83.3655958, 17.812448), 4326), '{"SRNFS NKR, S651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srinivasa Nagar, Visakhapatnam', 'Srinivasa Nagar  SRNFS NKR, S651', ST_SetSRID(ST_MakePoint(83.3655958, 17.812448), 4326), 60);
    END IF;
    -- Insert Chepala Timmapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chepala Timmapuram', ST_SetSRID(ST_MakePoint(83.4082934, 17.8147358), 4326), '{"XPL TMPRM, C143"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chepala Timmapuram, Visakhapatnam', 'Chepala Timmapuram  XPL TMPRM, C143', ST_SetSRID(ST_MakePoint(83.4082934, 17.8147358), 4326), 10);
    END IF;
    -- Insert Maha Laxmi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maha Laxmi Nagar', ST_SetSRID(ST_MakePoint(83.2145666, 17.8154524), 4326), '{"M425, MH LKSM NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maha Laxmi Nagar, Visakhapatnam', 'Maha Laxmi Nagar  M425, MH LKSM NKR', ST_SetSRID(ST_MakePoint(83.2145666, 17.8154524), 4326), 60);
    END IF;
    -- Insert Netaji Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Netaji Nagar', ST_SetSRID(ST_MakePoint(83.2082422, 17.8160677), 4326), '{"N325, NTJ NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Netaji Nagar, Visakhapatnam', 'Netaji Nagar  N325, NTJ NKR', ST_SetSRID(ST_MakePoint(83.2082422, 17.8160677), 4326), 60);
    END IF;
    -- Insert Dabbanda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dabbanda', ST_SetSRID(ST_MakePoint(83.2740288, 17.8197594), 4326), '{"TBNT, D153"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dabbanda, Visakhapatnam', 'Dabbanda  TBNT, D153', ST_SetSRID(ST_MakePoint(83.2740288, 17.8197594), 4326), 40);
    END IF;
    -- Insert Aditya Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aditya Nagar', ST_SetSRID(ST_MakePoint(83.209424, 17.8257481), 4326), '{"ATTY NKR, A335"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aditya Nagar, Visakhapatnam', 'Aditya Nagar  ATTY NKR, A335', ST_SetSRID(ST_MakePoint(83.209424, 17.8257481), 4326), 60);
    END IF;
    -- Insert Taraka Rama Colony (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Taraka Rama Colony', ST_SetSRID(ST_MakePoint(83.2036982, 17.8375773), 4326), '{"T626, TRK RM KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Taraka Rama Colony, Visakhapatnam', 'Taraka Rama Colony  T626, TRK RM KLN', ST_SetSRID(ST_MakePoint(83.2036982, 17.8375773), 4326), 10);
    END IF;
    -- Insert Saripalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Saripalli', ST_SetSRID(ST_MakePoint(83.2011968, 17.8408802), 4326), '{"S614, SRPL"}', jsonb_build_object('te', 'సరిపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Saripalli, Visakhapatnam', 'Saripalli సరిపల్లి S614, SRPL', ST_SetSRID(ST_MakePoint(83.2011968, 17.8408802), 4326), 40);
    END IF;
    -- Insert Gundi Gundam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gundi Gundam', ST_SetSRID(ST_MakePoint(83.2575216, 17.8430669), 4326), '{"KNT KNTM, G532"}', jsonb_build_object('te', 'గండిగుండం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gundi Gundam, Visakhapatnam', 'Gundi Gundam గండిగుండం KNT KNTM, G532', ST_SetSRID(ST_MakePoint(83.2575216, 17.8430669), 4326), 40);
    END IF;
    -- Insert Kotturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(83.4108328, 17.8518912), 4326), '{"K360, KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu  K360, KTR', ST_SetSRID(ST_MakePoint(83.4108328, 17.8518912), 4326), 40);
    END IF;
    -- Insert Denderu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Denderu', ST_SetSRID(ST_MakePoint(83.1614897, 17.8624157), 4326), '{"TNTR, D536"}', jsonb_build_object('te', 'దెందేరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Denderu, Visakhapatnam', 'Denderu దెందేరు TNTR, D536', ST_SetSRID(ST_MakePoint(83.1614897, 17.8624157), 4326), 40);
    END IF;
    -- Insert Jyothi Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jyothi Nursing Home', ST_SetSRID(ST_MakePoint(83.3229595, 17.739081), 4326), '{"JY0 NRSNK HM, J356"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jyothi Nursing Home, Visakhapatnam', 'Jyothi Nursing Home  JY0 NRSNK HM, J356', ST_SetSRID(ST_MakePoint(83.3229595, 17.739081), 4326), 50);
    END IF;
    -- Insert Rasamai (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rasamai', ST_SetSRID(ST_MakePoint(83.4049201, 18.0617081), 4326), '{"RSM, R250"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rasamai, Visakhapatnam', 'Rasamai  RSM, R250', ST_SetSRID(ST_MakePoint(83.4049201, 18.0617081), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3336715, 17.7580458), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3336715, 17.7580458), 4326), 10);
    END IF;
    -- Insert Lingalavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lingalavalasa', ST_SetSRID(ST_MakePoint(83.4345164, 17.9579245), 4326), '{"L524, LNKLFLS"}', jsonb_build_object('te', 'లింగలవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lingalavalasa, Visakhapatnam', 'Lingalavalasa లింగలవలస L524, LNKLFLS', ST_SetSRID(ST_MakePoint(83.4345164, 17.9579245), 4326), 40);
    END IF;
    -- Insert Bangārammapālem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bangārammapālem', ST_SetSRID(ST_MakePoint(82.8564884, 17.4185223), 4326), '{"BNKRMPLM, B526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bangārammapālem, Visakhapatnam', 'Bangārammapālem  BNKRMPLM, B526', ST_SetSRID(ST_MakePoint(82.8564884, 17.4185223), 4326), 40);
    END IF;
    -- Insert Donipeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Donipeta', ST_SetSRID(ST_MakePoint(83.6800928, 18.0933941), 4326), '{"D513, TNPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Donipeta, Visakhapatnam', 'Donipeta  D513, TNPT', ST_SetSRID(ST_MakePoint(83.6800928, 18.0933941), 4326), 10);
    END IF;
    -- Insert Mentada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mentada', ST_SetSRID(ST_MakePoint(83.6695118, 18.0939498), 4326), '{"M533, MNTT"}', jsonb_build_object('te', 'మెంటాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mentada, Visakhapatnam', 'Mentada మెంటాడ M533, MNTT', ST_SetSRID(ST_MakePoint(83.6695118, 18.0939498), 4326), 40);
    END IF;
    -- Insert MVP Colony (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'MVP Colony', ST_SetSRID(ST_MakePoint(83.3356865, 17.7422648), 4326), '{"M124, MFP KLN"}', jsonb_build_object('te', 'యమ్.వీ.పీ. కాలనీ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'MVP Colony, Visakhapatnam', 'MVP Colony యమ్.వీ.పీ. కాలనీ M124, MFP KLN', ST_SetSRID(ST_MakePoint(83.3356865, 17.7422648), 4326), 80);
    END IF;
    -- Insert Sector 5 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 5', ST_SetSRID(ST_MakePoint(83.3326505, 17.7402547), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ ౫'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 5, Visakhapatnam', 'Sector 5 సెక్టార్ ౫ SKTR , S236', ST_SetSRID(ST_MakePoint(83.3326505, 17.7402547), 4326), 60);
    END IF;
    -- Insert Sector 8 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 8', ST_SetSRID(ST_MakePoint(83.3352185, 17.7393994), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ ౮'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 8, Visakhapatnam', 'Sector 8 సెక్టార్ ౮ SKTR , S236', ST_SetSRID(ST_MakePoint(83.3352185, 17.7393994), 4326), 60);
    END IF;
    -- Insert Sector 3 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 3', ST_SetSRID(ST_MakePoint(83.3332344, 17.7430061), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ ౩'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 3, Visakhapatnam', 'Sector 3 సెక్టార్ ౩ SKTR , S236', ST_SetSRID(ST_MakePoint(83.3332344, 17.7430061), 4326), 60);
    END IF;
    -- Insert Sector 4 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 4', ST_SetSRID(ST_MakePoint(83.3291866, 17.7410197), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ ౪'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 4, Visakhapatnam', 'Sector 4 సెక్టార్ ౪ SKTR , S236', ST_SetSRID(ST_MakePoint(83.3291866, 17.7410197), 4326), 60);
    END IF;
    -- Insert Sector 6 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 6', ST_SetSRID(ST_MakePoint(83.3373561, 17.745451), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ ౬'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 6, Visakhapatnam', 'Sector 6 సెక్టార్ ౬ SKTR , S236', ST_SetSRID(ST_MakePoint(83.3373561, 17.745451), 4326), 60);
    END IF;
    -- Insert Sector 9 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 9', ST_SetSRID(ST_MakePoint(83.3403155, 17.7439017), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ ౯'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 9, Visakhapatnam', 'Sector 9 సెక్టార్ ౯ SKTR , S236', ST_SetSRID(ST_MakePoint(83.3403155, 17.7439017), 4326), 60);
    END IF;
    -- Insert Sector 10 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 10', ST_SetSRID(ST_MakePoint(83.3395348, 17.7414432), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ ౧౦'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 10, Visakhapatnam', 'Sector 10 సెక్టార్ ౧౦ SKTR , S236', ST_SetSRID(ST_MakePoint(83.3395348, 17.7414432), 4326), 60);
    END IF;
    -- Insert Sector 11 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 11', ST_SetSRID(ST_MakePoint(83.3386176, 17.7387777), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ 11'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 11, Visakhapatnam', 'Sector 11 సెక్టార్ 11 SKTR , S236', ST_SetSRID(ST_MakePoint(83.3386176, 17.7387777), 4326), 60);
    END IF;
    -- Insert Sector 12 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 12', ST_SetSRID(ST_MakePoint(83.3372013, 17.73655), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ ౧౨'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 12, Visakhapatnam', 'Sector 12 సెక్టార్ ౧౨ SKTR , S236', ST_SetSRID(ST_MakePoint(83.3372013, 17.73655), 4326), 60);
    END IF;
    -- Insert Sector 7 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 7', ST_SetSRID(ST_MakePoint(83.3375849, 17.7417256), 4326), '{"SKTR , S236"}', jsonb_build_object('te', 'సెక్టార్ ౭'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 7, Visakhapatnam', 'Sector 7 సెక్టార్ ౭ SKTR , S236', ST_SetSRID(ST_MakePoint(83.3375849, 17.7417256), 4326), 60);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.3304902, 17.7225327), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.3304902, 17.7225327), 4326), 10);
    END IF;
    -- Insert Syndicate Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Syndicate Bank', ST_SetSRID(ST_MakePoint(83.3307893, 17.7227664), 4326), '{"SNTKT BNK, S532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Syndicate Bank, Visakhapatnam', 'Syndicate Bank  SNTKT BNK, S532', ST_SetSRID(ST_MakePoint(83.3307893, 17.7227664), 4326), 10);
    END IF;
    -- Insert Kamat (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kamat', ST_SetSRID(ST_MakePoint(83.318374, 17.7218843), 4326), '{"K530, KMT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kamat, Visakhapatnam', 'Kamat  K530, KMT', ST_SetSRID(ST_MakePoint(83.318374, 17.7218843), 4326), 10);
    END IF;
    -- Insert Murali Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Murali Nagar', ST_SetSRID(ST_MakePoint(83.2649209, 17.7472651), 4326), '{"MRL NKR, M645"}', jsonb_build_object('te', 'మురళీనగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Murali Nagar, Visakhapatnam', 'Murali Nagar మురళీనగర్ MRL NKR, M645', ST_SetSRID(ST_MakePoint(83.2649209, 17.7472651), 4326), 60);
    END IF;
    -- Insert N.G.G.O''s Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'N.G.G.O''s Colony', ST_SetSRID(ST_MakePoint(83.2705428, 17.744782), 4326), '{"N222, NKKS KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'N.G.G.O''s Colony, Visakhapatnam', 'N.G.G.O''s Colony  N222, NKKS KLN', ST_SetSRID(ST_MakePoint(83.2705428, 17.744782), 4326), 60);
    END IF;
    -- Insert Anakapalle (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Anakapalle', ST_SetSRID(ST_MakePoint(83.003476, 17.68897), 4326), '{"ANKPL, A521"}', jsonb_build_object('te', 'అనకాపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Anakapalle, Visakhapatnam', 'Anakapalle అనకాపల్లి ANKPL, A521', ST_SetSRID(ST_MakePoint(83.003476, 17.68897), 4326), 80);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3001943, 17.7388289), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3001943, 17.7388289), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.2997883, 17.7383597), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.2997883, 17.7383597), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3001745, 17.7379868), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3001745, 17.7379868), 4326), 10);
    END IF;
    -- Insert Pizza Hut (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pizza Hut', ST_SetSRID(ST_MakePoint(83.3053084, 17.7264696), 4326), '{"P230, PS HT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pizza Hut, Visakhapatnam', 'Pizza Hut  P230, PS HT', ST_SetSRID(ST_MakePoint(83.3053084, 17.7264696), 4326), 10);
    END IF;
    -- Insert Pendurthi (town)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pendurthi', ST_SetSRID(ST_MakePoint(83.206582, 17.821358), 4326), '{"PNTR0, P536"}', jsonb_build_object('te', 'పెందుర్తి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pendurthi, Visakhapatnam', 'Pendurthi పెందుర్తి PNTR0, P536', ST_SetSRID(ST_MakePoint(83.206582, 17.821358), 4326), 10);
    END IF;
    -- Insert Bota Jangalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bota Jangalapalem', ST_SetSRID(ST_MakePoint(83.0734196, 17.7513993), 4326), '{"BT JNKLPLM, B325"}', jsonb_build_object('te', 'బాటజంగాలపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bota Jangalapalem, Visakhapatnam', 'Bota Jangalapalem బాటజంగాలపాలెం BT JNKLPLM, B325', ST_SetSRID(ST_MakePoint(83.0734196, 17.7513993), 4326), 40);
    END IF;
    -- Insert Sunnambattilu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sunnambattilu', ST_SetSRID(ST_MakePoint(83.103544, 17.770955), 4326), '{"S551, SNMBTL"}', jsonb_build_object('te', 'సున్నంబట్టీలు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sunnambattilu, Visakhapatnam', 'Sunnambattilu సున్నంబట్టీలు S551, SNMBTL', ST_SetSRID(ST_MakePoint(83.103544, 17.770955), 4326), 10);
    END IF;
    -- Insert Asakapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Asakapalli', ST_SetSRID(ST_MakePoint(83.1170739, 17.7695301), 4326), '{"ASKPL, A221"}', jsonb_build_object('te', 'అసకపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Asakapalli, Visakhapatnam', 'Asakapalli అసకపల్లి ASKPL, A221', ST_SetSRID(ST_MakePoint(83.1170739, 17.7695301), 4326), 40);
    END IF;
    -- Insert Marripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marripalem', ST_SetSRID(ST_MakePoint(83.0665557, 17.7455536), 4326), '{"MRPLM, M614"}', jsonb_build_object('te', 'మర్రిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marripalem, Visakhapatnam', 'Marripalem మర్రిపాలెం MRPLM, M614', ST_SetSRID(ST_MakePoint(83.0665557, 17.7455536), 4326), 40);
    END IF;
    -- Insert Chintanippula Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintanippula Agraharam', ST_SetSRID(ST_MakePoint(83.0426517, 17.7383104), 4326), '{"C535, XNTNPL AKRHRM"}', jsonb_build_object('te', 'చింతనిప్పుల అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintanippula Agraharam, Visakhapatnam', 'Chintanippula Agraharam చింతనిప్పుల అగ్రహారం C535, XNTNPL AKRHRM', ST_SetSRID(ST_MakePoint(83.0426517, 17.7383104), 4326), 40);
    END IF;
    -- Insert Rebaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rebaka', ST_SetSRID(ST_MakePoint(83.0351174, 17.7179947), 4326), '{"RBK, R120"}', jsonb_build_object('te', 'రేబాక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rebaka, Visakhapatnam', 'Rebaka రేబాక RBK, R120', ST_SetSRID(ST_MakePoint(83.0351174, 17.7179947), 4326), 40);
    END IF;
    -- Insert Cherlopalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cherlopalem', ST_SetSRID(ST_MakePoint(82.9146316, 17.5518824), 4326), '{"XRLPLM, C641"}', jsonb_build_object('te', 'చెర్లొపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cherlopalem, Visakhapatnam', 'Cherlopalem చెర్లొపాలెం XRLPLM, C641', ST_SetSRID(ST_MakePoint(82.9146316, 17.5518824), 4326), 10);
    END IF;
    -- Insert Erukunayudupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Erukunayudupalem', ST_SetSRID(ST_MakePoint(83.1074767, 17.7600508), 4326), '{"E625, ERKNYTPLM"}', jsonb_build_object('te', 'ఎరుకునాయుడుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Erukunayudupalem, Visakhapatnam', 'Erukunayudupalem ఎరుకునాయుడుపాలెం E625, ERKNYTPLM', ST_SetSRID(ST_MakePoint(83.1074767, 17.7600508), 4326), 40);
    END IF;
    -- Insert Koduru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Koduru', ST_SetSRID(ST_MakePoint(83.055435, 17.7379301), 4326), '{"K360, KTR"}', jsonb_build_object('te', 'కోడూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Koduru, Visakhapatnam', 'Koduru కోడూరు K360, KTR', ST_SetSRID(ST_MakePoint(83.055435, 17.7379301), 4326), 40);
    END IF;
    -- Insert Shankaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Shankaram', ST_SetSRID(ST_MakePoint(83.0279005, 17.7127984), 4326), '{"S526, XNKRM"}', jsonb_build_object('te', 'శంకారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Shankaram, Visakhapatnam', 'Shankaram శంకారం S526, XNKRM', ST_SetSRID(ST_MakePoint(83.0279005, 17.7127984), 4326), 40);
    END IF;
    -- Insert Ganapathi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ganapathi Nagar', ST_SetSRID(ST_MakePoint(83.114844, 17.7746492), 4326), '{"KNP0 NKR, G513"}', jsonb_build_object('te', 'గణపతి నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ganapathi Nagar, Visakhapatnam', 'Ganapathi Nagar గణపతి నగర్ KNP0 NKR, G513', ST_SetSRID(ST_MakePoint(83.114844, 17.7746492), 4326), 60);
    END IF;
    -- Insert Ammulapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ammulapalem', ST_SetSRID(ST_MakePoint(83.0811702, 17.7578962), 4326), '{"AMLPLM, A541"}', jsonb_build_object('te', 'అమ్ములపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ammulapalem, Visakhapatnam', 'Ammulapalem అమ్ములపాలెం AMLPLM, A541', ST_SetSRID(ST_MakePoint(83.0811702, 17.7578962), 4326), 60);
    END IF;
    -- Insert Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of India', ST_SetSRID(ST_MakePoint(83.3554154, 17.8045923), 4326), '{"BNK OF INT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of India, Visakhapatnam', 'Bank of India  BNK OF INT, B521', ST_SetSRID(ST_MakePoint(83.3554154, 17.8045923), 4326), 10);
    END IF;
    -- Insert K Nagarapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'K Nagarapalem', ST_SetSRID(ST_MakePoint(83.4011611, 17.8406979), 4326), '{"K NKRPLM, K526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'K Nagarapalem, Visakhapatnam', 'K Nagarapalem  K NKRPLM, K526', ST_SetSRID(ST_MakePoint(83.4011611, 17.8406979), 4326), 40);
    END IF;
    -- Insert Govupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Govupeta', ST_SetSRID(ST_MakePoint(83.4069976, 17.8454162), 4326), '{"G113, KFPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Govupeta, Visakhapatnam', 'Govupeta  G113, KFPT', ST_SetSRID(ST_MakePoint(83.4069976, 17.8454162), 4326), 40);
    END IF;
    -- Insert Durga Nursing Home (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Durga Nursing Home', ST_SetSRID(ST_MakePoint(83.2713316, 17.7362275), 4326), '{"TRK NRSNK HM, D625"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Durga Nursing Home, Visakhapatnam', 'Durga Nursing Home  TRK NRSNK HM, D625', ST_SetSRID(ST_MakePoint(83.2713316, 17.7362275), 4326), 50);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3064945, 17.7196417), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3064945, 17.7196417), 4326), 10);
    END IF;
    -- Insert Zeeshan Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Zeeshan Restaurant', ST_SetSRID(ST_MakePoint(83.3014693, 17.7118301), 4326), '{"Z256, SXN RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Zeeshan Restaurant, Visakhapatnam', 'Zeeshan Restaurant  Z256, SXN RSTRNT', ST_SetSRID(ST_MakePoint(83.3014693, 17.7118301), 4326), 10);
    END IF;
    -- Insert Alpha (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Alpha', ST_SetSRID(ST_MakePoint(83.3017677, 17.7121827), 4326), '{"ALF, A410"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Alpha, Visakhapatnam', 'Alpha  ALF, A410', ST_SetSRID(ST_MakePoint(83.3017677, 17.7121827), 4326), 10);
    END IF;
    -- Insert Alkapuri (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Alkapuri', ST_SetSRID(ST_MakePoint(83.2997229, 17.7129302), 4326), '{"ALKPR, A421"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Alkapuri, Visakhapatnam', 'Alkapuri  ALKPR, A421', ST_SetSRID(ST_MakePoint(83.2997229, 17.7129302), 4326), 10);
    END IF;
    -- Insert Nelluru Vaari Mess (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nelluru Vaari Mess', ST_SetSRID(ST_MakePoint(83.3015243, 17.7153833), 4326), '{"N461, NLR FR MS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nelluru Vaari Mess, Visakhapatnam', 'Nelluru Vaari Mess  N461, NLR FR MS', ST_SetSRID(ST_MakePoint(83.3015243, 17.7153833), 4326), 10);
    END IF;
    -- Insert manjeera (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'manjeera', ST_SetSRID(ST_MakePoint(83.3010053, 17.7151419), 4326), '{"M526, MNJR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'manjeera, Visakhapatnam', 'manjeera  M526, MNJR', ST_SetSRID(ST_MakePoint(83.3010053, 17.7151419), 4326), 10);
    END IF;
    -- Insert Eleven (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Eleven', ST_SetSRID(ST_MakePoint(83.3175507, 17.7241818), 4326), '{"ELFN, E415"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Eleven, Visakhapatnam', 'Eleven  ELFN, E415', ST_SetSRID(ST_MakePoint(83.3175507, 17.7241818), 4326), 10);
    END IF;
    -- Insert Flying Spaghetti Monster (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Flying Spaghetti Monster', ST_SetSRID(ST_MakePoint(83.3148642, 17.7212175), 4326), '{"F452, FLYNK SPKHT MNSTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Flying Spaghetti Monster, Visakhapatnam', 'Flying Spaghetti Monster  F452, FLYNK SPKHT MNSTR', ST_SetSRID(ST_MakePoint(83.3148642, 17.7212175), 4326), 10);
    END IF;
    -- Insert Systems Design (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Systems Design', ST_SetSRID(ST_MakePoint(83.3270212, 17.7230565), 4326), '{"S235, SSTMS TS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Systems Design, Visakhapatnam', 'Systems Design  S235, SSTMS TS', ST_SetSRID(ST_MakePoint(83.3270212, 17.7230565), 4326), 50);
    END IF;
    -- Insert Indian Overseas Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Overseas Bank', ST_SetSRID(ST_MakePoint(83.3318508, 17.7340863), 4326), '{"I535, INTN OFRSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Overseas Bank, Visakhapatnam', 'Indian Overseas Bank  I535, INTN OFRSS BNK', ST_SetSRID(ST_MakePoint(83.3318508, 17.7340863), 4326), 10);
    END IF;
    -- Insert Rama Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rama Hospitals', ST_SetSRID(ST_MakePoint(83.3071191, 17.7375272), 4326), '{"R521, RM HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rama Hospitals, Visakhapatnam', 'Rama Hospitals  R521, RM HSPTLS', ST_SetSRID(ST_MakePoint(83.3071191, 17.7375272), 4326), 50);
    END IF;
    -- Insert Punjab National Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Punjab National Bank', ST_SetSRID(ST_MakePoint(83.3325477, 17.7415448), 4326), '{"PNJB NXNL BNK, P521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Punjab National Bank, Visakhapatnam', 'Punjab National Bank  PNJB NXNL BNK, P521', ST_SetSRID(ST_MakePoint(83.3325477, 17.7415448), 4326), 10);
    END IF;
    -- Insert Corporation Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Corporation Bank', ST_SetSRID(ST_MakePoint(83.3312928, 17.7422046), 4326), '{"C616, KRPRXN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Corporation Bank, Visakhapatnam', 'Corporation Bank  C616, KRPRXN BNK', ST_SetSRID(ST_MakePoint(83.3312928, 17.7422046), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.3281991, 17.7426196), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.3281991, 17.7426196), 4326), 10);
    END IF;
    -- Insert Kotak Mahindra Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotak Mahindra Bank', ST_SetSRID(ST_MakePoint(83.3293554, 17.7423017), 4326), '{"K325, KTK MHNTR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotak Mahindra Bank, Visakhapatnam', 'Kotak Mahindra Bank  K325, KTK MHNTR BNK', ST_SetSRID(ST_MakePoint(83.3293554, 17.7423017), 4326), 10);
    END IF;
    -- Insert Axis Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Axis Bank', ST_SetSRID(ST_MakePoint(83.3289771, 17.742715), 4326), '{"A221, AKSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Axis Bank, Visakhapatnam', 'Axis Bank  A221, AKSS BNK', ST_SetSRID(ST_MakePoint(83.3289771, 17.742715), 4326), 10);
    END IF;
    -- Insert JNNURM Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'JNNURM Colony', ST_SetSRID(ST_MakePoint(83.2694312, 17.7825206), 4326), '{"J565, JNRM KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'JNNURM Colony, Visakhapatnam', 'JNNURM Colony  J565, JNRM KLN', ST_SetSRID(ST_MakePoint(83.2694312, 17.7825206), 4326), 60);
    END IF;
    -- Insert kalavathi hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'kalavathi hospital', ST_SetSRID(ST_MakePoint(83.2706719, 17.7824442), 4326), '{"KLF0 HSPTL, K413"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'kalavathi hospital, Visakhapatnam', 'kalavathi hospital  KLF0 HSPTL, K413', ST_SetSRID(ST_MakePoint(83.2706719, 17.7824442), 4326), 50);
    END IF;
    -- Insert Chinna Gadhili (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Gadhili', ST_SetSRID(ST_MakePoint(83.3162033, 17.7599248), 4326), '{"XN KTHL, C523"}', jsonb_build_object('te', 'చినగదిలి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Gadhili, Visakhapatnam', 'Chinna Gadhili చినగదిలి XN KTHL, C523', ST_SetSRID(ST_MakePoint(83.3162033, 17.7599248), 4326), 80);
    END IF;
    -- Insert LV Prasad Eye Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'LV Prasad Eye Hospital', ST_SetSRID(ST_MakePoint(83.3309144, 17.7568569), 4326), '{"L116, LF PRST EY HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'LV Prasad Eye Hospital, Visakhapatnam', 'LV Prasad Eye Hospital  L116, LF PRST EY HSPTL', ST_SetSRID(ST_MakePoint(83.3309144, 17.7568569), 4326), 50);
    END IF;
    -- Insert Deccan Fried Chicken (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Deccan Fried Chicken', ST_SetSRID(ST_MakePoint(83.2100102, 17.8004017), 4326), '{"TKKN FRT XKN, D251"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Deccan Fried Chicken, Visakhapatnam', 'Deccan Fried Chicken  TKKN FRT XKN, D251', ST_SetSRID(ST_MakePoint(83.2100102, 17.8004017), 4326), 10);
    END IF;
    -- Insert Govt High School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Govt High School', ST_SetSRID(ST_MakePoint(83.5489993, 18.091722), 4326), '{"G132, KFT H SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Govt High School, Visakhapatnam', 'Govt High School  G132, KFT H SXL', ST_SetSRID(ST_MakePoint(83.5489993, 18.091722), 4326), 50);
    END IF;
    -- Insert Govt. Junior college (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Govt. Junior college', ST_SetSRID(ST_MakePoint(83.5483488, 18.0916138), 4326), '{"G132, KFT JNR KLJ"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Govt. Junior college, Visakhapatnam', 'Govt. Junior college  G132, KFT JNR KLJ', ST_SetSRID(ST_MakePoint(83.5483488, 18.0916138), 4326), 50);
    END IF;
    -- Insert Govt. primary School, Rellivalasa (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Govt. primary School, Rellivalasa', ST_SetSRID(ST_MakePoint(83.5254293, 18.0914055), 4326), '{"KFT PRMR SXL RLFLS, G131"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Govt. primary School, Rellivalasa, Visakhapatnam', 'Govt. primary School, Rellivalasa  KFT PRMR SXL RLFLS, G131', ST_SetSRID(ST_MakePoint(83.5254293, 18.0914055), 4326), 50);
    END IF;
    -- Insert Govt. High school (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Govt. High school', ST_SetSRID(ST_MakePoint(83.5205726, 18.0966378), 4326), '{"G132, KFT H SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Govt. High school, Visakhapatnam', 'Govt. High school  G132, KFT H SXL', ST_SetSRID(ST_MakePoint(83.5205726, 18.0966378), 4326), 50);
    END IF;
    -- Insert KIMS (formerly Queens NRI Hospital) (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'KIMS (formerly Queens NRI Hospital)', ST_SetSRID(ST_MakePoint(83.3080536, 17.7404353), 4326), '{"KMS FRMRL KNS NR HSPTL, K521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'KIMS (formerly Queens NRI Hospital), Visakhapatnam', 'KIMS (formerly Queens NRI Hospital)  KMS FRMRL KNS NR HSPTL, K521', ST_SetSRID(ST_MakePoint(83.3080536, 17.7404353), 4326), 50);
    END IF;
    -- Insert Sri Venkateshwara Nursing Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Venkateshwara Nursing Hospital', ST_SetSRID(ST_MakePoint(83.307414, 17.7147802), 4326), '{"S615, SR FNKTXWR NRSNK HSPTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Venkateshwara Nursing Hospital, Visakhapatnam', 'Sri Venkateshwara Nursing Hospital  S615, SR FNKTXWR NRSNK HSPTL', ST_SetSRID(ST_MakePoint(83.307414, 17.7147802), 4326), 50);
    END IF;
    -- Insert Amulya Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amulya Hospitals', ST_SetSRID(ST_MakePoint(83.3086985, 17.7154685), 4326), '{"A542, AMLY HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amulya Hospitals, Visakhapatnam', 'Amulya Hospitals  A542, AMLY HSPTLS', ST_SetSRID(ST_MakePoint(83.3086985, 17.7154685), 4326), 50);
    END IF;
    -- Insert kinnera mess (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'kinnera mess', ST_SetSRID(ST_MakePoint(83.3047732, 17.7369086), 4326), '{"KNR MS, K565"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'kinnera mess, Visakhapatnam', 'kinnera mess  KNR MS, K565', ST_SetSRID(ST_MakePoint(83.3047732, 17.7369086), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3043682, 17.7367272), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3043682, 17.7367272), 4326), 10);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.3044004, 17.7367936), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.3044004, 17.7367936), 4326), 10);
    END IF;
    -- Insert karanataka bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'karanataka bank', ST_SetSRID(ST_MakePoint(83.3042984, 17.7357998), 4326), '{"K653, KRNTK BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'karanataka bank, Visakhapatnam', 'karanataka bank  K653, KRNTK BNK', ST_SetSRID(ST_MakePoint(83.3042984, 17.7357998), 4326), 10);
    END IF;
    -- Insert Madhura inn restaurant & function hall (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madhura inn restaurant & function hall', ST_SetSRID(ST_MakePoint(83.3043675, 17.7332822), 4326), '{"MTHR IN RSTRNT FNKXN HL, M365"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madhura inn restaurant & function hall, Visakhapatnam', 'Madhura inn restaurant & function hall  MTHR IN RSTRNT FNKXN HL, M365', ST_SetSRID(ST_MakePoint(83.3043675, 17.7332822), 4326), 10);
    END IF;
    -- Insert Kala Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kala Hospital', ST_SetSRID(ST_MakePoint(83.3056846, 17.7288521), 4326), '{"KL HSPTL, K421"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kala Hospital, Visakhapatnam', 'Kala Hospital  KL HSPTL, K421', ST_SetSRID(ST_MakePoint(83.3056846, 17.7288521), 4326), 50);
    END IF;
    -- Insert Andhra bank Malkapuram (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Andhra bank Malkapuram', ST_SetSRID(ST_MakePoint(83.2420312, 17.6889968), 4326), '{"ANTHR BNK MLKPRM, A536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Andhra bank Malkapuram, Visakhapatnam', 'Andhra bank Malkapuram  ANTHR BNK MLKPRM, A536', ST_SetSRID(ST_MakePoint(83.2420312, 17.6889968), 4326), 10);
    END IF;
    -- Insert Canara Bank (atm)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.2414565, 17.689084), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.2414565, 17.689084), 4326), 10);
    END IF;
    -- Insert Axis Bank (atm)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Axis Bank', ST_SetSRID(ST_MakePoint(83.2419543, 17.6890108), 4326), '{"A221, AKSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Axis Bank, Visakhapatnam', 'Axis Bank  A221, AKSS BNK', ST_SetSRID(ST_MakePoint(83.2419543, 17.6890108), 4326), 10);
    END IF;
    -- Insert Guntur Mess (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Guntur Mess', ST_SetSRID(ST_MakePoint(83.2426004, 17.6889118), 4326), '{"KNTR MS, G536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Guntur Mess, Visakhapatnam', 'Guntur Mess  KNTR MS, G536', ST_SetSRID(ST_MakePoint(83.2426004, 17.6889118), 4326), 10);
    END IF;
    -- Insert SBI Malkapuram (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SBI Malkapuram', ST_SetSRID(ST_MakePoint(83.2445457, 17.6885733), 4326), '{"S154, SB MLKPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SBI Malkapuram, Visakhapatnam', 'SBI Malkapuram  S154, SB MLKPRM', ST_SetSRID(ST_MakePoint(83.2445457, 17.6885733), 4326), 10);
    END IF;
    -- Insert ICICI (atm)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI', ST_SetSRID(ST_MakePoint(83.2431694, 17.6888157), 4326), '{"ISS, I220"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI, Visakhapatnam', 'ICICI  ISS, I220', ST_SetSRID(ST_MakePoint(83.2431694, 17.6888157), 4326), 10);
    END IF;
    -- Insert gongura restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'gongura restaurant', ST_SetSRID(ST_MakePoint(83.2387016, 17.7460013), 4326), '{"KNKR RSTRNT, G526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'gongura restaurant, Visakhapatnam', 'gongura restaurant  KNKR RSTRNT, G526', ST_SetSRID(ST_MakePoint(83.2387016, 17.7460013), 4326), 10);
    END IF;
    -- Insert Punjab National Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Punjab National Bank', ST_SetSRID(ST_MakePoint(83.237643, 17.7417218), 4326), '{"PNJB NXNL BNK, P521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Punjab National Bank, Visakhapatnam', 'Punjab National Bank  PNJB NXNL BNK, P521', ST_SetSRID(ST_MakePoint(83.237643, 17.7417218), 4326), 10);
    END IF;
    -- Insert venkatadri vantillu (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'venkatadri vantillu', ST_SetSRID(ST_MakePoint(83.2366431, 17.7446743), 4326), '{"FNKTTR FNTL, V523"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'venkatadri vantillu, Visakhapatnam', 'venkatadri vantillu  FNKTTR FNTL, V523', ST_SetSRID(ST_MakePoint(83.2366431, 17.7446743), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.0971401, 17.6873142), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.0971401, 17.6873142), 4326), 10);
    END IF;
    -- Insert Gurugu Bheemavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gurugu Bheemavaram', ST_SetSRID(ST_MakePoint(82.8609012, 17.6394701), 4326), '{"G621, KRK BHMFRM"}', jsonb_build_object('te', 'గురుగు భీమవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gurugu Bheemavaram, Visakhapatnam', 'Gurugu Bheemavaram గురుగు భీమవరం G621, KRK BHMFRM', ST_SetSRID(ST_MakePoint(82.8609012, 17.6394701), 4326), 40);
    END IF;
    -- Insert Kothuru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kothuru', ST_SetSRID(ST_MakePoint(82.9996281, 17.8970641), 4326), '{"K360, K0R"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kothuru, Visakhapatnam', 'Kothuru  K360, K0R', ST_SetSRID(ST_MakePoint(82.9996281, 17.8970641), 4326), 40);
    END IF;
    -- Insert Kothapenta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kothapenta', ST_SetSRID(ST_MakePoint(83.0005635, 17.9060823), 4326), '{"K0PNT, K315"}', jsonb_build_object('te', 'కొత్తపెంట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kothapenta, Visakhapatnam', 'Kothapenta కొత్తపెంట K0PNT, K315', ST_SetSRID(ST_MakePoint(83.0005635, 17.9060823), 4326), 40);
    END IF;
    -- Insert Alamanda Bhimavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Alamanda Bhimavaram', ST_SetSRID(ST_MakePoint(83.0095173, 17.9104024), 4326), '{"A455, ALMNT BHMFRM"}', jsonb_build_object('te', 'అలమండ భీమవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Alamanda Bhimavaram, Visakhapatnam', 'Alamanda Bhimavaram అలమండ భీమవరం A455, ALMNT BHMFRM', ST_SetSRID(ST_MakePoint(83.0095173, 17.9104024), 4326), 40);
    END IF;
    -- Insert Vadrapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vadrapalem', ST_SetSRID(ST_MakePoint(82.9917202, 17.9150403), 4326), '{"FTRPLM, V361"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vadrapalem, Visakhapatnam', 'Vadrapalem  FTRPLM, V361', ST_SetSRID(ST_MakePoint(82.9917202, 17.9150403), 4326), 40);
    END IF;
    -- Insert Narasimha Gajipatinagaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narasimha Gajipatinagaram', ST_SetSRID(ST_MakePoint(82.9903142, 17.9125201), 4326), '{"N625, NRSMH KJPTNKRM"}', jsonb_build_object('te', 'నరసింహ గజపతినగరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narasimha Gajipatinagaram, Visakhapatnam', 'Narasimha Gajipatinagaram నరసింహ గజపతినగరం N625, NRSMH KJPTNKRM', ST_SetSRID(ST_MakePoint(82.9903142, 17.9125201), 4326), 40);
    END IF;
    -- Insert Kaligotla (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kaligotla', ST_SetSRID(ST_MakePoint(82.9662443, 17.9031111), 4326), '{"KLKTL, K423"}', jsonb_build_object('te', 'కలిగొట్ల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kaligotla, Visakhapatnam', 'Kaligotla కలిగొట్ల KLKTL, K423', ST_SetSRID(ST_MakePoint(82.9662443, 17.9031111), 4326), 40);
    END IF;
    -- Insert Arjunagiri Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Arjunagiri Agraharam', ST_SetSRID(ST_MakePoint(82.9350662, 17.9103558), 4326), '{"ARJNJR AKRHRM, A625"}', jsonb_build_object('te', 'అర్జునగిరి అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Arjunagiri Agraharam, Visakhapatnam', 'Arjunagiri Agraharam అర్జునగిరి అగ్రహారం ARJNJR AKRHRM, A625', ST_SetSRID(ST_MakePoint(82.9350662, 17.9103558), 4326), 40);
    END IF;
    -- Insert Chettupalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chettupalle', ST_SetSRID(ST_MakePoint(82.9289007, 17.9018824), 4326), '{"XTPL, C314"}', jsonb_build_object('te', 'చెట్టుపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chettupalle, Visakhapatnam', 'Chettupalle చెట్టుపల్లి XTPL, C314', ST_SetSRID(ST_MakePoint(82.9289007, 17.9018824), 4326), 40);
    END IF;
    -- Insert Byllpidi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Byllpidi', ST_SetSRID(ST_MakePoint(82.8816638, 17.8948329), 4326), '{"BLPT, B413"}', jsonb_build_object('te', 'బైలపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Byllpidi, Visakhapatnam', 'Byllpidi బైలపూడి BLPT, B413', ST_SetSRID(ST_MakePoint(82.8816638, 17.8948329), 4326), 40);
    END IF;
    -- Insert Pedda Gogada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Gogada', ST_SetSRID(ST_MakePoint(82.9185618, 17.9125662), 4326), '{"P322, PT KKT"}', jsonb_build_object('te', 'పెదగోగాడ అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Gogada, Visakhapatnam', 'Pedda Gogada పెదగోగాడ అగ్రహారం P322, PT KKT', ST_SetSRID(ST_MakePoint(82.9185618, 17.9125662), 4326), 40);
    END IF;
    -- Insert Kottapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottapalle', ST_SetSRID(ST_MakePoint(82.9011684, 17.9078619), 4326), '{"KTPL, K314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottapalle, Visakhapatnam', 'Kottapalle  KTPL, K314', ST_SetSRID(ST_MakePoint(82.9011684, 17.9078619), 4326), 40);
    END IF;
    -- Insert Chinagogada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinagogada', ST_SetSRID(ST_MakePoint(82.9061451, 17.8977128), 4326), '{"C522, XNKKT"}', jsonb_build_object('te', 'చినగోగాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinagogada, Visakhapatnam', 'Chinagogada చినగోగాడ C522, XNKKT', ST_SetSRID(ST_MakePoint(82.9061451, 17.8977128), 4326), 40);
    END IF;
    -- Insert Dibbapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dibbapalem', ST_SetSRID(ST_MakePoint(82.8813148, 17.8799453), 4326), '{"D114, TBPLM"}', jsonb_build_object('te', 'దిబ్బపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dibbapalem, Visakhapatnam', 'Dibbapalem దిబ్బపాలెం D114, TBPLM', ST_SetSRID(ST_MakePoint(82.8813148, 17.8799453), 4326), 40);
    END IF;
    -- Insert Varahapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Varahapuram', ST_SetSRID(ST_MakePoint(82.9159287, 17.8842172), 4326), '{"V616, FRHPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Varahapuram, Visakhapatnam', 'Varahapuram  V616, FRHPRM', ST_SetSRID(ST_MakePoint(82.9159287, 17.8842172), 4326), 40);
    END IF;
    -- Insert Advi Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Advi Agraharam', ST_SetSRID(ST_MakePoint(82.8958542, 17.8910686), 4326), '{"A312, ATF AKRHRM"}', jsonb_build_object('te', 'అడివి అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Advi Agraharam, Visakhapatnam', 'Advi Agraharam అడివి అగ్రహారం A312, ATF AKRHRM', ST_SetSRID(ST_MakePoint(82.8958542, 17.8910686), 4326), 40);
    END IF;
    -- Insert Tunivalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tunivalasa', ST_SetSRID(ST_MakePoint(82.9087212, 17.8784626), 4326), '{"T514, TNFLS"}', jsonb_build_object('te', 'తుని వలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tunivalasa, Visakhapatnam', 'Tunivalasa తుని వలస T514, TNFLS', ST_SetSRID(ST_MakePoint(82.9087212, 17.8784626), 4326), 40);
    END IF;
    -- Insert Vintipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vintipalem', ST_SetSRID(ST_MakePoint(82.9016819, 17.8823061), 4326), '{"FNTPLM, V531"}', jsonb_build_object('te', 'వింటిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vintipalem, Visakhapatnam', 'Vintipalem వింటిపాలెం FNTPLM, V531', ST_SetSRID(ST_MakePoint(82.9016819, 17.8823061), 4326), 40);
    END IF;
    -- Insert Vijayaramarajupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijayaramarajupeta', ST_SetSRID(ST_MakePoint(82.8811913, 17.8569323), 4326), '{"FJYRMRJPT, V265"}', jsonb_build_object('te', 'విజయరామరాజుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijayaramarajupeta, Visakhapatnam', 'Vijayaramarajupeta విజయరామరాజుపేట FJYRMRJPT, V265', ST_SetSRID(ST_MakePoint(82.8811913, 17.8569323), 4326), 40);
    END IF;
    -- Insert Lakshmipuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lakshmipuram', ST_SetSRID(ST_MakePoint(82.915607, 17.8525348), 4326), '{"L251, LKXMPRM"}', jsonb_build_object('te', 'లక్ష్మీపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lakshmipuram, Visakhapatnam', 'Lakshmipuram లక్ష్మీపురం L251, LKXMPRM', ST_SetSRID(ST_MakePoint(82.915607, 17.8525348), 4326), 40);
    END IF;
    -- Insert Danda Suraram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Danda Suraram', ST_SetSRID(ST_MakePoint(82.8964093, 17.8678601), 4326), '{"D532, TNT SRRM"}', jsonb_build_object('te', 'దండి సూరవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Danda Suraram, Visakhapatnam', 'Danda Suraram దండి సూరవరం D532, TNT SRRM', ST_SetSRID(ST_MakePoint(82.8964093, 17.8678601), 4326), 40);
    END IF;
    -- Insert Damunapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Damunapalle', ST_SetSRID(ST_MakePoint(82.9251311, 17.8616646), 4326), '{"D551, TMNPL"}', jsonb_build_object('te', 'దామునాపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Damunapalle, Visakhapatnam', 'Damunapalle దామునాపల్లి D551, TMNPL', ST_SetSRID(ST_MakePoint(82.9251311, 17.8616646), 4326), 40);
    END IF;
    -- Insert Macherlapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Macherlapalem', ST_SetSRID(ST_MakePoint(82.9308688, 17.8682872), 4326), '{"M264, MXRLPLM"}', jsonb_build_object('te', 'మైచర్లపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Macherlapalem, Visakhapatnam', 'Macherlapalem మైచర్లపాలెం M264, MXRLPLM', ST_SetSRID(ST_MakePoint(82.9308688, 17.8682872), 4326), 40);
    END IF;
    -- Insert Kattadi Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kattadi Agraharam', ST_SetSRID(ST_MakePoint(82.884605, 17.8683947), 4326), '{"K332, KTT AKRHRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kattadi Agraharam, Visakhapatnam', 'Kattadi Agraharam  K332, KTT AKRHRM', ST_SetSRID(ST_MakePoint(82.884605, 17.8683947), 4326), 40);
    END IF;
    -- Insert Chinna Nayudupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Nayudupalem', ST_SetSRID(ST_MakePoint(82.9544699, 17.8356651), 4326), '{"XN NYTPLM, C553"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Nayudupalem, Visakhapatnam', 'Chinna Nayudupalem  XN NYTPLM, C553', ST_SetSRID(ST_MakePoint(82.9544699, 17.8356651), 4326), 40);
    END IF;
    -- Insert Annavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Annavaram', ST_SetSRID(ST_MakePoint(82.9399629, 17.8364416), 4326), '{"ANFRM, A516"}', jsonb_build_object('te', 'అన్నవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Annavaram, Visakhapatnam', 'Annavaram అన్నవరం ANFRM, A516', ST_SetSRID(ST_MakePoint(82.9399629, 17.8364416), 4326), 40);
    END IF;
    -- Insert Gullepalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gullepalli', ST_SetSRID(ST_MakePoint(83.0176322, 17.8536405), 4326), '{"KLPL, G414"}', jsonb_build_object('te', 'గుల్లేపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gullepalli, Visakhapatnam', 'Gullepalli గుల్లేపల్లి KLPL, G414', ST_SetSRID(ST_MakePoint(83.0176322, 17.8536405), 4326), 40);
    END IF;
    -- Insert Murugupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Murugupalem', ST_SetSRID(ST_MakePoint(83.0001505, 17.8608224), 4326), '{"M621, MRKPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Murugupalem, Visakhapatnam', 'Murugupalem  M621, MRKPLM', ST_SetSRID(ST_MakePoint(83.0001505, 17.8608224), 4326), 40);
    END IF;
    -- Insert Paidammapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Paidammapeta', ST_SetSRID(ST_MakePoint(83.0012748, 17.8662181), 4326), '{"P351, PTMPT"}', jsonb_build_object('te', 'పైడంపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Paidammapeta, Visakhapatnam', 'Paidammapeta పైడంపేట P351, PTMPT', ST_SetSRID(ST_MakePoint(83.0012748, 17.8662181), 4326), 40);
    END IF;
    -- Insert Medacharla (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Medacharla', ST_SetSRID(ST_MakePoint(83.0166839, 17.8956302), 4326), '{"MTXRL, M326"}', jsonb_build_object('te', 'మేడిచెర్ల'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Medacharla, Visakhapatnam', 'Medacharla మేడిచెర్ల MTXRL, M326', ST_SetSRID(ST_MakePoint(83.0166839, 17.8956302), 4326), 40);
    END IF;
    -- Insert Rongalinayudupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rongalinayudupalem', ST_SetSRID(ST_MakePoint(83.0097687, 17.8820906), 4326), '{"R524, RNKLNYTPLM"}', jsonb_build_object('te', 'రొంగలినాయుడుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rongalinayudupalem, Visakhapatnam', 'Rongalinayudupalem రొంగలినాయుడుపాలెం R524, RNKLNYTPLM', ST_SetSRID(ST_MakePoint(83.0097687, 17.8820906), 4326), 40);
    END IF;
    -- Insert Kottapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottapalle', ST_SetSRID(ST_MakePoint(82.9535287, 17.8883546), 4326), '{"KTPL, K314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottapalle, Visakhapatnam', 'Kottapalle  KTPL, K314', ST_SetSRID(ST_MakePoint(82.9535287, 17.8883546), 4326), 40);
    END IF;
    -- Insert Chukkapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chukkapalle', ST_SetSRID(ST_MakePoint(82.9394931, 17.8845387), 4326), '{"XKPL, C214"}', jsonb_build_object('te', 'చుక్కపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chukkapalle, Visakhapatnam', 'Chukkapalle చుక్కపల్లి XKPL, C214', ST_SetSRID(ST_MakePoint(82.9394931, 17.8845387), 4326), 40);
    END IF;
    -- Insert Boyllakintada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boyllakintada', ST_SetSRID(ST_MakePoint(82.9652925, 17.8837494), 4326), '{"BLKNTT, B425"}', jsonb_build_object('te', 'బొయిలకింతాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boyllakintada, Visakhapatnam', 'Boyllakintada బొయిలకింతాడ BLKNTT, B425', ST_SetSRID(ST_MakePoint(82.9652925, 17.8837494), 4326), 40);
    END IF;
    -- Insert Mulakalapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mulakalapalle', ST_SetSRID(ST_MakePoint(82.9853699, 17.8948215), 4326), '{"MLKLPL, M424"}', jsonb_build_object('te', 'ములకలపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mulakalapalle, Visakhapatnam', 'Mulakalapalle ములకలపల్లి MLKLPL, M424', ST_SetSRID(ST_MakePoint(82.9853699, 17.8948215), 4326), 40);
    END IF;
    -- Insert Gavaravaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gavaravaram', ST_SetSRID(ST_MakePoint(82.967529, 17.8748072), 4326), '{"KFRFRM, G161"}', jsonb_build_object('te', 'గవరవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gavaravaram, Visakhapatnam', 'Gavaravaram గవరవరం KFRFRM, G161', ST_SetSRID(ST_MakePoint(82.967529, 17.8748072), 4326), 40);
    END IF;
    -- Insert Lakkavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lakkavaram', ST_SetSRID(ST_MakePoint(82.9614448, 17.8500475), 4326), '{"L216, LKFRM"}', jsonb_build_object('te', 'లక్కవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lakkavaram, Visakhapatnam', 'Lakkavaram లక్కవరం L216, LKFRM', ST_SetSRID(ST_MakePoint(82.9614448, 17.8500475), 4326), 40);
    END IF;
    -- Insert Revallu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Revallu', ST_SetSRID(ST_MakePoint(82.9509244, 17.8437984), 4326), '{"R140, RFL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Revallu, Visakhapatnam', 'Revallu  R140, RFL', ST_SetSRID(ST_MakePoint(82.9509244, 17.8437984), 4326), 40);
    END IF;
    -- Insert Pasilavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pasilavanipalem', ST_SetSRID(ST_MakePoint(82.9930195, 17.861691), 4326), '{"P241, PSLFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pasilavanipalem, Visakhapatnam', 'Pasilavanipalem  P241, PSLFNPLM', ST_SetSRID(ST_MakePoint(82.9930195, 17.861691), 4326), 40);
    END IF;
    -- Insert Mallammapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mallammapalem', ST_SetSRID(ST_MakePoint(82.9838958, 17.8491539), 4326), '{"M451, MLMPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mallammapalem, Visakhapatnam', 'Mallammapalem  M451, MLMPLM', ST_SetSRID(ST_MakePoint(82.9838958, 17.8491539), 4326), 40);
    END IF;
    -- Insert Kandepalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kandepalle', ST_SetSRID(ST_MakePoint(82.9397348, 17.8606466), 4326), '{"K531, KNTPL"}', jsonb_build_object('te', 'ఖండేపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kandepalle, Visakhapatnam', 'Kandepalle ఖండేపల్లి K531, KNTPL', ST_SetSRID(ST_MakePoint(82.9397348, 17.8606466), 4326), 40);
    END IF;
    -- Insert Jagannadhapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jagannadhapuram', ST_SetSRID(ST_MakePoint(82.9883777, 17.8644868), 4326), '{"JKNTHPRM, J253"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jagannadhapuram, Visakhapatnam', 'Jagannadhapuram  JKNTHPRM, J253', ST_SetSRID(ST_MakePoint(82.9883777, 17.8644868), 4326), 40);
    END IF;
    -- Insert Jagalavanipalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jagalavanipalem', ST_SetSRID(ST_MakePoint(83.3446201, 17.7553958), 4326), '{"JKLFNPLM, J241"}', jsonb_build_object('te', 'జగలవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jagalavanipalem, Visakhapatnam', 'Jagalavanipalem జగలవానిపాలెం JKLFNPLM, J241', ST_SetSRID(ST_MakePoint(83.3446201, 17.7553958), 4326), 60);
    END IF;
    -- Insert Santapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Santapalem', ST_SetSRID(ST_MakePoint(83.3097484, 17.7599241), 4326), '{"S531, SNTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Santapalem, Visakhapatnam', 'Santapalem  S531, SNTPLM', ST_SetSRID(ST_MakePoint(83.3097484, 17.7599241), 4326), 60);
    END IF;
    -- Insert Tatagaruvu (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tatagaruvu', ST_SetSRID(ST_MakePoint(83.3204924, 17.7640713), 4326), '{"TTKRF, T326"}', jsonb_build_object('te', 'తాతగరువు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tatagaruvu, Visakhapatnam', 'Tatagaruvu తాతగరువు TTKRF, T326', ST_SetSRID(ST_MakePoint(83.3204924, 17.7640713), 4326), 60);
    END IF;
    -- Insert Arilova (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Arilova', ST_SetSRID(ST_MakePoint(83.3154134, 17.7651243), 4326), '{"ARLF, A641"}', jsonb_build_object('te', 'అరిలోవ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Arilova, Visakhapatnam', 'Arilova అరిలోవ ARLF, A641', ST_SetSRID(ST_MakePoint(83.3154134, 17.7651243), 4326), 60);
    END IF;
    -- Insert Mudasarlova (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mudasarlova', ST_SetSRID(ST_MakePoint(83.3028439, 17.7634206), 4326), '{"MTSRLF, M326"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mudasarlova, Visakhapatnam', 'Mudasarlova  MTSRLF, M326', ST_SetSRID(ST_MakePoint(83.3028439, 17.7634206), 4326), 80);
    END IF;
    -- Insert Pedda Ghadhili (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Ghadhili', ST_SetSRID(ST_MakePoint(83.3229141, 17.7578041), 4326), '{"PT KHTHL, P323"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Ghadhili, Visakhapatnam', 'Pedda Ghadhili  PT KHTHL, P323', ST_SetSRID(ST_MakePoint(83.3229141, 17.7578041), 4326), 80);
    END IF;
    -- Insert Mulakhuddu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mulakhuddu', ST_SetSRID(ST_MakePoint(83.4478743, 17.9285523), 4326), '{"M423, MLKHT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mulakhuddu, Visakhapatnam', 'Mulakhuddu  M423, MLKHT', ST_SetSRID(ST_MakePoint(83.4478743, 17.9285523), 4326), 40);
    END IF;
    -- Insert Chippada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chippada', ST_SetSRID(ST_MakePoint(83.4567881, 17.9335011), 4326), '{"XPT, C130"}', jsonb_build_object('te', 'చిప్పడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chippada, Visakhapatnam', 'Chippada చిప్పడ XPT, C130', ST_SetSRID(ST_MakePoint(83.4567881, 17.9335011), 4326), 40);
    END IF;
    -- Insert Maddipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maddipeta', ST_SetSRID(ST_MakePoint(83.4404923, 17.9327585), 4326), '{"M313, MTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maddipeta, Visakhapatnam', 'Maddipeta  M313, MTPT', ST_SetSRID(ST_MakePoint(83.4404923, 17.9327585), 4326), 40);
    END IF;
    -- Insert Kusulavada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kusulavada', ST_SetSRID(ST_MakePoint(83.3421228, 17.9429202), 4326), '{"K241, KSLFT"}', jsonb_build_object('te', 'కుశిలివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kusulavada, Visakhapatnam', 'Kusulavada కుశిలివాడ K241, KSLFT', ST_SetSRID(ST_MakePoint(83.3421228, 17.9429202), 4326), 40);
    END IF;
    -- Insert Gollalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(83.3357548, 17.9384163), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem  KLLPLM, G441', ST_SetSRID(ST_MakePoint(83.3357548, 17.9384163), 4326), 40);
    END IF;
    -- Insert Jagannadhapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jagannadhapuram', ST_SetSRID(ST_MakePoint(83.3408229, 17.9254808), 4326), '{"JKNTHPRM, J253"}', jsonb_build_object('te', 'జగన్నాధపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jagannadhapuram, Visakhapatnam', 'Jagannadhapuram జగన్నాధపురం JKNTHPRM, J253', ST_SetSRID(ST_MakePoint(83.3408229, 17.9254808), 4326), 40);
    END IF;
    -- Insert Gottipalli Kallalu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gottipalli Kallalu', ST_SetSRID(ST_MakePoint(83.3646528, 17.9325441), 4326), '{"G314, KTPL KLL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gottipalli Kallalu, Visakhapatnam', 'Gottipalli Kallalu  G314, KTPL KLL', ST_SetSRID(ST_MakePoint(83.3646528, 17.9325441), 4326), 40);
    END IF;
    -- Insert Enugulapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Enugulapalem', ST_SetSRID(ST_MakePoint(83.3603406, 17.9415866), 4326), '{"E524, ENKLPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Enugulapalem, Visakhapatnam', 'Enugulapalem  E524, ENKLPLM', ST_SetSRID(ST_MakePoint(83.3603406, 17.9415866), 4326), 40);
    END IF;
    -- Insert Gottipalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gottipalli', ST_SetSRID(ST_MakePoint(83.3556192, 17.9363706), 4326), '{"KTPL, G314"}', jsonb_build_object('te', 'గొట్టిపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gottipalli, Visakhapatnam', 'Gottipalli గొట్టిపల్లి KTPL, G314', ST_SetSRID(ST_MakePoint(83.3556192, 17.9363706), 4326), 40);
    END IF;
    -- Insert Simalamettapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simalamettapalem', ST_SetSRID(ST_MakePoint(83.352034, 17.9285005), 4326), '{"S545, SMLMTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simalamettapalem, Visakhapatnam', 'Simalamettapalem  S545, SMLMTPLM', ST_SetSRID(ST_MakePoint(83.352034, 17.9285005), 4326), 40);
    END IF;
    -- Insert Chandaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chandaka', ST_SetSRID(ST_MakePoint(83.3626889, 17.9220887), 4326), '{"XNTK, C532"}', jsonb_build_object('te', 'చందక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chandaka, Visakhapatnam', 'Chandaka చందక XNTK, C532', ST_SetSRID(ST_MakePoint(83.3626889, 17.9220887), 4326), 40);
    END IF;
    -- Insert Venkatapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkatapuram', ST_SetSRID(ST_MakePoint(83.3583001, 17.9221307), 4326), '{"V523, FNKTPRM"}', jsonb_build_object('te', 'వెంకటాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkatapuram, Visakhapatnam', 'Venkatapuram వెంకటాపురం V523, FNKTPRM', ST_SetSRID(ST_MakePoint(83.3583001, 17.9221307), 4326), 40);
    END IF;
    -- Insert Podugupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Podugupalem', ST_SetSRID(ST_MakePoint(83.3690453, 17.9221297), 4326), '{"PTKPLM, P321"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Podugupalem, Visakhapatnam', 'Podugupalem  PTKPLM, P321', ST_SetSRID(ST_MakePoint(83.3690453, 17.9221297), 4326), 40);
    END IF;
    -- Insert Pedda Malapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Malapalli', ST_SetSRID(ST_MakePoint(83.33882, 17.9028487), 4326), '{"P354, PT MLPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Malapalli, Visakhapatnam', 'Pedda Malapalli  P354, PT MLPL', ST_SetSRID(ST_MakePoint(83.33882, 17.9028487), 4326), 40);
    END IF;
    -- Insert Pandalapaka (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pandalapaka', ST_SetSRID(ST_MakePoint(83.3415495, 17.9076227), 4326), '{"PNTLPK, P534"}', jsonb_build_object('te', 'పందలపాక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pandalapaka, Visakhapatnam', 'Pandalapaka పందలపాక PNTLPK, P534', ST_SetSRID(ST_MakePoint(83.3415495, 17.9076227), 4326), 40);
    END IF;
    -- Insert Gollapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapalem', ST_SetSRID(ST_MakePoint(83.3506401, 17.9112807), 4326), '{"KLPLM, G414"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapalem, Visakhapatnam', 'Gollapalem  KLPLM, G414', ST_SetSRID(ST_MakePoint(83.3506401, 17.9112807), 4326), 40);
    END IF;
    -- Insert Sitammapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sitammapeta', ST_SetSRID(ST_MakePoint(83.347778, 17.9070881), 4326), '{"STMPT, S351"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sitammapeta, Visakhapatnam', 'Sitammapeta  STMPT, S351', ST_SetSRID(ST_MakePoint(83.347778, 17.9070881), 4326), 40);
    END IF;
    -- Insert Yatapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yatapeta', ST_SetSRID(ST_MakePoint(83.3344843, 17.9091643), 4326), '{"Y313, YTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yatapeta, Visakhapatnam', 'Yatapeta  Y313, YTPT', ST_SetSRID(ST_MakePoint(83.3344843, 17.9091643), 4326), 40);
    END IF;
    -- Insert Nelapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nelapeta', ST_SetSRID(ST_MakePoint(83.3613881, 17.8994006), 4326), '{"N413, NLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nelapeta, Visakhapatnam', 'Nelapeta  N413, NLPT', ST_SetSRID(ST_MakePoint(83.3613881, 17.8994006), 4326), 40);
    END IF;
    -- Insert Patavalasa Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Patavalasa Agraharam', ST_SetSRID(ST_MakePoint(83.3541936, 17.9003496), 4326), '{"P314, PTFLS AKRHRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Patavalasa Agraharam, Visakhapatnam', 'Patavalasa Agraharam  P314, PTFLS AKRHRM', ST_SetSRID(ST_MakePoint(83.3541936, 17.9003496), 4326), 40);
    END IF;
    -- Insert Narayanarajupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narayanarajupeta', ST_SetSRID(ST_MakePoint(83.3972285, 17.9716448), 4326), '{"N656, NRYNRJPT"}', jsonb_build_object('te', 'నారాయణరాజుపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narayanarajupeta, Visakhapatnam', 'Narayanarajupeta నారాయణరాజుపేట N656, NRYNRJPT', ST_SetSRID(ST_MakePoint(83.3972285, 17.9716448), 4326), 40);
    END IF;
    -- Insert Savaravilli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Savaravilli', ST_SetSRID(ST_MakePoint(83.39232, 17.9703589), 4326), '{"S161, SFRFL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Savaravilli, Visakhapatnam', 'Savaravilli  S161, SFRFL', ST_SetSRID(ST_MakePoint(83.39232, 17.9703589), 4326), 10);
    END IF;
    -- Insert Pitapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pitapuram', ST_SetSRID(ST_MakePoint(83.4701853, 17.9600108), 4326), '{"P316, PTPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pitapuram, Visakhapatnam', 'Pitapuram  P316, PTPRM', ST_SetSRID(ST_MakePoint(83.4701853, 17.9600108), 4326), 40);
    END IF;
    -- Insert Amanam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amanam', ST_SetSRID(ST_MakePoint(83.4569762, 17.958669), 4326), '{"A555, AMNM"}', jsonb_build_object('te', 'అమనం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amanam, Visakhapatnam', 'Amanam అమనం A555, AMNM', ST_SetSRID(ST_MakePoint(83.4569762, 17.958669), 4326), 40);
    END IF;
    -- Insert Jirupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jirupeta', ST_SetSRID(ST_MakePoint(83.4655843, 17.9628538), 4326), '{"J613, JRPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jirupeta, Visakhapatnam', 'Jirupeta  J613, JRPT', ST_SetSRID(ST_MakePoint(83.4655843, 17.9628538), 4326), 40);
    END IF;
    -- Insert Narasayyapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narasayyapeta', ST_SetSRID(ST_MakePoint(83.464263, 17.961541), 4326), '{"N621, NRSYPT"}', jsonb_build_object('te', 'నరసయ్యపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narasayyapeta, Visakhapatnam', 'Narasayyapeta నరసయ్యపేట N621, NRSYPT', ST_SetSRID(ST_MakePoint(83.464263, 17.961541), 4326), 40);
    END IF;
    -- Insert Komatisatram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Komatisatram', ST_SetSRID(ST_MakePoint(83.4190992, 17.9603824), 4326), '{"K532, KMTSTRM"}', jsonb_build_object('te', 'కొమటిసత్రం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Komatisatram, Visakhapatnam', 'Komatisatram కొమటిసత్రం K532, KMTSTRM', ST_SetSRID(ST_MakePoint(83.4190992, 17.9603824), 4326), 40);
    END IF;
    -- Insert Madavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madavalasa', ST_SetSRID(ST_MakePoint(83.4187083, 17.9686945), 4326), '{"M314, MTFLS"}', jsonb_build_object('te', 'మొదవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madavalasa, Visakhapatnam', 'Madavalasa మొదవలస M314, MTFLS', ST_SetSRID(ST_MakePoint(83.4187083, 17.9686945), 4326), 40);
    END IF;
    -- Insert Gordidevapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gordidevapalem', ST_SetSRID(ST_MakePoint(83.4170114, 17.963346), 4326), '{"G633, KRTTFPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gordidevapalem, Visakhapatnam', 'Gordidevapalem  G633, KRTTFPLM', ST_SetSRID(ST_MakePoint(83.4170114, 17.963346), 4326), 40);
    END IF;
    -- Insert Cerukupalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cerukupalli', ST_SetSRID(ST_MakePoint(83.4286882, 17.9514658), 4326), '{"C621, SRKPL"}', jsonb_build_object('te', 'చెరకుపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cerukupalli, Visakhapatnam', 'Cerukupalli చెరకుపల్లి C621, SRKPL', ST_SetSRID(ST_MakePoint(83.4286882, 17.9514658), 4326), 40);
    END IF;
    -- Insert Rajapulova (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajapulova', ST_SetSRID(ST_MakePoint(83.4216622, 17.9563869), 4326), '{"R214, RJPLF"}', jsonb_build_object('te', 'రాజాపులోవ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajapulova, Visakhapatnam', 'Rajapulova రాజాపులోవ R214, RJPLF', ST_SetSRID(ST_MakePoint(83.4216622, 17.9563869), 4326), 40);
    END IF;
    -- Insert Karaganipalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karaganipalle', ST_SetSRID(ST_MakePoint(83.4002306, 17.9670263), 4326), '{"KRKNPL, K625"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karaganipalle, Visakhapatnam', 'Karaganipalle  KRKNPL, K625', ST_SetSRID(ST_MakePoint(83.4002306, 17.9670263), 4326), 40);
    END IF;
    -- Insert Singanabanda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Singanabanda', ST_SetSRID(ST_MakePoint(83.4024123, 17.9636986), 4326), '{"SNKNBNT, S525"}', jsonb_build_object('te', 'సింగన్నబండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Singanabanda, Visakhapatnam', 'Singanabanda సింగన్నబండ SNKNBNT, S525', ST_SetSRID(ST_MakePoint(83.4024123, 17.9636986), 4326), 40);
    END IF;
    -- Insert Lakshmipuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lakshmipuram', ST_SetSRID(ST_MakePoint(83.3987519, 17.9609253), 4326), '{"L251, LKXMPRM"}', jsonb_build_object('te', 'లక్ష్మి పురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lakshmipuram, Visakhapatnam', 'Lakshmipuram లక్ష్మి పురం L251, LKXMPRM', ST_SetSRID(ST_MakePoint(83.3987519, 17.9609253), 4326), 40);
    END IF;
    -- Insert Maddipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maddipeta', ST_SetSRID(ST_MakePoint(83.4023225, 17.9531778), 4326), '{"M313, MTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maddipeta, Visakhapatnam', 'Maddipeta  M313, MTPT', ST_SetSRID(ST_MakePoint(83.4023225, 17.9531778), 4326), 40);
    END IF;
    -- Insert Munivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Munivanipalem', ST_SetSRID(ST_MakePoint(83.3751148, 17.9482474), 4326), '{"MNFNPLM, M515"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Munivanipalem, Visakhapatnam', 'Munivanipalem  MNFNPLM, M515', ST_SetSRID(ST_MakePoint(83.3751148, 17.9482474), 4326), 40);
    END IF;
    -- Insert Chinna Chamayavalasa (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Chamayavalasa', ST_SetSRID(ST_MakePoint(83.3877521, 17.9448434), 4326), '{"C525, XN XMYFLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Chamayavalasa, Visakhapatnam', 'Chinna Chamayavalasa  C525, XN XMYFLS', ST_SetSRID(ST_MakePoint(83.3877521, 17.9448434), 4326), 10);
    END IF;
    -- Insert Tatituru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tatituru', ST_SetSRID(ST_MakePoint(83.4008909, 17.9339758), 4326), '{"TTTR, T336"}', jsonb_build_object('te', 'తాటితూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tatituru, Visakhapatnam', 'Tatituru తాటితూరు TTTR, T336', ST_SetSRID(ST_MakePoint(83.4008909, 17.9339758), 4326), 40);
    END IF;
    -- Insert Ravuthulapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ravuthulapalem', ST_SetSRID(ST_MakePoint(83.3752418, 17.9551022), 4326), '{"RF0LPLM, R134"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ravuthulapalem, Visakhapatnam', 'Ravuthulapalem  RF0LPLM, R134', ST_SetSRID(ST_MakePoint(83.3752418, 17.9551022), 4326), 40);
    END IF;
    -- Insert Karhinanirajupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karhinanirajupeta', ST_SetSRID(ST_MakePoint(83.4111563, 17.9475861), 4326), '{"K655, KRHNNRJPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karhinanirajupeta, Visakhapatnam', 'Karhinanirajupeta  K655, KRHNNRJPT', ST_SetSRID(ST_MakePoint(83.4111563, 17.9475861), 4326), 40);
    END IF;
    -- Insert Majjivalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Majjivalasa', ST_SetSRID(ST_MakePoint(83.3927994, 17.9492962), 4326), '{"MJFLS, M214"}', jsonb_build_object('te', 'మజ్జివలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Majjivalasa, Visakhapatnam', 'Majjivalasa మజ్జివలస MJFLS, M214', ST_SetSRID(ST_MakePoint(83.3927994, 17.9492962), 4326), 40);
    END IF;
    -- Insert Pedda Chamayavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Chamayavalasa', ST_SetSRID(ST_MakePoint(83.3808434, 17.9399706), 4326), '{"P325, PT XMYFLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Chamayavalasa, Visakhapatnam', 'Pedda Chamayavalasa  P325, PT XMYFLS', ST_SetSRID(ST_MakePoint(83.3808434, 17.9399706), 4326), 40);
    END IF;
    -- Insert Musavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Musavanipalem', ST_SetSRID(ST_MakePoint(83.3860316, 17.9216259), 4326), '{"M215, MSFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Musavanipalem, Visakhapatnam', 'Musavanipalem  M215, MSFNPLM', ST_SetSRID(ST_MakePoint(83.3860316, 17.9216259), 4326), 40);
    END IF;
    -- Insert Pallipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pallipeta', ST_SetSRID(ST_MakePoint(83.3871816, 17.915651), 4326), '{"PLPT, P413"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pallipeta, Visakhapatnam', 'Pallipeta  PLPT, P413', ST_SetSRID(ST_MakePoint(83.3871816, 17.915651), 4326), 40);
    END IF;
    -- Insert Pata Cherukupalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Cherukupalli', ST_SetSRID(ST_MakePoint(83.4312955, 17.9423885), 4326), '{"P326, PT XRKPL"}', jsonb_build_object('te', 'పాత చెరుకుపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Cherukupalli, Visakhapatnam', 'Pata Cherukupalli పాత చెరుకుపల్లి P326, PT XRKPL', ST_SetSRID(ST_MakePoint(83.4312955, 17.9423885), 4326), 40);
    END IF;
    -- Insert Gudivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gudivada', ST_SetSRID(ST_MakePoint(83.4338839, 17.9381867), 4326), '{"KTFT, G313"}', jsonb_build_object('te', 'గుడివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gudivada, Visakhapatnam', 'Gudivada గుడివాడ KTFT, G313', ST_SetSRID(ST_MakePoint(83.4338839, 17.9381867), 4326), 40);
    END IF;
    -- Insert Nagarapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nagarapalem', ST_SetSRID(ST_MakePoint(83.4163316, 17.9362558), 4326), '{"N261, NKRPLM"}', jsonb_build_object('te', 'నగరపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nagarapalem, Visakhapatnam', 'Nagarapalem నగరపాలెం N261, NKRPLM', ST_SetSRID(ST_MakePoint(83.4163316, 17.9362558), 4326), 40);
    END IF;
    -- Insert Kondapeta (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondapeta', ST_SetSRID(ST_MakePoint(83.4289468, 17.9349168), 4326), '{"KNTPT, K531"}', jsonb_build_object('te', 'కొండపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondapeta, Visakhapatnam', 'Kondapeta కొండపేట KNTPT, K531', ST_SetSRID(ST_MakePoint(83.4289468, 17.9349168), 4326), 80);
    END IF;
    -- Insert Kottapeta (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottapeta', ST_SetSRID(ST_MakePoint(83.4312276, 17.9314605), 4326), '{"K313, KTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottapeta, Visakhapatnam', 'Kottapeta  K313, KTPT', ST_SetSRID(ST_MakePoint(83.4312276, 17.9314605), 4326), 60);
    END IF;
    -- Insert Tagarapuvalasa (town)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tagarapuvalasa', ST_SetSRID(ST_MakePoint(83.4256586, 17.9301255), 4326), '{"T261, TKRPFLS"}', jsonb_build_object('te', 'తగరపువలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tagarapuvalasa, Visakhapatnam', 'Tagarapuvalasa తగరపువలస T261, TKRPFLS', ST_SetSRID(ST_MakePoint(83.4256586, 17.9301255), 4326), 10);
    END IF;
    -- Insert Santapeta (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Santapeta', ST_SetSRID(ST_MakePoint(83.4271525, 17.92801), 4326), '{"S531, SNTPT"}', jsonb_build_object('te', 'సంతపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Santapeta, Visakhapatnam', 'Santapeta సంతపేట S531, SNTPT', ST_SetSRID(ST_MakePoint(83.4271525, 17.92801), 4326), 60);
    END IF;
    -- Insert Risipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Risipeta', ST_SetSRID(ST_MakePoint(83.4432217, 17.9303713), 4326), '{"RSPT, R213"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Risipeta, Visakhapatnam', 'Risipeta  RSPT, R213', ST_SetSRID(ST_MakePoint(83.4432217, 17.9303713), 4326), 40);
    END IF;
    -- Insert Chakalipeta (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chakalipeta', ST_SetSRID(ST_MakePoint(83.4304405, 17.9291428), 4326), '{"C241, XKLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chakalipeta, Visakhapatnam', 'Chakalipeta  C241, XKLPT', ST_SetSRID(ST_MakePoint(83.4304405, 17.9291428), 4326), 60);
    END IF;
    -- Insert Nammivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nammivanipalem', ST_SetSRID(ST_MakePoint(83.4260378, 17.9166409), 4326), '{"NMFNPLM, N515"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nammivanipalem, Visakhapatnam', 'Nammivanipalem  NMFNPLM, N515', ST_SetSRID(ST_MakePoint(83.4260378, 17.9166409), 4326), 40);
    END IF;
    -- Insert Jirupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jirupeta', ST_SetSRID(ST_MakePoint(83.433887, 17.9217378), 4326), '{"J613, JRPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jirupeta, Visakhapatnam', 'Jirupeta  J613, JRPT', ST_SetSRID(ST_MakePoint(83.433887, 17.9217378), 4326), 40);
    END IF;
    -- Insert Dekkatipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dekkatipalem', ST_SetSRID(ST_MakePoint(83.4341365, 17.9059712), 4326), '{"D231, TKTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dekkatipalem, Visakhapatnam', 'Dekkatipalem  D231, TKTPLM', ST_SetSRID(ST_MakePoint(83.4341365, 17.9059712), 4326), 40);
    END IF;
    -- Insert Rayapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rayapalem', ST_SetSRID(ST_MakePoint(83.4349356, 17.9118189), 4326), '{"R145, RYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rayapalem, Visakhapatnam', 'Rayapalem  R145, RYPLM', ST_SetSRID(ST_MakePoint(83.4349356, 17.9118189), 4326), 40);
    END IF;
    -- Insert Rajalingapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajalingapeta', ST_SetSRID(ST_MakePoint(83.4350674, 17.907131), 4326), '{"RJLNKPT, R245"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajalingapeta, Visakhapatnam', 'Rajalingapeta  RJLNKPT, R245', ST_SetSRID(ST_MakePoint(83.4350674, 17.907131), 4326), 40);
    END IF;
    -- Insert Maragadapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maragadapalem', ST_SetSRID(ST_MakePoint(83.4348457, 17.9151336), 4326), '{"MRKTPLM, M623"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maragadapalem, Visakhapatnam', 'Maragadapalem  MRKTPLM, M623', ST_SetSRID(ST_MakePoint(83.4348457, 17.9151336), 4326), 40);
    END IF;
    -- Insert Mamidipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mamidipalem', ST_SetSRID(ST_MakePoint(83.4281288, 17.9052122), 4326), '{"MMTPLM, M531"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mamidipalem, Visakhapatnam', 'Mamidipalem  MMTPLM, M531', ST_SetSRID(ST_MakePoint(83.4281288, 17.9052122), 4326), 40);
    END IF;
    -- Insert Sillapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sillapeta', ST_SetSRID(ST_MakePoint(83.4350477, 17.9190157), 4326), '{"SLPT, S413"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sillapeta, Visakhapatnam', 'Sillapeta  SLPT, S413', ST_SetSRID(ST_MakePoint(83.4350477, 17.9190157), 4326), 40);
    END IF;
    -- Insert Kummaripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kummaripalem', ST_SetSRID(ST_MakePoint(83.439586, 17.9053396), 4326), '{"K561, KMRPLM"}', jsonb_build_object('te', 'కుమ్మరిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kummaripalem, Visakhapatnam', 'Kummaripalem కుమ్మరిపాలెం K561, KMRPLM', ST_SetSRID(ST_MakePoint(83.439586, 17.9053396), 4326), 40);
    END IF;
    -- Insert Gollapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapalem', ST_SetSRID(ST_MakePoint(83.4082586, 17.9046369), 4326), '{"KLPLM, G414"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapalem, Visakhapatnam', 'Gollapalem  KLPLM, G414', ST_SetSRID(ST_MakePoint(83.4082586, 17.9046369), 4326), 40);
    END IF;
    -- Insert Chettilla Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chettilla Agraharam', ST_SetSRID(ST_MakePoint(83.4021249, 17.9132803), 4326), '{"C342, XTL AKRHRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chettilla Agraharam, Visakhapatnam', 'Chettilla Agraharam  C342, XTL AKRHRM', ST_SetSRID(ST_MakePoint(83.4021249, 17.9132803), 4326), 40);
    END IF;
    -- Insert Tallavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tallavalasa', ST_SetSRID(ST_MakePoint(83.411374, 17.9110237), 4326), '{"T414, TLFLS"}', jsonb_build_object('te', 'తాళ్లవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tallavalasa, Visakhapatnam', 'Tallavalasa తాళ్లవలస T414, TLFLS', ST_SetSRID(ST_MakePoint(83.411374, 17.9110237), 4326), 40);
    END IF;
    -- Insert Yatapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yatapeta', ST_SetSRID(ST_MakePoint(83.4137288, 17.9061947), 4326), '{"Y313, YTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yatapeta, Visakhapatnam', 'Yatapeta  Y313, YTPT', ST_SetSRID(ST_MakePoint(83.4137288, 17.9061947), 4326), 40);
    END IF;
    -- Insert Edidasaripalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Edidasaripalem', ST_SetSRID(ST_MakePoint(83.4214206, 17.9147611), 4326), '{"ETTSRPLM, E332"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Edidasaripalem, Visakhapatnam', 'Edidasaripalem  ETTSRPLM, E332', ST_SetSRID(ST_MakePoint(83.4214206, 17.9147611), 4326), 10);
    END IF;
    -- Insert Valandupeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Valandupeta', ST_SetSRID(ST_MakePoint(83.4134315, 17.9172505), 4326), '{"V453, FLNTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Valandupeta, Visakhapatnam', 'Valandupeta  V453, FLNTPT', ST_SetSRID(ST_MakePoint(83.4134315, 17.9172505), 4326), 40);
    END IF;
    -- Insert Gollapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapalem', ST_SetSRID(ST_MakePoint(83.4156747, 17.9160177), 4326), '{"KLPLM, G414"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapalem, Visakhapatnam', 'Gollapalem  KLPLM, G414', ST_SetSRID(ST_MakePoint(83.4156747, 17.9160177), 4326), 10);
    END IF;
    -- Insert Karadapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karadapeta', ST_SetSRID(ST_MakePoint(83.4183199, 17.9141959), 4326), '{"K631, KRTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karadapeta, Visakhapatnam', 'Karadapeta  K631, KRTPT', ST_SetSRID(ST_MakePoint(83.4183199, 17.9141959), 4326), 10);
    END IF;
    -- Insert Endada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Endada', ST_SetSRID(ST_MakePoint(83.3592195, 17.779634), 4326), '{"E533, ENTT"}', jsonb_build_object('te', 'ఎన్డాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Endada, Visakhapatnam', 'Endada ఎన్డాడ E533, ENTT', ST_SetSRID(ST_MakePoint(83.3592195, 17.779634), 4326), 40);
    END IF;
    -- Insert Musalayyapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Musalayyapalem', ST_SetSRID(ST_MakePoint(83.3605316, 17.7690391), 4326), '{"M241, MSLYPLM"}', jsonb_build_object('te', 'ముసలయ్యపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Musalayyapalem, Visakhapatnam', 'Musalayyapalem ముసలయ్యపాలెం M241, MSLYPLM', ST_SetSRID(ST_MakePoint(83.3605316, 17.7690391), 4326), 60);
    END IF;
    -- Insert Gollapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapalem', ST_SetSRID(ST_MakePoint(83.3671711, 17.7754922), 4326), '{"KLPLM, G414"}', jsonb_build_object('te', 'గొల్లపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapalem, Visakhapatnam', 'Gollapalem గొల్లపాలెం KLPLM, G414', ST_SetSRID(ST_MakePoint(83.3671711, 17.7754922), 4326), 60);
    END IF;
    -- Insert Gudalavanipalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gudalavanipalem', ST_SetSRID(ST_MakePoint(83.3570534, 17.7638001), 4326), '{"KTLFNPLM, G341"}', jsonb_build_object('te', 'గుడలవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gudalavanipalem, Visakhapatnam', 'Gudalavanipalem గుడలవానిపాలెం KTLFNPLM, G341', ST_SetSRID(ST_MakePoint(83.3570534, 17.7638001), 4326), 60);
    END IF;
    -- Insert Baravanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Baravanipalem', ST_SetSRID(ST_MakePoint(83.357537, 17.8460651), 4326), '{"BRFNPLM, B615"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Baravanipalem, Visakhapatnam', 'Baravanipalem  BRFNPLM, B615', ST_SetSRID(ST_MakePoint(83.357537, 17.8460651), 4326), 40);
    END IF;
    -- Insert Marikavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marikavalasa', ST_SetSRID(ST_MakePoint(83.3538605, 17.8392751), 4326), '{"MRKFLS, M621"}', jsonb_build_object('te', 'మారికవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marikavalasa, Visakhapatnam', 'Marikavalasa మారికవలస MRKFLS, M621', ST_SetSRID(ST_MakePoint(83.3538605, 17.8392751), 4326), 40);
    END IF;
    -- Insert Mamidilova (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mamidilova', ST_SetSRID(ST_MakePoint(83.2857236, 17.8523382), 4326), '{"MMTLF, M534"}', jsonb_build_object('te', 'మామిడిలోవ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mamidilova, Visakhapatnam', 'Mamidilova మామిడిలోవ MMTLF, M534', ST_SetSRID(ST_MakePoint(83.2857236, 17.8523382), 4326), 40);
    END IF;
    -- Insert Narayanagajapatirajupuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narayanagajapatirajupuram', ST_SetSRID(ST_MakePoint(83.2681871, 17.8516285), 4326), '{"NRYNKJPTRJPRM, N652"}', jsonb_build_object('te', 'నారాయణ గజపతిరాజుపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narayanagajapatirajupuram, Visakhapatnam', 'Narayanagajapatirajupuram నారాయణ గజపతిరాజుపురం NRYNKJPTRJPRM, N652', ST_SetSRID(ST_MakePoint(83.2681871, 17.8516285), 4326), 40);
    END IF;
    -- Insert Mannipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mannipalem', ST_SetSRID(ST_MakePoint(83.2819464, 17.8532663), 4326), '{"M514, MNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mannipalem, Visakhapatnam', 'Mannipalem  M514, MNPLM', ST_SetSRID(ST_MakePoint(83.2819464, 17.8532663), 4326), 40);
    END IF;
    -- Insert Dibbamidipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dibbamidipalem', ST_SetSRID(ST_MakePoint(83.2972039, 17.852635), 4326), '{"TBMTPLM, D153"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dibbamidipalem, Visakhapatnam', 'Dibbamidipalem  TBMTPLM, D153', ST_SetSRID(ST_MakePoint(83.2972039, 17.852635), 4326), 40);
    END IF;
    -- Insert Gantivanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gantivanipalem', ST_SetSRID(ST_MakePoint(83.286686, 17.8639285), 4326), '{"KNTFNPLM, G531"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gantivanipalem, Visakhapatnam', 'Gantivanipalem  KNTFNPLM, G531', ST_SetSRID(ST_MakePoint(83.286686, 17.8639285), 4326), 10);
    END IF;
    -- Insert Gangasani Agraharam (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gangasani Agraharam', ST_SetSRID(ST_MakePoint(83.2704129, 17.8531472), 4326), '{"KNKSN AKRHRM, G522"}', jsonb_build_object('te', 'గంగసని ఆగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gangasani Agraharam, Visakhapatnam', 'Gangasani Agraharam గంగసని ఆగ్రహారం KNKSN AKRHRM, G522', ST_SetSRID(ST_MakePoint(83.2704129, 17.8531472), 4326), 10);
    END IF;
    -- Insert Juttada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Juttada', ST_SetSRID(ST_MakePoint(83.2326514, 17.8257143), 4326), '{"JTT, J330"}', jsonb_build_object('te', 'జుత్తాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Juttada, Visakhapatnam', 'Juttada జుత్తాడ JTT, J330', ST_SetSRID(ST_MakePoint(83.2326514, 17.8257143), 4326), 40);
    END IF;
    -- Insert Rajayyapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajayyapeta', ST_SetSRID(ST_MakePoint(83.2175733, 17.8345264), 4326), '{"R213, RJYPT"}', jsonb_build_object('te', 'రాజయ్యపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajayyapeta, Visakhapatnam', 'Rajayyapeta రాజయ్యపేట R213, RJYPT', ST_SetSRID(ST_MakePoint(83.2175733, 17.8345264), 4326), 40);
    END IF;
    -- Insert Akkireddipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Akkireddipalem', ST_SetSRID(ST_MakePoint(83.2298779, 17.835524), 4326), '{"A263, AKRTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Akkireddipalem, Visakhapatnam', 'Akkireddipalem  A263, AKRTPLM', ST_SetSRID(ST_MakePoint(83.2298779, 17.835524), 4326), 40);
    END IF;
    -- Insert Saubhagyarayapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Saubhagyarayapuram', ST_SetSRID(ST_MakePoint(83.2500637, 17.8270828), 4326), '{"S126, SBHJYRYPRM"}', jsonb_build_object('te', 'సౌభాగ్య రాయపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Saubhagyarayapuram, Visakhapatnam', 'Saubhagyarayapuram సౌభాగ్య రాయపురం S126, SBHJYRYPRM', ST_SetSRID(ST_MakePoint(83.2500637, 17.8270828), 4326), 40);
    END IF;
    -- Insert Appannapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appannapalem', ST_SetSRID(ST_MakePoint(83.2132711, 17.8372852), 4326), '{"A151, APNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appannapalem, Visakhapatnam', 'Appannapalem  A151, APNPLM', ST_SetSRID(ST_MakePoint(83.2132711, 17.8372852), 4326), 40);
    END IF;
    -- Insert Naravavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Naravavanipalem', ST_SetSRID(ST_MakePoint(83.2211865, 17.8167925), 4326), '{"NRFFNPLM, N611"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Naravavanipalem, Visakhapatnam', 'Naravavanipalem  NRFFNPLM, N611', ST_SetSRID(ST_MakePoint(83.2211865, 17.8167925), 4326), 40);
    END IF;
    -- Insert Boddapallipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boddapallipalem', ST_SetSRID(ST_MakePoint(83.2370608, 17.8340616), 4326), '{"BTPLPLM, B314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boddapallipalem, Visakhapatnam', 'Boddapallipalem  BTPLPLM, B314', ST_SetSRID(ST_MakePoint(83.2370608, 17.8340616), 4326), 40);
    END IF;
    -- Insert Duvvapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Duvvapalem', ST_SetSRID(ST_MakePoint(83.2458596, 17.8187026), 4326), '{"D114, TFPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Duvvapalem, Visakhapatnam', 'Duvvapalem  D114, TFPLM', ST_SetSRID(ST_MakePoint(83.2458596, 17.8187026), 4326), 40);
    END IF;
    -- Insert Pendurti (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pendurti', ST_SetSRID(ST_MakePoint(83.2070556, 17.810935), 4326), '{"PNTRT, P536"}', jsonb_build_object('te', 'పెందుర్తి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pendurti, Visakhapatnam', 'Pendurti పెందుర్తి PNTRT, P536', ST_SetSRID(ST_MakePoint(83.2070556, 17.810935), 4326), 80);
    END IF;
    -- Insert Akkireddipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Akkireddipalem', ST_SetSRID(ST_MakePoint(83.2294383, 17.8331235), 4326), '{"A263, AKRTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Akkireddipalem, Visakhapatnam', 'Akkireddipalem  A263, AKRTPLM', ST_SetSRID(ST_MakePoint(83.2294383, 17.8331235), 4326), 40);
    END IF;
    -- Insert Mindipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mindipalem', ST_SetSRID(ST_MakePoint(83.3095582, 17.8785466), 4326), '{"MNTPLM, M531"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mindipalem, Visakhapatnam', 'Mindipalem  MNTPLM, M531', ST_SetSRID(ST_MakePoint(83.3095582, 17.8785466), 4326), 40);
    END IF;
    -- Insert Sontyam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sontyam', ST_SetSRID(ST_MakePoint(83.2946041, 17.8660372), 4326), '{"S535, SNTYM"}', jsonb_build_object('te', 'శొంఠ్యాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sontyam, Visakhapatnam', 'Sontyam శొంఠ్యాం S535, SNTYM', ST_SetSRID(ST_MakePoint(83.2946041, 17.8660372), 4326), 40);
    END IF;
    -- Insert Gudilova (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gudilova', ST_SetSRID(ST_MakePoint(83.3291875, 17.8824611), 4326), '{"G341, KTLF"}', jsonb_build_object('te', 'గుడిలోవ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gudilova, Visakhapatnam', 'Gudilova గుడిలోవ G341, KTLF', ST_SetSRID(ST_MakePoint(83.3291875, 17.8824611), 4326), 40);
    END IF;
    -- Insert Gummadivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gummadivanipalem', ST_SetSRID(ST_MakePoint(83.2980438, 17.8744547), 4326), '{"KMTFNPLM, G531"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gummadivanipalem, Visakhapatnam', 'Gummadivanipalem  KMTFNPLM, G531', ST_SetSRID(ST_MakePoint(83.2980438, 17.8744547), 4326), 40);
    END IF;
    -- Insert Nagarapupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nagarapupalem', ST_SetSRID(ST_MakePoint(83.3391499, 17.8979052), 4326), '{"NKRPPLM, N261"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nagarapupalem, Visakhapatnam', 'Nagarapupalem  NKRPPLM, N261', ST_SetSRID(ST_MakePoint(83.3391499, 17.8979052), 4326), 40);
    END IF;
    -- Insert Gollapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapalem', ST_SetSRID(ST_MakePoint(83.3340971, 17.8908927), 4326), '{"KLPLM, G414"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapalem, Visakhapatnam', 'Gollapalem  KLPLM, G414', ST_SetSRID(ST_MakePoint(83.3340971, 17.8908927), 4326), 40);
    END IF;
    -- Insert Pata Palavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Palavalasa', ST_SetSRID(ST_MakePoint(83.3520852, 17.8976194), 4326), '{"PT PLFLS, P314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Palavalasa, Visakhapatnam', 'Pata Palavalasa  PT PLFLS, P314', ST_SetSRID(ST_MakePoint(83.3520852, 17.8976194), 4326), 40);
    END IF;
    -- Insert Dukkavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dukkavanipalem', ST_SetSRID(ST_MakePoint(83.3517569, 17.8853355), 4326), '{"TKFNPLM, D215"}', jsonb_build_object('te', 'దుక్కవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dukkavanipalem, Visakhapatnam', 'Dukkavanipalem దుక్కవానిపాలెం TKFNPLM, D215', ST_SetSRID(ST_MakePoint(83.3517569, 17.8853355), 4326), 40);
    END IF;
    -- Insert Itlavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Itlavanipalem', ST_SetSRID(ST_MakePoint(83.3620488, 17.8911823), 4326), '{"ITLFNPLM, I341"}', jsonb_build_object('te', 'ఇట్లవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Itlavanipalem, Visakhapatnam', 'Itlavanipalem ఇట్లవానిపాలెం ITLFNPLM, I341', ST_SetSRID(ST_MakePoint(83.3620488, 17.8911823), 4326), 40);
    END IF;
    -- Insert Mettamidipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mettamidipalem', ST_SetSRID(ST_MakePoint(83.353596, 17.8918434), 4326), '{"M353, MTMTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mettamidipalem, Visakhapatnam', 'Mettamidipalem  M353, MTMTPLM', ST_SetSRID(ST_MakePoint(83.353596, 17.8918434), 4326), 40);
    END IF;
    -- Insert Boddapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boddapalem', ST_SetSRID(ST_MakePoint(83.3856596, 17.8836241), 4326), '{"B314, BTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boddapalem, Visakhapatnam', 'Boddapalem  B314, BTPLM', ST_SetSRID(ST_MakePoint(83.3856596, 17.8836241), 4326), 40);
    END IF;
    -- Insert Nalagalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nalagalapalem', ST_SetSRID(ST_MakePoint(83.3700317, 17.8939146), 4326), '{"N424, NLKLPLM"}', jsonb_build_object('te', 'నలగలపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nalagalapalem, Visakhapatnam', 'Nalagalapalem నలగలపాలెం N424, NLKLPLM', ST_SetSRID(ST_MakePoint(83.3700317, 17.8939146), 4326), 40);
    END IF;
    -- Insert Vellanki (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vellanki', ST_SetSRID(ST_MakePoint(83.3883966, 17.8943602), 4326), '{"V452, FLNK"}', jsonb_build_object('te', 'వెల్లంకి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vellanki, Visakhapatnam', 'Vellanki వెల్లంకి V452, FLNK', ST_SetSRID(ST_MakePoint(83.3883966, 17.8943602), 4326), 40);
    END IF;
    -- Insert Jayanthivari Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jayanthivari Agraharam', ST_SetSRID(ST_MakePoint(83.4055339, 17.8831959), 4326), '{"J531, JYN0FR AKRHRM"}', jsonb_build_object('te', 'జయంతివాని అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jayanthivari Agraharam, Visakhapatnam', 'Jayanthivari Agraharam జయంతివాని అగ్రహారం J531, JYN0FR AKRHRM', ST_SetSRID(ST_MakePoint(83.4055339, 17.8831959), 4326), 40);
    END IF;
    -- Insert Garipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Garipeta', ST_SetSRID(ST_MakePoint(83.3943701, 17.8875381), 4326), '{"KRPT, G613"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Garipeta, Visakhapatnam', 'Garipeta  KRPT, G613', ST_SetSRID(ST_MakePoint(83.3943701, 17.8875381), 4326), 40);
    END IF;
    -- Insert Rellipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rellipeta', ST_SetSRID(ST_MakePoint(83.3999901, 17.8903851), 4326), '{"RLPT, R413"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rellipeta, Visakhapatnam', 'Rellipeta  RLPT, R413', ST_SetSRID(ST_MakePoint(83.3999901, 17.8903851), 4326), 40);
    END IF;
    -- Insert Kotta Paradesipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Paradesipalem', ST_SetSRID(ST_MakePoint(83.3647685, 17.8576051), 4326), '{"K316, KT PRTSPLM"}', jsonb_build_object('te', 'కొత్త పరదేశిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Paradesipalem, Visakhapatnam', 'Kotta Paradesipalem కొత్త పరదేశిపాలెం K316, KT PRTSPLM', ST_SetSRID(ST_MakePoint(83.3647685, 17.8576051), 4326), 40);
    END IF;
    -- Insert Kottavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottavalasa', ST_SetSRID(ST_MakePoint(83.3929145, 17.8813243), 4326), '{"KTFLS, K314"}', jsonb_build_object('te', 'కొత్తవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottavalasa, Visakhapatnam', 'Kottavalasa కొత్తవలస KTFLS, K314', ST_SetSRID(ST_MakePoint(83.3929145, 17.8813243), 4326), 40);
    END IF;
    -- Insert Yatapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yatapeta', ST_SetSRID(ST_MakePoint(83.3836006, 17.8738136), 4326), '{"Y313, YTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yatapeta, Visakhapatnam', 'Yatapeta  Y313, YTPT', ST_SetSRID(ST_MakePoint(83.3836006, 17.8738136), 4326), 40);
    END IF;
    -- Insert Ramayogi Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramayogi Agraharam', ST_SetSRID(ST_MakePoint(83.4039362, 17.8673041), 4326), '{"RMYJ AKRHRM, R522"}', jsonb_build_object('te', 'రామయోగి అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramayogi Agraharam, Visakhapatnam', 'Ramayogi Agraharam రామయోగి అగ్రహారం RMYJ AKRHRM, R522', ST_SetSRID(ST_MakePoint(83.4039362, 17.8673041), 4326), 40);
    END IF;
    -- Insert Nerellavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nerellavalasa', ST_SetSRID(ST_MakePoint(83.4072835, 17.8626104), 4326), '{"NRLFLS, N641"}', jsonb_build_object('te', 'నేరెళ్ళవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nerellavalasa, Visakhapatnam', 'Nerellavalasa నేరెళ్ళవలస NRLFLS, N641', ST_SetSRID(ST_MakePoint(83.4072835, 17.8626104), 4326), 40);
    END IF;
    -- Insert Gambhiram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gambhiram', ST_SetSRID(ST_MakePoint(83.3708896, 17.8795365), 4326), '{"KMBHRM, G516"}', jsonb_build_object('te', 'గంభీరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gambhiram, Visakhapatnam', 'Gambhiram గంభీరం KMBHRM, G516', ST_SetSRID(ST_MakePoint(83.3708896, 17.8795365), 4326), 40);
    END IF;
    -- Insert Kallivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kallivanipalem', ST_SetSRID(ST_MakePoint(83.3822767, 17.8716366), 4326), '{"KLFNPLM, K415"}', jsonb_build_object('te', 'కల్లివానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kallivanipalem, Visakhapatnam', 'Kallivanipalem కల్లివానిపాలెం KLFNPLM, K415', ST_SetSRID(ST_MakePoint(83.3822767, 17.8716366), 4326), 40);
    END IF;
    -- Insert Nadigattu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nadigattu', ST_SetSRID(ST_MakePoint(83.3964243, 17.8673205), 4326), '{"NTKT, N323"}', jsonb_build_object('te', 'నిడిగట్టు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nadigattu, Visakhapatnam', 'Nadigattu నిడిగట్టు NTKT, N323', ST_SetSRID(ST_MakePoint(83.3964243, 17.8673205), 4326), 40);
    END IF;
    -- Insert Kapula Uppada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kapula Uppada', ST_SetSRID(ST_MakePoint(83.3855601, 17.8536175), 4326), '{"K141, KPL UPT"}', jsonb_build_object('te', 'కాపులుప్పడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kapula Uppada, Visakhapatnam', 'Kapula Uppada కాపులుప్పడ K141, KPL UPT', ST_SetSRID(ST_MakePoint(83.3855601, 17.8536175), 4326), 40);
    END IF;
    -- Insert Pata Paradesipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Paradesipalem', ST_SetSRID(ST_MakePoint(83.3714966, 17.8538603), 4326), '{"P316, PT PRTSPLM"}', jsonb_build_object('te', 'పాత పరదేశిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Paradesipalem, Visakhapatnam', 'Pata Paradesipalem పాత పరదేశిపాలెం P316, PT PRTSPLM', ST_SetSRID(ST_MakePoint(83.3714966, 17.8538603), 4326), 40);
    END IF;
    -- Insert Komatipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Komatipalem', ST_SetSRID(ST_MakePoint(83.385104, 17.8717897), 4326), '{"K531, KMTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Komatipalem, Visakhapatnam', 'Komatipalem  K531, KMTPLM', ST_SetSRID(ST_MakePoint(83.385104, 17.8717897), 4326), 10);
    END IF;
    -- Insert Pata Kallivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Kallivanipalem', ST_SetSRID(ST_MakePoint(83.3851404, 17.8653782), 4326), '{"PT KLFNPLM, P324"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Kallivanipalem, Visakhapatnam', 'Pata Kallivanipalem  PT KLFNPLM, P324', ST_SetSRID(ST_MakePoint(83.3851404, 17.8653782), 4326), 40);
    END IF;
    -- Insert Boyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boyapalem', ST_SetSRID(ST_MakePoint(83.3628471, 17.8703313), 4326), '{"BYPLM, B145"}', jsonb_build_object('te', 'బోయపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boyapalem, Visakhapatnam', 'Boyapalem బోయపాలెం BYPLM, B145', ST_SetSRID(ST_MakePoint(83.3628471, 17.8703313), 4326), 40);
    END IF;
    -- Insert Pedda Uppada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Uppada', ST_SetSRID(ST_MakePoint(83.4100066, 17.8537424), 4326), '{"P313, PT UPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Uppada, Visakhapatnam', 'Pedda Uppada  P313, PT UPT', ST_SetSRID(ST_MakePoint(83.4100066, 17.8537424), 4326), 40);
    END IF;
    -- Insert Chinna Uppada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Uppada', ST_SetSRID(ST_MakePoint(83.4100706, 17.849409), 4326), '{"XN UPT, C513"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Uppada, Visakhapatnam', 'Chinna Uppada  XN UPT, C513', ST_SetSRID(ST_MakePoint(83.4100706, 17.849409), 4326), 40);
    END IF;
    -- Insert Somannapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Somannapalem', ST_SetSRID(ST_MakePoint(83.3977266, 17.843812), 4326), '{"S551, SMNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Somannapalem, Visakhapatnam', 'Somannapalem  S551, SMNPLM', ST_SetSRID(ST_MakePoint(83.3977266, 17.843812), 4326), 10);
    END IF;
    -- Insert Gollapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapalem', ST_SetSRID(ST_MakePoint(83.3970259, 17.8418924), 4326), '{"KLPLM, G414"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapalem, Visakhapatnam', 'Gollapalem  KLPLM, G414', ST_SetSRID(ST_MakePoint(83.3970259, 17.8418924), 4326), 40);
    END IF;
    -- Insert Reddilapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Reddilapalem', ST_SetSRID(ST_MakePoint(83.395835, 17.8430208), 4326), '{"RTLPLM, R341"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Reddilapalem, Visakhapatnam', 'Reddilapalem  RTLPLM, R341', ST_SetSRID(ST_MakePoint(83.395835, 17.8430208), 4326), 40);
    END IF;
    -- Insert Dabbanda (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dabbanda', ST_SetSRID(ST_MakePoint(83.2888903, 17.815681), 4326), '{"TBNT, D153"}', jsonb_build_object('te', 'దబ్బండ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dabbanda, Visakhapatnam', 'Dabbanda దబ్బండ TBNT, D153', ST_SetSRID(ST_MakePoint(83.2888903, 17.815681), 4326), 40);
    END IF;
    -- Insert Malapalli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Malapalli', ST_SetSRID(ST_MakePoint(83.2813848, 17.8226228), 4326), '{"M414, MLPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Malapalli, Visakhapatnam', 'Malapalli  M414, MLPL', ST_SetSRID(ST_MakePoint(83.2813848, 17.8226228), 4326), 10);
    END IF;
    -- Insert Gollalapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollalapalem', ST_SetSRID(ST_MakePoint(83.2778564, 17.8168891), 4326), '{"KLLPLM, G441"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollalapalem, Visakhapatnam', 'Gollalapalem  KLLPLM, G441', ST_SetSRID(ST_MakePoint(83.2778564, 17.8168891), 4326), 10);
    END IF;
    -- Insert Appikondapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Appikondapalem', ST_SetSRID(ST_MakePoint(83.2765586, 17.8233559), 4326), '{"A125, APKNTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Appikondapalem, Visakhapatnam', 'Appikondapalem  A125, APKNTPLM', ST_SetSRID(ST_MakePoint(83.2765586, 17.8233559), 4326), 10);
    END IF;
    -- Insert Gandireddipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gandireddipalem', ST_SetSRID(ST_MakePoint(83.2744219, 17.8181299), 4326), '{"G536, KNTRTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gandireddipalem, Visakhapatnam', 'Gandireddipalem  G536, KNTRTPLM', ST_SetSRID(ST_MakePoint(83.2744219, 17.8181299), 4326), 40);
    END IF;
    -- Insert Sambhuvanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sambhuvanipalem', ST_SetSRID(ST_MakePoint(83.3113538, 17.7988159), 4326), '{"S511, SMBHFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sambhuvanipalem, Visakhapatnam', 'Sambhuvanipalem  S511, SMBHFNPLM', ST_SetSRID(ST_MakePoint(83.3113538, 17.7988159), 4326), 40);
    END IF;
    -- Insert Lachchakondupalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lachchakondupalem', ST_SetSRID(ST_MakePoint(83.3414093, 17.8048503), 4326), '{"LXXKNTPLM, L225"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lachchakondupalem, Visakhapatnam', 'Lachchakondupalem  LXXKNTPLM, L225', ST_SetSRID(ST_MakePoint(83.3414093, 17.8048503), 4326), 60);
    END IF;
    -- Insert Kottapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottapalem', ST_SetSRID(ST_MakePoint(83.3763381, 17.8219034), 4326), '{"KTPLM, K314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottapalem, Visakhapatnam', 'Kottapalem  KTPLM, K314', ST_SetSRID(ST_MakePoint(83.3763381, 17.8219034), 4326), 60);
    END IF;
    -- Insert Revallapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Revallapalem', ST_SetSRID(ST_MakePoint(83.3411435, 17.819421), 4326), '{"RFLPLM, R141"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Revallapalem, Visakhapatnam', 'Revallapalem  RFLPLM, R141', ST_SetSRID(ST_MakePoint(83.3411435, 17.819421), 4326), 60);
    END IF;
    -- Insert Chandrammapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chandrammapalem', ST_SetSRID(ST_MakePoint(83.3581087, 17.8129856), 4326), '{"C536, XNTRMPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chandrammapalem, Visakhapatnam', 'Chandrammapalem  C536, XNTRMPLM', ST_SetSRID(ST_MakePoint(83.3581087, 17.8129856), 4326), 60);
    END IF;
    -- Insert Devumetta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Devumetta', ST_SetSRID(ST_MakePoint(83.3425321, 17.8358623), 4326), '{"TFMT, D153"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Devumetta, Visakhapatnam', 'Devumetta  TFMT, D153', ST_SetSRID(ST_MakePoint(83.3425321, 17.8358623), 4326), 40);
    END IF;
    -- Insert Bakkanapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bakkanapalem', ST_SetSRID(ST_MakePoint(83.3412942, 17.8151655), 4326), '{"B251, BKNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bakkanapalem, Visakhapatnam', 'Bakkanapalem  B251, BKNPLM', ST_SetSRID(ST_MakePoint(83.3412942, 17.8151655), 4326), 60);
    END IF;
    -- Insert Kotturu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotturu', ST_SetSRID(ST_MakePoint(83.3440389, 17.8159373), 4326), '{"K360, KTR"}', jsonb_build_object('te', 'కొత్తూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotturu, Visakhapatnam', 'Kotturu కొత్తూరు K360, KTR', ST_SetSRID(ST_MakePoint(83.3440389, 17.8159373), 4326), 40);
    END IF;
    -- Insert Nagarapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nagarapalem', ST_SetSRID(ST_MakePoint(83.3586768, 17.8175772), 4326), '{"N261, NKRPLM"}', jsonb_build_object('te', 'నగరపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nagarapalem, Visakhapatnam', 'Nagarapalem నగరపాలెం N261, NKRPLM', ST_SetSRID(ST_MakePoint(83.3586768, 17.8175772), 4326), 60);
    END IF;
    -- Insert Kommadi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kommadi', ST_SetSRID(ST_MakePoint(83.3357655, 17.8306475), 4326), '{"K530, KMT"}', jsonb_build_object('te', 'కొమ్మాది'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kommadi, Visakhapatnam', 'Kommadi కొమ్మాది K530, KMT', ST_SetSRID(ST_MakePoint(83.3357655, 17.8306475), 4326), 40);
    END IF;
    -- Insert Pontinamallayyapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pontinamallayyapalem', ST_SetSRID(ST_MakePoint(83.3545598, 17.8017691), 4326), '{"PNTNMLYPLM, P535"}', jsonb_build_object('te', 'పోతినమల్లయ్యపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pontinamallayyapalem, Visakhapatnam', 'Pontinamallayyapalem పోతినమల్లయ్యపాలెం PNTNMLYPLM, P535', ST_SetSRID(ST_MakePoint(83.3545598, 17.8017691), 4326), 40);
    END IF;
    -- Insert Madhuravada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madhuravada', ST_SetSRID(ST_MakePoint(83.347329, 17.8177602), 4326), '{"M361, MTHRFT"}', jsonb_build_object('te', 'మదురవాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madhuravada, Visakhapatnam', 'Madhuravada మదురవాడ M361, MTHRFT', ST_SetSRID(ST_MakePoint(83.347329, 17.8177602), 4326), 40);
    END IF;
    -- Insert Bottavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bottavanipalem', ST_SetSRID(ST_MakePoint(83.3638631, 17.8243793), 4326), '{"BTFNPLM, B315"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bottavanipalem, Visakhapatnam', 'Bottavanipalem  BTFNPLM, B315', ST_SetSRID(ST_MakePoint(83.3638631, 17.8243793), 4326), 40);
    END IF;
    -- Insert Mallayyapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mallayyapalem', ST_SetSRID(ST_MakePoint(83.3686441, 17.8156222), 4326), '{"M414, MLYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mallayyapalem, Visakhapatnam', 'Mallayyapalem  M414, MLYPLM', ST_SetSRID(ST_MakePoint(83.3686441, 17.8156222), 4326), 60);
    END IF;
    -- Insert Gollala Timmapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollala Timmapuram', ST_SetSRID(ST_MakePoint(83.4037986, 17.8119192), 4326), '{"G443, KLL TMPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollala Timmapuram, Visakhapatnam', 'Gollala Timmapuram  G443, KLL TMPRM', ST_SetSRID(ST_MakePoint(83.4037986, 17.8119192), 4326), 40);
    END IF;
    -- Insert Vammivanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vammivanipalem', ST_SetSRID(ST_MakePoint(83.3795261, 17.7893889), 4326), '{"FMFNPLM, V515"}', jsonb_build_object('te', 'వమ్మివానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vammivanipalem, Visakhapatnam', 'Vammivanipalem వమ్మివానిపాలెం FMFNPLM, V515', ST_SetSRID(ST_MakePoint(83.3795261, 17.7893889), 4326), 40);
    END IF;
    -- Insert Vadapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vadapalem', ST_SetSRID(ST_MakePoint(83.3810294, 17.7849873), 4326), '{"FTPLM, V314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vadapalem, Visakhapatnam', 'Vadapalem  FTPLM, V314', ST_SetSRID(ST_MakePoint(83.3810294, 17.7849873), 4326), 40);
    END IF;
    -- Insert Chinna Gantyada (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Gantyada', ST_SetSRID(ST_MakePoint(83.1915276, 17.6802479), 4326), '{"C525, XN KNTYT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Gantyada, Visakhapatnam', 'Chinna Gantyada  C525, XN KNTYT', ST_SetSRID(ST_MakePoint(83.1915276, 17.6802479), 4326), 80);
    END IF;
    -- Insert Jogavanipalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jogavanipalem', ST_SetSRID(ST_MakePoint(83.2042114, 17.6907144), 4326), '{"JKFNPLM, J215"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jogavanipalem, Visakhapatnam', 'Jogavanipalem  JKFNPLM, J215', ST_SetSRID(ST_MakePoint(83.2042114, 17.6907144), 4326), 60);
    END IF;
    -- Insert Pata Gajuwaka (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pata Gajuwaka', ST_SetSRID(ST_MakePoint(83.197997, 17.6889083), 4326), '{"P322, PT KJWK, Old Gajuwaka, New Gajuwaka"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pata Gajuwaka, Visakhapatnam', 'Pata Gajuwaka  P322, PT KJWK, Old Gajuwaka, New Gajuwaka', ST_SetSRID(ST_MakePoint(83.197997, 17.6889083), 4326), 60);
    END IF;
    -- Insert Turakalapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Turakalapalem', ST_SetSRID(ST_MakePoint(83.2023746, 17.6817151), 4326), '{"T624, TRKLPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Turakalapalem, Visakhapatnam', 'Turakalapalem  T624, TRKLPLM', ST_SetSRID(ST_MakePoint(83.2023746, 17.6817151), 4326), 60);
    END IF;
    -- Insert Sattivanipalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sattivanipalem', ST_SetSRID(ST_MakePoint(83.1990579, 17.6959696), 4326), '{"STFNPLM, S315"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sattivanipalem, Visakhapatnam', 'Sattivanipalem  STFNPLM, S315', ST_SetSRID(ST_MakePoint(83.1990579, 17.6959696), 4326), 60);
    END IF;
    -- Insert Reddy Tungalam (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Reddy Tungalam', ST_SetSRID(ST_MakePoint(83.1927455, 17.7020021), 4326), '{"R335, RT TNKLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Reddy Tungalam, Visakhapatnam', 'Reddy Tungalam  R335, RT TNKLM', ST_SetSRID(ST_MakePoint(83.1927455, 17.7020021), 4326), 60);
    END IF;
    -- Insert Vadlapudi (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vadlapudi', ST_SetSRID(ST_MakePoint(83.1876013, 17.6933158), 4326), '{"FTLPT, V341"}', jsonb_build_object('te', 'వడ్లపూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vadlapudi, Visakhapatnam', 'Vadlapudi వడ్లపూడి FTLPT, V341', ST_SetSRID(ST_MakePoint(83.1876013, 17.6933158), 4326), 60);
    END IF;
    -- Insert Tungalam (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tungalam', ST_SetSRID(ST_MakePoint(83.1910203, 17.7051065), 4326), '{"T524, TNKLM"}', jsonb_build_object('te', 'తుగ్లాం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tungalam, Visakhapatnam', 'Tungalam తుగ్లాం T524, TNKLM', ST_SetSRID(ST_MakePoint(83.1910203, 17.7051065), 4326), 80);
    END IF;
    -- Insert Jaggayyapalem (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jaggayyapalem', ST_SetSRID(ST_MakePoint(83.1955602, 17.7169843), 4326), '{"J214, JKYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jaggayyapalem, Visakhapatnam', 'Jaggayyapalem  J214, JKYPLM', ST_SetSRID(ST_MakePoint(83.1955602, 17.7169843), 4326), 80);
    END IF;
    -- Insert Eduruvanipalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Eduruvanipalem', ST_SetSRID(ST_MakePoint(83.2238908, 17.6987484), 4326), '{"E361, ETRFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Eduruvanipalem, Visakhapatnam', 'Eduruvanipalem  E361, ETRFNPLM', ST_SetSRID(ST_MakePoint(83.2238908, 17.6987484), 4326), 60);
    END IF;
    -- Insert Nehrunagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nehrunagar', ST_SetSRID(ST_MakePoint(83.2304102, 17.6868595), 4326), '{"NRNKR, N652"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nehrunagar, Visakhapatnam', 'Nehrunagar  NRNKR, N652', ST_SetSRID(ST_MakePoint(83.2304102, 17.6868595), 4326), 60);
    END IF;
    -- Insert Sriram Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sriram Nagar', ST_SetSRID(ST_MakePoint(83.2353308, 17.6917618), 4326), '{"S665, SRRM NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sriram Nagar, Visakhapatnam', 'Sriram Nagar  S665, SRRM NKR', ST_SetSRID(ST_MakePoint(83.2353308, 17.6917618), 4326), 60);
    END IF;
    -- Insert Hindupuram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hindupuram', ST_SetSRID(ST_MakePoint(83.2109191, 17.697046), 4326), '{"HNTPRM, H531"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hindupuram, Visakhapatnam', 'Hindupuram  HNTPRM, H531', ST_SetSRID(ST_MakePoint(83.2109191, 17.697046), 4326), 60);
    END IF;
    -- Insert Mindi (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mindi', ST_SetSRID(ST_MakePoint(83.2123315, 17.7019054), 4326), '{"M530, MNT"}', jsonb_build_object('te', 'మిండి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mindi, Visakhapatnam', 'Mindi మిండి M530, MNT', ST_SetSRID(ST_MakePoint(83.2123315, 17.7019054), 4326), 60);
    END IF;
    -- Insert Kotha Narava (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotha Narava', ST_SetSRID(ST_MakePoint(83.1880482, 17.7380069), 4326), '{"K0 NRF, K356"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotha Narava, Visakhapatnam', 'Kotha Narava  K0 NRF, K356', ST_SetSRID(ST_MakePoint(83.1880482, 17.7380069), 4326), 40);
    END IF;
    -- Insert Govindapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Govindapuram', ST_SetSRID(ST_MakePoint(83.6113901, 18.0935807), 4326), '{"KFNTPRM, G153"}', jsonb_build_object('te', 'గోవిందపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Govindapuram, Visakhapatnam', 'Govindapuram గోవిందపురం KFNTPRM, G153', ST_SetSRID(ST_MakePoint(83.6113901, 18.0935807), 4326), 40);
    END IF;
    -- Insert Roluchappidi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Roluchappidi', ST_SetSRID(ST_MakePoint(83.6243826, 18.0753995), 4326), '{"RLXPT, R421"}', jsonb_build_object('te', 'రోలుచప్పిడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Roluchappidi, Visakhapatnam', 'Roluchappidi రోలుచప్పిడి RLXPT, R421', ST_SetSRID(ST_MakePoint(83.6243826, 18.0753995), 4326), 40);
    END IF;
    -- Insert Konayapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Konayapalem', ST_SetSRID(ST_MakePoint(83.6481913, 18.0939931), 4326), '{"KNYPLM, K514"}', jsonb_build_object('te', 'కోనయ్యపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Konayapalem, Visakhapatnam', 'Konayapalem కోనయ్యపాలెం KNYPLM, K514', ST_SetSRID(ST_MakePoint(83.6481913, 18.0939931), 4326), 10);
    END IF;
    -- Insert Pathivada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pathivada', ST_SetSRID(ST_MakePoint(83.6151654, 18.0692642), 4326), '{"P313, P0FT"}', jsonb_build_object('te', 'పాటివాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pathivada, Visakhapatnam', 'Pathivada పాటివాడ P313, P0FT', ST_SetSRID(ST_MakePoint(83.6151654, 18.0692642), 4326), 40);
    END IF;
    -- Insert Gollapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapeta', ST_SetSRID(ST_MakePoint(83.652488, 18.0771221), 4326), '{"G413, KLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapeta, Visakhapatnam', 'Gollapeta  G413, KLPT', ST_SetSRID(ST_MakePoint(83.652488, 18.0771221), 4326), 10);
    END IF;
    -- Insert Kottavuru (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottavuru', ST_SetSRID(ST_MakePoint(83.6487163, 18.0703257), 4326), '{"K316, KTFR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottavuru, Visakhapatnam', 'Kottavuru  K316, KTFR', ST_SetSRID(ST_MakePoint(83.6487163, 18.0703257), 4326), 10);
    END IF;
    -- Insert Krishnapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Krishnapuram', ST_SetSRID(ST_MakePoint(83.634423, 18.0811672), 4326), '{"K625, KRXNPRM"}', jsonb_build_object('te', 'కృష్ణాపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Krishnapuram, Visakhapatnam', 'Krishnapuram కృష్ణాపురం K625, KRXNPRM', ST_SetSRID(ST_MakePoint(83.634423, 18.0811672), 4326), 40);
    END IF;
    -- Insert Chintapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintapalli', ST_SetSRID(ST_MakePoint(83.6472381, 18.0736093), 4326), '{"XNTPL, C531"}', jsonb_build_object('te', 'చింతపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintapalli, Visakhapatnam', 'Chintapalli చింతపల్లి XNTPL, C531', ST_SetSRID(ST_MakePoint(83.6472381, 18.0736093), 4326), 40);
    END IF;
    -- Insert Jaggayyapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jaggayyapeta', ST_SetSRID(ST_MakePoint(83.5099763, 18.0216002), 4326), '{"JKYPT, J213"}', jsonb_build_object('te', 'జగ్గయ్యపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jaggayyapeta, Visakhapatnam', 'Jaggayyapeta జగ్గయ్యపేట JKYPT, J213', ST_SetSRID(ST_MakePoint(83.5099763, 18.0216002), 4326), 40);
    END IF;
    -- Insert Gudepuvalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gudepuvalasa', ST_SetSRID(ST_MakePoint(83.5049505, 17.9904962), 4326), '{"KTPFLS, G311"}', jsonb_build_object('te', 'గుడెపువలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gudepuvalasa, Visakhapatnam', 'Gudepuvalasa గుడెపువలస KTPFLS, G311', ST_SetSRID(ST_MakePoint(83.5049505, 17.9904962), 4326), 40);
    END IF;
    -- Insert Gollapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapeta', ST_SetSRID(ST_MakePoint(83.5071047, 18.0108759), 4326), '{"G413, KLPT"}', jsonb_build_object('te', 'గొల్లపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapeta, Visakhapatnam', 'Gollapeta గొల్లపేట G413, KLPT', ST_SetSRID(ST_MakePoint(83.5071047, 18.0108759), 4326), 10);
    END IF;
    -- Insert Subhannapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Subhannapeta', ST_SetSRID(ST_MakePoint(83.5403804, 18.0097198), 4326), '{"SBHNPT, S151"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Subhannapeta, Visakhapatnam', 'Subhannapeta  SBHNPT, S151', ST_SetSRID(ST_MakePoint(83.5403804, 18.0097198), 4326), 40);
    END IF;
    -- Insert Dollipeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dollipeta', ST_SetSRID(ST_MakePoint(83.5213116, 17.9857627), 4326), '{"D413, TLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dollipeta, Visakhapatnam', 'Dollipeta  D413, TLPT', ST_SetSRID(ST_MakePoint(83.5213116, 17.9857627), 4326), 10);
    END IF;
    -- Insert Bayareddipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bayareddipalem', ST_SetSRID(ST_MakePoint(83.5273745, 17.9817251), 4326), '{"B631, BYRTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bayareddipalem, Visakhapatnam', 'Bayareddipalem  B631, BYRTPLM', ST_SetSRID(ST_MakePoint(83.5273745, 17.9817251), 4326), 40);
    END IF;
    -- Insert Chinnakondrajupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinnakondrajupalem', ST_SetSRID(ST_MakePoint(83.5592092, 18.0053046), 4326), '{"C525, XNKNTRJPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinnakondrajupalem, Visakhapatnam', 'Chinnakondrajupalem  C525, XNKNTRJPLM', ST_SetSRID(ST_MakePoint(83.5592092, 18.0053046), 4326), 40);
    END IF;
    -- Insert Rellipeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rellipeta', ST_SetSRID(ST_MakePoint(83.5320805, 18.0028386), 4326), '{"RLPT, R413"}', jsonb_build_object('te', 'రెల్లిపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rellipeta, Visakhapatnam', 'Rellipeta రెల్లిపేట RLPT, R413', ST_SetSRID(ST_MakePoint(83.5320805, 18.0028386), 4326), 10);
    END IF;
    -- Insert Kottapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottapalem', ST_SetSRID(ST_MakePoint(83.5600688, 18.0087553), 4326), '{"KTPLM, K314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottapalem, Visakhapatnam', 'Kottapalem  KTPLM, K314', ST_SetSRID(ST_MakePoint(83.5600688, 18.0087553), 4326), 40);
    END IF;
    -- Insert Galipeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Galipeta', ST_SetSRID(ST_MakePoint(83.5186085, 17.9959783), 4326), '{"G413, KLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Galipeta, Visakhapatnam', 'Galipeta  G413, KLPT', ST_SetSRID(ST_MakePoint(83.5186085, 17.9959783), 4326), 10);
    END IF;
    -- Insert Mukkam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mukkam', ST_SetSRID(ST_MakePoint(83.558875, 17.9891374), 4326), '{"M250, MKM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mukkam, Visakhapatnam', 'Mukkam  M250, MKM', ST_SetSRID(ST_MakePoint(83.558875, 17.9891374), 4326), 40);
    END IF;
    -- Insert Kancheru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kancheru', ST_SetSRID(ST_MakePoint(83.5381806, 17.9816784), 4326), '{"KNXR, K526"}', jsonb_build_object('te', 'కంచేరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kancheru, Visakhapatnam', 'Kancheru కంచేరు KNXR, K526', ST_SetSRID(ST_MakePoint(83.5381806, 17.9816784), 4326), 40);
    END IF;
    -- Insert Munjeru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Munjeru', ST_SetSRID(ST_MakePoint(83.5209075, 18.0143462), 4326), '{"M526, MNJR"}', jsonb_build_object('te', 'ముంజేరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Munjeru, Visakhapatnam', 'Munjeru ముంజేరు M526, MNJR', ST_SetSRID(ST_MakePoint(83.5209075, 18.0143462), 4326), 40);
    END IF;
    -- Insert Eppllipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Eppllipeta', ST_SetSRID(ST_MakePoint(83.5349941, 18.0068591), 4326), '{"EPLPT, E141"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Eppllipeta, Visakhapatnam', 'Eppllipeta  EPLPT, E141', ST_SetSRID(ST_MakePoint(83.5349941, 18.0068591), 4326), 40);
    END IF;
    -- Insert Ramachandrapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramachandrapeta', ST_SetSRID(ST_MakePoint(83.5502609, 18.0058882), 4326), '{"RMXNTRPT, R525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramachandrapeta, Visakhapatnam', 'Ramachandrapeta  RMXNTRPT, R525', ST_SetSRID(ST_MakePoint(83.5502609, 18.0058882), 4326), 40);
    END IF;
    -- Insert Totapalli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Totapalli', ST_SetSRID(ST_MakePoint(83.5501744, 17.9860017), 4326), '{"TTPL, T314"}', jsonb_build_object('te', 'తోటపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Totapalli, Visakhapatnam', 'Totapalli తోటపల్లి TTPL, T314', ST_SetSRID(ST_MakePoint(83.5501744, 17.9860017), 4326), 40);
    END IF;
    -- Insert Kondrajupalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kondrajupalem', ST_SetSRID(ST_MakePoint(83.5587367, 18.0013803), 4326), '{"KNTRJPLM, K536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kondrajupalem, Visakhapatnam', 'Kondrajupalem  KNTRJPLM, K536', ST_SetSRID(ST_MakePoint(83.5587367, 18.0013803), 4326), 10);
    END IF;
    -- Insert Malapalli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Malapalli', ST_SetSRID(ST_MakePoint(83.5486478, 17.987952), 4326), '{"M414, MLPL"}', jsonb_build_object('te', 'మలపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Malapalli, Visakhapatnam', 'Malapalli మలపల్లి M414, MLPL', ST_SetSRID(ST_MakePoint(83.5486478, 17.987952), 4326), 10);
    END IF;
    -- Insert Gabupeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gabupeta', ST_SetSRID(ST_MakePoint(83.5502312, 17.9823951), 4326), '{"G113, KBPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gabupeta, Visakhapatnam', 'Gabupeta  G113, KBPT', ST_SetSRID(ST_MakePoint(83.5502312, 17.9823951), 4326), 10);
    END IF;
    -- Insert Pittapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pittapeta', ST_SetSRID(ST_MakePoint(83.5233784, 17.9981324), 4326), '{"P313, PTPT"}', jsonb_build_object('te', 'పిట్టపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pittapeta, Visakhapatnam', 'Pittapeta పిట్టపేట P313, PTPT', ST_SetSRID(ST_MakePoint(83.5233784, 17.9981324), 4326), 10);
    END IF;
    -- Insert Kongavanipalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kongavanipalem', ST_SetSRID(ST_MakePoint(83.5359537, 17.9896808), 4326), '{"KNKFNPLM, K521"}', jsonb_build_object('te', 'కొంగవానిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kongavanipalem, Visakhapatnam', 'Kongavanipalem కొంగవానిపాలెం KNKFNPLM, K521', ST_SetSRID(ST_MakePoint(83.5359537, 17.9896808), 4326), 40);
    END IF;
    -- Insert Biyyalapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Biyyalapeta', ST_SetSRID(ST_MakePoint(83.4033123, 18.0800451), 4326), '{"BYLPT, B413"}', jsonb_build_object('te', 'బియ్యలపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Biyyalapeta, Visakhapatnam', 'Biyyalapeta బియ్యలపేట BYLPT, B413', ST_SetSRID(ST_MakePoint(83.4033123, 18.0800451), 4326), 40);
    END IF;
END $$;