import { useState, useEffect } from 'react'
import { Search, Mic, MicOff, Filter, X, MapPin, MessageCircle, Map, LayoutGrid } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { Property, SearchFilters } from '../types'
import { LocationAutocomplete } from '../components/LocationAutocomplete'
import { PropertyCard } from '../components/PropertyCard'
import { GoogleMapView } from '../components/GoogleMapView'
import { useVoiceSearch } from '../hooks/useVoiceSearch'
import { openWhatsApp } from '../lib/whatsapp'

export function PropertiesPage() {
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [searchQuery, setSearchQuery] = useState('')
  const [localityName, setLocalityName] = useState('')
  const [showFilters, setShowFilters] = useState(false)
  const [filters, setFilters] = useState<SearchFilters>({})
  const [viewMode, setViewMode] = useState<'grid' | 'map'>('grid')
  const [mobileView, setMobileView] = useState<'list' | 'map'>('list')
  const [selectedPropertyId, setSelectedPropertyId] = useState<string | null>(null)
  const [hoveredPropertyId, setHoveredPropertyId] = useState<string | null>(null)
  const { isListening, transcript, localityMatch, noMatchMessage, startListening, stopListening, resetTranscript, isSupported } = useVoiceSearch()

  useEffect(() => {
    const params = new URLSearchParams(window.location.search)
    const query = params.get('keyword') || params.get('q')
    const propertyTypeRaw = params.get('propertyType') || params.get('category')
    const listingType = params.get('listingType') || params.get('type')
    const localityId = params.get('localityId')
    const localityName = params.get('locality')
    const bhk = params.get('bhk')
    const status = params.get('status')
    const minPrice = params.get('minPrice')
    const maxPrice = params.get('maxPrice')

    if (query) {
      setSearchQuery(query)
    }

    // Map mobile category names to search API property types
    const categoryMap: Record<string, string> = {
      'full_house': 'villa',
      'flat_apartment': 'flat',
      'land_plot': 'plot',
      'pg_hostel': 'pg',
      'flatmates': 'pg',
      'commercial': 'commercial',
      // Already mapped types
      'villa': 'villa',
      'flat': 'flat',
      'plot': 'plot',
      'pg': 'pg'
    }

    if (propertyTypeRaw) {
      const mappedType = categoryMap[propertyTypeRaw] || propertyTypeRaw
      setFilters(prev => ({ ...prev, property_type: mappedType }))
    }

    if (listingType) {
      // Map 'buy' and 'commercial' to 'sale'
      const mappedListingType = listingType === 'buy' || listingType === 'commercial' ? 'sale' : listingType
      setFilters(prev => ({ ...prev, listing_type: mappedListingType }))
    }

    if (localityId) {
      setFilters(prev => ({ ...prev, locality_id: localityId }))
    } else if (localityName) {
      setFilters(prev => ({ ...prev, locality_id: localityName }))
    }

    if (bhk) {
      const bedroomsNum = parseInt(bhk.replace('+', ''))
      if (!isNaN(bedroomsNum)) {
        setFilters(prev => ({ ...prev, bedrooms: bedroomsNum }))
      }
    }

    if (status) {
      setFilters(prev => ({ ...prev, property_status: status }))
    }

    if (minPrice) {
      const minPriceNum = parseInt(minPrice)
      if (!isNaN(minPriceNum)) {
        setFilters(prev => ({ ...prev, min_price: minPriceNum }))
      }
    }

    if (maxPrice) {
      const maxPriceNum = parseInt(maxPrice)
      if (!isNaN(maxPriceNum)) {
        setFilters(prev => ({ ...prev, max_price: maxPriceNum }))
      }
    }
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
  }, [filters])

  // Distance helper (Haversine formula in km)
  const calculateDistance = (lat1: number, lon1: number, lat2: number, lon2: number) => {
    const R = 6371 // Radius of the earth in km
    const dLat = (lat2 - lat1) * (Math.PI / 180)
    const dLon = (lon2 - lon1) * (Math.PI / 180)
    const a =
      Math.sin(dLat / 2) * Math.sin(dLat / 2) +
      Math.cos(lat1 * (Math.PI / 180)) *
        Math.cos(lat2 * (Math.PI / 180)) *
        Math.sin(dLon / 2) *
        Math.sin(dLon / 2)
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    return R * c
  }

  // Multi-tier search state
  const [searchTier, setSearchTier] = useState<number>(5) // Max distance threshold currently active (5km default, then 10, 15, 20...)
  const [exactProperties, setExactProperties] = useState<Property[]>([])
  const [nearbyProperties, setNearbyProperties] = useState<Property[]>([])
  const [hasMoreTiers, setHasMoreTiers] = useState(false)

  const loadProperties = async (currentMaxDistance = 5) => {
    setLoading(true)
    try {
      // If no property_type, show all approved properties (browse mode)
      if (!filters.property_type) {
        const { data, error } = await supabase
          .from('properties')
          .select('*, localities!inner(name, slug, city)')
          .eq('localities.city', 'Visakhapatnam')
          .eq('status', 'approved')
          .order('created_at', { ascending: false })
          .limit(50)

        if (error) throw error
        setProperties(data || [])
        setExactProperties(data || [])
        setNearbyProperties([])
        setHasMoreTiers(false)
        setLoading(false)
        return
      }

      // Use unified query builder for filtered search
      const { buildUnifiedPropertyQuery } = await import('../lib/searchFilters')

      const searchParams: any = {
        propertyType: filters.property_type as 'flat' | 'plot' | 'villa' | 'pg' | 'commercial'
      }

      if (filters.listing_type) {
        searchParams.listingType = filters.listing_type as 'sale' | 'rent'
      }

      if (filters.bedrooms && filters.bedrooms > 0) {
        searchParams.bedrooms = filters.bedrooms
      }

      if (filters.min_price && filters.min_price > 0) {
        searchParams.minPrice = filters.min_price
      }

      if (filters.max_price && filters.max_price < 10000000) {
        searchParams.maxPrice = filters.max_price
      }

      if (filters.property_status && filters.property_status !== '') {
        searchParams.propertyStatus = filters.property_status
      }

      if (searchQuery && searchQuery.trim().length > 0) {
        searchParams.keyword = searchQuery.trim()
      }

      // 1. Fetch exact matching locality properties
      let exactList: Property[] = []
      if (filters.locality_id) {
        const { data, error } = await buildUnifiedPropertyQuery({
          ...searchParams,
          localityId: filters.locality_id
        }).limit(50)
        if (error) throw error
        exactList = data || []
      } else {
        // If no explicit locality search, fetch all matching criteria
        const { data, error } = await buildUnifiedPropertyQuery(searchParams).limit(50)
        if (error) throw error
        exactList = data || []
      }

      // 2. Fetch coordinate details for current locality to find nearby properties
      let nearbyList: Property[] = []
      let canExpandFurther = false

      if (filters.locality_id) {
        // Get coordinates of the queried locality
        const { data: localityData } = await supabase
          .from('localities')
          .select('latitude, longitude')
          .eq('id', filters.locality_id)
          .maybeSingle()

        if (localityData && localityData.latitude && localityData.longitude) {
          // Fetch ALL localities in Vizag to compute distance thresholds
          const { data: allLocalities } = await supabase
            .from('localities')
            .select('id, name, latitude, longitude')
            .eq('city', 'Visakhapatnam')

          if (allLocalities) {
            // Find locality IDs within current range and next range
            const nearbyLocalityIds: string[] = []
            const nextTierLocalityIds: string[] = []

            allLocalities.forEach((loc) => {
              if (loc.id === filters.locality_id || !loc.latitude || !loc.longitude) return
              const dist = calculateDistance(
                localityData.latitude!,
                localityData.longitude!,
                loc.latitude,
                loc.longitude
              )

              if (dist <= currentMaxDistance) {
                nearbyLocalityIds.push(loc.id)
              } else if (dist <= currentMaxDistance + 5) {
                nextTierLocalityIds.push(loc.id)
              }
            })

            // Query properties in the nearby localities
            if (nearbyLocalityIds.length > 0) {
              const { data: nData, error: nErr } = await buildUnifiedPropertyQuery({
                ...searchParams
              })
                .in('locality_id', nearbyLocalityIds)
                .limit(50)

              if (nErr) throw nErr
              nearbyList = nData || []
            }

            // Check if there are any properties available in the next expansion tier (currentMaxDistance + 5km)
            if (nextTierLocalityIds.length > 0) {
              const { data: checkData } = await buildUnifiedPropertyQuery({
                ...searchParams
              })
                .in('locality_id', nextTierLocalityIds)
                .limit(1)

              if (checkData && checkData.length > 0) {
                canExpandFurther = true
              }
            }
          }
        }
      }

      setExactProperties(exactList)
      setNearbyProperties(nearbyList)
      setProperties([...exactList, ...nearbyList])
      setHasMoreTiers(canExpandFurther)
    } catch (error) {
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
              onClick={() => setViewMode(viewMode === 'grid' ? 'map' : 'grid')}
              className={`flex items-center justify-center space-x-1.5 px-3 md:px-4 py-2.5 rounded-lg transition-colors min-h-[44px] ${
                viewMode === 'map'
                  ? 'bg-primary-100 text-primary-700 border border-primary-300'
                  : 'bg-gray-100 text-gray-700 border border-gray-200 hover:bg-gray-200'
              }`}
              aria-label={viewMode === 'grid' ? 'Switch to map view' : 'Switch to grid view'}
            >
              {viewMode === 'grid' ? (
                <>
                  <Map className="h-5 w-5" />
                  <span className="hidden sm:inline">Map</span>
                </>
              ) : (
                <>
                  <LayoutGrid className="h-5 w-5" />
                  <span className="hidden sm:inline">Grid</span>
                </>
              )}
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

      <div className={`max-w-7xl mx-auto px-4 py-8 ${viewMode === 'map' ? 'max-w-full' : ''}`}>
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
                const filterText: string[] = []
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
        ) : viewMode === 'map' ? (
          /* Map View: Responsive Toggle (Mobile) & Split (Desktop) */
          <div className="relative">
            <div className="flex flex-col lg:flex-row gap-4" style={{ height: 'calc(100vh - 280px)', minHeight: '500px' }}>
              {/* Map Panel */}
              <div 
                className={`w-full lg:w-[60%] h-[calc(100vh-320px)] lg:h-full rounded-2xl overflow-hidden shadow-lg border border-gray-200 lg:block ${
                  mobileView === 'map' ? 'block' : 'hidden'
                }`}
              >
                <GoogleMapView
                  properties={properties}
                  selectedPropertyId={selectedPropertyId}
                  onPropertySelect={(id) => {
                    setSelectedPropertyId(id)
                    const card = document.getElementById(`property-card-${id}`)
                    if (card) {
                      setMobileView('list')
                      setTimeout(() => {
                        card.scrollIntoView({ behavior: 'smooth', block: 'center' })
                      }, 100)
                    }
                  }}
                  onPropertyHover={setHoveredPropertyId}
                />
              </div>

              {/* Property List Panel */}
              <div 
                className={`w-full lg:w-[40%] overflow-y-auto space-y-4 pr-1 lg:block ${
                  mobileView === 'list' ? 'block' : 'hidden'
                }`} 
                style={{ maxHeight: 'calc(100vh - 280px)' }}
              >
                {exactProperties.length > 0 && (
                  <div>
                    <h3 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-2">Exact Matches</h3>
                    <div className="space-y-3">
                      {exactProperties.map((property) => (
                        <div
                          key={property.id}
                          id={`property-card-${property.id}`}
                          className={`transition-all duration-200 rounded-xl ${
                            selectedPropertyId === property.id
                              ? 'ring-2 ring-primary-500 shadow-lg scale-[1.01]'
                              : hoveredPropertyId === property.id
                              ? 'ring-1 ring-primary-300 shadow-md'
                              : ''
                          }`}
                          onMouseEnter={() => setHoveredPropertyId(property.id)}
                          onMouseLeave={() => setHoveredPropertyId(null)}
                          onClick={() => setSelectedPropertyId(property.id)}
                        >
                          <PropertyCard property={property} />
                        </div>
                      ))}
                    </div>
                  </div>
                )}

                {nearbyProperties.length > 0 && (
                  <div>
                    <h3 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mt-4 mb-2">
                      Nearby Matches (Within {searchTier} km)
                    </h3>
                    <div className="space-y-3">
                      {nearbyProperties.map((property) => (
                        <div
                          key={property.id}
                          id={`property-card-${property.id}`}
                          className={`transition-all duration-200 rounded-xl ${
                            selectedPropertyId === property.id
                              ? 'ring-2 ring-primary-500 shadow-lg scale-[1.01]'
                              : hoveredPropertyId === property.id
                              ? 'ring-1 ring-primary-300 shadow-md'
                              : ''
                          }`}
                          onMouseEnter={() => setHoveredPropertyId(property.id)}
                          onMouseLeave={() => setHoveredPropertyId(null)}
                          onClick={() => setSelectedPropertyId(property.id)}
                        >
                          <PropertyCard property={property} />
                        </div>
                      ))}
                    </div>
                  </div>
                )}

                {hasMoreTiers && (
                  <div className="p-4 bg-primary-50 rounded-xl border border-primary-200 text-center shadow-sm">
                    <p className="text-sm font-semibold text-primary-900 mb-2">Want to see more properties?</p>
                    <button
                      onClick={() => {
                        const nextTier = searchTier + 5
                        setSearchTier(nextTier)
                        loadProperties(nextTier)
                      }}
                      className="px-5 py-2.5 bg-primary-600 hover:bg-primary-700 text-white rounded-lg text-sm font-semibold transition-colors shadow-sm"
                    >
                      Show Properties within {searchTier + 5} km
                    </button>
                  </div>
                )}
              </div>
            </div>

            {/* Mobile Floating Toggle Button */}
            <div className="fixed bottom-6 left-1/2 transform -translate-x-1/2 z-40 lg:hidden">
              <button
                onClick={() => setMobileView(mobileView === 'list' ? 'map' : 'list')}
                className="flex items-center space-x-2 bg-gray-950 text-white px-5 py-3 rounded-full shadow-2xl hover:bg-gray-900 transition-all font-semibold border border-gray-800 text-sm"
              >
                {mobileView === 'list' ? (
                  <>
                    <Map className="h-4 w-4" />
                    <span>Show Map</span>
                  </>
                ) : (
                  <>
                    <LayoutGrid className="h-4 w-4" />
                    <span>Show List</span>
                  </>
                )}
              </button>
            </div>
          </div>
        ) : (
          /* Grid View (default) */
          <div>
            {exactProperties.length > 0 && (
              <div className="mb-8">
                <h3 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-4">Exact Matches</h3>
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                  {exactProperties.map((property) => (
                    <PropertyCard key={property.id} property={property} />
                  ))}
                </div>
              </div>
            )}

            {nearbyProperties.length > 0 && (
              <div className="mb-8">
                <h3 className="text-sm font-semibold text-gray-500 uppercase tracking-wider mb-4">
                  Nearby Matches (Within {searchTier} km)
                </h3>
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                  {nearbyProperties.map((property) => (
                    <PropertyCard key={property.id} property={property} />
                  ))}
                </div>
              </div>
            )}

            {hasMoreTiers && (
              <div className="max-w-md mx-auto p-6 bg-primary-50 rounded-2xl border border-primary-200 text-center shadow-sm mt-4">
                <p className="font-semibold text-primary-900 mb-3">Want to see more properties?</p>
                <button
                  onClick={() => {
                    const nextTier = searchTier + 5
                    setSearchTier(nextTier)
                    loadProperties(nextTier)
                  }}
                  className="px-6 py-3 bg-primary-600 hover:bg-primary-700 text-white rounded-xl font-semibold transition-colors shadow-sm"
                >
                  Show Properties within {searchTier + 5} km
                </button>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  )
}
