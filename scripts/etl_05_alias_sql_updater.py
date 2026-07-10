import json
import logging
import os

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

ALIAS_DATA_FILE = "vizag_alias_data.json"
SQL_OUTPUT_FILE = "supabase/migrations/20260710000016_update_search_aliases.sql"

def generate_update_sql():
    if not os.path.exists(ALIAS_DATA_FILE):
        logging.error(f"{ALIAS_DATA_FILE} not found. Please run etl_03_aliases.py first.")
        return
        
    logging.info("Generating SQL migration file to append phonetic and custom aliases to search_text...")

    with open(ALIAS_DATA_FILE, 'r', encoding='utf-8') as f:
        data = json.load(f)

    sql_lines = [
        "-- ==============================================================================",
        "-- 16. UPDATE SEARCH ALIASES (Phonetic & Common Misspellings)",
        "-- ==============================================================================",
        "DO $$",
        "BEGIN"
    ]
    
    count = 0
    for item in data:
        name = item.get('name', '')
        if not name: continue
        
        name_clean = name.replace("'", "''")
        
        # Add custom known variations that Soundex/Metaphone might miss for Indian names
        custom_variations = []
        name_lower = name.lower()
        if "bhogapuram" in name_lower:
            custom_variations.extend(["bogapuram", "bhogapram", "bhogaparam"])
        elif "madhurawada" in name_lower:
            custom_variations.extend(["madhurvada", "madurwada", "maduravada", "madurvada"])
        elif "gajuwaka" in name_lower:
            custom_variations.extend(["gajuwka", "gajuvaaka", "gaju waka"])
        elif "kommadi" in name_lower:
            custom_variations.extend(["komadi", "komadii", "komadhi"])
        elif "rishikonda" in name_lower or "rushikonda" in name_lower:
            custom_variations.extend(["rishikonda", "rushikonda", "rishikinda"])
        elif "yendada" in name_lower:
            custom_variations.extend(["yandada", "endada"])
        elif "pendurthi" in name_lower:
            custom_variations.extend(["pendurti", "pendurty"])
            
        phonetic = item.get('phonetic_aliases', [])
        custom = item.get('custom_aliases', [])
        
        all_aliases = list(set(phonetic + custom + custom_variations))
        if not all_aliases: continue
        
        # Join into a space-separated string for pg_trgm matching
        alias_str = " ".join(all_aliases).replace("'", "''")
        
        # Check if we need to update
        if "bogapuram" in alias_str or "madhurvada" in alias_str or count < 100:
            # We use an UPDATE on search.locations matching the exact display name prefix
            sql_lines.append(f"    UPDATE search.locations SET search_text = search_text || ' {alias_str}' WHERE display_name ILIKE '{name_clean}%' AND search_text NOT ILIKE '%{all_aliases[0]}%';")
            count += 1
        
    sql_lines.append("END $$;")
    
    # Ensure directory exists
    os.makedirs(os.path.dirname(SQL_OUTPUT_FILE), exist_ok=True)
    
    with open(SQL_OUTPUT_FILE, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))
        
    logging.info(f"Successfully generated {SQL_OUTPUT_FILE} with {count} update statements.")
    logging.info("Run this file in your Supabase SQL Editor to apply the aliases.")

if __name__ == "__main__":
    generate_update_sql()
