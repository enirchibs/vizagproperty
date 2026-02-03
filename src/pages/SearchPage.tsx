import { useState, useEffect } from 'react'
import { Search, SlidersHorizontal, ChevronLeft, MessageCircle, Plus, MapPin, Mic } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import { PropertyCard } from '../components/PropertyCard'
import { usePropertySearch } from '../hooks/usePropertySearch'
import { LocationAutocomplete } from '../components/LocationAutocomplete'
import { VIZAG_PROPERTY_PHONE_WITH_CODE } from '../config/contact'
import { useSearch } from '../contexts/SearchContext'
import MapRadiusToggle from '../components/MapRadiusToggle'
import { saveLastSearch } from '../lib/searchMemory'

export function SearchPage() {
  const navigate = useNavigate()
  const [showFilters, setShowFilters] = useState(false)

  // Use SearchContext for all search-related state
  const {
    listingType,
    setListingType,
    propertyCategory,
    setPropertyCategory,
    propertySubType,
    setPropertySubType,
    locality,
    setLocality,
    localityId,
    setLocalityId,
    bhkFilter,
    setBhkFilter,
    propertyStatus,
    setPropertyStatus,
    newBuilderProjects,
    setNewBuilderProjects,
    priceRange,
    setPriceRange,
    includeNearby,
    setIncludeNearby,
    radiusKm,
    setRadiusKm,
    hasSearched,
    setHasSearched,
    resetFilters,
    getDefaultSubType,
    getPropertyTypeForSearch,
  } = useSearch()

  const { properties, loading, error, search } = usePropertySearch()

  useEffect(() => {
    setListingType('buy')
    setPropertyCategory('residential')
    setPropertySubType('Flat / Apartment')
  }, [])

  const handleListingTypeChange = (type: 'buy' | 'rent' | 'commercial') => {
    setListingType(type)
    if (type === 'commercial') {
      setPropertyCategory('commercial')
      setPropertySubType(null)
    } else {
      setPropertyCategory('residential')
      setPropertySubType(null)
    }
    setPropertyStatus('')
    setBhkFilter('')
    setNewBuilderProjects(false)
  }

  const startVoiceSearch = () => {
    const SpeechRecognition =
      (window as any).SpeechRecognition || (window as any).webkitSpeechRecognition

    if (!SpeechRecognition) {
      alert('Voice search not supported on this device')
      return
    }

    const recognition = new SpeechRecognition()
    recognition.lang = 'en-IN'
    recognition.interimResults = false
    recognition.maxAlternatives = 1

    recognition.start()

    recognition.onresult = (event: any) => {
      const transcript = event.results[0][0].transcript.trim()
      setLocality(transcript)
    }

    recognition.onerror = () => {
      recognition.stop()
    }
  }

  const handlePropertyCategoryChange = (category: 'residential' | 'commercial') => {
    setPropertyCategory(category)
    setPropertySubType(getDefaultSubType(listingType, category))
  }

  const handleSearch = async () => {
    if (locality.trim().length < 3) {
      return
    }

    const propertyType = getPropertyTypeForSearch()
    if (!propertyType) {
      return
    }

    setHasSearched(true)

    const actualListingType = listingType === 'commercial' ? 'sale' : listingType === 'rent' ? 'rent' : 'sale'

    const searchParams: any = {
      listingType: actualListingType,
      propertyType: propertyType,
      localityId: localityId,
      localityName: !localityId ? locality : undefined,
      includeNearby: includeNearby,
      radiusKm: radiusKm,
      bedrooms: bhkFilter ? parseInt(bhkFilter) : undefined,
      minPrice: priceRange[0] > 0 ? priceRange[0] : undefined,
      maxPrice: priceRange[1] < 10000000 ? priceRange[1] : undefined,
    }

    if (propertySubType !== 'Land / Plot' && propertyStatus) {
      searchParams.propertyStatus = propertyStatus
    }

    await search(searchParams)

    if (localityId && includeNearby) {
      saveLastSearch({
        localityId,
        localityName: locality,
        radiusKm,
        propertyType,
        listingType: actualListingType
      })
    }
  }

  const isSearchDisabled = () => {
    if (locality.trim().length < 3) return true
    if (!listingType) return true
    const propertyType = getPropertyTypeForSearch()
    if (!propertyType) return true
    return false
  }

  const getEmptyStateMessage = () => {
    const propertyType = getPropertyTypeForSearch()
    const propertyTypeName =
      propertyType === 'flat' ? 'Flats' :
      propertyType === 'plot' ? 'Plots' :
      propertyType === 'villa' ? 'Villas' :
      propertyType === 'pg' ? 'PG/Hostels' :
      propertyType === 'commercial' ? 'Commercial Properties' :
      'Properties'

    const listingTypeName = listingType === 'rent' ? 'for Rent' : 'for Sale'
    const radiusText = includeNearby ? ` within ${radiusKm} km` : ''

    return `No ${propertyTypeName} ${listingTypeName} found in ${locality}${radiusText}.`
  }


  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <div className="sticky top-0 z-40 bg-white px-3 pt-3 pb-2 shadow-sm">
        <div>
          <div className="flex items-center gap-2 mb-2">
            <button
              onClick={() => navigate('/')}
              className="p-2 hover:bg-gray-100 rounded-lg transition-colors flex-shrink-0"
            >
              <ChevronLeft className="h-4 w-4 md:h-5 md:w-5 text-gray-600" />
            </button>
            <h1 className="text-sm md:text-lg font-bold text-gray-900">Search Property</h1>
          </div>

          <div className="space-y-3 mb-2">
            <div className="flex rounded-xl overflow-hidden border border-gray-200">
              {['buy', 'rent', 'commercial'].map((type) => (
                <button
                  key={type}
                  onClick={() => handleListingTypeChange(type as 'buy' | 'rent' | 'commercial')}
                  className={`flex-1 py-2.5 text-xs md:text-sm font-semibold transition-colors ${
                    listingType === type
                      ? type === 'buy'
                        ? 'bg-blue-600 text-white'
                        : type === 'rent'
                        ? 'bg-red-500 text-white'
                        : 'bg-purple-600 text-white'
                      : 'bg-white text-gray-600'
                  }`}
                >
                  {type.toUpperCase()}
                </button>
              ))}
            </div>

            {listingType !== 'commercial' && (
              <div className="flex gap-3">
                {['residential', 'commercial'].map(cat => (
                  <label
                    key={cat}
                    className={`flex-1 px-4 py-2 rounded-lg text-xs md:text-sm font-medium border cursor-pointer transition-colors text-center ${
                      propertyCategory === cat
                        ? 'bg-blue-50 border-blue-600 text-blue-700'
                        : 'bg-white border-gray-300 text-gray-700'
                    }`}
                  >
                    <input
                      type="radio"
                      className="hidden"
                      checked={propertyCategory === cat}
                      onChange={() => handlePropertyCategoryChange(cat as 'residential' | 'commercial')}
                    />
                    {cat.charAt(0).toUpperCase() + cat.slice(1)}
                  </label>
                ))}
              </div>
            )}
          </div>

          <div className="mb-2 relative">
            <LocationAutocomplete
              value={locality}
              onChange={(value, localityId) => {
                setLocality(value)
                setLocalityId(localityId)
              }}
              placeholder="Type 3+ characters to search Vizag localities"
              className="h-10 md:h-12 pr-20 border-2 border-red-500 text-xs md:text-sm font-medium"
            />
            <button
              type="button"
              onClick={startVoiceSearch}
              className="absolute right-10 top-1/2 -translate-y-1/2 text-gray-500 hover:text-blue-600 transition-colors"
              aria-label="Voice search"
            >
              <Mic className="w-5 h-5" />
            </button>
          </div>

          <div className="mb-3">
            <MapRadiusToggle
              isEnabled={includeNearby}
              radiusKm={radiusKm}
              onToggle={setIncludeNearby}
              onRadiusChange={setRadiusKm}
              localityName={locality}
            />
          </div>

          <div className="flex gap-1.5">
            <button
              onClick={handleSearch}
              disabled={isSearchDisabled()}
              className="flex-1 bg-orange-500 text-white py-2 md:py-3 rounded-xl font-semibold text-xs md:text-sm flex items-center justify-center gap-1.5 active:scale-95 transition-transform hover:bg-orange-600 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              <Search className="w-3.5 h-3.5 md:w-4 md:h-4" />
              Search
            </button>
            <button
              onClick={() => setShowFilters(!showFilters)}
              className="px-3 md:px-4 py-2 md:py-3 bg-gray-100 text-gray-700 rounded-xl hover:bg-gray-200 transition-colors flex-shrink-0"
            >
              <SlidersHorizontal className="h-4 w-4 md:h-5 md:w-5" />
            </button>
          </div>
        </div>
      </div>

      {showFilters && (
        <div className="bg-white border-b border-gray-200 px-3 md:px-4 py-3 md:py-4 animate-slide-down">
          <div className="flex items-center justify-between mb-3">
            <h3 className="font-bold text-sm md:text-base text-gray-900">Filters</h3>
            <button
              onClick={resetFilters}
              className="text-xs md:text-sm text-red-500 font-medium"
            >
              Clear All
            </button>
          </div>

          <div className="space-y-3">
            {listingType === 'buy' && propertyCategory === 'residential' && (
              <div>
                <label className="block text-xs md:text-sm font-medium text-gray-700 mb-2">
                  Property Type
                </label>
                <div className="flex flex-wrap gap-2">
                  {[
                    'Flat / Apartment',
                    'Villa',
                    'Full House',
                    'Land / Plot'
                  ].map(opt => (
                    <label
                      key={opt}
                      className="flex items-center gap-2 text-xs md:text-sm px-3 py-2 rounded-lg border bg-white cursor-pointer hover:bg-gray-50"
                    >
                      <input
                        type="radio"
                        checked={propertySubType === opt}
                        onChange={() => setPropertySubType(opt)}
                      />
                      {opt}
                    </label>
                  ))}
                </div>
              </div>
            )}

            {listingType === 'rent' && propertyCategory === 'residential' && (
              <div>
                <label className="block text-xs md:text-sm font-medium text-gray-700 mb-2">
                  Property Type
                </label>
                <div className="flex flex-wrap gap-2">
                  {[
                    'Flat / Apartment',
                    'Villa',
                    'Full House',
                    'PG / Hostel',
                    'Flatmates'
                  ].map(opt => (
                    <label
                      key={opt}
                      className="flex items-center gap-2 text-xs md:text-sm px-3 py-2 rounded-lg border bg-white cursor-pointer hover:bg-gray-50"
                    >
                      <input
                        type="radio"
                        name="subType"
                        checked={propertySubType === opt}
                        onChange={() => setPropertySubType(opt)}
                      />
                      {opt}
                    </label>
                  ))}
                </div>
              </div>
            )}

            {(propertyCategory === 'commercial' || listingType === 'commercial') && (
              <div>
                <label className="block text-xs md:text-sm font-medium text-gray-700 mb-2">
                  Commercial Property Type
                </label>
                <select
                  className="w-full rounded-lg border px-3 py-2.5 text-xs md:text-sm"
                  value={propertySubType || ''}
                  onChange={e => setPropertySubType(e.target.value)}
                >
                  <option value="">Select Commercial Type</option>
                  <option>Office Space</option>
                  <option>Shop / Showroom</option>
                  <option>Warehouse</option>
                  <option>Farmhouse</option>
                  <option>Co-working Space</option>
                </select>
              </div>
            )}

            {(propertySubType === 'Full House' || propertySubType === 'Flat / Apartment') && (
              <div>
                <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1.5">
                  BHK Type
                </label>
                <select
                  value={bhkFilter}
                  onChange={(e) => setBhkFilter(e.target.value)}
                  className="w-full border border-gray-300 rounded-lg px-2.5 md:px-3 py-1.5 md:py-2 text-xs md:text-sm"
                >
                  <option value="">All BHK Types</option>
                  <option value="1">1 BHK</option>
                  <option value="2">2 BHK</option>
                  <option value="3">3 BHK</option>
                  <option value="4">4 BHK</option>
                  <option value="5">5+ BHK</option>
                </select>
              </div>
            )}

            {listingType === 'buy' && propertyCategory === 'residential' && (
              <>
                {propertySubType !== 'Land / Plot' && (
                  <div>
                    <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1.5">
                      Property Status
                    </label>
                    <select
                      value={propertyStatus}
                      onChange={(e) => setPropertyStatus(e.target.value)}
                      className="w-full border border-gray-300 rounded-lg px-2.5 md:px-3 py-1.5 md:py-2 text-xs md:text-sm"
                    >
                      <option value="">All Status</option>
                      <option value="ready_to_move">Ready to Move</option>
                      <option value="under_construction">Under Construction</option>
                    </select>
                  </div>
                )}

                <div>
                  <label className="flex items-center gap-1.5 text-xs md:text-sm">
                    <input
                      type="checkbox"
                      checked={newBuilderProjects}
                      onChange={(e) => setNewBuilderProjects(e.target.checked)}
                      className="accent-blue-600"
                    />
                    New Builder Projects
                  </label>
                </div>
              </>
            )}

            <div>
              <label className="block text-xs md:text-sm font-medium text-gray-700 mb-1.5">
                Price Range
              </label>
              <div className="grid grid-cols-2 gap-1.5">
                <input
                  type="number"
                  placeholder="Min Price"
                  value={priceRange[0] || ''}
                  onChange={(e) => setPriceRange([parseInt(e.target.value) || 0, priceRange[1]])}
                  className="px-2.5 md:px-3 py-1.5 md:py-2 border border-gray-300 rounded-lg text-xs md:text-sm"
                />
                <input
                  type="number"
                  placeholder="Max Price"
                  value={priceRange[1] >= 10000000 ? '' : priceRange[1]}
                  onChange={(e) => setPriceRange([priceRange[0], parseInt(e.target.value) || 10000000])}
                  className="px-2.5 md:px-3 py-1.5 md:py-2 border border-gray-300 rounded-lg text-xs md:text-sm"
                />
              </div>
            </div>

            <button
              onClick={() => {
                setShowFilters(false)
                handleSearch()
              }}
              className="w-full bg-orange-500 text-white py-2 md:py-2.5 rounded-lg font-semibold text-xs md:text-sm hover:bg-orange-600 transition-colors"
            >
              Apply Filters
            </button>
          </div>
        </div>
      )}

      {hasSearched && (
        <div className="px-3 md:px-4 py-3 md:py-4">
          {loading && (
            <div className="text-center py-8 md:py-12">
              <div className="inline-block h-6 w-6 md:h-8 md:w-8 animate-spin rounded-full border-4 border-solid border-orange-500 border-r-transparent"></div>
              <p className="mt-3 md:mt-4 text-xs md:text-sm text-gray-600">Loading properties...</p>
            </div>
          )}

          {error && (
            <div className="text-center py-8 md:py-12">
              <p className="text-xs md:text-sm text-red-600">{error}</p>
            </div>
          )}

          {!loading && !error && properties.length === 0 && (
            <div className="text-center py-8 md:py-12">
              <MapPin className="h-10 w-10 md:h-12 md:w-12 text-gray-400 mx-auto mb-3 md:mb-4" />
              <h3 className="text-sm md:text-lg font-bold text-gray-900 mb-1.5 md:mb-2">No properties found</h3>
              <p className="text-xs md:text-sm text-gray-600">{getEmptyStateMessage()}</p>
            </div>
          )}

          {!loading && !error && properties.length > 0 && (
            <>
              <div className="flex items-center justify-between mb-3">
                <h2 className="font-bold text-sm md:text-base text-gray-900">
                  {properties.length} Properties
                </h2>
              </div>
              <div className="grid grid-cols-2 lg:grid-cols-3 gap-3">
                {properties.map((property) => (
                  <PropertyCard key={property.id} property={property} />
                ))}
              </div>
            </>
          )}
        </div>
      )}

      {!hasSearched && (
        <div className="px-3 md:px-4 py-8 md:py-12">
          <div className="text-center mb-4 md:mb-6">
            <Search className="h-12 w-12 md:h-16 md:w-16 text-gray-300 mx-auto mb-3 md:mb-4" />
            <h3 className="text-base md:text-lg font-semibold text-gray-900 mb-1.5 md:mb-2">Start Your Property Search</h3>
            <p className="text-gray-600 text-xs md:text-sm">Enter a locality and tap Search to find properties</p>
          </div>

          <div className="mt-6 md:mt-8">
            <h3 className="text-xs md:text-sm font-semibold text-gray-700 mb-2 md:mb-3">Browse by Category</h3>
            <div className="flex md:hidden flex-col gap-2">
              {[
                { name: 'VMRDA Approved Plots', path: '/vmrda-approved-plots-vizag' },
                { name: 'Flats for Sale', path: '/flats-for-sale-in-vizag' },
                { name: 'Villas', path: '/villas-for-sale-vizag' },
                { name: 'PG & Hostels', path: '/pg-hostels-in-vizag' },
                { name: 'Gated Community', path: '/gated-community-plots-vizag' },
                { name: 'Flats for Rent', path: '/flats-for-rent-vizag' },
              ].map((item) => (
                <button
                  key={item.name}
                  onClick={() => navigate(item.path)}
                  className="bg-white rounded-xl p-3 text-xs font-medium shadow-sm border border-gray-200 text-left hover:shadow-md transition-shadow active:scale-95 flex items-center justify-between"
                >
                  <span>{item.name}</span>
                  <ChevronLeft className="h-4 w-4 rotate-180 text-gray-400" />
                </button>
              ))}
            </div>
            <div className="hidden md:grid grid-cols-2 gap-3">
              {[
                { name: 'VMRDA Approved Plots', path: '/vmrda-approved-plots-vizag' },
                { name: 'Flats for Sale', path: '/flats-for-sale-in-vizag' },
                { name: 'Villas', path: '/villas-for-sale-vizag' },
                { name: 'PG & Hostels', path: '/pg-hostels-in-vizag' },
                { name: 'Gated Community', path: '/gated-community-plots-vizag' },
                { name: 'Flats for Rent', path: '/flats-for-rent-vizag' },
              ].map((item) => (
                <button
                  key={item.name}
                  onClick={() => navigate(item.path)}
                  className="bg-white rounded-xl p-4 text-sm font-medium shadow-sm border border-gray-200 text-center hover:shadow-md transition-shadow active:scale-95"
                >
                  {item.name}
                </button>
              ))}
            </div>
          </div>
        </div>
      )}

      <div className="fixed bottom-16 right-3 md:hidden z-40">
        <button
          onClick={() => navigate('/add-property')}
          className="bg-green-600 text-white px-3 py-2 rounded-full shadow-lg text-xs font-semibold flex items-center gap-1.5 hover:bg-green-700 transition-colors"
        >
          <Plus className="w-3.5 h-3.5" />
          Post Property
        </button>
      </div>

      <div className="fixed bottom-3 right-3 md:hidden z-40">
        <a
          href={`https://wa.me/${VIZAG_PROPERTY_PHONE_WITH_CODE}`}
          target="_blank"
          rel="noopener noreferrer"
          className="bg-green-500 w-12 h-12 rounded-full flex items-center justify-center shadow-xl hover:bg-green-600 transition-colors"
        >
          <MessageCircle className="text-white w-6 h-6" />
        </a>
      </div>
    </div>
  )
}
