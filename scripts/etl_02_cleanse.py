import json
import logging
import re
import os

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

GEOJSON_FILE = "visakhapatnam_data.geojson"
CLEAN_DATA_FILE = "vizag_cleaned_data.json"

def normalize_name(name):
    """
    Standardizes names by fixing common abbreviations and inconsistencies.
    Converts "P.M. Palem", "P M Palem", "Pm Palem" -> "PM Palem"
    """
    if not name:
        return None
        
    name = str(name).strip()
    
    # Specific normalization rules for Vizag
    name = re.sub(r'(?i)\bp\.?\s*m\.?\s*palem\b', 'PM Palem', name)
    name = re.sub(r'(?i)\bh\.?\s*b\.?\s*colony\b', 'HB Colony', name)
    name = re.sub(r'(?i)\bm\.?\s*v\.?\s*p\.?\s*colony\b', 'MVP Colony', name)
    name = re.sub(r'(?i)\bvizag\b', 'Visakhapatnam', name)
    
    # Clean up excess whitespace
    name = re.sub(r'\s+', ' ', name)
    
    return name

def is_duplicate(name, existing_names):
    """
    Checks if a highly similar name already exists to prevent duplicate entries 
    like "MVP Colony" and "MVP Colony Phase 1" if configured to merge them.
    (Simplified for this script; advanced deduplication uses Levenshtein / PostGIS clustering)
    """
    name_lower = name.lower()
    for existing in existing_names:
        if name_lower in existing.lower() or existing.lower() in name_lower:
            return True
    return False

def clean_data():
    if not os.path.exists(GEOJSON_FILE):
        logging.error(f"{GEOJSON_FILE} not found. Run etl_01_download.py first.")
        return

    logging.info(f"Loading raw data from {GEOJSON_FILE}...")
    
    try:
        with open(GEOJSON_FILE, 'r', encoding='utf-8') as f:
            data = json.load(f)
    except Exception as e:
        logging.error(f"Failed to load GeoJSON: {e}")
        return

    features = data.get('features', [])
    logging.info(f"Found {len(features)} total features.")

    processed_data = []
    seen_names = set()

    # We want specific objects based on OpenStreetMap tags
    target_places = {'suburb', 'neighbourhood', 'city', 'town', 'village', 'hamlet', 'locality'}
    target_pois = {'hospital', 'school', 'college', 'park', 'bank', 'restaurant', 'atm'}

    for feature in features:
        props = feature.get('properties', {})
        geom = feature.get('geometry', {})
        
        name = props.get('name')
        if not name:
            continue
            
        clean_name = normalize_name(name)
        
        place_type = props.get('place')
        amenity_type = props.get('amenity')
        leisure_type = props.get('leisure')
        highway_type = props.get('highway')

        entity_type = None
        
        if place_type in target_places:
            entity_type = place_type
        elif amenity_type in target_pois:
            entity_type = amenity_type
        elif leisure_type == 'park':
            entity_type = 'park'
        elif highway_type in {'primary', 'secondary', 'residential', 'tertiary'}:
            entity_type = 'street'
            
        if entity_type:
            processed_data.append({
                'id': feature.get('id'),
                'name': clean_name,
                'name_te': props.get('name:te'),
                'type': entity_type,
                'geometry': geom
            })
            seen_names.add(clean_name)

    logging.info(f"Extracted {len(processed_data)} valid categorized locations/POIs/Streets.")
    
    with open(CLEAN_DATA_FILE, 'w', encoding='utf-8') as f:
        json.dump(processed_data, f, indent=2, ensure_ascii=False)
        
    logging.info(f"Clean data saved to {CLEAN_DATA_FILE}.")

if __name__ == "__main__":
    logging.info("--- Starting ETL Cleanse Phase ---")
    clean_data()
