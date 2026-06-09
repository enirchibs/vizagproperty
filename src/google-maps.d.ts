/**
 * Minimal type declarations for the Google Maps JavaScript API.
 * The full API is loaded via <script> tag in index.html – these declarations
 * let TypeScript understand the `google.maps.*` namespace without installing
 * @types/google.maps (which would pull in a large set of types we don't need).
 */

/* eslint-disable @typescript-eslint/no-namespace */

declare namespace google.maps {
  class Map {
    constructor(element: HTMLElement, options?: MapOptions)
    setCenter(latlng: LatLngLiteral): void
    setZoom(zoom: number): void
    panTo(latlng: LatLngLiteral | LatLng): void
    fitBounds(bounds: LatLngBounds, padding?: number | Padding): void
    getCenter(): LatLng | undefined
    getZoom(): number | undefined
  }

  class Marker {
    constructor(options?: MarkerOptions)
    setMap(map: Map | null): void
    setAnimation(animation: Animation | null): void
    getPosition(): LatLng | null
    addListener(event: string, handler: (...args: unknown[]) => void): MapsEventListener
  }

  class InfoWindow {
    constructor(options?: InfoWindowOptions)
    open(map?: Map, anchor?: Marker): void
    close(): void
    setContent(content: string | HTMLElement): void
  }

  class LatLng {
    constructor(lat: number, lng: number)
    lat(): number
    lng(): number
  }

  class LatLngBounds {
    constructor(sw?: LatLngLiteral, ne?: LatLngLiteral)
    extend(point: LatLngLiteral | LatLng): LatLngBounds
    getCenter(): LatLng
    isEmpty(): boolean
  }

  class Size {
    constructor(width: number, height: number)
    width: number
    height: number
  }

  class Point {
    constructor(x: number, y: number)
    x: number
    y: number
  }

  enum Animation {
    BOUNCE = 1,
    DROP = 2,
  }

  interface LatLngLiteral {
    lat: number
    lng: number
  }

  interface Padding {
    top: number
    right: number
    bottom: number
    left: number
  }

  interface MapOptions {
    center?: LatLngLiteral
    zoom?: number
    styles?: MapTypeStyle[]
    mapTypeControl?: boolean
    streetViewControl?: boolean
    fullscreenControl?: boolean
    zoomControl?: boolean
    gestureHandling?: string
  }

  interface MarkerOptions {
    position?: LatLngLiteral
    map?: Map
    title?: string
    icon?: string | Icon
    animation?: Animation
    optimized?: boolean
  }

  interface Icon {
    url: string
    scaledSize?: Size
    anchor?: Point
  }

  interface InfoWindowOptions {
    content?: string | HTMLElement
    maxWidth?: number
  }

  interface MapTypeStyle {
    featureType?: string
    elementType?: string
    stylers: Record<string, unknown>[]
  }

  interface MapsEventListener {
    remove(): void
  }

  namespace event {
    function clearInstanceListeners(instance: object): void
    function addListener(instance: object, event: string, handler: (...args: unknown[]) => void): MapsEventListener
  }
}
