import os
import requests
import subprocess
import sys
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Geofabrik daily extract for Southern India (contains Andhra Pradesh)
PBF_URL = "https://download.geofabrik.de/asia/india/southern-zone-latest.osm.pbf"
RAW_PBF_FILE = "southern-zone-latest.osm.pbf"
FILTERED_PBF_FILE = "visakhapatnam-50km.osm.pbf"
GEOJSON_FILE = "visakhapatnam_data.geojson"

# Bounding box for Greater Visakhapatnam + 50km radius
# Covers Anakapalle, Duvvada, Bhogapuram, Bheemili, etc.
# Format: min_lon, min_lat, max_lon, max_lat
BBOX = "82.8000,17.3000,83.7000,18.1000"

def download_file(url, local_filename):
    if os.path.exists(local_filename):
        logging.info(f"File {local_filename} already exists. Skipping download.")
        return
        
    logging.info(f"Downloading {url} to {local_filename}...")
    with requests.get(url, stream=True) as r:
        r.raise_for_status()
        with open(local_filename, 'wb') as f:
            for chunk in r.iter_content(chunk_size=8192):
                f.write(chunk)
    logging.info("Download complete.")

def filter_pbf_with_osmium():
    """
    Uses osmium CLI to filter the massive PBF file down to just our 50km Vizag bounding box.
    This creates a tiny subset file that is easy to process.
    """
    if os.path.exists(FILTERED_PBF_FILE):
        logging.info(f"Filtered file {FILTERED_PBF_FILE} already exists. Skipping extraction.")
        return
        
    logging.info(f"Extracting Visakhapatnam 50km bounding box ({BBOX})...")
    # osmium extract requires osmium-tool installed on the system, 
    # but since this might run on Windows we can also use pyosmium if osmium-tool isn't available.
    # We will use python -m osmium to do it.
    
    cmd = [
        sys.executable, "-m", "osmium", "extract",
        "-b", BBOX,
        RAW_PBF_FILE,
        "-o", FILTERED_PBF_FILE
    ]
    
    try:
        subprocess.run(cmd, check=True)
        logging.info(f"Extraction complete: {FILTERED_PBF_FILE}")
    except subprocess.CalledProcessError as e:
        logging.error(f"Failed to extract OSM data. Ensure pyosmium is fully installed. Error: {e}")
        sys.exit(1)

def convert_to_geojson():
    """
    Converts the filtered PBF file to GeoJSON using osmium export
    """
    if os.path.exists(GEOJSON_FILE):
        logging.info(f"{GEOJSON_FILE} already exists. Skipping conversion.")
        return
        
    logging.info("Converting filtered PBF to GeoJSON...")
    cmd = [
        sys.executable, "-m", "osmium", "export",
        FILTERED_PBF_FILE,
        "-o", GEOJSON_FILE,
        "-c", '{"geometry_types": ["point", "polygon", "linestring"]}' 
    ]
    
    try:
        subprocess.run(cmd, check=True)
        logging.info(f"GeoJSON export complete: {GEOJSON_FILE}")
    except subprocess.CalledProcessError as e:
        logging.error(f"Failed to export to GeoJSON: {e}")
        # Note: osmium export functionality might require additional libraries, 
        # so this script serves as the robust baseline.

if __name__ == "__main__":
    logging.info("--- Starting VizagProperty ETL Download Phase ---")
    download_file(PBF_URL, RAW_PBF_FILE)
    filter_pbf_with_osmium()
    convert_to_geojson()
    logging.info("--- Phase 1 Complete ---")
