import { useState, useEffect, useCallback } from 'react'
import { supabase } from '../lib/supabase'

export interface AnalyticsKPIs {
  totalProperties: number
  pendingApprovals: number
  approvedListings: number
  rejectedListings: number
  trustedOwnersCount: number
  newListings7Days: number
  newListings30Days: number
}

export interface PropertyTypeDistribution {
  property_type: string
  total: number
}

export interface LocalityDistribution {
  locality: string
  total: number
}

export function useAdminAnalytics() {
  const [kpis, setKpis] = useState<AnalyticsKPIs>({
    totalProperties: 0,
    pendingApprovals: 0,
    approvedListings: 0,
    rejectedListings: 0,
    trustedOwnersCount: 0,
    newListings7Days: 0,
    newListings30Days: 0,
  })
  const [propertyTypeDistribution, setPropertyTypeDistribution] = useState<PropertyTypeDistribution[]>([])
  const [localityDistribution, setLocalityDistribution] = useState<LocalityDistribution[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  const loadAnalytics = useCallback(async () => {
    setLoading(true)
    setError(null)

    try {
      const [
        totalPropertiesResult,
        pendingResult,
        approvedResult,
        rejectedResult,
        trustedOwnersResult,
        listings7DaysResult,
        listings30DaysResult,
        propertyTypesResult,
        localitiesResult,
      ] = await Promise.all([
        supabase.from('properties').select('id', { count: 'exact', head: true }),
        supabase.from('properties').select('id', { count: 'exact', head: true }).eq('status', 'pending'),
        supabase.from('properties').select('id', { count: 'exact', head: true }).eq('status', 'approved'),
        supabase.from('properties').select('id', { count: 'exact', head: true }).eq('status', 'rejected'),
        supabase.from('users').select('id', { count: 'exact', head: true }).eq('trusted', true),
        supabase.rpc('count_properties_last_7_days'),
        supabase.rpc('count_properties_last_30_days'),
        supabase.rpc('get_property_type_distribution'),
        supabase.rpc('get_locality_distribution'),
      ])

      setKpis({
        totalProperties: totalPropertiesResult.count || 0,
        pendingApprovals: pendingResult.count || 0,
        approvedListings: approvedResult.count || 0,
        rejectedListings: rejectedResult.count || 0,
        trustedOwnersCount: trustedOwnersResult.count || 0,
        newListings7Days: (listings7DaysResult.data as any) || 0,
        newListings30Days: (listings30DaysResult.data as any) || 0,
      })

      if (propertyTypesResult.data) {
        setPropertyTypeDistribution(propertyTypesResult.data as PropertyTypeDistribution[])
      }

      if (localitiesResult.data) {
        setLocalityDistribution((localitiesResult.data as LocalityDistribution[]).slice(0, 10))
      }
    } catch (err) {
      console.error('Error loading analytics:', err)
      setError('Failed to load analytics data')
    } finally {
      setLoading(false)
    }
  }, [])

  useEffect(() => {
    loadAnalytics()
  }, [loadAnalytics])

  return {
    kpis,
    propertyTypeDistribution,
    localityDistribution,
    loading,
    error,
    refresh: loadAnalytics,
  }
}
