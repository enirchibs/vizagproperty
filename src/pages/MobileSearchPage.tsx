import { useState, useEffect } from 'react'
import { useNavigate, useSearchParams } from 'react-router-dom'
import { ArrowLeft, X, MapPin, Search, Home } from 'lucide-react'
import { LocationAutocomplete } from '../components/LocationAutocomplete'
import { useSearch } from '../contexts/SearchContext'

type PropertyCategory = 'full_house' | 'land_plot' | 'flat_apartment' | 'pg_hostel' | 'flatmates' | 'commercial'

export function MobileSearchPage() {
  const navigate = useNavigate()
  const [searchParams] = useSearchParams()
  const { listingType, setListingType, propertyCategory: searchCategory, setPropertyCategory: setSearchCategory } = useSearch()

  const [localities, setLocalities] = useState<Array<{ id: string; name: string }>>([])
  const [localityInput, setLocalityInput] = useState('')
  const [localityId, setLocalityId] = useState<string | undefined>()
  const [propertyCategory, setPropertyCategory] = useState<PropertyCategory>('full_house')
  const [bhkType, setBhkType] = useState('')
  const [propertyStatus, setPropertyStatus] = useState('')
  const [minBudget, setMinBudget] = useState('')
  const [maxBudget, setMaxBudget] = useState('')
  const [showLocationInput, setShowLocationInput] = useState(false)

  useEffect(() => {
    const category = searchParams.get('category')
    if (category) {
      setPropertyCategory(category as PropertyCategory)
    }
  }, [searchParams])

  const addLocality = () => {
    if (localityInput && localityId) {
      const newLocality = { id: localityId, name: localityInput }
      if (!localities.find(l => l.id === localityId)) {
        setLocalities([...localities, newLocality])
      }
      setLocalityInput('')
      setLocalityId(undefined)
      setShowLocationInput(false)
    }
  }

  const removeLocality = (id: string) => {
    setLocalities(localities.filter(l => l.id !== id))
  }

  const getSelectedFiltersCount = () => {
    let count = 0
    if (localities.length > 0) count += localities.length
    if (bhkType) count++
    if (propertyStatus) count++
    if (minBudget || maxBudget) count++
    return count
  }

  const resetFilters = () => {
    setLocalities([])
    setLocalityInput('')
    setLocalityId(undefined)
    setBhkType('')
    setPropertyStatus('')
    setMinBudget('')
    setMaxBudget('')
    setPropertyCategory('full_house')
  }

  const handleSearch = () => {
    const params = new URLSearchParams()

    if (propertyCategory) params.append('category', propertyCategory)
    if (searchCategory === 'commercial') {
      params.append('type', 'commercial')
    } else {
      params.append('type', listingType)
    }

    if (localities.length > 0) {
      params.append('localityId', localities[0].id)
    }

    if (bhkType) params.append('bhk', bhkType)
    if (propertyStatus) params.append('status', propertyStatus)
    if (minBudget) params.append('minPrice', minBudget)
    if (maxBudget) params.append('maxPrice', maxBudget)

    navigate(`/properties?${params.toString()}`)
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <div className="bg-red-600 text-white p-4 sticky top-0 z-50 shadow-lg">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <button onClick={() => navigate(-1)} className="p-1">
              <ArrowLeft className="h-6 w-6" />
            </button>
            <h1 className="text-lg font-bold">
              Filters {getSelectedFiltersCount() > 0 && `(${getSelectedFiltersCount()} Selected)`}
            </h1>
          </div>
          {getSelectedFiltersCount() > 0 && (
            <button onClick={resetFilters} className="text-sm font-semibold">
              Reset
            </button>
          )}
        </div>
      </div>

      <div className="pb-24">
        {/* Property Type Tabs */}
        <div className="bg-white p-4 mb-2 shadow-sm">
          <div className="flex gap-2 overflow-x-auto pb-2">
            <button
              onClick={() => {
                setSearchCategory('residential')
                setListingType('buy')
              }}
              className={`px-4 py-2 rounded-full font-medium text-sm whitespace-nowrap transition-all ${
                listingType === 'buy' && searchCategory === 'residential'
                  ? 'bg-red-600 text-white'
                  : 'bg-gray-100 text-gray-700'
              }`}
            >
              Buy
            </button>
            <button
              onClick={() => {
                setSearchCategory('residential')
                setListingType('rent')
              }}
              className={`px-4 py-2 rounded-full font-medium text-sm whitespace-nowrap transition-all ${
                listingType === 'rent' && searchCategory === 'residential'
                  ? 'bg-red-600 text-white'
                  : 'bg-gray-100 text-gray-700'
              }`}
            >
              Rent
            </button>
            <button
              onClick={() => setSearchCategory('commercial')}
              className={`px-4 py-2 rounded-full font-medium text-sm whitespace-nowrap transition-all ${
                searchCategory === 'commercial'
                  ? 'bg-red-600 text-white'
                  : 'bg-gray-100 text-gray-700'
              }`}
            >
              Commercial
            </button>
          </div>
        </div>

        {/* Action Cards */}
        <div className="px-4 py-4">
          <div className="grid grid-cols-2 gap-3">
            <button
              onClick={handleSearch}
              className="rounded-2xl bg-gradient-to-br from-red-500 to-red-600 text-white p-5 shadow-lg hover:shadow-xl transition-all active:scale-[0.98] text-left"
            >
              <Search className="h-6 w-6 mb-2" />
              <h3 className="text-base font-bold mb-1">Search Property</h3>
              <p className="text-xs opacity-90">Buy & Rent easily</p>
            </button>

            <button
              onClick={() => navigate('/add-property')}
              className="rounded-2xl bg-gradient-to-br from-orange-500 to-orange-600 text-white p-5 shadow-lg hover:shadow-xl transition-all active:scale-[0.98] text-left"
            >
              <Home className="h-6 w-6 mb-2" />
              <h3 className="text-base font-bold mb-1">Post Property</h3>
              <p className="text-xs opacity-90">100% Free</p>
            </button>
          </div>
        </div>

        {/* Location Search */}
        <div className="bg-white p-4 mb-2">
          <div className="flex items-center justify-between mb-3">
            <h2 className="text-sm font-semibold text-gray-900">
              You are searching in Visakhapatnam
            </h2>
            <button className="text-xs text-red-600 font-semibold">Edit</button>
          </div>

          <h3 className="text-sm font-semibold text-gray-900 mb-3">City/Localities/Projects</h3>

          {/* Selected Localities */}
          {localities.length > 0 && (
            <div className="flex flex-wrap gap-2 mb-3">
              {localities.map((locality) => (
                <div
                  key={locality.id}
                  className="bg-teal-50 text-teal-700 px-3 py-1.5 rounded-full text-sm font-medium flex items-center gap-2 border border-teal-200"
                >
                  {locality.name}
                  <button onClick={() => removeLocality(locality.id)} className="hover:text-teal-900">
                    <X className="h-4 w-4" />
                  </button>
                </div>
              ))}
            </div>
          )}

          {/* Add Locality */}
          {!showLocationInput ? (
            <button
              onClick={() => setShowLocationInput(true)}
              className="text-sm text-red-600 font-semibold flex items-center gap-1"
            >
              + Add Locality
            </button>
          ) : (
            <div className="space-y-2">
              <LocationAutocomplete
                value={localityInput}
                onChange={(value, id) => {
                  setLocalityInput(value)
                  setLocalityId(id)
                }}
                placeholder="Type 3+ characters to search localities"
                className="h-10 text-sm"
              />
              <div className="flex gap-2">
                <button
                  onClick={addLocality}
                  disabled={!localityInput || !localityId}
                  className="px-4 py-2 bg-red-600 text-white rounded-lg text-sm font-semibold disabled:bg-gray-300 disabled:cursor-not-allowed"
                >
                  Add
                </button>
                <button
                  onClick={() => {
                    setShowLocationInput(false)
                    setLocalityInput('')
                    setLocalityId(undefined)
                  }}
                  className="px-4 py-2 bg-gray-100 text-gray-700 rounded-lg text-sm font-semibold"
                >
                  Cancel
                </button>
              </div>
            </div>
          )}

          <button className="text-sm text-red-600 font-semibold flex items-center gap-1 mt-3">
            <MapPin className="h-4 w-4" />
            Use my Current Location
          </button>
        </div>

        {/* Budget Range */}
        <div className="bg-white p-4 mb-2">
          <h3 className="text-sm font-semibold text-gray-900 mb-3">Budget Range</h3>
          <div className="flex items-center gap-3">
            <select
              value={minBudget}
              onChange={(e) => setMinBudget(e.target.value)}
              className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm"
            >
              <option value="">Min</option>
              <option value="1000000">₹10 Lac</option>
              <option value="2000000">₹20 Lac</option>
              <option value="3000000">₹30 Lac</option>
              <option value="5000000">₹50 Lac</option>
              <option value="7000000">₹70 Lac</option>
              <option value="10000000">₹1 Cr</option>
              <option value="20000000">₹2 Cr</option>
              <option value="50000000">₹5 Cr</option>
            </select>
            <span className="text-gray-500 text-sm">to</span>
            <select
              value={maxBudget}
              onChange={(e) => setMaxBudget(e.target.value)}
              className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm"
            >
              <option value="">Max</option>
              <option value="2000000">₹20 Lac</option>
              <option value="3000000">₹30 Lac</option>
              <option value="5000000">₹50 Lac</option>
              <option value="7000000">₹70 Lac</option>
              <option value="10000000">₹1 Cr</option>
              <option value="20000000">₹2 Cr</option>
              <option value="50000000">₹5 Cr</option>
              <option value="100000000">₹10 Cr</option>
            </select>
          </div>
        </div>

        {/* Property Type */}
        {listingType === 'buy' && searchCategory === 'residential' && (
          <div className="bg-white p-4 mb-2">
            <h3 className="text-sm font-semibold text-gray-900 mb-3">Property Type</h3>
            <div className="space-y-2">
              <label className="flex items-center gap-3 p-3 border border-gray-200 rounded-lg cursor-pointer hover:bg-gray-50">
                <input
                  type="radio"
                  name="propertyCategory"
                  value="full_house"
                  checked={propertyCategory === 'full_house'}
                  onChange={(e) => setPropertyCategory(e.target.value as PropertyCategory)}
                  className="w-4 h-4 text-red-600"
                />
                <span className="text-sm font-medium text-gray-700">Full House</span>
              </label>
              <label className="flex items-center gap-3 p-3 border border-gray-200 rounded-lg cursor-pointer hover:bg-gray-50">
                <input
                  type="radio"
                  name="propertyCategory"
                  value="land_plot"
                  checked={propertyCategory === 'land_plot'}
                  onChange={(e) => setPropertyCategory(e.target.value as PropertyCategory)}
                  className="w-4 h-4 text-red-600"
                />
                <span className="text-sm font-medium text-gray-700">Land/Plot</span>
              </label>
              <label className="flex items-center gap-3 p-3 border border-gray-200 rounded-lg cursor-pointer hover:bg-gray-50">
                <input
                  type="radio"
                  name="propertyCategory"
                  value="flat_apartment"
                  checked={propertyCategory === 'flat_apartment'}
                  onChange={(e) => setPropertyCategory(e.target.value as PropertyCategory)}
                  className="w-4 h-4 text-red-600"
                />
                <span className="text-sm font-medium text-gray-700">Flat/Apartment</span>
              </label>
            </div>
          </div>
        )}

        {/* BHK Type */}
        {(propertyCategory === 'full_house' || propertyCategory === 'flat_apartment') && (
          <div className="bg-white p-4 mb-2">
            <h3 className="text-sm font-semibold text-gray-900 mb-3">BHK Type</h3>
            <div className="grid grid-cols-3 gap-2">
              {['1', '2', '3', '4', '5+'].map((bhk) => (
                <button
                  key={bhk}
                  onClick={() => setBhkType(bhkType === bhk ? '' : bhk)}
                  className={`py-2 px-3 rounded-lg text-sm font-medium transition-all ${
                    bhkType === bhk
                      ? 'bg-red-600 text-white'
                      : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                  }`}
                >
                  {bhk} BHK
                </button>
              ))}
            </div>
          </div>
        )}

        {/* Property Status */}
        {listingType === 'buy' && searchCategory === 'residential' && (
          <div className="bg-white p-4 mb-2">
            <h3 className="text-sm font-semibold text-gray-900 mb-3">Property Status</h3>
            <div className="grid grid-cols-2 gap-2">
              <button
                onClick={() => setPropertyStatus(propertyStatus === 'ready_to_move' ? '' : 'ready_to_move')}
                className={`py-2 px-3 rounded-lg text-sm font-medium transition-all ${
                  propertyStatus === 'ready_to_move'
                    ? 'bg-red-600 text-white'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                Ready to Move
              </button>
              <button
                onClick={() => setPropertyStatus(propertyStatus === 'under_construction' ? '' : 'under_construction')}
                className={`py-2 px-3 rounded-lg text-sm font-medium transition-all ${
                  propertyStatus === 'under_construction'
                    ? 'bg-red-600 text-white'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                Under Construction
              </button>
            </div>
          </div>
        )}

        {/* Rent Specific */}
        {listingType === 'rent' && searchCategory === 'residential' && (
          <div className="bg-white p-4 mb-2">
            <h3 className="text-sm font-semibold text-gray-900 mb-3">Property Type</h3>
            <div className="space-y-2">
              <label className="flex items-center gap-3 p-3 border border-gray-200 rounded-lg cursor-pointer hover:bg-gray-50">
                <input
                  type="radio"
                  name="propertyCategory"
                  value="full_house"
                  checked={propertyCategory === 'full_house'}
                  onChange={(e) => setPropertyCategory(e.target.value as PropertyCategory)}
                  className="w-4 h-4 text-red-600"
                />
                <span className="text-sm font-medium text-gray-700">Full House</span>
              </label>
              <label className="flex items-center gap-3 p-3 border border-gray-200 rounded-lg cursor-pointer hover:bg-gray-50">
                <input
                  type="radio"
                  name="propertyCategory"
                  value="flat_apartment"
                  checked={propertyCategory === 'flat_apartment'}
                  onChange={(e) => setPropertyCategory(e.target.value as PropertyCategory)}
                  className="w-4 h-4 text-red-600"
                />
                <span className="text-sm font-medium text-gray-700">Flat/Apartment</span>
              </label>
              <label className="flex items-center gap-3 p-3 border border-gray-200 rounded-lg cursor-pointer hover:bg-gray-50">
                <input
                  type="radio"
                  name="propertyCategory"
                  value="pg_hostel"
                  checked={propertyCategory === 'pg_hostel'}
                  onChange={(e) => setPropertyCategory(e.target.value as PropertyCategory)}
                  className="w-4 h-4 text-red-600"
                />
                <span className="text-sm font-medium text-gray-700">PG/Hostel</span>
              </label>
              <label className="flex items-center gap-3 p-3 border border-gray-200 rounded-lg cursor-pointer hover:bg-gray-50">
                <input
                  type="radio"
                  name="propertyCategory"
                  value="flatmates"
                  checked={propertyCategory === 'flatmates'}
                  onChange={(e) => setPropertyCategory(e.target.value as PropertyCategory)}
                  className="w-4 h-4 text-red-600"
                />
                <span className="text-sm font-medium text-gray-700">Flatmates</span>
              </label>
            </div>
          </div>
        )}
      </div>

      {/* Fixed Bottom Button */}
      <div className="fixed bottom-0 left-0 right-0 bg-white p-4 shadow-lg border-t border-gray-200">
        <button
          onClick={handleSearch}
          className="w-full bg-red-600 text-white py-3 rounded-lg font-bold text-base hover:bg-red-700 transition-colors flex items-center justify-center gap-2"
        >
          <Search className="h-5 w-5" />
          View Properties
        </button>
      </div>
    </div>
  )
}
