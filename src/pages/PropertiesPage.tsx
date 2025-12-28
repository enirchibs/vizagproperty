import { useState, useEffect } from 'react'
import { Search, Mic, MicOff, Filter, X } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { Property, SearchFilters } from '../types'
import { PropertyCard } from '../components/PropertyCard'
import { useVoiceSearch } from '../hooks/useVoiceSearch'

export function PropertiesPage() {
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [searchQuery, setSearchQuery] = useState('')
  const [showFilters, setShowFilters] = useState(false)
  const [filters, setFilters] = useState<SearchFilters>({})
  const { isListening, transcript, startListening, stopListening, resetTranscript, isSupported } = useVoiceSearch()

  useEffect(() => {
    const params = new URLSearchParams(window.location.search)
    const query = params.get('q')
    if (query) {
      setSearchQuery(query)
    }
    loadProperties()
  }, [])

  useEffect(() => {
    if (transcript) {
      setSearchQuery(transcript)
    }
  }, [transcript])

  const loadProperties = async () => {
    setLoading(true)
    try {
      let query = supabase
        .from('properties')
        .select('*')
        .eq('status', 'available')

      if (filters.property_type) {
        query = query.eq('property_type', filters.property_type)
      }
      if (filters.listing_type) {
        query = query.eq('listing_type', filters.listing_type)
      }
      if (filters.city) {
        query = query.ilike('city', `%${filters.city}%`)
      }
      if (filters.min_price) {
        query = query.gte('price', filters.min_price)
      }
      if (filters.max_price) {
        query = query.lte('price', filters.max_price)
      }
      if (filters.bedrooms) {
        query = query.eq('bedrooms', filters.bedrooms)
      }

      query = query.order('created_at', { ascending: false })

      const { data, error } = await query

      if (error) throw error
      setProperties(data || [])
    } catch (error) {
      console.error('Error loading properties:', error)
    } finally {
      setLoading(false)
    }
  }

  const handleSearch = () => {
    loadProperties()
  }

  const handleVoiceToggle = () => {
    if (isListening) {
      stopListening()
    } else {
      resetTranscript()
      startListening()
    }
  }

  const clearFilters = () => {
    setFilters({})
    setSearchQuery('')
    loadProperties()
  }

  const applyFilters = () => {
    setShowFilters(false)
    loadProperties()
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="bg-white border-b border-gray-200 sticky top-16 z-30">
        <div className="max-w-7xl mx-auto px-4 py-3 md:py-4">
          <div className="flex items-center space-x-2">
            <div className="flex-1 flex items-center space-x-2 bg-gray-50 rounded-lg px-3 md:px-4 py-2.5 md:py-2 border border-gray-200 min-h-[44px]">
              <Search className="h-5 w-5 text-gray-400 flex-shrink-0" />
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                placeholder="Search properties..."
                className="flex-1 bg-transparent focus:outline-none text-base"
              />
              {isSupported && (
                <button
                  onClick={handleVoiceToggle}
                  className={`p-2 rounded-lg transition-all min-h-[36px] min-w-[36px] flex items-center justify-center ${
                    isListening
                      ? 'bg-red-600 text-white animate-pulse'
                      : 'text-gray-600 hover:bg-gray-200'
                  }`}
                  aria-label={isListening ? "Stop voice search" : "Start voice search"}
                >
                  {isListening ? <MicOff className="h-5 w-5" /> : <Mic className="h-5 w-5" />}
                </button>
              )}
            </div>
            <button
              onClick={() => setShowFilters(!showFilters)}
              className="flex items-center justify-center space-x-1.5 px-3 md:px-4 py-2.5 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors min-h-[44px]"
              aria-label="Toggle filters"
            >
              <Filter className="h-5 w-5" />
              <span className="hidden sm:inline">Filters</span>
            </button>
            <button
              onClick={handleSearch}
              className="px-4 md:px-6 py-2.5 bg-gray-900 text-white rounded-lg hover:bg-gray-800 transition-colors min-h-[44px] hidden md:block"
            >
              Search
            </button>
          </div>

          {showFilters && (
            <div className="mt-3 md:mt-4 p-3 md:p-4 bg-gray-50 rounded-lg border border-gray-200 animate-slide-up">
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-3 md:gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Property Type
                  </label>
                  <select
                    value={filters.property_type || ''}
                    onChange={(e) => setFilters({ ...filters, property_type: e.target.value || undefined })}
                    className="w-full px-3 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent text-base min-h-[44px]"
                  >
                    <option value="">All Types</option>
                    <option value="apartment">Apartment</option>
                    <option value="villa">Villa</option>
                    <option value="plot">Plot</option>
                    <option value="commercial">Commercial</option>
                    <option value="penthouse">Penthouse</option>
                  </select>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Listing Type
                  </label>
                  <select
                    value={filters.listing_type || ''}
                    onChange={(e) => setFilters({ ...filters, listing_type: e.target.value || undefined })}
                    className="w-full px-3 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent text-base min-h-[44px]"
                  >
                    <option value="">Sale & Rent</option>
                    <option value="sale">Sale</option>
                    <option value="rent">Rent</option>
                  </select>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Bedrooms
                  </label>
                  <select
                    value={filters.bedrooms || ''}
                    onChange={(e) => setFilters({ ...filters, bedrooms: e.target.value ? parseInt(e.target.value) : undefined })}
                    className="w-full px-3 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent text-base min-h-[44px]"
                  >
                    <option value="">Any</option>
                    <option value="1">1 BHK</option>
                    <option value="2">2 BHK</option>
                    <option value="3">3 BHK</option>
                    <option value="4">4+ BHK</option>
                  </select>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    City
                  </label>
                  <input
                    type="text"
                    value={filters.city || ''}
                    onChange={(e) => setFilters({ ...filters, city: e.target.value || undefined })}
                    placeholder="Enter city"
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Min Price (₹)
                  </label>
                  <input
                    type="number"
                    value={filters.min_price || ''}
                    onChange={(e) => setFilters({ ...filters, min_price: e.target.value ? parseInt(e.target.value) : undefined })}
                    placeholder="Min price"
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Max Price (₹)
                  </label>
                  <input
                    type="number"
                    value={filters.max_price || ''}
                    onChange={(e) => setFilters({ ...filters, max_price: e.target.value ? parseInt(e.target.value) : undefined })}
                    placeholder="Max price"
                    className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  />
                </div>
              </div>

              <div className="flex items-center justify-end space-x-3 mt-4">
                <button
                  onClick={clearFilters}
                  className="px-4 py-2 text-gray-600 hover:text-gray-900 transition-colors flex items-center space-x-1"
                >
                  <X className="h-4 w-4" />
                  <span>Clear</span>
                </button>
                <button
                  onClick={applyFilters}
                  className="px-6 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-colors"
                >
                  Apply Filters
                </button>
              </div>
            </div>
          )}
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 py-8">
        <div className="flex items-center justify-between mb-6">
          <h1 className="text-2xl font-bold text-gray-900">
            {properties.length} Properties Found
          </h1>
        </div>

        {loading ? (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {[1, 2, 3, 4, 5, 6].map((i) => (
              <div key={i} className="bg-gray-200 h-96 rounded-2xl animate-pulse" />
            ))}
          </div>
        ) : properties.length === 0 ? (
          <div className="text-center py-16">
            <Search className="h-16 w-16 text-gray-300 mx-auto mb-4" />
            <h2 className="text-2xl font-semibold text-gray-900 mb-2">No properties found</h2>
            <p className="text-gray-600">Try adjusting your filters or search query</p>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {properties.map((property) => (
              <PropertyCard key={property.id} property={property} onFavoriteChange={loadProperties} />
            ))}
          </div>
        )}
      </div>
    </div>
  )
}
