import { useState, useEffect, useRef } from 'react'
import { MapPin, X, AlertCircle, Building2 } from 'lucide-react'

import { fuzzySearchLocalities } from '../lib/fuzzySearch'

interface LocalityResult {
  id: string
  name: string
  slug: string
  match_type?: string
  similarity_score?: number
  rank_score?: number
  entity_type?: string
}

interface LocationAutocompleteProps {
  value: string
  onChange: (value: string, localityId?: string) => void
  placeholder?: string
  className?: string
}

const localityCache = new Map<string, LocalityResult[]>()

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
        const data = await fuzzySearchLocalities(searchTerm, 10)

        const localities = data.map((item) => ({
          id: item.id,
          name: item.name,
          slug: item.slug,
          match_type: 'exact',
          entity_type: 'locality'
        }))

        localityCache.set(cacheKey, localities)
        setResults(localities)
        setShowResults(true)
      } catch (error) {
        console.error('Error fetching autocomplete locations:', error)
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

      {showResults && (
        <div className="absolute z-50 w-full mt-2 bg-white border border-gray-200 rounded-xl shadow-xl max-h-[450px] overflow-y-auto divide-y divide-gray-100">
          {loading && (
            <div className="p-4 text-center text-gray-500">
              <div className="animate-spin h-5 w-5 border-2 border-primary-600 border-t-transparent rounded-full mx-auto"></div>
            </div>
          )}

          {!loading && query.length >= 2 && (
            <div>
              {/* Category Quick Options if user is searching for rent/flat/plot/villa/pg */}
              {(results.length === 0 || ['rent', 'lease', 'flat', 'plot', 'villa', 'pg', 'hostel', 'buy', 'house'].some(w => query.toLowerCase().includes(w))) && (
                <div className="bg-sky-50/70 p-2 border-b border-sky-100">
                  <div className="px-3 py-1 text-[11px] font-bold text-sky-800 uppercase tracking-wider flex items-center gap-1.5">
                    <Building2 className="h-3.5 w-3.5 text-sky-600" /> Category Search Matches
                  </div>
                  <div className="grid grid-cols-1 gap-1 mt-1">
                    {[
                      { id: 'cat-rent', name: 'Flats & Apartments for Rent', sub: 'Rentals in Visakhapatnam', icon: '🔑', val: 'rent' },
                      { id: 'cat-pg', name: 'PG & Hostels for Rent', sub: 'Paying Guest & Student Hostels', icon: '🏡', val: 'pg' },
                      { id: 'cat-flats', name: 'Flats & Apartments for Sale', sub: '2 & 3 BHK Apartments', icon: '🏢', val: 'flat' },
                      { id: 'cat-plots', name: 'Open Layout Plots for Sale', sub: 'VMRDA & Approved Plots', icon: '🏞️', val: 'plot' },
                      { id: 'cat-villas', name: 'Villas & Independent Houses', sub: 'Luxury Gated Communities', icon: '🏰', val: 'villa' }
                    ]
                      .filter(item => {
                        const lower = query.toLowerCase().trim()
                        if (results.length === 0) return true
                        return item.name.toLowerCase().includes(lower) || item.val.includes(lower) || lower.includes(item.val)
                      })
                      .slice(0, 4)
                      .map(item => (
                        <button
                          key={item.id}
                          type="button"
                          onClick={() => {
                            setQuery(item.name)
                            onChange(item.name)
                            setShowResults(false)
                          }}
                          className="w-full text-left px-3 py-2 rounded-lg hover:bg-white transition-colors flex items-center gap-2.5"
                        >
                          <span className="text-base">{item.icon}</span>
                          <div className="min-w-0 flex-1">
                            <div className="text-xs font-bold text-gray-900 truncate">{item.name}</div>
                            <div className="text-[10px] text-gray-500 truncate">{item.sub}</div>
                          </div>
                        </button>
                      ))}
                  </div>
                </div>
              )}

              {/* Fuzzy Match Warning */}
              {results.length > 0 && results[0]?.match_type === 'fuzzy' && (
                <div className="px-4 py-2 bg-amber-50 border-b border-amber-200">
                  <div className="flex items-center gap-2 text-amber-800 text-xs font-medium">
                    <AlertCircle className="h-3.5 w-3.5 flex-shrink-0" />
                    <span>Did you mean one of these localities?</span>
                  </div>
                </div>
              )}

              {/* Locality Results */}
              {results.map((result) => (
                <button
                  key={result.slug}
                  type="button"
                  onClick={() => handleSelect(result)}
                  className={`w-full px-4 py-2.5 text-left hover:bg-gray-50 transition-colors border-b border-gray-100 last:border-0 ${
                    result.match_type === 'fuzzy' ? 'bg-amber-50/20' : ''
                  }`}
                >
                  <div className="flex items-start">
                    <MapPin className={`h-4 w-4 mr-2.5 mt-0.5 flex-shrink-0 ${
                      result.match_type === 'fuzzy' ? 'text-amber-600' : 'text-primary-600'
                    }`} />
                    <div className="flex-1 min-w-0">
                      <div className="text-sm font-semibold text-gray-900">{result.name}</div>
                      <div className="text-xs text-gray-500">Visakhapatnam</div>
                    </div>
                  </div>
                </button>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  )
}
