import json
import logging
import jellyfish
import os

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

CLEAN_DATA_FILE = "vizag_cleaned_data.json"
ALIAS_DATA_FILE = "vizag_alias_data.json"

def generate_phonetic_aliases(name):
    """
    Uses Soundex and Metaphone algorithms (via jellyfish) to generate phonetic representations.
    This helps the database match "Maduravada" to "Madhurawada".
    """
    aliases = []
    
    # Soundex gives a 4-character phonetic code
    soundex_code = jellyfish.soundex(name)
    aliases.append(soundex_code)
    
    # Metaphone is more accurate for English pronunciation
    metaphone_code = jellyfish.metaphone(name)
    aliases.append(metaphone_code)
    
    return list(set(aliases))

def generate_language_aliases(name):
    """
    Placeholder for advanced transliteration (e.g. Indic NLP).
    """
    return []

def generate_aliases():
    if not os.path.exists(CLEAN_DATA_FILE):
        logging.error(f"{CLEAN_DATA_FILE} not found. Run etl_02_cleanse.py first.")
        return

    with open(CLEAN_DATA_FILE, 'r', encoding='utf-8') as f:
        data = json.load(f)

    logging.info("Generating phonetic and language aliases...")
    
    for item in data:
        name = item['name']
        item['phonetic_aliases'] = generate_phonetic_aliases(name)
        
        # Hardcoded alias examples from spec
        custom_aliases = []
        name_lower = name.lower()
        if "rushikonda" in name_lower:
            custom_aliases.extend(["Rushikonda Beach", "Rushikonda Hills"])
        elif "gajuwaka" in name_lower:
            custom_aliases.extend(["Old Gajuwaka", "New Gajuwaka"])
        elif "steel plant" in name_lower:
            custom_aliases.extend(["Vizag Steel Plant", "VSP"])
            
        item['custom_aliases'] = custom_aliases

    with open(ALIAS_DATA_FILE, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=2, ensure_ascii=False)
        
    logging.info(f"Alias generation complete. Saved to {ALIAS_DATA_FILE}.")

if __name__ == "__main__":
    logging.info("--- Starting ETL Alias Phase ---")
    generate_aliases()
