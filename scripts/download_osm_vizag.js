import fs from 'fs';
import https from 'https';
import path from 'path';

// Overpass QL Query to get all suburbs and neighbourhoods in Visakhapatnam
const query = `
[out:json][timeout:90];
// Define the search area for Visakhapatnam
area["name"="Visakhapatnam"]["admin_level"="8"]->.searchArea;
(
  // Get all Suburbs (like Madhurawada, Gajuwaka)
  node["place"="suburb"](area.searchArea);
  way["place"="suburb"](area.searchArea);
  relation["place"="suburb"](area.searchArea);
  
  // Get all Neighbourhoods (like MVP Colony, Seethammadhara)
  node["place"="neighbourhood"](area.searchArea);
  way["place"="neighbourhood"](area.searchArea);
  relation["place"="neighbourhood"](area.searchArea);
  
  // Get villages around the area
  node["place"="village"](area.searchArea);
);
// Output center coordinates and tags
out center;
`;

const OVERPASS_URL = 'https://overpass.kumi.systems/api/interpreter';

console.log('Fetching Visakhapatnam location data from OpenStreetMap...');
console.log('This might take a minute depending on the Overpass API load.\n');

const req = https.request(OVERPASS_URL, {
  method: 'POST',
  headers: {
    'Content-Type': 'application/x-www-form-urlencoded',
    'User-Agent': 'VizagPropertyDataFetcher/1.0'
  }
}, (res) => {
  let data = '';

  res.on('data', (chunk) => {
    data += chunk;
  });

  res.on('end', () => {
    try {
      const jsonData = JSON.parse(data);
      
      if (!jsonData.elements || jsonData.elements.length === 0) {
        console.log('No data found or Overpass query needs tweaking.');
        return;
      }
      
      const locations = jsonData.elements.map(el => {
        // Extract center lat/lon depending on if it's a node or a way/relation
        const lat = el.lat || (el.center && el.center.lat);
        const lon = el.lon || (el.center && el.center.lon);
        
        return {
          id: el.id,
          type: el.type,
          name: el.tags.name,
          name_te: el.tags['name:te'] || null, // Telugu name if available
          place: el.tags.place,
          lat: lat,
          lon: lon
        };
      }).filter(loc => loc.name && loc.lat && loc.lon); // Only keep valid ones

      // Sort alphabetically by name
      locations.sort((a, b) => a.name.localeCompare(b.name));

      const outputPath = path.join(process.cwd(), 'vizag_locations_osm.json');
      fs.writeFileSync(outputPath, JSON.stringify(locations, null, 2));
      
      console.log(`✅ Successfully downloaded ${locations.length} locations in Visakhapatnam!`);
      console.log(`💾 Saved to: ${outputPath}`);
      
      // Print a small sample
      console.log('\nSample Data:');
      console.log(locations.slice(0, 5).map(l => `- ${l.name} (${l.place})`).join('\n'));
      
    } catch (e) {
      console.error('Error parsing response from Overpass API:', e.message);
      console.error('Raw response preview:', data.substring(0, 200));
    }
  });
});

req.on('error', (e) => {
  console.error('Failed to make request to Overpass API:', e);
});

req.write(`data=${encodeURIComponent(query)}`);
req.end();
