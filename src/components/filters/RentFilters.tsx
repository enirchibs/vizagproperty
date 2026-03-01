import { AdvancedFilters, BEDROOM_OPTIONS, FURNISHING_OPTIONS, TENANT_PREFERENCES } from '../../types/filters'

interface RentFiltersProps {
  filters: AdvancedFilters
  onChange: (filters: AdvancedFilters) => void
}

export function RentFilters({ filters, onChange }: RentFiltersProps) {
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

  const handleFurnishingToggle = (furnishing: string) => {
    onChange({ ...filters, furnishing: toggleArray(filters.furnishing, furnishing) })
  }

  const handleTenantToggle = (tenant: string) => {
    onChange({ ...filters, tenantPreference: toggleArray(filters.tenantPreference, tenant) })
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
        <label className="block text-sm font-semibold text-gray-900 mb-3">Tenant Preference</label>
        <div className="flex flex-wrap gap-2">
          {TENANT_PREFERENCES.map(tenant => (
            <button
              key={tenant.value}
              onClick={() => handleTenantToggle(tenant.value)}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-all ${
                filters.tenantPreference?.includes(tenant.value)
                  ? 'bg-blue-600 text-white shadow-md'
                  : 'border border-gray-200 text-gray-700 hover:border-blue-500'
              }`}
            >
              {tenant.label}
            </button>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-4">
        <label className="block text-sm font-semibold text-gray-900 mb-3">Available From</label>
        <input
          type="date"
          value={filters.availableFrom || ''}
          onChange={(e) => onChange({ ...filters, availableFrom: e.target.value })}
          className="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent"
        />
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
