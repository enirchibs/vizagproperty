import osmium
import json
import logging
import sys
import os

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

RAW_PBF_FILE = "southern-zone-latest.osm.pbf"
POI_DATA_FILE = "vizag_pois_data.json"

# Bounding Box for Visakhapatnam + 50km
MIN_LON, MIN_LAT, MAX_LON, MAX_LAT = 82.8000, 17.3000, 83.7000, 18.1000

class POIExtractor(osmium.SimpleHandler):
    def __init__(self):
        super(POIExtractor, self).__init__()
        self.pois = []
        
        # Tags we care about
        self.target_amenities = {'hospital', 'clinic', 'school', 'college', 'university', 'kindergarten'}
        self.target_leisure = {'park', 'beach'}
        self.target_tourism = {'hotel', 'motel', 'guest_house'}
        self.target_shop = {'supermarket', 'mall'}

    def in_bbox(self, lon, lat):
        return MIN_LON <= lon <= MAX_LON and MIN_LAT <= lat <= MAX_LAT

    def process_tags(self, tags, lon, lat, osmid, geom_type):
        if not self.in_bbox(lon, lat):
            return

        name = tags.get('name')
        if not name:
            return

        amenity_type = tags.get('amenity')
        leisure_type = tags.get('leisure')
        tourism_type = tags.get('tourism')
        shop_type = tags.get('shop')

        poi_category = None
        poi_type = None

        if amenity_type in self.target_amenities:
            poi_category = 'amenity'
            poi_type = amenity_type
        elif leisure_type in self.target_leisure:
            poi_category = 'leisure'
            poi_type = leisure_type
        elif tourism_type in self.target_tourism:
            poi_category = 'tourism'
            poi_type = tourism_type
        elif shop_type in self.target_shop:
            poi_category = 'shop'
            poi_type = shop_type

        if poi_category:
            # Capitalize and clean up type for database consistency
            display_type = poi_type.replace('_', ' ').title()
            
            self.pois.append({
                'id': osmid,
                'name': name,
                'poi_category': poi_category,
                'poi_type': display_type,
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

def extract_pois():
    if not os.path.exists(RAW_PBF_FILE):
        logging.error(f"{RAW_PBF_FILE} not found. Please place it in the root folder.")
        sys.exit(1)

    logging.info(f"Scanning {RAW_PBF_FILE} for POIs (Schools, Hospitals, Beaches, etc.)...")
    
    extractor = POIExtractor()
    extractor.apply_file(RAW_PBF_FILE)
    
    logging.info(f"Extraction complete! Found {len(extractor.pois)} valid POI records.")
    
    with open(POI_DATA_FILE, 'w', encoding='utf-8') as f:
        json.dump(extractor.pois, f, indent=2, ensure_ascii=False)
        
    logging.info(f"POI data saved to {POI_DATA_FILE}.")

if __name__ == "__main__":
    extract_pois()
