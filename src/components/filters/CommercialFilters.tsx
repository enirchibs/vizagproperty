import { AdvancedFilters, COMMERCIAL_TYPES, FURNISHING_OPTIONS } from '../../types/filters'

interface CommercialFiltersProps {
  filters: AdvancedFilters
  onChange: (filters: AdvancedFilters) => void
}

export function CommercialFilters({ filters, onChange }: CommercialFiltersProps) {
  const toggleArray = (array: any[] = [], value: any) => {
    if (array.includes(value)) {
      return array.filter(item => item !== value)
    }
    return [...array, value]
  }

  const handleFurnishingToggle = (furnishing: string) => {
    onChange({ ...filters, furnishing: toggleArray(filters.furnishing, furnishing) })
  }

  return (
    <div className="space-y-6">
      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Commercial Type</label>
        <div className="grid grid-cols-2 gap-2">
          {COMMERCIAL_TYPES.map(type => (
            <button
              key={type.value}
              onClick={() => onChange({ ...filters, commercialType: type.value })}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.commercialType === type.value
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {type.label}
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
        </select>
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
        <label className="block text-sm font-semibold text-gray-900 mb-3">Parking</label>
        <div className="flex gap-2">
          {[
            { value: true, label: 'Available' },
            { value: false, label: 'Not Required' }
          ].map(option => (
            <button
              key={option.label}
              onClick={() => onChange({ ...filters, parking: option.value })}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.parking === option.value
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {option.label}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Washroom</label>
        <div className="flex gap-2">
          {[
            { value: true, label: 'Available' },
            { value: false, label: 'Not Required' }
          ].map(option => (
            <button
              key={option.label}
              onClick={() => onChange({ ...filters, washroom: option.value })}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.washroom === option.value
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {option.label}
            </button>
          ))}
        </div>
      </div>
    </div>
  )
}
