import { useSearch } from '../contexts/SearchContext'

export function FiltersPanel() {
  const {
    listingType,
    propertyCategory,
    propertySubType,
    setPropertySubType,
    bhkFilter,
    setBhkFilter,
    propertyStatus,
    setPropertyStatus,
    newBuilderProjects,
    setNewBuilderProjects,
    priceRange,
    setPriceRange,
    resetFilters,
  } = useSearch()

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <h3 className="font-bold text-base text-gray-900">Filters</h3>
        <button
          onClick={resetFilters}
          className="text-sm text-red-500 font-medium"
        >
          Clear All
        </button>
      </div>

      {listingType === 'buy' && propertyCategory === 'residential' && (
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">
            Property Type
          </label>
          <div className="flex flex-wrap gap-2">
            {[
              'Flat / Apartment',
              'Villa',
              'Full House',
              'Land / Plot'
            ].map(opt => (
              <label
                key={opt}
                className="flex items-center gap-2 text-sm px-3 py-2 rounded-lg border bg-white cursor-pointer hover:bg-gray-50"
              >
                <input
                  type="radio"
                  checked={propertySubType === opt}
                  onChange={() => setPropertySubType(opt)}
                />
                {opt}
              </label>
            ))}
          </div>
        </div>
      )}

      {listingType === 'rent' && propertyCategory === 'residential' && (
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">
            Property Type
          </label>
          <div className="flex flex-wrap gap-2">
            {[
              'Flat / Apartment',
              'Villa',
              'Full House',
              'PG / Hostel',
              'Flatmates'
            ].map(opt => (
              <label
                key={opt}
                className="flex items-center gap-2 text-sm px-3 py-2 rounded-lg border bg-white cursor-pointer hover:bg-gray-50"
              >
                <input
                  type="radio"
                  name="subType"
                  checked={propertySubType === opt}
                  onChange={() => setPropertySubType(opt)}
                />
                {opt}
              </label>
            ))}
          </div>
        </div>
      )}

      {(propertyCategory === 'commercial' || listingType === 'commercial') && (
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-2">
            Commercial Property Type
          </label>
          <select
            className="w-full rounded-lg border px-3 py-2.5 text-sm"
            value={propertySubType || ''}
            onChange={e => setPropertySubType(e.target.value)}
          >
            <option value="">Select Commercial Type</option>
            <option>Office Space</option>
            <option>Shop / Showroom</option>
            <option>Warehouse</option>
            <option>Farmhouse</option>
            <option>Co-working Space</option>
          </select>
        </div>
      )}

      {(propertySubType === 'Full House' || propertySubType === 'Flat / Apartment') && (
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1.5">
            BHK Type
          </label>
          <select
            value={bhkFilter}
            onChange={(e) => setBhkFilter(e.target.value)}
            className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm"
          >
            <option value="">All BHK Types</option>
            <option value="1">1 BHK</option>
            <option value="2">2 BHK</option>
            <option value="3">3 BHK</option>
            <option value="4">4 BHK</option>
            <option value="5">5+ BHK</option>
          </select>
        </div>
      )}

      {listingType === 'buy' && propertyCategory === 'residential' && (
        <>
          {propertySubType !== 'Land / Plot' && (
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1.5">
                Property Status
              </label>
              <select
                value={propertyStatus}
                onChange={(e) => setPropertyStatus(e.target.value)}
                className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm"
              >
                <option value="">All Status</option>
                <option value="ready_to_move">Ready to Move</option>
                <option value="under_construction">Under Construction</option>
              </select>
            </div>
          )}

          <div>
            <label className="flex items-center gap-1.5 text-sm">
              <input
                type="checkbox"
                checked={newBuilderProjects}
                onChange={(e) => setNewBuilderProjects(e.target.checked)}
                className="accent-blue-600"
              />
              New Builder Projects
            </label>
          </div>
        </>
      )}

      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1.5">
          Price Range
        </label>
        <div className="grid grid-cols-2 gap-2">
          <input
            type="number"
            placeholder="Min Price"
            value={priceRange[0] || ''}
            onChange={(e) => setPriceRange([parseInt(e.target.value) || 0, priceRange[1]])}
            className="px-3 py-2 border border-gray-300 rounded-lg text-sm"
          />
          <input
            type="number"
            placeholder="Max Price"
            value={priceRange[1] >= 10000000 ? '' : priceRange[1]}
            onChange={(e) => setPriceRange([priceRange[0], parseInt(e.target.value) || 10000000])}
            className="px-3 py-2 border border-gray-300 rounded-lg text-sm"
          />
        </div>
      </div>
    </div>
  )
}
