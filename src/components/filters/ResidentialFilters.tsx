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
      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Property Type</label>
        <div className="grid grid-cols-3 gap-2">
          {['flat', 'house', 'villa'].map(type => (
            <button
              key={type}
              onClick={() => handlePropertyTypeChange(type)}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.propertyType === type
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {type.charAt(0).toUpperCase() + type.slice(1)}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Bedrooms</label>
        <div className="flex flex-wrap gap-2">
          {BEDROOM_OPTIONS.map(bhk => (
            <button
              key={bhk}
              onClick={() => handleBedroomToggle(bhk)}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.bedrooms?.includes(bhk)
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {bhk} BHK
            </button>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Bathrooms</label>
        <div className="flex flex-wrap gap-2">
          {BATHROOM_OPTIONS.map(bath => (
            <button
              key={bath}
              onClick={() => handleBathroomToggle(bath)}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.bathrooms?.includes(bath)
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {bath}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Possession Status</label>
        <div className="flex flex-wrap gap-2">
          {POSSESSION_OPTIONS.map(status => (
            <button
              key={status}
              onClick={() => handlePossessionToggle(status)}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.possession?.includes(status)
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {status === 'ready_to_move' ? 'Ready to Move' : 'Under Construction'}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Furnishing</label>
        <div className="flex flex-wrap gap-2">
          {FURNISHING_OPTIONS.map(furn => (
            <button
              key={furn}
              onClick={() => handleFurnishingToggle(furn)}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.furnishing?.includes(furn)
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {furn === 'furnished' ? 'Furnished' : furn === 'semi_furnished' ? 'Semi-Furnished' : 'Unfurnished'}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Sale Type</label>
        <div className="flex flex-wrap gap-2">
          {SALE_TYPE_OPTIONS.map(type => (
            <button
              key={type}
              onClick={() => handleSaleTypeToggle(type)}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.saleType?.includes(type)
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {type === 'new' ? 'New' : 'Resale'}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Amenities</label>
        <div className="flex flex-wrap gap-2">
          {AMENITIES_OPTIONS.map(amenity => (
            <button
              key={amenity.value}
              onClick={() => handleAmenityToggle(amenity.value)}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.amenities?.includes(amenity.value)
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {amenity.label}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Covered Area</label>
        <div className="grid grid-cols-2 gap-3 mb-3">
          <input
            type="number"
            placeholder="Min"
            value={filters.coveredAreaMin || ''}
            onChange={(e) => onChange({ ...filters, coveredAreaMin: Number(e.target.value) || undefined })}
            className="border border-gray-200 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          />
          <input
            type="number"
            placeholder="Max"
            value={filters.coveredAreaMax || ''}
            onChange={(e) => onChange({ ...filters, coveredAreaMax: Number(e.target.value) || undefined })}
            className="border border-gray-200 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          />
        </div>
        <select
          value={filters.areaUnit || 'sqft'}
          onChange={(e) => onChange({ ...filters, areaUnit: e.target.value })}
          className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm bg-white focus:ring-2 focus:ring-blue-500 focus:border-transparent"
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
