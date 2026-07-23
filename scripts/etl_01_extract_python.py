import osmium
import json
import logging
import sys
import os

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

RAW_PBF_FILE = "southern-zone-latest.osm.pbf"
CLEAN_DATA_FILE = "vizag_cleaned_data.json"

# Bounding Box for Visakhapatnam + 50km
MIN_LON, MIN_LAT, MAX_LON, MAX_LAT = 82.8000, 17.3000, 83.7000, 18.1000

class VizagExtractor(osmium.SimpleHandler):
    def __init__(self):
        super(VizagExtractor, self).__init__()
        self.locations = []
        
        # Tags we care about
        self.target_places = {'suburb', 'neighbourhood', 'city', 'town', 'village', 'hamlet', 'locality'}
        self.target_pois = {'hospital', 'school', 'college', 'park', 'bank', 'restaurant', 'atm'}

    def in_bbox(self, lon, lat):
        return MIN_LON <= lon <= MAX_LON and MIN_LAT <= lat <= MAX_LAT

    def process_tags(self, tags, lon, lat, osmid, geom_type):
        if not self.in_bbox(lon, lat):
            return

        name = tags.get('name')
        if not name:
            return

        place_type = tags.get('place')
        amenity_type = tags.get('amenity')
        leisure_type = tags.get('leisure')
        highway_type = tags.get('highway')

        entity_type = None
        if place_type in self.target_places:
            entity_type = place_type
        elif amenity_type in self.target_pois:
            entity_type = amenity_type
        elif leisure_type == 'park':
            entity_type = 'park'
        elif highway_type in {'primary', 'secondary', 'residential', 'tertiary'}:
            entity_type = 'street'

        if entity_type:
            self.locations.append({
                'id': osmid,
                'name': name,
                'name_te': tags.get('name:te'),
                'type': entity_type,
                'geometry': {
                    'type': 'Point',
                    'coordinates': [lon, lat]
                }
            })

    def node(self, n):
        try:
            self.process_tags(n.tags, n.location.lon, n.location.lat, n.id, 'Point')
        except osmium.InvalidLocationError:
            pass

def extract_data():
    if not os.path.exists(RAW_PBF_FILE):
        logging.error(f"{RAW_PBF_FILE} not found. Please place it in the root folder.")
        sys.exit(1)

    logging.info(f"Scanning {RAW_PBF_FILE} for Vizag data using pyosmium...")
    logging.info("This will take a few minutes to process the 300MB database file...")
    
    extractor = VizagExtractor()
    # Apply the node processing
    extractor.apply_file(RAW_PBF_FILE)
    
    logging.info(f"Extraction complete! Found {len(extractor.locations)} Vizag specific records.")
    
    with open(CLEAN_DATA_FILE, 'w', encoding='utf-8') as f:
        json.dump(extractor.locations, f, indent=2, ensure_ascii=False)
        
    logging.info(f"Data saved to {CLEAN_DATA_FILE}. You can now proceed to etl_03_aliases.py")

if __name__ == "__main__":
    extract_data()
