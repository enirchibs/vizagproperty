import { AdvancedFilters, FACING_OPTIONS, AREA_UNITS } from '../../types/filters'

interface PlotFiltersProps {
  filters: AdvancedFilters
  onChange: (filters: AdvancedFilters) => void
}

export function PlotFilters({ filters, onChange }: PlotFiltersProps) {
  const toggleArray = (array: any[] = [], value: any) => {
    if (array.includes(value)) {
      return array.filter(item => item !== value)
    }
    return [...array, value]
  }

  const handleFacingToggle = (facing: string) => {
    onChange({ ...filters, facing: toggleArray(filters.facing, facing) })
  }

  return (
    <div className="space-y-6">
      {/* Plot Type Card */}
      <div className="bg-green-50/25 rounded-2xl shadow-sm border border-green-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-green-950 mb-3">Plot Type</label>
        <div className="grid grid-cols-2 gap-2">
          {['residential', 'commercial'].map(type => (
            <button
              key={type}
              onClick={() => onChange({ ...filters, propertyType: type })}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 border-2 ${
                filters.propertyType === type
                  ? 'bg-green-600 text-white border-green-600 shadow-md shadow-green-500/20 scale-[1.02]'
                  : 'bg-white border-gray-200 text-gray-700 hover:border-green-400 hover:bg-green-50/30 hover:text-green-700'
              }`}
            >
              {type.charAt(0).toUpperCase() + type.slice(1)}
            </button>
          ))}
        </div>
      </div>

      {/* Facing Card */}
      <div className="bg-green-50/25 rounded-2xl shadow-sm border border-green-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-green-950 mb-3">Facing</label>
        <div className="grid grid-cols-2 gap-2">
          {FACING_OPTIONS.map(facing => (
            <button
              key={facing}
              onClick={() => handleFacingToggle(facing)}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 border-2 ${
                filters.facing?.includes(facing)
                  ? 'bg-green-600 text-white border-green-600 shadow-md shadow-green-500/20 scale-[1.02]'
                  : 'bg-white border-gray-200 text-gray-700 hover:border-green-400 hover:bg-green-50/30 hover:text-green-700'
              }`}
            >
              {facing.split('_').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join('-')}
            </button>
          ))}
        </div>
      </div>

      {/* Boundary Wall Card */}
      <div className="bg-green-50/25 rounded-2xl shadow-sm border border-green-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-green-950 mb-3">Boundary Wall</label>
        <div className="flex gap-2">
          {[
            { value: true, label: 'Yes' },
            { value: false, label: 'No' }
          ].map(option => (
            <button
              key={option.label}
              onClick={() => onChange({ ...filters, boundaryWall: option.value })}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 border-2 ${
                filters.boundaryWall === option.value
                  ? 'bg-green-600 text-white border-green-600 shadow-md shadow-green-500/20 scale-[1.02]'
                  : 'bg-white border-gray-200 text-gray-700 hover:border-green-400 hover:bg-green-50/30 hover:text-green-700'
              }`}
            >
              {option.label}
            </button>
          ))}
        </div>
      </div>

      {/* Corner Plot Card */}
      <div className="bg-green-50/25 rounded-2xl shadow-sm border border-green-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-green-950 mb-3">Corner Plot</label>
        <div className="flex gap-2">
          {[
            { value: true, label: 'Yes' },
            { value: false, label: 'No' }
          ].map(option => (
            <button
              key={option.label}
              onClick={() => onChange({ ...filters, cornerPlot: option.value })}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 border-2 ${
                filters.cornerPlot === option.value
                  ? 'bg-green-600 text-white border-green-600 shadow-md shadow-green-500/20 scale-[1.02]'
                  : 'bg-white border-gray-200 text-gray-700 hover:border-green-400 hover:bg-green-50/30 hover:text-green-700'
              }`}
            >
              {option.label}
            </button>
          ))}
        </div>
      </div>

      {/* Plot Area Card */}
      <div className="bg-green-50/25 rounded-2xl shadow-sm border border-green-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-green-950 mb-3">Plot Area</label>
        <div className="grid grid-cols-2 gap-3 mb-3">
          <input
            type="number"
            placeholder="Min"
            value={filters.coveredAreaMin || ''}
            onChange={(e) => onChange({ ...filters, coveredAreaMin: Number(e.target.value) || undefined })}
            className="border border-green-200/60 rounded-xl px-3 py-2 text-sm bg-white focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent text-green-950 placeholder-green-300/70"
          />
          <input
            type="number"
            placeholder="Max"
            value={filters.coveredAreaMax || ''}
            onChange={(e) => onChange({ ...filters, coveredAreaMax: Number(e.target.value) || undefined })}
            className="border border-green-200/60 rounded-xl px-3 py-2 text-sm bg-white focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent text-green-950 placeholder-green-300/70"
          />
        </div>
        <select
          value={filters.areaUnit || 'sqft'}
          onChange={(e) => onChange({ ...filters, areaUnit: e.target.value })}
          className="w-full border border-green-200/60 rounded-xl px-3 py-2 text-sm bg-white focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent text-green-950"
        >
          {AREA_UNITS.map(unit => (
            <option key={unit.value} value={unit.value}>{unit.label}</option>
          ))}
        </select>
      </div>
    </div>
  )
}
