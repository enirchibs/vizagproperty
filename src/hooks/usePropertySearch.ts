import { useState } from 'react'
import { Property } from '../types'
import { buildUnifiedPropertyQuery, UnifiedSearchParams } from '../lib/searchFilters'

export type { UnifiedSearchParams as PropertySearchParams }

interface UsePropertySearchReturn {
  properties: Property[]
  loading: boolean
  error: string | null
  search: (params: UnifiedSearchParams) => Promise<void>
  totalCount: number
}

export function usePropertySearch(): UsePropertySearchReturn {
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [totalCount, setTotalCount] = useState(0)

  const search = async (params: UnifiedSearchParams) => {
    setLoading(true)
    setError(null)

    try {
      const query = buildUnifiedPropertyQuery(params)
      const { data, error: queryError, count } = await query.limit(50)

      if (queryError) throw queryError

      setProperties(data || [])
      setTotalCount(count || 0)
    } catch (err) {
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
