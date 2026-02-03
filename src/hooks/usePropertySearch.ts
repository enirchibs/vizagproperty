import { useState } from 'react'
import { supabase } from '../lib/supabase'
import { Property } from '../types'

export interface PropertySearchParams {
  propertyType: 'flat' | 'plot' | 'villa' | 'pg' | 'commercial'
  listingType: 'sale' | 'rent'
  localityId?: string
  localityName?: string
  includeNearby?: boolean
  keyword?: string
  minPrice?: number
  maxPrice?: number
  bedrooms?: number
  propertyStatus?: string
  radiusEnabled?: boolean
  radiusKm?: number
  centerLat?: number
  centerLng?: number
}

interface UsePropertySearchReturn {
  properties: Property[]
  loading: boolean
  error: string | null
  search: (params: PropertySearchParams) => Promise<void>
  totalCount: number
}

const PROPERTY_TYPE_MAP: Record<string, string> = {
  flat: 'flat',
  plot: 'plot',
  villa: 'villa',
  pg: 'pg_hostel',
  commercial: 'commercial'
}

export function usePropertySearch(): UsePropertySearchReturn {
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [totalCount, setTotalCount] = useState(0)

  const search = async (params: PropertySearchParams) => {
    setLoading(true)
    setError(null)

    try {
      if (!params.localityId && !params.localityName) {
        throw new Error('Location is required')
      }

      let localityIdToUse = params.localityId
      let localityLat: number | null = null
      let localityLng: number | null = null
      let nearbyLocalityIds: string[] = []

      if (!localityIdToUse && params.localityName) {
        const { data: localities } = await supabase
          .from('localities')
          .select('id, latitude, longitude')
          .eq('city', 'Visakhapatnam')
          .ilike('name', params.localityName)
          .maybeSingle()

        if (localities) {
          localityIdToUse = localities.id
          localityLat = localities.latitude
          localityLng = localities.longitude
        }
      } else if (localityIdToUse) {
        const { data: localities } = await supabase
          .from('localities')
          .select('latitude, longitude')
          .eq('id', localityIdToUse)
          .maybeSingle()

        if (localities) {
          localityLat = localities.latitude
          localityLng = localities.longitude
        }
      }

      if (localityLat && localityLng && params.includeNearby !== false) {
        const { data: nearbyLocalities, error: nearbyError } = await supabase.rpc('get_nearby_localities', {
          center_lat: localityLat,
          center_lng: localityLng,
          radius_km: 5,
          p_city: 'Visakhapatnam'
        })

        if (nearbyError) {
          console.error('Error fetching nearby localities:', nearbyError)
        } else if (nearbyLocalities && nearbyLocalities.length > 0) {
          nearbyLocalityIds = nearbyLocalities.map((loc: any) => loc.locality_id)
        }
      }

      let query = supabase
        .from('properties')
        .select('*, localities!inner(name, slug, city)', { count: 'exact' })
        .eq('status', 'approved')

      if (params.propertyType) {
        const dbPropertyType = PROPERTY_TYPE_MAP[params.propertyType] || params.propertyType
        query = query.eq('property_type', dbPropertyType)
      }

      if (params.listingType) {
        query = query.eq('listing_type', params.listingType)
      }

      if (nearbyLocalityIds.length > 0) {
        query = query.in('locality_id', nearbyLocalityIds)
      } else if (localityIdToUse) {
        query = query.eq('locality_id', localityIdToUse)
      }

      if (params.minPrice) {
        query = query.gte('price', params.minPrice)
      }

      if (params.maxPrice) {
        query = query.lte('price', params.maxPrice)
      }

      if (params.bedrooms) {
        query = query.eq('bedrooms', params.bedrooms)
      }

      if (params.propertyStatus) {
        query = query.eq('property_status', params.propertyStatus)
      }

      if (params.keyword) {
        query = query.or(`title.ilike.%${params.keyword}%,description.ilike.%${params.keyword}%`)
      }

      if (params.radiusEnabled && params.centerLat && params.centerLng && params.radiusKm && !localityIdToUse) {
        query = query.not('latitude', 'is', null)
          .not('longitude', 'is', null)
          .gte('latitude', params.centerLat - (params.radiusKm / 111))
          .lte('latitude', params.centerLat + (params.radiusKm / 111))
          .gte('longitude', params.centerLng - (params.radiusKm / 111))
          .lte('longitude', params.centerLng + (params.radiusKm / 111))
      }

      query = query.order('created_at', { ascending: false }).limit(50)

      const { data, error: queryError, count } = await query

      if (queryError) throw queryError

      setProperties(data || [])
      setTotalCount(count || 0)
    } catch (err) {
      console.error('Search error:', err)
      setError(err instanceof Error ? err.message : 'An error occurred')
      setProperties([])
      setTotalCount(0)
    } finally {
      setLoading(false)
    }
  }

  return {
    properties,
    loading,
    error,
    search,
    totalCount
  }
}
