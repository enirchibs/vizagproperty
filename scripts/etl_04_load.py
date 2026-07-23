import json
import logging
import os

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

ALIAS_DATA_FILE = "vizag_alias_data.json"
SQL_OUTPUT_FILE = "supabase/migrations/20260709000010_bulk_osm_seed.sql"

def escape_sql(text):
    if text is None:
        return ""
    return str(text).replace("'", "''")

def generate_sql():
    if not os.path.exists(ALIAS_DATA_FILE):
        logging.error(f"{ALIAS_DATA_FILE} not found. Run etl_03_aliases.py first.")
        return
        
    logging.info("Generating SQL migration file for Supabase Dashboard...")

    with open(ALIAS_DATA_FILE, 'r', encoding='utf-8') as f:
        data = json.load(f)

    logging.info(f"Generating INSERT statements for {len(data)} locations...")

    # We use a DO $$ block so we can fetch the Visakhapatnam city_id once.
    sql_lines = [
        "-- ==============================================================================",
        "-- 10. BULK OSM DATA SEED (GVMC + 50km RADIUS)",
        "-- ==============================================================================",
        "DO $$",
        "DECLARE",
        "    vzg_city_id UUID;",
        "    new_loc_id UUID;",
        "BEGIN",
        "    SELECT id INTO vzg_city_id FROM geo.cities WHERE name = 'Visakhapatnam' LIMIT 1;",
        "    ",
        "    IF vzg_city_id IS NULL THEN",
        "        RAISE EXCEPTION 'Visakhapatnam city not found. Run previous seeds first.';",
        "    END IF;",
        "    "
    ]
    
    # We will generate static INSERT statements with RETURNING to populate the search table.
    count = 0
    chunk_size = 500
    file_index = 1
    for item in data:
        name = escape_sql(item.get('name', ''))
        name_te = escape_sql(item.get('name_te', ''))
        lon = item['geometry']['coordinates'][0]
        lat = item['geometry']['coordinates'][1]
        aliases = escape_sql(', '.join(item.get('phonetic_aliases', []) + item.get('custom_aliases', [])))
        entity_type = item.get('type', 'locality')
        
        # Calculate a basic popularity score (Suburbs > Neighbourhoods > POIs)
        pop_score = 10
        if entity_type == 'suburb': pop_score = 80
        elif entity_type == 'neighbourhood': pop_score = 60
        elif entity_type == 'village': pop_score = 40
        elif entity_type in ['hospital', 'school', 'college']: pop_score = 50
        
        # Build the dynamic query strings
        sql_lines.append(f"    -- Insert {name} ({entity_type})")
        sql_lines.append("    INSERT INTO geo.localities (city_id, name, center_point, aliases, translations)")
        sql_lines.append(f"    VALUES (vzg_city_id, '{name}', ST_SetSRID(ST_MakePoint({lon}, {lat}), 4326), '{{\"{aliases}\"}}', jsonb_build_object('te', '{name_te}'))")
        sql_lines.append("    ON CONFLICT DO NOTHING")
        sql_lines.append("    RETURNING id INTO new_loc_id;")
        
        sql_lines.append("    IF new_loc_id IS NOT NULL THEN")
        sql_lines.append("        INSERT INTO search.locations (entity_id, entity_type, display_name, search_text, center_point, popularity_score)")
        sql_lines.append(f"        VALUES (new_loc_id, 'locality', '{name}, Visakhapatnam', '{name} {name_te} {aliases}', ST_SetSRID(ST_MakePoint({lon}, {lat}), 4326), {pop_score});")
        sql_lines.append("    END IF;")
        
        count += 1
        # Start a new file if we hit the chunk limit
        if count % chunk_size == 0:
            # Close the current file
            sql_lines.append("END $$;")
            filename = f"supabase/migrations/20260709000010_bulk_osm_seed_part{file_index}.sql"
            with open(filename, 'w', encoding='utf-8') as f:
                f.write('\n'.join(sql_lines))
            logging.info(f"Generated {filename}")
            
            # Reset for the next file
            file_index += 1
            sql_lines = [
                f"-- BULK OSM DATA SEED PART {file_index}",
                "DO $$",
                "DECLARE",
                "    vzg_city_id UUID;",
                "    new_loc_id UUID;",
                "BEGIN",
                "    SELECT id INTO vzg_city_id FROM geo.cities WHERE name = 'Visakhapatnam' LIMIT 1;",
            ]
            
    # Write the remaining lines if any
    if len(sql_lines) > 7:
        sql_lines.append("END $$;")
        filename = f"supabase/migrations/20260709000010_bulk_osm_seed_part{file_index}.sql"
        with open(filename, 'w', encoding='utf-8') as f:
            f.write('\n'.join(sql_lines))
        logging.info(f"Generated {filename}")

    logging.info(f"Successfully split {count} records across {file_index} files!")
    logging.info("You can now paste these smaller files into the Supabase SQL Editor one by one.")

if __name__ == "__main__":
    logging.info("--- Starting ETL Load (SQL Generation) Phase ---")
    generate_sql()
