import { useState, useEffect } from 'react'
import { Search, SlidersHorizontal, ChevronLeft, Mic, MicOff, MessageCircle, Plus, MapPin, X } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import { PropertyCard } from '../components/PropertyCard'
import { usePropertySearch } from '../hooks/usePropertySearch'
import { useVoiceSearch } from '../hooks/useVoiceSearch'
import { openWhatsApp } from '../lib/whatsapp'
import { LocationAutocomplete } from '../components/LocationAutocomplete'
import { VIZAG_PROPERTY_PHONE_WITH_CODE } from '../config/contact'

type PropertyCategory = 'full_house' | 'land_plot' | 'pg_hostel' | 'flatmates'

export function SearchPage() {
  const navigate = useNavigate()
  const [activeTab, setActiveTab] = useState<'buy' | 'rent' | 'commercial'>('buy')
  const [showFilters, setShowFilters] = useState(false)
  const [locality, setLocality] = useState('')
  const [localityId, setLocalityId] = useState<string | undefined>()
  const [propertyCategory, setPropertyCategory] = useState<PropertyCategory>('full_house')
  const [bhkFilter, setBhkFilter] = useState<string>('')
  const [propertyStatus, setPropertyStatus] = useState<string>('')
  const [newBuilderProjects, setNewBuilderProjects] = useState(false)
  const [priceRange, setPriceRange] = useState<[number, number]>([0, 10000000])
  const [hasSearched, setHasSearched] = useState(false)

  const { properties, loading, error, search } = usePropertySearch()
  const {
    isListening,
    transcript,
    localityMatch,
    noMatchMessage,
    startListening,
    stopListening,
    resetTranscript,
    isSupported
  } = useVoiceSearch()

  useEffect(() => {
    if (transcript) {
      setLocality(transcript)
    }
  }, [transcript])

  useEffect(() => {
    if (localityMatch) {
      setLocality(localityMatch.locality_name)
      setLocalityId(undefined)
    }
  }, [localityMatch])

  const handleVoiceToggle = () => {
    if (isListening) {
      stopListening()
    } else {
      resetTranscript()
      startListening()
    }
  }

  const handleTabChange = (tab: 'buy' | 'rent' | 'commercial') => {
    setActiveTab(tab)
    if (tab === 'buy') {
      setPropertyCategory('full_house')
    } else if (tab === 'rent') {
      setPropertyCategory('full_house')
    }
  }

  const getPropertyTypeForSearch = (): 'flat' | 'plot' | 'villa' | 'pg' | 'commercial' | undefined => {
    if (activeTab === 'commercial') return 'commercial'

    if (propertyCategory === 'land_plot') return 'plot'
    if (propertyCategory === 'pg_hostel') return 'pg'

    return 'flat'
  }

  const handleSearch = () => {
    if (locality.trim().length < 3) {
      return
    }

    setHasSearched(true)

    search({
      listingType: activeTab === 'rent' ? 'rent' : 'sale',
      propertyType: getPropertyTypeForSearch(),
      localityId: localityId,
      localityName: !localityId ? locality : undefined,
      bedrooms: bhkFilter ? parseInt(bhkFilter) : undefined,
      minPrice: priceRange[0] > 0 ? priceRange[0] : undefined,
      maxPrice: priceRange[1] < 10000000 ? priceRange[1] : undefined,
    })
  }

  const handleWhatsAppClick = () => {
    openWhatsApp('Hi Vizag Property Experts, I am looking for a property in Vizag. Please assist.')
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <div className="sticky top-0 z-30 bg-white shadow-md">
        <div className="px-3 pt-3 pb-3">
          <div className="flex items-center gap-2 mb-3">
            <button
              onClick={() => navigate('/')}
              className="p-2 hover:bg-gray-100 rounded-lg transition-colors flex-shrink-0"
            >
              <ChevronLeft className="h-5 w-5 text-gray-600" />
            </button>
            <h1 className="text-lg font-bold text-gray-900">Search Property</h1>
          </div>

          <div className="flex rounded-xl bg-gray-100 p-1 mb-3">
            {(['buy', 'rent', 'commercial'] as const).map((tab) => (
              <button
                key={tab}
                onClick={() => handleTabChange(tab)}
                data-active={activeTab === tab}
                className="flex-1 py-2 text-sm font-medium rounded-lg transition-all data-[active=true]:bg-white data-[active=true]:shadow capitalize"
              >
                {tab}
              </button>
            ))}
          </div>

          <div className="mb-3 relative">
            <LocationAutocomplete
              value={locality}
              onChange={(value, localityId) => {
                setLocality(value)
                setLocalityId(localityId)
              }}
              placeholder="Type 3+ characters to search Vizag localities"
              className="h-12 pr-20 border-2 border-red-500 text-sm font-medium"
            />
            <div className="absolute right-2 top-1/2 -translate-y-1/2 flex items-center gap-1 z-10">
              {isSupported && (
                <button
                  onClick={handleVoiceToggle}
                  className={`p-2 rounded-lg transition-all ${
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
                onClick={handleWhatsAppClick}
                className="p-2 rounded-lg transition-all text-green-600 hover:bg-green-50"
                aria-label="Contact on WhatsApp"
              >
                <MessageCircle className="h-5 w-5" />
              </button>
            </div>
            {localityMatch && (
              <div className="absolute top-full left-0 right-0 mt-2 p-3 bg-green-50 border border-green-200 rounded-lg flex items-center justify-between z-20">
                <div className="flex items-center space-x-2">
                  <MapPin className="h-5 w-5 text-green-600 flex-shrink-0" />
                  <div>
                    <div className="text-sm font-medium text-green-900">
                      Found: {localityMatch.locality_name}
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
              <div className="absolute top-full left-0 right-0 mt-2 p-3 bg-yellow-50 border border-yellow-200 rounded-lg flex items-center justify-between z-20">
                <div className="flex items-center space-x-2">
                  <MapPin className="h-5 w-5 text-yellow-600 flex-shrink-0" />
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
          </div>

          <div className="flex gap-2">
            <button
              onClick={handleSearch}
              disabled={locality.trim().length < 3}
              className="flex-1 bg-orange-500 text-white py-3 rounded-xl font-semibold text-sm flex items-center justify-center gap-2 active:scale-95 transition-transform hover:bg-orange-600 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              <Search className="w-4 h-4" />
              Search
            </button>
            <button
              onClick={() => setShowFilters(!showFilters)}
              className="px-4 py-3 bg-gray-100 text-gray-700 rounded-xl hover:bg-gray-200 transition-colors flex-shrink-0"
            >
              <SlidersHorizontal className="h-5 w-5" />
            </button>
          </div>
        </div>
      </div>

      {showFilters && (
        <div className="bg-white border-b border-gray-200 px-4 py-4 animate-slide-down">
          <div className="flex items-center justify-between mb-4">
            <h3 className="font-bold text-gray-900">Filters</h3>
            <button
              onClick={() => {
                setPropertyCategory('full_house')
                setBhkFilter('')
                setPropertyStatus('')
                setNewBuilderProjects(false)
                setPriceRange([0, 10000000])
              }}
              className="text-sm text-red-500 font-medium"
            >
              Clear All
            </button>
          </div>

          <div className="space-y-4">
            {activeTab === 'buy' && (
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Property Category
                </label>
                <div className="flex gap-4 text-sm">
                  <label className="flex items-center gap-2">
                    <input
                      type="radio"
                      name="propertyCategory"
                      value="full_house"
                      checked={propertyCategory === 'full_house'}
                      onChange={(e) => setPropertyCategory(e.target.value as PropertyCategory)}
                      className="accent-blue-600"
                    />
                    Full House
                  </label>
                  <label className="flex items-center gap-2">
                    <input
                      type="radio"
                      name="propertyCategory"
                      value="land_plot"
                      checked={propertyCategory === 'land_plot'}
                      onChange={(e) => setPropertyCategory(e.target.value as PropertyCategory)}
                      className="accent-blue-600"
                    />
                    Land / Plot
                  </label>
                </div>
              </div>
            )}

            {activeTab === 'rent' && (
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Property Category
                </label>
                <div className="flex flex-wrap gap-4 text-sm">
                  <label className="flex items-center gap-2">
                    <input
                      type="radio"
                      name="propertyCategory"
                      value="full_house"
                      checked={propertyCategory === 'full_house'}
                      onChange={(e) => setPropertyCategory(e.target.value as PropertyCategory)}
                      className="accent-blue-600"
                    />
                    Full House
                  </label>
                  <label className="flex items-center gap-2">
                    <input
                      type="radio"
                      name="propertyCategory"
                      value="pg_hostel"
                      checked={propertyCategory === 'pg_hostel'}
                      onChange={(e) => setPropertyCategory(e.target.value as PropertyCategory)}
                      className="accent-blue-600"
                    />
                    PG/Hostel
                  </label>
                  <label className="flex items-center gap-2">
                    <input
                      type="radio"
                      name="propertyCategory"
                      value="flatmates"
                      checked={propertyCategory === 'flatmates'}
                      onChange={(e) => setPropertyCategory(e.target.value as PropertyCategory)}
                      className="accent-blue-600"
                    />
                    Flatmates
                  </label>
                </div>
              </div>
            )}

            {propertyCategory === 'full_house' && (
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  BHK Type
                </label>
                <select
                  value={bhkFilter}
                  onChange={(e) => setBhkFilter(e.target.value)}
                  className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm"
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

            {activeTab === 'buy' && (
              <>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">
                    Property Status
                  </label>
                  <select
                    value={propertyStatus}
                    onChange={(e) => setPropertyStatus(e.target.value)}
                    className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm"
                  >
                    <option value="">All Status</option>
                    <option value="ready_to_move">Ready to Move</option>
                    <option value="under_construction">Under Construction</option>
                  </select>
                </div>

                <div>
                  <label className="flex items-center gap-2 text-sm">
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
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Price Range
              </label>
              <div className="grid grid-cols-2 gap-2">
                <input
                  type="number"
                  placeholder="Min Price"
                  value={priceRange[0] || ''}
                  onChange={(e) => setPriceRange([parseInt(e.target.value) || 0, priceRange[1]])}
                  className="px-3 py-2 border border-gray-300 rounded-lg text-sm"
                />
                <input
                  type="number"
                  placeholder="Max Price"
                  value={priceRange[1] >= 10000000 ? '' : priceRange[1]}
                  onChange={(e) => setPriceRange([priceRange[0], parseInt(e.target.value) || 10000000])}
                  className="px-3 py-2 border border-gray-300 rounded-lg text-sm"
                />
              </div>
            </div>

            <button
              onClick={() => {
                setShowFilters(false)
                handleSearch()
              }}
              className="w-full bg-orange-500 text-white py-2.5 rounded-lg font-semibold text-sm hover:bg-orange-600 transition-colors"
            >
              Apply Filters
            </button>
          </div>
        </div>
      )}

      {hasSearched && (
        <div className="px-4 py-4">
          {loading && (
            <div className="text-center py-12">
              <div className="inline-block h-8 w-8 animate-spin rounded-full border-4 border-solid border-orange-500 border-r-transparent"></div>
              <p className="mt-4 text-gray-600">Loading properties...</p>
            </div>
          )}

          {error && (
            <div className="text-center py-12">
              <p className="text-red-600">{error}</p>
            </div>
          )}

          {!loading && !error && properties.length === 0 && (
            <div className="text-center py-12">
              <MapPin className="h-12 w-12 text-gray-400 mx-auto mb-4" />
              <h3 className="text-lg font-bold text-gray-900 mb-2">No properties found</h3>
              <p className="text-gray-600">Try adjusting your search or filters</p>
            </div>
          )}

          {!loading && !error && properties.length > 0 && (
            <>
              <div className="flex items-center justify-between mb-4">
                <h2 className="font-bold text-gray-900">
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
        </div>
      )}

      {!hasSearched && (
        <div className="px-4 py-12">
          <div className="text-center mb-6">
            <Search className="h-16 w-16 text-gray-300 mx-auto mb-4" />
            <h3 className="text-lg font-semibold text-gray-900 mb-2">Start Your Property Search</h3>
            <p className="text-gray-600 text-sm">Enter a locality and tap Search to find properties</p>
          </div>

          <div className="mt-8">
            <h3 className="text-sm font-semibold text-gray-700 mb-3">Browse by Category</h3>
            <div className="grid grid-cols-2 gap-3">
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

      <div className="fixed bottom-20 right-4 md:hidden z-40">
        <button
          onClick={() => navigate('/add-property')}
          className="bg-green-600 text-white px-4 py-3 rounded-full shadow-lg text-sm font-semibold flex items-center gap-2 hover:bg-green-700 transition-colors"
        >
          <Plus className="w-4 h-4" />
          Post Property
        </button>
      </div>

      <div className="fixed bottom-4 right-4 md:hidden z-40">
        <a
          href={`https://wa.me/${VIZAG_PROPERTY_PHONE_WITH_CODE}`}
          target="_blank"
          rel="noopener noreferrer"
          className="bg-green-500 w-14 h-14 rounded-full flex items-center justify-center shadow-xl hover:bg-green-600 transition-colors"
        >
          <MessageCircle className="text-white w-7 h-7" />
        </a>
      </div>
    </div>
  )
}
