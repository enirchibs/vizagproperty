-- BULK OSM DATA SEED PART 5
DO $$
DECLARE
    vzg_city_id UUID;
    new_loc_id UUID;
BEGIN
    SELECT id INTO vzg_city_id FROM geo.cities WHERE name = 'Visakhapatnam' LIMIT 1;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.2117123, 17.7960772), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.2117123, 17.7960772), 4326), 10);
    END IF;
    -- Insert Andhra Pradesh Grameena Vikas Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Andhra Pradesh Grameena Vikas Bank', ST_SetSRID(ST_MakePoint(83.3579035, 17.7836471), 4326), '{"ANTHR PRTX KRMN FKS BNK, A536"}', jsonb_build_object('te', 'ఆంధ్ర‌ప్ర‌దేశ్ గ్రామీణ వికాస్ బ్యాంక్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Andhra Pradesh Grameena Vikas Bank, Visakhapatnam', 'Andhra Pradesh Grameena Vikas Bank ఆంధ్ర‌ప్ర‌దేశ్ గ్రామీణ వికాస్ బ్యాంక్ ANTHR PRTX KRMN FKS BNK, A536', ST_SetSRID(ST_MakePoint(83.3579035, 17.7836471), 4326), 10);
    END IF;
    -- Insert The District Cooperative Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The District Cooperative Bank', ST_SetSRID(ST_MakePoint(83.2064016, 17.8148809), 4326), '{"0 TSTRKT KPRTF BNK, T323"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The District Cooperative Bank, Visakhapatnam', 'The District Cooperative Bank  0 TSTRKT KPRTF BNK, T323', ST_SetSRID(ST_MakePoint(83.2064016, 17.8148809), 4326), 10);
    END IF;
    -- Insert Punjab National Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Punjab National Bank', ST_SetSRID(ST_MakePoint(83.2064753, 17.8176537), 4326), '{"PNJB NXNL BNK, P521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Punjab National Bank, Visakhapatnam', 'Punjab National Bank  PNJB NXNL BNK, P521', ST_SetSRID(ST_MakePoint(83.2064753, 17.8176537), 4326), 10);
    END IF;
    -- Insert Dhaba (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dhaba', ST_SetSRID(ST_MakePoint(83.226023, 17.9743413), 4326), '{"D100, THB"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dhaba, Visakhapatnam', 'Dhaba  D100, THB', ST_SetSRID(ST_MakePoint(83.226023, 17.9743413), 4326), 10);
    END IF;
    -- Insert Sajahan Tiffin Center (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sajahan Tiffin Center', ST_SetSRID(ST_MakePoint(83.2404694, 17.9928678), 4326), '{"SJHN TFN SNTR, S253"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sajahan Tiffin Center, Visakhapatnam', 'Sajahan Tiffin Center  SJHN TFN SNTR, S253', ST_SetSRID(ST_MakePoint(83.2404694, 17.9928678), 4326), 10);
    END IF;
    -- Insert Indian Overseas Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Overseas Bank', ST_SetSRID(ST_MakePoint(83.4003929, 18.052585), 4326), '{"I535, INTN OFRSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Overseas Bank, Visakhapatnam', 'Indian Overseas Bank  I535, INTN OFRSS BNK', ST_SetSRID(ST_MakePoint(83.4003929, 18.052585), 4326), 10);
    END IF;
    -- Insert Salt & Pepper (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Salt & Pepper', ST_SetSRID(ST_MakePoint(83.4002374, 18.0527238), 4326), '{"SLT PPR, S431"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Salt & Pepper, Visakhapatnam', 'Salt & Pepper  SLT PPR, S431', ST_SetSRID(ST_MakePoint(83.4002374, 18.0527238), 4326), 10);
    END IF;
    -- Insert Star Annapurna (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Star Annapurna', ST_SetSRID(ST_MakePoint(83.1888914, 17.9004135), 4326), '{"STR ANPRN, S365"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Star Annapurna, Visakhapatnam', 'Star Annapurna  STR ANPRN, S365', ST_SetSRID(ST_MakePoint(83.1888914, 17.9004135), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.1719258, 17.9791975), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.1719258, 17.9791975), 4326), 10);
    END IF;
    -- Insert Santhi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Santhi Nagar', ST_SetSRID(ST_MakePoint(83.2389069, 17.7438185), 4326), '{"S535, SN0 NKR"}', jsonb_build_object('te', 'శాంతి నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Santhi Nagar, Visakhapatnam', 'Santhi Nagar శాంతి నగర్ S535, SN0 NKR', ST_SetSRID(ST_MakePoint(83.2389069, 17.7438185), 4326), 60);
    END IF;
    -- Insert Khaasapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Khaasapeta', ST_SetSRID(ST_MakePoint(83.1841253, 18.0218229), 4326), '{"K213, KHSPT"}', jsonb_build_object('te', 'ఖాశాపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Khaasapeta, Visakhapatnam', 'Khaasapeta ఖాశాపేట K213, KHSPT', ST_SetSRID(ST_MakePoint(83.1841253, 18.0218229), 4326), 40);
    END IF;
    -- Insert Aswini Family Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aswini Family Restaurant', ST_SetSRID(ST_MakePoint(83.4260816, 17.9633495), 4326), '{"A251, ASWN FML RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aswini Family Restaurant, Visakhapatnam', 'Aswini Family Restaurant  A251, ASWN FML RSTRNT', ST_SetSRID(ST_MakePoint(83.4260816, 17.9633495), 4326), 10);
    END IF;
    -- Insert Grand Alpha (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Grand Alpha', ST_SetSRID(ST_MakePoint(83.2312221, 17.7434774), 4326), '{"KRNT ALF, G653"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Grand Alpha, Visakhapatnam', 'Grand Alpha  KRNT ALF, G653', ST_SetSRID(ST_MakePoint(83.2312221, 17.7434774), 4326), 10);
    END IF;
    -- Insert Karnataka Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karnataka Bank', ST_SetSRID(ST_MakePoint(83.2219216, 17.7461728), 4326), '{"K653, KRNTK BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karnataka Bank, Visakhapatnam', 'Karnataka Bank  K653, KRNTK BNK', ST_SetSRID(ST_MakePoint(83.2219216, 17.7461728), 4326), 10);
    END IF;
    -- Insert Daba Gardens (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Daba Gardens', ST_SetSRID(ST_MakePoint(83.2986494, 17.7172349), 4326), '{"TB KRTNS, D126"}', jsonb_build_object('te', 'డాబా గార్డెన్స్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Daba Gardens, Visakhapatnam', 'Daba Gardens డాబా గార్డెన్స్ TB KRTNS, D126', ST_SetSRID(ST_MakePoint(83.2986494, 17.7172349), 4326), 60);
    END IF;
    -- Insert Sri Sai Ram Parlour (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Sai Ram Parlour', ST_SetSRID(ST_MakePoint(83.3059027, 17.7254689), 4326), '{"SR S RM PRLR, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Sai Ram Parlour, Visakhapatnam', 'Sri Sai Ram Parlour  SR S RM PRLR, S626', ST_SetSRID(ST_MakePoint(83.3059027, 17.7254689), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.3003522, 17.7124553), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.3003522, 17.7124553), 4326), 10);
    END IF;
    -- Insert RBL Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'RBL Bank', ST_SetSRID(ST_MakePoint(83.3019758, 17.7272523), 4326), '{"R141, RBL BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'RBL Bank, Visakhapatnam', 'RBL Bank  R141, RBL BNK', ST_SetSRID(ST_MakePoint(83.3019758, 17.7272523), 4326), 10);
    END IF;
    -- Insert Dine Destiny (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dine Destiny', ST_SetSRID(ST_MakePoint(83.3391847, 17.7277209), 4326), '{"D532, TN TSTN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dine Destiny, Visakhapatnam', 'Dine Destiny  D532, TN TSTN', ST_SetSRID(ST_MakePoint(83.3391847, 17.7277209), 4326), 10);
    END IF;
    -- Insert Gismat Mandi (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gismat Mandi', ST_SetSRID(ST_MakePoint(83.3406169, 17.7337883), 4326), '{"JSMT MNT, G253"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gismat Mandi, Visakhapatnam', 'Gismat Mandi  JSMT MNT, G253', ST_SetSRID(ST_MakePoint(83.3406169, 17.7337883), 4326), 10);
    END IF;
    -- Insert Imperial Spice (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Imperial Spice', ST_SetSRID(ST_MakePoint(83.3442904, 17.7433579), 4326), '{"IMPRL SPS, I516"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Imperial Spice, Visakhapatnam', 'Imperial Spice  IMPRL SPS, I516', ST_SetSRID(ST_MakePoint(83.3442904, 17.7433579), 4326), 10);
    END IF;
    -- Insert CSB Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'CSB Bank', ST_SetSRID(ST_MakePoint(83.2066467, 17.817021), 4326), '{"C115, KSB BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'CSB Bank, Visakhapatnam', 'CSB Bank  C115, KSB BNK', ST_SetSRID(ST_MakePoint(83.2066467, 17.817021), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2067511, 17.8169913), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2067511, 17.8169913), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.2066667, 17.8132798), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.2066667, 17.8132798), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.2187544, 17.7500302), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.2187544, 17.7500302), 4326), 10);
    END IF;
    -- Insert Andhra Pradesh Grameena Vikas Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Andhra Pradesh Grameena Vikas Bank', ST_SetSRID(ST_MakePoint(83.1873761, 17.899196), 4326), '{"ANTHR PRTX KRMN FKS BNK, A536"}', jsonb_build_object('te', 'ఆంధ్ర‌ప్ర‌దేశ్ గ్రామీణ వికాస్ బ్యాంక్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Andhra Pradesh Grameena Vikas Bank, Visakhapatnam', 'Andhra Pradesh Grameena Vikas Bank ఆంధ్ర‌ప్ర‌దేశ్ గ్రామీణ వికాస్ బ్యాంక్ ANTHR PRTX KRMN FKS BNK, A536', ST_SetSRID(ST_MakePoint(83.1873761, 17.899196), 4326), 10);
    END IF;
    -- Insert Bank of Maharashtra (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of Maharashtra', ST_SetSRID(ST_MakePoint(83.1891825, 17.9007353), 4326), '{"BNK OF MHRXTR, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of Maharashtra, Visakhapatnam', 'Bank of Maharashtra  BNK OF MHRXTR, B521', ST_SetSRID(ST_MakePoint(83.1891825, 17.9007353), 4326), 10);
    END IF;
    -- Insert Punjab National Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Punjab National Bank', ST_SetSRID(ST_MakePoint(83.1890309, 17.9006717), 4326), '{"PNJB NXNL BNK, P521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Punjab National Bank, Visakhapatnam', 'Punjab National Bank  PNJB NXNL BNK, P521', ST_SetSRID(ST_MakePoint(83.1890309, 17.9006717), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.1891199, 17.9006243), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.1891199, 17.9006243), 4326), 10);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.1899985, 17.9016817), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.1899985, 17.9016817), 4326), 10);
    END IF;
    -- Insert CSB Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'CSB Bank', ST_SetSRID(ST_MakePoint(83.1907005, 17.9021621), 4326), '{"C115, KSB BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'CSB Bank, Visakhapatnam', 'CSB Bank  C115, KSB BNK', ST_SetSRID(ST_MakePoint(83.1907005, 17.9021621), 4326), 10);
    END IF;
    -- Insert The District Co-Operative Central Bank Ltd (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The District Co-Operative Central Bank Ltd', ST_SetSRID(ST_MakePoint(83.190639, 17.9022115), 4326), '{"0 TSTRKT KPRTF SNTRL BNK LTT, T323"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The District Co-Operative Central Bank Ltd, Visakhapatnam', 'The District Co-Operative Central Bank Ltd  0 TSTRKT KPRTF SNTRL BNK LTT, T323', ST_SetSRID(ST_MakePoint(83.190639, 17.9022115), 4326), 10);
    END IF;
    -- Insert Suneetha Hospital Dr V Anand Rao (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Suneetha Hospital Dr V Anand Rao', ST_SetSRID(ST_MakePoint(83.2535864, 17.7401303), 4326), '{"SN0 HSPTL TR F ANNT R, S532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Suneetha Hospital Dr V Anand Rao, Visakhapatnam', 'Suneetha Hospital Dr V Anand Rao  SN0 HSPTL TR F ANNT R, S532', ST_SetSRID(ST_MakePoint(83.2535864, 17.7401303), 4326), 50);
    END IF;
    -- Insert North Marripalem Railway Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'North Marripalem Railway Colony', ST_SetSRID(ST_MakePoint(83.2508835, 17.742084), 4326), '{"N635, NR0 MRPLM RLW KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'North Marripalem Railway Colony, Visakhapatnam', 'North Marripalem Railway Colony  N635, NR0 MRPLM RLW KLN', ST_SetSRID(ST_MakePoint(83.2508835, 17.742084), 4326), 60);
    END IF;
    -- Insert Sri Chaitanya Techno School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Chaitanya Techno School', ST_SetSRID(ST_MakePoint(83.2375401, 17.7413557), 4326), '{"S623, SR XTNY TXN SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Chaitanya Techno School, Visakhapatnam', 'Sri Chaitanya Techno School  S623, SR XTNY TXN SXL', ST_SetSRID(ST_MakePoint(83.2375401, 17.7413557), 4326), 50);
    END IF;
    -- Insert Mandi Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mandi Restaurant', ST_SetSRID(ST_MakePoint(83.2381724, 17.742226), 4326), '{"MNT RSTRNT, M536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mandi Restaurant, Visakhapatnam', 'Mandi Restaurant  MNT RSTRNT, M536', ST_SetSRID(ST_MakePoint(83.2381724, 17.742226), 4326), 10);
    END IF;
    -- Insert Rajanna Colony (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajanna Colony', ST_SetSRID(ST_MakePoint(83.1938311, 17.912811), 4326), '{"R252, RJN KLN"}', jsonb_build_object('te', 'రాజన్న కాలనీ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajanna Colony, Visakhapatnam', 'Rajanna Colony రాజన్న కాలనీ R252, RJN KLN', ST_SetSRID(ST_MakePoint(83.1938311, 17.912811), 4326), 10);
    END IF;
    -- Insert Chinnamannipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinnamannipalem', ST_SetSRID(ST_MakePoint(83.2076964, 17.9170804), 4326), '{"XNMNPLM, C555"}', jsonb_build_object('te', 'చిన్నమన్నిపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinnamannipalem, Visakhapatnam', 'Chinnamannipalem చిన్నమన్నిపాలెం XNMNPLM, C555', ST_SetSRID(ST_MakePoint(83.2076964, 17.9170804), 4326), 10);
    END IF;
    -- Insert Pedaraopalle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedaraopalle', ST_SetSRID(ST_MakePoint(83.2511937, 17.9626115), 4326), '{"P361, PTRPL"}', jsonb_build_object('te', 'పెదరావుపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedaraopalle, Visakhapatnam', 'Pedaraopalle పెదరావుపల్లి P361, PTRPL', ST_SetSRID(ST_MakePoint(83.2511937, 17.9626115), 4326), 10);
    END IF;
    -- Insert Uttarapalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Uttarapalle', ST_SetSRID(ST_MakePoint(83.1858735, 17.9612326), 4326), '{"UTRPL, U361"}', jsonb_build_object('te', 'ఉత్తరాపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Uttarapalle, Visakhapatnam', 'Uttarapalle ఉత్తరాపల్లి UTRPL, U361', ST_SetSRID(ST_MakePoint(83.1858735, 17.9612326), 4326), 40);
    END IF;
    -- Insert Pizza Hut (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pizza Hut', ST_SetSRID(ST_MakePoint(83.3185057, 17.7342188), 4326), '{"P230, PS HT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pizza Hut, Visakhapatnam', 'Pizza Hut  P230, PS HT', ST_SetSRID(ST_MakePoint(83.3185057, 17.7342188), 4326), 10);
    END IF;
    -- Insert Chowduvada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chowduvada', ST_SetSRID(ST_MakePoint(83.0009479, 17.8399789), 4326), '{"C313, XTFT"}', jsonb_build_object('te', 'చౌడువాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chowduvada, Visakhapatnam', 'Chowduvada చౌడువాడ C313, XTFT', ST_SetSRID(ST_MakePoint(83.0009479, 17.8399789), 4326), 40);
    END IF;
    -- Insert Garabapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Garabapalem', ST_SetSRID(ST_MakePoint(83.2763409, 18.0265093), 4326), '{"G611, KRBPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Garabapalem, Visakhapatnam', 'Garabapalem  G611, KRBPLM', ST_SetSRID(ST_MakePoint(83.2763409, 18.0265093), 4326), 10);
    END IF;
    -- Insert Sunkarapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sunkarapeta', ST_SetSRID(ST_MakePoint(83.3979629, 18.0676046), 4326), '{"S526, SNKRPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sunkarapeta, Visakhapatnam', 'Sunkarapeta  S526, SNKRPT', ST_SetSRID(ST_MakePoint(83.3979629, 18.0676046), 4326), 40);
    END IF;
    -- Insert Nerellavalasa (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nerellavalasa', ST_SetSRID(ST_MakePoint(83.3661932, 18.0471813), 4326), '{"NRLFLS, N641"}', jsonb_build_object('te', 'నేరెళ్ళవలస'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nerellavalasa, Visakhapatnam', 'Nerellavalasa నేరెళ్ళవలస NRLFLS, N641', ST_SetSRID(ST_MakePoint(83.3661932, 18.0471813), 4326), 40);
    END IF;
    -- Insert Chowduvada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chowduvada', ST_SetSRID(ST_MakePoint(83.6384138, 18.0936803), 4326), '{"C313, XTFT"}', jsonb_build_object('te', 'చౌడువాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chowduvada, Visakhapatnam', 'Chowduvada చౌడువాడ C313, XTFT', ST_SetSRID(ST_MakePoint(83.6384138, 18.0936803), 4326), 40);
    END IF;
    -- Insert Kottam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottam', ST_SetSRID(ST_MakePoint(83.2310934, 18.0936483), 4326), '{"K350, KTM"}', jsonb_build_object('te', 'కొట్టం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottam, Visakhapatnam', 'Kottam కొట్టం K350, KTM', ST_SetSRID(ST_MakePoint(83.2310934, 18.0936483), 4326), 40);
    END IF;
    -- Insert Gollapeta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gollapeta', ST_SetSRID(ST_MakePoint(83.5496331, 18.0682474), 4326), '{"G413, KLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gollapeta, Visakhapatnam', 'Gollapeta  G413, KLPT', ST_SetSRID(ST_MakePoint(83.5496331, 18.0682474), 4326), 10);
    END IF;
    -- Insert Matsavanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Matsavanipalem', ST_SetSRID(ST_MakePoint(83.5470946, 18.0667416), 4326), '{"M321, MTSFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Matsavanipalem, Visakhapatnam', 'Matsavanipalem  M321, MTSFNPLM', ST_SetSRID(ST_MakePoint(83.5470946, 18.0667416), 4326), 10);
    END IF;
    -- Insert Pedda Nadipilli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Nadipilli', ST_SetSRID(ST_MakePoint(83.5493572, 18.0517914), 4326), '{"P353, PT NTPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Nadipilli, Visakhapatnam', 'Pedda Nadipilli  P353, PT NTPL', ST_SetSRID(ST_MakePoint(83.5493572, 18.0517914), 4326), 40);
    END IF;
    -- Insert Nadipalle (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nadipalle', ST_SetSRID(ST_MakePoint(83.5510651, 18.0408835), 4326), '{"N314, NTPL"}', jsonb_build_object('te', 'నడిపల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nadipalle, Visakhapatnam', 'Nadipalle నడిపల్లి N314, NTPL', ST_SetSRID(ST_MakePoint(83.5510651, 18.0408835), 4326), 40);
    END IF;
    -- Insert Aravalmallu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aravalmallu', ST_SetSRID(ST_MakePoint(83.4989501, 18.0543883), 4326), '{"ARFLML, A614"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aravalmallu, Visakhapatnam', 'Aravalmallu  ARFLML, A614', ST_SetSRID(ST_MakePoint(83.4989501, 18.0543883), 4326), 10);
    END IF;
    -- Insert Singavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Singavaram', ST_SetSRID(ST_MakePoint(83.5218698, 18.0656451), 4326), '{"SNKFRM, S521"}', jsonb_build_object('te', 'సింగవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Singavaram, Visakhapatnam', 'Singavaram సింగవరం SNKFRM, S521', ST_SetSRID(ST_MakePoint(83.5218698, 18.0656451), 4326), 40);
    END IF;
    -- Insert Rangapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rangapuram', ST_SetSRID(ST_MakePoint(83.1748265, 17.9912465), 4326), '{"R521, RNKPRM"}', jsonb_build_object('te', 'రంగాపురం (లక్కవరపుకోట)'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rangapuram, Visakhapatnam', 'Rangapuram రంగాపురం (లక్కవరపుకోట) R521, RNKPRM', ST_SetSRID(ST_MakePoint(83.1748265, 17.9912465), 4326), 40);
    END IF;
    -- Insert Garugubilli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Garugubilli', ST_SetSRID(ST_MakePoint(82.9974923, 17.8374193), 4326), '{"G621, KRKBL"}', jsonb_build_object('te', 'గరుగుబిల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Garugubilli, Visakhapatnam', 'Garugubilli గరుగుబిల్లి G621, KRKBL', ST_SetSRID(ST_MakePoint(82.9974923, 17.8374193), 4326), 10);
    END IF;
    -- Insert Venkannapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkannapalem', ST_SetSRID(ST_MakePoint(83.1429304, 17.998886), 4326), '{"FNKNPLM, V525"}', jsonb_build_object('te', 'వెంకన్నపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkannapalem, Visakhapatnam', 'Venkannapalem వెంకన్నపాలెం FNKNPLM, V525', ST_SetSRID(ST_MakePoint(83.1429304, 17.998886), 4326), 40);
    END IF;
    -- Insert Kasipathi Rajapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kasipathi Rajapuram', ST_SetSRID(ST_MakePoint(83.1196353, 18.0864684), 4326), '{"K213, KSP0 RJPRM"}', jsonb_build_object('te', 'కాశీపతిరాజపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kasipathi Rajapuram, Visakhapatnam', 'Kasipathi Rajapuram కాశీపతిరాజపురం K213, KSP0 RJPRM', ST_SetSRID(ST_MakePoint(83.1196353, 18.0864684), 4326), 40);
    END IF;
    -- Insert Nagayyapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nagayyapeta', ST_SetSRID(ST_MakePoint(83.0049491, 17.99855), 4326), '{"N213, NKYPT"}', jsonb_build_object('te', 'నాగయ్యపేట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nagayyapeta, Visakhapatnam', 'Nagayyapeta నాగయ్యపేట N213, NKYPT', ST_SetSRID(ST_MakePoint(83.0049491, 17.99855), 4326), 40);
    END IF;
    -- Insert Manhanthipeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Manhanthipeta', ST_SetSRID(ST_MakePoint(83.5099213, 18.0708806), 4326), '{"MNHN0PT, M553"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Manhanthipeta, Visakhapatnam', 'Manhanthipeta  MNHN0PT, M553', ST_SetSRID(ST_MakePoint(83.5099213, 18.0708806), 4326), 40);
    END IF;
    -- Insert Kothakopperla (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kothakopperla', ST_SetSRID(ST_MakePoint(83.548108, 18.0631104), 4326), '{"K0KPRL, K321"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kothakopperla, Visakhapatnam', 'Kothakopperla  K0KPRL, K321', ST_SetSRID(ST_MakePoint(83.548108, 18.0631104), 4326), 10);
    END IF;
    -- Insert Kurmavaram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kurmavaram', ST_SetSRID(ST_MakePoint(83.188734, 18.0067129), 4326), '{"KRMFRM, K651"}', jsonb_build_object('te', 'కుర్మవరం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kurmavaram, Visakhapatnam', 'Kurmavaram కుర్మవరం KRMFRM, K651', ST_SetSRID(ST_MakePoint(83.188734, 18.0067129), 4326), 40);
    END IF;
    -- Insert Kancherupalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kancherupalem', ST_SetSRID(ST_MakePoint(83.5294926, 17.959904), 4326), '{"KNXRPLM, K526"}', jsonb_build_object('te', 'కంచేరుపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kancherupalem, Visakhapatnam', 'Kancherupalem కంచేరుపాలెం KNXRPLM, K526', ST_SetSRID(ST_MakePoint(83.5294926, 17.959904), 4326), 40);
    END IF;
    -- Insert Thottadam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Thottadam', ST_SetSRID(ST_MakePoint(83.6002707, 18.0778362), 4326), '{"0TTM, T335"}', jsonb_build_object('te', 'తొట్టడం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Thottadam, Visakhapatnam', 'Thottadam తొట్టడం 0TTM, T335', ST_SetSRID(ST_MakePoint(83.6002707, 18.0778362), 4326), 40);
    END IF;
    -- Insert Palanki (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Palanki', ST_SetSRID(ST_MakePoint(83.5938549, 18.0614453), 4326), '{"PLNK, P452"}', jsonb_build_object('te', 'పాలంకి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Palanki, Visakhapatnam', 'Palanki పాలంకి PLNK, P452', ST_SetSRID(ST_MakePoint(83.5938549, 18.0614453), 4326), 40);
    END IF;
    -- Insert Gangubudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gangubudi', ST_SetSRID(ST_MakePoint(83.1711012, 17.9563777), 4326), '{"G521, KNKBT"}', jsonb_build_object('te', 'గంగుబూడి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gangubudi, Visakhapatnam', 'Gangubudi గంగుబూడి G521, KNKBT', ST_SetSRID(ST_MakePoint(83.1711012, 17.9563777), 4326), 40);
    END IF;
    -- Insert Somayajulapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Somayajulapalem', ST_SetSRID(ST_MakePoint(83.2888126, 18.0570388), 4326), '{"S524, SMYJLPLM"}', jsonb_build_object('te', 'సోమయాజులపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Somayajulapalem, Visakhapatnam', 'Somayajulapalem సోమయాజులపాలెం S524, SMYJLPLM', ST_SetSRID(ST_MakePoint(83.2888126, 18.0570388), 4326), 40);
    END IF;
    -- Insert Chintalapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintalapalem', ST_SetSRID(ST_MakePoint(82.8781299, 17.6095093), 4326), '{"C534, XNTLPLM"}', jsonb_build_object('te', 'చింతలపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintalapalem, Visakhapatnam', 'Chintalapalem చింతలపాలెం C534, XNTLPLM', ST_SetSRID(ST_MakePoint(82.8781299, 17.6095093), 4326), 40);
    END IF;
    -- Insert Gunupur (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gunupur', ST_SetSRID(ST_MakePoint(83.47156, 18.07698), 4326), '{"G516, KNPR"}', jsonb_build_object('te', 'గుణుపూరు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gunupur, Visakhapatnam', 'Gunupur గుణుపూరు G516, KNPR', ST_SetSRID(ST_MakePoint(83.47156, 18.07698), 4326), 40);
    END IF;
    -- Insert Pandigunta (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pandigunta', ST_SetSRID(ST_MakePoint(82.8142334, 17.9559277), 4326), '{"PNTKNT, P532"}', jsonb_build_object('te', 'పందిగుంట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pandigunta, Visakhapatnam', 'Pandigunta పందిగుంట PNTKNT, P532', ST_SetSRID(ST_MakePoint(82.8142334, 17.9559277), 4326), 10);
    END IF;
    -- Insert Dabbapadu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dabbapadu', ST_SetSRID(ST_MakePoint(82.8106563, 17.9543228), 4326), '{"D113, TBPT"}', jsonb_build_object('te', 'దబ్బపాడు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dabbapadu, Visakhapatnam', 'Dabbapadu దబ్బపాడు D113, TBPT', ST_SetSRID(ST_MakePoint(82.8106563, 17.9543228), 4326), 10);
    END IF;
    -- Insert Jeelugupadu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jeelugupadu', ST_SetSRID(ST_MakePoint(82.8069129, 17.9594612), 4326), '{"J421, JLKPT"}', jsonb_build_object('te', 'జీలుగుపాడు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jeelugupadu, Visakhapatnam', 'Jeelugupadu జీలుగుపాడు J421, JLKPT', ST_SetSRID(ST_MakePoint(82.8069129, 17.9594612), 4326), 10);
    END IF;
    -- Insert Gulli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gulli', ST_SetSRID(ST_MakePoint(82.811184, 17.9912939), 4326), '{"KL, G400"}', jsonb_build_object('te', 'గుల్లి'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gulli, Visakhapatnam', 'Gulli గుల్లి KL, G400', ST_SetSRID(ST_MakePoint(82.811184, 17.9912939), 4326), 10);
    END IF;
    -- Insert Chinaraopalli Gate (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinaraopalli Gate', ST_SetSRID(ST_MakePoint(83.2213459, 17.9682264), 4326), '{"C561, XNRPL KT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinaraopalli Gate, Visakhapatnam', 'Chinaraopalli Gate  C561, XNRPL KT', ST_SetSRID(ST_MakePoint(83.2213459, 17.9682264), 4326), 40);
    END IF;
    -- Insert Regulapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Regulapalem', ST_SetSRID(ST_MakePoint(82.929788, 18.0899177), 4326), '{"RKLPLM, R241"}', jsonb_build_object('te', 'రేగులపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Regulapalem, Visakhapatnam', 'Regulapalem రేగులపాలెం RKLPLM, R241', ST_SetSRID(ST_MakePoint(82.929788, 18.0899177), 4326), 10);
    END IF;
    -- Insert Pedakota (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedakota', ST_SetSRID(ST_MakePoint(82.9513326, 18.0847087), 4326), '{"PTKT, P323"}', jsonb_build_object('te', 'పెదకోట'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedakota, Visakhapatnam', 'Pedakota పెదకోట PTKT, P323', ST_SetSRID(ST_MakePoint(82.9513326, 18.0847087), 4326), 40);
    END IF;
    -- Insert Borrapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Borrapalem', ST_SetSRID(ST_MakePoint(82.964915, 18.087439), 4326), '{"B614, BRPLM"}', jsonb_build_object('te', 'బొర్రపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Borrapalem, Visakhapatnam', 'Borrapalem బొర్రపాలెం B614, BRPLM', ST_SetSRID(ST_MakePoint(82.964915, 18.087439), 4326), 40);
    END IF;
    -- Insert Revallapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Revallapalem', ST_SetSRID(ST_MakePoint(82.9494866, 18.0178964), 4326), '{"RFLPLM, R141"}', jsonb_build_object('te', 'రేవళ్ళపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Revallapalem, Visakhapatnam', 'Revallapalem రేవళ్ళపాలెం RFLPLM, R141', ST_SetSRID(ST_MakePoint(82.9494866, 18.0178964), 4326), 10);
    END IF;
    -- Insert Kotha Revallapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotha Revallapalem', ST_SetSRID(ST_MakePoint(82.9487851, 18.0242695), 4326), '{"K0 RFLPLM, K361"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotha Revallapalem, Visakhapatnam', 'Kotha Revallapalem  K0 RFLPLM, K361', ST_SetSRID(ST_MakePoint(82.9487851, 18.0242695), 4326), 10);
    END IF;
    -- Insert Cheedigaruvu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cheedigaruvu', ST_SetSRID(ST_MakePoint(82.8862257, 18.0191698), 4326), '{"XTKRF, C326"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cheedigaruvu, Visakhapatnam', 'Cheedigaruvu  XTKRF, C326', ST_SetSRID(ST_MakePoint(82.8862257, 18.0191698), 4326), 10);
    END IF;
    -- Insert Tummalapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tummalapalem', ST_SetSRID(ST_MakePoint(82.8823325, 18.0061477), 4326), '{"T541, TMLPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tummalapalem, Visakhapatnam', 'Tummalapalem  T541, TMLPLM', ST_SetSRID(ST_MakePoint(82.8823325, 18.0061477), 4326), 10);
    END IF;
    -- Insert Madya Valabu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madya Valabu', ST_SetSRID(ST_MakePoint(82.8936362, 18.0080036), 4326), '{"M314, MTY FLB"}', jsonb_build_object('te', 'మధ్య వలాబు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madya Valabu, Visakhapatnam', 'Madya Valabu మధ్య వలాబు M314, MTY FLB', ST_SetSRID(ST_MakePoint(82.8936362, 18.0080036), 4326), 10);
    END IF;
    -- Insert Kusarlapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kusarlapalem', ST_SetSRID(ST_MakePoint(82.8141375, 17.9895272), 4326), '{"KSRLPLM, K264"}', jsonb_build_object('te', 'కుసర్లపాలెం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kusarlapalem, Visakhapatnam', 'Kusarlapalem కుసర్లపాలెం KSRLPLM, K264', ST_SetSRID(ST_MakePoint(82.8141375, 17.9895272), 4326), 10);
    END IF;
    -- Insert Parameshwaram Paradise (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Parameshwaram Paradise', ST_SetSRID(ST_MakePoint(83.5032968, 18.0343501), 4326), '{"P652, PRMXWRM PRTS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Parameshwaram Paradise, Visakhapatnam', 'Parameshwaram Paradise  P652, PRMXWRM PRTS', ST_SetSRID(ST_MakePoint(83.5032968, 18.0343501), 4326), 10);
    END IF;
    -- Insert Hosanna Tea Time (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hosanna Tea Time', ST_SetSRID(ST_MakePoint(82.8396601, 17.5483809), 4326), '{"HSN T TM, H253"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hosanna Tea Time, Visakhapatnam', 'Hosanna Tea Time  HSN T TM, H253', ST_SetSRID(ST_MakePoint(82.8396601, 17.5483809), 4326), 10);
    END IF;
    -- Insert Vintage Spices (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vintage Spices', ST_SetSRID(ST_MakePoint(83.3533741, 17.8026924), 4326), '{"FNTJ SPSS, V532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vintage Spices, Visakhapatnam', 'Vintage Spices  FNTJ SPSS, V532', ST_SetSRID(ST_MakePoint(83.3533741, 17.8026924), 4326), 10);
    END IF;
    -- Insert Vijayam School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijayam School', ST_SetSRID(ST_MakePoint(83.3524502, 17.8239752), 4326), '{"FJYM SXL, V252"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijayam School, Visakhapatnam', 'Vijayam School  FJYM SXL, V252', ST_SetSRID(ST_MakePoint(83.3524502, 17.8239752), 4326), 50);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.3478387, 17.8214257), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.3478387, 17.8214257), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.3550288, 17.8235553), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.3550288, 17.8235553), 4326), 10);
    END IF;
    -- Insert Daragedda (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Daragedda', ST_SetSRID(ST_MakePoint(82.8600752, 18.0944027), 4326), '{"TRJT, D623"}', jsonb_build_object('te', 'దారగెడ్డ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Daragedda, Visakhapatnam', 'Daragedda దారగెడ్డ TRJT, D623', ST_SetSRID(ST_MakePoint(82.8600752, 18.0944027), 4326), 10);
    END IF;
    -- Insert Ambedkarnagar (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ambedkarnagar', ST_SetSRID(ST_MakePoint(82.9089217, 17.5263648), 4326), '{"A513, AMBTKRNKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ambedkarnagar, Visakhapatnam', 'Ambedkarnagar  A513, AMBTKRNKR', ST_SetSRID(ST_MakePoint(82.9089217, 17.5263648), 4326), 40);
    END IF;
    -- Insert Sitapalem PF (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sitapalem PF', ST_SetSRID(ST_MakePoint(82.970938, 17.4703241), 4326), '{"STPLM PF, S314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sitapalem PF, Visakhapatnam', 'Sitapalem PF  STPLM PF, S314', ST_SetSRID(ST_MakePoint(82.970938, 17.4703241), 4326), 40);
    END IF;
    -- Insert Sitapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sitapalem', ST_SetSRID(ST_MakePoint(82.9793978, 17.477415), 4326), '{"STPLM, S314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sitapalem, Visakhapatnam', 'Sitapalem  STPLM, S314', ST_SetSRID(ST_MakePoint(82.9793978, 17.477415), 4326), 40);
    END IF;
    -- Insert Gorapudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gorapudi', ST_SetSRID(ST_MakePoint(82.952613, 17.4800938), 4326), '{"KRPT, G613"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gorapudi, Visakhapatnam', 'Gorapudi  KRPT, G613', ST_SetSRID(ST_MakePoint(82.952613, 17.4800938), 4326), 40);
    END IF;
    -- Insert Ramachandrapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramachandrapuram', ST_SetSRID(ST_MakePoint(82.9623021, 17.4865476), 4326), '{"RMXNTRPRM, R525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramachandrapuram, Visakhapatnam', 'Ramachandrapuram  RMXNTRPRM, R525', ST_SetSRID(ST_MakePoint(82.9623021, 17.4865476), 4326), 40);
    END IF;
    -- Insert Yatapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yatapalem', ST_SetSRID(ST_MakePoint(82.9664007, 17.4888481), 4326), '{"YTPLM, Y314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yatapalem, Visakhapatnam', 'Yatapalem  YTPLM, Y314', ST_SetSRID(ST_MakePoint(82.9664007, 17.4888481), 4326), 40);
    END IF;
    -- Insert Lalam Koduru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lalam Koduru', ST_SetSRID(ST_MakePoint(82.9614656, 17.4920301), 4326), '{"L452, LLM KTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lalam Koduru, Visakhapatnam', 'Lalam Koduru  L452, LLM KTR', ST_SetSRID(ST_MakePoint(82.9614656, 17.4920301), 4326), 40);
    END IF;
    -- Insert Kotta Lalamkoduru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotta Lalamkoduru', ST_SetSRID(ST_MakePoint(82.9774261, 17.4953511), 4326), '{"KT LLMKTR, K344"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotta Lalamkoduru, Visakhapatnam', 'Kotta Lalamkoduru  KT LLMKTR, K344', ST_SetSRID(ST_MakePoint(82.9774261, 17.4953511), 4326), 40);
    END IF;
    -- Insert A P Model School,Tegada (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'A P Model School,Tegada', ST_SetSRID(ST_MakePoint(82.9353145, 17.6417417), 4326), '{"A P MTL SXLTKT, A153"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'A P Model School,Tegada, Visakhapatnam', 'A P Model School,Tegada  A P MTL SXLTKT, A153', ST_SetSRID(ST_MakePoint(82.9353145, 17.6417417), 4326), 50);
    END IF;
    -- Insert KGBV school, Tegada (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'KGBV school, Tegada', ST_SetSRID(ST_MakePoint(82.9349009, 17.6412605), 4326), '{"KKBF SXL TKT, K124"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'KGBV school, Tegada, Visakhapatnam', 'KGBV school, Tegada  KKBF SXL TKT, K124', ST_SetSRID(ST_MakePoint(82.9349009, 17.6412605), 4326), 50);
    END IF;
    -- Insert Puligeddapalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Puligeddapalem', ST_SetSRID(ST_MakePoint(83.6097071, 18.0437924), 4326), '{"P423, PLJTPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Puligeddapalem, Visakhapatnam', 'Puligeddapalem  P423, PLJTPLM', ST_SetSRID(ST_MakePoint(83.6097071, 18.0437924), 4326), 40);
    END IF;
    -- Insert The Royal Biryani House (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Royal Biryani House', ST_SetSRID(ST_MakePoint(83.4050408, 18.0473271), 4326), '{"T641, 0 RYL BRYN HS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Royal Biryani House, Visakhapatnam', 'The Royal Biryani House  T641, 0 RYL BRYN HS', ST_SetSRID(ST_MakePoint(83.4050408, 18.0473271), 4326), 10);
    END IF;
    -- Insert Sri Krishna Grammar School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Krishna Grammar School', ST_SetSRID(ST_MakePoint(83.3296454, 17.7639754), 4326), '{"SR KRXN KRMR SXL, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Krishna Grammar School, Visakhapatnam', 'Sri Krishna Grammar School  SR KRXN KRMR SXL, S626', ST_SetSRID(ST_MakePoint(83.3296454, 17.7639754), 4326), 50);
    END IF;
    -- Insert Sree Arunodaya School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sree Arunodaya School', ST_SetSRID(ST_MakePoint(83.3309447, 17.7632507), 4326), '{"S665, SR ARNTY SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sree Arunodaya School, Visakhapatnam', 'Sree Arunodaya School  S665, SR ARNTY SXL', ST_SetSRID(ST_MakePoint(83.3309447, 17.7632507), 4326), 50);
    END IF;
    -- Insert Curry Point (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Curry Point', ST_SetSRID(ST_MakePoint(83.3308384, 17.763326), 4326), '{"KR PNT, C615"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Curry Point, Visakhapatnam', 'Curry Point  KR PNT, C615', ST_SetSRID(ST_MakePoint(83.3308384, 17.763326), 4326), 10);
    END IF;
    -- Insert Rambabu Curry Point (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rambabu Curry Point', ST_SetSRID(ST_MakePoint(83.4054004, 18.0491775), 4326), '{"R511, RMBB KR PNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rambabu Curry Point, Visakhapatnam', 'Rambabu Curry Point  R511, RMBB KR PNT', ST_SetSRID(ST_MakePoint(83.4054004, 18.0491775), 4326), 10);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.3238037, 17.7648849), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.3238037, 17.7648849), 4326), 10);
    END IF;
    -- Insert Sree krishna Grammar School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sree krishna Grammar School', ST_SetSRID(ST_MakePoint(83.3294722, 17.7637595), 4326), '{"SR KRXN KRMR SXL, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sree krishna Grammar School, Visakhapatnam', 'Sree krishna Grammar School  SR KRXN KRMR SXL, S626', ST_SetSRID(ST_MakePoint(83.3294722, 17.7637595), 4326), 50);
    END IF;
    -- Insert Sree Krishna Grammar School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sree Krishna Grammar School', ST_SetSRID(ST_MakePoint(83.3293192, 17.7656345), 4326), '{"SR KRXN KRMR SXL, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sree Krishna Grammar School, Visakhapatnam', 'Sree Krishna Grammar School  SR KRXN KRMR SXL, S626', ST_SetSRID(ST_MakePoint(83.3293192, 17.7656345), 4326), 50);
    END IF;
    -- Insert Sree Krishna Grammar School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sree Krishna Grammar School', ST_SetSRID(ST_MakePoint(83.3292387, 17.7654285), 4326), '{"SR KRXN KRMR SXL, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sree Krishna Grammar School, Visakhapatnam', 'Sree Krishna Grammar School  SR KRXN KRMR SXL, S626', ST_SetSRID(ST_MakePoint(83.3292387, 17.7654285), 4326), 50);
    END IF;
    -- Insert Aditya Degree College (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aditya Degree College', ST_SetSRID(ST_MakePoint(83.3172009, 17.7318803), 4326), '{"A333, ATTY TKR KLJ"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aditya Degree College, Visakhapatnam', 'Aditya Degree College  A333, ATTY TKR KLJ', ST_SetSRID(ST_MakePoint(83.3172009, 17.7318803), 4326), 50);
    END IF;
    -- Insert Kotha Marika (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotha Marika', ST_SetSRID(ST_MakePoint(83.0576567, 18.051352), 4326), '{"K0 MRK, K356"}', jsonb_build_object('te', 'కొత్త మారిక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotha Marika, Visakhapatnam', 'Kotha Marika కొత్త మారిక K0 MRK, K356', ST_SetSRID(ST_MakePoint(83.0576567, 18.051352), 4326), 10);
    END IF;
    -- Insert Marika (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Marika', ST_SetSRID(ST_MakePoint(83.0364009, 18.0453793), 4326), '{"M620, MRK"}', jsonb_build_object('te', 'మారిక'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Marika, Visakhapatnam', 'Marika మారిక M620, MRK', ST_SetSRID(ST_MakePoint(83.0364009, 18.0453793), 4326), 10);
    END IF;
    -- Insert Venkayyapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkayyapalem', ST_SetSRID(ST_MakePoint(83.0907385, 18.0446397), 4326), '{"V521, FNKYPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkayyapalem, Visakhapatnam', 'Venkayyapalem  V521, FNKYPLM', ST_SetSRID(ST_MakePoint(83.0907385, 18.0446397), 4326), 10);
    END IF;
    -- Insert Saravanipalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Saravanipalem', ST_SetSRID(ST_MakePoint(83.0701489, 18.0748002), 4326), '{"S615, SRFNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Saravanipalem, Visakhapatnam', 'Saravanipalem  S615, SRFNPLM', ST_SetSRID(ST_MakePoint(83.0701489, 18.0748002), 4326), 10);
    END IF;
    -- Insert Sangamvalasa (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sangamvalasa', ST_SetSRID(ST_MakePoint(83.066935, 18.0739177), 4326), '{"SNKMFLS, S525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sangamvalasa, Visakhapatnam', 'Sangamvalasa  SNKMFLS, S525', ST_SetSRID(ST_MakePoint(83.066935, 18.0739177), 4326), 10);
    END IF;
    -- Insert Kotayyagaruvu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotayyagaruvu', ST_SetSRID(ST_MakePoint(83.0537674, 18.0706445), 4326), '{"KTYKRF, K326"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotayyagaruvu, Visakhapatnam', 'Kotayyagaruvu  KTYKRF, K326', ST_SetSRID(ST_MakePoint(83.0537674, 18.0706445), 4326), 10);
    END IF;
    -- Insert Janardhan Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Janardhan Nagar', ST_SetSRID(ST_MakePoint(83.187057, 17.9077648), 4326), '{"JNRTHN NKR, J563"}', jsonb_build_object('te', 'జనార్ధన్ నగర్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Janardhan Nagar, Visakhapatnam', 'Janardhan Nagar జనార్ధన్ నగర్ JNRTHN NKR, J563', ST_SetSRID(ST_MakePoint(83.187057, 17.9077648), 4326), 60);
    END IF;
    -- Insert Sri Bhimas Hotel (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Bhimas Hotel', ST_SetSRID(ST_MakePoint(82.9333024, 17.6575615), 4326), '{"SR BHMS HTL, S615"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Bhimas Hotel, Visakhapatnam', 'Sri Bhimas Hotel  SR BHMS HTL, S615', ST_SetSRID(ST_MakePoint(82.9333024, 17.6575615), 4326), 10);
    END IF;
    -- Insert Bank of India (atm)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of India', ST_SetSRID(ST_MakePoint(83.2145751, 17.7851998), 4326), '{"BNK OF INT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of India, Visakhapatnam', 'Bank of India  BNK OF INT, B521', ST_SetSRID(ST_MakePoint(83.2145751, 17.7851998), 4326), 10);
    END IF;
    -- Insert Dronam Raju (Relli) Colony (locality)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dronam Raju (Relli) Colony', ST_SetSRID(ST_MakePoint(83.2087832, 17.8133388), 4326), '{"D655, TRNM RJ RL KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dronam Raju (Relli) Colony, Visakhapatnam', 'Dronam Raju (Relli) Colony  D655, TRNM RJ RL KLN', ST_SetSRID(ST_MakePoint(83.2087832, 17.8133388), 4326), 10);
    END IF;
    -- Insert India1 (atm)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'India1', ST_SetSRID(ST_MakePoint(83.2168151, 17.7759176), 4326), '{"INT, I530"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'India1, Visakhapatnam', 'India1  INT, I530', ST_SetSRID(ST_MakePoint(83.2168151, 17.7759176), 4326), 10);
    END IF;
    -- Insert Moghals Biryani House (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Moghals Biryani House', ST_SetSRID(ST_MakePoint(83.2072421, 17.811093), 4326), '{"MKHLS BRYN HS, M242"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Moghals Biryani House, Visakhapatnam', 'Moghals Biryani House  MKHLS BRYN HS, M242', ST_SetSRID(ST_MakePoint(83.2072421, 17.811093), 4326), 10);
    END IF;
    -- Insert Sai Clinic (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sai Clinic', ST_SetSRID(ST_MakePoint(83.2093877, 17.8046265), 4326), '{"S KLNK, S245"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sai Clinic, Visakhapatnam', 'Sai Clinic  S KLNK, S245', ST_SetSRID(ST_MakePoint(83.2093877, 17.8046265), 4326), 50);
    END IF;
    -- Insert Saadhana Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Saadhana Hospitals', ST_SetSRID(ST_MakePoint(83.2105594, 17.8009047), 4326), '{"STHN HSPTLS, S352"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Saadhana Hospitals, Visakhapatnam', 'Saadhana Hospitals  STHN HSPTLS, S352', ST_SetSRID(ST_MakePoint(83.2105594, 17.8009047), 4326), 50);
    END IF;
    -- Insert Kritunga (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kritunga', ST_SetSRID(ST_MakePoint(83.2095155, 17.8022346), 4326), '{"K635, KRTNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kritunga, Visakhapatnam', 'Kritunga  K635, KRTNK', ST_SetSRID(ST_MakePoint(83.2095155, 17.8022346), 4326), 10);
    END IF;
    -- Insert Ghumaghumalu (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ghumaghumalu', ST_SetSRID(ST_MakePoint(83.20959, 17.8019941), 4326), '{"KHMKHML, G525"}', jsonb_build_object('te', 'ఘుమఘుమలు'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ghumaghumalu, Visakhapatnam', 'Ghumaghumalu ఘుమఘుమలు KHMKHML, G525', ST_SetSRID(ST_MakePoint(83.20959, 17.8019941), 4326), 10);
    END IF;
    -- Insert Mayuri (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mayuri', ST_SetSRID(ST_MakePoint(83.2098346, 17.8007745), 4326), '{"M600, MYR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mayuri, Visakhapatnam', 'Mayuri  M600, MYR', ST_SetSRID(ST_MakePoint(83.2098346, 17.8007745), 4326), 10);
    END IF;
    -- Insert Surabhi Clinics (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Surabhi Clinics', ST_SetSRID(ST_MakePoint(83.2092659, 17.8032146), 4326), '{"SRBH KLNKS, S612"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Surabhi Clinics, Visakhapatnam', 'Surabhi Clinics  SRBH KLNKS, S612', ST_SetSRID(ST_MakePoint(83.2092659, 17.8032146), 4326), 50);
    END IF;
    -- Insert Hey Delicisus (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hey Delicisus', ST_SetSRID(ST_MakePoint(83.2093386, 17.8029816), 4326), '{"H342, H TLSSS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hey Delicisus, Visakhapatnam', 'Hey Delicisus  H342, H TLSSS', ST_SetSRID(ST_MakePoint(83.2093386, 17.8029816), 4326), 10);
    END IF;
    -- Insert The Maharaja Co-Op Urban Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Maharaja Co-Op Urban Bank', ST_SetSRID(ST_MakePoint(83.2092718, 17.8026681), 4326), '{"T562, 0 MHRJ KP URBN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Maharaja Co-Op Urban Bank, Visakhapatnam', 'The Maharaja Co-Op Urban Bank  T562, 0 MHRJ KP URBN BNK', ST_SetSRID(ST_MakePoint(83.2092718, 17.8026681), 4326), 10);
    END IF;
    -- Insert Sarat Chandras Speciality Clinic (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sarat Chandras Speciality Clinic', ST_SetSRID(ST_MakePoint(83.2094537, 17.8024276), 4326), '{"S632, SRT XNTRS SPXLT KLNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sarat Chandras Speciality Clinic, Visakhapatnam', 'Sarat Chandras Speciality Clinic  S632, SRT XNTRS SPXLT KLNK', ST_SetSRID(ST_MakePoint(83.2094537, 17.8024276), 4326), 50);
    END IF;
    -- Insert Cheemalapalle (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cheemalapalle', ST_SetSRID(ST_MakePoint(83.1995238, 17.7820733), 4326), '{"C541, XMLPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cheemalapalle, Visakhapatnam', 'Cheemalapalle  C541, XMLPL', ST_SetSRID(ST_MakePoint(83.1995238, 17.7820733), 4326), 10);
    END IF;
    -- Insert Lakshmipuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lakshmipuram', ST_SetSRID(ST_MakePoint(83.1982376, 17.787566), 4326), '{"L251, LKXMPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lakshmipuram, Visakhapatnam', 'Lakshmipuram  L251, LKXMPRM', ST_SetSRID(ST_MakePoint(83.1982376, 17.787566), 4326), 10);
    END IF;
    -- Insert Chintala Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chintala Agraharam', ST_SetSRID(ST_MakePoint(83.1915344, 17.7858187), 4326), '{"C534, XNTL AKRHRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chintala Agraharam, Visakhapatnam', 'Chintala Agraharam  C534, XNTL AKRHRM', ST_SetSRID(ST_MakePoint(83.1915344, 17.7858187), 4326), 40);
    END IF;
    -- Insert Venkatapuram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkatapuram', ST_SetSRID(ST_MakePoint(83.2057027, 17.7609974), 4326), '{"V523, FNKTPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkatapuram, Visakhapatnam', 'Venkatapuram  V523, FNKTPRM', ST_SetSRID(ST_MakePoint(83.2057027, 17.7609974), 4326), 60);
    END IF;
    -- Insert Doggavanipalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Doggavanipalem', ST_SetSRID(ST_MakePoint(83.2004378, 17.8138573), 4326), '{"TKFNPLM, D215"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Doggavanipalem, Visakhapatnam', 'Doggavanipalem  TKFNPLM, D215', ST_SetSRID(ST_MakePoint(83.2004378, 17.8138573), 4326), 60);
    END IF;
    -- Insert Sri Abhi Ruchi Family restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Abhi Ruchi Family restaurant', ST_SetSRID(ST_MakePoint(83.1853895, 17.8975134), 4326), '{"S616, SR ABH RX FML RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Abhi Ruchi Family restaurant, Visakhapatnam', 'Sri Abhi Ruchi Family restaurant  S616, SR ABH RX FML RSTRNT', ST_SetSRID(ST_MakePoint(83.1853895, 17.8975134), 4326), 10);
    END IF;
    -- Insert Ravi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ravi Nagar', ST_SetSRID(ST_MakePoint(83.2129262, 17.766515), 4326), '{"RF NKR, R152"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ravi Nagar, Visakhapatnam', 'Ravi Nagar  RF NKR, R152', ST_SetSRID(ST_MakePoint(83.2129262, 17.766515), 4326), 60);
    END IF;
    -- Insert Sunflower childrens clinic (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sunflower childrens clinic', ST_SetSRID(ST_MakePoint(83.185985, 17.8972279), 4326), '{"SNFLWR XLTRNS KLNK, S514"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sunflower childrens clinic, Visakhapatnam', 'Sunflower childrens clinic  SNFLWR XLTRNS KLNK, S514', ST_SetSRID(ST_MakePoint(83.185985, 17.8972279), 4326), 50);
    END IF;
    -- Insert Cheruvulopala (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cheruvulopala', ST_SetSRID(ST_MakePoint(83.2888073, 18.0220382), 4326), '{"C614, XRFLPL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cheruvulopala, Visakhapatnam', 'Cheruvulopala  C614, XRFLPL', ST_SetSRID(ST_MakePoint(83.2888073, 18.0220382), 4326), 10);
    END IF;
    -- Insert Kuddupalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kuddupalem', ST_SetSRID(ST_MakePoint(83.2444104, 17.9813358), 4326), '{"KTPLM, K314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kuddupalem, Visakhapatnam', 'Kuddupalem  KTPLM, K314', ST_SetSRID(ST_MakePoint(83.2444104, 17.9813358), 4326), 10);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.3022925, 17.7156106), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.3022925, 17.7156106), 4326), 10);
    END IF;
    -- Insert SCBC Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SCBC Colony', ST_SetSRID(ST_MakePoint(83.2041259, 17.8119371), 4326), '{"S122, SKBK KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SCBC Colony, Visakhapatnam', 'SCBC Colony  S122, SKBK KLN', ST_SetSRID(ST_MakePoint(83.2041259, 17.8119371), 4326), 60);
    END IF;
    -- Insert N.A.D.VUDA Layout (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'N.A.D.VUDA Layout', ST_SetSRID(ST_MakePoint(83.2069451, 17.7975658), 4326), '{"N313, NTFT LYT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'N.A.D.VUDA Layout, Visakhapatnam', 'N.A.D.VUDA Layout  N313, NTFT LYT', ST_SetSRID(ST_MakePoint(83.2069451, 17.7975658), 4326), 60);
    END IF;
    -- Insert Chinnamushidiwada (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinnamushidiwada', ST_SetSRID(ST_MakePoint(83.2050171, 17.8110119), 4326), '{"XNMXTWT, C552"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinnamushidiwada, Visakhapatnam', 'Chinnamushidiwada  XNMXTWT, C552', ST_SetSRID(ST_MakePoint(83.2050171, 17.8110119), 4326), 80);
    END IF;
    -- Insert Srinivas Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srinivas Nagar', ST_SetSRID(ST_MakePoint(83.2379673, 17.7709617), 4326), '{"SRNFS NKR, S651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srinivas Nagar, Visakhapatnam', 'Srinivas Nagar  SRNFS NKR, S651', ST_SetSRID(ST_MakePoint(83.2379673, 17.7709617), 4326), 60);
    END IF;
    -- Insert Sri Sai Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Sai Nagar', ST_SetSRID(ST_MakePoint(83.2447639, 17.7763335), 4326), '{"SR S NKR, S625"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Sai Nagar, Visakhapatnam', 'Sri Sai Nagar  SR S NKR, S625', ST_SetSRID(ST_MakePoint(83.2447639, 17.7763335), 4326), 60);
    END IF;
    -- Insert Old Adavivaram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Old Adavivaram', ST_SetSRID(ST_MakePoint(83.2500731, 17.7772814), 4326), '{"O433, OLT ATFFRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Old Adavivaram, Visakhapatnam', 'Old Adavivaram  O433, OLT ATFFRM', ST_SetSRID(ST_MakePoint(83.2500731, 17.7772814), 4326), 60);
    END IF;
    -- Insert Apppannapalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Apppannapalem', ST_SetSRID(ST_MakePoint(83.2225951, 17.7700098), 4326), '{"A151, APNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Apppannapalem, Visakhapatnam', 'Apppannapalem  A151, APNPLM', ST_SetSRID(ST_MakePoint(83.2225951, 17.7700098), 4326), 60);
    END IF;
    -- Insert Simhapuri Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simhapuri Colony', ST_SetSRID(ST_MakePoint(83.2264229, 17.7779869), 4326), '{"S516, SMHPR KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simhapuri Colony, Visakhapatnam', 'Simhapuri Colony  S516, SMHPR KLN', ST_SetSRID(ST_MakePoint(83.2264229, 17.7779869), 4326), 60);
    END IF;
    -- Insert Shipyard Layout (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Shipyard Layout', ST_SetSRID(ST_MakePoint(83.2345266, 17.777641), 4326), '{"XPYRT LYT, S163"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Shipyard Layout, Visakhapatnam', 'Shipyard Layout  XPYRT LYT, S163', ST_SetSRID(ST_MakePoint(83.2345266, 17.777641), 4326), 60);
    END IF;
    -- Insert Sai Madhava Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sai Madhava Nagar', ST_SetSRID(ST_MakePoint(83.2192706, 17.7722827), 4326), '{"S531, S MTHF NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sai Madhava Nagar, Visakhapatnam', 'Sai Madhava Nagar  S531, S MTHF NKR', ST_SetSRID(ST_MakePoint(83.2192706, 17.7722827), 4326), 60);
    END IF;
    -- Insert APHB Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'APHB Colony', ST_SetSRID(ST_MakePoint(83.3669381, 17.8083939), 4326), '{"A124, AFB KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'APHB Colony, Visakhapatnam', 'APHB Colony  A124, AFB KLN', ST_SetSRID(ST_MakePoint(83.3669381, 17.8083939), 4326), 60);
    END IF;
    -- Insert Vambay Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vambay Colony', ST_SetSRID(ST_MakePoint(83.3639053, 17.8146938), 4326), '{"V512, FMB KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vambay Colony, Visakhapatnam', 'Vambay Colony  V512, FMB KLN', ST_SetSRID(ST_MakePoint(83.3639053, 17.8146938), 4326), 60);
    END IF;
    -- Insert Dharampuri Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dharampuri Colony', ST_SetSRID(ST_MakePoint(83.360911, 17.8014313), 4326), '{"THRMPR KLN, D651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dharampuri Colony, Visakhapatnam', 'Dharampuri Colony  THRMPR KLN, D651', ST_SetSRID(ST_MakePoint(83.360911, 17.8014313), 4326), 60);
    END IF;
    -- Insert Vasundhara Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vasundhara Nagar', ST_SetSRID(ST_MakePoint(83.3586994, 17.7963299), 4326), '{"V253, FSNTHR NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vasundhara Nagar, Visakhapatnam', 'Vasundhara Nagar  V253, FSNTHR NKR', ST_SetSRID(ST_MakePoint(83.3586994, 17.7963299), 4326), 60);
    END IF;
    -- Insert Chanakyapuri Layout (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chanakyapuri Layout', ST_SetSRID(ST_MakePoint(83.3563217, 17.796087), 4326), '{"XNKYPR LYT, C521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chanakyapuri Layout, Visakhapatnam', 'Chanakyapuri Layout  XNKYPR LYT, C521', ST_SetSRID(ST_MakePoint(83.3563217, 17.796087), 4326), 60);
    END IF;
    -- Insert Taraka Rama Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Taraka Rama Nagar', ST_SetSRID(ST_MakePoint(83.3538029, 17.7998964), 4326), '{"TRK RM NKR, T626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Taraka Rama Nagar, Visakhapatnam', 'Taraka Rama Nagar  TRK RM NKR, T626', ST_SetSRID(ST_MakePoint(83.3538029, 17.7998964), 4326), 60);
    END IF;
    -- Insert Sundar Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sundar Nagar', ST_SetSRID(ST_MakePoint(83.3577635, 17.7973072), 4326), '{"SNTR NKR, S536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sundar Nagar, Visakhapatnam', 'Sundar Nagar  SNTR NKR, S536', ST_SetSRID(ST_MakePoint(83.3577635, 17.7973072), 4326), 60);
    END IF;
    -- Insert Bindra Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bindra Nagar', ST_SetSRID(ST_MakePoint(83.3564601, 17.8020396), 4326), '{"B536, BNTR NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bindra Nagar, Visakhapatnam', 'Bindra Nagar  B536, BNTR NKR', ST_SetSRID(ST_MakePoint(83.3564601, 17.8020396), 4326), 60);
    END IF;
    -- Insert Midhilapuri VUDA Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Midhilapuri VUDA Colony', ST_SetSRID(ST_MakePoint(83.3635608, 17.8049549), 4326), '{"M341, MTHLPR FT KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Midhilapuri VUDA Colony, Visakhapatnam', 'Midhilapuri VUDA Colony  M341, MTHLPR FT KLN', ST_SetSRID(ST_MakePoint(83.3635608, 17.8049549), 4326), 60);
    END IF;
    -- Insert YSR Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'YSR Nagar', ST_SetSRID(ST_MakePoint(83.3660829, 17.8276551), 4326), '{"Y265, SR NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'YSR Nagar, Visakhapatnam', 'YSR Nagar  Y265, SR NKR', ST_SetSRID(ST_MakePoint(83.3660829, 17.8276551), 4326), 60);
    END IF;
    -- Insert Carpenters Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Carpenters Colony', ST_SetSRID(ST_MakePoint(83.3604684, 17.8264812), 4326), '{"C615, KRPNTRS KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Carpenters Colony, Visakhapatnam', 'Carpenters Colony  C615, KRPNTRS KLN', ST_SetSRID(ST_MakePoint(83.3604684, 17.8264812), 4326), 60);
    END IF;
    -- Insert Kommadi Junction (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kommadi Junction', ST_SetSRID(ST_MakePoint(83.3558155, 17.8249016), 4326), '{"KMT JNKXN, K532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kommadi Junction, Visakhapatnam', 'Kommadi Junction  KMT JNKXN, K532', ST_SetSRID(ST_MakePoint(83.3558155, 17.8249016), 4326), 60);
    END IF;
    -- Insert AP Housing Board Apartments (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'AP Housing Board Apartments', ST_SetSRID(ST_MakePoint(83.3470394, 17.8285836), 4326), '{"AP HSNK BRT APRTMNTS, A125"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'AP Housing Board Apartments, Visakhapatnam', 'AP Housing Board Apartments  AP HSNK BRT APRTMNTS, A125', ST_SetSRID(ST_MakePoint(83.3470394, 17.8285836), 4326), 60);
    END IF;
    -- Insert Rajiv Gruha Kalpa Housing Complex (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rajiv Gruha Kalpa Housing Complex', ST_SetSRID(ST_MakePoint(83.3452292, 17.830686), 4326), '{"R212, RJF KRH KLP HSNK KMPLKS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rajiv Gruha Kalpa Housing Complex, Visakhapatnam', 'Rajiv Gruha Kalpa Housing Complex  R212, RJF KRH KLP HSNK KMPLKS', ST_SetSRID(ST_MakePoint(83.3452292, 17.830686), 4326), 60);
    END IF;
    -- Insert R.H.Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'R.H.Colony', ST_SetSRID(ST_MakePoint(83.3437449, 17.8016881), 4326), '{"R245, RHKLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'R.H.Colony, Visakhapatnam', 'R.H.Colony  R245, RHKLN', ST_SetSRID(ST_MakePoint(83.3437449, 17.8016881), 4326), 60);
    END IF;
    -- Insert Gayatri Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gayatri Nagar', ST_SetSRID(ST_MakePoint(83.348832, 17.8055642), 4326), '{"G365, KYTR NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gayatri Nagar, Visakhapatnam', 'Gayatri Nagar  G365, KYTR NKR', ST_SetSRID(ST_MakePoint(83.348832, 17.8055642), 4326), 60);
    END IF;
    -- Insert SBI Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SBI Colony', ST_SetSRID(ST_MakePoint(83.3466619, 17.8056161), 4326), '{"S124, SB KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SBI Colony, Visakhapatnam', 'SBI Colony  S124, SB KLN', ST_SetSRID(ST_MakePoint(83.3466619, 17.8056161), 4326), 60);
    END IF;
    -- Insert Madhurawada (town)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madhurawada', ST_SetSRID(ST_MakePoint(83.3540167, 17.8102465), 4326), '{"M363, MTHRWT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madhurawada, Visakhapatnam', 'Madhurawada  M363, MTHRWT', ST_SetSRID(ST_MakePoint(83.3540167, 17.8102465), 4326), 10);
    END IF;
    -- Insert Priyadarshini Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Priyadarshini Colony', ST_SetSRID(ST_MakePoint(83.3608873, 17.8186929), 4326), '{"P636, PRYTRXN KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Priyadarshini Colony, Visakhapatnam', 'Priyadarshini Colony  P636, PRYTRXN KLN', ST_SetSRID(ST_MakePoint(83.3608873, 17.8186929), 4326), 60);
    END IF;
    -- Insert Vikalangula Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vikalangula Colony', ST_SetSRID(ST_MakePoint(83.358705, 17.8246551), 4326), '{"V245, FKLNKL KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vikalangula Colony, Visakhapatnam', 'Vikalangula Colony  V245, FKLNKL KLN', ST_SetSRID(ST_MakePoint(83.358705, 17.8246551), 4326), 60);
    END IF;
    -- Insert Sivasakthi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sivasakthi Nagar', ST_SetSRID(ST_MakePoint(83.3694108, 17.8248419), 4326), '{"S122, SFSK0 NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sivasakthi Nagar, Visakhapatnam', 'Sivasakthi Nagar  S122, SFSK0 NKR', ST_SetSRID(ST_MakePoint(83.3694108, 17.8248419), 4326), 60);
    END IF;
    -- Insert Ayodhyanagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ayodhyanagar', ST_SetSRID(ST_MakePoint(83.3689102, 17.8207213), 4326), '{"A352, AYTHYNKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ayodhyanagar, Visakhapatnam', 'Ayodhyanagar  A352, AYTHYNKR', ST_SetSRID(ST_MakePoint(83.3689102, 17.8207213), 4326), 60);
    END IF;
    -- Insert Kala Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kala Nagar', ST_SetSRID(ST_MakePoint(83.3499705, 17.8219426), 4326), '{"K452, KL NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kala Nagar, Visakhapatnam', 'Kala Nagar  K452, KL NKR', ST_SetSRID(ST_MakePoint(83.3499705, 17.8219426), 4326), 60);
    END IF;
    -- Insert Gandhi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gandhi Nagar', ST_SetSRID(ST_MakePoint(83.3463377, 17.8244414), 4326), '{"KNTH NKR, G535"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gandhi Nagar, Visakhapatnam', 'Gandhi Nagar  KNTH NKR, G535', ST_SetSRID(ST_MakePoint(83.3463377, 17.8244414), 4326), 60);
    END IF;
    -- Insert Sector 2 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 2', ST_SetSRID(ST_MakePoint(83.3509226, 17.8281442), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 2, Visakhapatnam', 'Sector 2  SKTR , S236', ST_SetSRID(ST_MakePoint(83.3509226, 17.8281442), 4326), 60);
    END IF;
    -- Insert Amaravati Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amaravati Nagar', ST_SetSRID(ST_MakePoint(83.3343272, 17.8358699), 4326), '{"AMRFT NKR, A561"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amaravati Nagar, Visakhapatnam', 'Amaravati Nagar  AMRFT NKR, A561', ST_SetSRID(ST_MakePoint(83.3343272, 17.8358699), 4326), 60);
    END IF;
    -- Insert Carshed Junction (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Carshed Junction', ST_SetSRID(ST_MakePoint(83.3527158, 17.8040739), 4326), '{"C623, KRXT JNKXN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Carshed Junction, Visakhapatnam', 'Carshed Junction  C623, KRXT JNKXN', ST_SetSRID(ST_MakePoint(83.3527158, 17.8040739), 4326), 60);
    END IF;
    -- Insert Kamala Nagar Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kamala Nagar Colony', ST_SetSRID(ST_MakePoint(83.3586629, 17.8508899), 4326), '{"KML NKR KLN, K545"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kamala Nagar Colony, Visakhapatnam', 'Kamala Nagar Colony  KML NKR KLN, K545', ST_SetSRID(ST_MakePoint(83.3586629, 17.8508899), 4326), 60);
    END IF;
    -- Insert Kottavuru (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kottavuru', ST_SetSRID(ST_MakePoint(83.2487357, 18.0989656), 4326), '{"K316, KTFR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kottavuru, Visakhapatnam', 'Kottavuru  K316, KTFR', ST_SetSRID(ST_MakePoint(83.2487357, 18.0989656), 4326), 40);
    END IF;
    -- Insert Venkojipalem (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Venkojipalem', ST_SetSRID(ST_MakePoint(83.3291552, 17.7478386), 4326), '{"FNKJPLM, V522"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Venkojipalem, Visakhapatnam', 'Venkojipalem  FNKJPLM, V522', ST_SetSRID(ST_MakePoint(83.3291552, 17.7478386), 4326), 80);
    END IF;
    -- Insert Hanumanthuwaka Junction (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hanumanthuwaka Junction', ST_SetSRID(ST_MakePoint(83.3323081, 17.7549595), 4326), '{"HNMN0WK JNKXN, H555"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hanumanthuwaka Junction, Visakhapatnam', 'Hanumanthuwaka Junction  HNMN0WK JNKXN, H555', ST_SetSRID(ST_MakePoint(83.3323081, 17.7549595), 4326), 60);
    END IF;
    -- Insert Hanumanthuwaka (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hanumanthuwaka', ST_SetSRID(ST_MakePoint(83.330101, 17.7604124), 4326), '{"HNMN0WK, H555"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hanumanthuwaka, Visakhapatnam', 'Hanumanthuwaka  HNMN0WK, H555', ST_SetSRID(ST_MakePoint(83.330101, 17.7604124), 4326), 80);
    END IF;
    -- Insert Kailasagiri (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kailasagiri', ST_SetSRID(ST_MakePoint(83.3396922, 17.7499572), 4326), '{"K422, KLSJR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kailasagiri, Visakhapatnam', 'Kailasagiri  K422, KLSJR', ST_SetSRID(ST_MakePoint(83.3396922, 17.7499572), 4326), 60);
    END IF;
    -- Insert Dwaraka Nagar (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dwaraka Nagar', ST_SetSRID(ST_MakePoint(83.3092963, 17.7285947), 4326), '{"TWRK NKR, D625"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dwaraka Nagar, Visakhapatnam', 'Dwaraka Nagar  TWRK NKR, D625', ST_SetSRID(ST_MakePoint(83.3092963, 17.7285947), 4326), 80);
    END IF;
    -- Insert Jagadamba Junction (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jagadamba Junction', ST_SetSRID(ST_MakePoint(83.3030038, 17.7123784), 4326), '{"JKTMB JNKXN, J235"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jagadamba Junction, Visakhapatnam', 'Jagadamba Junction  JKTMB JNKXN, J235', ST_SetSRID(ST_MakePoint(83.3030038, 17.7123784), 4326), 60);
    END IF;
    -- Insert Purna Market (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Purna Market', ST_SetSRID(ST_MakePoint(83.2970453, 17.7093575), 4326), '{"P655, PRN MRKT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Purna Market, Visakhapatnam', 'Purna Market  P655, PRN MRKT', ST_SetSRID(ST_MakePoint(83.2970453, 17.7093575), 4326), 60);
    END IF;
    -- Insert Old Post Office Area (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Old Post Office Area', ST_SetSRID(ST_MakePoint(83.292072, 17.6942369), 4326), '{"OLT PST OFS AR, O431"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Old Post Office Area, Visakhapatnam', 'Old Post Office Area  OLT PST OFS AR, O431', ST_SetSRID(ST_MakePoint(83.292072, 17.6942369), 4326), 80);
    END IF;
    -- Insert One Town (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'One Town', ST_SetSRID(ST_MakePoint(83.2940245, 17.6973752), 4326), '{"O535, ON TN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'One Town, Visakhapatnam', 'One Town  O535, ON TN', ST_SetSRID(ST_MakePoint(83.2940245, 17.6973752), 4326), 60);
    END IF;
    -- Insert Siripuram Junction (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Siripuram Junction', ST_SetSRID(ST_MakePoint(83.3179482, 17.7231385), 4326), '{"S616, SRPRM JNKXN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Siripuram Junction, Visakhapatnam', 'Siripuram Junction  S616, SRPRM JNKXN', ST_SetSRID(ST_MakePoint(83.3179482, 17.7231385), 4326), 80);
    END IF;
    -- Insert Railway New Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Railway New Colony', ST_SetSRID(ST_MakePoint(83.2940271, 17.7245419), 4326), '{"R452, RLW N KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Railway New Colony, Visakhapatnam', 'Railway New Colony  R452, RLW N KLN', ST_SetSRID(ST_MakePoint(83.2940271, 17.7245419), 4326), 60);
    END IF;
    -- Insert Thatichetlapalem (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Thatichetlapalem', ST_SetSRID(ST_MakePoint(83.2924808, 17.7357588), 4326), '{"0TXTLPLM, T323"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Thatichetlapalem, Visakhapatnam', 'Thatichetlapalem  0TXTLPLM, T323', ST_SetSRID(ST_MakePoint(83.2924808, 17.7357588), 4326), 80);
    END IF;
    -- Insert Boyapalem (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Boyapalem', ST_SetSRID(ST_MakePoint(83.2842431, 17.7315878), 4326), '{"BYPLM, B145"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Boyapalem, Visakhapatnam', 'Boyapalem  BYPLM, B145', ST_SetSRID(ST_MakePoint(83.2842431, 17.7315878), 4326), 80);
    END IF;
    -- Insert Kancharapalem (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kancharapalem', ST_SetSRID(ST_MakePoint(83.2702758, 17.7368418), 4326), '{"KNXRPLM, K526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kancharapalem, Visakhapatnam', 'Kancharapalem  KNXRPLM, K526', ST_SetSRID(ST_MakePoint(83.2702758, 17.7368418), 4326), 80);
    END IF;
    -- Insert L.B Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'L.B Nagar', ST_SetSRID(ST_MakePoint(83.2733161, 17.7409366), 4326), '{"L152, LB NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'L.B Nagar, Visakhapatnam', 'L.B Nagar  L152, LB NKR', ST_SetSRID(ST_MakePoint(83.2733161, 17.7409366), 4326), 60);
    END IF;
    -- Insert NAD Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'NAD Colony', ST_SetSRID(ST_MakePoint(83.2340851, 17.7363584), 4326), '{"N324, NT KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'NAD Colony, Visakhapatnam', 'NAD Colony  N324, NT KLN', ST_SetSRID(ST_MakePoint(83.2340851, 17.7363584), 4326), 60);
    END IF;
    -- Insert Rural Gopalapatnam (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rural Gopalapatnam', ST_SetSRID(ST_MakePoint(83.2061062, 17.7184519), 4326), '{"R642, RRL KPLPTNM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rural Gopalapatnam, Visakhapatnam', 'Rural Gopalapatnam  R642, RRL KPLPTNM', ST_SetSRID(ST_MakePoint(83.2061062, 17.7184519), 4326), 60);
    END IF;
    -- Insert Sheela Nagar (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sheela Nagar', ST_SetSRID(ST_MakePoint(83.2019398, 17.7203448), 4326), '{"XL NKR, S452"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sheela Nagar, Visakhapatnam', 'Sheela Nagar  XL NKR, S452', ST_SetSRID(ST_MakePoint(83.2019398, 17.7203448), 4326), 80);
    END IF;
    -- Insert Auto Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Auto Nagar', ST_SetSRID(ST_MakePoint(83.1867562, 17.6911791), 4326), '{"A352, AT NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Auto Nagar, Visakhapatnam', 'Auto Nagar  A352, AT NKR', ST_SetSRID(ST_MakePoint(83.1867562, 17.6911791), 4326), 60);
    END IF;
    -- Insert New Gajuwaka (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'New Gajuwaka', ST_SetSRID(ST_MakePoint(83.2118695, 17.6907692), 4326), '{"N222, N KJWK, Old Gajuwaka, New Gajuwaka"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'New Gajuwaka, Visakhapatnam', 'New Gajuwaka  N222, N KJWK, Old Gajuwaka, New Gajuwaka', ST_SetSRID(ST_MakePoint(83.2118695, 17.6907692), 4326), 80);
    END IF;
    -- Insert Kunchamamba Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kunchamamba Colony', ST_SetSRID(ST_MakePoint(83.1943481, 17.6878044), 4326), '{"K525, KNXMMB KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kunchamamba Colony, Visakhapatnam', 'Kunchamamba Colony  K525, KNXMMB KLN', ST_SetSRID(ST_MakePoint(83.1943481, 17.6878044), 4326), 60);
    END IF;
    -- Insert Vinayaka Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vinayaka Nagar', ST_SetSRID(ST_MakePoint(83.1972633, 17.6750267), 4326), '{"FNYK NKR, V525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vinayaka Nagar, Visakhapatnam', 'Vinayaka Nagar  FNYK NKR, V525', ST_SetSRID(ST_MakePoint(83.1972633, 17.6750267), 4326), 60);
    END IF;
    -- Insert Kurmannapalem (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kurmannapalem', ST_SetSRID(ST_MakePoint(83.1694567, 17.6866692), 4326), '{"K655, KRMNPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kurmannapalem, Visakhapatnam', 'Kurmannapalem  K655, KRMNPLM', ST_SetSRID(ST_MakePoint(83.1694567, 17.6866692), 4326), 80);
    END IF;
    -- Insert Duvvada (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Duvvada', ST_SetSRID(ST_MakePoint(83.1549844, 17.7006884), 4326), '{"TFT, D130"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Duvvada, Visakhapatnam', 'Duvvada  TFT, D130', ST_SetSRID(ST_MakePoint(83.1549844, 17.7006884), 4326), 80);
    END IF;
    -- Insert Jabili Hills (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jabili Hills', ST_SetSRID(ST_MakePoint(83.1395495, 17.6833392), 4326), '{"JBL HLS, J144"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jabili Hills, Visakhapatnam', 'Jabili Hills  JBL HLS, J144', ST_SetSRID(ST_MakePoint(83.1395495, 17.6833392), 4326), 60);
    END IF;
    -- Insert Gangavaram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gangavaram', ST_SetSRID(ST_MakePoint(83.0994126, 17.6896692), 4326), '{"KNKFRM, G521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gangavaram, Visakhapatnam', 'Gangavaram  KNKFRM, G521', ST_SetSRID(ST_MakePoint(83.0994126, 17.6896692), 4326), 60);
    END IF;
    -- Insert Mantripalem Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mantripalem Colony', ST_SetSRID(ST_MakePoint(83.0933653, 17.697962), 4326), '{"MNTRPLM KLN, M536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mantripalem Colony, Visakhapatnam', 'Mantripalem Colony  MNTRPLM KLN, M536', ST_SetSRID(ST_MakePoint(83.0933653, 17.697962), 4326), 60);
    END IF;
    -- Insert Sri Ram Nagar colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Ram Nagar colony', ST_SetSRID(ST_MakePoint(83.1029495, 17.6911735), 4326), '{"S665, SR RM NKR KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Ram Nagar colony, Visakhapatnam', 'Sri Ram Nagar colony  S665, SR RM NKR KLN', ST_SetSRID(ST_MakePoint(83.1029495, 17.6911735), 4326), 60);
    END IF;
    -- Insert Vinayaka Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vinayaka Nagar', ST_SetSRID(ST_MakePoint(83.1149198, 17.6972447), 4326), '{"FNYK NKR, V525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vinayaka Nagar, Visakhapatnam', 'Vinayaka Nagar  FNYK NKR, V525', ST_SetSRID(ST_MakePoint(83.1149198, 17.6972447), 4326), 60);
    END IF;
    -- Insert Adavivaram (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Adavivaram', ST_SetSRID(ST_MakePoint(83.2659484, 17.7821934), 4326), '{"ATFFRM, A311"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Adavivaram, Visakhapatnam', 'Adavivaram  ATFFRM, A311', ST_SetSRID(ST_MakePoint(83.2659484, 17.7821934), 4326), 80);
    END IF;
    -- Insert Vizinigiripalem (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vizinigiripalem', ST_SetSRID(ST_MakePoint(83.2439123, 17.7883022), 4326), '{"FSNJRPLM, V252"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vizinigiripalem, Visakhapatnam', 'Vizinigiripalem  FSNJRPLM, V252', ST_SetSRID(ST_MakePoint(83.2439123, 17.7883022), 4326), 40);
    END IF;
    -- Insert Srikrishnapuram (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srikrishnapuram', ST_SetSRID(ST_MakePoint(83.2779004, 17.7735867), 4326), '{"SRKRXNPRM, S626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srikrishnapuram, Visakhapatnam', 'Srikrishnapuram  SRKRXNPRM, S626', ST_SetSRID(ST_MakePoint(83.2779004, 17.7735867), 4326), 40);
    END IF;
    -- Insert Arilova Colony (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Arilova Colony', ST_SetSRID(ST_MakePoint(83.3076725, 17.7682065), 4326), '{"ARLF KLN, A641"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Arilova Colony, Visakhapatnam', 'Arilova Colony  ARLF KLN, A641', ST_SetSRID(ST_MakePoint(83.3076725, 17.7682065), 4326), 80);
    END IF;
    -- Insert Vijaya Durga Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijaya Durga Colony', ST_SetSRID(ST_MakePoint(83.3208373, 17.7585322), 4326), '{"FJY TRK KLN, V236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijaya Durga Colony, Visakhapatnam', 'Vijaya Durga Colony  FJY TRK KLN, V236', ST_SetSRID(ST_MakePoint(83.3208373, 17.7585322), 4326), 60);
    END IF;
    -- Insert SIG Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SIG Nagar', ST_SetSRID(ST_MakePoint(83.3248463, 17.7652324), 4326), '{"SK NKR, S252"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SIG Nagar, Visakhapatnam', 'SIG Nagar  SK NKR, S252', ST_SetSRID(ST_MakePoint(83.3248463, 17.7652324), 4326), 60);
    END IF;
    -- Insert BNR Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'BNR Nagar', ST_SetSRID(ST_MakePoint(83.3234445, 17.7633609), 4326), '{"B565, BNR NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'BNR Nagar, Visakhapatnam', 'BNR Nagar  B565, BNR NKR', ST_SetSRID(ST_MakePoint(83.3234445, 17.7633609), 4326), 60);
    END IF;
    -- Insert Sagar Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sagar Nagar', ST_SetSRID(ST_MakePoint(83.3580536, 17.7671495), 4326), '{"SKR NKR, S265"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sagar Nagar, Visakhapatnam', 'Sagar Nagar  SKR NKR, S265', ST_SetSRID(ST_MakePoint(83.3580536, 17.7671495), 4326), 60);
    END IF;
    -- Insert Mubarak Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mubarak Colony', ST_SetSRID(ST_MakePoint(83.3668902, 17.7798044), 4326), '{"M162, MBRK KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mubarak Colony, Visakhapatnam', 'Mubarak Colony  M162, MBRK KLN', ST_SetSRID(ST_MakePoint(83.3668902, 17.7798044), 4326), 60);
    END IF;
    -- Insert Srinivasa Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srinivasa Nagar', ST_SetSRID(ST_MakePoint(83.364605, 17.7789679), 4326), '{"SRNFS NKR, S651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srinivasa Nagar, Visakhapatnam', 'Srinivasa Nagar  SRNFS NKR, S651', ST_SetSRID(ST_MakePoint(83.364605, 17.7789679), 4326), 60);
    END IF;
    -- Insert SC Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'SC Colony', ST_SetSRID(ST_MakePoint(83.3618516, 17.7835947), 4326), '{"S245, SK KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'SC Colony, Visakhapatnam', 'SC Colony  S245, SK KLN', ST_SetSRID(ST_MakePoint(83.3618516, 17.7835947), 4326), 60);
    END IF;
    -- Insert Pedda Rushikonda (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Rushikonda', ST_SetSRID(ST_MakePoint(83.3891224, 17.8013229), 4326), '{"P362, PT RXKNT, Rushikonda Beach, Rushikonda Hills"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Rushikonda, Visakhapatnam', 'Pedda Rushikonda  P362, PT RXKNT, Rushikonda Beach, Rushikonda Hills', ST_SetSRID(ST_MakePoint(83.3891224, 17.8013229), 4326), 80);
    END IF;
    -- Insert Mangamari Peta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Mangamari Peta', ST_SetSRID(ST_MakePoint(83.4109354, 17.8348795), 4326), '{"MNKMR PT, M525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Mangamari Peta, Visakhapatnam', 'Mangamari Peta  MNKMR PT, M525', ST_SetSRID(ST_MakePoint(83.4109354, 17.8348795), 4326), 40);
    END IF;
    -- Insert Varahagiri Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Varahagiri Colony', ST_SetSRID(ST_MakePoint(83.4217572, 17.9203573), 4326), '{"FRHJR KLN, V626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Varahagiri Colony, Visakhapatnam', 'Varahagiri Colony  FRHJR KLN, V626', ST_SetSRID(ST_MakePoint(83.4217572, 17.9203573), 4326), 60);
    END IF;
    -- Insert BC Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'BC Colony', ST_SetSRID(ST_MakePoint(83.3871052, 18.0947131), 4326), '{"B224, BK KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'BC Colony, Visakhapatnam', 'BC Colony  B224, BK KLN', ST_SetSRID(ST_MakePoint(83.3871052, 18.0947131), 4326), 60);
    END IF;
    -- Insert Gandhi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gandhi Nagar', ST_SetSRID(ST_MakePoint(83.3892491, 18.0976123), 4326), '{"KNTH NKR, G535"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gandhi Nagar, Visakhapatnam', 'Gandhi Nagar  KNTH NKR, G535', ST_SetSRID(ST_MakePoint(83.3892491, 18.0976123), 4326), 60);
    END IF;
    -- Insert Akkayyapalem (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Akkayyapalem', ST_SetSRID(ST_MakePoint(83.2991551, 17.7381861), 4326), '{"AKYPLM, A214"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Akkayyapalem, Visakhapatnam', 'Akkayyapalem  AKYPLM, A214', ST_SetSRID(ST_MakePoint(83.2991551, 17.7381861), 4326), 80);
    END IF;
    -- Insert Abid Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Abid Nagar', ST_SetSRID(ST_MakePoint(83.298817, 17.7395975), 4326), '{"A135, ABT NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Abid Nagar, Visakhapatnam', 'Abid Nagar  A135, ABT NKR', ST_SetSRID(ST_MakePoint(83.298817, 17.7395975), 4326), 60);
    END IF;
    -- Insert Narasimha Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narasimha Nagar', ST_SetSRID(ST_MakePoint(83.2950329, 17.7381721), 4326), '{"N625, NRSMH NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narasimha Nagar, Visakhapatnam', 'Narasimha Nagar  N625, NRSMH NKR', ST_SetSRID(ST_MakePoint(83.2950329, 17.7381721), 4326), 60);
    END IF;
    -- Insert Andhra Kesari Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Andhra Kesari Nagar', ST_SetSRID(ST_MakePoint(83.245017, 17.7448432), 4326), '{"ANTHR KSR NKR, A536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Andhra Kesari Nagar, Visakhapatnam', 'Andhra Kesari Nagar  ANTHR KSR NKR, A536', ST_SetSRID(ST_MakePoint(83.245017, 17.7448432), 4326), 60);
    END IF;
    -- Insert Netaji Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Netaji Colony', ST_SetSRID(ST_MakePoint(83.2407785, 17.7458785), 4326), '{"NTJ KLN, N322"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Netaji Colony, Visakhapatnam', 'Netaji Colony  NTJ KLN, N322', ST_SetSRID(ST_MakePoint(83.2407785, 17.7458785), 4326), 60);
    END IF;
    -- Insert Madhavadhara (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Madhavadhara', ST_SetSRID(ST_MakePoint(83.2592912, 17.747455), 4326), '{"M313, MTHFTHR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Madhavadhara, Visakhapatnam', 'Madhavadhara  M313, MTHFTHR', ST_SetSRID(ST_MakePoint(83.2592912, 17.747455), 4326), 80);
    END IF;
    -- Insert Seethammadara (suburb)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Seethammadara', ST_SetSRID(ST_MakePoint(83.3063183, 17.7433159), 4326), '{"S353, S0MTR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Seethammadara, Visakhapatnam', 'Seethammadara  S353, S0MTR', ST_SetSRID(ST_MakePoint(83.3063183, 17.7433159), 4326), 80);
    END IF;
    -- Insert H B Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'H B Colony', ST_SetSRID(ST_MakePoint(83.3252973, 17.7459884), 4326), '{"H124, H B KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'H B Colony, Visakhapatnam', 'H B Colony  H124, H B KLN', ST_SetSRID(ST_MakePoint(83.3252973, 17.7459884), 4326), 60);
    END IF;
    -- Insert Bhanu Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhanu Nagar', ST_SetSRID(ST_MakePoint(83.3229084, 17.7447861), 4326), '{"B552, BHN NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhanu Nagar, Visakhapatnam', 'Bhanu Nagar  B552, BHN NKR', ST_SetSRID(ST_MakePoint(83.3229084, 17.7447861), 4326), 60);
    END IF;
    -- Insert KRM Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'KRM Colony', ST_SetSRID(ST_MakePoint(83.3176549, 17.7429152), 4326), '{"K652, KRM KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'KRM Colony, Visakhapatnam', 'KRM Colony  K652, KRM KLN', ST_SetSRID(ST_MakePoint(83.3176549, 17.7429152), 4326), 60);
    END IF;
    -- Insert MMTC Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'MMTC Colony', ST_SetSRID(ST_MakePoint(83.3181571, 17.7462497), 4326), '{"M322, MTK KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'MMTC Colony, Visakhapatnam', 'MMTC Colony  M322, MTK KLN', ST_SetSRID(ST_MakePoint(83.3181571, 17.7462497), 4326), 60);
    END IF;
    -- Insert NE Layout (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'NE Layout', ST_SetSRID(ST_MakePoint(83.3108498, 17.7447192), 4326), '{"N LYT, N430"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'NE Layout, Visakhapatnam', 'NE Layout  N LYT, N430', ST_SetSRID(ST_MakePoint(83.3108498, 17.7447192), 4326), 60);
    END IF;
    -- Insert Satya Sai Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Satya Sai Nagar', ST_SetSRID(ST_MakePoint(83.2991225, 17.7454977), 4326), '{"S325, STY S NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Satya Sai Nagar, Visakhapatnam', 'Satya Sai Nagar  S325, STY S NKR', ST_SetSRID(ST_MakePoint(83.2991225, 17.7454977), 4326), 60);
    END IF;
    -- Insert Ganesh Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ganesh Colony', ST_SetSRID(ST_MakePoint(83.2960885, 17.7451393), 4326), '{"KNX KLN, G522"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ganesh Colony, Visakhapatnam', 'Ganesh Colony  KNX KLN, G522', ST_SetSRID(ST_MakePoint(83.2960885, 17.7451393), 4326), 60);
    END IF;
    -- Insert Varahagiri Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Varahagiri Colony', ST_SetSRID(ST_MakePoint(83.2929368, 17.7450422), 4326), '{"FRHJR KLN, V626"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Varahagiri Colony, Visakhapatnam', 'Varahagiri Colony  FRHJR KLN, V626', ST_SetSRID(ST_MakePoint(83.2929368, 17.7450422), 4326), 60);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.311661, 17.7284446), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.311661, 17.7284446), 4326), 10);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.3171864, 17.7326408), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.3171864, 17.7326408), 4326), 10);
    END IF;
    -- Insert Molakam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Molakam', ST_SetSRID(ST_MakePoint(83.5133488, 18.0901317), 4326), '{"M425, MLKM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Molakam, Visakhapatnam', 'Molakam  M425, MLKM', ST_SetSRID(ST_MakePoint(83.5133488, 18.0901317), 4326), 40);
    END IF;
    -- Insert Cheripolam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Cheripolam', ST_SetSRID(ST_MakePoint(83.5029334, 18.085575), 4326), '{"C614, XRPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Cheripolam, Visakhapatnam', 'Cheripolam  C614, XRPLM', ST_SetSRID(ST_MakePoint(83.5029334, 18.085575), 4326), 40);
    END IF;
    -- Insert Yatapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yatapeta', ST_SetSRID(ST_MakePoint(83.4768745, 18.0158718), 4326), '{"Y313, YTPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yatapeta, Visakhapatnam', 'Yatapeta  Y313, YTPT', ST_SetSRID(ST_MakePoint(83.4768745, 18.0158718), 4326), 40);
    END IF;
    -- Insert Manyamkallalu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Manyamkallalu', ST_SetSRID(ST_MakePoint(83.4718027, 18.0087297), 4326), '{"MNYMKLL, M552"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Manyamkallalu, Visakhapatnam', 'Manyamkallalu  MNYMKLL, M552', ST_SetSRID(ST_MakePoint(83.4718027, 18.0087297), 4326), 40);
    END IF;
    -- Insert Lucky Arabian Mandi (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lucky Arabian Mandi', ST_SetSRID(ST_MakePoint(83.2200535, 17.7481234), 4326), '{"L261, LK ARBN MNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lucky Arabian Mandi, Visakhapatnam', 'Lucky Arabian Mandi  L261, LK ARBN MNT', ST_SetSRID(ST_MakePoint(83.2200535, 17.7481234), 4326), 10);
    END IF;
    -- Insert Old SBI Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Old SBI Colony', ST_SetSRID(ST_MakePoint(82.8557396, 17.553655), 4326), '{"O432, OLT SB KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Old SBI Colony, Visakhapatnam', 'Old SBI Colony  O432, OLT SB KLN', ST_SetSRID(ST_MakePoint(82.8557396, 17.553655), 4326), 60);
    END IF;
    -- Insert State Bank Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank Colony', ST_SetSRID(ST_MakePoint(82.8612015, 17.5521811), 4326), '{"STT BNK KLN, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank Colony, Visakhapatnam', 'State Bank Colony  STT BNK KLN, S331', ST_SetSRID(ST_MakePoint(82.8612015, 17.5521811), 4326), 60);
    END IF;
    -- Insert Ulkapeta (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ulkapeta', ST_SetSRID(ST_MakePoint(82.8623646, 17.5491351), 4326), '{"U421, ULKPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ulkapeta, Visakhapatnam', 'Ulkapeta  U421, ULKPT', ST_SetSRID(ST_MakePoint(82.8623646, 17.5491351), 4326), 60);
    END IF;
    -- Insert Tulasi Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tulasi Nagar', ST_SetSRID(ST_MakePoint(82.8604461, 17.5464177), 4326), '{"T425, TLS NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tulasi Nagar, Visakhapatnam', 'Tulasi Nagar  T425, TLS NKR', ST_SetSRID(ST_MakePoint(82.8604461, 17.5464177), 4326), 60);
    END IF;
    -- Insert APSWERIS School , Elamanchili (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'APSWERIS School , Elamanchili', ST_SetSRID(ST_MakePoint(82.8595913, 17.5664082), 4326), '{"APSWRS SXL ELMNXL, A126"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'APSWERIS School , Elamanchili, Visakhapatnam', 'APSWERIS School , Elamanchili  APSWRS SXL ELMNXL, A126', ST_SetSRID(ST_MakePoint(82.8595913, 17.5664082), 4326), 50);
    END IF;
    -- Insert Yathapeta (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yathapeta', ST_SetSRID(ST_MakePoint(83.3821972, 18.051686), 4326), '{"Y313, Y0PT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yathapeta, Visakhapatnam', 'Yathapeta  Y313, Y0PT', ST_SetSRID(ST_MakePoint(83.3821972, 18.051686), 4326), 40);
    END IF;
    -- Insert Sanghivalasa (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sanghivalasa', ST_SetSRID(ST_MakePoint(83.4150594, 17.9222), 4326), '{"SNKHFLS, S521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sanghivalasa, Visakhapatnam', 'Sanghivalasa  SNKHFLS, S521', ST_SetSRID(ST_MakePoint(83.4150594, 17.9222), 4326), 60);
    END IF;
    -- Insert Bangalametta (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bangalametta', ST_SetSRID(ST_MakePoint(83.4268655, 17.9303884), 4326), '{"B524, BNKLMT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bangalametta, Visakhapatnam', 'Bangalametta  B524, BNKLMT', ST_SetSRID(ST_MakePoint(83.4268655, 17.9303884), 4326), 60);
    END IF;
    -- Insert Adarsanagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Adarsanagar', ST_SetSRID(ST_MakePoint(83.4248804, 17.9260258), 4326), '{"A362, ATRSNKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Adarsanagar, Visakhapatnam', 'Adarsanagar  A362, ATRSNKR', ST_SetSRID(ST_MakePoint(83.4248804, 17.9260258), 4326), 60);
    END IF;
    -- Insert Sri Ram Nagar (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Ram Nagar', ST_SetSRID(ST_MakePoint(83.4400601, 17.9267553), 4326), '{"S665, SR RM NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Ram Nagar, Visakhapatnam', 'Sri Ram Nagar  S665, SR RM NKR', ST_SetSRID(ST_MakePoint(83.4400601, 17.9267553), 4326), 40);
    END IF;
    -- Insert Moolakaddu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Moolakaddu', ST_SetSRID(ST_MakePoint(83.4484015, 17.9165911), 4326), '{"MLKT, M423"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Moolakaddu, Visakhapatnam', 'Moolakaddu  MLKT, M423', ST_SetSRID(ST_MakePoint(83.4484015, 17.9165911), 4326), 40);
    END IF;
    -- Insert Moolakaddu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Moolakaddu', ST_SetSRID(ST_MakePoint(83.4505843, 17.9190806), 4326), '{"MLKT, M423"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Moolakaddu, Visakhapatnam', 'Moolakaddu  MLKT, M423', ST_SetSRID(ST_MakePoint(83.4505843, 17.9190806), 4326), 40);
    END IF;
    -- Insert Tarluvada (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Tarluvada', ST_SetSRID(ST_MakePoint(83.329021, 17.9055782), 4326), '{"TRLFT, T641"}', jsonb_build_object('te', 'తర్లువాడ'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Tarluvada, Visakhapatnam', 'Tarluvada తర్లువాడ TRLFT, T641', ST_SetSRID(ST_MakePoint(83.329021, 17.9055782), 4326), 40);
    END IF;
    -- Insert MIG Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'MIG Colony', ST_SetSRID(ST_MakePoint(83.1946664, 17.6973398), 4326), '{"M224, MK KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'MIG Colony, Visakhapatnam', 'MIG Colony  M224, MK KLN', ST_SetSRID(ST_MakePoint(83.1946664, 17.6973398), 4326), 60);
    END IF;
    -- Insert Birla Gate (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Birla Gate', ST_SetSRID(ST_MakePoint(83.2597617, 17.7437), 4326), '{"BRL KT, B642"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Birla Gate, Visakhapatnam', 'Birla Gate  BRL KT, B642', ST_SetSRID(ST_MakePoint(83.2597617, 17.7437), 4326), 60);
    END IF;
    -- Insert Gavara Kanchara Palem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gavara Kanchara Palem', ST_SetSRID(ST_MakePoint(83.2628248, 17.7383324), 4326), '{"KFR KNXR PLM, G162"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gavara Kanchara Palem, Visakhapatnam', 'Gavara Kanchara Palem  KFR KNXR PLM, G162', ST_SetSRID(ST_MakePoint(83.2628248, 17.7383324), 4326), 60);
    END IF;
    -- Insert Kancharapalem Port Quarters (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kancharapalem Port Quarters', ST_SetSRID(ST_MakePoint(83.2785969, 17.7237558), 4326), '{"KNXRPLM PRT KRTRS, K526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kancharapalem Port Quarters, Visakhapatnam', 'Kancharapalem Port Quarters  KNXRPLM PRT KRTRS, K526', ST_SetSRID(ST_MakePoint(83.2785969, 17.7237558), 4326), 60);
    END IF;
    -- Insert Kancharapalem Port Quarters (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kancharapalem Port Quarters', ST_SetSRID(ST_MakePoint(83.2708348, 17.7290236), 4326), '{"KNXRPLM PRT KRTRS, K526"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kancharapalem Port Quarters, Visakhapatnam', 'Kancharapalem Port Quarters  KNXRPLM PRT KRTRS, K526', ST_SetSRID(ST_MakePoint(83.2708348, 17.7290236), 4326), 60);
    END IF;
    -- Insert Gurudwara Junction (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gurudwara Junction', ST_SetSRID(ST_MakePoint(83.3074726, 17.7370752), 4326), '{"G636, KRTWR JNKXN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gurudwara Junction, Visakhapatnam', 'Gurudwara Junction  G636, KRTWR JNKXN', ST_SetSRID(ST_MakePoint(83.3074726, 17.7370752), 4326), 60);
    END IF;
    -- Insert Fakeertakiya junction (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Fakeertakiya junction', ST_SetSRID(ST_MakePoint(83.1663498, 17.6934079), 4326), '{"F263, FKRTKY JNKXN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Fakeertakiya junction, Visakhapatnam', 'Fakeertakiya junction  F263, FKRTKY JNKXN', ST_SetSRID(ST_MakePoint(83.1663498, 17.6934079), 4326), 60);
    END IF;
    -- Insert Yalamarty Pharmacy College (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yalamarty Pharmacy College', ST_SetSRID(ST_MakePoint(83.3342476, 17.899835), 4326), '{"Y456, YLMRT FRMS KLJ"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yalamarty Pharmacy College, Visakhapatnam', 'Yalamarty Pharmacy College  Y456, YLMRT FRMS KLJ', ST_SetSRID(ST_MakePoint(83.3342476, 17.899835), 4326), 50);
    END IF;
    -- Insert Yalamarty Polytechnic College (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yalamarty Polytechnic College', ST_SetSRID(ST_MakePoint(83.3339016, 17.8990155), 4326), '{"Y456, YLMRT PLTXNK KLJ"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yalamarty Polytechnic College, Visakhapatnam', 'Yalamarty Polytechnic College  Y456, YLMRT PLTXNK KLJ', ST_SetSRID(ST_MakePoint(83.3339016, 17.8990155), 4326), 50);
    END IF;
    -- Insert Neelakundilu (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Neelakundilu', ST_SetSRID(ST_MakePoint(83.3038975, 17.8779261), 4326), '{"N425, NLKNTL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Neelakundilu, Visakhapatnam', 'Neelakundilu  N425, NLKNTL', ST_SetSRID(ST_MakePoint(83.3038975, 17.8779261), 4326), 40);
    END IF;
    -- Insert Hill Front O2 Valley (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hill Front O2 Valley', ST_SetSRID(ST_MakePoint(83.2943107, 17.8139599), 4326), '{"HL FRNT O FL, H416"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hill Front O2 Valley, Visakhapatnam', 'Hill Front O2 Valley  HL FRNT O FL, H416', ST_SetSRID(ST_MakePoint(83.2943107, 17.8139599), 4326), 40);
    END IF;
    -- Insert Sri Ramnagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Ramnagar', ST_SetSRID(ST_MakePoint(83.1840824, 17.6810441), 4326), '{"S665, SR RMNKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Ramnagar, Visakhapatnam', 'Sri Ramnagar  S665, SR RMNKR', ST_SetSRID(ST_MakePoint(83.1840824, 17.6810441), 4326), 60);
    END IF;
    -- Insert Soundarya Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Soundarya Colony', ST_SetSRID(ST_MakePoint(83.1854515, 17.6756016), 4326), '{"S536, SNTRY KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Soundarya Colony, Visakhapatnam', 'Soundarya Colony  S536, SNTRY KLN', ST_SetSRID(ST_MakePoint(83.1854515, 17.6756016), 4326), 60);
    END IF;
    -- Insert Nadupuru (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nadupuru', ST_SetSRID(ST_MakePoint(83.1978453, 17.6719209), 4326), '{"NTPR, N316"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nadupuru, Visakhapatnam', 'Nadupuru  NTPR, N316', ST_SetSRID(ST_MakePoint(83.1978453, 17.6719209), 4326), 60);
    END IF;
    -- Insert Drivers Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Drivers Colony', ST_SetSRID(ST_MakePoint(83.2015878, 17.6920769), 4326), '{"D616, TRFRS KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Drivers Colony, Visakhapatnam', 'Drivers Colony  D616, TRFRS KLN', ST_SetSRID(ST_MakePoint(83.2015878, 17.6920769), 4326), 60);
    END IF;
    -- Insert Dr BV Adinarayana Childrens Specialist (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dr BV Adinarayana Childrens Specialist', ST_SetSRID(ST_MakePoint(83.2719764, 17.7350078), 4326), '{"D613, TR BF ATNRYN XLTRNS SPXLST"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dr BV Adinarayana Childrens Specialist, Visakhapatnam', 'Dr BV Adinarayana Childrens Specialist  D613, TR BF ATNRYN XLTRNS SPXLST', ST_SetSRID(ST_MakePoint(83.2719764, 17.7350078), 4326), 50);
    END IF;
    -- Insert ICICI ATM (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI ATM', ST_SetSRID(ST_MakePoint(83.2687356, 17.7356175), 4326), '{"I223, ISS ATM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI ATM, Visakhapatnam', 'ICICI ATM  I223, ISS ATM', ST_SetSRID(ST_MakePoint(83.2687356, 17.7356175), 4326), 10);
    END IF;
    -- Insert The Arabian Kitchen (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Arabian Kitchen', ST_SetSRID(ST_MakePoint(83.2683058, 17.7357615), 4326), '{"0 ARBN KXN, T615"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Arabian Kitchen, Visakhapatnam', 'The Arabian Kitchen  0 ARBN KXN, T615', ST_SetSRID(ST_MakePoint(83.2683058, 17.7357615), 4326), 10);
    END IF;
    -- Insert Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of India', ST_SetSRID(ST_MakePoint(83.2688915, 17.7352192), 4326), '{"BNK OF INT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of India, Visakhapatnam', 'Bank of India  BNK OF INT, B521', ST_SetSRID(ST_MakePoint(83.2688915, 17.7352192), 4326), 10);
    END IF;
    -- Insert Rightway School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rightway School', ST_SetSRID(ST_MakePoint(83.2700271, 17.7349954), 4326), '{"RTW SXL, R232"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rightway School, Visakhapatnam', 'Rightway School  RTW SXL, R232', ST_SetSRID(ST_MakePoint(83.2700271, 17.7349954), 4326), 50);
    END IF;
    -- Insert Sri Vagdevi School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Vagdevi School', ST_SetSRID(ST_MakePoint(83.270296, 17.7354555), 4326), '{"SR FKTF SXL, S612"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Vagdevi School, Visakhapatnam', 'Sri Vagdevi School  SR FKTF SXL, S612', ST_SetSRID(ST_MakePoint(83.270296, 17.7354555), 4326), 50);
    END IF;
    -- Insert The Visakhapatnam Cooperative Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Visakhapatnam Cooperative Bank', ST_SetSRID(ST_MakePoint(83.270178, 17.7353827), 4326), '{"T122, 0 FSKHPTNM KPRTF BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Visakhapatnam Cooperative Bank, Visakhapatnam', 'The Visakhapatnam Cooperative Bank  T122, 0 FSKHPTNM KPRTF BNK', ST_SetSRID(ST_MakePoint(83.270178, 17.7353827), 4326), 10);
    END IF;
    -- Insert Indian Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Bank', ST_SetSRID(ST_MakePoint(83.2212022, 17.7471574), 4326), '{"I535, INTN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Bank, Visakhapatnam', 'Indian Bank  I535, INTN BNK', ST_SetSRID(ST_MakePoint(83.2212022, 17.7471574), 4326), 10);
    END IF;
    -- Insert Arabian Nights (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Arabian Nights', ST_SetSRID(ST_MakePoint(83.3231332, 17.7384623), 4326), '{"A615, ARBN NTS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Arabian Nights, Visakhapatnam', 'Arabian Nights  A615, ARBN NTS', ST_SetSRID(ST_MakePoint(83.3231332, 17.7384623), 4326), 10);
    END IF;
    -- Insert Waltair Spice (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Waltair Spice', ST_SetSRID(ST_MakePoint(83.3361188, 17.7367818), 4326), '{"W436, WLTR SPS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Waltair Spice, Visakhapatnam', 'Waltair Spice  W436, WLTR SPS', ST_SetSRID(ST_MakePoint(83.3361188, 17.7367818), 4326), 10);
    END IF;
    -- Insert Hotel Anupama (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hotel Anupama', ST_SetSRID(ST_MakePoint(83.3271471, 17.7283239), 4326), '{"H345, HTL ANPM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hotel Anupama, Visakhapatnam', 'Hotel Anupama  H345, HTL ANPM', ST_SetSRID(ST_MakePoint(83.3271471, 17.7283239), 4326), 10);
    END IF;
    -- Insert Ayushman arogya mandir (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ayushman arogya mandir', ST_SetSRID(ST_MakePoint(83.3294672, 17.729599), 4326), '{"AYXMN ARJY MNTR, A255"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ayushman arogya mandir, Visakhapatnam', 'Ayushman arogya mandir  AYXMN ARJY MNTR, A255', ST_SetSRID(ST_MakePoint(83.3294672, 17.729599), 4326), 50);
    END IF;
    -- Insert Hotel Amrutham (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hotel Amrutham', ST_SetSRID(ST_MakePoint(83.3212245, 17.7365395), 4326), '{"H345, HTL AMR0M"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hotel Amrutham, Visakhapatnam', 'Hotel Amrutham  H345, HTL AMR0M', ST_SetSRID(ST_MakePoint(83.3212245, 17.7365395), 4326), 10);
    END IF;
    -- Insert Waltair Grills (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Waltair Grills', ST_SetSRID(ST_MakePoint(83.3386035, 17.7320334), 4326), '{"W436, WLTR KRLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Waltair Grills, Visakhapatnam', 'Waltair Grills  W436, WLTR KRLS', ST_SetSRID(ST_MakePoint(83.3386035, 17.7320334), 4326), 10);
    END IF;
    -- Insert Kotak Mahindra ATM (atm)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotak Mahindra ATM', ST_SetSRID(ST_MakePoint(83.3130643, 17.7347179), 4326), '{"K325, KTK MHNTR ATM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotak Mahindra ATM, Visakhapatnam', 'Kotak Mahindra ATM  K325, KTK MHNTR ATM', ST_SetSRID(ST_MakePoint(83.3130643, 17.7347179), 4326), 10);
    END IF;
    -- Insert Indian Overseas Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Overseas Bank', ST_SetSRID(ST_MakePoint(83.3022683, 17.7149689), 4326), '{"I535, INTN OFRSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Overseas Bank, Visakhapatnam', 'Indian Overseas Bank  I535, INTN OFRSS BNK', ST_SetSRID(ST_MakePoint(83.3022683, 17.7149689), 4326), 10);
    END IF;
    -- Insert GVMC Primary School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'GVMC Primary School', ST_SetSRID(ST_MakePoint(83.2785659, 17.7313197), 4326), '{"KFMK PRMR SXL, G152"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'GVMC Primary School, Visakhapatnam', 'GVMC Primary School  KFMK PRMR SXL, G152', ST_SetSRID(ST_MakePoint(83.2785659, 17.7313197), 4326), 50);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.1866004, 17.8979466), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.1866004, 17.8979466), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.2118582, 17.7956042), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.2118582, 17.7956042), 4326), 10);
    END IF;
    -- Insert Sudheer Food Court (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sudheer Food Court', ST_SetSRID(ST_MakePoint(83.2137351, 17.7883435), 4326), '{"STHR FT KRT, S361"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sudheer Food Court, Visakhapatnam', 'Sudheer Food Court  STHR FT KRT, S361', ST_SetSRID(ST_MakePoint(83.2137351, 17.7883435), 4326), 10);
    END IF;
    -- Insert Delhi Public School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Delhi Public School', ST_SetSRID(ST_MakePoint(83.2396113, 17.7425283), 4326), '{"TLH PBLK SXL, D411"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Delhi Public School, Visakhapatnam', 'Delhi Public School  TLH PBLK SXL, D411', ST_SetSRID(ST_MakePoint(83.2396113, 17.7425283), 4326), 50);
    END IF;
    -- Insert Amaravati Hotel & Catering (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Amaravati Hotel & Catering', ST_SetSRID(ST_MakePoint(83.2166558, 17.7762154), 4326), '{"AMRFT HTL KTRNK, A561"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Amaravati Hotel & Catering, Visakhapatnam', 'Amaravati Hotel & Catering  AMRFT HTL KTRNK, A561', ST_SetSRID(ST_MakePoint(83.2166558, 17.7762154), 4326), 10);
    END IF;
    -- Insert Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of India', ST_SetSRID(ST_MakePoint(83.3014254, 17.7106321), 4326), '{"BNK OF INT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of India, Visakhapatnam', 'Bank of India  BNK OF INT, B521', ST_SetSRID(ST_MakePoint(83.3014254, 17.7106321), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.3001197, 17.7104533), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.3001197, 17.7104533), 4326), 10);
    END IF;
    -- Insert Annapurna (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Annapurna', ST_SetSRID(ST_MakePoint(83.2989848, 17.7108053), 4326), '{"A516, ANPRN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Annapurna, Visakhapatnam', 'Annapurna  A516, ANPRN', ST_SetSRID(ST_MakePoint(83.2989848, 17.7108053), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.298633, 17.707038), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.298633, 17.707038), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2985509, 17.7069642), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2985509, 17.7069642), 4326), 10);
    END IF;
    -- Insert Jai Jagannath Parlor (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Jai Jagannath Parlor', ST_SetSRID(ST_MakePoint(83.3030649, 17.7103472), 4326), '{"J225, J JKN0 PRLR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Jai Jagannath Parlor, Visakhapatnam', 'Jai Jagannath Parlor  J225, J JKN0 PRLR', ST_SetSRID(ST_MakePoint(83.3030649, 17.7103472), 4326), 10);
    END IF;
    -- Insert IDBI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IDBI Bank', ST_SetSRID(ST_MakePoint(83.2079164, 17.8082164), 4326), '{"ITB BNK, I311"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IDBI Bank, Visakhapatnam', 'IDBI Bank  ITB BNK, I311', ST_SetSRID(ST_MakePoint(83.2079164, 17.8082164), 4326), 10);
    END IF;
    -- Insert ESAF Small Finance Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ESAF Small Finance Bank', ST_SetSRID(ST_MakePoint(83.2078806, 17.8081516), 4326), '{"ESF SML FNNS BNK, E212"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ESAF Small Finance Bank, Visakhapatnam', 'ESAF Small Finance Bank  ESF SML FNNS BNK, E212', ST_SetSRID(ST_MakePoint(83.2078806, 17.8081516), 4326), 10);
    END IF;
    -- Insert Andhra Vindu (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Andhra Vindu', ST_SetSRID(ST_MakePoint(83.2084497, 17.8061519), 4326), '{"ANTHR FNT, A536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Andhra Vindu, Visakhapatnam', 'Andhra Vindu  ANTHR FNT, A536', ST_SetSRID(ST_MakePoint(83.2084497, 17.8061519), 4326), 10);
    END IF;
    -- Insert Ramachandrapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramachandrapuram', ST_SetSRID(ST_MakePoint(83.041069, 17.9017271), 4326), '{"RMXNTRPRM, R525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramachandrapuram, Visakhapatnam', 'Ramachandrapuram  RMXNTRPRM, R525', ST_SetSRID(ST_MakePoint(83.041069, 17.9017271), 4326), 10);
    END IF;
    -- Insert Govt High School Sabbavaram (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Govt High School Sabbavaram', ST_SetSRID(ST_MakePoint(83.1293272, 17.7926393), 4326), '{"G132, KFT H SXL SBFRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Govt High School Sabbavaram, Visakhapatnam', 'Govt High School Sabbavaram  G132, KFT H SXL SBFRM', ST_SetSRID(ST_MakePoint(83.1293272, 17.7926393), 4326), 50);
    END IF;
    -- Insert BR Ambedkar Gurukulam (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'BR Ambedkar Gurukulam', ST_SetSRID(ST_MakePoint(83.1284063, 17.7924301), 4326), '{"BR AMBTKR KRKLM, B651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'BR Ambedkar Gurukulam, Visakhapatnam', 'BR Ambedkar Gurukulam  BR AMBTKR KRKLM, B651', ST_SetSRID(ST_MakePoint(83.1284063, 17.7924301), 4326), 50);
    END IF;
    -- Insert CSB Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'CSB Bank', ST_SetSRID(ST_MakePoint(83.1215924, 17.7892711), 4326), '{"C115, KSB BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'CSB Bank, Visakhapatnam', 'CSB Bank  C115, KSB BNK', ST_SetSRID(ST_MakePoint(83.1215924, 17.7892711), 4326), 10);
    END IF;
    -- Insert IDFC First Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IDFC First Bank', ST_SetSRID(ST_MakePoint(83.0165061, 17.6872524), 4326), '{"ITFK FRST BNK, I312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IDFC First Bank, Visakhapatnam', 'IDFC First Bank  ITFK FRST BNK, I312', ST_SetSRID(ST_MakePoint(83.0165061, 17.6872524), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.0160543, 17.6873112), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.0160543, 17.6873112), 4326), 10);
    END IF;
    -- Insert Salapuvanipalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Salapuvanipalem', ST_SetSRID(ST_MakePoint(83.0753669, 17.6900443), 4326), '{"SLPFNPLM, S411"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Salapuvanipalem, Visakhapatnam', 'Salapuvanipalem  SLPFNPLM, S411', ST_SetSRID(ST_MakePoint(83.0753669, 17.6900443), 4326), 60);
    END IF;
    -- Insert Indian Overseas Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Overseas Bank', ST_SetSRID(ST_MakePoint(83.204066, 17.6869678), 4326), '{"I535, INTN OFRSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Overseas Bank, Visakhapatnam', 'Indian Overseas Bank  I535, INTN OFRSS BNK', ST_SetSRID(ST_MakePoint(83.204066, 17.6869678), 4326), 10);
    END IF;
    -- Insert Neha''s Kitchen (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Neha''s Kitchen', ST_SetSRID(ST_MakePoint(83.1623547, 17.6850378), 4326), '{"N223, NHS KXN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Neha''s Kitchen, Visakhapatnam', 'Neha''s Kitchen  N223, NHS KXN', ST_SetSRID(ST_MakePoint(83.1623547, 17.6850378), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.1676198, 17.6858434), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.1676198, 17.6858434), 4326), 10);
    END IF;
    -- Insert Bandhan Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bandhan Bank', ST_SetSRID(ST_MakePoint(83.1944565, 17.6836896), 4326), '{"B535, BNTHN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bandhan Bank, Visakhapatnam', 'Bandhan Bank  B535, BNTHN BNK', ST_SetSRID(ST_MakePoint(83.1944565, 17.6836896), 4326), 10);
    END IF;
    -- Insert IDBI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IDBI Bank', ST_SetSRID(ST_MakePoint(83.1962809, 17.6836694), 4326), '{"ITB BNK, I311"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IDBI Bank, Visakhapatnam', 'IDBI Bank  ITB BNK, I311', ST_SetSRID(ST_MakePoint(83.1962809, 17.6836694), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.2043279, 17.6959809), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.2043279, 17.6959809), 4326), 10);
    END IF;
    -- Insert Anna Canteen (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Anna Canteen', ST_SetSRID(ST_MakePoint(83.2332053, 17.6899483), 4326), '{"AN KNTN, A525"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Anna Canteen, Visakhapatnam', 'Anna Canteen  AN KNTN, A525', ST_SetSRID(ST_MakePoint(83.2332053, 17.6899483), 4326), 10);
    END IF;
    -- Insert Eaters Stop (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Eaters Stop', ST_SetSRID(ST_MakePoint(83.228131, 17.7347613), 4326), '{"ETRS STP, E362"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Eaters Stop, Visakhapatnam', 'Eaters Stop  ETRS STP, E362', ST_SetSRID(ST_MakePoint(83.228131, 17.7347613), 4326), 10);
    END IF;
    -- Insert HDFC (atm)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC', ST_SetSRID(ST_MakePoint(83.2683455, 17.6906514), 4326), '{"HTFK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC, Visakhapatnam', 'HDFC  HTFK, H312', ST_SetSRID(ST_MakePoint(83.2683455, 17.6906514), 4326), 10);
    END IF;
    -- Insert The Visakhapatnam Cooperative Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Visakhapatnam Cooperative Bank', ST_SetSRID(ST_MakePoint(83.1666971, 17.6927971), 4326), '{"T122, 0 FSKHPTNM KPRTF BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Visakhapatnam Cooperative Bank, Visakhapatnam', 'The Visakhapatnam Cooperative Bank  T122, 0 FSKHPTNM KPRTF BNK', ST_SetSRID(ST_MakePoint(83.1666971, 17.6927971), 4326), 10);
    END IF;
    -- Insert Pizza Hut (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pizza Hut', ST_SetSRID(ST_MakePoint(83.1629557, 17.6967262), 4326), '{"P230, PS HT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pizza Hut, Visakhapatnam', 'Pizza Hut  P230, PS HT', ST_SetSRID(ST_MakePoint(83.1629557, 17.6967262), 4326), 10);
    END IF;
    -- Insert Nandanam (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nandanam', ST_SetSRID(ST_MakePoint(83.1612445, 17.6980422), 4326), '{"N535, NNTNM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nandanam, Visakhapatnam', 'Nandanam  N535, NNTNM', ST_SetSRID(ST_MakePoint(83.1612445, 17.6980422), 4326), 10);
    END IF;
    -- Insert Annapurna Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Annapurna Restaurant', ST_SetSRID(ST_MakePoint(83.2380398, 17.7716304), 4326), '{"ANPRN RSTRNT, A516"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Annapurna Restaurant, Visakhapatnam', 'Annapurna Restaurant  ANPRN RSTRNT, A516', ST_SetSRID(ST_MakePoint(83.2380398, 17.7716304), 4326), 10);
    END IF;
    -- Insert Pandurangapuram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pandurangapuram', ST_SetSRID(ST_MakePoint(83.321721, 17.7159605), 4326), '{"PNTRNKPRM, P536"}', jsonb_build_object('te', 'పాండురంగపురం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pandurangapuram, Visakhapatnam', 'Pandurangapuram పాండురంగపురం PNTRNKPRM, P536', ST_SetSRID(ST_MakePoint(83.321721, 17.7159605), 4326), 60);
    END IF;
    -- Insert Vechalam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vechalam', ST_SetSRID(ST_MakePoint(82.973889, 17.8997178), 4326), '{"V245, FXLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vechalam, Visakhapatnam', 'Vechalam  V245, FXLM', ST_SetSRID(ST_MakePoint(82.973889, 17.8997178), 4326), 40);
    END IF;
    -- Insert Pedda Nandipalli Agraharam (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Nandipalli Agraharam', ST_SetSRID(ST_MakePoint(82.999539, 17.9541733), 4326), '{"PT NNTPL AKRHRM, P355"}', jsonb_build_object('te', 'పెదనందిపల్లి అగ్రహారం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Nandipalli Agraharam, Visakhapatnam', 'Pedda Nandipalli Agraharam పెదనందిపల్లి అగ్రహారం PT NNTPL AKRHRM, P355', ST_SetSRID(ST_MakePoint(82.999539, 17.9541733), 4326), 40);
    END IF;
    -- Insert Chinna Nandi Palli (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Nandi Palli', ST_SetSRID(ST_MakePoint(82.9962827, 17.9646958), 4326), '{"XN NNT PL, C555"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Nandi Palli, Visakhapatnam', 'Chinna Nandi Palli  XN NNT PL, C555', ST_SetSRID(ST_MakePoint(82.9962827, 17.9646958), 4326), 40);
    END IF;
    -- Insert Food Hut (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Food Hut', ST_SetSRID(ST_MakePoint(83.173546, 17.9765556), 4326), '{"F330, FT HT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Food Hut, Visakhapatnam', 'Food Hut  F330, FT HT', ST_SetSRID(ST_MakePoint(83.173546, 17.9765556), 4326), 10);
    END IF;
    -- Insert Deenadayalupuram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Deenadayalupuram', ST_SetSRID(ST_MakePoint(83.3070433, 17.7614698), 4326), '{"D534, TNTYLPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Deenadayalupuram, Visakhapatnam', 'Deenadayalupuram  D534, TNTYLPRM', ST_SetSRID(ST_MakePoint(83.3070433, 17.7614698), 4326), 60);
    END IF;
    -- Insert Old Gopalapatnam (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Old Gopalapatnam', ST_SetSRID(ST_MakePoint(83.2243806, 17.7416015), 4326), '{"O432, OLT KPLPTNM"}', jsonb_build_object('te', 'పాత గోపాలపట్నం'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Old Gopalapatnam, Visakhapatnam', 'Old Gopalapatnam పాత గోపాలపట్నం O432, OLT KPLPTNM', ST_SetSRID(ST_MakePoint(83.2243806, 17.7416015), 4326), 60);
    END IF;
    -- Insert Bhagat Singh Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bhagat Singh Nagar', ST_SetSRID(ST_MakePoint(83.2141713, 17.7379652), 4326), '{"B232, BHKT SN NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bhagat Singh Nagar, Visakhapatnam', 'Bhagat Singh Nagar  B232, BHKT SN NKR', ST_SetSRID(ST_MakePoint(83.2141713, 17.7379652), 4326), 60);
    END IF;
    -- Insert MK Vilas Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'MK Vilas Restaurant', ST_SetSRID(ST_MakePoint(83.185537, 17.8967426), 4326), '{"MK FLS RSTRNT, M214"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'MK Vilas Restaurant, Visakhapatnam', 'MK Vilas Restaurant  MK FLS RSTRNT, M214', ST_SetSRID(ST_MakePoint(83.185537, 17.8967426), 4326), 10);
    END IF;
    -- Insert Zeeshan Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Zeeshan Restaurant', ST_SetSRID(ST_MakePoint(83.3232743, 17.7386151), 4326), '{"Z256, SXN RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Zeeshan Restaurant, Visakhapatnam', 'Zeeshan Restaurant  Z256, SXN RSTRNT', ST_SetSRID(ST_MakePoint(83.3232743, 17.7386151), 4326), 10);
    END IF;
    -- Insert Maaya (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Maaya', ST_SetSRID(ST_MakePoint(83.3272678, 17.7413121), 4326), '{"M000, MY"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Maaya, Visakhapatnam', 'Maaya  M000, MY', ST_SetSRID(ST_MakePoint(83.3272678, 17.7413121), 4326), 10);
    END IF;
    -- Insert Teluginti (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Teluginti', ST_SetSRID(ST_MakePoint(83.3550498, 17.8084315), 4326), '{"TLJNT, T425"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Teluginti, Visakhapatnam', 'Teluginti  TLJNT, T425', ST_SetSRID(ST_MakePoint(83.3550498, 17.8084315), 4326), 10);
    END IF;
    -- Insert Sarada Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sarada Nagar', ST_SetSRID(ST_MakePoint(83.2089719, 17.8103115), 4326), '{"S635, SRT NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sarada Nagar, Visakhapatnam', 'Sarada Nagar  S635, SRT NKR', ST_SetSRID(ST_MakePoint(83.2089719, 17.8103115), 4326), 60);
    END IF;
    -- Insert Nawabi Mandi Darbar (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nawabi Mandi Darbar', ST_SetSRID(ST_MakePoint(83.2083716, 17.8067197), 4326), '{"N155, NWB MNT TRBR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nawabi Mandi Darbar, Visakhapatnam', 'Nawabi Mandi Darbar  N155, NWB MNT TRBR', ST_SetSRID(ST_MakePoint(83.2083716, 17.8067197), 4326), 10);
    END IF;
    -- Insert Hotel muntaj (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hotel muntaj', ST_SetSRID(ST_MakePoint(83.2111845, 17.798121), 4326), '{"H345, HTL MNTJ"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hotel muntaj, Visakhapatnam', 'Hotel muntaj  H345, HTL MNTJ', ST_SetSRID(ST_MakePoint(83.2111845, 17.798121), 4326), 10);
    END IF;
    -- Insert Indian Overseas Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Overseas Bank', ST_SetSRID(ST_MakePoint(83.2117114, 17.796139), 4326), '{"I535, INTN OFRSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Overseas Bank, Visakhapatnam', 'Indian Overseas Bank  I535, INTN OFRSS BNK', ST_SetSRID(ST_MakePoint(83.2117114, 17.796139), 4326), 10);
    END IF;
    -- Insert Papayarajupalem (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Papayarajupalem', ST_SetSRID(ST_MakePoint(83.2099047, 17.7960182), 4326), '{"P162, PPYRJPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Papayarajupalem, Visakhapatnam', 'Papayarajupalem  P162, PPYRJPLM', ST_SetSRID(ST_MakePoint(83.2099047, 17.7960182), 4326), 60);
    END IF;
    -- Insert Laxmidevi thota (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Laxmidevi thota', ST_SetSRID(ST_MakePoint(83.5100289, 18.0938255), 4326), '{"LKSMTF 0T, L253"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Laxmidevi thota, Visakhapatnam', 'Laxmidevi thota  LKSMTF 0T, L253', ST_SetSRID(ST_MakePoint(83.5100289, 18.0938255), 4326), 40);
    END IF;
    -- Insert Bandhan Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bandhan Bank', ST_SetSRID(ST_MakePoint(83.3341903, 17.7415454), 4326), '{"B535, BNTHN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bandhan Bank, Visakhapatnam', 'Bandhan Bank  B535, BNTHN BNK', ST_SetSRID(ST_MakePoint(83.3341903, 17.7415454), 4326), 10);
    END IF;
    -- Insert Yes Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Yes Bank', ST_SetSRID(ST_MakePoint(83.3330734, 17.7417938), 4326), '{"YS BNK, Y215"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Yes Bank, Visakhapatnam', 'Yes Bank  YS BNK, Y215', ST_SetSRID(ST_MakePoint(83.3330734, 17.7417938), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.331326, 17.7434029), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.331326, 17.7434029), 4326), 10);
    END IF;
    -- Insert Indian Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Bank', ST_SetSRID(ST_MakePoint(83.3313576, 17.7434909), 4326), '{"I535, INTN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Bank, Visakhapatnam', 'Indian Bank  I535, INTN BNK', ST_SetSRID(ST_MakePoint(83.3313576, 17.7434909), 4326), 10);
    END IF;
    -- Insert The Visakhapatnam Coperative Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Visakhapatnam Coperative Bank', ST_SetSRID(ST_MakePoint(83.3310703, 17.7437152), 4326), '{"T122, 0 FSKHPTNM KPRTF BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Visakhapatnam Coperative Bank, Visakhapatnam', 'The Visakhapatnam Coperative Bank  T122, 0 FSKHPTNM KPRTF BNK', ST_SetSRID(ST_MakePoint(83.3310703, 17.7437152), 4326), 10);
    END IF;
    -- Insert The School of Autism (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The School of Autism', ST_SetSRID(ST_MakePoint(83.3310416, 17.7437218), 4326), '{"0 SXL OF ATSM, T241"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The School of Autism, Visakhapatnam', 'The School of Autism  0 SXL OF ATSM, T241', ST_SetSRID(ST_MakePoint(83.3310416, 17.7437218), 4326), 50);
    END IF;
    -- Insert The Kanaka Mahalakshmi Cooperative Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Kanaka Mahalakshmi Cooperative Bank', ST_SetSRID(ST_MakePoint(83.3310873, 17.7439416), 4326), '{"0 KNK MHLKXM KPRTF BNK, T252"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Kanaka Mahalakshmi Cooperative Bank, Visakhapatnam', 'The Kanaka Mahalakshmi Cooperative Bank  0 KNK MHLKXM KPRTF BNK, T252', ST_SetSRID(ST_MakePoint(83.3310873, 17.7439416), 4326), 10);
    END IF;
    -- Insert DCCB (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'DCCB', ST_SetSRID(ST_MakePoint(83.3316667, 17.7446188), 4326), '{"TKKB, D210"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'DCCB, Visakhapatnam', 'DCCB  TKKB, D210', ST_SetSRID(ST_MakePoint(83.3316667, 17.7446188), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3568772, 17.8200063), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3568772, 17.8200063), 4326), 10);
    END IF;
    -- Insert UCO Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'UCO Bank', ST_SetSRID(ST_MakePoint(83.356887, 17.8201428), 4326), '{"U215, UK BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'UCO Bank, Visakhapatnam', 'UCO Bank  U215, UK BNK', ST_SetSRID(ST_MakePoint(83.356887, 17.8201428), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3511779, 17.8245237), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3511779, 17.8245237), 4326), 10);
    END IF;
    -- Insert La Pino''z Pizza (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'La Pino''z Pizza', ST_SetSRID(ST_MakePoint(83.3340298, 17.7362559), 4326), '{"L PNS PS, L152"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'La Pino''z Pizza, Visakhapatnam', 'La Pino''z Pizza  L PNS PS, L152', ST_SetSRID(ST_MakePoint(83.3340298, 17.7362559), 4326), 10);
    END IF;
    -- Insert KIMS Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'KIMS Hospitals', ST_SetSRID(ST_MakePoint(83.3353795, 17.7373995), 4326), '{"K522, KMS HSPTLS"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'KIMS Hospitals, Visakhapatnam', 'KIMS Hospitals  K522, KMS HSPTLS', ST_SetSRID(ST_MakePoint(83.3353795, 17.7373995), 4326), 50);
    END IF;
    -- Insert UCO Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'UCO Bank', ST_SetSRID(ST_MakePoint(83.3358361, 17.7377541), 4326), '{"U215, UK BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'UCO Bank, Visakhapatnam', 'UCO Bank  U215, UK BNK', ST_SetSRID(ST_MakePoint(83.3358361, 17.7377541), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3317246, 17.7466097), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3317246, 17.7466097), 4326), 10);
    END IF;
    -- Insert Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of India', ST_SetSRID(ST_MakePoint(83.3320223, 17.746712), 4326), '{"BNK OF INT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of India, Visakhapatnam', 'Bank of India  BNK OF INT, B521', ST_SetSRID(ST_MakePoint(83.3320223, 17.746712), 4326), 10);
    END IF;
    -- Insert Padmavathi Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Padmavathi Restaurant', ST_SetSRID(ST_MakePoint(83.3316998, 17.7467675), 4326), '{"P351, PTMF0 RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Padmavathi Restaurant, Visakhapatnam', 'Padmavathi Restaurant  P351, PTMF0 RSTRNT', ST_SetSRID(ST_MakePoint(83.3316998, 17.7467675), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.2974366, 17.7038922), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.2974366, 17.7038922), 4326), 10);
    END IF;
    -- Insert Karur Vysya Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karur Vysya Bank', ST_SetSRID(ST_MakePoint(83.2969926, 17.7029246), 4326), '{"K661, KRR FSY BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karur Vysya Bank, Visakhapatnam', 'Karur Vysya Bank  K661, KRR FSY BNK', ST_SetSRID(ST_MakePoint(83.2969926, 17.7029246), 4326), 10);
    END IF;
    -- Insert Sadaram Ramu Naidu Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sadaram Ramu Naidu Colony', ST_SetSRID(ST_MakePoint(83.2538225, 17.7374638), 4326), '{"STRM RM NT KLN, S365"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sadaram Ramu Naidu Colony, Visakhapatnam', 'Sadaram Ramu Naidu Colony  STRM RM NT KLN, S365', ST_SetSRID(ST_MakePoint(83.2538225, 17.7374638), 4326), 60);
    END IF;
    -- Insert Pedda Sompuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pedda Sompuram', ST_SetSRID(ST_MakePoint(82.9996466, 18.0406553), 4326), '{"P325, PT SMPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pedda Sompuram, Visakhapatnam', 'Pedda Sompuram  P325, PT SMPRM', ST_SetSRID(ST_MakePoint(82.9996466, 18.0406553), 4326), 10);
    END IF;
    -- Insert Lova Mukundapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lova Mukundapuram', ST_SetSRID(ST_MakePoint(82.9997558, 18.0474974), 4326), '{"L152, LF MKNTPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lova Mukundapuram, Visakhapatnam', 'Lova Mukundapuram  L152, LF MKNTPRM', ST_SetSRID(ST_MakePoint(82.9997558, 18.0474974), 4326), 10);
    END IF;
    -- Insert Chinna Sompuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Chinna Sompuram', ST_SetSRID(ST_MakePoint(83.002825, 18.0216034), 4326), '{"C525, XN SMPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Chinna Sompuram, Visakhapatnam', 'Chinna Sompuram  C525, XN SMPRM', ST_SetSRID(ST_MakePoint(83.002825, 18.0216034), 4326), 10);
    END IF;
    -- Insert Bethapudi (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bethapudi', ST_SetSRID(ST_MakePoint(82.9866183, 18.001538), 4326), '{"B0PT, B313"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bethapudi, Visakhapatnam', 'Bethapudi  B0PT, B313', ST_SetSRID(ST_MakePoint(82.9866183, 18.001538), 4326), 40);
    END IF;
    -- Insert Ippagaruvu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ippagaruvu', ST_SetSRID(ST_MakePoint(82.9216286, 18.0090973), 4326), '{"IPKRF, I126"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ippagaruvu, Visakhapatnam', 'Ippagaruvu  IPKRF, I126', ST_SetSRID(ST_MakePoint(82.9216286, 18.0090973), 4326), 10);
    END IF;
    -- Insert Ramannapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ramannapalem', ST_SetSRID(ST_MakePoint(82.9138467, 18.0020716), 4326), '{"RMNPLM, R551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ramannapalem, Visakhapatnam', 'Ramannapalem  RMNPLM, R551', ST_SetSRID(ST_MakePoint(82.9138467, 18.0020716), 4326), 10);
    END IF;
    -- Insert Rellalapalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Rellalapalem', ST_SetSRID(ST_MakePoint(82.8949421, 17.9902971), 4326), '{"R441, RLLPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Rellalapalem, Visakhapatnam', 'Rellalapalem  R441, RLLPLM', ST_SetSRID(ST_MakePoint(82.8949421, 17.9902971), 4326), 10);
    END IF;
    -- Insert Old Gajuwaka (city)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Old Gajuwaka', ST_SetSRID(ST_MakePoint(83.2035277, 17.6859561), 4326), '{"OLT KJWK, O432, Old Gajuwaka, New Gajuwaka"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Old Gajuwaka, Visakhapatnam', 'Old Gajuwaka  OLT KJWK, O432, Old Gajuwaka, New Gajuwaka', ST_SetSRID(ST_MakePoint(83.2035277, 17.6859561), 4326), 10);
    END IF;
    -- Insert Simhadripuram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Simhadripuram', ST_SetSRID(ST_MakePoint(83.3202383, 17.7489163), 4326), '{"S536, SMHTRPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Simhadripuram, Visakhapatnam', 'Simhadripuram  S536, SMHTRPRM', ST_SetSRID(ST_MakePoint(83.3202383, 17.7489163), 4326), 60);
    END IF;
    -- Insert Visakha Valley Road (village)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Visakha Valley Road', ST_SetSRID(ST_MakePoint(83.2781499, 17.7404684), 4326), '{"V221, FSKH FL RT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Visakha Valley Road, Visakhapatnam', 'Visakha Valley Road  V221, FSKH FL RT', ST_SetSRID(ST_MakePoint(83.2781499, 17.7404684), 4326), 40);
    END IF;
    -- Insert TPT Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'TPT Colony', ST_SetSRID(ST_MakePoint(83.31172, 17.7390713), 4326), '{"TPT KLN, T132"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'TPT Colony, Visakhapatnam', 'TPT Colony  TPT KLN, T132', ST_SetSRID(ST_MakePoint(83.31172, 17.7390713), 4326), 60);
    END IF;
    -- Insert Abid Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Abid Nagar', ST_SetSRID(ST_MakePoint(83.2995036, 17.7398959), 4326), '{"A135, ABT NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Abid Nagar, Visakhapatnam', 'Abid Nagar  A135, ABT NKR', ST_SetSRID(ST_MakePoint(83.2995036, 17.7398959), 4326), 60);
    END IF;
    -- Insert Operation Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Operation Colony', ST_SetSRID(ST_MakePoint(83.3065767, 17.7703981), 4326), '{"O163, OPRXN KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Operation Colony, Visakhapatnam', 'Operation Colony  O163, OPRXN KLN', ST_SetSRID(ST_MakePoint(83.3065767, 17.7703981), 4326), 60);
    END IF;
    -- Insert Pragathi Ngar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pragathi Ngar', ST_SetSRID(ST_MakePoint(83.3068231, 17.7672484), 4326), '{"P623, PRK0 NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pragathi Ngar, Visakhapatnam', 'Pragathi Ngar  P623, PRK0 NKR', ST_SetSRID(ST_MakePoint(83.3068231, 17.7672484), 4326), 60);
    END IF;
    -- Insert JNNURM Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'JNNURM Colony', ST_SetSRID(ST_MakePoint(83.3078276, 17.7665846), 4326), '{"J565, JNRM KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'JNNURM Colony, Visakhapatnam', 'JNNURM Colony  J565, JNRM KLN', ST_SetSRID(ST_MakePoint(83.3078276, 17.7665846), 4326), 60);
    END IF;
    -- Insert Panduranga Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Panduranga Nagar', ST_SetSRID(ST_MakePoint(83.3085831, 17.7702073), 4326), '{"PNTRNK NKR, P536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Panduranga Nagar, Visakhapatnam', 'Panduranga Nagar  PNTRNK NKR, P536', ST_SetSRID(ST_MakePoint(83.3085831, 17.7702073), 4326), 60);
    END IF;
    -- Insert Murali Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Murali Nagar', ST_SetSRID(ST_MakePoint(83.3092926, 17.7698974), 4326), '{"MRL NKR, M645"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Murali Nagar, Visakhapatnam', 'Murali Nagar  MRL NKR, M645', ST_SetSRID(ST_MakePoint(83.3092926, 17.7698974), 4326), 60);
    END IF;
    -- Insert Durga Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Durga Nagar', ST_SetSRID(ST_MakePoint(83.3123046, 17.7698747), 4326), '{"D625, TRK NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Durga Nagar, Visakhapatnam', 'Durga Nagar  D625, TRK NKR', ST_SetSRID(ST_MakePoint(83.3123046, 17.7698747), 4326), 60);
    END IF;
    -- Insert Sector 3 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 3', ST_SetSRID(ST_MakePoint(83.3132643, 17.769903), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 3, Visakhapatnam', 'Sector 3  SKTR , S236', ST_SetSRID(ST_MakePoint(83.3132643, 17.769903), 4326), 60);
    END IF;
    -- Insert Nehru Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nehru Nagar', ST_SetSRID(ST_MakePoint(83.3139975, 17.769517), 4326), '{"NR NKR, N652"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nehru Nagar, Visakhapatnam', 'Nehru Nagar  NR NKR, N652', ST_SetSRID(ST_MakePoint(83.3139975, 17.769517), 4326), 60);
    END IF;
    -- Insert Balaji Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Balaji Nagar', ST_SetSRID(ST_MakePoint(83.319071, 17.7654478), 4326), '{"B425, BLJ NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Balaji Nagar, Visakhapatnam', 'Balaji Nagar  B425, BLJ NKR', ST_SetSRID(ST_MakePoint(83.319071, 17.7654478), 4326), 60);
    END IF;
    -- Insert Ravindra Nagar 2 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ravindra Nagar 2', ST_SetSRID(ST_MakePoint(83.3224912, 17.7673722), 4326), '{"R153, RFNTR NKR "}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ravindra Nagar 2, Visakhapatnam', 'Ravindra Nagar 2  R153, RFNTR NKR ', ST_SetSRID(ST_MakePoint(83.3224912, 17.7673722), 4326), 60);
    END IF;
    -- Insert Ravindra Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ravindra Nagar', ST_SetSRID(ST_MakePoint(83.3239521, 17.7665448), 4326), '{"R153, RFNTR NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ravindra Nagar, Visakhapatnam', 'Ravindra Nagar  R153, RFNTR NKR', ST_SetSRID(ST_MakePoint(83.3239521, 17.7665448), 4326), 60);
    END IF;
    -- Insert Veterinary Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Veterinary Colony', ST_SetSRID(ST_MakePoint(83.3361043, 17.7645406), 4326), '{"V365, FTRNR KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Veterinary Colony, Visakhapatnam', 'Veterinary Colony  V365, FTRNR KLN', ST_SetSRID(ST_MakePoint(83.3361043, 17.7645406), 4326), 60);
    END IF;
    -- Insert Sector 2 (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sector 2', ST_SetSRID(ST_MakePoint(83.3156685, 17.767421), 4326), '{"SKTR , S236"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sector 2, Visakhapatnam', 'Sector 2  SKTR , S236', ST_SetSRID(ST_MakePoint(83.3156685, 17.767421), 4326), 60);
    END IF;
    -- Insert Ambedkar Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Ambedkar Nagar', ST_SetSRID(ST_MakePoint(83.315418, 17.7666967), 4326), '{"A513, AMBTKR NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Ambedkar Nagar, Visakhapatnam', 'Ambedkar Nagar  A513, AMBTKR NKR', ST_SetSRID(ST_MakePoint(83.315418, 17.7666967), 4326), 60);
    END IF;
    -- Insert Srikanth Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Srikanth Nagar', ST_SetSRID(ST_MakePoint(83.3096165, 17.7667479), 4326), '{"SRKN0 NKR, S625"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Srikanth Nagar, Visakhapatnam', 'Srikanth Nagar  SRKN0 NKR, S625', ST_SetSRID(ST_MakePoint(83.3096165, 17.7667479), 4326), 60);
    END IF;
    -- Insert Sri Ram Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sri Ram Nagar', ST_SetSRID(ST_MakePoint(83.3352258, 17.7548867), 4326), '{"S665, SR RM NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sri Ram Nagar, Visakhapatnam', 'Sri Ram Nagar  S665, SR RM NKR', ST_SetSRID(ST_MakePoint(83.3352258, 17.7548867), 4326), 60);
    END IF;
    -- Insert Dayal Nagar Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Dayal Nagar Colony', ST_SetSRID(ST_MakePoint(83.3458705, 17.75484), 4326), '{"D452, TYL NKR KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Dayal Nagar Colony, Visakhapatnam', 'Dayal Nagar Colony  D452, TYL NKR KLN', ST_SetSRID(ST_MakePoint(83.3458705, 17.75484), 4326), 60);
    END IF;
    -- Insert Andhra Pradesh Grameena Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Andhra Pradesh Grameena Bank', ST_SetSRID(ST_MakePoint(83.4243808, 17.9293346), 4326), '{"ANTHR PRTX KRMN BNK, A536"}', jsonb_build_object('te', 'ఆంధ్ర‌ప్ర‌దేశ్ గ్రామీణ బ్యాంక్'))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Andhra Pradesh Grameena Bank, Visakhapatnam', 'Andhra Pradesh Grameena Bank ఆంధ్ర‌ప్ర‌దేశ్ గ్రామీణ బ్యాంక్ ANTHR PRTX KRMN BNK, A536', ST_SetSRID(ST_MakePoint(83.4243808, 17.9293346), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.4280046, 17.9315045), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.4280046, 17.9315045), 4326), 10);
    END IF;
    -- Insert DCB (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'DCB', ST_SetSRID(ST_MakePoint(83.4288931, 17.9303688), 4326), '{"D210, TKB"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'DCB, Visakhapatnam', 'DCB  D210, TKB', ST_SetSRID(ST_MakePoint(83.4288931, 17.9303688), 4326), 10);
    END IF;
    -- Insert CSB Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'CSB Bank', ST_SetSRID(ST_MakePoint(83.4289452, 17.9294449), 4326), '{"C115, KSB BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'CSB Bank, Visakhapatnam', 'CSB Bank  C115, KSB BNK', ST_SetSRID(ST_MakePoint(83.4289452, 17.9294449), 4326), 10);
    END IF;
    -- Insert B Zag Family Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'B Zag Family Restaurant', ST_SetSRID(ST_MakePoint(83.4459925, 17.8803145), 4326), '{"B221, B SK FML RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'B Zag Family Restaurant, Visakhapatnam', 'B Zag Family Restaurant  B221, B SK FML RSTRNT', ST_SetSRID(ST_MakePoint(83.4459925, 17.8803145), 4326), 10);
    END IF;
    -- Insert IndusInd Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IndusInd Bank', ST_SetSRID(ST_MakePoint(83.3494588, 17.8040842), 4326), '{"I532, INTSNT BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IndusInd Bank, Visakhapatnam', 'IndusInd Bank  I532, INTSNT BNK', ST_SetSRID(ST_MakePoint(83.3494588, 17.8040842), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.3485871, 17.804063), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.3485871, 17.804063), 4326), 10);
    END IF;
    -- Insert Indian Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Bank', ST_SetSRID(ST_MakePoint(83.3478596, 17.8040678), 4326), '{"I535, INTN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Bank, Visakhapatnam', 'Indian Bank  I535, INTN BNK', ST_SetSRID(ST_MakePoint(83.3478596, 17.8040678), 4326), 10);
    END IF;
    -- Insert Manikanta Food Court (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Manikanta Food Court', ST_SetSRID(ST_MakePoint(83.3470123, 17.8040649), 4326), '{"M525, MNKNT FT KRT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Manikanta Food Court, Visakhapatnam', 'Manikanta Food Court  M525, MNKNT FT KRT', ST_SetSRID(ST_MakePoint(83.3470123, 17.8040649), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.34679, 17.8040457), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.34679, 17.8040457), 4326), 10);
    END IF;
    -- Insert Raju''s Kitchen (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Raju''s Kitchen', ST_SetSRID(ST_MakePoint(83.3465751, 17.8040554), 4326), '{"RJS KXN, R222"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Raju''s Kitchen, Visakhapatnam', 'Raju''s Kitchen  RJS KXN, R222', ST_SetSRID(ST_MakePoint(83.3465751, 17.8040554), 4326), 10);
    END IF;
    -- Insert Andhra Pradesh Grameena Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Andhra Pradesh Grameena Bank', ST_SetSRID(ST_MakePoint(83.3435157, 17.8043861), 4326), '{"ANTHR PRTX KRMN BNK, A536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Andhra Pradesh Grameena Bank, Visakhapatnam', 'Andhra Pradesh Grameena Bank  ANTHR PRTX KRMN BNK, A536', ST_SetSRID(ST_MakePoint(83.3435157, 17.8043861), 4326), 10);
    END IF;
    -- Insert Hotel Muntaj (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hotel Muntaj', ST_SetSRID(ST_MakePoint(83.3391323, 17.8065254), 4326), '{"H345, HTL MNTJ"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hotel Muntaj, Visakhapatnam', 'Hotel Muntaj  H345, HTL MNTJ', ST_SetSRID(ST_MakePoint(83.3391323, 17.8065254), 4326), 10);
    END IF;
    -- Insert BPR Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'BPR Restaurant', ST_SetSRID(ST_MakePoint(83.3389506, 17.8068402), 4326), '{"BPR RSTRNT, B662"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'BPR Restaurant, Visakhapatnam', 'BPR Restaurant  BPR RSTRNT, B662', ST_SetSRID(ST_MakePoint(83.3389506, 17.8068402), 4326), 10);
    END IF;
    -- Insert Lotus English Medium School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lotus English Medium School', ST_SetSRID(ST_MakePoint(83.3425095, 17.8051004), 4326), '{"L325, LTS ENKLX MTM SXL"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lotus English Medium School, Visakhapatnam', 'Lotus English Medium School  L325, LTS ENKLX MTM SXL', ST_SetSRID(ST_MakePoint(83.3425095, 17.8051004), 4326), 50);
    END IF;
    -- Insert Bank of Maharashtra (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of Maharashtra', ST_SetSRID(ST_MakePoint(83.3427318, 17.8049973), 4326), '{"BNK OF MHRXTR, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of Maharashtra, Visakhapatnam', 'Bank of Maharashtra  BNK OF MHRXTR, B521', ST_SetSRID(ST_MakePoint(83.3427318, 17.8049973), 4326), 10);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.345643, 17.8044408), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.345643, 17.8044408), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.3463192, 17.8045462), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.3463192, 17.8045462), 4326), 10);
    END IF;
    -- Insert Karnataka Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karnataka Bank', ST_SetSRID(ST_MakePoint(83.3479524, 17.8044134), 4326), '{"K653, KRNTK BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karnataka Bank, Visakhapatnam', 'Karnataka Bank  K653, KRNTK BNK', ST_SetSRID(ST_MakePoint(83.3479524, 17.8044134), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.3492824, 17.8044541), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.3492824, 17.8044541), 4326), 10);
    END IF;
    -- Insert IDBI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IDBI Bank', ST_SetSRID(ST_MakePoint(83.3498758, 17.8045595), 4326), '{"ITB BNK, I311"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IDBI Bank, Visakhapatnam', 'IDBI Bank  ITB BNK, I311', ST_SetSRID(ST_MakePoint(83.3498758, 17.8045595), 4326), 10);
    END IF;
    -- Insert Eat Sure (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Eat Sure', ST_SetSRID(ST_MakePoint(83.3498219, 17.804362), 4326), '{"ET SR, E326"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Eat Sure, Visakhapatnam', 'Eat Sure  ET SR, E326', ST_SetSRID(ST_MakePoint(83.3498219, 17.804362), 4326), 10);
    END IF;
    -- Insert Pandit Rajasthani Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pandit Rajasthani Restaurant', ST_SetSRID(ST_MakePoint(83.2932379, 17.7172399), 4326), '{"P533, PNTT RJS0N RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pandit Rajasthani Restaurant, Visakhapatnam', 'Pandit Rajasthani Restaurant  P533, PNTT RJS0N RSTRNT', ST_SetSRID(ST_MakePoint(83.2932379, 17.7172399), 4326), 10);
    END IF;
    -- Insert Sharma Bhojanalaya (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sharma Bhojanalaya', ST_SetSRID(ST_MakePoint(83.2937394, 17.7170499), 4326), '{"XRM BHJNLY, S651"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sharma Bhojanalaya, Visakhapatnam', 'Sharma Bhojanalaya  XRM BHJNLY, S651', ST_SetSRID(ST_MakePoint(83.2937394, 17.7170499), 4326), 10);
    END IF;
    -- Insert Allipuram (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Allipuram', ST_SetSRID(ST_MakePoint(83.2947779, 17.7198234), 4326), '{"A416, ALPRM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Allipuram, Visakhapatnam', 'Allipuram  A416, ALPRM', ST_SetSRID(ST_MakePoint(83.2947779, 17.7198234), 4326), 60);
    END IF;
    -- Insert Bheem Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bheem Nagar', ST_SetSRID(ST_MakePoint(83.3011817, 17.7201363), 4326), '{"B552, BHM NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bheem Nagar, Visakhapatnam', 'Bheem Nagar  B552, BHM NKR', ST_SetSRID(ST_MakePoint(83.3011817, 17.7201363), 4326), 60);
    END IF;
    -- Insert DCCB Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'DCCB Bank', ST_SetSRID(ST_MakePoint(83.328207, 17.7289853), 4326), '{"TKKB BNK, D211"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'DCCB Bank, Visakhapatnam', 'DCCB Bank  TKKB BNK, D211', ST_SetSRID(ST_MakePoint(83.328207, 17.7289853), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3308557, 17.7312334), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3308557, 17.7312334), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.3310802, 17.7313775), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.3310802, 17.7313775), 4326), 10);
    END IF;
    -- Insert Vijayanagar Police Layout (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Vijayanagar Police Layout', ST_SetSRID(ST_MakePoint(83.3326331, 17.7311188), 4326), '{"FJYNKR PLS LYT, V252"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Vijayanagar Police Layout, Visakhapatnam', 'Vijayanagar Police Layout  FJYNKR PLS LYT, V252', ST_SetSRID(ST_MakePoint(83.3326331, 17.7311188), 4326), 60);
    END IF;
    -- Insert Karur Vysya Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karur Vysya Bank', ST_SetSRID(ST_MakePoint(83.3333059, 17.7321008), 4326), '{"K661, KRR FSY BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karur Vysya Bank, Visakhapatnam', 'Karur Vysya Bank  K661, KRR FSY BNK', ST_SetSRID(ST_MakePoint(83.3333059, 17.7321008), 4326), 10);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.3342689, 17.7319446), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.3342689, 17.7319446), 4326), 10);
    END IF;
    -- Insert Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of India', ST_SetSRID(ST_MakePoint(83.316391, 17.7311156), 4326), '{"BNK OF INT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of India, Visakhapatnam', 'Bank of India  BNK OF INT, B521', ST_SetSRID(ST_MakePoint(83.316391, 17.7311156), 4326), 10);
    END IF;
    -- Insert Falak Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Falak Restaurant', ST_SetSRID(ST_MakePoint(83.3155371, 17.7303144), 4326), '{"F426, FLK RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Falak Restaurant, Visakhapatnam', 'Falak Restaurant  F426, FLK RSTRNT', ST_SetSRID(ST_MakePoint(83.3155371, 17.7303144), 4326), 10);
    END IF;
    -- Insert Indian Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Bank', ST_SetSRID(ST_MakePoint(83.3144704, 17.7295514), 4326), '{"I535, INTN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Bank, Visakhapatnam', 'Indian Bank  I535, INTN BNK', ST_SetSRID(ST_MakePoint(83.3144704, 17.7295514), 4326), 10);
    END IF;
    -- Insert moon bar & kitchen (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'moon bar & kitchen', ST_SetSRID(ST_MakePoint(83.3139569, 17.7289896), 4326), '{"MN BR KXN, M516"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'moon bar & kitchen, Visakhapatnam', 'moon bar & kitchen  MN BR KXN, M516', ST_SetSRID(ST_MakePoint(83.3139569, 17.7289896), 4326), 10);
    END IF;
    -- Insert Karnataka Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karnataka Bank', ST_SetSRID(ST_MakePoint(83.3137469, 17.7291564), 4326), '{"K653, KRNTK BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karnataka Bank, Visakhapatnam', 'Karnataka Bank  K653, KRNTK BNK', ST_SetSRID(ST_MakePoint(83.3137469, 17.7291564), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.3128984, 17.7286503), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.3128984, 17.7286503), 4326), 10);
    END IF;
    -- Insert IndusInd Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IndusInd Bank', ST_SetSRID(ST_MakePoint(83.3147237, 17.7435999), 4326), '{"I532, INTSNT BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IndusInd Bank, Visakhapatnam', 'IndusInd Bank  I532, INTSNT BNK', ST_SetSRID(ST_MakePoint(83.3147237, 17.7435999), 4326), 10);
    END IF;
    -- Insert ESAF Small Finance Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ESAF Small Finance Bank', ST_SetSRID(ST_MakePoint(83.3148602, 17.7436109), 4326), '{"ESF SML FNNS BNK, E212"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ESAF Small Finance Bank, Visakhapatnam', 'ESAF Small Finance Bank  ESF SML FNNS BNK, E212', ST_SetSRID(ST_MakePoint(83.3148602, 17.7436109), 4326), 10);
    END IF;
    -- Insert Axis Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Axis Bank', ST_SetSRID(ST_MakePoint(83.3153409, 17.7436087), 4326), '{"A221, AKSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Axis Bank, Visakhapatnam', 'Axis Bank  A221, AKSS BNK', ST_SetSRID(ST_MakePoint(83.3153409, 17.7436087), 4326), 10);
    END IF;
    -- Insert South Indian Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'South Indian Bank', ST_SetSRID(ST_MakePoint(83.3155477, 17.7436133), 4326), '{"S353, S0 INTN BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'South Indian Bank, Visakhapatnam', 'South Indian Bank  S353, S0 INTN BNK', ST_SetSRID(ST_MakePoint(83.3155477, 17.7436133), 4326), 10);
    END IF;
    -- Insert Indian Overseas Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Overseas Bank', ST_SetSRID(ST_MakePoint(83.3051175, 17.7250778), 4326), '{"I535, INTN OFRSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Overseas Bank, Visakhapatnam', 'Indian Overseas Bank  I535, INTN OFRSS BNK', ST_SetSRID(ST_MakePoint(83.3051175, 17.7250778), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.3064778, 17.7264089), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.3064778, 17.7264089), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.306478, 17.7266167), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.306478, 17.7266167), 4326), 10);
    END IF;
    -- Insert Helapuri (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Helapuri', ST_SetSRID(ST_MakePoint(83.3058498, 17.7250819), 4326), '{"HLPR, H416"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Helapuri, Visakhapatnam', 'Helapuri  HLPR, H416', ST_SetSRID(ST_MakePoint(83.3058498, 17.7250819), 4326), 10);
    END IF;
    -- Insert IDFC First Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IDFC First Bank', ST_SetSRID(ST_MakePoint(83.3060802, 17.7269864), 4326), '{"ITFK FRST BNK, I312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IDFC First Bank, Visakhapatnam', 'IDFC First Bank  ITFK FRST BNK, I312', ST_SetSRID(ST_MakePoint(83.3060802, 17.7269864), 4326), 10);
    END IF;
    -- Insert ICICI Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'ICICI Bank', ST_SetSRID(ST_MakePoint(83.3060906, 17.7269368), 4326), '{"ISS BNK, I221"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'ICICI Bank, Visakhapatnam', 'ICICI Bank  ISS BNK, I221', ST_SetSRID(ST_MakePoint(83.3060906, 17.7269368), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.3065494, 17.7271865), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.3065494, 17.7271865), 4326), 10);
    END IF;
    -- Insert DBS Bank India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'DBS Bank India', ST_SetSRID(ST_MakePoint(83.3065919, 17.7273213), 4326), '{"TBS BNK INT, D121"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'DBS Bank India, Visakhapatnam', 'DBS Bank India  TBS BNK INT, D121', ST_SetSRID(ST_MakePoint(83.3065919, 17.7273213), 4326), 10);
    END IF;
    -- Insert AU Small Finance Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'AU Small Finance Bank', ST_SetSRID(ST_MakePoint(83.3065912, 17.7274523), 4326), '{"A254, A SML FNNS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'AU Small Finance Bank, Visakhapatnam', 'AU Small Finance Bank  A254, A SML FNNS BNK', ST_SetSRID(ST_MakePoint(83.3065912, 17.7274523), 4326), 10);
    END IF;
    -- Insert DCB Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'DCB Bank', ST_SetSRID(ST_MakePoint(83.3069374, 17.7306418), 4326), '{"TKB BNK, D211"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'DCB Bank, Visakhapatnam', 'DCB Bank  TKB BNK, D211', ST_SetSRID(ST_MakePoint(83.3069374, 17.7306418), 4326), 10);
    END IF;
    -- Insert CSB Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'CSB Bank', ST_SetSRID(ST_MakePoint(83.3069473, 17.7307304), 4326), '{"C115, KSB BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'CSB Bank, Visakhapatnam', 'CSB Bank  C115, KSB BNK', ST_SetSRID(ST_MakePoint(83.3069473, 17.7307304), 4326), 10);
    END IF;
    -- Insert Karur Vysya Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karur Vysya Bank', ST_SetSRID(ST_MakePoint(83.3067813, 17.7335911), 4326), '{"K661, KRR FSY BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karur Vysya Bank, Visakhapatnam', 'Karur Vysya Bank  K661, KRR FSY BNK', ST_SetSRID(ST_MakePoint(83.3067813, 17.7335911), 4326), 10);
    END IF;
    -- Insert Central Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Central Bank of India', ST_SetSRID(ST_MakePoint(83.3068804, 17.7337996), 4326), '{"C536, SNTRL BNK OF INT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Central Bank of India, Visakhapatnam', 'Central Bank of India  C536, SNTRL BNK OF INT', ST_SetSRID(ST_MakePoint(83.3068804, 17.7337996), 4326), 10);
    END IF;
    -- Insert Abids Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Abids Restaurant', ST_SetSRID(ST_MakePoint(83.303887, 17.7271488), 4326), '{"A132, ABTS RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Abids Restaurant, Visakhapatnam', 'Abids Restaurant  A132, ABTS RSTRNT', ST_SetSRID(ST_MakePoint(83.303887, 17.7271488), 4326), 10);
    END IF;
    -- Insert IndusInd Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'IndusInd Bank', ST_SetSRID(ST_MakePoint(83.2925981, 17.7276377), 4326), '{"I532, INTSNT BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'IndusInd Bank, Visakhapatnam', 'IndusInd Bank  I532, INTSNT BNK', ST_SetSRID(ST_MakePoint(83.2925981, 17.7276377), 4326), 10);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2953782, 17.7273866), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2953782, 17.7273866), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.29552, 17.7273948), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.29552, 17.7273948), 4326), 10);
    END IF;
    -- Insert Bank of Baroda (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of Baroda', ST_SetSRID(ST_MakePoint(83.3038217, 17.7280931), 4326), '{"BNK OF BRT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of Baroda, Visakhapatnam', 'Bank of Baroda  BNK OF BRT, B521', ST_SetSRID(ST_MakePoint(83.3038217, 17.7280931), 4326), 10);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.3041465, 17.7310041), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.3041465, 17.7310041), 4326), 10);
    END IF;
    -- Insert Canara Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Canara Bank', ST_SetSRID(ST_MakePoint(83.3041913, 17.7310586), 4326), '{"C561, KNR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Canara Bank, Visakhapatnam', 'Canara Bank  C561, KNR BNK', ST_SetSRID(ST_MakePoint(83.3041913, 17.7310586), 4326), 10);
    END IF;
    -- Insert Axis Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Axis Bank', ST_SetSRID(ST_MakePoint(83.3038146, 17.7317714), 4326), '{"A221, AKSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Axis Bank, Visakhapatnam', 'Axis Bank  A221, AKSS BNK', ST_SetSRID(ST_MakePoint(83.3038146, 17.7317714), 4326), 10);
    END IF;
    -- Insert Karnataka Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karnataka Bank', ST_SetSRID(ST_MakePoint(83.3042022, 17.7360353), 4326), '{"K653, KRNTK BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karnataka Bank, Visakhapatnam', 'Karnataka Bank  K653, KRNTK BNK', ST_SetSRID(ST_MakePoint(83.3042022, 17.7360353), 4326), 10);
    END IF;
    -- Insert Indus Hospitals (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indus Hospitals', ST_SetSRID(ST_MakePoint(83.3075353, 17.7625271), 4326), '{"INTS HSPTLS, I532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indus Hospitals, Visakhapatnam', 'Indus Hospitals  INTS HSPTLS, I532', ST_SetSRID(ST_MakePoint(83.3075353, 17.7625271), 4326), 50);
    END IF;
    -- Insert Narayana Medicity (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Narayana Medicity', ST_SetSRID(ST_MakePoint(83.3119581, 17.7621246), 4326), '{"NRYN MTST, N655"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Narayana Medicity, Visakhapatnam', 'Narayana Medicity  NRYN MTST, N655', ST_SetSRID(ST_MakePoint(83.3119581, 17.7621246), 4326), 50);
    END IF;
    -- Insert Union Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Union Bank of India', ST_SetSRID(ST_MakePoint(83.2997753, 17.7389866), 4326), '{"UNN BNK OF INT, U551"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Union Bank of India, Visakhapatnam', 'Union Bank of India  UNN BNK OF INT, U551', ST_SetSRID(ST_MakePoint(83.2997753, 17.7389866), 4326), 10);
    END IF;
    -- Insert Kotak Mahindra Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kotak Mahindra Bank', ST_SetSRID(ST_MakePoint(83.300158, 17.7392072), 4326), '{"K325, KTK MHNTR BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kotak Mahindra Bank, Visakhapatnam', 'Kotak Mahindra Bank  K325, KTK MHNTR BNK', ST_SetSRID(ST_MakePoint(83.300158, 17.7392072), 4326), 10);
    END IF;
    -- Insert Coastal Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Coastal Bank', ST_SetSRID(ST_MakePoint(83.2997978, 17.73867), 4326), '{"C234, KSTL BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Coastal Bank, Visakhapatnam', 'Coastal Bank  C234, KSTL BNK', ST_SetSRID(ST_MakePoint(83.2997978, 17.73867), 4326), 10);
    END IF;
    -- Insert Bank of Baroda (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of Baroda', ST_SetSRID(ST_MakePoint(83.3001853, 17.7375948), 4326), '{"BNK OF BRT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of Baroda, Visakhapatnam', 'Bank of Baroda  BNK OF BRT, B521', ST_SetSRID(ST_MakePoint(83.3001853, 17.7375948), 4326), 10);
    END IF;
    -- Insert Karur Vysya Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Karur Vysya Bank', ST_SetSRID(ST_MakePoint(83.3002058, 17.73703), 4326), '{"K661, KRR FSY BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Karur Vysya Bank, Visakhapatnam', 'Karur Vysya Bank  K661, KRR FSY BNK', ST_SetSRID(ST_MakePoint(83.3002058, 17.73703), 4326), 10);
    END IF;
    -- Insert The Kanaka Mahalakshmi Co-operative Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'The Kanaka Mahalakshmi Co-operative Bank', ST_SetSRID(ST_MakePoint(83.3001379, 17.7365082), 4326), '{"0 KNK MHLKXM KPRTF BNK, T252"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'The Kanaka Mahalakshmi Co-operative Bank, Visakhapatnam', 'The Kanaka Mahalakshmi Co-operative Bank  0 KNK MHLKXM KPRTF BNK, T252', ST_SetSRID(ST_MakePoint(83.3001379, 17.7365082), 4326), 10);
    END IF;
    -- Insert Indian Overseas Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Indian Overseas Bank', ST_SetSRID(ST_MakePoint(83.2995882, 17.7351599), 4326), '{"I535, INTN OFRSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Indian Overseas Bank, Visakhapatnam', 'Indian Overseas Bank  I535, INTN OFRSS BNK', ST_SetSRID(ST_MakePoint(83.2995882, 17.7351599), 4326), 10);
    END IF;
    -- Insert Anjaneyulu Nagar (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Anjaneyulu Nagar', ST_SetSRID(ST_MakePoint(83.2164145, 17.7702901), 4326), '{"A525, ANJNYL NKR"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Anjaneyulu Nagar, Visakhapatnam', 'Anjaneyulu Nagar  A525, ANJNYL NKR', ST_SetSRID(ST_MakePoint(83.2164145, 17.7702901), 4326), 60);
    END IF;
    -- Insert HDFC Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'HDFC Bank', ST_SetSRID(ST_MakePoint(83.208167, 17.8072704), 4326), '{"HTFK BNK, H312"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'HDFC Bank, Visakhapatnam', 'HDFC Bank  HTFK BNK, H312', ST_SetSRID(ST_MakePoint(83.208167, 17.8072704), 4326), 10);
    END IF;
    -- Insert Santhi Nagaram SC Colony (neighbourhood)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Santhi Nagaram SC Colony', ST_SetSRID(ST_MakePoint(83.2075034, 17.8068719), 4326), '{"S535, SN0 NKRM SK KLN"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Santhi Nagaram SC Colony, Visakhapatnam', 'Santhi Nagaram SC Colony  S535, SN0 NKRM SK KLN', ST_SetSRID(ST_MakePoint(83.2075034, 17.8068719), 4326), 60);
    END IF;
    -- Insert State Bank of India (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'State Bank of India', ST_SetSRID(ST_MakePoint(83.2984209, 17.7408857), 4326), '{"STT BNK OF INT, S331"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'State Bank of India, Visakhapatnam', 'State Bank of India  STT BNK OF INT, S331', ST_SetSRID(ST_MakePoint(83.2984209, 17.7408857), 4326), 10);
    END IF;
    -- Insert Aathidyam Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Aathidyam Restaurant', ST_SetSRID(ST_MakePoint(83.3119523, 17.7278992), 4326), '{"A335, 0TYM RSTRNT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Aathidyam Restaurant, Visakhapatnam', 'Aathidyam Restaurant  A335, 0TYM RSTRNT', ST_SetSRID(ST_MakePoint(83.3119523, 17.7278992), 4326), 10);
    END IF;
    -- Insert Andhra Vindu (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Andhra Vindu', ST_SetSRID(ST_MakePoint(83.3136532, 17.723907), 4326), '{"ANTHR FNT, A536"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Andhra Vindu, Visakhapatnam', 'Andhra Vindu  ANTHR FNT, A536', ST_SetSRID(ST_MakePoint(83.3136532, 17.723907), 4326), 10);
    END IF;
    -- Insert Sanjivani Hospital (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Sanjivani Hospital', ST_SetSRID(ST_MakePoint(83.2464417, 17.7403603), 4326), '{"SNJFN HSPTL, S521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Sanjivani Hospital, Visakhapatnam', 'Sanjivani Hospital  SNJFN HSPTL, S521', ST_SetSRID(ST_MakePoint(83.2464417, 17.7403603), 4326), 50);
    END IF;
    -- Insert Government School (school)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Government School', ST_SetSRID(ST_MakePoint(83.2426355, 17.7400572), 4326), '{"KFRNMNT SXL, G165"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Government School, Visakhapatnam', 'Government School  KFRNMNT SXL, G165', ST_SetSRID(ST_MakePoint(83.2426355, 17.7400572), 4326), 50);
    END IF;
    -- Insert Hotel Golden Alfa (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Hotel Golden Alfa', ST_SetSRID(ST_MakePoint(83.2342475, 17.7428684), 4326), '{"H342, HTL KLTN ALF"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Hotel Golden Alfa, Visakhapatnam', 'Hotel Golden Alfa  H342, HTL KLTN ALF', ST_SetSRID(ST_MakePoint(83.2342475, 17.7428684), 4326), 10);
    END IF;
    -- Insert CMR Green Fields Park-1 (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'CMR Green Fields Park-1', ST_SetSRID(ST_MakePoint(83.3855955, 18.0755565), 4326), '{"KMR KRN FLTS PRK, C562"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'CMR Green Fields Park-1, Visakhapatnam', 'CMR Green Fields Park-1  KMR KRN FLTS PRK, C562', ST_SetSRID(ST_MakePoint(83.3855955, 18.0755565), 4326), 10);
    END IF;
    -- Insert Kinnera Grand Restaurant (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kinnera Grand Restaurant', ST_SetSRID(ST_MakePoint(83.387609, 18.0736844), 4326), '{"KNR KRNT RSTRNT, K562"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kinnera Grand Restaurant, Visakhapatnam', 'Kinnera Grand Restaurant  KNR KRNT RSTRNT, K562', ST_SetSRID(ST_MakePoint(83.387609, 18.0736844), 4326), 10);
    END IF;
    -- Insert Lendi Grounds (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Lendi Grounds', ST_SetSRID(ST_MakePoint(83.4018174, 18.0191238), 4326), '{"LNT KRNTS, L532"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Lendi Grounds, Visakhapatnam', 'Lendi Grounds  LNT KRNTS, L532', ST_SetSRID(ST_MakePoint(83.4018174, 18.0191238), 4326), 50);
    END IF;
    -- Insert hfdb (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'hfdb', ST_SetSRID(ST_MakePoint(83.3818514, 17.7960081), 4326), '{"H131, HFTB"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'hfdb, Visakhapatnam', 'hfdb  H131, HFTB', ST_SetSRID(ST_MakePoint(83.3818514, 17.7960081), 4326), 10);
    END IF;
    -- Insert forest (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'forest', ST_SetSRID(ST_MakePoint(83.393281, 17.804183), 4326), '{"FRST, F623"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'forest, Visakhapatnam', 'forest  FRST, F623', ST_SetSRID(ST_MakePoint(83.393281, 17.804183), 4326), 10);
    END IF;
    -- Insert Gandhi (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gandhi', ST_SetSRID(ST_MakePoint(83.3963328, 17.7989437), 4326), '{"G530, KNTH"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gandhi, Visakhapatnam', 'Gandhi  G530, KNTH', ST_SetSRID(ST_MakePoint(83.3963328, 17.7989437), 4326), 50);
    END IF;
    -- Insert Area (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Area', ST_SetSRID(ST_MakePoint(83.3886204, 17.7951956), 4326), '{"AR, A600"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Area, Visakhapatnam', 'Area  AR, A600', ST_SetSRID(ST_MakePoint(83.3886204, 17.7951956), 4326), 10);
    END IF;
    -- Insert forest (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'forest', ST_SetSRID(ST_MakePoint(83.3893022, 17.7952383), 4326), '{"FRST, F623"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'forest, Visakhapatnam', 'forest  FRST, F623', ST_SetSRID(ST_MakePoint(83.3893022, 17.7952383), 4326), 50);
    END IF;
    -- Insert Foresht (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Foresht', ST_SetSRID(ST_MakePoint(83.3881312, 17.7990255), 4326), '{"FRXT, F623"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Foresht, Visakhapatnam', 'Foresht  FRXT, F623', ST_SetSRID(ST_MakePoint(83.3881312, 17.7990255), 4326), 10);
    END IF;
    -- Insert forest (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'forest', ST_SetSRID(ST_MakePoint(83.3890616, 17.7953651), 4326), '{"FRST, F623"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'forest, Visakhapatnam', 'forest  FRST, F623', ST_SetSRID(ST_MakePoint(83.3890616, 17.7953651), 4326), 50);
    END IF;
    -- Insert forest (hospital)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'forest', ST_SetSRID(ST_MakePoint(83.3882361, 17.7989074), 4326), '{"FRST, F623"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'forest, Visakhapatnam', 'forest  FRST, F623', ST_SetSRID(ST_MakePoint(83.3882361, 17.7989074), 4326), 50);
    END IF;
    -- Insert Park (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Park', ST_SetSRID(ST_MakePoint(83.3810777, 17.7941264), 4326), '{"PRK, P620"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Park, Visakhapatnam', 'Park  PRK, P620', ST_SetSRID(ST_MakePoint(83.3810777, 17.7941264), 4326), 10);
    END IF;
    -- Insert Timapuram forest (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Timapuram forest', ST_SetSRID(ST_MakePoint(83.4013324, 17.8173918), 4326), '{"TMPRM FRST, T516"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Timapuram forest, Visakhapatnam', 'Timapuram forest  TMPRM FRST, T516', ST_SetSRID(ST_MakePoint(83.4013324, 17.8173918), 4326), 10);
    END IF;
    -- Insert beach paradise (restaurant)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'beach paradise', ST_SetSRID(ST_MakePoint(83.409493, 17.8469396), 4326), '{"BX PRTS, B216"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'beach paradise, Visakhapatnam', 'beach paradise  BX PRTS, B216', ST_SetSRID(ST_MakePoint(83.409493, 17.8469396), 4326), 10);
    END IF;
    -- Insert Gandhi Statue (park)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Gandhi Statue', ST_SetSRID(ST_MakePoint(83.3771811, 17.7808943), 4326), '{"G532, KNTH STT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Gandhi Statue, Visakhapatnam', 'Gandhi Statue  G532, KNTH STT', ST_SetSRID(ST_MakePoint(83.3771811, 17.7808943), 4326), 10);
    END IF;
    -- Insert School of Law (college)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'School of Law', ST_SetSRID(ST_MakePoint(83.3779809, 17.7830802), 4326), '{"S414, SXL OF L"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'School of Law, Visakhapatnam', 'School of Law  S414, SXL OF L', ST_SetSRID(ST_MakePoint(83.3779809, 17.7830802), 4326), 50);
    END IF;
    -- Insert Nagarampalem (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Nagarampalem', ST_SetSRID(ST_MakePoint(82.8959127, 18.0308266), 4326), '{"N265, NKRMPLM"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Nagarampalem, Visakhapatnam', 'Nagarampalem  N265, NKRMPLM', ST_SetSRID(ST_MakePoint(82.8959127, 18.0308266), 4326), 10);
    END IF;
    -- Insert Kodapalli (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Kodapalli', ST_SetSRID(ST_MakePoint(82.9136577, 18.0055008), 4326), '{"KTPL, K314"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Kodapalli, Visakhapatnam', 'Kodapalli  KTPL, K314', ST_SetSRID(ST_MakePoint(82.9136577, 18.0055008), 4326), 10);
    END IF;
    -- Insert Pallagaruvu (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Pallagaruvu', ST_SetSRID(ST_MakePoint(82.9371295, 17.9984127), 4326), '{"P426, PLKRF"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Pallagaruvu, Visakhapatnam', 'Pallagaruvu  P426, PLKRF', ST_SetSRID(ST_MakePoint(82.9371295, 17.9984127), 4326), 10);
    END IF;
    -- Insert Talipudi (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Talipudi', ST_SetSRID(ST_MakePoint(82.927824, 17.9838195), 4326), '{"T413, TLPT"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Talipudi, Visakhapatnam', 'Talipudi  T413, TLPT', ST_SetSRID(ST_MakePoint(82.927824, 17.9838195), 4326), 10);
    END IF;
    -- Insert Satyanarayanapuram (hamlet)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Satyanarayanapuram', ST_SetSRID(ST_MakePoint(82.9854914, 17.9523448), 4326), '{"STYNRYNPRM, S356"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Satyanarayanapuram, Visakhapatnam', 'Satyanarayanapuram  STYNRYNPRM, S356', ST_SetSRID(ST_MakePoint(82.9854914, 17.9523448), 4326), 10);
    END IF;
    -- Insert Axis Bank (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Axis Bank', ST_SetSRID(ST_MakePoint(83.0175561, 17.6870228), 4326), '{"A221, AKSS BNK"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Axis Bank, Visakhapatnam', 'Axis Bank  A221, AKSS BNK', ST_SetSRID(ST_MakePoint(83.0175561, 17.6870228), 4326), 10);
    END IF;
    -- Insert Bank of Baroda (bank)
    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)
    VALUES (vzg_city_id, 'Bank of Baroda', ST_SetSRID(ST_MakePoint(83.0139602, 17.6870086), 4326), '{"BNK OF BRT, B521"}', jsonb_build_object('te', ''))
    ON CONFLICT DO NOTHING
    RETURNING id INTO new_loc_id;
    IF new_loc_id IS NOT NULL THEN
        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)
        VALUES (new_loc_id, 'locality', 'Bank of Baroda, Visakhapatnam', 'Bank of Baroda  BNK OF BRT, B521', ST_SetSRID(ST_MakePoint(83.0139602, 17.6870086), 4326), 10);
    END IF;
END $$;