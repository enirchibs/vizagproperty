import { useRef, useEffect, useState } from 'react'
import { MapPin, Navigation, ExternalLink } from 'lucide-react'
import {
  DETAIL_ZOOM,
  MAP_STYLES,
  waitForGoogleMaps,
} from '../config/googleMaps'

// ---------------------------------------------------------------------------
// Props
// ---------------------------------------------------------------------------

interface PropertyLocationMapProps {
  latitude?: number
  longitude?: number
  title: string
  location?: string
}

// ---------------------------------------------------------------------------
// Sub-component: No-coordinates fallback
// ---------------------------------------------------------------------------

function NoLocationFallback({ title, location }: { title: string; location?: string }) {
  const searchQuery = encodeURIComponent(
    `${title}${location ? ', ' + location : ''}, Visakhapatnam`,
  )

  return (
    <div className="rounded-xl border border-gray-200 bg-gray-50 overflow-hidden">
      <div className="flex flex-col items-center justify-center py-12 px-6 text-center h-[300px] md:h-[400px]">
        <div className="w-14 h-14 rounded-full bg-gray-100 flex items-center justify-center mb-4">
          <MapPin className="h-7 w-7 text-gray-400" />
        </div>
        <p className="text-gray-600 font-medium mb-1">
          Location on map not available
        </p>
        <p className="text-gray-400 text-sm mb-5">
          Exact coordinates are not listed for this property.
        </p>
        <a
          href={`https://www.google.com/maps/search/?api=1&query=${searchQuery}`}
          target="_blank"
          rel="noopener noreferrer"
          className="inline-flex items-center gap-2 text-sm font-semibold text-primary-600 hover:text-primary-700 transition-colors"
        >
          <ExternalLink className="h-4 w-4" />
          Search on Google Maps
        </a>
      </div>
    </div>
  )
}

// ---------------------------------------------------------------------------
// Sub-component: Map with coordinates
// ---------------------------------------------------------------------------

function LocationMap({
  latitude,
  longitude,
  title,
  location,
}: {
  latitude: number
  longitude: number
  title: string
  location?: string
}) {
  const containerRef = useRef<HTMLDivElement>(null)
  const markerRef = useRef<google.maps.Marker | null>(null)
  const infoWindowRef = useRef<google.maps.InfoWindow | null>(null)

  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)

  useEffect(() => {
    let cancelled = false

    async function init() {
      try {
        await waitForGoogleMaps()
        if (cancelled || !containerRef.current) return

        const position = { lat: latitude, lng: longitude }

        const map = new google.maps.Map(containerRef.current, {
          center: position,
          zoom: DETAIL_ZOOM,
          styles: MAP_STYLES,
          mapTypeControl: false,
          streetViewControl: false,
          fullscreenControl: true,
          zoomControl: true,
          gestureHandling: 'cooperative',
        })

        const marker = new google.maps.Marker({
          position,
          map,
          title,
          animation: google.maps.Animation.DROP,
        })

        const infoWindow = new google.maps.InfoWindow({
          content: `
            <div style="
              font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;
              padding:8px 12px;max-width:220px;
            ">
              <h4 style="margin:0 0 4px;font-size:14px;font-weight:700;color:#111827;line-height:1.3;">
                ${title.replace(/"/g, '&quot;')}
              </h4>
              ${location ? `
                <p style="margin:0;font-size:12px;color:#6B7280;">
                  ${location}
                </p>
              ` : ''}
            </div>
          `,
        })

        marker.addListener('click', () => {
          infoWindow.open(map, marker)
        })

        // Open InfoWindow by default
        infoWindow.open(map, marker)

        markerRef.current = marker
        infoWindowRef.current = infoWindow

        setLoading(false)
      } catch {
        if (!cancelled) {
          setError(true)
          setLoading(false)
        }
      }
    }

    init()

    return () => {
      cancelled = true
      if (markerRef.current) {
        google.maps.event.clearInstanceListeners(markerRef.current)
        markerRef.current.setMap(null)
        markerRef.current = null
      }
      infoWindowRef.current?.close()
    }
  }, [latitude, longitude, title, location])

  // Error state
  if (error) {
    return (
      <div className="rounded-xl border border-gray-200 bg-gray-50 overflow-hidden">
        <div className="flex flex-col items-center justify-center py-12 px-6 text-center h-[300px] md:h-[400px]">
          <div className="w-14 h-14 rounded-full bg-red-50 flex items-center justify-center mb-4">
            <MapPin className="h-7 w-7 text-red-400" />
          </div>
          <p className="text-gray-600 font-medium mb-1">
            Map could not be loaded
          </p>
          <p className="text-gray-400 text-sm">
            Please check your connection and try again.
          </p>
        </div>
      </div>
    )
  }

  const directionsUrl = `https://www.google.com/maps/dir/?api=1&destination=${latitude},${longitude}`
  const openInMapsUrl = `https://www.google.com/maps?q=${latitude},${longitude}`

  return (
    <div>
      {/* Map wrapper */}
      <div className="relative rounded-xl overflow-hidden border border-gray-200">
        {/* Loading skeleton */}
        {loading && (
          <div className="absolute inset-0 z-10 flex items-center justify-center bg-gray-100 animate-pulse">
            <div className="flex flex-col items-center gap-3">
              <MapPin className="h-8 w-8 text-gray-300" />
              <span className="text-gray-400 text-sm font-medium">
                Loading map…
              </span>
            </div>
          </div>
        )}

        {/* Map container */}
        <div
          ref={containerRef}
          className="w-full h-[300px] md:h-[400px]"
        />
      </div>

      {/* Action buttons below map */}
      <div className="flex flex-col sm:flex-row gap-3 mt-4">
        <a
          href={directionsUrl}
          target="_blank"
          rel="noopener noreferrer"
          className="flex-1 inline-flex items-center justify-center gap-2 bg-primary-600 hover:bg-primary-700 text-white font-semibold py-3 px-5 rounded-xl transition-colors shadow-sm"
        >
          <Navigation className="h-4 w-4" />
          Get Directions
        </a>

        <a
          href={openInMapsUrl}
          target="_blank"
          rel="noopener noreferrer"
          className="flex-1 inline-flex items-center justify-center gap-2 bg-white hover:bg-gray-50 text-gray-700 font-semibold py-3 px-5 rounded-xl border border-gray-200 transition-colors shadow-sm"
        >
          <ExternalLink className="h-4 w-4" />
          Open in Google Maps
        </a>
      </div>
    </div>
  )
}

// ---------------------------------------------------------------------------
// Main exported component
// ---------------------------------------------------------------------------

export function PropertyLocationMap({
  latitude,
  longitude,
  title,
  location,
}: PropertyLocationMapProps) {
  const hasCoords =
    latitude != null &&
    longitude != null &&
    isFinite(latitude) &&
    isFinite(longitude)

  if (!hasCoords) {
    return <NoLocationFallback title={title} location={location} />
  }

  return (
    <LocationMap
      latitude={latitude!}
      longitude={longitude!}
      title={title}
      location={location}
    />
  )
}
