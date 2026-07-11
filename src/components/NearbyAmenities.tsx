import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { MapPin, Building2, Trees, GraduationCap, Stethoscope, Coffee, HeartPulse } from 'lucide-react';

interface POI {
  poi_id: string;
  name: string;
  poi_type: string;
  distance_meters: number;
}

interface NearbyAmenitiesProps {
  propertyId: string;
}

const ICONS: Record<string, React.ReactNode> = {
  'Hospital': <Stethoscope className="w-5 h-5 text-red-500" />,
  'Clinic': <HeartPulse className="w-5 h-5 text-red-400" />,
  'School': <GraduationCap className="w-5 h-5 text-blue-500" />,
  'College': <GraduationCap className="w-5 h-5 text-blue-600" />,
  'University': <GraduationCap className="w-5 h-5 text-blue-700" />,
  'Kindergarten': <GraduationCap className="w-5 h-5 text-purple-400" />,
  'Park': <Trees className="w-5 h-5 text-green-500" />,
  'Beach': <MapPin className="w-5 h-5 text-cyan-500" />,
  'Hotel': <Building2 className="w-5 h-5 text-amber-500" />,
  'Supermarket': <Coffee className="w-5 h-5 text-orange-500" />
};

export function NearbyAmenities({ propertyId }: NearbyAmenitiesProps) {
  const [pois, setPois] = useState<POI[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchPOIs() {
      if (!propertyId) return;
      try {
        const { data, error } = await supabase.rpc('get_nearby_pois', {
          prop_id: propertyId,
          radius_meters: 3000
        });

        if (error) throw error;
        setPois(data || []);
      } catch (error) {
        console.error('Error fetching nearby POIs:', error);
      } finally {
        setLoading(false);
      }
    }

    fetchPOIs();
  }, [propertyId]);

  if (loading) {
    return (
      <div className="bg-white rounded-2xl p-4 md:p-6 shadow-sm border border-gray-100 mb-6">
        <h2 className="text-xl font-semibold text-gray-900 mb-4 flex items-center gap-2">
          <MapPin className="h-5 w-5 text-primary-600" />
          Nearby Amenities (3km)
        </h2>
        <div className="space-y-4">
          <div className="h-4 bg-gray-200 rounded w-full animate-pulse"></div>
          <div className="h-4 bg-gray-200 rounded w-5/6 animate-pulse"></div>
          <div className="h-4 bg-gray-200 rounded w-4/6 animate-pulse"></div>
        </div>
      </div>
    );
  }

  if (!pois || pois.length === 0) {
    return null; // Don't show the section if no POIs are found
  }

  // Group POIs by category
  const groupedPois = pois.reduce((acc, poi) => {
    if (!acc[poi.poi_type]) {
      acc[poi.poi_type] = [];
    }
    acc[poi.poi_type].push(poi);
    return acc;
  }, {} as Record<string, POI[]>);

  return (
    <div className="bg-white rounded-2xl p-4 md:p-6 shadow-sm border border-gray-100 mb-6">
      <h2 className="text-xl font-semibold text-gray-900 mb-4 flex items-center gap-2">
        <MapPin className="h-5 w-5 text-primary-600" />
        Nearby Amenities
      </h2>
      <p className="text-sm text-gray-500 mb-4">Points of interest within a 3km radius.</p>
      
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        {Object.entries(groupedPois).map(([type, items]) => (
          <div key={type} className="bg-gray-50 p-4 rounded-xl">
            <h3 className="font-semibold text-gray-800 mb-3 flex items-center gap-2">
              {ICONS[type] || <MapPin className="w-5 h-5 text-gray-400" />}
              {type}s
            </h3>
            <ul className="space-y-2">
              {items.slice(0, 5).map((poi) => (
                <li key={poi.poi_id} className="flex justify-between items-center text-sm">
                  <span className="text-gray-700 truncate pr-2">{poi.name}</span>
                  <span className="text-gray-500 whitespace-nowrap font-medium">
                    {(poi.distance_meters / 1000).toFixed(1)} km
                  </span>
                </li>
              ))}
              {items.length > 5 && (
                <li className="text-xs text-primary-600 font-medium pt-1">
                  + {items.length - 5} more
                </li>
              )}
            </ul>
          </div>
        ))}
      </div>
    </div>
  );
}
