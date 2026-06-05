import { Home, Building2, LandPlot, Warehouse } from 'lucide-react'
import { useSearch } from '../contexts/SearchContext'

export function FiltersPanel() {
  const {
    listingType,
    setListingType,
    propertyCategory,
    setPropertyCategory,
    propertySubType,
    setPropertySubType,
    bhkFilter,
    setBhkFilter,
    priceRange,
    setPriceRange,
    possessionStatus,
    setPossessionStatus,
    saleType,
    setSaleType,
    postedBy,
    setPostedBy,
    furnishingStatus,
    setFurnishingStatus,
    amenities,
    setAmenities,
    coveredArea,
    setCoveredArea,
    areaUnit,
    setAreaUnit,
    resetFilters,
  } = useSearch()

  const toggleArrayValue = (arr: string[], value: string, setter: (v: string[]) => void) => {
    if (arr.includes(value)) {
      setter(arr.filter(v => v !== value))
    } else {
      setter([...arr, value])
    }
  }

  const propertyTypeOptions = listingType === 'buy' && propertyCategory === 'residential'
    ? [
        { label: 'Flat', value: 'Flat / Apartment', icon: Building2 },
        { label: 'Villa', value: 'Villa', icon: Home },
        { label: 'Plot', value: 'Land / Plot', icon: LandPlot },
      ]
    : listingType === 'rent' && propertyCategory === 'residential'
    ? [
        { label: 'Flat', value: 'Flat / Apartment', icon: Building2 },
        { label: 'Villa', value: 'Villa', icon: Home },
        { label: 'PG', value: 'PG / Hostel', icon: Home },
      ]
    : [
        { label: 'Office', value: 'Office Space', icon: Building2 },
        { label: 'Shop', value: 'Shop / Showroom', icon: Warehouse },
        { label: 'Warehouse', value: 'Warehouse', icon: Warehouse },
      ]

  const bhkOptions = ['1 BHK', '2 BHK', '3 BHK', '4 BHK', '5+ BHK']

  return (
    <div className="space-y-4">
      {/* Category Tabs (Specifically for Mobile Modal context, visible everywhere for ease) */}
      <div>
        <label className="block text-sm font-semibold text-gray-800 mb-2">
          I want to...
        </label>
        <div className="flex rounded-xl overflow-hidden border border-gray-200">
          {['buy', 'rent', 'projects', 'commercial'].map((type) => {
            const isSelected = 
              type === 'projects' 
                ? (listingType === 'buy' && propertySubType === 'Land / Plot') // Projects represent plots here
                : type === listingType

            const handleTabClick = () => {
              if (type === 'projects') {
                setListingType('buy')
                setPropertyCategory('residential')
                setPropertySubType('Land / Plot')
              } else if (type === 'commercial') {
                setListingType('commercial')
                setPropertyCategory('commercial')
                setPropertySubType('Office Space')
              } else {
                setListingType(type as 'buy' | 'rent')
                setPropertyCategory('residential')
                setPropertySubType('Flat / Apartment')
              }
            }

            return (
              <button
                key={type}
                type="button"
                onClick={handleTabClick}
                className={`flex-1 py-2 text-xs font-semibold transition-colors ${
                  isSelected
                    ? type === 'buy'
                      ? 'bg-blue-600 text-white'
                      : type === 'rent'
                      ? 'bg-red-500 text-white'
                      : type === 'projects'
                      ? 'bg-green-600 text-white'
                      : 'bg-purple-600 text-white'
                    : 'bg-white text-gray-600 hover:bg-gray-50'
                }`}
              >
                {type.toUpperCase()}
              </button>
            )
          })}
        </div>
      </div>

      <div className="flex items-center justify-between border-t border-gray-100 pt-3 mb-2">
        <h3 className="font-bold text-base text-gray-900">Filters</h3>
        <button
          onClick={resetFilters}
          className="text-sm text-red-500 font-medium hover:text-red-600"
        >
          Reset
        </button>
      </div>

      {/* Property Type */}
      <div>
        <label className="block text-sm font-semibold text-gray-800 mb-3">
          Property Type
        </label>
        <div className="grid grid-cols-3 gap-3">
          {propertyTypeOptions.map((option) => {
            const Icon = option.icon
            const isSelected = propertySubType === option.value
            return (
              <button
                key={option.value}
                onClick={() => setPropertySubType(option.value)}
                className={`rounded-xl border p-3 transition-all ${
                  isSelected
                    ? 'border-blue-500 bg-blue-50 shadow-sm'
                    : 'border-gray-200 bg-white hover:border-gray-300'
                }`}
              >
                <Icon className={`h-6 w-6 mx-auto mb-1 ${isSelected ? 'text-blue-600' : 'text-gray-600'}`} />
                <p className={`text-xs font-medium ${isSelected ? 'text-blue-700' : 'text-gray-700'}`}>
                  {option.label}
                </p>
              </button>
            )
          })}
        </div>
      </div>

      {/* Price Range */}
      <div>
        <label className="block text-sm font-semibold text-gray-800 mb-2">
          Budget
        </label>
        <div className="flex items-center gap-2">
          <input
            type="number"
            placeholder="Min"
            value={priceRange[0] || ''}
            onChange={(e) => setPriceRange([parseInt(e.target.value) || 0, priceRange[1]])}
            className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none"
          />
          <span className="text-gray-500 text-sm">to</span>
          <input
            type="number"
            placeholder="Max"
            value={priceRange[1] >= 10000000 ? '' : priceRange[1]}
            onChange={(e) => setPriceRange([priceRange[0], parseInt(e.target.value) || 10000000])}
            className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none"
          />
        </div>
      </div>

      {/* BHK Type */}
      {(propertySubType === 'Flat / Apartment' || propertySubType === 'Villa' || propertySubType === 'PG / Hostel') && (
        <div>
          <label className="block text-sm font-semibold text-gray-800 mb-3">
            No. of Bedrooms
          </label>
          <div className="grid grid-cols-3 gap-2">
            {bhkOptions.map((bhk) => {
              const bhkValue = bhk.replace(' BHK', '').replace('+', '')
              const isSelected = bhkFilter === bhkValue
              return (
                <button
                  key={bhk}
                  onClick={() => setBhkFilter(isSelected ? '' : bhkValue)}
                  className={`py-2 px-3 rounded-lg text-sm font-medium transition-all ${
                    isSelected
                      ? 'bg-teal-500 text-white shadow-sm'
                      : 'bg-white border border-gray-300 text-gray-700 hover:border-gray-400'
                  }`}
                >
                  {bhk}
                </button>
              )
            })}
          </div>
        </div>
      )}

      {/* Possession Status */}
      {listingType === 'buy' && propertySubType !== 'Land / Plot' && (
        <div>
          <label className="block text-sm font-semibold text-gray-800 mb-3">
            Possession Status
          </label>
          <div className="flex flex-wrap gap-2">
            {['Under Construction', 'Ready to Move'].map((status) => {
              const isSelected = possessionStatus.includes(status)
              return (
                <button
                  key={status}
                  onClick={() => toggleArrayValue(possessionStatus, status, setPossessionStatus)}
                  className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                    isSelected
                      ? 'bg-blue-100 text-blue-700 border border-blue-300'
                      : 'bg-white border border-gray-300 text-gray-700 hover:border-gray-400'
                  }`}
                >
                  {status}
                </button>
              )
            })}
          </div>
        </div>
      )}

      {/* Covered Area */}
      <div>
        <label className="block text-sm font-semibold text-gray-800 mb-2">
          Covered Area
        </label>
        <div className="space-y-2">
          <div className="flex items-center gap-2">
            <input
              type="number"
              placeholder="Min"
              value={coveredArea[0] || ''}
              onChange={(e) => setCoveredArea([parseInt(e.target.value) || 0, coveredArea[1]])}
              className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none"
            />
            <span className="text-gray-500 text-sm">to</span>
            <input
              type="number"
              placeholder="Max"
              value={coveredArea[1] >= 10000 ? '' : coveredArea[1]}
              onChange={(e) => setCoveredArea([coveredArea[0], parseInt(e.target.value) || 10000])}
              className="flex-1 px-3 py-2 border border-gray-300 rounded-lg text-sm focus:border-blue-500 focus:ring-1 focus:ring-blue-500 outline-none"
            />
          </div>
          <div className="flex gap-2">
            {['sqft', 'sqyd', 'sqm'].map((unit) => (
              <button
                key={unit}
                onClick={() => setAreaUnit(unit)}
                className={`flex-1 py-1.5 rounded-lg text-xs font-medium transition-all ${
                  areaUnit === unit
                    ? 'bg-gray-800 text-white'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
              >
                {unit.toUpperCase()}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Sale Type */}
      {listingType === 'buy' && (
        <div>
          <label className="block text-sm font-semibold text-gray-800 mb-3">
            Sale Type
          </label>
          <div className="flex flex-wrap gap-2">
            {['New', 'Resale'].map((type) => {
              const isSelected = saleType.includes(type)
              return (
                <button
                  key={type}
                  onClick={() => toggleArrayValue(saleType, type, setSaleType)}
                  className={`px-4 py-2 rounded-lg text-sm font-medium transition-all ${
                    isSelected
                      ? 'bg-green-100 text-green-700 border border-green-300'
                      : 'bg-white border border-gray-300 text-gray-700 hover:border-gray-400'
                  }`}
                >
                  {type}
                </button>
              )
            })}
          </div>
        </div>
      )}

      {/* Posted By */}
      <div>
        <label className="block text-sm font-semibold text-gray-800 mb-3">
          Posted By
        </label>
        <div className="grid grid-cols-3 gap-2">
          {['Owner', 'Agent', 'Builder'].map((poster) => {
            const isSelected = postedBy.includes(poster)
            return (
              <button
                key={poster}
                onClick={() => toggleArrayValue(postedBy, poster, setPostedBy)}
                className={`py-2 px-2 rounded-lg text-xs font-medium transition-all ${
                  isSelected
                    ? 'bg-purple-100 text-purple-700 border border-purple-300'
                    : 'bg-white border border-gray-300 text-gray-700 hover:border-gray-400'
                }`}
              >
                {poster}
              </button>
            )
          })}
        </div>
      </div>

      {/* Furnishing Status */}
      {propertySubType !== 'Land / Plot' && (
        <div>
          <label className="block text-sm font-semibold text-gray-800 mb-3">
            Furnishing Status
          </label>
          <div className="grid grid-cols-3 gap-2">
            {['Furnished', 'Semi-Furnished', 'Unfurnished'].map((status) => {
              const isSelected = furnishingStatus.includes(status)
              return (
                <button
                  key={status}
                  onClick={() => toggleArrayValue(furnishingStatus, status, setFurnishingStatus)}
                  className={`py-2 px-2 rounded-lg text-xs font-medium transition-all ${
                    isSelected
                      ? 'bg-orange-100 text-orange-700 border border-orange-300'
                      : 'bg-white border border-gray-300 text-gray-700 hover:border-gray-400'
                  }`}
                >
                  {status}
                </button>
              )
            })}
          </div>
        </div>
      )}

      {/* Amenities */}
      <div>
        <label className="block text-sm font-semibold text-gray-800 mb-3">
          Amenities
        </label>
        <div className="space-y-2 max-h-48 overflow-y-auto">
          {['Parking', 'Lift', 'Power Backup', 'Security', 'Gym', 'Park', 'Swimming Pool', 'Club House'].map((amenity) => {
            const isSelected = amenities.includes(amenity)
            return (
              <label
                key={amenity}
                className="flex items-center gap-2 cursor-pointer group"
              >
                <input
                  type="checkbox"
                  checked={isSelected}
                  onChange={() => toggleArrayValue(amenities, amenity, setAmenities)}
                  className="w-4 h-4 accent-blue-600 rounded"
                />
                <span className="text-sm text-gray-700 group-hover:text-gray-900">
                  {amenity}
                </span>
              </label>
            )
          })}
        </div>
      </div>
    </div>
  )
}
