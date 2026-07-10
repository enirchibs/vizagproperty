import json
import logging
import os

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

POI_DATA_FILE = "vizag_pois_data.json"
SQL_OUTPUT_FILE = "supabase/migrations/20260710000017_seed_pois.sql"

def escape_sql(text):
    if text is None:
        return ""
    return str(text).replace("'", "''")

def generate_sql():
    if not os.path.exists(POI_DATA_FILE):
        logging.error(f"{POI_DATA_FILE} not found. Run etl_06_extract_pois.py first.")
        return
        
    logging.info("Generating SQL migration file for POIs...")

    with open(POI_DATA_FILE, 'r', encoding='utf-8') as f:
        data = json.load(f)

    logging.info(f"Generating INSERT statements for {len(data)} POIs...")

    sql_lines = [
        "-- ==============================================================================",
        "-- 17. SEED POINTS OF INTEREST (POIs)",
        "-- ==============================================================================",
        "DO $$",
        "BEGIN"
    ]
    
    count = 0
    chunk_size = 1000
    file_index = 1
    
    for item in data:
        name = escape_sql(item.get('name', ''))
        poi_type = escape_sql(item.get('poi_type', ''))
        lon = item['geometry']['coordinates'][0]
        lat = item['geometry']['coordinates'][1]
        
        sql_lines.append(f"    -- {name} ({poi_type})")
        # Use PostGIS nearest neighbor (<->) to dynamically link the POI to the closest locality
        sql_lines.append(
            f"    INSERT INTO geo.poi (locality_id, name, poi_type, center_point) "
            f"SELECT id, '{name}', '{poi_type}', ST_SetSRID(ST_MakePoint({lon}, {lat}), 4326) "
            f"FROM geo.localities "
            f"ORDER BY center_point <-> ST_SetSRID(ST_MakePoint({lon}, {lat}), 4326) LIMIT 1;"
        )
        
        count += 1
        
        if count % chunk_size == 0:
            sql_lines.append("END $$;")
            filename = f"supabase/migrations/20260710000017_seed_pois_part{file_index}.sql"
            with open(filename, 'w', encoding='utf-8') as f:
                f.write('\n'.join(sql_lines))
            logging.info(f"Generated {filename}")
            
            file_index += 1
            sql_lines = [
                f"-- SEED POIS PART {file_index}",
                "DO $$",
                "BEGIN"
            ]
            
    if len(sql_lines) > 3:
        sql_lines.append("END $$;")
        filename = f"supabase/migrations/20260710000017_seed_pois_part{file_index}.sql"
        with open(filename, 'w', encoding='utf-8') as f:
            f.write('\n'.join(sql_lines))
        logging.info(f"Generated {filename}")

    logging.info(f"Successfully generated SQL for {count} POIs!")

if __name__ == "__main__":
    generate_sql()
