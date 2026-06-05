import { useState } from 'react'
import { Search, Home, Building2, MapPin, Droplets, Car, Wifi, Dumbbell, Shield, Package, ChevronDown } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import { LocationAutocomplete } from './LocationAutocomplete'

type ListingType = 'buy' | 'rent' | 'projects' | 'commercial'
type PropertyType = 'flat' | 'house' | 'plot'
type AreaUnit = 'sqft' | 'sqm' | 'acre' | 'cents'

export function MagicBricksSearchCard() {
  const navigate = useNavigate()
  const [listingType, setListingType] = useState<ListingType>('buy')
  const [propertyType, setPropertyType] = useState<PropertyType>('flat')
  const [locality, setLocality] = useState('')
  const [localityId, setLocalityId] = useState<string | null>(null)
  const [minBudget, setMinBudget] = useState('')
  const [maxBudget, setMaxBudget] = useState('')
  const [selectedBedrooms, setSelectedBedrooms] = useState<number[]>([])
  const [possessionStatus, setPossessionStatus] = useState<string[]>([])
  const [minArea, setMinArea] = useState('')
  const [maxArea, setMaxArea] = useState('')
  const [areaUnit, setAreaUnit] = useState<AreaUnit>('sqft')
  const [saleType, setSaleType] = useState<string[]>([])
  const [postedBy, setPostedBy] = useState<string[]>([])
  const [furnishingStatus, setFurnishingStatus] = useState<string[]>([])
  const [selectedAmenities, setSelectedAmenities] = useState<string[]>([])
  const [showFilters, setShowFilters] = useState(false)

  const getSelectedCount = () => {
    let count = 0
    if (selectedBedrooms.length > 0) count++
    if (possessionStatus.length > 0) count++
    if (minArea || maxArea) count++
    if (saleType.length > 0) count++
    if (postedBy.length > 0) count++
    if (furnishingStatus.length > 0) count++
    if (selectedAmenities.length > 0) count++
    return count
  }

  const toggleBedroom = (bhk: number) => {
    setSelectedBedrooms(prev =>
      prev.includes(bhk) ? prev.filter(b => b !== bhk) : [...prev, bhk]
    )
  }

  const togglePossession = (status: string) => {
    setPossessionStatus(prev =>
      prev.includes(status) ? prev.filter(s => s !== status) : [...prev, status]
    )
  }

  const toggleSaleType = (type: string) => {
    setSaleType(prev =>
      prev.includes(type) ? prev.filter(t => t !== type) : [...prev, type]
    )
  }

  const togglePostedBy = (type: string) => {
    setPostedBy(prev =>
      prev.includes(type) ? prev.filter(t => t !== type) : [...prev, type]
    )
  }

  const toggleFurnishing = (status: string) => {
    setFurnishingStatus(prev =>
      prev.includes(status) ? prev.filter(s => s !== status) : [...prev, status]
    )
  }

  const toggleAmenity = (amenity: string) => {
    setSelectedAmenities(prev =>
      prev.includes(amenity) ? prev.filter(a => a !== amenity) : [...prev, amenity]
    )
  }

  const resetFilters = () => {
    setMinBudget('')
    setMaxBudget('')
    setSelectedBedrooms([])
    setPossessionStatus([])
    setMinArea('')
    setMaxArea('')
    setAreaUnit('sqft')
    setSaleType([])
    setPostedBy([])
    setFurnishingStatus([])
    setSelectedAmenities([])
  }

  const handleSearch = () => {
    const params = new URLSearchParams()
    if (locality) params.append('locality', locality)
    if (localityId) params.append('localityId', localityId)
    params.append('listingType', listingType === 'buy' ? 'sale' : listingType)

    let category = 'flat_apartment'
    if (listingType === 'commercial') {
      category = 'commercial'
    } else if (listingType === 'rent' && propertyType === 'plot') {
      category = 'pg_hostel'
    } else {
      if (propertyType === 'house') category = 'full_house'
      if (propertyType === 'plot') category = 'land_plot'
    }
    params.append('category', category)

    if (minBudget) params.append('minPrice', minBudget)
    if (maxBudget) params.append('maxPrice', maxBudget)
    if (selectedBedrooms.length > 0) params.append('bedrooms', selectedBedrooms.join(','))
    if (possessionStatus.length > 0) params.append('possession', possessionStatus.join(','))
    if (minArea) params.append('minArea', minArea)
    if (maxArea) params.append('maxArea', maxArea)
    if (areaUnit) params.append('areaUnit', areaUnit)
    if (saleType.length > 0) params.append('saleType', saleType.join(','))
    if (postedBy.length > 0) params.append('postedBy', postedBy.join(','))
    if (furnishingStatus.length > 0) params.append('furnishing', furnishingStatus.join(','))
    if (selectedAmenities.length > 0) params.append('amenities', selectedAmenities.join(','))

    navigate(`/properties?${params.toString()}`)
  }

  const getAreaUnitOptions = () => {
    if (propertyType === 'plot') {
      return [
        { value: 'sqft', label: 'Sqft' },
        { value: 'sqm', label: 'Sq.m' },
        { value: 'acre', label: 'Acre' },
        { value: 'cents', label: 'Cents' }
      ]
    }
    return [
      { value: 'sqft', label: 'Sqft' },
      { value: 'sqm', label: 'Sq.m' }
    ]
  }

  const amenitiesList = [
    { icon: Droplets, label: 'Water Supply', value: 'water_supply' },
    { icon: Car, label: 'Parking', value: 'parking' },
    { icon: Wifi, label: 'WiFi', value: 'wifi' },
    { icon: Dumbbell, label: 'Gym', value: 'gym' },
    { icon: Shield, label: 'Security', value: 'security' },
    { icon: Package, label: 'Lift', value: 'lift' }
  ]

  return (
    <div className="md:hidden bg-white shadow-lg rounded-2xl overflow-hidden mx-4 my-4">
      {/* Header */}
      <div className="bg-gradient-to-r from-red-600 to-red-700 text-white p-4 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <Search className="h-5 w-5" />
          <h2 className="text-lg font-bold">
            {showFilters ? `Filters (${getSelectedCount()} Selected)` : 'Search Property'}
          </h2>
        </div>
        {showFilters && getSelectedCount() > 0 && (
          <button
            onClick={resetFilters}
            className="text-sm font-medium px-3 py-1 bg-white/20 rounded-full hover:bg-white/30 transition"
          >
            Reset
          </button>
        )}
      </div>

      {/* Listing Type Tabs */}
      <div className="flex border-b border-gray-200 bg-gray-50">
        <button
          onClick={() => setListingType('buy')}
          className={`flex-1 py-3 px-4 text-sm font-semibold transition ${
            listingType === 'buy'
              ? 'bg-white text-red-600 border-b-2 border-red-600'
              : 'text-gray-600'
          }`}
        >
          Buy
        </button>
        <button
          onClick={() => setListingType('rent')}
          className={`flex-1 py-3 px-4 text-sm font-semibold transition ${
            listingType === 'rent'
              ? 'bg-white text-red-600 border-b-2 border-red-600'
              : 'text-gray-600'
          }`}
        >
          Rent
        </button>
        <button
          onClick={() => setListingType('projects')}
          className={`flex-1 py-3 px-4 text-sm font-semibold transition ${
            listingType === 'projects'
              ? 'bg-white text-red-600 border-b-2 border-red-600'
              : 'text-gray-600'
          }`}
        >
          Projects
        </button>
        <button
          onClick={() => setListingType('commercial')}
          className={`flex-1 py-3 px-4 text-sm font-semibold transition ${
            listingType === 'commercial'
              ? 'bg-white text-red-600 border-b-2 border-red-600'
              : 'text-gray-600'
          }`}
        >
          Commercial
        </button>
      </div>

      <div className="p-4 space-y-4">
        {/* Location Search */}
        <div>
          <label className="block text-sm font-semibold text-gray-700 mb-2">Search Locality</label>
          <LocationAutocomplete
            value={locality}
            onChange={(value, id) => {
              setLocality(value)
              setLocalityId(id || null)
            }}
            placeholder="Type locality name..."
            className="w-full"
          />
        </div>

        {/* Budget Range */}
        <div>
          <label className="block text-sm font-semibold text-gray-700 mb-2">Budget Range</label>
          <div className="flex items-center gap-2">
            {listingType === 'rent' ? (
              <>
                <select
                  value={minBudget}
                  onChange={(e) => setMinBudget(e.target.value)}
                  className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-red-500 focus:border-transparent"
                >
                  <option value="">₹ Min</option>
                  <option value="5000">₹ 5,000</option>
                  <option value="10000">₹ 10,000</option>
                  <option value="15000">₹ 15,000</option>
                  <option value="20000">₹ 20,000</option>
                  <option value="30000">₹ 30,000</option>
                  <option value="50000">₹ 50,000</option>
                </select>
                <span className="text-gray-500 text-sm">to</span>
                <select
                  value={maxBudget}
                  onChange={(e) => setMaxBudget(e.target.value)}
                  className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-red-500 focus:border-transparent"
                >
                  <option value="">₹ Max</option>
                  <option value="10000">₹ 10,000</option>
                  <option value="15000">₹ 15,000</option>
                  <option value="20000">₹ 20,000</option>
                  <option value="30000">₹ 30,000</option>
                  <option value="50000">₹ 50,000</option>
                  <option value="100000">₹ 1 Lac+</option>
                </select>
              </>
            ) : (
              <>
                <select
                  value={minBudget}
                  onChange={(e) => setMinBudget(e.target.value)}
                  className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-red-500 focus:border-transparent"
                >
                  <option value="">₹ Min</option>
                  <option value="1000000">₹ 10 Lac</option>
                  <option value="2000000">₹ 20 Lac</option>
                  <option value="3000000">₹ 30 Lac</option>
                  <option value="5000000">₹ 50 Lac</option>
                  <option value="7000000">₹ 70 Lac</option>
                  <option value="10000000">₹ 1 Cr</option>
                  <option value="20000000">₹ 2 Cr</option>
                </select>
                <span className="text-gray-500 text-sm">to</span>
                <select
                  value={maxBudget}
                  onChange={(e) => setMaxBudget(e.target.value)}
                  className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-red-500 focus:border-transparent"
                >
                  <option value="">₹ Max</option>
                  <option value="2000000">₹ 20 Lac</option>
                  <option value="3000000">₹ 30 Lac</option>
                  <option value="5000000">₹ 50 Lac</option>
                  <option value="7000000">₹ 70 Lac</option>
                  <option value="10000000">₹ 1 Cr</option>
                  <option value="20000000">₹ 2 Cr</option>
                  <option value="50000000">₹ 5 Cr</option>
                </select>
              </>
            )}
          </div>
        </div>

        {/* Property Type */}
        <div>
          <label className="block text-sm font-semibold text-gray-700 mb-2">Property Type</label>
          <div className="grid grid-cols-3 gap-2">
            {listingType === 'commercial' ? (
              <>
                <button
                  onClick={() => setPropertyType('flat')} // maps to Office
                  className={`p-4 rounded-xl border-2 transition flex flex-col items-center gap-2 ${
                    propertyType === 'flat'
                      ? 'border-red-600 bg-red-50 text-red-600'
                      : 'border-gray-200 text-gray-700'
                  }`}
                >
                  <Building2 className="h-6 w-6" />
                  <span className="text-xs font-semibold">Office</span>
                </button>
                <button
                  onClick={() => setPropertyType('house')} // maps to Shop
                  className={`p-4 rounded-xl border-2 transition flex flex-col items-center gap-2 ${
                    propertyType === 'house'
                      ? 'border-red-600 bg-red-50 text-red-600'
                      : 'border-gray-200 text-gray-700'
                  }`}
                >
                  <Home className="h-6 w-6" />
                  <span className="text-xs font-semibold">Shop</span>
                </button>
                <button
                  onClick={() => setPropertyType('plot')} // maps to Warehouse
                  className={`p-4 rounded-xl border-2 transition flex flex-col items-center gap-2 ${
                    propertyType === 'plot'
                      ? 'border-red-600 bg-red-50 text-red-600'
                      : 'border-gray-200 text-gray-700'
                  }`}
                >
                  <MapPin className="h-6 w-6" />
                  <span className="text-xs font-semibold">Warehouse</span>
                </button>
              </>
            ) : listingType === 'rent' ? (
              <>
                <button
                  onClick={() => setPropertyType('flat')}
                  className={`p-4 rounded-xl border-2 transition flex flex-col items-center gap-2 ${
                    propertyType === 'flat'
                      ? 'border-red-600 bg-red-50 text-red-600'
                      : 'border-gray-200 text-gray-700'
                  }`}
                >
                  <Building2 className="h-6 w-6" />
                  <span className="text-xs font-semibold">Flat</span>
                </button>
                <button
                  onClick={() => setPropertyType('house')}
                  className={`p-4 rounded-xl border-2 transition flex flex-col items-center gap-2 ${
                    propertyType === 'house'
                      ? 'border-red-600 bg-red-50 text-red-600'
                      : 'border-gray-200 text-gray-700'
                  }`}
                >
                  <Home className="h-6 w-6" />
                  <span className="text-xs font-semibold">House/Villa</span>
                </button>
                <button
                  onClick={() => setPropertyType('plot')} // represents PG/Hostel in Rent context
                  className={`p-4 rounded-xl border-2 transition flex flex-col items-center gap-2 ${
                    propertyType === 'plot'
                      ? 'border-red-600 bg-red-50 text-red-600'
                      : 'border-gray-200 text-gray-700'
                  }`}
                >
                  <MapPin className="h-6 w-6" />
                  <span className="text-xs font-semibold">PG/Hostel</span>
                </button>
              </>
            ) : (
              <>
                <button
                  onClick={() => setPropertyType('flat')}
                  className={`p-4 rounded-xl border-2 transition flex flex-col items-center gap-2 ${
                    propertyType === 'flat'
                      ? 'border-red-600 bg-red-50 text-red-600'
                      : 'border-gray-200 text-gray-700'
                  }`}
                >
                  <Building2 className="h-6 w-6" />
                  <span className="text-xs font-semibold">Flat</span>
                </button>
                <button
                  onClick={() => setPropertyType('house')}
                  className={`p-4 rounded-xl border-2 transition flex flex-col items-center gap-2 ${
                    propertyType === 'house'
                      ? 'border-red-600 bg-red-50 text-red-600'
                      : 'border-gray-200 text-gray-700'
                  }`}
                >
                  <Home className="h-6 w-6" />
                  <span className="text-xs font-semibold">House/Villa</span>
                </button>
                <button
                  onClick={() => setPropertyType('plot')}
                  className={`p-4 rounded-xl border-2 transition flex flex-col items-center gap-2 ${
                    propertyType === 'plot'
                      ? 'border-red-600 bg-red-50 text-red-600'
                      : 'border-gray-200 text-gray-700'
                  }`}
                >
                  <MapPin className="h-6 w-6" />
                  <span className="text-xs font-semibold">Plot</span>
                </button>
              </>
            )}
          </div>
        </div>

        {/* More Filters Button */}
        <button
          onClick={() => setShowFilters(!showFilters)}
          className="w-full py-3 px-4 border-2 border-red-600 text-red-600 rounded-lg font-semibold flex items-center justify-between hover:bg-red-50 transition"
        >
          <span>More Filters {getSelectedCount() > 0 && `(${getSelectedCount()})`}</span>
          <ChevronDown className={`h-5 w-5 transition-transform ${showFilters ? 'rotate-180' : ''}`} />
        </button>

        {/* Expanded Filters */}
        {showFilters && (
          <div className="space-y-4 pt-2">
            {/* Bedrooms - Only for Flat/House */}
            {propertyType !== 'plot' && (
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-2">No. of Bedrooms</label>
                <div className="flex flex-wrap gap-2">
                  {[1, 2, 3, 4].map((bhk) => (
                    <button
                      key={bhk}
                      onClick={() => toggleBedroom(bhk)}
                      className={`px-4 py-2 rounded-full text-sm border-2 font-medium transition ${
                        selectedBedrooms.includes(bhk)
                          ? 'border-red-600 bg-red-50 text-red-600'
                          : 'border-gray-300 text-gray-700'
                      }`}
                    >
                      {bhk} BHK
                    </button>
                  ))}
                </div>
              </div>
            )}

            {/* Possession Status - Only for Flat/House */}
            {propertyType !== 'plot' && (
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-2">Possession Status</label>
                <div className="flex flex-wrap gap-2">
                  <button
                    onClick={() => togglePossession('under_construction')}
                    className={`px-4 py-2 rounded-full text-sm border-2 font-medium transition ${
                      possessionStatus.includes('under_construction')
                        ? 'border-red-600 bg-red-50 text-red-600'
                        : 'border-gray-300 text-gray-700'
                    }`}
                  >
                    Under Construction
                  </button>
                  <button
                    onClick={() => togglePossession('ready_to_move')}
                    className={`px-4 py-2 rounded-full text-sm border-2 font-medium transition ${
                      possessionStatus.includes('ready_to_move')
                        ? 'border-red-600 bg-red-50 text-red-600'
                        : 'border-gray-300 text-gray-700'
                    }`}
                  >
                    Ready to Move
                  </button>
                </div>
              </div>
            )}

            {/* Covered Area */}
            <div>
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                {propertyType === 'plot' ? 'Plot Area' : 'Covered Area'}
              </label>
              <div className="flex items-center gap-2 mb-2">
                <select
                  value={areaUnit}
                  onChange={(e) => setAreaUnit(e.target.value as AreaUnit)}
                  className="px-3 py-2 border border-gray-300 rounded-lg text-sm font-medium focus:ring-2 focus:ring-red-500"
                >
                  {getAreaUnitOptions().map(option => (
                    <option key={option.value} value={option.value}>{option.label}</option>
                  ))}
                </select>
              </div>
              <div className="flex items-center gap-2">
                <input
                  type="number"
                  placeholder="Min"
                  value={minArea}
                  onChange={(e) => setMinArea(e.target.value)}
                  className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-red-500"
                />
                <span className="text-gray-500 text-sm">to</span>
                <input
                  type="number"
                  placeholder="Max"
                  value={maxArea}
                  onChange={(e) => setMaxArea(e.target.value)}
                  className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-2 focus:ring-red-500"
                />
              </div>
            </div>

            {/* Sale Type - Only for Flat/House */}
            {propertyType !== 'plot' && listingType === 'buy' && (
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-2">Sale Type</label>
                <div className="flex flex-wrap gap-2">
                  <button
                    onClick={() => toggleSaleType('new')}
                    className={`px-4 py-2 rounded-full text-sm border-2 font-medium transition ${
                      saleType.includes('new')
                        ? 'border-red-600 bg-red-50 text-red-600'
                        : 'border-gray-300 text-gray-700'
                    }`}
                  >
                    New
                  </button>
                  <button
                    onClick={() => toggleSaleType('resale')}
                    className={`px-4 py-2 rounded-full text-sm border-2 font-medium transition ${
                      saleType.includes('resale')
                        ? 'border-red-600 bg-red-50 text-red-600'
                        : 'border-gray-300 text-gray-700'
                    }`}
                  >
                    Resale
                  </button>
                </div>
              </div>
            )}

            {/* Posted By */}
            <div>
              <label className="block text-sm font-semibold text-gray-700 mb-2">Posted By</label>
              <div className="flex flex-wrap gap-2">
                <button
                  onClick={() => togglePostedBy('owner')}
                  className={`px-4 py-2 rounded-full text-sm border-2 font-medium transition ${
                    postedBy.includes('owner')
                      ? 'border-red-600 bg-red-50 text-red-600'
                      : 'border-gray-300 text-gray-700'
                  }`}
                >
                  Owner
                </button>
                <button
                  onClick={() => togglePostedBy('agent')}
                  className={`px-4 py-2 rounded-full text-sm border-2 font-medium transition ${
                    postedBy.includes('agent')
                      ? 'border-red-600 bg-red-50 text-red-600'
                      : 'border-gray-300 text-gray-700'
                  }`}
                >
                  Agent
                </button>
                <button
                  onClick={() => togglePostedBy('builder')}
                  className={`px-4 py-2 rounded-full text-sm border-2 font-medium transition ${
                    postedBy.includes('builder')
                      ? 'border-red-600 bg-red-50 text-red-600'
                      : 'border-gray-300 text-gray-700'
                  }`}
                >
                  Builder
                </button>
              </div>
            </div>

            {/* Furnishing Status - Only for Flat/House */}
            {propertyType !== 'plot' && (
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-2">Furnishing Status</label>
                <div className="flex flex-wrap gap-2">
                  <button
                    onClick={() => toggleFurnishing('furnished')}
                    className={`px-4 py-2 rounded-full text-sm border-2 font-medium transition ${
                      furnishingStatus.includes('furnished')
                        ? 'border-red-600 bg-red-50 text-red-600'
                        : 'border-gray-300 text-gray-700'
                    }`}
                  >
                    Furnished
                  </button>
                  <button
                    onClick={() => toggleFurnishing('semi_furnished')}
                    className={`px-4 py-2 rounded-full text-sm border-2 font-medium transition ${
                      furnishingStatus.includes('semi_furnished')
                        ? 'border-red-600 bg-red-50 text-red-600'
                        : 'border-gray-300 text-gray-700'
                    }`}
                  >
                    Semi-Furnished
                  </button>
                  <button
                    onClick={() => toggleFurnishing('unfurnished')}
                    className={`px-4 py-2 rounded-full text-sm border-2 font-medium transition ${
                      furnishingStatus.includes('unfurnished')
                        ? 'border-red-600 bg-red-50 text-red-600'
                        : 'border-gray-300 text-gray-700'
                    }`}
                  >
                    Unfurnished
                  </button>
                </div>
              </div>
            )}

            {/* Amenities */}
            <div>
              <label className="block text-sm font-semibold text-gray-700 mb-2">Amenities</label>
              <div className="grid grid-cols-2 gap-2">
                {amenitiesList.map((amenity) => (
                  <button
                    key={amenity.value}
                    onClick={() => toggleAmenity(amenity.value)}
                    className={`p-3 rounded-lg border-2 text-sm font-medium transition flex items-center gap-2 ${
                      selectedAmenities.includes(amenity.value)
                        ? 'border-red-600 bg-red-50 text-red-600'
                        : 'border-gray-300 text-gray-700'
                    }`}
                  >
                    <amenity.icon className="h-4 w-4" />
                    <span className="text-xs">{amenity.label}</span>
                  </button>
                ))}
              </div>
            </div>
          </div>
        )}

        {/* Search Button */}
        <button
          onClick={handleSearch}
          className="w-full bg-gradient-to-r from-red-600 to-red-700 text-white py-4 rounded-xl font-bold text-base shadow-lg hover:shadow-xl transition-all transform hover:scale-[1.02] active:scale-[0.98] flex items-center justify-center gap-2"
        >
          <Search className="h-5 w-5" />
          <span>Search Properties</span>
        </button>
      </div>
    </div>
  )
}
