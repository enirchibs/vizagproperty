-- ==============================================================================
-- 17. SEED POINTS OF INTEREST (POIs)
-- ==============================================================================
DO $$
BEGIN
    -- Siva Sivani Public School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Siva Sivani Public School', 'School', ST_SetSRID(ST_MakePoint(83.3315061, 17.7209547), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3315061, 17.7209547), 4326) LIMIT 1;
    -- Visakha Homeo Clinic (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Visakha Homeo Clinic', 'Hospital', ST_SetSRID(ST_MakePoint(83.3094001, 17.7224616), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3094001, 17.7224616), 4326) LIMIT 1;
    -- Nikitha Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Nikitha Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3145614, 17.7426752), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3145614, 17.7426752), 4326) LIMIT 1;
    -- Dolphin Park (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dolphin Park', 'Park', ST_SetSRID(ST_MakePoint(83.2828576, 17.6711304), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2828576, 17.6711304), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3185424, 17.7240164), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3185424, 17.7240164), 4326) LIMIT 1;
    -- Karachiwala Departmental stores (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Karachiwala Departmental stores', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3175827, 17.723211), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3175827, 17.723211), 4326) LIMIT 1;
    -- Reliance Fresh (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Reliance Fresh', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3374862, 17.7434599), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3374862, 17.7434599), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3163851, 17.7436406), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3163851, 17.7436406), 4326) LIMIT 1;
    -- Padmaja Hospital - Seethammadhara (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Padmaja Hospital - Seethammadhara', 'Hospital', ST_SetSRID(ST_MakePoint(83.3146125, 17.7436298), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3146125, 17.7436298), 4326) LIMIT 1;
    -- Jyothi Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Jyothi Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.3229595, 17.739081), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3229595, 17.739081), 4326) LIMIT 1;
    -- Baba bazaar (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Baba bazaar', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3381185, 17.7312094), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3381185, 17.7312094), 4326) LIMIT 1;
    -- Skml Kirana Shop (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Skml Kirana Shop', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3353712, 17.7313299), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3353712, 17.7313299), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3535582, 17.8035909), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3535582, 17.8035909), 4326) LIMIT 1;
    -- Vijetha (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vijetha', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3498782, 17.8039867), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3498782, 17.8039867), 4326) LIMIT 1;
    -- Hotel Beach Paradise (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Beach Paradise', 'Hotel', ST_SetSRID(ST_MakePoint(83.4095376, 17.8469583), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4095376, 17.8469583), 4326) LIMIT 1;
    -- Durga Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Durga Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.2713316, 17.7362275), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2713316, 17.7362275), 4326) LIMIT 1;
    -- Vasu Deva Rao Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vasu Deva Rao Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3339991, 17.7249342), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3339991, 17.7249342), 4326) LIMIT 1;
    -- Systems Design (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Systems Design', 'School', ST_SetSRID(ST_MakePoint(83.3270212, 17.7230565), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3270212, 17.7230565), 4326) LIMIT 1;
    -- Rakul Followers (Guest House)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Rakul Followers', 'Guest House', ST_SetSRID(ST_MakePoint(83.2447981, 17.6877043), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2447981, 17.6877043), 4326) LIMIT 1;
    -- Rama Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Rama Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3071191, 17.7375272), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3071191, 17.7375272), 4326) LIMIT 1;
    -- kalavathi hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'kalavathi hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2706719, 17.7824442), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2706719, 17.7824442), 4326) LIMIT 1;
    -- LV Prasad Eye Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'LV Prasad Eye Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3309144, 17.7568569), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3309144, 17.7568569), 4326) LIMIT 1;
    -- Govt High School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Govt High School', 'School', ST_SetSRID(ST_MakePoint(83.5489993, 18.091722), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.5489993, 18.091722), 4326) LIMIT 1;
    -- Govt. Junior college (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Govt. Junior college', 'College', ST_SetSRID(ST_MakePoint(83.5483488, 18.0916138), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.5483488, 18.0916138), 4326) LIMIT 1;
    -- Govt. primary School, Rellivalasa (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Govt. primary School, Rellivalasa', 'School', ST_SetSRID(ST_MakePoint(83.5254293, 18.0914055), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.5254293, 18.0914055), 4326) LIMIT 1;
    -- Govt. Guest house (Guest House)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Govt. Guest house', 'Guest House', ST_SetSRID(ST_MakePoint(83.5208833, 18.0951376), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.5208833, 18.0951376), 4326) LIMIT 1;
    -- Govt. High school (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Govt. High school', 'School', ST_SetSRID(ST_MakePoint(83.5205726, 18.0966378), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.5205726, 18.0966378), 4326) LIMIT 1;
    -- KIMS (formerly Queens NRI Hospital) (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'KIMS (formerly Queens NRI Hospital)', 'Hospital', ST_SetSRID(ST_MakePoint(83.3080536, 17.7404353), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3080536, 17.7404353), 4326) LIMIT 1;
    -- Hotel Blue Moon (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Blue Moon', 'Hotel', ST_SetSRID(ST_MakePoint(83.299453, 17.7130524), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.299453, 17.7130524), 4326) LIMIT 1;
    -- Sri Venkateshwara Nursing Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Venkateshwara Nursing Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.307414, 17.7147802), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.307414, 17.7147802), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3090981, 17.7152616), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3090981, 17.7152616), 4326) LIMIT 1;
    -- Amulya Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Amulya Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3086985, 17.7154685), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3086985, 17.7154685), 4326) LIMIT 1;
    -- Kala Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Kala Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3056846, 17.7288521), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3056846, 17.7288521), 4326) LIMIT 1;
    -- Hirawats (Mall)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hirawats', 'Mall', ST_SetSRID(ST_MakePoint(83.2360742, 17.7428021), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2360742, 17.7428021), 4326) LIMIT 1;
    -- Vijetha (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vijetha', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2491207, 17.7503873), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2491207, 17.7503873), 4326) LIMIT 1;
    -- Nalco guest house (Guest House)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Nalco guest house', 'Guest House', ST_SetSRID(ST_MakePoint(83.311481, 17.7158399), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.311481, 17.7158399), 4326) LIMIT 1;
    -- Chaitanya Public School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Chaitanya Public School', 'School', ST_SetSRID(ST_MakePoint(83.132655, 17.6574107), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.132655, 17.6574107), 4326) LIMIT 1;
    -- Delhi Public School Visakhapatnam (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Delhi Public School Visakhapatnam', 'School', ST_SetSRID(ST_MakePoint(83.1360611, 17.653747), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1360611, 17.653747), 4326) LIMIT 1;
    -- Dr. VJs Cosmetic Surgery& Hair Transplantation Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. VJs Cosmetic Surgery& Hair Transplantation Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.2984784, 17.7236037), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2984784, 17.7236037), 4326) LIMIT 1;
    -- Padmavathi Nagar (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Padmavathi Nagar', 'Park', ST_SetSRID(ST_MakePoint(83.2323093, 17.7755482), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2323093, 17.7755482), 4326) LIMIT 1;
    -- Visakhapatnam Central (Mall)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Visakhapatnam Central', 'Mall', ST_SetSRID(ST_MakePoint(83.3009257, 17.7096842), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3009257, 17.7096842), 4326) LIMIT 1;
    -- sri gawri degree and PG College (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'sri gawri degree and PG College', 'College', ST_SetSRID(ST_MakePoint(83.2716113, 17.7354822), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2716113, 17.7354822), 4326) LIMIT 1;
    -- Smiles Dental (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Smiles Dental', 'Clinic', ST_SetSRID(ST_MakePoint(83.3026853, 17.7261703), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3026853, 17.7261703), 4326) LIMIT 1;
    -- St. Joseph''s Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'St. Joseph''s Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3120581, 17.7113427), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3120581, 17.7113427), 4326) LIMIT 1;
    -- AMCOSA functional hall (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'AMCOSA functional hall', 'Hotel', ST_SetSRID(ST_MakePoint(83.3111783, 17.7119764), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3111783, 17.7119764), 4326) LIMIT 1;
    -- shantiniketan mental health centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'shantiniketan mental health centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.3118425, 17.710893), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3118425, 17.710893), 4326) LIMIT 1;
    -- Mycure hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Mycure hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3146963, 17.7120173), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3146963, 17.7120173), 4326) LIMIT 1;
    -- Surya skin care (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Surya skin care', 'Hospital', ST_SetSRID(ST_MakePoint(83.3143316, 17.7141226), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3143316, 17.7141226), 4326) LIMIT 1;
    -- NBM law college (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'NBM law college', 'School', ST_SetSRID(ST_MakePoint(83.3136878, 17.7135912), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3136878, 17.7135912), 4326) LIMIT 1;
    -- Krishna Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Krishna Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3109627, 17.7100754), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3109627, 17.7100754), 4326) LIMIT 1;
    -- Aaradhya fertility centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Aaradhya fertility centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.3128724, 17.7149198), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3128724, 17.7149198), 4326) LIMIT 1;
    -- Jublee home (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Jublee home', 'Hotel', ST_SetSRID(ST_MakePoint(83.3121858, 17.712467), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3121858, 17.712467), 4326) LIMIT 1;
    -- Sagar Durga Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sagar Durga Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3109667, 17.7086688), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3109667, 17.7086688), 4326) LIMIT 1;
    -- Shri Venkataramana Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Shri Venkataramana Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3111357, 17.7090399), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3111357, 17.7090399), 4326) LIMIT 1;
    -- Bethany school (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Bethany school', 'School', ST_SetSRID(ST_MakePoint(83.3137921, 17.7105591), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3137921, 17.7105591), 4326) LIMIT 1;
    -- beach view guest house (Guest House)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'beach view guest house', 'Guest House', ST_SetSRID(ST_MakePoint(83.3146182, 17.7095166), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3146182, 17.7095166), 4326) LIMIT 1;
    -- Trinity holy church (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Trinity holy church', 'Hotel', ST_SetSRID(ST_MakePoint(83.3137492, 17.7089034), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3137492, 17.7089034), 4326) LIMIT 1;
    -- Zion house of prayer (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Zion house of prayer', 'Hotel', ST_SetSRID(ST_MakePoint(83.3129231, 17.7100583), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3129231, 17.7100583), 4326) LIMIT 1;
    -- ABC hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'ABC hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3090178, 17.7070739), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3090178, 17.7070739), 4326) LIMIT 1;
    -- Apex hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Apex hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3089749, 17.7075645), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3089749, 17.7075645), 4326) LIMIT 1;
    -- Usa hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Usa hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3087882, 17.7078558), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3087882, 17.7078558), 4326) LIMIT 1;
    -- Apna bazar (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Apna bazar', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3091465, 17.7080551), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3091465, 17.7080551), 4326) LIMIT 1;
    -- Simhadri Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Simhadri Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3104939, 17.7082343), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3104939, 17.7082343), 4326) LIMIT 1;
    -- Apollow pharmacy (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Apollow pharmacy', 'Hospital', ST_SetSRID(ST_MakePoint(83.3099146, 17.7082036), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3099146, 17.7082036), 4326) LIMIT 1;
    -- Nature cure hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Nature cure hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3111377, 17.7076415), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3111377, 17.7076415), 4326) LIMIT 1;
    -- Life  medical centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Life  medical centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.308198, 17.7076108), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.308198, 17.7076108), 4326) LIMIT 1;
    -- Doctors care medical centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Doctors care medical centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.3093781, 17.7079072), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3093781, 17.7079072), 4326) LIMIT 1;
    -- Sriddha hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sriddha hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3094103, 17.7081218), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3094103, 17.7081218), 4326) LIMIT 1;
    -- Pinnacle (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Pinnacle', 'Hospital', ST_SetSRID(ST_MakePoint(83.3082425, 17.7636985), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3082425, 17.7636985), 4326) LIMIT 1;
    -- Q1 Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Q1 Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3078726, 17.7624241), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3078726, 17.7624241), 4326) LIMIT 1;
    -- GIMS (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'GIMS', 'Hospital', ST_SetSRID(ST_MakePoint(83.3116458, 17.7620819), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3116458, 17.7620819), 4326) LIMIT 1;
    -- Triangle Gym and Park (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Triangle Gym and Park', 'Park', ST_SetSRID(ST_MakePoint(82.9986596, 17.700263), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9986596, 17.700263), 4326) LIMIT 1;
    -- park ketcric (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'park ketcric', 'Park', ST_SetSRID(ST_MakePoint(82.9991988, 17.6989303), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9991988, 17.6989303), 4326) LIMIT 1;
    -- samyuktha public school (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'samyuktha public school', 'School', ST_SetSRID(ST_MakePoint(82.9986088, 17.7006249), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9986088, 17.7006249), 4326) LIMIT 1;
    -- samyuktha degree college (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'samyuktha degree college', 'School', ST_SetSRID(ST_MakePoint(82.9988644, 17.7004791), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9988644, 17.7004791), 4326) LIMIT 1;
    -- Apex Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Apex Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3090204, 17.7067706), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3090204, 17.7067706), 4326) LIMIT 1;
    -- Dj Clinic (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dj Clinic', 'Hospital', ST_SetSRID(ST_MakePoint(83.3354643, 17.7440297), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3354643, 17.7440297), 4326) LIMIT 1;
    -- Ramyasai Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ramyasai Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.0016124, 17.6861622), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0016124, 17.6861622), 4326) LIMIT 1;
    -- Vision Care Centre (Super Speciality Eye Hospital) (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vision Care Centre (Super Speciality Eye Hospital)', 'Hospital', ST_SetSRID(ST_MakePoint(83.295486, 17.7277139), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.295486, 17.7277139), 4326) LIMIT 1;
    -- Apoorva Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Apoorva Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3075653, 17.7300554), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3075653, 17.7300554), 4326) LIMIT 1;
    -- Anapoorna Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Anapoorna Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3047865, 17.7273371), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3047865, 17.7273371), 4326) LIMIT 1;
    -- Maxivision Super Speciality Eye Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Maxivision Super Speciality Eye Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.304584, 17.7269219), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.304584, 17.7269219), 4326) LIMIT 1;
    -- Care Dental Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Care Dental Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.307247, 17.7363435), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.307247, 17.7363435), 4326) LIMIT 1;
    -- M.G.R. Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'M.G.R. Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3309823, 17.7325361), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3309823, 17.7325361), 4326) LIMIT 1;
    -- Rhea Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Rhea Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3041777, 17.7092414), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3041777, 17.7092414), 4326) LIMIT 1;
    -- Adarsha Orthopaedic Center (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Adarsha Orthopaedic Center', 'Hospital', ST_SetSRID(ST_MakePoint(83.3117884, 17.7109406), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3117884, 17.7109406), 4326) LIMIT 1;
    -- Prabha Clinic and Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Prabha Clinic and Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.3041039, 17.7162921), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3041039, 17.7162921), 4326) LIMIT 1;
    -- Mythri Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Mythri Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.3089118, 17.7071258), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3089118, 17.7071258), 4326) LIMIT 1;
    -- Gowtami Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Gowtami Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2063977, 17.6825514), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2063977, 17.6825514), 4326) LIMIT 1;
    -- Satyam Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Satyam Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2187018, 17.7499948), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2187018, 17.7499948), 4326) LIMIT 1;
    -- Venkatarama Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Venkatarama Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3031356, 17.7278327), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3031356, 17.7278327), 4326) LIMIT 1;
    -- SR Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'SR Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2173438, 17.752968), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2173438, 17.752968), 4326) LIMIT 1;
    -- Good Health New Central Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Good Health New Central Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3055443, 17.7379611), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3055443, 17.7379611), 4326) LIMIT 1;
    -- Dr Rama Rao Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr Rama Rao Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2790163, 17.7332163), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2790163, 17.7332163), 4326) LIMIT 1;
    -- Vijetha Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vijetha Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3030283, 17.7106199), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3030283, 17.7106199), 4326) LIMIT 1;
    -- Sun Multi Speciality Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sun Multi Speciality Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.277593, 17.7350755), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.277593, 17.7350755), 4326) LIMIT 1;
    -- Abc Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Abc Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3092725, 17.7061715), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3092725, 17.7061715), 4326) LIMIT 1;
    -- Suma Maternity Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Suma Maternity Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.2642758, 17.7463633), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2642758, 17.7463633), 4326) LIMIT 1;
    -- Lion Dist 324 C, Cancer Treatment and Research Center (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Lion Dist 324 C, Cancer Treatment and Research Center', 'Hospital', ST_SetSRID(ST_MakePoint(83.3083713, 17.7443962), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3083713, 17.7443962), 4326) LIMIT 1;
    -- Amg Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Amg Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3146349, 17.7382076), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3146349, 17.7382076), 4326) LIMIT 1;
    -- Indus Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Indus Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3026153, 17.7108601), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3026153, 17.7108601), 4326) LIMIT 1;
    -- St.Ann''s Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'St.Ann''s Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.8137411, 17.9135879), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8137411, 17.9135879), 4326) LIMIT 1;
    -- Visakha Ent Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Visakha Ent Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3107545, 17.7264096), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3107545, 17.7264096), 4326) LIMIT 1;
    -- Susruta Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Susruta Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.208107, 17.6853215), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.208107, 17.6853215), 4326) LIMIT 1;
    -- R K Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'R K Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.1970797, 17.6824479), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1970797, 17.6824479), 4326) LIMIT 1;
    -- Padmasri Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Padmasri Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3036815, 17.7382447), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3036815, 17.7382447), 4326) LIMIT 1;
    -- Raghavendra Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Raghavendra Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3041066, 17.739964), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3041066, 17.739964), 4326) LIMIT 1;
    -- Sujatha Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sujatha Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.1985898, 17.6840514), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1985898, 17.6840514), 4326) LIMIT 1;
    -- Centre For Sight (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Centre For Sight', 'Hospital', ST_SetSRID(ST_MakePoint(83.3044016, 17.7364998), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3044016, 17.7364998), 4326) LIMIT 1;
    -- Krishna Maternity And Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Krishna Maternity And Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.293823, 17.7288061), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.293823, 17.7288061), 4326) LIMIT 1;
    -- Amrutha Nursing Home Private Limited (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Amrutha Nursing Home Private Limited', 'Hospital', ST_SetSRID(ST_MakePoint(83.2960858, 17.69981), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2960858, 17.69981), 4326) LIMIT 1;
    -- Padmaja Hospital - Gajuwaka (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Padmaja Hospital - Gajuwaka', 'Hospital', ST_SetSRID(ST_MakePoint(83.203619, 17.6867743), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.203619, 17.6867743), 4326) LIMIT 1;
    -- Care Hospital - Maharanipet (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Care Hospital - Maharanipet', 'Hospital', ST_SetSRID(ST_MakePoint(83.3054544, 17.7097505), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3054544, 17.7097505), 4326) LIMIT 1;
    -- Samudra Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Samudra Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3037458, 17.7103989), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3037458, 17.7103989), 4326) LIMIT 1;
    -- Vikram Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vikram Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0013013, 17.6870707), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0013013, 17.6870707), 4326) LIMIT 1;
    -- Abhaya Critical Care (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Abhaya Critical Care', 'Hospital', ST_SetSRID(ST_MakePoint(83.3043534, 17.7102328), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3043534, 17.7102328), 4326) LIMIT 1;
    -- Sunita Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sunita Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.3115497, 17.7362763), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3115497, 17.7362763), 4326) LIMIT 1;
    -- Waltair Multicare Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Waltair Multicare Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.333627, 17.7320085), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.333627, 17.7320085), 4326) LIMIT 1;
    -- Siddharth Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Siddharth Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3038954, 17.7118451), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3038954, 17.7118451), 4326) LIMIT 1;
    -- Visakha Children Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Visakha Children Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3125274, 17.7108448), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3125274, 17.7108448), 4326) LIMIT 1;
    -- Sraddha Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sraddha Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3086663, 17.7083599), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3086663, 17.7083599), 4326) LIMIT 1;
    -- Tirumala Vijaya Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Tirumala Vijaya Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3352873, 17.7440143), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3352873, 17.7440143), 4326) LIMIT 1;
    -- Aarif Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Aarif Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.309819, 17.7224323), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.309819, 17.7224323), 4326) LIMIT 1;
    -- Vijaya Medical Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vijaya Medical Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.3107518, 17.7099032), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3107518, 17.7099032), 4326) LIMIT 1;
    -- OMNI RK Super Specialty Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'OMNI RK Super Specialty Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3116168, 17.7186287), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3116168, 17.7186287), 4326) LIMIT 1;
    -- Sri Rama Mother and Child Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Rama Mother and Child Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.9366171, 17.8269229), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9366171, 17.8269229), 4326) LIMIT 1;
    -- Vasan Eye Care Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vasan Eye Care Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3087254, 17.7168287), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3087254, 17.7168287), 4326) LIMIT 1;
    -- Lazarus Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Lazarus Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3083036, 17.7171512), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3083036, 17.7171512), 4326) LIMIT 1;
    -- Sai Satya Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sai Satya Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3147241, 17.7685126), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3147241, 17.7685126), 4326) LIMIT 1;
    -- Bharathi Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Bharathi Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3085356, 17.7108505), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3085356, 17.7108505), 4326) LIMIT 1;
    -- Lawrance and Mayo Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Lawrance and Mayo Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.302677, 17.7124353), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.302677, 17.7124353), 4326) LIMIT 1;
    -- Prema Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Prema Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3740931, 17.8796711), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3740931, 17.8796711), 4326) LIMIT 1;
    -- City Care Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'City Care Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3090506, 17.7066084), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3090506, 17.7066084), 4326) LIMIT 1;
    -- Kamala Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Kamala Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.250969, 17.7404309), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.250969, 17.7404309), 4326) LIMIT 1;
    -- Kalavathi Surgical Hospital and Laparoscopic Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Kalavathi Surgical Hospital and Laparoscopic Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.2990453, 17.7265297), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2990453, 17.7265297), 4326) LIMIT 1;
    -- Subham Prema Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Subham Prema Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3123571, 17.728124), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3123571, 17.728124), 4326) LIMIT 1;
    -- Care Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Care Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3127339, 17.7203686), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3127339, 17.7203686), 4326) LIMIT 1;
    -- Narayana Em school (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Narayana Em school', 'School', ST_SetSRID(ST_MakePoint(83.3004644, 17.7360659), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3004644, 17.7360659), 4326) LIMIT 1;
    -- MyCure Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'MyCure Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3023683, 17.7109237), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3023683, 17.7109237), 4326) LIMIT 1;
    -- Ravi Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ravi Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2998139, 17.7359767), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2998139, 17.7359767), 4326) LIMIT 1;
    -- SKML Retail Store (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'SKML Retail Store', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2344675, 17.770826), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2344675, 17.770826), 4326) LIMIT 1;
    -- SKML junior college gotivada sabbavaram (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'SKML junior college gotivada sabbavaram', 'College', ST_SetSRID(ST_MakePoint(83.1094283, 17.7972825), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1094283, 17.7972825), 4326) LIMIT 1;
    -- Budhil Hotel (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Budhil Hotel', 'Hotel', ST_SetSRID(ST_MakePoint(83.3068515, 17.7257976), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3068515, 17.7257976), 4326) LIMIT 1;
    -- Government Hospital,Viyyampeta (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital,Viyyampeta', 'Hospital', ST_SetSRID(ST_MakePoint(83.1486536, 17.9231609), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1486536, 17.9231609), 4326) LIMIT 1;
    -- Government Hospital,Bheemili (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital,Bheemili', 'Hospital', ST_SetSRID(ST_MakePoint(83.4513908, 17.8877592), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4513908, 17.8877592), 4326) LIMIT 1;
    -- Government Hospital,Cheedikada (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital,Cheedikada', 'Hospital', ST_SetSRID(ST_MakePoint(82.8931162, 17.927342), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8931162, 17.927342), 4326) LIMIT 1;
    -- GVMC hospital,FRU Arilova (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'GVMC hospital,FRU Arilova', 'Hospital', ST_SetSRID(ST_MakePoint(83.3172347, 17.7686588), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3172347, 17.7686588), 4326) LIMIT 1;
    -- Government Hospital, Jami (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital, Jami', 'Hospital', ST_SetSRID(ST_MakePoint(83.2657175, 18.0515574), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2657175, 18.0515574), 4326) LIMIT 1;
    -- Government Hospital,Lakkavarapukota (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital,Lakkavarapukota', 'Hospital', ST_SetSRID(ST_MakePoint(83.1526432, 18.0184435), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1526432, 18.0184435), 4326) LIMIT 1;
    -- Government hospital, Rambili (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government hospital, Rambili', 'Hospital', ST_SetSRID(ST_MakePoint(82.9301819, 17.465312), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9301819, 17.465312), 4326) LIMIT 1;
    -- Government Hospital,Pusapatirega (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital,Pusapatirega', 'Hospital', ST_SetSRID(ST_MakePoint(83.552523, 18.0917189), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.552523, 18.0917189), 4326) LIMIT 1;
    -- NTR Government Hospital,Anakapalle (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'NTR Government Hospital,Anakapalle', 'Hospital', ST_SetSRID(ST_MakePoint(83.0067163, 17.6845257), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0067163, 17.6845257), 4326) LIMIT 1;
    -- Government Hospital, Munagapaka (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital, Munagapaka', 'Hospital', ST_SetSRID(ST_MakePoint(82.986613, 17.633837), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.986613, 17.633837), 4326) LIMIT 1;
    -- Government Hospital,Govindapuram (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital,Govindapuram', 'Hospital', ST_SetSRID(ST_MakePoint(83.6129037, 18.0938621), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.6129037, 18.0938621), 4326) LIMIT 1;
    -- Government Hospital, K Kotapadu (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital, K Kotapadu', 'Hospital', ST_SetSRID(ST_MakePoint(83.0408116, 17.8883305), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0408116, 17.8883305), 4326) LIMIT 1;
    -- Government Hospital,Madugula (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital,Madugula', 'Hospital', ST_SetSRID(ST_MakePoint(82.8185393, 17.9183224), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8185393, 17.9183224), 4326) LIMIT 1;
    -- Government Hospital,Regupalem (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital,Regupalem', 'Hospital', ST_SetSRID(ST_MakePoint(82.816752, 17.5178218), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.816752, 17.5178218), 4326) LIMIT 1;
    -- Cghs wellness centre (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Cghs wellness centre', 'Clinic', ST_SetSRID(ST_MakePoint(83.3323437, 17.7285015), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3323437, 17.7285015), 4326) LIMIT 1;
    -- Hotel Sai national (Guest House)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Sai national', 'Guest House', ST_SetSRID(ST_MakePoint(83.2983783, 17.7255262), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2983783, 17.7255262), 4326) LIMIT 1;
    -- dipolama college (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'dipolama college', 'College', ST_SetSRID(ST_MakePoint(83.4184802, 18.0999984), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4184802, 18.0999984), 4326) LIMIT 1;
    -- Canteen (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Canteen', 'Hotel', ST_SetSRID(ST_MakePoint(83.4010232, 18.0197117), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4010232, 18.0197117), 4326) LIMIT 1;
    -- Ashwini Health Centre (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ashwini Health Centre', 'Clinic', ST_SetSRID(ST_MakePoint(83.1845199, 17.8959143), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1845199, 17.8959143), 4326) LIMIT 1;
    -- Physiotherapy Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Physiotherapy Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.1875211, 17.8993085), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1875211, 17.8993085), 4326) LIMIT 1;
    -- Sri Venkata Sai Multi Specialty Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Venkata Sai Multi Specialty Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.1863316, 17.8951943), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1863316, 17.8951943), 4326) LIMIT 1;
    -- Niharika Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Niharika Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.1856362, 17.8999331), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1856362, 17.8999331), 4326) LIMIT 1;
    -- Simhachalam Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Simhachalam Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.5535387, 18.093818), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.5535387, 18.093818), 4326) LIMIT 1;
    -- Dr. B Ramarao Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. B Ramarao Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.1862515, 17.8976322), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1862515, 17.8976322), 4326) LIMIT 1;
    -- Government Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3866502, 18.0944637), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3866502, 18.0944637), 4326) LIMIT 1;
    -- Leprosy Mission Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Leprosy Mission Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.39122, 18.064523), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.39122, 18.064523), 4326) LIMIT 1;
    -- Swamy Eye Hospial (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Swamy Eye Hospial', 'Hospital', ST_SetSRID(ST_MakePoint(83.4014713, 18.0998794), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4014713, 18.0998794), 4326) LIMIT 1;
    -- Surya Homoeo Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Surya Homoeo Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3879929, 18.0913973), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3879929, 18.0913973), 4326) LIMIT 1;
    -- Dr. Y. V. Siva Sankara Murty Children Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Y. V. Siva Sankara Murty Children Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.4163525, 18.0990583), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4163525, 18.0990583), 4326) LIMIT 1;
    -- Dhanvantari Piles Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dhanvantari Piles Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.388523, 18.0919675), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.388523, 18.0919675), 4326) LIMIT 1;
    -- Bethany Christian Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Bethany Christian Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.347569, 17.8027947), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.347569, 17.8027947), 4326) LIMIT 1;
    -- Dr. Adams Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Adams Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3508178, 17.7998444), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3508178, 17.7998444), 4326) LIMIT 1;
    -- Medinar Polyclinics (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Medinar Polyclinics', 'Clinic', ST_SetSRID(ST_MakePoint(83.293382, 17.7267225), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.293382, 17.7267225), 4326) LIMIT 1;
    -- Jishnu Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Jishnu Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.4058416, 17.8386364), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4058416, 17.8386364), 4326) LIMIT 1;
    -- Master Homeo Vaidyalayam (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Master Homeo Vaidyalayam', 'Hospital', ST_SetSRID(ST_MakePoint(83.298429, 17.7341833), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.298429, 17.7341833), 4326) LIMIT 1;
    -- Dr. Hedgewar School Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Hedgewar School Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3251813, 17.8830152), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3251813, 17.8830152), 4326) LIMIT 1;
    -- Gayatri Health Care (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Gayatri Health Care', 'Clinic', ST_SetSRID(ST_MakePoint(83.3362101, 17.7452893), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3362101, 17.7452893), 4326) LIMIT 1;
    -- Usha Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Usha Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3561911, 17.8112947), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3561911, 17.8112947), 4326) LIMIT 1;
    -- Ramakrishna ENT Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ramakrishna ENT Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3557704, 17.8118168), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3557704, 17.8118168), 4326) LIMIT 1;
    -- Dr. Ramarao Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Ramarao Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.4529898, 17.8896873), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4529898, 17.8896873), 4326) LIMIT 1;
    -- Piles Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Piles Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3600858, 17.819961), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3600858, 17.819961), 4326) LIMIT 1;
    -- Day & Night Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Day & Night Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.310741, 17.7289618), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.310741, 17.7289618), 4326) LIMIT 1;
    -- NRI General Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'NRI General Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.426394, 17.921695), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.426394, 17.921695), 4326) LIMIT 1;
    -- ESI Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'ESI Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.423953, 17.927652), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.423953, 17.927652), 4326) LIMIT 1;
    -- Dr. Perumallu Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Perumallu Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.452386, 17.8892578), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.452386, 17.8892578), 4326) LIMIT 1;
    -- Anand Piles Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Anand Piles Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.4500642, 17.8944854), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4500642, 17.8944854), 4326) LIMIT 1;
    -- Sanjivi Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sanjivi Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.328678, 17.743927), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.328678, 17.743927), 4326) LIMIT 1;
    -- Bhagavathi Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Bhagavathi Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3042268, 17.7433959), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3042268, 17.7433959), 4326) LIMIT 1;
    -- Sri Venkateswara Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Venkateswara Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.4123172, 17.8338229), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4123172, 17.8338229), 4326) LIMIT 1;
    -- Government Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.296865, 17.735493), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.296865, 17.735493), 4326) LIMIT 1;
    -- Kundan Family Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Kundan Family Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.357939, 17.783556), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.357939, 17.783556), 4326) LIMIT 1;
    -- Sai Spoorthy Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sai Spoorthy Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3043823, 17.7274681), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3043823, 17.7274681), 4326) LIMIT 1;
    -- Amma Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Amma Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3307524, 17.7468553), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3307524, 17.7468553), 4326) LIMIT 1;
    -- Sandhya Eye Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sandhya Eye Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3169337, 17.7322507), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3169337, 17.7322507), 4326) LIMIT 1;
    -- Arogya Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Arogya Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.427302, 17.9310994), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.427302, 17.9310994), 4326) LIMIT 1;
    -- Cure Speciality Clinics (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Cure Speciality Clinics', 'Clinic', ST_SetSRID(ST_MakePoint(83.3535511, 17.8025027), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3535511, 17.8025027), 4326) LIMIT 1;
    -- Sri Krishna Hospital And Mrudula Kidney Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Krishna Hospital And Mrudula Kidney Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.3381086, 17.7398696), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3381086, 17.7398696), 4326) LIMIT 1;
    -- Ramkumar Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ramkumar Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2989253, 17.7347439), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2989253, 17.7347439), 4326) LIMIT 1;
    -- Reddy Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Reddy Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3099357, 17.7295515), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3099357, 17.7295515), 4326) LIMIT 1;
    -- Kalavathy Maternity Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Kalavathy Maternity Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2912686, 17.7301424), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2912686, 17.7301424), 4326) LIMIT 1;
    -- S.V Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'S.V Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2982102, 17.7315298), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2982102, 17.7315298), 4326) LIMIT 1;
    -- Naidu Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Naidu Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.4480273, 17.8948381), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4480273, 17.8948381), 4326) LIMIT 1;
    -- Sri Sai Pallavi First Aid Centre and Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Sai Pallavi First Aid Centre and Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.4461276, 17.8952546), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4461276, 17.8952546), 4326) LIMIT 1;
    -- Lakshmi Gayathri Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Lakshmi Gayathri Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2988976, 17.7360864), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2988976, 17.7360864), 4326) LIMIT 1;
    -- Dr. Ravi Child Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Ravi Child Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3136747, 17.7380085), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3136747, 17.7380085), 4326) LIMIT 1;
    -- Saroja Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Saroja Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.300686, 17.733482), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.300686, 17.733482), 4326) LIMIT 1;
    -- Surya Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Surya Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3397326, 17.8059869), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3397326, 17.8059869), 4326) LIMIT 1;
    -- Aman Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Aman Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3621718, 17.8213674), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3621718, 17.8213674), 4326) LIMIT 1;
    -- A1 Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'A1 Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2994272, 17.739424), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2994272, 17.739424), 4326) LIMIT 1;
    -- Mukhyamantri Arogya Kendram (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Mukhyamantri Arogya Kendram', 'Clinic', ST_SetSRID(ST_MakePoint(83.3206661, 17.7437712), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3206661, 17.7437712), 4326) LIMIT 1;
    -- Mukyamantri Arogya Kendram (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Mukyamantri Arogya Kendram', 'Hospital', ST_SetSRID(ST_MakePoint(83.4451285, 17.8952319), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4451285, 17.8952319), 4326) LIMIT 1;
    -- CARE Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'CARE Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.294103, 17.7275716), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.294103, 17.7275716), 4326) LIMIT 1;
    -- Surya Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Surya Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.423704, 17.9321277), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.423704, 17.9321277), 4326) LIMIT 1;
    -- Medi Cos Den Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Medi Cos Den Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3591053, 17.7636399), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3591053, 17.7636399), 4326) LIMIT 1;
    -- Sri Surya Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Surya Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.340338, 17.7427806), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.340338, 17.7427806), 4326) LIMIT 1;
    -- Aruna ENT Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Aruna ENT Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3002306, 17.737158), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3002306, 17.737158), 4326) LIMIT 1;
    -- Sri Krishna Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Krishna Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3003628, 17.7346615), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3003628, 17.7346615), 4326) LIMIT 1;
    -- Sri Sai Sanjeevani Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Sai Sanjeevani Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3577903, 17.7792428), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3577903, 17.7792428), 4326) LIMIT 1;
    -- Sri Sai Piles Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Sai Piles Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3665288, 17.8695422), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3665288, 17.8695422), 4326) LIMIT 1;
    -- Ujhwal Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ujhwal Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3555939, 17.8131242), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3555939, 17.8131242), 4326) LIMIT 1;
    -- Navratna Kesava Rao Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Navratna Kesava Rao Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.4536651, 17.8900803), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4536651, 17.8900803), 4326) LIMIT 1;
    -- Dr. Kamalamma Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Kamalamma Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2936785, 17.7289528), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2936785, 17.7289528), 4326) LIMIT 1;
    -- National Orthopaedic Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'National Orthopaedic Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.3116732, 17.7364007), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3116732, 17.7364007), 4326) LIMIT 1;
    -- Raphah Hospital (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Raphah Hospital', 'Clinic', ST_SetSRID(ST_MakePoint(83.31229, 17.735531), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.31229, 17.735531), 4326) LIMIT 1;
    -- Sri Sai Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Sai Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.4034376, 17.8397834), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4034376, 17.8397834), 4326) LIMIT 1;
    -- Vivekanandha Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vivekanandha Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2982472, 17.7318218), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2982472, 17.7318218), 4326) LIMIT 1;
    -- Government ENT Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government ENT Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3141989, 17.745865), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3141989, 17.745865), 4326) LIMIT 1;
    -- Padmavathi Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Padmavathi Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3075918, 17.7414689), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3075918, 17.7414689), 4326) LIMIT 1;
    -- GITAM Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'GITAM Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3746555, 17.7846774), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3746555, 17.7846774), 4326) LIMIT 1;
    -- Shanthi Maternity and Infertility Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Shanthi Maternity and Infertility Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3316373, 17.745914), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3316373, 17.745914), 4326) LIMIT 1;
    -- Sri Chandra Ortho Care (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Chandra Ortho Care', 'Clinic', ST_SetSRID(ST_MakePoint(83.2950164, 17.739513), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2950164, 17.739513), 4326) LIMIT 1;
    -- Smar City Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Smar City Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.30115, 17.7325871), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.30115, 17.7325871), 4326) LIMIT 1;
    -- Krishnaveni Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Krishnaveni Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2947484, 17.7301583), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2947484, 17.7301583), 4326) LIMIT 1;
    -- Visakha Multispeciality Clinics (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Visakha Multispeciality Clinics', 'Clinic', ST_SetSRID(ST_MakePoint(83.3649326, 17.8147685), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3649326, 17.8147685), 4326) LIMIT 1;
    -- Aditya Physiotherapy And First Aid Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Aditya Physiotherapy And First Aid Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.4530473, 17.8895311), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4530473, 17.8895311), 4326) LIMIT 1;
    -- Lb Prasad Medical (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Lb Prasad Medical', 'Clinic', ST_SetSRID(ST_MakePoint(83.2941227, 17.7298279), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2941227, 17.7298279), 4326) LIMIT 1;
    -- Guru Ayurcare (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Guru Ayurcare', 'Clinic', ST_SetSRID(ST_MakePoint(83.3546555, 17.8098904), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3546555, 17.8098904), 4326) LIMIT 1;
    -- Morpheus Padmasri International IVF Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Morpheus Padmasri International IVF Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.3034712, 17.7380243), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3034712, 17.7380243), 4326) LIMIT 1;
    -- Amrutha Clinic & Lab (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Amrutha Clinic & Lab', 'Clinic', ST_SetSRID(ST_MakePoint(83.3644588, 17.8118167), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3644588, 17.8118167), 4326) LIMIT 1;
    -- GK''s Rainbow Dental Superspeciality Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'GK''s Rainbow Dental Superspeciality Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3535257, 17.8024524), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3535257, 17.8024524), 4326) LIMIT 1;
    -- Krishna Children Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Krishna Children Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.293632, 17.7289115), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.293632, 17.7289115), 4326) LIMIT 1;
    -- Master Homoeo Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Master Homoeo Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.3077406, 17.7274279), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3077406, 17.7274279), 4326) LIMIT 1;
    -- Sri Sai Ram Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Sai Ram Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2918881, 17.7322439), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2918881, 17.7322439), 4326) LIMIT 1;
    -- Dr. Ramakrishna Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Ramakrishna Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.4260617, 17.9309318), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4260617, 17.9309318), 4326) LIMIT 1;
    -- Dr. P.P.Srinivas Murthy Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. P.P.Srinivas Murthy Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.2988909, 17.7415765), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2988909, 17.7415765), 4326) LIMIT 1;
    -- Visakha Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Visakha Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3574768, 17.8153454), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3574768, 17.8153454), 4326) LIMIT 1;
    -- Soham ENT Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Soham ENT Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.297657, 17.7442418), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.297657, 17.7442418), 4326) LIMIT 1;
    -- Keerthana Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Keerthana Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.3467145, 17.8040379), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3467145, 17.8040379), 4326) LIMIT 1;
    -- Padmavathi Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Padmavathi Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.4191803, 17.9307079), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4191803, 17.9307079), 4326) LIMIT 1;
    -- Sri Gayatri Nursing Home & Kasturi Maternity Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Gayatri Nursing Home & Kasturi Maternity Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3331524, 17.7244631), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3331524, 17.7244631), 4326) LIMIT 1;
    -- Paja Jyorhi Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Paja Jyorhi Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(82.9840972, 17.6827281), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9840972, 17.6827281), 4326) LIMIT 1;
    -- Phani Poly Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Phani Poly Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.001288, 17.6861511), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.001288, 17.6861511), 4326) LIMIT 1;
    -- Tirumala Poly Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Tirumala Poly Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.0435664, 17.8860664), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0435664, 17.8860664), 4326) LIMIT 1;
    -- Tirumala Jyoti Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Tirumala Jyoti Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.001827, 17.683136), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.001827, 17.683136), 4326) LIMIT 1;
    -- Government Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.9560418, 17.7467671), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9560418, 17.7467671), 4326) LIMIT 1;
    -- Dr. Soma Raju Children Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Soma Raju Children Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0101255, 17.6882064), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0101255, 17.6882064), 4326) LIMIT 1;
    -- Sitarama Nursing Home (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sitarama Nursing Home', 'Clinic', ST_SetSRID(ST_MakePoint(82.933252, 17.8277971), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.933252, 17.8277971), 4326) LIMIT 1;
    -- Kalyani Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Kalyani Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.001839, 17.687728), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.001839, 17.687728), 4326) LIMIT 1;
    -- Annapurna Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Annapurna Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.011245, 17.6842691), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.011245, 17.6842691), 4326) LIMIT 1;
    -- SS Dental Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'SS Dental Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.009283, 17.688264), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.009283, 17.688264), 4326) LIMIT 1;
    -- Maternity Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Maternity Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0101274, 17.6848737), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0101274, 17.6848737), 4326) LIMIT 1;
    -- Sai Teja Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sai Teja Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.00072, 17.686424), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.00072, 17.686424), 4326) LIMIT 1;
    -- Benargy Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Benargy Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0010632, 17.6753904), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0010632, 17.6753904), 4326) LIMIT 1;
    -- Sri Sagar Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Sagar Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0021022, 17.6892581), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0021022, 17.6892581), 4326) LIMIT 1;
    -- R.K Medical Centre (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'R.K Medical Centre', 'Clinic', ST_SetSRID(ST_MakePoint(83.0032805, 17.6863639), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0032805, 17.6863639), 4326) LIMIT 1;
    -- Abhay Arogya Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Abhay Arogya Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.9368591, 17.8278456), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9368591, 17.8278456), 4326) LIMIT 1;
    -- Sri Vijaya Lakshmi Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Vijaya Lakshmi Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.9274015, 17.8297069), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9274015, 17.8297069), 4326) LIMIT 1;
    -- Sri Srinivasa Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Srinivasa Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.8128916, 17.9169656), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8128916, 17.9169656), 4326) LIMIT 1;
    -- Srinivasa Children''s Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Srinivasa Children''s Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.002889, 17.688484), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.002889, 17.688484), 4326) LIMIT 1;
    -- Government Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.9828155, 17.9925538), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9828155, 17.9925538), 4326) LIMIT 1;
    -- Thummapala Primary Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Thummapala Primary Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.9985248, 17.7092053), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9985248, 17.7092053), 4326) LIMIT 1;
    -- London Children''s Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'London Children''s Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0024749, 17.6852716), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0024749, 17.6852716), 4326) LIMIT 1;
    -- Arogyaraksha Polyclinic and Diagnostics (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Arogyaraksha Polyclinic and Diagnostics', 'Clinic', ST_SetSRID(ST_MakePoint(82.8601424, 17.5498362), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8601424, 17.5498362), 4326) LIMIT 1;
    -- Gollaprolu Children''s Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Gollaprolu Children''s Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.8529786, 17.5478426), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8529786, 17.5478426), 4326) LIMIT 1;
    -- Usha Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Usha Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(82.856505, 17.5478222), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.856505, 17.5478222), 4326) LIMIT 1;
    -- Lakshmi Children Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Lakshmi Children Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.9417718, 17.8250127), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9417718, 17.8250127), 4326) LIMIT 1;
    -- Nirmala Maternity Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Nirmala Maternity Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.00227, 17.6854923), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.00227, 17.6854923), 4326) LIMIT 1;
    -- Ayyappa Gupta Eye Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ayyappa Gupta Eye Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0037356, 17.6916683), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0037356, 17.6916683), 4326) LIMIT 1;
    -- Government Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.9988148, 17.8402661), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9988148, 17.8402661), 4326) LIMIT 1;
    -- Usha Prime Multispeciality Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Usha Prime Multispeciality Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.001744, 17.687618), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.001744, 17.687618), 4326) LIMIT 1;
    -- Janaseva Eye Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Janaseva Eye Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.8533103, 17.5516438), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8533103, 17.5516438), 4326) LIMIT 1;
    -- Dr. K. Venkatesh Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. K. Venkatesh Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.8906247, 17.9272601), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8906247, 17.9272601), 4326) LIMIT 1;
    -- Satyadev ENT Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Satyadev ENT Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.001365, 17.684444), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.001365, 17.684444), 4326) LIMIT 1;
    -- Spark Dental Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Spark Dental Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.9391521, 17.82508), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9391521, 17.82508), 4326) LIMIT 1;
    -- Sree Seshapadma Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sree Seshapadma Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.8517581, 17.5534898), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8517581, 17.5534898), 4326) LIMIT 1;
    -- Gadam Dental Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Gadam Dental Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.002401, 17.687646), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.002401, 17.687646), 4326) LIMIT 1;
    -- Medikon Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Medikon Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.001142, 17.680999), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.001142, 17.680999), 4326) LIMIT 1;
    -- Devi Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Devi Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(82.981522, 17.990629), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.981522, 17.990629), 4326) LIMIT 1;
    -- Ravi Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ravi Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.009456, 17.686005), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.009456, 17.686005), 4326) LIMIT 1;
    -- Laxmi Orthopaedic Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Laxmi Orthopaedic Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.005706, 17.68721), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.005706, 17.68721), 4326) LIMIT 1;
    -- Sai Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sai Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.0429259, 17.8868669), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0429259, 17.8868669), 4326) LIMIT 1;
    -- Sapthagiri Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sapthagiri Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0099047, 17.69098), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0099047, 17.69098), 4326) LIMIT 1;
    -- Sri Surya Homoeo Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Surya Homoeo Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(82.9401635, 17.8246446), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9401635, 17.8246446), 4326) LIMIT 1;
    -- Dr. Thrinadh Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Thrinadh Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.8498751, 17.5452357), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8498751, 17.5452357), 4326) LIMIT 1;
    -- SS Physiotherapy Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'SS Physiotherapy Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(82.8561331, 17.5480898), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8561331, 17.5480898), 4326) LIMIT 1;
    -- Dr. Ram Mohan Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Ram Mohan Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0015806, 17.685712), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0015806, 17.685712), 4326) LIMIT 1;
    -- Mother and Child Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Mother and Child Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.001269, 17.685934), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.001269, 17.685934), 4326) LIMIT 1;
    -- Siddhartha Nursing Home (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Siddhartha Nursing Home', 'Hospital', ST_SetSRID(ST_MakePoint(83.0022801, 17.6843742), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0022801, 17.6843742), 4326) LIMIT 1;
    -- Vijaya Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vijaya Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.849726, 17.544446), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.849726, 17.544446), 4326) LIMIT 1;
    -- Sri Venkateswara Nursing Home (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Venkateswara Nursing Home', 'Clinic', ST_SetSRID(ST_MakePoint(83.000991, 17.690373), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.000991, 17.690373), 4326) LIMIT 1;
    -- Krishna Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Krishna Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(82.9342467, 17.8280367), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9342467, 17.8280367), 4326) LIMIT 1;
    -- Sri Venkateswara Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Venkateswara Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0006719, 17.6777911), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0006719, 17.6777911), 4326) LIMIT 1;
    -- Kanakadurga Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Kanakadurga Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.312939, 17.7101086), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.312939, 17.7101086), 4326) LIMIT 1;
    -- Sunrise Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sunrise Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.2662977, 17.7409007), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2662977, 17.7409007), 4326) LIMIT 1;
    -- Sunrise Childern Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sunrise Childern Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2053903, 17.687897), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2053903, 17.687897), 4326) LIMIT 1;
    -- Sri Krishna Orthopaedic Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Krishna Orthopaedic Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.193854, 17.6843101), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.193854, 17.6843101), 4326) LIMIT 1;
    -- Sandhya Sree Nursing Home (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sandhya Sree Nursing Home', 'Clinic', ST_SetSRID(ST_MakePoint(83.201472, 17.6830346), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.201472, 17.6830346), 4326) LIMIT 1;
    -- A N Beach Hospital - Multi Speciality Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'A N Beach Hospital - Multi Speciality Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3197589, 17.7129243), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3197589, 17.7129243), 4326) LIMIT 1;
    -- Lakshmi Nursing Home (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Lakshmi Nursing Home', 'Clinic', ST_SetSRID(ST_MakePoint(83.2128855, 17.6868428), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2128855, 17.6868428), 4326) LIMIT 1;
    -- Dr. Mangamma Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Mangamma Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3045397, 17.7100946), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3045397, 17.7100946), 4326) LIMIT 1;
    -- Sri Lakhmi ENT Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Lakhmi ENT Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.1975029, 17.6829789), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1975029, 17.6829789), 4326) LIMIT 1;
    -- BHEL Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'BHEL Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.199526, 17.702135), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.199526, 17.702135), 4326) LIMIT 1;
    -- Visakha Child Care Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Visakha Child Care Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.2016314, 17.6846529), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2016314, 17.6846529), 4326) LIMIT 1;
    -- Durga Bhavani Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Durga Bhavani Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(82.8037473, 17.4534855), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8037473, 17.4534855), 4326) LIMIT 1;
    -- Piles Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Piles Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2133794, 17.6871805), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2133794, 17.6871805), 4326) LIMIT 1;
    -- Visakha Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Visakha Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.304361, 17.710144), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.304361, 17.710144), 4326) LIMIT 1;
    -- Sreenivasa Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sreenivasa Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2060963, 17.8231815), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2060963, 17.8231815), 4326) LIMIT 1;
    -- Simhagiri Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Simhagiri Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2127666, 17.6863477), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2127666, 17.6863477), 4326) LIMIT 1;
    -- City Hospital Ortho & Specialities (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'City Hospital Ortho & Specialities', 'Hospital', ST_SetSRID(ST_MakePoint(83.2053196, 17.6852466), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2053196, 17.6852466), 4326) LIMIT 1;
    -- Medicover Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Medicover Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.313972, 17.712323), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.313972, 17.712323), 4326) LIMIT 1;
    -- Rotary Free Homeo Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Rotary Free Homeo Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.2011967, 17.6723936), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2011967, 17.6723936), 4326) LIMIT 1;
    -- KIMS ICON Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'KIMS ICON Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.1956548, 17.7141817), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1956548, 17.7141817), 4326) LIMIT 1;
    -- Life Spring Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Life Spring Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.243601, 17.688339), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.243601, 17.688339), 4326) LIMIT 1;
    -- Sri Krishna Pavan Homeo Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Krishna Pavan Homeo Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.211053, 17.796478), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.211053, 17.796478), 4326) LIMIT 1;
    -- Starzen Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Starzen Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.9771482, 17.562306), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9771482, 17.562306), 4326) LIMIT 1;
    -- Sri Lakshmi Children Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Lakshmi Children Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2078579, 17.6854195), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2078579, 17.6854195), 4326) LIMIT 1;
    -- Vijaya Krishna Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vijaya Krishna Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.311491, 17.710948), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.311491, 17.710948), 4326) LIMIT 1;
    -- Ankitha Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ankitha Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.1989654, 17.6827868), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1989654, 17.6827868), 4326) LIMIT 1;
    -- Jai Srikrishna Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Jai Srikrishna Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.9768678, 17.5619762), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9768678, 17.5619762), 4326) LIMIT 1;
    -- Hymavathi Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hymavathi Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2192385, 17.7480338), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2192385, 17.7480338), 4326) LIMIT 1;
    -- Pujitha Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Pujitha Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2100702, 17.6844753), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2100702, 17.6844753), 4326) LIMIT 1;
    -- Sarojini Children''s Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sarojini Children''s Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2265444, 17.7445712), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2265444, 17.7445712), 4326) LIMIT 1;
    -- SMS Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'SMS Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2261912, 17.7452036), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2261912, 17.7452036), 4326) LIMIT 1;
    -- Padmaja Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Padmaja Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.2158252, 17.6826577), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2158252, 17.6826577), 4326) LIMIT 1;
    -- Navaratnam - Kesava Rao Charitable Health Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Navaratnam - Kesava Rao Charitable Health Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.2049981, 17.6872165), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2049981, 17.6872165), 4326) LIMIT 1;
    -- Visakha Gynaec & Obst Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Visakha Gynaec & Obst Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2042804, 17.8148001), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2042804, 17.8148001), 4326) LIMIT 1;
    -- Sri Sai Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Sai Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(82.9268567, 17.4679094), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9268567, 17.4679094), 4326) LIMIT 1;
    -- Suryanarayana Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Suryanarayana Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2186331, 17.7508459), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2186331, 17.7508459), 4326) LIMIT 1;
    -- Simhadri Women & Child Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Simhadri Women & Child Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2256151, 17.7656255), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2256151, 17.7656255), 4326) LIMIT 1;
    -- Usha Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Usha Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.1229765, 17.789817), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1229765, 17.789817), 4326) LIMIT 1;
    -- Vizag Ortho & Spine Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vizag Ortho & Spine Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.312442, 17.7104), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.312442, 17.7104), 4326) LIMIT 1;
    -- Sri Amrutha Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Amrutha Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.302862, 17.710327), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.302862, 17.710327), 4326) LIMIT 1;
    -- Mukhyamantri Arogya Kendram (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Mukhyamantri Arogya Kendram', 'Clinic', ST_SetSRID(ST_MakePoint(83.2336948, 17.6836262), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2336948, 17.6836262), 4326) LIMIT 1;
    -- Mamata Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Mamata Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2079845, 17.6869092), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2079845, 17.6869092), 4326) LIMIT 1;
    -- Sri Surya Dental Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Surya Dental Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3103498, 17.709779), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3103498, 17.709779), 4326) LIMIT 1;
    -- Sri Surya Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Surya Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.309857, 17.708149), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.309857, 17.708149), 4326) LIMIT 1;
    -- Bhajrang Skin Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Bhajrang Skin Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.2069228, 17.6861162), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2069228, 17.6861162), 4326) LIMIT 1;
    -- Madhu Skin Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Madhu Skin Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.2060364, 17.6860455), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2060364, 17.6860455), 4326) LIMIT 1;
    -- Lata Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Lata Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.205361, 17.6877091), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.205361, 17.6877091), 4326) LIMIT 1;
    -- Janani Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Janani Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2073838, 17.6865547), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2073838, 17.6865547), 4326) LIMIT 1;
    -- Geetha Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Geetha Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2145015, 17.6860522), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2145015, 17.6860522), 4326) LIMIT 1;
    -- Shree Krishna Health Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Shree Krishna Health Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.3105799, 17.7104023), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3105799, 17.7104023), 4326) LIMIT 1;
    -- Aditya Obstetrics & Gynecology Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Aditya Obstetrics & Gynecology Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.269641, 17.745985), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.269641, 17.745985), 4326) LIMIT 1;
    -- ENT Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'ENT Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3103685, 17.7098153), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3103685, 17.7098153), 4326) LIMIT 1;
    -- Suresh Children''s Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Suresh Children''s Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.2098576, 17.7998618), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2098576, 17.7998618), 4326) LIMIT 1;
    -- NTPC Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'NTPC Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0939853, 17.5685137), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0939853, 17.5685137), 4326) LIMIT 1;
    -- Rotary Netra Rural Eye Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Rotary Netra Rural Eye Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.202451, 17.831088), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.202451, 17.831088), 4326) LIMIT 1;
    -- Sri Surya Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Surya Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2092812, 17.6849028), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2092812, 17.6849028), 4326) LIMIT 1;
    -- Harshitha Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Harshitha Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2101897, 17.6863384), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2101897, 17.6863384), 4326) LIMIT 1;
    -- Mother and Child Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Mother and Child Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.12163, 17.790161), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.12163, 17.790161), 4326) LIMIT 1;
    -- Pendurthi Govt Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Pendurthi Govt Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2070778, 17.8094151), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2070778, 17.8094151), 4326) LIMIT 1;
    -- Sri Sai Balaji Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Sai Balaji Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.2368507, 17.7418536), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2368507, 17.7418536), 4326) LIMIT 1;
    -- Sri Sai Aditya Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Sai Aditya Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.269671, 17.746278), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.269671, 17.746278), 4326) LIMIT 1;
    -- Srikanth''s Speech & Hearing Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Srikanth''s Speech & Hearing Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3022707, 17.710622), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3022707, 17.710622), 4326) LIMIT 1;
    -- Gothis Doctor Chambers (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Gothis Doctor Chambers', 'Hospital', ST_SetSRID(ST_MakePoint(83.312125, 17.710382), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.312125, 17.710382), 4326) LIMIT 1;
    -- Harini Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Harini Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2055093, 17.6795765), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2055093, 17.6795765), 4326) LIMIT 1;
    -- Janaki Polyclinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Janaki Polyclinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.2049423, 17.6930517), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2049423, 17.6930517), 4326) LIMIT 1;
    -- Heritage Kerala Ayurveda Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Heritage Kerala Ayurveda Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2120798, 17.7671455), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2120798, 17.7671455), 4326) LIMIT 1;
    -- Ashok Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ashok Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.2059135, 17.8220019), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2059135, 17.8220019), 4326) LIMIT 1;
    -- GSR Chest Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'GSR Chest Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.1961794, 17.6848418), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1961794, 17.6848418), 4326) LIMIT 1;
    -- Sharan Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sharan Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.077059, 17.6297105), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.077059, 17.6297105), 4326) LIMIT 1;
    -- Ramya Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ramya Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.304302, 17.710544), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.304302, 17.710544), 4326) LIMIT 1;
    -- Sanjevani Mega Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sanjevani Mega Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3103812, 17.7098493), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3103812, 17.7098493), 4326) LIMIT 1;
    -- Sri Sapthagiri Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Sapthagiri Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.213061, 17.805851), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.213061, 17.805851), 4326) LIMIT 1;
    -- Government Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2161371, 17.7524734), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2161371, 17.7524734), 4326) LIMIT 1;
    -- Raghavendra Eye Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Raghavendra Eye Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2199593, 17.7476896), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2199593, 17.7476896), 4326) LIMIT 1;
    -- ENT Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'ENT Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.218258, 17.75108), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.218258, 17.75108), 4326) LIMIT 1;
    -- Syamala Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Syamala Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(82.9809284, 17.6183718), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9809284, 17.6183718), 4326) LIMIT 1;
    -- Asha Hospital Diabetes & Multi Speciality (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Asha Hospital Diabetes & Multi Speciality', 'Hospital', ST_SetSRID(ST_MakePoint(83.08184, 17.6212637), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.08184, 17.6212637), 4326) LIMIT 1;
    -- Muddu Krishna Children Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Muddu Krishna Children Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2046951, 17.6852715), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2046951, 17.6852715), 4326) LIMIT 1;
    -- Surya Teja Multispeciality Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Surya Teja Multispeciality Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(82.9784452, 17.5659385), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9784452, 17.5659385), 4326) LIMIT 1;
    -- Sarojini Devi Skin Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sarojini Devi Skin Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3090277, 17.7166466), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3090277, 17.7166466), 4326) LIMIT 1;
    -- Ramsaranya Child Care Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ramsaranya Child Care Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3143316, 17.7102508), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3143316, 17.7102508), 4326) LIMIT 1;
    -- Baba Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Baba Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.308867, 17.708177), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.308867, 17.708177), 4326) LIMIT 1;
    -- Triveni Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Triveni Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.2064302, 17.8177533), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2064302, 17.8177533), 4326) LIMIT 1;
    -- Amma Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Amma Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0901428, 17.6288271), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0901428, 17.6288271), 4326) LIMIT 1;
    -- Aditya Multi Care Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Aditya Multi Care Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3046802, 17.7100474), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3046802, 17.7100474), 4326) LIMIT 1;
    -- M.B. Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'M.B. Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3106082, 17.763448), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3106082, 17.763448), 4326) LIMIT 1;
    -- ApolloHospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'ApolloHospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3091374, 17.7171444), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3091374, 17.7171444), 4326) LIMIT 1;
    -- HCG Cancer Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'HCG Cancer Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.3057236, 17.7638753), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3057236, 17.7638753), 4326) LIMIT 1;
    -- Star Pinnacle Heart Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Star Pinnacle Heart Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.3078391, 17.7632652), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3078391, 17.7632652), 4326) LIMIT 1;
    -- Homi Bhabha Cancer Hospital & Research Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Homi Bhabha Cancer Hospital & Research Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.1144238, 17.6898831), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1144238, 17.6898831), 4326) LIMIT 1;
    -- Ramsaranya Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ramsaranya Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3106734, 17.7097535), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3106734, 17.7097535), 4326) LIMIT 1;
    -- Visakha Hospitals And Diagnostics (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Visakha Hospitals And Diagnostics', 'Hospital', ST_SetSRID(ST_MakePoint(83.3130073, 17.7202856), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3130073, 17.7202856), 4326) LIMIT 1;
    -- SevenHills Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'SevenHills Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3094245, 17.7173631), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3094245, 17.7173631), 4326) LIMIT 1;
    -- St Anns Jubilee Memorial Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'St Anns Jubilee Memorial Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2377236, 17.6843531), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2377236, 17.6843531), 4326) LIMIT 1;
    -- Bhanu''s house (Guest House)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Bhanu''s house', 'Guest House', ST_SetSRID(ST_MakePoint(82.8939112, 17.7396747), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8939112, 17.7396747), 4326) LIMIT 1;
    -- govt.primaryschool (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'govt.primaryschool', 'School', ST_SetSRID(ST_MakePoint(82.8906965, 17.7361067), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8906965, 17.7361067), 4326) LIMIT 1;
    -- High school (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'High school', 'School', ST_SetSRID(ST_MakePoint(82.8880807, 17.7396843), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8880807, 17.7396843), 4326) LIMIT 1;
    -- Sri Narayana Defence Academy Junior & Degree College (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Narayana Defence Academy Junior & Degree College', 'College', ST_SetSRID(ST_MakePoint(83.2975325, 17.8934834), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2975325, 17.8934834), 4326) LIMIT 1;
    -- Rockdale (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Rockdale', 'Hotel', ST_SetSRID(ST_MakePoint(83.3083471, 17.7163638), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3083471, 17.7163638), 4326) LIMIT 1;
    -- Four Points by Sheraton (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Four Points by Sheraton', 'Hotel', ST_SetSRID(ST_MakePoint(83.3123966, 17.7208884), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3123966, 17.7208884), 4326) LIMIT 1;
    -- Green Park (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Green Park', 'Hotel', ST_SetSRID(ST_MakePoint(83.306264, 17.7153753), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.306264, 17.7153753), 4326) LIMIT 1;
    -- Royal Fort (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Royal Fort', 'Hotel', ST_SetSRID(ST_MakePoint(83.3093748, 17.7231319), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3093748, 17.7231319), 4326) LIMIT 1;
    -- Meghalaya (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Meghalaya', 'Hotel', ST_SetSRID(ST_MakePoint(83.3097133, 17.7233686), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3097133, 17.7233686), 4326) LIMIT 1;
    -- Ambica Sea Green (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ambica Sea Green', 'Hotel', ST_SetSRID(ST_MakePoint(83.3312158, 17.718696), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3312158, 17.718696), 4326) LIMIT 1;
    -- Vijnana Vihara Residential School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vijnana Vihara Residential School', 'School', ST_SetSRID(ST_MakePoint(83.3240093, 17.8832002), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3240093, 17.8832002), 4326) LIMIT 1;
    -- Vijnana Vihara Residential School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vijnana Vihara Residential School', 'School', ST_SetSRID(ST_MakePoint(83.3239894, 17.8832006), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3239894, 17.8832006), 4326) LIMIT 1;
    -- Suraksha Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Suraksha Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2555653, 17.7396152), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2555653, 17.7396152), 4326) LIMIT 1;
    -- Varma Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Varma Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3113995, 17.7640286), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3113995, 17.7640286), 4326) LIMIT 1;
    -- Sai Spoorthy Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sai Spoorthy Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.309347, 17.7295406), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.309347, 17.7295406), 4326) LIMIT 1;
    -- Government Regional Eye Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Regional Eye Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3113942, 17.7304744), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3113942, 17.7304744), 4326) LIMIT 1;
    -- LG Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'LG Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3045894, 17.710174), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3045894, 17.710174), 4326) LIMIT 1;
    -- Omega Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Omega Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3124349, 17.763791), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3124349, 17.763791), 4326) LIMIT 1;
    -- Medicover Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Medicover Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3121251, 17.7638179), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3121251, 17.7638179), 4326) LIMIT 1;
    -- Ramsaranya Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ramsaranya Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3109067, 17.7100054), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3109067, 17.7100054), 4326) LIMIT 1;
    -- GJ Hospitals And Trauma Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'GJ Hospitals And Trauma Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.3324401, 17.7336653), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3324401, 17.7336653), 4326) LIMIT 1;
    -- Sankar Foundation Eye Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sankar Foundation Eye Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2159491, 17.6812931), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2159491, 17.6812931), 4326) LIMIT 1;
    -- Government Hospital, Rakodu (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government Hospital, Rakodu', 'Hospital', ST_SetSRID(ST_MakePoint(83.3410607, 18.0924766), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3410607, 18.0924766), 4326) LIMIT 1;
    -- Chest Hospital and Medical Store (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Chest Hospital and Medical Store', 'Hospital', ST_SetSRID(ST_MakePoint(83.2191542, 17.7493798), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2191542, 17.7493798), 4326) LIMIT 1;
    -- Runway 5 (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Runway 5', 'Hotel', ST_SetSRID(ST_MakePoint(82.89964, 17.6393015), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.89964, 17.6393015), 4326) LIMIT 1;
    -- Hi In (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hi In', 'Hotel', ST_SetSRID(ST_MakePoint(83.3410775, 17.7363567), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3410775, 17.7363567), 4326) LIMIT 1;
    -- Indu''s dental specialities (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Indu''s dental specialities', 'Clinic', ST_SetSRID(ST_MakePoint(83.3076925, 17.7361705), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3076925, 17.7361705), 4326) LIMIT 1;
    -- OYO 60899 V3 Comforts (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'OYO 60899 V3 Comforts', 'Hotel', ST_SetSRID(ST_MakePoint(83.2080963, 17.8078592), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2080963, 17.8078592), 4326) LIMIT 1;
    -- Vishal Mega Mart (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vishal Mega Mart', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2088455, 17.8075766), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2088455, 17.8075766), 4326) LIMIT 1;
    -- Eye Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Eye Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.2082462, 17.809861), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2082462, 17.809861), 4326) LIMIT 1;
    -- Raja Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Raja Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.1860605, 17.9072822), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1860605, 17.9072822), 4326) LIMIT 1;
    -- DMart (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'DMart', 'Supermarket', ST_SetSRID(ST_MakePoint(83.387921, 18.0892135), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.387921, 18.0892135), 4326) LIMIT 1;
    -- New Hope Jeevan Jyothi High School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'New Hope Jeevan Jyothi High School', 'School', ST_SetSRID(ST_MakePoint(83.1943513, 17.9315806), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1943513, 17.9315806), 4326) LIMIT 1;
    -- Visvam Healthcare Center (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Visvam Healthcare Center', 'Hospital', ST_SetSRID(ST_MakePoint(83.2171766, 17.9582444), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2171766, 17.9582444), 4326) LIMIT 1;
    -- NCN Lodge (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'NCN Lodge', 'Hotel', ST_SetSRID(ST_MakePoint(83.1861729, 17.9079002), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1861729, 17.9079002), 4326) LIMIT 1;
    -- ZPHS High School Atchutapuram (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'ZPHS High School Atchutapuram', 'School', ST_SetSRID(ST_MakePoint(82.9780492, 17.5671463), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9780492, 17.5671463), 4326) LIMIT 1;
    -- Lakshmi Mini Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Lakshmi Mini Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.1890038, 17.8801264), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1890038, 17.8801264), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2063908, 17.8178635), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2063908, 17.8178635), 4326) LIMIT 1;
    -- MPP school (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'MPP school', 'School', ST_SetSRID(ST_MakePoint(83.2163785, 17.777915), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2163785, 17.777915), 4326) LIMIT 1;
    -- Reliance Fresh (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Reliance Fresh', 'Supermarket', ST_SetSRID(ST_MakePoint(83.25693, 17.7391215), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.25693, 17.7391215), 4326) LIMIT 1;
    -- Vijetha (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vijetha', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2291939, 17.7441197), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2291939, 17.7441197), 4326) LIMIT 1;
    -- Ravindra Bharathi School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ravindra Bharathi School', 'School', ST_SetSRID(ST_MakePoint(83.2096569, 17.79843), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2096569, 17.79843), 4326) LIMIT 1;
    -- Sri Chaitanya Techno School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Chaitanya Techno School', 'School', ST_SetSRID(ST_MakePoint(83.3287958, 17.7428792), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3287958, 17.7428792), 4326) LIMIT 1;
    -- Inspiiro (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Inspiiro', 'School', ST_SetSRID(ST_MakePoint(83.389795, 18.0710838), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.389795, 18.0710838), 4326) LIMIT 1;
    -- NC supermarket (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'NC supermarket', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3159165, 18.0452492), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3159165, 18.0452492), 4326) LIMIT 1;
    -- Kasturiba Gandi (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Kasturiba Gandi', 'School', ST_SetSRID(ST_MakePoint(83.3275218, 18.0509155), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3275218, 18.0509155), 4326) LIMIT 1;
    -- Centurion English Medium School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Centurion English Medium School', 'School', ST_SetSRID(ST_MakePoint(83.1955969, 17.9072453), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1955969, 17.9072453), 4326) LIMIT 1;
    -- Vidya vikas (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vidya vikas', 'School', ST_SetSRID(ST_MakePoint(83.1876426, 17.8867958), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1876426, 17.8867958), 4326) LIMIT 1;
    -- Burley Cottage (Guest House)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Burley Cottage', 'Guest House', ST_SetSRID(ST_MakePoint(83.3178831, 17.724955), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3178831, 17.724955), 4326) LIMIT 1;
    -- ViniS (Mall)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'ViniS', 'Mall', ST_SetSRID(ST_MakePoint(83.3132472, 17.7249339), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3132472, 17.7249339), 4326) LIMIT 1;
    -- Neerus (Mall)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Neerus', 'Mall', ST_SetSRID(ST_MakePoint(83.3137038, 17.7246226), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3137038, 17.7246226), 4326) LIMIT 1;
    -- Dr.Mohan''s Diabetes Specialities Centre (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr.Mohan''s Diabetes Specialities Centre', 'Hospital', ST_SetSRID(ST_MakePoint(83.3147147, 17.7251141), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3147147, 17.7251141), 4326) LIMIT 1;
    -- Sri Lakshmi Lodge (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Lakshmi Lodge', 'Hotel', ST_SetSRID(ST_MakePoint(83.235134, 17.7431577), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.235134, 17.7431577), 4326) LIMIT 1;
    -- DMart (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'DMart', 'Supermarket', ST_SetSRID(ST_MakePoint(83.1876161, 17.684095), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1876161, 17.684095), 4326) LIMIT 1;
    -- Reliance Fresh (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Reliance Fresh', 'Supermarket', ST_SetSRID(ST_MakePoint(83.142915, 17.6875641), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.142915, 17.6875641), 4326) LIMIT 1;
    -- A P Model School patipalli (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'A P Model School patipalli', 'School', ST_SetSRID(ST_MakePoint(83.0329025, 17.6364789), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0329025, 17.6364789), 4326) LIMIT 1;
    -- Hotel Harita (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Harita', 'Hotel', ST_SetSRID(ST_MakePoint(83.2930015, 17.7191431), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2930015, 17.7191431), 4326) LIMIT 1;
    -- OYO Sindhura Guest House (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'OYO Sindhura Guest House', 'Hotel', ST_SetSRID(ST_MakePoint(83.3049037, 17.7391879), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3049037, 17.7391879), 4326) LIMIT 1;
    -- Sri Viswa School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Viswa School', 'School', ST_SetSRID(ST_MakePoint(83.3058704, 17.739898), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3058704, 17.739898), 4326) LIMIT 1;
    -- AMG Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'AMG Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.3118352, 17.7414668), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3118352, 17.7414668), 4326) LIMIT 1;
    -- ZP High School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'ZP High School', 'School', ST_SetSRID(ST_MakePoint(83.0145646, 17.7322705), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0145646, 17.7322705), 4326) LIMIT 1;
    -- kailasagiri park (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'kailasagiri park', 'Park', ST_SetSRID(ST_MakePoint(83.3403614, 17.7499266), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3403614, 17.7499266), 4326) LIMIT 1;
    -- Children Multi Speciality Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Children Multi Speciality Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.1881834, 17.899753), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1881834, 17.899753), 4326) LIMIT 1;
    -- Savera Restaurant (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Savera Restaurant', 'Hotel', ST_SetSRID(ST_MakePoint(83.3085072, 17.7247839), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3085072, 17.7247839), 4326) LIMIT 1;
    -- Athidhi devo bava (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Athidhi devo bava', 'Hotel', ST_SetSRID(ST_MakePoint(83.3364845, 17.7314747), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3364845, 17.7314747), 4326) LIMIT 1;
    -- Medicover Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Medicover Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3318795, 17.7478206), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3318795, 17.7478206), 4326) LIMIT 1;
    -- Dr BR Ambedkar Gurukulam (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr BR Ambedkar Gurukulam', 'School', ST_SetSRID(ST_MakePoint(83.2812434, 17.7695657), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2812434, 17.7695657), 4326) LIMIT 1;
    -- Royal Stay Inn (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Royal Stay Inn', 'Hotel', ST_SetSRID(ST_MakePoint(83.2068411, 17.8169821), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2068411, 17.8169821), 4326) LIMIT 1;
    -- Manikanta Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Manikanta Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.1877019, 17.8994395), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1877019, 17.8994395), 4326) LIMIT 1;
    -- Suneetha Hospital Dr V Anand Rao (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Suneetha Hospital Dr V Anand Rao', 'Hospital', ST_SetSRID(ST_MakePoint(83.2535864, 17.7401303), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2535864, 17.7401303), 4326) LIMIT 1;
    -- Sri Chaitanya Techno School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Chaitanya Techno School', 'School', ST_SetSRID(ST_MakePoint(83.2375401, 17.7413557), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2375401, 17.7413557), 4326) LIMIT 1;
    -- Vijayam School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vijayam School', 'School', ST_SetSRID(ST_MakePoint(83.3524502, 17.8239752), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3524502, 17.8239752), 4326) LIMIT 1;
    -- Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3542294, 17.8241723), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3542294, 17.8241723), 4326) LIMIT 1;
    -- A P Model School,Tegada (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'A P Model School,Tegada', 'School', ST_SetSRID(ST_MakePoint(82.9353145, 17.6417417), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9353145, 17.6417417), 4326) LIMIT 1;
    -- KGBV school, Tegada (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'KGBV school, Tegada', 'School', ST_SetSRID(ST_MakePoint(82.9349009, 17.6412605), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9349009, 17.6412605), 4326) LIMIT 1;
    -- Sai Ram Traders (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sai Ram Traders', 'Supermarket', ST_SetSRID(ST_MakePoint(83.4050145, 18.047261), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4050145, 18.047261), 4326) LIMIT 1;
    -- RK Mart (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'RK Mart', 'Supermarket', ST_SetSRID(ST_MakePoint(83.4048907, 18.0469502), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4048907, 18.0469502), 4326) LIMIT 1;
    -- Saranya gereral stores, articles footware and fancy store (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Saranya gereral stores, articles footware and fancy store', 'Supermarket', ST_SetSRID(ST_MakePoint(83.4047947, 18.0461654), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4047947, 18.0461654), 4326) LIMIT 1;
    -- Sri Krishna Grammar School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Krishna Grammar School', 'School', ST_SetSRID(ST_MakePoint(83.3296454, 17.7639754), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3296454, 17.7639754), 4326) LIMIT 1;
    -- Sree Arunodaya School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sree Arunodaya School', 'School', ST_SetSRID(ST_MakePoint(83.3309447, 17.7632507), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3309447, 17.7632507), 4326) LIMIT 1;
    -- Reliance Super Mart (Mall)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Reliance Super Mart', 'Mall', ST_SetSRID(ST_MakePoint(83.3328855, 17.7620655), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3328855, 17.7620655), 4326) LIMIT 1;
    -- Sree krishna Grammar School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sree krishna Grammar School', 'School', ST_SetSRID(ST_MakePoint(83.3294722, 17.7637595), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3294722, 17.7637595), 4326) LIMIT 1;
    -- Sree Krishna Grammar School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sree Krishna Grammar School', 'School', ST_SetSRID(ST_MakePoint(83.3293192, 17.7656345), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3293192, 17.7656345), 4326) LIMIT 1;
    -- Sree Krishna Grammar School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sree Krishna Grammar School', 'School', ST_SetSRID(ST_MakePoint(83.3292387, 17.7654285), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3292387, 17.7654285), 4326) LIMIT 1;
    -- Aditya Degree College (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Aditya Degree College', 'College', ST_SetSRID(ST_MakePoint(83.3172009, 17.7318803), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3172009, 17.7318803), 4326) LIMIT 1;
    -- Mithraa super market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Mithraa super market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2109208, 17.7990164), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2109208, 17.7990164), 4326) LIMIT 1;
    -- Smart point (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Smart point', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2103999, 17.8017036), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2103999, 17.8017036), 4326) LIMIT 1;
    -- Sai Clinic (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sai Clinic', 'Hospital', ST_SetSRID(ST_MakePoint(83.2093877, 17.8046265), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2093877, 17.8046265), 4326) LIMIT 1;
    -- Saadhana Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Saadhana Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.2105594, 17.8009047), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2105594, 17.8009047), 4326) LIMIT 1;
    -- Surabhi Clinics (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Surabhi Clinics', 'Hospital', ST_SetSRID(ST_MakePoint(83.2092659, 17.8032146), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2092659, 17.8032146), 4326) LIMIT 1;
    -- Damayanthi Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Damayanthi Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2094601, 17.8025234), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2094601, 17.8025234), 4326) LIMIT 1;
    -- Sarat Chandras Speciality Clinic (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sarat Chandras Speciality Clinic', 'Hospital', ST_SetSRID(ST_MakePoint(83.2094537, 17.8024276), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2094537, 17.8024276), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.333577, 17.7226117), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.333577, 17.7226117), 4326) LIMIT 1;
    -- Sunflower childrens clinic (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sunflower childrens clinic', 'Hospital', ST_SetSRID(ST_MakePoint(83.185985, 17.8972279), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.185985, 17.8972279), 4326) LIMIT 1;
    -- Damayanthi Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Damayanthi Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2286534, 17.7744129), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2286534, 17.7744129), 4326) LIMIT 1;
    -- APSWERIS School , Elamanchili (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'APSWERIS School , Elamanchili', 'School', ST_SetSRID(ST_MakePoint(82.8595913, 17.5664082), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8595913, 17.5664082), 4326) LIMIT 1;
    -- Yalamarty Pharmacy College (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Yalamarty Pharmacy College', 'College', ST_SetSRID(ST_MakePoint(83.3342476, 17.899835), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3342476, 17.899835), 4326) LIMIT 1;
    -- Yalamarty Polytechnic College (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Yalamarty Polytechnic College', 'College', ST_SetSRID(ST_MakePoint(83.3339016, 17.8990155), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3339016, 17.8990155), 4326) LIMIT 1;
    -- Dr BV Adinarayana Childrens Specialist (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr BV Adinarayana Childrens Specialist', 'Hospital', ST_SetSRID(ST_MakePoint(83.2719764, 17.7350078), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2719764, 17.7350078), 4326) LIMIT 1;
    -- Big Mart (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Big Mart', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2694538, 17.7350947), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2694538, 17.7350947), 4326) LIMIT 1;
    -- Rightway School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Rightway School', 'School', ST_SetSRID(ST_MakePoint(83.2700271, 17.7349954), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2700271, 17.7349954), 4326) LIMIT 1;
    -- Sri Vagdevi School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Vagdevi School', 'School', ST_SetSRID(ST_MakePoint(83.270296, 17.7354555), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.270296, 17.7354555), 4326) LIMIT 1;
    -- Satyam Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Satyam Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3305245, 17.7310219), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3305245, 17.7310219), 4326) LIMIT 1;
    -- Hotel Sowbhagya (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Sowbhagya', 'Hotel', ST_SetSRID(ST_MakePoint(83.3060968, 17.7189563), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3060968, 17.7189563), 4326) LIMIT 1;
    -- Teeny boppers (Kindergarten)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Teeny boppers', 'Kindergarten', ST_SetSRID(ST_MakePoint(83.3606792, 17.7644749), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3606792, 17.7644749), 4326) LIMIT 1;
    -- Ayushman arogya mandir (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ayushman arogya mandir', 'Hospital', ST_SetSRID(ST_MakePoint(83.3294672, 17.729599), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3294672, 17.729599), 4326) LIMIT 1;
    -- Pantaloons (Mall)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Pantaloons', 'Mall', ST_SetSRID(ST_MakePoint(83.3274016, 17.7433809), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3274016, 17.7433809), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3354688, 17.7369469), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3354688, 17.7369469), 4326) LIMIT 1;
    -- GVMC Primary School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'GVMC Primary School', 'School', ST_SetSRID(ST_MakePoint(83.2785659, 17.7313197), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2785659, 17.7313197), 4326) LIMIT 1;
    -- Piles Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Piles Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.1874128, 17.8986495), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1874128, 17.8986495), 4326) LIMIT 1;
    -- Delhi Public School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Delhi Public School', 'School', ST_SetSRID(ST_MakePoint(83.2396113, 17.7425283), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2396113, 17.7425283), 4326) LIMIT 1;
    -- Govt High School Sabbavaram (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Govt High School Sabbavaram', 'School', ST_SetSRID(ST_MakePoint(83.1293272, 17.7926393), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1293272, 17.7926393), 4326) LIMIT 1;
    -- BR Ambedkar Gurukulam (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'BR Ambedkar Gurukulam', 'School', ST_SetSRID(ST_MakePoint(83.1284063, 17.7924301), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1284063, 17.7924301), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2092433, 17.6854821), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2092433, 17.6854821), 4326) LIMIT 1;
    -- Signature Hotels (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Signature Hotels', 'Hotel', ST_SetSRID(ST_MakePoint(83.2035517, 17.7162647), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2035517, 17.7162647), 4326) LIMIT 1;
    -- Vani Lodge (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vani Lodge', 'Hotel', ST_SetSRID(ST_MakePoint(83.2973532, 17.7123132), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2973532, 17.7123132), 4326) LIMIT 1;
    -- Hotel Wonderful Inn (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Wonderful Inn', 'Hotel', ST_SetSRID(ST_MakePoint(83.2970687, 17.7126113), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2970687, 17.7126113), 4326) LIMIT 1;
    -- Hotel Taj Mahal (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Taj Mahal', 'Hotel', ST_SetSRID(ST_MakePoint(83.2981621, 17.7125116), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2981621, 17.7125116), 4326) LIMIT 1;
    -- Kotha Doctor (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Kotha Doctor', 'Clinic', ST_SetSRID(ST_MakePoint(82.8613024, 17.9162546), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.8613024, 17.9162546), 4326) LIMIT 1;
    -- My Room Luxury Stay (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'My Room Luxury Stay', 'Hotel', ST_SetSRID(ST_MakePoint(83.3271854, 17.7411216), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3271854, 17.7411216), 4326) LIMIT 1;
    -- Guest House (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Guest House', 'Hotel', ST_SetSRID(ST_MakePoint(83.3273443, 17.7416501), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3273443, 17.7416501), 4326) LIMIT 1;
    -- Dr. Gunturu Indira (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Gunturu Indira', 'Clinic', ST_SetSRID(ST_MakePoint(83.2081267, 17.8095921), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2081267, 17.8095921), 4326) LIMIT 1;
    -- Sri SNK Grand (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri SNK Grand', 'Hotel', ST_SetSRID(ST_MakePoint(83.2086438, 17.8083242), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2086438, 17.8083242), 4326) LIMIT 1;
    -- Maathrusree (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Maathrusree', 'Clinic', ST_SetSRID(ST_MakePoint(83.2087422, 17.8079141), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2087422, 17.8079141), 4326) LIMIT 1;
    -- Mothers Care Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Mothers Care Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.211095, 17.7982745), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.211095, 17.7982745), 4326) LIMIT 1;
    -- Shyam Sundar Medical Care (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Shyam Sundar Medical Care', 'Clinic', ST_SetSRID(ST_MakePoint(83.2112363, 17.7977167), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2112363, 17.7977167), 4326) LIMIT 1;
    -- The School of Autism (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'The School of Autism', 'School', ST_SetSRID(ST_MakePoint(83.3310416, 17.7437218), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3310416, 17.7437218), 4326) LIMIT 1;
    -- Sri Orthopedic & Physiotheraphy Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Orthopedic & Physiotheraphy Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3339276, 17.7361703), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3339276, 17.7361703), 4326) LIMIT 1;
    -- KIMS Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'KIMS Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3353795, 17.7373995), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3353795, 17.7373995), 4326) LIMIT 1;
    -- KIMS Fertility (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'KIMS Fertility', 'Clinic', ST_SetSRID(ST_MakePoint(83.3354205, 17.7374553), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3354205, 17.7374553), 4326) LIMIT 1;
    -- Smart Health Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Smart Health Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3355691, 17.7375464), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3355691, 17.7375464), 4326) LIMIT 1;
    -- Veera Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Veera Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.336297, 17.7377773), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.336297, 17.7377773), 4326) LIMIT 1;
    -- Dr. Ram''s Heart & Multispeciality Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dr. Ram''s Heart & Multispeciality Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3364167, 17.7383032), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3364167, 17.7383032), 4326) LIMIT 1;
    -- Hotel Square Inn (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Square Inn', 'Hotel', ST_SetSRID(ST_MakePoint(83.3316729, 17.7467352), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3316729, 17.7467352), 4326) LIMIT 1;
    -- SR Medical Center (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'SR Medical Center', 'Clinic', ST_SetSRID(ST_MakePoint(83.3316544, 17.7457642), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3316544, 17.7457642), 4326) LIMIT 1;
    -- Khazana Supermarket (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Khazana Supermarket', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3319932, 17.7459698), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3319932, 17.7459698), 4326) LIMIT 1;
    -- Avinash Neuro Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Avinash Neuro Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3513809, 17.8040265), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3513809, 17.8040265), 4326) LIMIT 1;
    -- Beyond Autism (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Beyond Autism', 'Clinic', ST_SetSRID(ST_MakePoint(83.3478371, 17.8040622), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3478371, 17.8040622), 4326) LIMIT 1;
    -- M.V.R. Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'M.V.R. Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3429252, 17.8045291), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3429252, 17.8045291), 4326) LIMIT 1;
    -- M.M.M. Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'M.M.M. Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3428152, 17.8045369), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3428152, 17.8045369), 4326) LIMIT 1;
    -- Lotus English Medium School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Lotus English Medium School', 'School', ST_SetSRID(ST_MakePoint(83.3425095, 17.8051004), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3425095, 17.8051004), 4326) LIMIT 1;
    -- Hotel Morya (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Morya', 'Hotel', ST_SetSRID(ST_MakePoint(83.2929835, 17.7178828), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2929835, 17.7178828), 4326) LIMIT 1;
    -- Sai Jutika Grand Lodge (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sai Jutika Grand Lodge', 'Hotel', ST_SetSRID(ST_MakePoint(83.2934989, 17.7161427), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2934989, 17.7161427), 4326) LIMIT 1;
    -- Sree Kanya Lodge (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sree Kanya Lodge', 'Hotel', ST_SetSRID(ST_MakePoint(83.2934927, 17.7160765), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2934927, 17.7160765), 4326) LIMIT 1;
    -- KNR Residency (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'KNR Residency', 'Hotel', ST_SetSRID(ST_MakePoint(83.2938829, 17.7196071), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2938829, 17.7196071), 4326) LIMIT 1;
    -- Hotel Golden Tulip (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Golden Tulip', 'Hotel', ST_SetSRID(ST_MakePoint(83.3027017, 17.7197822), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3027017, 17.7197822), 4326) LIMIT 1;
    -- North Way Hotel (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'North Way Hotel', 'Hotel', ST_SetSRID(ST_MakePoint(83.3024369, 17.718278), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3024369, 17.718278), 4326) LIMIT 1;
    -- Greenfield Organics (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Greenfield Organics', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3261828, 17.7277241), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3261828, 17.7277241), 4326) LIMIT 1;
    -- SVS Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'SVS Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3280185, 17.7289222), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3280185, 17.7289222), 4326) LIMIT 1;
    -- Shoulder & Knee Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Shoulder & Knee Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3306733, 17.7311817), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3306733, 17.7311817), 4326) LIMIT 1;
    -- Apollo Clinic (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Apollo Clinic', 'Clinic', ST_SetSRID(ST_MakePoint(83.3063491, 17.7298529), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3063491, 17.7298529), 4326) LIMIT 1;
    -- Hotel Akshara (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Akshara', 'Hotel', ST_SetSRID(ST_MakePoint(83.2931205, 17.7280211), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2931205, 17.7280211), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2939206, 17.7279881), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2939206, 17.7279881), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3041453, 17.7308293), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3041453, 17.7308293), 4326) LIMIT 1;
    -- Indus Hospitals (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Indus Hospitals', 'Hospital', ST_SetSRID(ST_MakePoint(83.3075353, 17.7625271), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3075353, 17.7625271), 4326) LIMIT 1;
    -- Narayana Medicity (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Narayana Medicity', 'Hospital', ST_SetSRID(ST_MakePoint(83.3119581, 17.7621246), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3119581, 17.7621246), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3001574, 17.7383253), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3001574, 17.7383253), 4326) LIMIT 1;
    -- Mitra Supermarket (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Mitra Supermarket', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3001286, 17.7369671), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3001286, 17.7369671), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2600504, 17.7438224), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2600504, 17.7438224), 4326) LIMIT 1;
    -- Keerthi Residency (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Keerthi Residency', 'Hotel', ST_SetSRID(ST_MakePoint(83.3207236, 17.735358), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3207236, 17.735358), 4326) LIMIT 1;
    -- Hotel Ambica Grand (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Ambica Grand', 'Hotel', ST_SetSRID(ST_MakePoint(83.3155401, 17.7347789), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3155401, 17.7347789), 4326) LIMIT 1;
    -- Hotel Lata Grand (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Lata Grand', 'Hotel', ST_SetSRID(ST_MakePoint(83.3134939, 17.7244441), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3134939, 17.7244441), 4326) LIMIT 1;
    -- Podar Jumbo Kids (Kindergarten)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Podar Jumbo Kids', 'Kindergarten', ST_SetSRID(ST_MakePoint(83.31371, 17.7233208), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.31371, 17.7233208), 4326) LIMIT 1;
    -- Amul Milk Parlour (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Amul Milk Parlour', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2385983, 17.7416535), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2385983, 17.7416535), 4326) LIMIT 1;
    -- Sanjivani Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sanjivani Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2464417, 17.7403603), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2464417, 17.7403603), 4326) LIMIT 1;
    -- Government School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Government School', 'School', ST_SetSRID(ST_MakePoint(83.2426355, 17.7400572), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2426355, 17.7400572), 4326) LIMIT 1;
    -- CMR Green Fields Park-1 (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'CMR Green Fields Park-1', 'Park', ST_SetSRID(ST_MakePoint(83.3855955, 18.0755565), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3855955, 18.0755565), 4326) LIMIT 1;
    -- Lendi Grounds (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Lendi Grounds', 'College', ST_SetSRID(ST_MakePoint(83.4018174, 18.0191238), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4018174, 18.0191238), 4326) LIMIT 1;
    -- hfdb (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'hfdb', 'Park', ST_SetSRID(ST_MakePoint(83.3818514, 17.7960081), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3818514, 17.7960081), 4326) LIMIT 1;
    -- forest (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'forest', 'Park', ST_SetSRID(ST_MakePoint(83.393281, 17.804183), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.393281, 17.804183), 4326) LIMIT 1;
    -- Gandhi (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Gandhi', 'Hospital', ST_SetSRID(ST_MakePoint(83.3963328, 17.7989437), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3963328, 17.7989437), 4326) LIMIT 1;
    -- Area (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Area', 'Park', ST_SetSRID(ST_MakePoint(83.3886204, 17.7951956), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3886204, 17.7951956), 4326) LIMIT 1;
    -- forest (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'forest', 'Hospital', ST_SetSRID(ST_MakePoint(83.3893022, 17.7952383), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3893022, 17.7952383), 4326) LIMIT 1;
    -- Foresht (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Foresht', 'Park', ST_SetSRID(ST_MakePoint(83.3881312, 17.7990255), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3881312, 17.7990255), 4326) LIMIT 1;
    -- forest (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'forest', 'Hospital', ST_SetSRID(ST_MakePoint(83.3890616, 17.7953651), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3890616, 17.7953651), 4326) LIMIT 1;
    -- forest (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'forest', 'Hospital', ST_SetSRID(ST_MakePoint(83.3882361, 17.7989074), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3882361, 17.7989074), 4326) LIMIT 1;
    -- Park (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Park', 'Park', ST_SetSRID(ST_MakePoint(83.3810777, 17.7941264), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3810777, 17.7941264), 4326) LIMIT 1;
    -- Timapuram forest (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Timapuram forest', 'Park', ST_SetSRID(ST_MakePoint(83.4013324, 17.8173918), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4013324, 17.8173918), 4326) LIMIT 1;
    -- Dmart (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Dmart', 'Supermarket', ST_SetSRID(ST_MakePoint(83.4110732, 17.853197), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.4110732, 17.853197), 4326) LIMIT 1;
    -- Gandhi Statue (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Gandhi Statue', 'Park', ST_SetSRID(ST_MakePoint(83.3771811, 17.7808943), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3771811, 17.7808943), 4326) LIMIT 1;
    -- School of Law (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'School of Law', 'College', ST_SetSRID(ST_MakePoint(83.3779809, 17.7830802), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3779809, 17.7830802), 4326) LIMIT 1;
    -- Sri Brundavan Grand Inn (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Brundavan Grand Inn', 'Hotel', ST_SetSRID(ST_MakePoint(83.0160201, 17.6874369), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0160201, 17.6874369), 4326) LIMIT 1;
    -- Vishal Mega Mart (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vishal Mega Mart', 'Supermarket', ST_SetSRID(ST_MakePoint(83.014016, 17.6873832), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.014016, 17.6873832), 4326) LIMIT 1;
    -- Geetha Eye & Orthopaedic Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Geetha Eye & Orthopaedic Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.0127619, 17.6872398), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0127619, 17.6872398), 4326) LIMIT 1;
    -- Hotel Geetha Inn (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Geetha Inn', 'Hotel', ST_SetSRID(ST_MakePoint(83.3014099, 17.7261812), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3014099, 17.7261812), 4326) LIMIT 1;
    -- Hotel Simhadri Lodge (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Simhadri Lodge', 'Hotel', ST_SetSRID(ST_MakePoint(83.3014144, 17.7259238), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3014144, 17.7259238), 4326) LIMIT 1;
    -- Lakshmi Residency (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Lakshmi Residency', 'Hotel', ST_SetSRID(ST_MakePoint(83.3016743, 17.7265454), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3016743, 17.7265454), 4326) LIMIT 1;
    -- Bal Vikasa Foundation Bridge School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Bal Vikasa Foundation Bridge School', 'School', ST_SetSRID(ST_MakePoint(83.3015825, 17.6995098), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3015825, 17.6995098), 4326) LIMIT 1;
    -- Sri Basara Junior College (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Basara Junior College', 'College', ST_SetSRID(ST_MakePoint(83.3006752, 17.7347281), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3006752, 17.7347281), 4326) LIMIT 1;
    -- RR Inn Lodge (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'RR Inn Lodge', 'Hotel', ST_SetSRID(ST_MakePoint(83.2990178, 17.7264139), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2990178, 17.7264139), 4326) LIMIT 1;
    -- Daliraju Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Daliraju Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2995126, 17.7315294), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2995126, 17.7315294), 4326) LIMIT 1;
    -- SKML Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'SKML Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2995786, 17.7329269), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2995786, 17.7329269), 4326) LIMIT 1;
    -- Siva Sivani Play School (Kindergarten)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Siva Sivani Play School', 'Kindergarten', ST_SetSRID(ST_MakePoint(83.2485929, 17.7501102), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2485929, 17.7501102), 4326) LIMIT 1;
    -- More (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'More', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2497226, 17.7500837), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2497226, 17.7500837), 4326) LIMIT 1;
    -- Sri Gayatri Vidya Nilayam (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Gayatri Vidya Nilayam', 'School', ST_SetSRID(ST_MakePoint(83.2513306, 17.7499395), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2513306, 17.7499395), 4326) LIMIT 1;
    -- PEN School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'PEN School', 'School', ST_SetSRID(ST_MakePoint(83.2525354, 17.7497761), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2525354, 17.7497761), 4326) LIMIT 1;
    -- PEN Kids (Kindergarten)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'PEN Kids', 'Kindergarten', ST_SetSRID(ST_MakePoint(83.2528028, 17.7500963), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2528028, 17.7500963), 4326) LIMIT 1;
    -- Durga Laxmi Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Durga Laxmi Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2565794, 17.7487088), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2565794, 17.7487088), 4326) LIMIT 1;
    -- R.K. Super Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'R.K. Super Market', 'Supermarket', ST_SetSRID(ST_MakePoint(82.9824413, 17.9904583), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9824413, 17.9904583), 4326) LIMIT 1;
    -- HCG Cancer Centre (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'HCG Cancer Centre', 'Clinic', ST_SetSRID(ST_MakePoint(82.9807745, 17.9904961), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(82.9807745, 17.9904961), 4326) LIMIT 1;
    -- Primary Health Center Kothavalasa (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Primary Health Center Kothavalasa', 'Hospital', ST_SetSRID(ST_MakePoint(83.1897275, 17.900578), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1897275, 17.900578), 4326) LIMIT 1;
    -- Sri Srinivasa Guest House (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Srinivasa Guest House', 'Hotel', ST_SetSRID(ST_MakePoint(83.3039766, 17.7162258), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3039766, 17.7162258), 4326) LIMIT 1;
    -- Hotel Ocean Spice (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Ocean Spice', 'Hotel', ST_SetSRID(ST_MakePoint(83.3443006, 17.7432821), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3443006, 17.7432821), 4326) LIMIT 1;
    -- BIG Market (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'BIG Market', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3417199, 17.7423882), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3417199, 17.7423882), 4326) LIMIT 1;
    -- Urban Primary Health Center (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Urban Primary Health Center', 'Clinic', ST_SetSRID(ST_MakePoint(83.3874603, 18.0860629), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3874603, 18.0860629), 4326) LIMIT 1;
    -- Vijaya Medical Center (Clinic)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vijaya Medical Center', 'Clinic', ST_SetSRID(ST_MakePoint(83.3397236, 17.7401504), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3397236, 17.7401504), 4326) LIMIT 1;
    -- DMart (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'DMart', 'Supermarket', ST_SetSRID(ST_MakePoint(83.2583995, 17.744253), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2583995, 17.744253), 4326) LIMIT 1;
    -- PEN School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'PEN School', 'School', ST_SetSRID(ST_MakePoint(83.3011546, 17.7149959), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3011546, 17.7149959), 4326) LIMIT 1;
    -- Hotel New Prince (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel New Prince', 'Hotel', ST_SetSRID(ST_MakePoint(83.2997851, 17.7152359), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2997851, 17.7152359), 4326) LIMIT 1;
    -- Hotel Rajdhani (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Rajdhani', 'Hotel', ST_SetSRID(ST_MakePoint(83.2995554, 17.7153208), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2995554, 17.7153208), 4326) LIMIT 1;
    -- Sree Surya Residency (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sree Surya Residency', 'Hotel', ST_SetSRID(ST_MakePoint(83.2993114, 17.7156502), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2993114, 17.7156502), 4326) LIMIT 1;
    -- Jai Krishna Residency (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Jai Krishna Residency', 'Hotel', ST_SetSRID(ST_MakePoint(83.2992327, 17.7152142), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2992327, 17.7152142), 4326) LIMIT 1;
    -- Ashoka Residency (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Ashoka Residency', 'Hotel', ST_SetSRID(ST_MakePoint(83.2991825, 17.7150584), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2991825, 17.7150584), 4326) LIMIT 1;
    -- Hotel Rajdhani Grand (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Rajdhani Grand', 'Hotel', ST_SetSRID(ST_MakePoint(83.2997418, 17.7140095), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2997418, 17.7140095), 4326) LIMIT 1;
    -- Hotel Orange (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Orange', 'Hotel', ST_SetSRID(ST_MakePoint(83.2998291, 17.7143162), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2998291, 17.7143162), 4326) LIMIT 1;
    -- Hotel Sai Central (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Sai Central', 'Hotel', ST_SetSRID(ST_MakePoint(83.3006949, 17.7152076), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3006949, 17.7152076), 4326) LIMIT 1;
    -- Vijaya Luke College Of Nursing (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vijaya Luke College Of Nursing', 'College', ST_SetSRID(ST_MakePoint(83.3002167, 17.7151867), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3002167, 17.7151867), 4326) LIMIT 1;
    -- P.E.N. School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'P.E.N. School', 'School', ST_SetSRID(ST_MakePoint(83.3008254, 17.7157107), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3008254, 17.7157107), 4326) LIMIT 1;
    -- DMart (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'DMart', 'Supermarket', ST_SetSRID(ST_MakePoint(83.0204962, 17.6905917), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.0204962, 17.6905917), 4326) LIMIT 1;
    -- Hotel Sinka Grand (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Hotel Sinka Grand', 'Hotel', ST_SetSRID(ST_MakePoint(83.2969024, 17.7278481), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2969024, 17.7278481), 4326) LIMIT 1;
    -- Doctors colony park (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Doctors colony park', 'Park', ST_SetSRID(ST_MakePoint(83.3165921, 17.7465662), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3165921, 17.7465662), 4326) LIMIT 1;
    -- Saraswathi Park (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Saraswathi Park', 'Park', ST_SetSRID(ST_MakePoint(83.3002794, 17.7141847), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3002794, 17.7141847), 4326) LIMIT 1;
    -- KRM colony park (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'KRM colony park', 'Park', ST_SetSRID(ST_MakePoint(83.316983, 17.7424587), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.316983, 17.7424587), 4326) LIMIT 1;
    -- NBM Law college (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'NBM Law college', 'College', ST_SetSRID(ST_MakePoint(83.3118887, 17.7390226), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3118887, 17.7390226), 4326) LIMIT 1;
    -- Vizvit Lodge (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vizvit Lodge', 'Hotel', ST_SetSRID(ST_MakePoint(83.1855158, 17.8967926), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1855158, 17.8967926), 4326) LIMIT 1;
    -- MMTC Colony Park (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'MMTC Colony Park', 'Park', ST_SetSRID(ST_MakePoint(83.3181993, 17.7452896), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3181993, 17.7452896), 4326) LIMIT 1;
    -- OYO Flagship Hotel Gayatri (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'OYO Flagship Hotel Gayatri', 'Hotel', ST_SetSRID(ST_MakePoint(83.3085639, 17.7151624), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3085639, 17.7151624), 4326) LIMIT 1;
    -- Rise Hospital (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Rise Hospital', 'Hospital', ST_SetSRID(ST_MakePoint(83.2022417, 17.6846933), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.2022417, 17.6846933), 4326) LIMIT 1;
    -- Celest Mall (Mall)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Celest Mall', 'Mall', ST_SetSRID(ST_MakePoint(83.1990397, 17.6839171), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1990397, 17.6839171), 4326) LIMIT 1;
    -- The Royal Comforts (Hotel)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'The Royal Comforts', 'Hotel', ST_SetSRID(ST_MakePoint(83.3278813, 17.7376255), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3278813, 17.7376255), 4326) LIMIT 1;
    -- Vishal Mega Mart (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Vishal Mega Mart', 'Supermarket', ST_SetSRID(ST_MakePoint(83.1873283, 17.8991242), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.1873283, 17.8991242), 4326) LIMIT 1;
    -- Sujani Park (Park)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sujani Park', 'Park', ST_SetSRID(ST_MakePoint(83.313395, 17.7447985), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.313395, 17.7447985), 4326) LIMIT 1;
    -- Urban Primary Health Center Dondaparthy (Hospital)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Urban Primary Health Center Dondaparthy', 'Hospital', ST_SetSRID(ST_MakePoint(83.3007641, 17.7291423), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3007641, 17.7291423), 4326) LIMIT 1;
    -- GVMC Primary School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'GVMC Primary School', 'School', ST_SetSRID(ST_MakePoint(83.3020386, 17.7282409), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3020386, 17.7282409), 4326) LIMIT 1;
    -- Sisira Organics (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sisira Organics', 'Supermarket', ST_SetSRID(ST_MakePoint(83.312978, 17.7351441), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.312978, 17.7351441), 4326) LIMIT 1;
    -- Kasyap Home Needs (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Kasyap Home Needs', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3133124, 17.7398039), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3133124, 17.7398039), 4326) LIMIT 1;
    -- DMart (Supermarket)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'DMart', 'Supermarket', ST_SetSRID(ST_MakePoint(83.3417641, 17.7382614), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3417641, 17.7382614), 4326) LIMIT 1;
    -- Sri Basara Junior College (College)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Sri Basara Junior College', 'College', ST_SetSRID(ST_MakePoint(83.328155, 17.7423517), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.328155, 17.7423517), 4326) LIMIT 1;
    -- Akshara English Medium School (School)
    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) SELECT id, 'Akshara English Medium School', 'School', ST_SetSRID(ST_MakePoint(83.3245672, 17.7415823), 4326) FROM geo.localities ORDER BY center_point <-> ST_SetSRID(ST_MakePoint(83.3245672, 17.7415823), 4326) LIMIT 1;
END $$;