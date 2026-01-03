import { useState } from 'react'
import { supabase } from '../lib/supabase'
import { Property } from '../types'

export interface PropertySearchParams {
  propertyType?: 'flat' | 'plot' | 'villa' | 'pg' | 'commercial'
  listingType?: 'sale' | 'rent'
  localitySlug?: string
  keyword?: string
  minPrice?: number
  maxPrice?: number
  bedrooms?: number
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

const PROPERTY_TYPE_MAP = {
  flat: ['apartment', 'flat'],
  plot: ['plot'],
  villa: ['villa'],
  pg: ['pg_hostel'],
  commercial: ['commercial']
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
      let query = supabase
        .from('properties')
        .select('*', { count: 'exact' })
        .eq('status', 'available')
        .eq('city', 'Vizag')

      if (params.propertyType) {
        const types = PROPERTY_TYPE_MAP[params.propertyType] || [params.propertyType]
        if (types.length === 1) {
          query = query.eq('property_type', types[0])
        } else {
          query = query.in('property_type', types)
        }
      }

      if (params.listingType) {
        query = query.eq('listing_type', params.listingType)
      }

      if (params.localitySlug) {
        query = query.eq('locality_id', params.localitySlug)
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

      if (params.keyword) {
        query = query.or(`title.ilike.%${params.keyword}%,description.ilike.%${params.keyword}%`)
      }

      if (params.radiusEnabled && params.centerLat && params.centerLng && params.radiusKm) {
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
