// Google Maps Configuration for VizagProperty
// Uses raw Google Maps JavaScript API loaded via script tag in index.html

/** Center of Visakhapatnam */
export const VIZAG_CENTER = { lat: 17.6868, lng: 83.2185 } as const

/** Default zoom for city-wide listing views */
export const DEFAULT_ZOOM = 12

/** Zoom level for property detail pages */
export const DETAIL_ZOOM = 15

/**
 * Premium refined map style – subtle dark tint with muted colors and clean labels.
 * NOT fully dark; just professional and polished.
 */
export const MAP_STYLES: google.maps.MapTypeStyle[] = [
  // Global geometry – slightly muted base
  {
    featureType: 'all',
    elementType: 'geometry',
    stylers: [{ saturation: -20 }, { lightness: 5 }],
  },
  // Soften labels
  {
    featureType: 'all',
    elementType: 'labels.text.fill',
    stylers: [{ color: '#4a5568' }],
  },
  {
    featureType: 'all',
    elementType: 'labels.text.stroke',
    stylers: [{ color: '#ffffff' }, { lightness: 20 }],
  },
  // Water – refined steel blue
  {
    featureType: 'water',
    elementType: 'geometry.fill',
    stylers: [{ color: '#c3d5e8' }],
  },
  {
    featureType: 'water',
    elementType: 'labels.text.fill',
    stylers: [{ color: '#7c9ab5' }],
  },
  // Landscape / land
  {
    featureType: 'landscape',
    elementType: 'geometry.fill',
    stylers: [{ color: '#f0f2f5' }],
  },
  {
    featureType: 'landscape.natural',
    elementType: 'geometry.fill',
    stylers: [{ color: '#e8ecf1' }],
  },
  // Parks – muted green
  {
    featureType: 'poi.park',
    elementType: 'geometry.fill',
    stylers: [{ color: '#d4e4d4' }],
  },
  {
    featureType: 'poi.park',
    elementType: 'labels.text.fill',
    stylers: [{ color: '#6b8e6b' }],
  },
  // Hide business POIs for a cleaner look
  {
    featureType: 'poi.business',
    elementType: 'all',
    stylers: [{ visibility: 'off' }],
  },
  // Roads – clean grays
  {
    featureType: 'road.highway',
    elementType: 'geometry.fill',
    stylers: [{ color: '#e2e6ea' }],
  },
  {
    featureType: 'road.highway',
    elementType: 'geometry.stroke',
    stylers: [{ color: '#cfd4da' }],
  },
  {
    featureType: 'road.highway',
    elementType: 'labels.text.fill',
    stylers: [{ color: '#616b77' }],
  },
  {
    featureType: 'road.arterial',
    elementType: 'geometry.fill',
    stylers: [{ color: '#f5f6f8' }],
  },
  {
    featureType: 'road.arterial',
    elementType: 'geometry.stroke',
    stylers: [{ color: '#dfe3e8' }],
  },
  {
    featureType: 'road.local',
    elementType: 'geometry.fill',
    stylers: [{ color: '#ffffff' }],
  },
  {
    featureType: 'road.local',
    elementType: 'geometry.stroke',
    stylers: [{ color: '#e8eaed' }],
  },
  // Transit – subtle
  {
    featureType: 'transit',
    elementType: 'geometry',
    stylers: [{ color: '#e5e7eb' }],
  },
  {
    featureType: 'transit.station',
    elementType: 'labels.text.fill',
    stylers: [{ color: '#6b7280' }],
  },
  // Administrative labels – refined
  {
    featureType: 'administrative',
    elementType: 'labels.text.fill',
    stylers: [{ color: '#374151' }],
  },
  {
    featureType: 'administrative.neighborhood',
    elementType: 'labels.text.fill',
    stylers: [{ color: '#6b7280' }],
  },
]

/** Color palette for property-type markers */
export const MARKER_COLORS: Record<string, string> = {
  flat_apartment: '#3B82F6',        // blue
  independent_house_villa: '#8B5CF6', // purple
  plot_land: '#10B981',             // green
  pg_hostel: '#F59E0B',            // amber
  commercial: '#EF4444',           // red
  // Commercial sub-types also map to red
  office: '#EF4444',
  shop: '#EF4444',
  showroom: '#EF4444',
  warehouse: '#EF4444',
  industrial_land: '#EF4444',
  commercial_plot: '#EF4444',
  commercial_farmhouse: '#EF4444',
  coworking_space: '#EF4444',
  other_commercial: '#EF4444',
  // Fallback
  default: '#6366F1',              // indigo
} as const

/**
 * Returns the marker color hex for a given property type.
 * Falls back to indigo if the type is unknown.
 */
export function getMarkerColor(propertyType: string): string {
  return MARKER_COLORS[propertyType] ?? MARKER_COLORS.default
}

/**
 * Polls for `window.google.maps` to become available.
 * Resolves once the Google Maps JS API is ready, or rejects after 10 s.
 */
export function waitForGoogleMaps(): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    // Already loaded
    if (typeof google !== 'undefined' && google.maps) {
      resolve()
      return
    }

    const interval = 100 // ms
    const timeout = 10_000 // ms
    let elapsed = 0

    const timer = setInterval(() => {
      elapsed += interval

      if (typeof google !== 'undefined' && google.maps) {
        clearInterval(timer)
        resolve()
        return
      }

      if (elapsed >= timeout) {
        clearInterval(timer)
        reject(new Error('Google Maps JavaScript API failed to load within 10 seconds.'))
      }
    }, interval)
  })
}
