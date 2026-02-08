import { useState, useEffect } from 'react'
import { supabase } from '../lib/supabase'
import { getLastSearch } from '../lib/searchMemory'
import { Property } from '../types'

interface LocationSource {
  type: 'last_search' | 'geolocation' | 'default'
  localityId: string
  localityName: string
}

export function useNearbyProperties() {
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [locationSource, setLocationSource] = useState<LocationSource | null>(null)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    detectLocationAndLoadProperties()
  }, [])

  const detectLocationAndLoadProperties = async () => {
    try {
      setLoading(true)
      setError(null)

      const lastSearch = getLastSearch()
      if (lastSearch) {
        setLocationSource({
          type: 'last_search',
          localityId: lastSearch.localityId,
          localityName: lastSearch.localityName
        })
        await loadPropertiesInLocality(lastSearch.localityId)
        return
      }

      const geoLocation = await tryGetGeolocation()
      if (geoLocation) {
        const nearestLocality = await findNearestLocality(geoLocation.lat, geoLocation.lng)
        if (nearestLocality) {
          setLocationSource({
            type: 'geolocation',
            localityId: nearestLocality.id,
            localityName: nearestLocality.name
          })
          await loadPropertiesInLocality(nearestLocality.id)
          return
        }
      }

      const vizagCenter = await getVizagCenterLocality()
      if (vizagCenter) {
        setLocationSource({
          type: 'default',
          localityId: vizagCenter.id,
          localityName: vizagCenter.name
        })
        await loadPropertiesInLocality(vizagCenter.id)
      }
    } catch (err) {
      console.error('Error detecting location:', err)
      setError('Failed to load nearby properties')
    } finally {
      setLoading(false)
    }
  }

  const tryGetGeolocation = (): Promise<{ lat: number; lng: number } | null> => {
    return new Promise((resolve) => {
      if (!navigator.geolocation) {
        resolve(null)
        return
      }

      navigator.geolocation.getCurrentPosition(
        (position) => {
          resolve({
            lat: position.coords.latitude,
            lng: position.coords.longitude
          })
        },
        () => {
          resolve(null)
        },
        { timeout: 5000, maximumAge: 300000 }
      )
    })
  }

  const findNearestLocality = async (lat: number, lng: number) => {
    try {
      const { data, error } = await supabase
        .from('localities')
        .select('id, name, latitude, longitude')
        .eq('city', 'Visakhapatnam')
        .not('latitude', 'is', null)
        .not('longitude', 'is', null)

      if (error) throw error
      if (!data || data.length === 0) return null

      let nearest = data[0]
      let minDistance = getDistance(lat, lng, data[0].latitude, data[0].longitude)

      for (const locality of data) {
        const distance = getDistance(lat, lng, locality.latitude, locality.longitude)
        if (distance < minDistance) {
          minDistance = distance
          nearest = locality
        }
      }

      return { id: nearest.id, name: nearest.name }
    } catch (error) {
      console.error('Error finding nearest locality:', error)
      return null
    }
  }

  const getDistance = (lat1: number, lng1: number, lat2: number, lng2: number): number => {
    const R = 6371
    const dLat = toRad(lat2 - lat1)
    const dLng = toRad(lng2 - lng1)
    const a =
      Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLng / 2) * Math.sin(dLng / 2)
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    return R * c
  }

  const toRad = (value: number): number => {
    return (value * Math.PI) / 180
  }

  const getVizagCenterLocality = async () => {
    try {
      const { data, error } = await supabase
        .from('localities')
        .select('id, name')
        .eq('city', 'Visakhapatnam')
        .ilike('name', '%MVP Colony%')
        .maybeSingle()

      if (error) throw error
      if (data) return { id: data.id, name: data.name }

      const { data: anyLocality } = await supabase
        .from('localities')
        .select('id, name')
        .eq('city', 'Visakhapatnam')
        .limit(1)
        .maybeSingle()

      return anyLocality ? { id: anyLocality.id, name: anyLocality.name } : null
    } catch (error) {
      console.error('Error getting center locality:', error)
      return null
    }
  }

  const loadPropertiesInLocality = async (localityId: string) => {
    try {
      const { data, error } = await supabase
        .from('properties')
        .select('*')
        .eq('status', 'approved')
        .eq('locality_id', localityId)
        .order('created_at', { ascending: false })
        .limit(12)

      if (error) throw error
      setProperties(data || [])
    } catch (error) {
      console.error('Error loading properties:', error)
      throw error
    }
  }

  return {
    properties,
    loading,
    locationSource,
    error,
    refresh: detectLocationAndLoadProperties
  }
}
