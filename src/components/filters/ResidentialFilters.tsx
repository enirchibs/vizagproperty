import { AdvancedFilters, BEDROOM_OPTIONS, BATHROOM_OPTIONS, FURNISHING_OPTIONS, POSSESSION_OPTIONS, SALE_TYPE_OPTIONS, AMENITIES_OPTIONS } from '../../types/filters'

interface ResidentialFiltersProps {
  filters: AdvancedFilters
  onChange: (filters: AdvancedFilters) => void
}

export function ResidentialFilters({ filters, onChange }: ResidentialFiltersProps) {
  const toggleArray = (array: any[] = [], value: any) => {
    if (array.includes(value)) {
      return array.filter(item => item !== value)
    }
    return [...array, value]
  }

  const handlePropertyTypeChange = (type: string) => {
    onChange({ ...filters, propertyType: type })
  }

  const handleBedroomToggle = (bedroom: number) => {
    onChange({ ...filters, bedrooms: toggleArray(filters.bedrooms, bedroom) })
  }

  const handleBathroomToggle = (bathroom: number) => {
    onChange({ ...filters, bathrooms: toggleArray(filters.bathrooms, bathroom) })
  }

  const handleFurnishingToggle = (furnishing: string) => {
    onChange({ ...filters, furnishing: toggleArray(filters.furnishing, furnishing) })
  }

  const handlePossessionToggle = (possession: string) => {
    onChange({ ...filters, possession: toggleArray(filters.possession, possession) })
  }

  const handleSaleTypeToggle = (saleType: string) => {
    onChange({ ...filters, saleType: toggleArray(filters.saleType, saleType) })
  }

  const handleAmenityToggle = (amenity: string) => {
    onChange({ ...filters, amenities: toggleArray(filters.amenities, amenity) })
  }

  return (
    <div className="space-y-6">
      {/* Property Type Card */}
      <div className="bg-blue-50/40 rounded-2xl shadow-sm border border-blue-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-blue-900 mb-3">Property Type</label>
        <div className="grid grid-cols-3 gap-2">
          {['flat', 'house', 'villa'].map(type => (
            <button
              key={type}
              onClick={() => handlePropertyTypeChange(type)}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 ${
                filters.propertyType === type
                  ? 'bg-blue-600 text-white shadow-md shadow-blue-500/20 border border-blue-600 scale-[1.02]'
                  : 'bg-white border border-blue-200/60 text-blue-700 hover:border-blue-400 hover:bg-blue-50/30'
              }`}
            >
              {type.charAt(0).toUpperCase() + type.slice(1)}
            </button>
          ))}
        </div>
      </div>

      {/* Bedrooms Card */}
      <div className="bg-blue-50/40 rounded-2xl shadow-sm border border-blue-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-blue-900 mb-3">Bedrooms</label>
        <div className="flex flex-wrap gap-2">
          {BEDROOM_OPTIONS.map(bhk => (
            <button
              key={bhk}
              onClick={() => handleBedroomToggle(bhk)}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 ${
                filters.bedrooms?.includes(bhk)
                  ? 'bg-indigo-600 text-white shadow-md shadow-indigo-500/20 border border-indigo-600 scale-[1.02]'
                  : 'bg-white border border-blue-200/60 text-indigo-700 hover:border-indigo-400 hover:bg-blue-50/30'
              }`}
            >
              {bhk} BHK
            </button>
          ))}
        </div>
      </div>

      {/* Bathrooms Card */}
      <div className="bg-blue-50/40 rounded-2xl shadow-sm border border-blue-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-blue-900 mb-3">Bathrooms</label>
        <div className="flex flex-wrap gap-2">
          {BATHROOM_OPTIONS.map(bath => (
            <button
              key={bath}
              onClick={() => handleBathroomToggle(bath)}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 ${
                filters.bathrooms?.includes(bath)
                  ? 'bg-sky-600 text-white shadow-md shadow-sky-500/20 border border-sky-600 scale-[1.02]'
                  : 'bg-white border border-blue-200/60 text-sky-700 hover:border-sky-400 hover:bg-blue-50/30'
              }`}
            >
              {bath}
            </button>
          ))}
        </div>
      </div>

      {/* Possession Status Card */}
      <div className="bg-blue-50/40 rounded-2xl shadow-sm border border-blue-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-blue-900 mb-3">Possession Status</label>
        <div className="flex flex-wrap gap-2">
          {POSSESSION_OPTIONS.map(status => (
            <button
              key={status}
              onClick={() => handlePossessionToggle(status)}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 ${
                filters.possession?.includes(status)
                  ? 'bg-indigo-700 text-white shadow-md shadow-indigo-600/20 border border-indigo-700 scale-[1.02]'
                  : 'bg-white border border-blue-200/60 text-indigo-800 hover:border-indigo-400 hover:bg-blue-50/30'
              }`}
            >
              {status === 'ready_to_move' ? 'Ready to Move' : 'Under Construction'}
            </button>
          ))}
        </div>
      </div>

      {/* Furnishing Card */}
      <div className="bg-blue-50/40 rounded-2xl shadow-sm border border-blue-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-blue-900 mb-3">Furnishing</label>
        <div className="flex flex-wrap gap-2">
          {FURNISHING_OPTIONS.map(furn => (
            <button
              key={furn}
              onClick={() => handleFurnishingToggle(furn)}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 ${
                filters.furnishing?.includes(furn)
                  ? 'bg-blue-700 text-white shadow-md shadow-blue-600/20 border border-blue-700 scale-[1.02]'
                  : 'bg-white border border-blue-200/60 text-blue-800 hover:border-blue-400 hover:bg-blue-50/30'
              }`}
            >
              {furn === 'furnished' ? 'Furnished' : furn === 'semi_furnished' ? 'Semi-Furnished' : 'Unfurnished'}
            </button>
          ))}
        </div>
      </div>

      {/* Sale Type Card */}
      <div className="bg-blue-50/40 rounded-2xl shadow-sm border border-blue-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-blue-900 mb-3">Sale Type</label>
        <div className="flex flex-wrap gap-2">
          {SALE_TYPE_OPTIONS.map(type => (
            <button
              key={type}
              onClick={() => handleSaleTypeToggle(type)}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 ${
                filters.saleType?.includes(type)
                  ? 'bg-sky-700 text-white shadow-md shadow-sky-600/20 border border-sky-700 scale-[1.02]'
                  : 'bg-white border border-blue-200/60 text-sky-800 hover:border-sky-400 hover:bg-blue-50/30'
              }`}
            >
              {type === 'new' ? 'New' : 'Resale'}
            </button>
          ))}
        </div>
      </div>

      {/* Amenities Card */}
      <div className="bg-blue-50/40 rounded-2xl shadow-sm border border-blue-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-blue-900 mb-3">Amenities</label>
        <div className="flex flex-wrap gap-2">
          {AMENITIES_OPTIONS.map(amenity => (
            <button
              key={amenity.value}
              onClick={() => handleAmenityToggle(amenity.value)}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 ${
                filters.amenities?.includes(amenity.value)
                  ? 'bg-blue-600 text-white shadow-md shadow-blue-500/20 border border-blue-600 scale-[1.02]'
                  : 'bg-white border border-blue-200/60 text-blue-700 hover:border-blue-400 hover:bg-blue-50/30'
              }`}
            >
              {amenity.label}
            </button>
          ))}
        </div>
      </div>

      {/* Covered Area Card */}
      <div className="bg-blue-50/40 rounded-2xl shadow-sm border border-blue-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-blue-900 mb-3">Covered Area</label>
        <div className="grid grid-cols-2 gap-3 mb-3">
          <input
            type="number"
            placeholder="Min"
            value={filters.coveredAreaMin || ''}
            onChange={(e) => onChange({ ...filters, coveredAreaMin: Number(e.target.value) || undefined })}
            className="border border-blue-200/60 rounded-xl px-3 py-2 text-sm bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-blue-900 placeholder-blue-300/70"
          />
          <input
            type="number"
            placeholder="Max"
            value={filters.coveredAreaMax || ''}
            onChange={(e) => onChange({ ...filters, coveredAreaMax: Number(e.target.value) || undefined })}
            className="border border-blue-200/60 rounded-xl px-3 py-2 text-sm bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-blue-900 placeholder-blue-300/70"
          />
        </div>
        <select
          value={filters.areaUnit || 'sqft'}
          onChange={(e) => onChange({ ...filters, areaUnit: e.target.value })}
          className="w-full border border-blue-200/60 rounded-xl px-3 py-2 text-sm bg-white focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-blue-900"
        >
          <option value="sqft">Sq.ft</option>
          <option value="sqm">Sq.m</option>
          <option value="cents">Cents</option>
          <option value="acres">Acres</option>
        </select>
      </div>
    </div>
  )
}
