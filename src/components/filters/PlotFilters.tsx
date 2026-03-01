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
      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Plot Type</label>
        <div className="grid grid-cols-2 gap-2">
          {['residential', 'commercial'].map(type => (
            <button
              key={type}
              onClick={() => onChange({ ...filters, propertyType: type })}
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
        <label className="block text-sm font-semibold text-gray-900 mb-3">Facing</label>
        <div className="grid grid-cols-2 gap-2">
          {FACING_OPTIONS.map(facing => (
            <button
              key={facing}
              onClick={() => handleFacingToggle(facing)}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.facing?.includes(facing)
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {facing.split('_').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join('-')}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Boundary Wall</label>
        <div className="flex gap-2">
          {[
            { value: true, label: 'Yes' },
            { value: false, label: 'No' }
          ].map(option => (
            <button
              key={option.label}
              onClick={() => onChange({ ...filters, boundaryWall: option.value })}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.boundaryWall === option.value
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
        <label className="block text-sm font-semibold text-gray-900 mb-3">Corner Plot</label>
        <div className="flex gap-2">
          {[
            { value: true, label: 'Yes' },
            { value: false, label: 'No' }
          ].map(option => (
            <button
              key={option.label}
              onClick={() => onChange({ ...filters, cornerPlot: option.value })}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.cornerPlot === option.value
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
        <label className="block text-sm font-semibold text-gray-900 mb-3">Plot Area</label>
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
          {AREA_UNITS.map(unit => (
            <option key={unit.value} value={unit.value}>{unit.label}</option>
          ))}
        </select>
      </div>
    </div>
  )
}
