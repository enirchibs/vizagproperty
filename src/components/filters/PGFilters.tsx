import { AdvancedFilters, ROOM_TYPES, GENDER_OPTIONS } from '../../types/filters'

interface PGFiltersProps {
  filters: AdvancedFilters
  onChange: (filters: AdvancedFilters) => void
}

export function PGFilters({ filters, onChange }: PGFiltersProps) {
  return (
    <div className="space-y-6">
      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Room Type</label>
        <div className="flex flex-wrap gap-2">
          {ROOM_TYPES.map(room => (
            <button
              key={room.value}
              onClick={() => onChange({ ...filters, roomType: room.value })}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.roomType === room.value
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {room.label}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Food Included</label>
        <div className="flex gap-2">
          {[
            { value: true, label: 'Yes' },
            { value: false, label: 'No' }
          ].map(option => (
            <button
              key={option.label}
              onClick={() => onChange({ ...filters, foodIncluded: option.value })}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.foodIncluded === option.value
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
        <label className="block text-sm font-semibold text-gray-900 mb-3">Gender</label>
        <div className="flex flex-wrap gap-2">
          {GENDER_OPTIONS.map(gender => (
            <button
              key={gender.value}
              onClick={() => onChange({ ...filters, gender: gender.value })}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.gender === gender.value
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {gender.label}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Attached Bathroom</label>
        <div className="flex gap-2">
          {[
            { value: true, label: 'Yes' },
            { value: false, label: 'No' }
          ].map(option => (
            <button
              key={option.label}
              onClick={() => onChange({ ...filters, attachedBathroom: option.value })}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.attachedBathroom === option.value
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
        <label className="block text-sm font-semibold text-gray-900 mb-3">Rent Range</label>
        <div className="grid grid-cols-2 gap-3">
          <input
            type="number"
            placeholder="Min Rent"
            value={filters.rentMin || ''}
            onChange={(e) => onChange({ ...filters, rentMin: Number(e.target.value) || undefined })}
            className="border border-gray-200 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          />
          <input
            type="number"
            placeholder="Max Rent"
            value={filters.rentMax || ''}
            onChange={(e) => onChange({ ...filters, rentMax: Number(e.target.value) || undefined })}
            className="border border-gray-200 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
          />
        </div>
      </div>
    </div>
  )
}
