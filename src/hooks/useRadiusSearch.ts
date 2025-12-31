import { useState, useCallback } from 'react'
import { supabase } from '../lib/supabase'
import { Property } from '../types'

interface RadiusSearchParams {
  latitude: number
  longitude: number
  radiusKm: number
  propertyType?: string
  listingType?: string
}

interface RadiusSearchResult extends Property {
  distance_meters: number
}

export function useRadiusSearch() {
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const searchByRadius = useCallback(async (params: RadiusSearchParams): Promise<RadiusSearchResult[]> => {
    setLoading(true)
    setError(null)

    try {
      const radiusMeters = params.radiusKm * 1000

      const { data, error: rpcError } = await supabase.rpc('search_properties_by_radius', {
        center_lat: params.latitude,
        center_lng: params.longitude,
        radius_meters: radiusMeters,
        p_property_type: params.propertyType || null,
        p_listing_type: params.listingType || null
      })

      if (rpcError) throw rpcError

      return data || []
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Failed to search properties'
      setError(message)
      console.error('Radius search error:', err)
      return []
    } finally {
      setLoading(false)
    }
  }, [])

  return {
    searchByRadius,
    loading,
    error
  }
}
