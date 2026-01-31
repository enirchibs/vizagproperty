import { useState } from 'react'
import { Search, SlidersHorizontal, MapPin, ChevronLeft, Mic, MessageCircle, Plus } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import { PropertyCard } from '../components/PropertyCard'
import { usePropertySearch } from '../hooks/usePropertySearch'
import { VIZAG_PROPERTY_PHONE_WITH_CODE } from '../config/contact'

export function SearchPage() {
  const navigate = useNavigate()
  const [activeTab, setActiveTab] = useState<'buy' | 'rent' | 'commercial'>('buy')
  const [showFilters, setShowFilters] = useState(false)
  const [searchInput, setSearchInput] = useState('')
  const [bhkFilter, setBhkFilter] = useState<string>('')
  const [priceRange, setPriceRange] = useState<[number, number]>([0, 10000000])
  const [hasSearched, setHasSearched] = useState(false)

  const { properties, loading, error, search } = usePropertySearch()

  const handleSearch = () => {
    setHasSearched(true)
    search({
      listingType: activeTab === 'rent' ? 'rent' : 'sale',
      localityName: searchInput || undefined,
      bedrooms: bhkFilter ? parseInt(bhkFilter) : undefined,
      minPrice: priceRange[0],
      maxPrice: priceRange[1],
    })
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
                onClick={() => setActiveTab(tab)}
                data-active={activeTab === tab}
                className="flex-1 py-2 text-sm font-medium rounded-lg transition-all data-[active=true]:bg-white data-[active=true]:shadow capitalize"
              >
                {tab}
              </button>
            ))}
          </div>

          <div className="flex items-center gap-2 border-2 border-red-500 rounded-xl px-3 py-3 bg-white mb-3">
            <MapPin className="w-5 h-5 text-gray-400 flex-shrink-0" />
            <input
              type="text"
              value={searchInput}
              onChange={(e) => setSearchInput(e.target.value)}
              onKeyDown={(e) => e.key === 'Enter' && handleSearch()}
              placeholder="Type 3+ characters to search Vizag localities"
              className="flex-1 text-sm outline-none placeholder:text-gray-400"
            />
            <Mic className="w-5 h-5 text-gray-400 flex-shrink-0" />
            <MessageCircle className="w-5 h-5 text-green-500 flex-shrink-0" />
          </div>

          <div className="flex gap-2">
            <button
              onClick={handleSearch}
              className="flex-1 bg-orange-500 text-white py-3 rounded-xl font-semibold text-sm flex items-center justify-center gap-2 active:scale-95 transition-transform hover:bg-orange-600"
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
                setBhkFilter('')
                setPriceRange([0, 10000000])
              }}
              className="text-sm text-red-500 font-medium"
            >
              Clear All
            </button>
          </div>

          <div className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Property Type
              </label>
              <div className="flex gap-4 text-sm">
                <label className="flex items-center gap-2">
                  <input type="radio" name="propertyType" className="accent-blue-600" defaultChecked />
                  Full House
                </label>
                <label className="flex items-center gap-2">
                  <input type="radio" name="propertyType" className="accent-blue-600" />
                  Land / Plot
                </label>
              </div>
            </div>

            <div>
              <select className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm">
                <option>BHK Type</option>
                <option>1 BHK</option>
                <option>2 BHK</option>
                <option>3 BHK</option>
                <option>4 BHK</option>
                <option>5+ BHK</option>
              </select>
            </div>

            <div>
              <select className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm">
                <option>Property Status</option>
                <option>Ready to Move</option>
                <option>Under Construction</option>
                <option>New Launch</option>
              </select>
            </div>

            <div>
              <label className="flex items-center gap-2 text-sm">
                <input type="checkbox" className="accent-blue-600" />
                New Builder Projects
              </label>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Price Range
              </label>
              <div className="grid grid-cols-2 gap-2">
                <input
                  type="number"
                  placeholder="Min Price"
                  value={priceRange[0]}
                  onChange={(e) => setPriceRange([parseInt(e.target.value) || 0, priceRange[1]])}
                  className="px-3 py-2 border border-gray-300 rounded-lg text-sm"
                />
                <input
                  type="number"
                  placeholder="Max Price"
                  value={priceRange[1]}
                  onChange={(e) => setPriceRange([priceRange[0], parseInt(e.target.value) || 10000000])}
                  className="px-3 py-2 border border-gray-300 rounded-lg text-sm"
                />
              </div>
            </div>

            <button
              onClick={() => setShowFilters(false)}
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
                { name: 'VMRDA Approved Plots', path: '/vmrda-approved-plots' },
                { name: 'Flats for Sale', path: '/flats-for-sale' },
                { name: 'Villas', path: '/villas' },
                { name: 'PG & Hostels', path: '/pg-hostels' },
                { name: 'Gated Community', path: '/gated-community-plots' },
                { name: 'Flats for Rent', path: '/flats-for-rent' },
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
