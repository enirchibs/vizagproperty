import { useState, useEffect, useRef } from 'react'
import { useNavigate } from 'react-router-dom'
import { MapPin, X } from 'lucide-react'
import { supabase } from '../lib/supabase'

interface LocalityResult {
  locality_name: string
  locality_slug: string
}

interface SearchProps {
  propertyType?: 'flat' | 'villa' | 'plot' | 'rent' | 'pg'
  placeholder?: string
  className?: string
}

const localityCache = new Map<string, LocalityResult[]>()
let popularLocalities: LocalityResult[] = []

export default function StrictLocalitySearch({ propertyType, placeholder, className }: SearchProps) {
  const navigate = useNavigate()
  const [query, setQuery] = useState('')
  const [suggestions, setSuggestions] = useState<LocalityResult[]>([])
  const [showSuggestions, setShowSuggestions] = useState(false)
  const [loading, setLoading] = useState(false)
  const wrapperRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    const loadPopularLocalities = async () => {
      if (popularLocalities.length > 0) return

      try {
        const { data } = await supabase
          .from('vizag_localities')
          .select('locality_name, locality_slug')
          .eq('is_active', true)
          .order('locality_name')
          .limit(10)

        if (data) {
          popularLocalities = data
        }
      } catch (error) {
        console.error('Error loading popular localities:', error)
      }
    }

    loadPopularLocalities()
  }, [])

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (wrapperRef.current && !wrapperRef.current.contains(event.target as Node)) {
        setShowSuggestions(false)
      }
    }

    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  useEffect(() => {
    if (query.trim().length < 1) {
      setSuggestions([])
      return
    }

    const fetchSuggestions = async () => {
      const searchTerm = query.toLowerCase().trim()
      const cacheKey = `locality_${searchTerm}`

      if (localityCache.has(cacheKey)) {
        setSuggestions(localityCache.get(cacheKey)!)
        setShowSuggestions(true)
        return
      }

      setLoading(true)
      try {
        const { data } = await supabase
          .from('vizag_localities')
          .select('locality_name, locality_slug')
          .ilike('locality_name', `${searchTerm}%`)
          .eq('is_active', true)
          .order('locality_name')
          .limit(10)

        const localities = data || []
        localityCache.set(cacheKey, localities)
        setSuggestions(localities)
        setShowSuggestions(true)
      } catch (error) {
        console.error('Error fetching localities:', error)
      } finally {
        setLoading(false)
      }
    }

    const debounce = setTimeout(fetchSuggestions, 200)
    return () => clearTimeout(debounce)
  }, [query])

  const handleFocus = () => {
    if (query.length >= 1 && suggestions.length > 0) {
      setShowSuggestions(true)
    } else if (popularLocalities.length > 0) {
      setSuggestions(popularLocalities)
      setShowSuggestions(true)
    }
  }

  const handleSelect = (slug: string) => {
    navigate(`/vizag-property-in-${slug}?type=${propertyType ?? 'all'}`)
  }

  const handleClear = () => {
    setQuery('')
    setSuggestions([])
  }

  return (
    <div ref={wrapperRef} className="relative w-full">
      <div className="relative">
        <MapPin className="absolute left-3 top-1/2 -translate-y-1/2 h-5 w-5 text-gray-400" />
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          onFocus={handleFocus}
          placeholder={placeholder || 'Search Vizag locality'}
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

      {showSuggestions && suggestions.length > 0 && (
        <div className="absolute z-50 w-full mt-2 bg-white border border-gray-200 rounded-lg shadow-lg max-h-80 overflow-y-auto">
          {loading && (
            <div className="p-4 text-center text-gray-500">
              <div className="animate-spin h-5 w-5 border-2 border-primary-600 border-t-transparent rounded-full mx-auto"></div>
            </div>
          )}
          {!loading && query.length === 0 && (
            <div className="px-4 py-2 bg-gradient-to-r from-primary-50 to-primary-100 border-b border-primary-200">
              <div className="text-sm font-semibold text-primary-800">Popular Localities</div>
            </div>
          )}
          {!loading && suggestions.map((locality) => (
            <button
              key={locality.locality_slug}
              type="button"
              onClick={() => handleSelect(locality.locality_slug)}
              className="w-full px-4 py-3 text-left hover:bg-gray-50 border-b border-gray-100 last:border-0 transition-colors"
            >
              <div className="flex items-start">
                <MapPin className="h-5 w-5 text-primary-600 mr-3 mt-0.5 flex-shrink-0" />
                <div className="flex-1 min-w-0">
                  <div className="font-medium text-gray-900">{locality.locality_name}</div>
                  <div className="text-xs text-primary-600 mt-1">Vizag Locality</div>
                </div>
              </div>
            </button>
          ))}
        </div>
      )}

      {showSuggestions && !loading && query.length >= 1 && suggestions.length === 0 && (
        <div className="absolute z-50 w-full mt-2 bg-white border border-gray-200 rounded-lg shadow-lg p-4 text-center text-gray-500">
          No localities found
        </div>
      )}
    </div>
  )
}
