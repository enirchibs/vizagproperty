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
      <div className="bg-amber-50/40 rounded-2xl shadow-sm border border-amber-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-amber-900 mb-3">Commercial Type</label>
        <div className="grid grid-cols-2 gap-2">
          {COMMERCIAL_TYPES.map(type => (
            <button
              key={type.value}
              onClick={() => onChange({ ...filters, commercialType: type.value })}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 border-2 ${
                filters.commercialType === type.value
                  ? 'bg-amber-600 text-white border-amber-600 shadow-md shadow-amber-500/20 scale-[1.02] font-bold'
                  : 'bg-white border-amber-200 text-amber-600 font-bold hover:border-amber-400 hover:bg-amber-50 hover:text-amber-700'
              }`}
            >
              {type.label}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-amber-50/40 rounded-2xl shadow-sm border border-amber-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-amber-900 mb-3">Covered Area</label>
        <div className="grid grid-cols-2 gap-3 mb-3">
          <input
            type="number"
            placeholder="Min"
            value={filters.coveredAreaMin || ''}
            onChange={(e) => onChange({ ...filters, coveredAreaMin: Number(e.target.value) || undefined })}
            className="border border-amber-200/60 rounded-xl px-3 py-2 text-sm bg-white focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-transparent text-amber-900 placeholder-amber-300/70"
          />
          <input
            type="number"
            placeholder="Max"
            value={filters.coveredAreaMax || ''}
            onChange={(e) => onChange({ ...filters, coveredAreaMax: Number(e.target.value) || undefined })}
            className="border border-amber-200/60 rounded-xl px-3 py-2 text-sm bg-white focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-transparent text-amber-900 placeholder-amber-300/70"
          />
        </div>
        <select
          value={filters.areaUnit || 'sqft'}
          onChange={(e) => onChange({ ...filters, areaUnit: e.target.value })}
          className="w-full border border-amber-200/60 rounded-xl px-3 py-2 text-sm bg-white focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-transparent text-amber-900 placeholder-amber-300/70"
        >
          <option value="sqft">Sq.ft</option>
          <option value="sqm">Sq.m</option>
        </select>
      </div>

      <div className="bg-amber-50/40 rounded-2xl shadow-sm border border-amber-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-amber-900 mb-3">Furnishing</label>
        <div className="flex flex-wrap gap-2">
          {FURNISHING_OPTIONS.map(furn => (
            <button
              key={furn}
              onClick={() => handleFurnishingToggle(furn)}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 border-2 ${
                filters.furnishing?.includes(furn)
                  ? 'bg-amber-600 text-white border-amber-600 shadow-md shadow-amber-500/20 scale-[1.02] font-bold'
                  : 'bg-white border-amber-200 text-amber-600 font-bold hover:border-amber-400 hover:bg-amber-50 hover:text-amber-700'
              }`}
            >
              {furn === 'furnished' ? 'Furnished' : furn === 'semi_furnished' ? 'Semi-Furnished' : 'Unfurnished'}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-amber-50/40 rounded-2xl shadow-sm border border-amber-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-amber-900 mb-3">Parking</label>
        <div className="flex gap-2">
          {[
            { value: true, label: 'Available' },
            { value: false, label: 'Not Required' }
          ].map(option => (
            <button
              key={option.label}
              onClick={() => onChange({ ...filters, parking: option.value })}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 border-2 ${
                filters.parking === option.value
                  ? 'bg-amber-600 text-white border-amber-600 shadow-md shadow-amber-500/20 scale-[1.02] font-bold'
                  : 'bg-white border-amber-200 text-amber-600 font-bold hover:border-amber-400 hover:bg-amber-50 hover:text-amber-700'
              }`}
            >
              {option.label}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-amber-50/40 rounded-2xl shadow-sm border border-amber-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-amber-900 mb-3">Washroom</label>
        <div className="flex gap-2">
          {[
            { value: true, label: 'Available' },
            { value: false, label: 'Not Required' }
          ].map(option => (
            <button
              key={option.label}
              onClick={() => onChange({ ...filters, washroom: option.value })}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 border-2 ${
                filters.washroom === option.value
                  ? 'bg-amber-600 text-white border-amber-600 shadow-md shadow-amber-500/20 scale-[1.02] font-bold'
                  : 'bg-white border-amber-200 text-amber-600 font-bold hover:border-amber-400 hover:bg-amber-50 hover:text-amber-700'
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
