import { useState, useEffect, useRef } from 'react'
import { MapPin, X, AlertCircle } from 'lucide-react'
import { supabase } from '../lib/supabase'

interface LocalityResult {
  id: string
  name: string
  slug: string
  match_type?: string
  similarity_score?: number
}

interface LocationAutocompleteProps {
  value: string
  onChange: (value: string, localityId?: string) => void
  placeholder?: string
  className?: string
}

const localityCache = new Map<string, LocalityResult[]>()
let popularLocalities: LocalityResult[] = []

export function LocationAutocomplete({ value, onChange, placeholder, className }: LocationAutocompleteProps) {
  const [query, setQuery] = useState(value)
  const [results, setResults] = useState<LocalityResult[]>([])
  const [showResults, setShowResults] = useState(false)
  const [loading, setLoading] = useState(false)
  const wrapperRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    setQuery(value)
  }, [value])

  useEffect(() => {
    const loadPopularLocalities = async () => {
      if (popularLocalities.length > 0) return

      try {
        const { data } = await supabase
          .from('localities')
          .select('id, name, slug')
          .eq('city', 'Visakhapatnam')
          .order('name')
          .limit(10)

        if (data) {
          popularLocalities = data
        }
      } catch (error) {
      }
    }

    loadPopularLocalities()
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
    if (query.trim().length < 3) {
      setResults([])
      setShowResults(false)
      return
    }

    const searchLocalities = async () => {
      const searchTerm = query.toLowerCase().trim()
      const cacheKey = `locality_${searchTerm}`

      if (localityCache.has(cacheKey)) {
        setResults(localityCache.get(cacheKey)!)
        setShowResults(true)
        return
      }

      setLoading(true)
      try {
        const { data } = await supabase.rpc('search_localities_with_suggestions', {
          p_query: searchTerm,
          p_city: 'Visakhapatnam',
          p_limit: 6
        })

        const localities = data || []
        localityCache.set(cacheKey, localities)
        setResults(localities)
        setShowResults(true)
      } catch (error) {
      } finally {
        setLoading(false)
      }
    }

    const debounce = setTimeout(searchLocalities, 200)
    return () => clearTimeout(debounce)
  }, [query])

  const handleFocus = () => {
    if (query.length >= 3 && results.length > 0) {
      setShowResults(true)
    } else if (query.length < 3 && popularLocalities.length > 0) {
      setResults(popularLocalities)
      setShowResults(true)
    }
  }

  const handleSelect = (result: LocalityResult) => {
    setQuery(result.name)
    onChange(result.name, result.id)
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
    if (newValue.length < 3) {
      onChange(newValue)
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
          placeholder={placeholder || 'Type 3+ characters to search localities'}
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
          {!loading && query.length < 3 && (
            <div className="px-4 py-2 bg-gradient-to-r from-primary-50 to-primary-100 border-b border-primary-200">
              <div className="text-sm font-semibold text-primary-800">Popular Localities</div>
            </div>
          )}
          {!loading && query.length >= 3 && results.length > 0 && results[0]?.match_type === 'fuzzy' && (
            <div className="px-4 py-2.5 bg-amber-50 border-b border-amber-200">
              <div className="flex items-center gap-2 text-amber-800">
                <AlertCircle className="h-4 w-4 flex-shrink-0" />
                <span className="text-sm font-medium">Did you mean one of these?</span>
              </div>
            </div>
          )}
          {!loading && results.map((result) => (
            <button
              key={result.slug}
              type="button"
              onClick={() => handleSelect(result)}
              className={`w-full px-4 py-3 text-left hover:bg-gray-50 border-b border-gray-100 last:border-0 transition-colors ${
                result.match_type === 'fuzzy' ? 'bg-amber-50/30' : ''
              }`}
            >
              <div className="flex items-start">
                <MapPin className={`h-5 w-5 mr-3 mt-0.5 flex-shrink-0 ${
                  result.match_type === 'fuzzy' ? 'text-amber-600' : 'text-primary-600'
                }`} />
                <div className="flex-1 min-w-0">
                  <div className="font-medium text-gray-900">{result.name}</div>
                  <div className="flex items-center gap-2 mt-1">
                    <span className="text-xs text-primary-600">Visakhapatnam</span>
                    {result.match_type === 'fuzzy' && result.similarity_score && (
                      <span className="text-xs text-amber-600">
                        {Math.round(result.similarity_score * 100)}% match
                      </span>
                    )}
                  </div>
                </div>
              </div>
            </button>
          ))}
        </div>
      )}

      {showResults && !loading && query.length >= 3 && results.length === 0 && (
        <div className="absolute z-50 w-full mt-2 bg-white border border-gray-200 rounded-lg shadow-lg p-4 text-center text-gray-500">
          No matching localities found
        </div>
      )}
    </div>
  )
}
