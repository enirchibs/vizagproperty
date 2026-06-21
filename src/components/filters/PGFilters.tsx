import { AdvancedFilters, ROOM_TYPES, GENDER_OPTIONS } from '../../types/filters'

interface PGFiltersProps {
  filters: AdvancedFilters
  onChange: (filters: AdvancedFilters) => void
}

export function PGFilters({ filters, onChange }: PGFiltersProps) {
  return (
    <div className="space-y-6">
      <div className="bg-amber-50/40 rounded-2xl shadow-sm border border-amber-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-amber-900 mb-3">Room Type</label>
        <div className="flex flex-wrap gap-2">
          {ROOM_TYPES.map(room => (
            <button
              key={room.value}
              onClick={() => onChange({ ...filters, roomType: room.value })}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 border-2 ${
                filters.roomType === room.value
                  ? 'bg-amber-600 text-white border-amber-600 shadow-md shadow-amber-500/20 scale-[1.02] font-bold'
                  : 'bg-white border-amber-200 text-amber-600 font-bold hover:border-amber-400 hover:bg-amber-50 hover:text-amber-700'
              }`}
            >
              {room.label}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-amber-50/40 rounded-2xl shadow-sm border border-amber-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-amber-900 mb-3">Food Included</label>
        <div className="flex gap-2">
          {[
            { value: true, label: 'Yes' },
            { value: false, label: 'No' }
          ].map(option => (
            <button
              key={option.label}
              onClick={() => onChange({ ...filters, foodIncluded: option.value })}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 border-2 ${
                filters.foodIncluded === option.value
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
        <label className="block text-sm font-bold text-amber-900 mb-3">Gender</label>
        <div className="flex flex-wrap gap-2">
          {GENDER_OPTIONS.map(gender => (
            <button
              key={gender.value}
              onClick={() => onChange({ ...filters, gender: gender.value })}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 border-2 ${
                filters.gender === gender.value
                  ? 'bg-amber-600 text-white border-amber-600 shadow-md shadow-amber-500/20 scale-[1.02] font-bold'
                  : 'bg-white border-amber-200 text-amber-600 font-bold hover:border-amber-400 hover:bg-amber-50 hover:text-amber-700'
              }`}
            >
              {gender.label}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-amber-50/40 rounded-2xl shadow-sm border border-amber-100 p-4 hover:shadow-md transition-shadow duration-300">
        <label className="block text-sm font-bold text-amber-900 mb-3">Attached Bathroom</label>
        <div className="flex gap-2">
          {[
            { value: true, label: 'Yes' },
            { value: false, label: 'No' }
          ].map(option => (
            <button
              key={option.label}
              onClick={() => onChange({ ...filters, attachedBathroom: option.value })}
              className={`px-4 py-2 rounded-full text-sm font-semibold transition-all duration-300 border-2 ${
                filters.attachedBathroom === option.value
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
        <label className="block text-sm font-bold text-amber-900 mb-3">Rent Range</label>
        <div className="grid grid-cols-2 gap-3">
          <input
            type="number"
            placeholder="Min Rent"
            value={filters.rentMin || ''}
            onChange={(e) => onChange({ ...filters, rentMin: Number(e.target.value) || undefined })}
            className="w-full border border-amber-200/60 rounded-xl px-3 py-2 text-sm bg-white focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-transparent text-amber-900 placeholder-amber-300/70"
          />
          <input
            type="number"
            placeholder="Max Rent"
            value={filters.rentMax || ''}
            onChange={(e) => onChange({ ...filters, rentMax: Number(e.target.value) || undefined })}
            className="w-full border border-amber-200/60 rounded-xl px-3 py-2 text-sm bg-white focus:outline-none focus:ring-2 focus:ring-amber-500 focus:border-transparent text-amber-900 placeholder-amber-300/70"
          />
        </div>
      </div>
    </div>
  )
}
