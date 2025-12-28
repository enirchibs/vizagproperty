import { useState, useEffect, useRef } from 'react'
import { MapPin, X } from 'lucide-react'
import { supabase } from '../lib/supabase'

interface LocationResult {
  id: string
  name: string
  type: 'state' | 'city' | 'locality'
  parentName?: string
}

interface LocationAutocompleteProps {
  value: string
  onChange: (value: string) => void
  placeholder?: string
  className?: string
}

const locationCache = new Map<string, LocationResult[]>()
let trendingLocations: LocationResult[] = []

export function LocationAutocomplete({ value, onChange, placeholder, className }: LocationAutocompleteProps) {
  const [query, setQuery] = useState(value)
  const [results, setResults] = useState<LocationResult[]>([])
  const [showResults, setShowResults] = useState(false)
  const [loading, setLoading] = useState(false)
  const wrapperRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    setQuery(value)
  }, [value])

  useEffect(() => {
    const loadTrendingLocations = async () => {
      if (trendingLocations.length > 0) return

      try {
        const { data: cities } = await supabase
          .from('indian_cities')
          .select('id, name, state:indian_states(name)')
          .eq('is_major', true)
          .order('name')
          .limit(12)

        if (cities) {
          trendingLocations = cities.map((city: any) => ({
            id: city.id,
            name: city.name,
            type: 'city' as const,
            parentName: city.state?.name || city.state?.[0]?.name
          }))
        }
      } catch (error) {
        console.error('Error loading trending locations:', error)
      }
    }

    loadTrendingLocations()
  }, [])

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (wrapperRef.current && !wrapperRef.current.contains(event.target as Node)) {
        setShowResults(false)
      }
    }

    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  useEffect(() => {
    if (query.trim().length < 1) {
      setResults([])
      return
    }

    const searchLocations = async () => {
      const searchTerm = query.toLowerCase().trim()
      const cacheKey = `loc_${searchTerm}`

      if (locationCache.has(cacheKey)) {
        setResults(locationCache.get(cacheKey)!)
        setShowResults(true)
        return
      }

      setLoading(true)
      try {
        const results: LocationResult[] = []

        const { data: states } = await supabase
          .from('indian_states')
          .select('id, name')
          .ilike('name', `${searchTerm}%`)
          .order('name')
          .limit(5)

        if (states) {
          states.forEach(state => {
            results.push({
              id: state.id,
              name: state.name,
              type: 'state'
            })
          })
        }

        const { data: cities } = await supabase
          .from('indian_cities')
          .select('id, name, is_major, state:indian_states(name)')
          .ilike('name', `%${searchTerm}%`)
          .order('is_major', { ascending: false })
          .order('name')
          .limit(20)

        if (cities) {
          cities.forEach((city: any) => {
            const stateName = city.state?.name || city.state?.[0]?.name
            results.push({
              id: city.id,
              name: city.name,
              type: 'city',
              parentName: stateName
            })
          })
        }

        const { data: localities } = await supabase
          .from('indian_localities')
          .select('id, name, city:indian_cities(name, state:indian_states(name))')
          .ilike('name', `%${searchTerm}%`)
          .order('name')
          .limit(3)

        if (localities) {
          localities.forEach((locality: any) => {
            const cityName = locality.city?.name || locality.city?.[0]?.name
            const stateName = locality.city?.state?.name || locality.city?.state?.[0]?.name || locality.city?.[0]?.state?.name || locality.city?.[0]?.state?.[0]?.name
            results.push({
              id: locality.id,
              name: locality.name,
              type: 'locality',
              parentName: `${cityName}, ${stateName}`
            })
          })
        }

        const finalResults = results.slice(0, 15)
        locationCache.set(cacheKey, finalResults)
        setResults(finalResults)
        setShowResults(true)
      } catch (error) {
        console.error('Error searching locations:', error)
      } finally {
        setLoading(false)
      }
    }

    const debounce = setTimeout(searchLocations, 200)
    return () => clearTimeout(debounce)
  }, [query])

  const handleFocus = () => {
    if (query.length >= 1 && results.length > 0) {
      setShowResults(true)
    } else if (trendingLocations.length > 0) {
      setResults(trendingLocations)
      setShowResults(true)
    }
  }

  const handleSelect = (result: LocationResult) => {
    const displayValue = result.parentName
      ? `${result.name}, ${result.parentName}`
      : result.name
    setQuery(displayValue)
    onChange(displayValue)
    setShowResults(false)
  }

  const handleClear = () => {
    setQuery('')
    onChange('')
    setResults([])
  }

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const newValue = e.target.value
    setQuery(newValue)
    onChange(newValue)
  }

  const getTypeLabel = (type: string) => {
    switch (type) {
      case 'state':
        return 'State'
      case 'city':
        return 'City'
      case 'locality':
        return 'Locality'
      default:
        return ''
    }
  }

  return (
    <div ref={wrapperRef} className="relative w-full">
      <div className="relative">
        <MapPin className="absolute left-3 top-1/2 -translate-y-1/2 h-5 w-5 text-gray-400" />
        <input
          type="text"
          value={query}
          onChange={handleInputChange}
          onFocus={handleFocus}
          placeholder={placeholder || 'Enter city, locality or state'}
          className={`w-full pl-10 pr-10 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent ${className || ''}`}
        />
        {query && (
          <button
            type="button"
            onClick={handleClear}
            className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
          >
            <X className="h-5 w-5" />
          </button>
        )}
      </div>

      {showResults && results.length > 0 && (
        <div className="absolute z-50 w-full mt-2 bg-white border border-gray-200 rounded-lg shadow-lg max-h-80 overflow-y-auto">
          {loading && (
            <div className="p-4 text-center text-gray-500">
              <div className="animate-spin h-5 w-5 border-2 border-primary-600 border-t-transparent rounded-full mx-auto"></div>
            </div>
          )}
          {!loading && query.length === 0 && (
            <div className="px-4 py-2 bg-gradient-to-r from-primary-50 to-primary-100 border-b border-primary-200">
              <div className="text-sm font-semibold text-primary-800">Trending Locations</div>
            </div>
          )}
          {!loading && results.map((result) => (
            <button
              key={`${result.type}-${result.id}`}
              type="button"
              onClick={() => handleSelect(result)}
              className="w-full px-4 py-3 text-left hover:bg-gray-50 border-b border-gray-100 last:border-0 transition-colors"
            >
              <div className="flex items-start">
                <MapPin className="h-5 w-5 text-primary-600 mr-3 mt-0.5 flex-shrink-0" />
                <div className="flex-1 min-w-0">
                  <div className="font-medium text-gray-900">{result.name}</div>
                  {result.parentName && (
                    <div className="text-sm text-gray-500">{result.parentName}</div>
                  )}
                  <div className="text-xs text-primary-600 mt-1">{getTypeLabel(result.type)}</div>
                </div>
              </div>
            </button>
          ))}
        </div>
      )}

      {showResults && !loading && query.length >= 1 && results.length === 0 && (
        <div className="absolute z-50 w-full mt-2 bg-white border border-gray-200 rounded-lg shadow-lg p-4 text-center text-gray-500">
          No locations found
        </div>
      )}
    </div>
  )
}
