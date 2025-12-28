/*
  # Add Popular Localities

  1. Purpose
    - Add popular localities and landmarks for major cities
    - Includes well-known areas like HSR Layout (Bangalore), Tellapur (Hyderabad), Madhurawada (Visakhapatnam)

  2. Changes
    - Insert popular localities for Bangalore, Hyderabad, and Visakhapatnam
    - Each locality is linked to its respective city
*/

DO $$
DECLARE
  v_bangalore_id uuid;
  v_hyderabad_id uuid;
  v_visakhapatnam_id uuid;
BEGIN
  SELECT id INTO v_bangalore_id FROM indian_cities WHERE name ILIKE '%bangalore%' OR name ILIKE '%bengaluru%' LIMIT 1;
  SELECT id INTO v_hyderabad_id FROM indian_cities WHERE name ILIKE '%hyderabad%' LIMIT 1;
  SELECT id INTO v_visakhapatnam_id FROM indian_cities WHERE name ILIKE '%visakhapatnam%' OR name ILIKE '%vizag%' LIMIT 1;

  IF v_bangalore_id IS NOT NULL THEN
    INSERT INTO indian_localities (city_id, name) VALUES
      (v_bangalore_id, 'HSR Layout'),
      (v_bangalore_id, 'Whitefield'),
      (v_bangalore_id, 'Koramangala'),
      (v_bangalore_id, 'Indiranagar'),
      (v_bangalore_id, 'Electronic City'),
      (v_bangalore_id, 'Marathahalli'),
      (v_bangalore_id, 'BTM Layout'),
      (v_bangalore_id, 'Jayanagar'),
      (v_bangalore_id, 'Sarjapur Road'),
      (v_bangalore_id, 'Hebbal')
    ON CONFLICT DO NOTHING;
  END IF;

  IF v_hyderabad_id IS NOT NULL THEN
    INSERT INTO indian_localities (city_id, name) VALUES
      (v_hyderabad_id, 'Tellapur'),
      (v_hyderabad_id, 'Gachibowli'),
      (v_hyderabad_id, 'HITEC City'),
      (v_hyderabad_id, 'Madhapur'),
      (v_hyderabad_id, 'Kondapur'),
      (v_hyderabad_id, 'Kukatpally'),
      (v_hyderabad_id, 'Banjara Hills'),
      (v_hyderabad_id, 'Jubilee Hills'),
      (v_hyderabad_id, 'Miyapur'),
      (v_hyderabad_id, 'Manikonda')
    ON CONFLICT DO NOTHING;
  END IF;

  IF v_visakhapatnam_id IS NOT NULL THEN
    INSERT INTO indian_localities (city_id, name) VALUES
      (v_visakhapatnam_id, 'Madhurawada'),
      (v_visakhapatnam_id, 'Rushikonda'),
      (v_visakhapatnam_id, 'MVP Colony'),
      (v_visakhapatnam_id, 'Dwaraka Nagar'),
      (v_visakhapatnam_id, 'Gajuwaka'),
      (v_visakhapatnam_id, 'Seethammadhara'),
      (v_visakhapatnam_id, 'Siripuram'),
      (v_visakhapatnam_id, 'NAD'),
      (v_visakhapatnam_id, 'Pendurthi'),
      (v_visakhapatnam_id, 'Kommadi')
    ON CONFLICT DO NOTHING;
  END IF;
END $$;
