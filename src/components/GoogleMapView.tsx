import { useRef, useEffect, useState, useCallback } from 'react'
import { Property } from '../types'
import {
  VIZAG_CENTER,
  DEFAULT_ZOOM,
  MAP_STYLES,
  getMarkerColor,
  waitForGoogleMaps,
} from '../config/googleMaps'

// ---------------------------------------------------------------------------
// Props
// ---------------------------------------------------------------------------

interface GoogleMapViewProps {
  properties: Property[]
  selectedPropertyId?: string | null
  onPropertySelect?: (propertyId: string) => void
  onPropertyHover?: (propertyId: string | null) => void
  className?: string
  zoom?: number
  center?: { lat: number; lng: number }
}

// ---------------------------------------------------------------------------
// Helpers (inline – Tailwind doesn't apply inside InfoWindow HTML strings)
// ---------------------------------------------------------------------------

function formatPrice(price: number): string {
  if (price >= 10_000_000) return `₹${(price / 10_000_000).toFixed(2)} Cr`
  if (price >= 100_000) return `₹${(price / 100_000).toFixed(2)} L`
  return `₹${price.toLocaleString()}`
}

function buildInfoWindowContent(property: Property): string {
  const image = property.images?.[0] || '/placeholder-property.jpg'
  const location = property.location || property.city || 'Visakhapatnam'
  const bhk = property.bedrooms && property.bedrooms > 0 ? `${property.bedrooms} BHK` : ''
  const area = property.area_sqft ? `${property.area_sqft.toLocaleString()} sqft` : ''
  const details = [bhk, area].filter(Boolean).join(' · ')

  return `
    <div style="
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      width: 280px;
      border-radius: 12px;
      overflow: hidden;
      background: #fff;
    ">
      <div style="position:relative;width:100%;height:150px;overflow:hidden;">
        <img
          src="${image}"
          alt="${property.title.replace(/"/g, '&quot;')}"
          style="width:100%;height:100%;object-fit:cover;"
          onerror="this.src='/placeholder-property.jpg'"
        />
        <div style="
          position:absolute;bottom:8px;left:8px;
          background:rgba(0,0,0,0.6);
          color:#fff;padding:3px 10px;border-radius:20px;
          font-size:13px;font-weight:600;
          backdrop-filter:blur(4px);
        ">
          ${formatPrice(property.price)}
        </div>
      </div>

      <div style="padding:12px 14px 14px;">
        <h3 style="
          margin:0 0 6px;font-size:15px;font-weight:700;
          color:#111827;line-height:1.3;
          display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;overflow:hidden;
        ">
          ${property.title}
        </h3>

        <div style="display:flex;align-items:center;gap:4px;margin-bottom:6px;">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#6B7280" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/>
            <circle cx="12" cy="10" r="3"/>
          </svg>
          <span style="font-size:13px;color:#6B7280;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width:230px;">
            ${location}
          </span>
        </div>

        ${details ? `
          <div style="font-size:12px;color:#9CA3AF;margin-bottom:10px;">
            ${details}
          </div>
        ` : ''}

        <a
          href="/property/${property.id}"
          style="
            display:inline-block;
            background:linear-gradient(135deg,#6366F1,#4F46E5);
            color:#fff;padding:7px 16px;border-radius:8px;
            font-size:13px;font-weight:600;text-decoration:none;
            transition:opacity 0.2s;
          "
          onmouseover="this.style.opacity='0.9'"
          onmouseout="this.style.opacity='1'"
        >
          View Details →
        </a>
      </div>
    </div>
  `
}

/**
 * Creates a colored SVG pin data-URI for use as a marker icon.
 */
function createColoredMarkerIcon(color: string): google.maps.Icon {
  const svg = `
    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="40" viewBox="0 0 28 40">
      <path d="M14 0C6.268 0 0 6.268 0 14c0 10.5 14 26 14 26s14-15.5 14-26C28 6.268 21.732 0 14 0z" fill="${color}"/>
      <circle cx="14" cy="14" r="6" fill="#fff" opacity="0.9"/>
    </svg>`
  return {
    url: 'data:image/svg+xml;charset=UTF-8,' + encodeURIComponent(svg.trim()),
    scaledSize: new google.maps.Size(28, 40),
    anchor: new google.maps.Point(14, 40),
  }
}

// ---------------------------------------------------------------------------
// Component
// ---------------------------------------------------------------------------

export function GoogleMapView({
  properties,
  selectedPropertyId,
  onPropertySelect,
  onPropertyHover,
  className = '',
  zoom,
  center,
}: GoogleMapViewProps) {
  const containerRef = useRef<HTMLDivElement>(null)
  const mapRef = useRef<google.maps.Map | null>(null)
  const markersRef = useRef<Map<string, google.maps.Marker>>(new Map())
  const infoWindowRef = useRef<google.maps.InfoWindow | null>(null)

  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  // Stable callback refs so effects don't re-run on every parent render
  const onSelectRef = useRef(onPropertySelect)
  onSelectRef.current = onPropertySelect

  const onHoverRef = useRef(onPropertyHover)
  onHoverRef.current = onPropertyHover

  // -------------------------------------------------------------------
  // Init map
  // -------------------------------------------------------------------
  useEffect(() => {
    let cancelled = false

    async function init() {
      try {
        await waitForGoogleMaps()
        if (cancelled || !containerRef.current) return

        const map = new google.maps.Map(containerRef.current, {
          center: center ?? VIZAG_CENTER,
          zoom: zoom ?? DEFAULT_ZOOM,
          styles: MAP_STYLES,
          mapTypeControl: false,
          streetViewControl: false,
          fullscreenControl: true,
          zoomControl: true,
          gestureHandling: 'cooperative',
        })

        mapRef.current = map
        infoWindowRef.current = new google.maps.InfoWindow()
        setLoading(false)
      } catch {
        if (!cancelled) {
          setError('Unable to load Google Maps. Please check your connection and refresh.')
          setLoading(false)
        }
      }
    }

    init()

    return () => {
      cancelled = true
    }
    // Only re-init if center / zoom identity changes (not reference)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [center?.lat, center?.lng, zoom])

  // -------------------------------------------------------------------
  // Sync markers when properties change
  // -------------------------------------------------------------------
  const syncMarkers = useCallback(() => {
    const map = mapRef.current
    if (!map) return

    // Clear old markers
    markersRef.current.forEach((marker) => {
      google.maps.event.clearInstanceListeners(marker)
      marker.setMap(null)
    })
    markersRef.current.clear()

    const validProps = properties.filter(
      (p) =>
        p.latitude != null &&
        p.longitude != null &&
        isFinite(p.latitude) &&
        isFinite(p.longitude),
    )

    if (validProps.length === 0) return

    const bounds = new google.maps.LatLngBounds()

    validProps.forEach((property) => {
      const position = { lat: property.latitude!, lng: property.longitude! }
      bounds.extend(position)

      const marker = new google.maps.Marker({
        position,
        map,
        title: property.title,
        icon: createColoredMarkerIcon(getMarkerColor(property.property_type)),
        optimized: true,
      })

      // Click → InfoWindow
      marker.addListener('click', () => {
        const iw = infoWindowRef.current
        if (!iw) return
        iw.setContent(buildInfoWindowContent(property))
        iw.open(map, marker)
        map.panTo(position)
        onSelectRef.current?.(property.id)
      })

      // Hover → notify parent + bounce
      marker.addListener('mouseover', () => {
        onHoverRef.current?.(property.id)
        marker.setAnimation(google.maps.Animation.BOUNCE)
      })
      marker.addListener('mouseout', () => {
        onHoverRef.current?.(null)
        marker.setAnimation(null)
      })

      markersRef.current.set(property.id, marker)
    })

    // Fit bounds with padding (only if more than one marker)
    if (validProps.length > 1) {
      map.fitBounds(bounds, { top: 50, right: 50, bottom: 50, left: 50 })
    } else {
      const c = bounds.getCenter()
      map.setCenter({ lat: c.lat(), lng: c.lng() })
      map.setZoom(zoom ?? DEFAULT_ZOOM)
    }
  }, [properties, zoom])

  useEffect(() => {
    if (!loading && !error) syncMarkers()
  }, [loading, error, syncMarkers])

  // -------------------------------------------------------------------
  // React to selectedPropertyId changes
  // -------------------------------------------------------------------
  useEffect(() => {
    if (!selectedPropertyId || loading || error) return

    const marker = markersRef.current.get(selectedPropertyId)
    const map = mapRef.current
    const iw = infoWindowRef.current
    if (!marker || !map || !iw) return

    const property = properties.find((p) => p.id === selectedPropertyId)
    if (!property) return

    map.panTo(marker.getPosition()!)
    iw.setContent(buildInfoWindowContent(property))
    iw.open(map, marker)
  }, [selectedPropertyId, properties, loading, error])


  // -------------------------------------------------------------------
  // Cleanup
  // -------------------------------------------------------------------
  useEffect(() => {
    return () => {
      markersRef.current.forEach((marker) => {
        google.maps.event.clearInstanceListeners(marker)
        marker.setMap(null)
      })
      markersRef.current.clear()
      infoWindowRef.current?.close()
    }
  }, [])

  // -------------------------------------------------------------------
  // Render
  // -------------------------------------------------------------------

  if (error) {
    return (
      <div
        className={`flex flex-col items-center justify-center bg-gray-50 rounded-xl border border-gray-200 p-8 text-center ${className}`}
        style={{ minHeight: 400 }}
      >
        <svg
          className="h-12 w-12 text-gray-400 mb-4"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          strokeWidth={1.5}
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            d="M9 20l-5.447-2.724A2 2 0 013 15.382V5.618a2 2 0 011.106-1.789L9 1m0 0l6 3m-6-3v18m6-15l5.447 2.724A2 2 0 0121 8.618v9.764a2 2 0 01-1.106 1.789L15 23m0-18v18"
          />
        </svg>
        <p className="text-gray-600 font-medium mb-1">Map couldn't be loaded</p>
        <p className="text-gray-400 text-sm">{error}</p>
      </div>
    )
  }

  return (
    <div className={`relative ${className}`}>
      {/* Loading skeleton */}
      {loading && (
        <div
          className="absolute inset-0 z-10 flex items-center justify-center bg-gray-100 rounded-xl animate-pulse"
          style={{ minHeight: 400 }}
        >
          <div className="flex flex-col items-center gap-3">
            <svg
              className="h-10 w-10 text-gray-300"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              strokeWidth={1.5}
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M9 20l-5.447-2.724A2 2 0 013 15.382V5.618a2 2 0 011.106-1.789L9 1m0 0l6 3m-6-3v18m6-15l5.447 2.724A2 2 0 0121 8.618v9.764a2 2 0 01-1.106 1.789L15 23m0-18v18"
              />
            </svg>
            <span className="text-gray-400 text-sm font-medium">Loading map…</span>
          </div>
        </div>
      )}

      {/* Map container */}
      <div
        ref={containerRef}
        className="w-full rounded-xl"
        style={{ minHeight: 400, height: '100%' }}
      />
    </div>
  )
}
