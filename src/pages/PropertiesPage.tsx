import { useState, useEffect } from 'react'
import { Search, Mic, MicOff, Filter, X, MapPin, MessageCircle } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { Property, SearchFilters } from '../types'
import { PropertyCard } from '../components/PropertyCard'
import { LocationAutocomplete } from '../components/LocationAutocomplete'
import { useVoiceSearch } from '../hooks/useVoiceSearch'
import { useRadiusSearch } from '../hooks/useRadiusSearch'
import MapRadiusToggle from '../components/MapRadiusToggle'
import { openWhatsApp } from '../lib/whatsapp'

export function PropertiesPage() {
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [searchQuery, setSearchQuery] = useState('')
  const [localityName, setLocalityName] = useState('')
  const [showFilters, setShowFilters] = useState(false)
  const [filters, setFilters] = useState<SearchFilters>({})
  const [radiusEnabled, setRadiusEnabled] = useState(false)
  const [radiusKm, setRadiusKm] = useState<1 | 3 | 5>(3)
  const { isListening, transcript, localityMatch, noMatchMessage, startListening, stopListening, resetTranscript, isSupported } = useVoiceSearch()
  const { searchByRadius } = useRadiusSearch()

  useEffect(() => {
    const params = new URLSearchParams(window.location.search)
    const query = params.get('keyword') || params.get('q')
    const propertyType = params.get('propertyType')
    const listingType = params.get('listingType')
    const localityId = params.get('localityId')
    const localityName = params.get('locality')

    if (query) {
      setSearchQuery(query)
    }

    if (propertyType) {
      setFilters(prev => ({ ...prev, property_type: propertyType }))
    }

    if (listingType) {
      setFilters(prev => ({ ...prev, listing_type: listingType }))
    }

    if (localityId) {
      setFilters(prev => ({ ...prev, locality_id: localityId }))
    } else if (localityName) {
      setFilters(prev => ({ ...prev, locality_id: localityName }))
    }

    loadProperties()
  }, [])

  useEffect(() => {
    if (transcript) {
      setSearchQuery(transcript)
    }
  }, [transcript])

  useEffect(() => {
    if (localityMatch) {
      setFilters(prev => ({ ...prev, locality_id: localityMatch.locality_slug }))
    }
  }, [localityMatch])

  useEffect(() => {
    loadProperties()
  }, [radiusEnabled, radiusKm, filters])

  const loadProperties = async () => {
    setLoading(true)
    try {
      if (radiusEnabled && filters.center_latitude && filters.center_longitude) {
        const results = await searchByRadius({
          latitude: filters.center_latitude,
          longitude: filters.center_longitude,
          radiusKm: radiusKm,
          propertyType: filters.property_type,
          listingType: filters.listing_type
        })
        setProperties(results)
      } else {
        let query = supabase
          .from('properties')
          .select('*')
          .eq('status', 'approved')

        if (filters.city) {
          query = query.eq('city', filters.city)
        }
        if (filters.property_type) {
          query = query.eq('property_type', filters.property_type)
        }
        if (filters.listing_type) {
          query = query.eq('listing_type', filters.listing_type)
        }
        if (filters.locality_id) {
          query = query.eq('locality_id', filters.locality_id)
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

        if (searchQuery) {
          query = query.or(`title.ilike.%${searchQuery}%,description.ilike.%${searchQuery}%`)
        }

        query = query.order('created_at', { ascending: false }).limit(50)

        const { data, error } = await query

        if (error) throw error
        setProperties(data || [])
      }
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
    setLocalityName('')
    setRadiusEnabled(false)
    setRadiusKm(3)
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
              <div className="flex items-center gap-1">
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
                <button
                  onClick={() => {
                    openWhatsApp('Hi, I am looking for a property in Vizag listed on VizagProperty. Please share more details.')
                  }}
                  className="p-2 rounded-lg transition-all text-green-600 hover:bg-green-50 min-h-[36px] min-w-[36px] flex items-center justify-center"
                  aria-label="Contact on WhatsApp"
                >
                  <MessageCircle className="h-5 w-5" />
                </button>
              </div>
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

          {localityMatch && (
            <div className="mt-3 p-3 bg-green-50 border border-green-200 rounded-lg flex items-center justify-between">
              <div className="flex items-center space-x-2">
                <MapPin className="h-5 w-5 text-green-600" />
                <div>
                  <div className="text-sm font-medium text-green-900">
                    Locality Found: {localityMatch.locality_name}
                  </div>
                  <div className="text-xs text-green-600">
                    {localityMatch.confidence === 'exact' ? 'Exact match' : 'Similar match'}
                  </div>
                </div>
              </div>
              <button
                onClick={() => resetTranscript()}
                className="text-green-600 hover:text-green-800"
              >
                <X className="h-5 w-5" />
              </button>
            </div>
          )}

          {noMatchMessage && (
            <div className="mt-3 p-3 bg-yellow-50 border border-yellow-200 rounded-lg flex items-center justify-between">
              <div className="flex items-center space-x-2">
                <MapPin className="h-5 w-5 text-yellow-600" />
                <div className="text-sm font-medium text-yellow-900">{noMatchMessage}</div>
              </div>
              <button
                onClick={() => resetTranscript()}
                className="text-yellow-600 hover:text-yellow-800"
              >
                <X className="h-5 w-5" />
              </button>
            </div>
          )}

          {showFilters && (
            <div className="mt-3 md:mt-4 p-3 md:p-4 bg-gray-50 rounded-lg border border-gray-200 animate-slide-up">
              <MapRadiusToggle
                isEnabled={radiusEnabled}
                radiusKm={radiusKm}
                onToggle={(enabled) => {
                  setRadiusEnabled(enabled)
                  if (enabled && !filters.center_latitude) {
                    if (navigator.geolocation) {
                      navigator.geolocation.getCurrentPosition(
                        (position) => {
                          setFilters({
                            ...filters,
                            center_latitude: position.coords.latitude,
                            center_longitude: position.coords.longitude
                          })
                        },
                        (error) => {
                          console.error('Geolocation error:', error)
                          setRadiusEnabled(false)
                        }
                      )
                    }
                  }
                }}
                onRadiusChange={setRadiusKm}
                className="mb-4"
              />
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
                    Locality
                  </label>
                  <LocationAutocomplete
                    value={localityName}
                    onChange={(value, localityId) => {
                      setLocalityName(value)
                      setFilters({ ...filters, locality_id: localityId })
                    }}
                    placeholder="Search localities"
                    className="w-full"
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
            <h2 className="text-2xl font-semibold text-gray-900 mb-2">No matching properties found</h2>
            <p className="text-gray-600 mb-6">We couldn't find any properties matching your search criteria</p>
            <button
              onClick={() => {
                const filterText = []
                if (filters.property_type) filterText.push(filters.property_type)
                if (filters.listing_type) filterText.push(`for ${filters.listing_type}`)
                if (filters.bedrooms) filterText.push(`(${filters.bedrooms} BHK)`)
                if (filters.locality_id) filterText.push(`in ${filters.locality_id}`)
                const searchText = filterText.length > 0 ? filterText.join(' ') : searchQuery || 'properties'
                openWhatsApp(`Hi, I could not find results for ${searchText} listed on VizagProperty. Please assist.`)
              }}
              className="inline-flex items-center gap-2 bg-green-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-green-700 transition-all"
            >
              <MessageCircle className="h-5 w-5" />
              Contact Us on WhatsApp
            </button>
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
