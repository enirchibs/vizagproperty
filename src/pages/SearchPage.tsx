import { useState, useEffect } from 'react'
import { Search, SlidersHorizontal, ChevronLeft, MessageCircle, Plus, MapPin, Mic, X } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import { FiltersPanel } from '../components/FiltersPanel'
import { PropertyCard } from '../components/PropertyCard'
import { usePropertySearch } from '../hooks/usePropertySearch'
import { LocationAutocomplete } from '../components/LocationAutocomplete'
import { VIZAG_PROPERTY_PHONE_WITH_CODE } from '../config/contact'
import { useSearch } from '../contexts/SearchContext'
import { saveLastSearch } from '../lib/searchMemory'

export function SearchPage() {
  const navigate = useNavigate()
  const [mobileFilterOpen, setMobileFilterOpen] = useState(false)

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
    priceRange,
    propertyStatus,
    setPropertyStatus,
    setNewBuilderProjects,
    possessionStatus,
    saleType,
    postedBy,
    furnishingStatus,
    amenities,
    coveredArea,
    areaUnit,
    hasSearched,
    setHasSearched,
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

    // Build search params - only include values that exist
    const searchParams: any = {
      propertyType: propertyType,
    }

    // OPTIONAL: Only add listing_type if explicitly set
    const actualListingType = listingType === 'commercial' ? 'sale' : listingType === 'rent' ? 'rent' : 'sale'
    if (actualListingType) {
      searchParams.listingType = actualListingType
    }

    // OPTIONAL: Only add locality if provided
    if (localityId) {
      searchParams.localityId = localityId
    } else if (locality && locality.trim().length >= 3) {
      searchParams.localityName = locality.trim()
    }

    // OPTIONAL: Only add bedrooms if selected
    if (bhkFilter && bhkFilter !== '') {
      const bedroomsNum = parseInt(bhkFilter)
      if (!isNaN(bedroomsNum) && bedroomsNum > 0) {
        searchParams.bedrooms = bedroomsNum
      }
    }

    // OPTIONAL: Only add price filters if specified
    if (priceRange[0] > 0) {
      searchParams.minPrice = priceRange[0]
    }

    if (priceRange[1] < 10000000) {
      searchParams.maxPrice = priceRange[1]
    }

    // OPTIONAL: Only add property status if selected (and not for plots)
    if (propertySubType !== 'Land / Plot' && propertyStatus && propertyStatus !== '') {
      searchParams.propertyStatus = propertyStatus
    }

    if (possessionStatus.length > 0) {
      searchParams.possessionStatus = possessionStatus
    }

    if (saleType.length > 0) {
      searchParams.saleType = saleType
    }

    if (postedBy.length > 0) {
      searchParams.postedBy = postedBy
    }

    if (furnishingStatus.length > 0) {
      searchParams.furnishingStatus = furnishingStatus
    }

    if (amenities.length > 0) {
      searchParams.amenities = amenities
    }

    if (coveredArea[0] > 0) {
      searchParams.minArea = coveredArea[0]
    }

    if (coveredArea[1] < 10000) {
      searchParams.maxArea = coveredArea[1]
    }

    searchParams.areaUnit = areaUnit

    await search(searchParams)

    if (localityId) {
      saveLastSearch({
        localityId,
        localityName: locality,
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

    return `No ${propertyTypeName} ${listingTypeName} found in ${locality}.`
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

          <div className="flex gap-1.5 mt-3">
            <button
              onClick={handleSearch}
              disabled={isSearchDisabled()}
              className="flex-1 bg-orange-500 text-white py-2 md:py-3 rounded-xl font-semibold text-xs md:text-sm flex items-center justify-center gap-1.5 active:scale-95 transition-transform hover:bg-orange-600 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              <Search className="w-3.5 h-3.5 md:w-4 md:h-4" />
              Search
            </button>
          </div>
        </div>
      </div>

      <div className="flex gap-6 px-3 md:px-4 py-3 md:py-4">
        {/* Desktop Filters Sidebar */}
        <div className="hidden lg:block w-80 flex-shrink-0">
          <div className="sticky top-24 bg-white rounded-lg border border-gray-200 p-4">
            <FiltersPanel />
            <button
              onClick={handleSearch}
              className="w-full bg-orange-500 text-white py-2.5 rounded-lg font-semibold text-sm hover:bg-orange-600 transition-colors mt-4"
            >
              Apply Filters
            </button>
          </div>
        </div>

        {/* Results Section */}
        <div className="flex-1">
          {/* Mobile Filter Button */}
          <div className="lg:hidden mb-4">
            <button
              onClick={() => setMobileFilterOpen(true)}
              className="w-full h-12 bg-orange-500 text-white rounded-xl font-semibold flex items-center justify-center gap-2"
            >
              <SlidersHorizontal className="h-5 w-5" />
              Filters
            </button>
          </div>

          {/* Results rendering remains conditional */}
          {hasSearched && (
            <>
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
                  <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                    {properties.map((property) => (
                      <PropertyCard key={property.id} property={property} />
                    ))}
                  </div>
                </>
              )}
            </>
          )}
        </div>
      </div>

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

      {mobileFilterOpen && (
        <div className="fixed inset-0 bg-black/40 z-50 lg:hidden" onClick={() => setMobileFilterOpen(false)}>
          <div
            className="absolute bottom-0 w-full bg-white rounded-t-2xl max-h-[85vh] overflow-y-auto p-4"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="flex justify-between items-center mb-4">
              <h2 className="text-lg font-semibold">Filters</h2>
              <button
                onClick={() => setMobileFilterOpen(false)}
                className="p-2 hover:bg-gray-100 rounded-full transition-colors"
              >
                <X className="h-5 w-5" />
              </button>
            </div>

            <FiltersPanel />

            <div className="sticky bottom-0 bg-white pt-4 pb-2">
              <button
                onClick={() => {
                  setMobileFilterOpen(false)
                  handleSearch()
                }}
                className="w-full h-12 bg-red-600 text-white rounded-xl font-semibold"
              >
                Apply Filters
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
