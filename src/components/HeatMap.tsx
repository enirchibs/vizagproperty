import { useEffect } from 'react';
import { MapContainer, TileLayer, useMap } from 'react-leaflet';
import 'leaflet/dist/leaflet.css';
import L from 'leaflet';
import 'leaflet.heat';

// Mock data for Visakhapatnam property hotspots
// Format: [latitude, longitude, intensity]
const heatmapData: [number, number, number][] = [
  // Madhurawada (High intensity)
  [17.8205, 83.3422, 0.9],
  [17.8250, 83.3450, 0.8],
  [17.8180, 83.3400, 0.85],
  [17.8220, 83.3480, 0.7],
  
  // MVP Colony (High intensity)
  [17.7441, 83.3361, 0.95],
  [17.7480, 83.3390, 0.9],
  [17.7400, 83.3320, 0.85],
  
  // Rushikonda (Very High intensity - luxury)
  [17.7820, 83.3850, 1.0],
  [17.7850, 83.3880, 0.95],
  [17.7800, 83.3820, 0.9],
  
  // Seethammadhara
  [17.7380, 83.3150, 0.8],
  [17.7400, 83.3180, 0.75],
  
  // Yendada
  [17.7800, 83.3550, 0.85],
  [17.7820, 83.3580, 0.8],
  
  // Gajuwaka (Medium intensity)
  [17.6900, 83.2100, 0.6],
  [17.6950, 83.2150, 0.65],
  [17.6850, 83.2050, 0.55],
  
  // PM Palem (Medium-High intensity)
  [17.8000, 83.3500, 0.75],
  [17.8050, 83.3550, 0.7],
];

const HeatmapLayer = () => {
  const map = useMap();

  useEffect(() => {
    // @ts-ignore - leaflet.heat types might be incomplete
    const heat = L.heatLayer(heatmapData, {
      radius: 25,
      blur: 15,
      maxZoom: 15,
      max: 1.0,
      gradient: {
        0.4: 'blue',
        0.6: 'cyan',
        0.7: 'lime',
        0.8: 'yellow',
        1.0: 'red'
      }
    }).addTo(map);

    return () => {
      map.removeLayer(heat);
    };
  }, [map]);

  return null;
};

export const HeatMap = () => {
  // Center of Visakhapatnam
  const position: [number, number] = [17.7294, 83.3083];

  return (
    <div className="w-full h-full min-h-[500px] rounded-3xl overflow-hidden shadow-inner border border-gray-200">
      <MapContainer 
        center={position} 
        zoom={12} 
        scrollWheelZoom={false}
        style={{ height: '100%', width: '100%', minHeight: '500px', zIndex: 10 }}
      >
        <TileLayer
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          className="map-tiles"
        />
        <HeatmapLayer />
      </MapContainer>
    </div>
  );
};
