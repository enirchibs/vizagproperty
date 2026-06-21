import { X, ArrowLeft } from 'lucide-react'
import { useEffect, useState } from 'react'
import { AdvancedFilters } from '../types/filters'
import { ResidentialFilters } from './filters/ResidentialFilters'
import { PlotFilters } from './filters/PlotFilters'
import { CommercialFilters } from './filters/CommercialFilters'
import { RentFilters } from './filters/RentFilters'
import { PGFilters } from './filters/PGFilters'

interface FilterModalProps {
  isOpen: boolean
  onClose: () => void
  selectedCategory: 'buy' | 'rent' | 'projects' | 'commercial'
  onCategoryChange: (category: 'buy' | 'rent' | 'projects' | 'commercial') => void
  filterCount: number
  onReset: () => void
  onApply?: (filters: AdvancedFilters, category: 'buy' | 'rent' | 'projects' | 'commercial', subType: 'residential' | 'plot' | 'pg') => void
  initialFilters?: AdvancedFilters
  initialSubType?: 'residential' | 'plot' | 'pg'
}

export function FilterModal({
  isOpen,
  onClose,
  selectedCategory,
  onCategoryChange,
  onReset,
  onApply,
  initialFilters,
  initialSubType
}: FilterModalProps) {
  const [filters, setFilters] = useState<AdvancedFilters>(initialFilters || {})
  const [propertySubType, setPropertySubType] = useState<'residential' | 'plot' | 'pg'>(initialSubType || 'residential')

  useEffect(() => {
    if (initialFilters) {
      setFilters(initialFilters)
    }
  }, [initialFilters])

  useEffect(() => {
    if (initialSubType) {
      setPropertySubType(initialSubType)
    }
  }, [initialSubType])

  useEffect(() => {
    if (isOpen) {
      document.body.style.overflow = 'hidden'
    } else {
      document.body.style.overflow = 'unset'
    }
    return () => {
      document.body.style.overflow = 'unset'
    }
  }, [isOpen])

  const handleFiltersChange = (newFilters: AdvancedFilters) => {
    setFilters(newFilters)
  }

  const handleResetFilters = () => {
    setFilters({})
    onReset()
  }

  const calculateFilterCount = () => {
    let count = 0
    if (filters.propertyType) count++
    if (filters.bedrooms && filters.bedrooms.length > 0) count++
    if (filters.bathrooms && filters.bathrooms.length > 0) count++
    if (filters.furnishing && filters.furnishing.length > 0) count++
    if (filters.possession && filters.possession.length > 0) count++
    if (filters.saleType && filters.saleType.length > 0) count++
    if (filters.amenities && filters.amenities.length > 0) count++
    if (filters.coveredAreaMin || filters.coveredAreaMax) count++
    if (filters.commercialType) count++
    if (filters.facing && filters.facing.length > 0) count++
    if (filters.boundaryWall !== undefined) count++
    if (filters.cornerPlot !== undefined) count++
    if (filters.tenantPreference && filters.tenantPreference.length > 0) count++
    if (filters.availableFrom) count++
    if (filters.roomType) count++
    if (filters.foodIncluded !== undefined) count++
    if (filters.gender) count++
    if (filters.attachedBathroom !== undefined) count++
    if (filters.rentMin || filters.rentMax) count++
    return count
  }

  const activeFilterCount = calculateFilterCount()

  const renderFilterContent = () => {
    if (selectedCategory === 'buy') {
      if (propertySubType === 'residential') {
        return <ResidentialFilters filters={filters} onChange={handleFiltersChange} />
      } else if (propertySubType === 'plot') {
        return <PlotFilters filters={filters} onChange={handleFiltersChange} />
      }
    } else if (selectedCategory === 'rent') {
      if (propertySubType === 'pg') {
        return <PGFilters filters={filters} onChange={handleFiltersChange} />
      }
      return <RentFilters filters={filters} onChange={handleFiltersChange} />
    } else if (selectedCategory === 'commercial') {
      return <CommercialFilters filters={filters} onChange={handleFiltersChange} />
    } else if (selectedCategory === 'projects') {
      return <ResidentialFilters filters={filters} onChange={handleFiltersChange} />
    }
    return null
  }

  const handleApplyFilters = () => {
    if (onApply) {
      onApply(filters, selectedCategory, propertySubType)
    }
    onClose()
  }

  if (!isOpen) return null

  return (
    <>
      <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-40 animate-fade-in" onClick={onClose}></div>

      <div className="md:hidden fixed inset-0 z-50 animate-slide-up">
        <div className="h-full bg-white flex flex-col">
          <div className="sticky top-0 bg-white border-b border-gray-200 px-4 py-3 flex items-center justify-between z-10">
            <button
              onClick={onClose}
              className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
              aria-label="Go back"
            >
              <ArrowLeft className="h-5 w-5 text-gray-700" />
            </button>
            <h2 className="text-lg font-bold text-gray-900">
              Filters {activeFilterCount > 0 && `(${activeFilterCount})`}
            </h2>
            <button
              onClick={handleResetFilters}
              className="text-sm font-semibold text-red-600 hover:text-red-700 transition-colors"
            >
              Reset
            </button>
          </div>

          <div className="flex border-b border-gray-200 bg-white">
            <button
              onClick={() => onCategoryChange('buy')}
              className={`flex-1 py-4 px-4 font-semibold text-center text-sm transition-all relative ${
                selectedCategory === 'buy'
                  ? 'text-blue-600 bg-blue-50'
                  : 'text-gray-600'
              }`}
            >
              Buy
              {selectedCategory === 'buy' && (
                <div className="absolute bottom-0 left-0 right-0 h-1 bg-blue-600"></div>
              )}
            </button>
            <button
              onClick={() => onCategoryChange('rent')}
              className={`flex-1 py-4 px-4 font-semibold text-center text-sm transition-all relative ${
                selectedCategory === 'rent'
                  ? 'text-rose-600 bg-rose-50'
                  : 'text-gray-600'
              }`}
            >
              Rent
              {selectedCategory === 'rent' && (
                <div className="absolute bottom-0 left-0 right-0 h-1 bg-rose-600"></div>
              )}
            </button>
            <button
              onClick={() => onCategoryChange('projects')}
              className={`flex-1 py-4 px-4 font-semibold text-center text-sm transition-all relative ${
                selectedCategory === 'projects'
                  ? 'text-green-600 bg-green-50'
                  : 'text-gray-600'
              }`}
            >
              Projects
              {selectedCategory === 'projects' && (
                <div className="absolute bottom-0 left-0 right-0 h-1 bg-green-600"></div>
              )}
            </button>
            <button
              onClick={() => onCategoryChange('commercial')}
              className={`flex-1 py-4 px-4 font-semibold text-center text-sm transition-all relative ${
                selectedCategory === 'commercial'
                  ? 'text-orange-600 bg-orange-50'
                  : 'text-gray-600'
              }`}
            >
              Commercial
              {selectedCategory === 'commercial' && (
                <div className="absolute bottom-0 left-0 right-0 h-1 bg-orange-600"></div>
              )}
            </button>
          </div>

          <div className="flex-1 overflow-y-auto p-4">
            {(selectedCategory === 'buy' || selectedCategory === 'rent') && (
              <div className="mb-4">
                <div className="flex gap-2 bg-gray-100 rounded-lg p-1">
                  {selectedCategory === 'buy' ? (
                    <>
                      <button
                        onClick={() => setPropertySubType('residential')}
                        className={`flex-1 py-2.5 px-4 rounded-xl text-sm font-extrabold transition-all duration-300 border-2 ${
                          propertySubType === 'residential'
                            ? 'bg-blue-600 text-white border-blue-600 shadow-md shadow-blue-500/25 scale-[1.02]'
                            : 'bg-white/80 text-gray-600 border-gray-200 hover:text-gray-900 hover:border-gray-300'
                        }`}
                      >
                        Residential
                      </button>
                      <button
                        onClick={() => setPropertySubType('plot')}
                        className={`flex-1 py-2.5 px-4 rounded-xl text-sm font-extrabold transition-all duration-300 border-2 ${
                          propertySubType === 'plot'
                            ? 'bg-green-600 text-white border-green-600 shadow-md shadow-green-500/25 scale-[1.02]'
                            : 'bg-white/80 text-gray-600 border-gray-200 hover:text-gray-900 hover:border-gray-300'
                        }`}
                      >
                        Plot
                      </button>
                    </>
                  ) : (
                    <>
                      <button
                        onClick={() => setPropertySubType('residential')}
                        className={`flex-1 py-2.5 px-4 rounded-xl text-sm font-extrabold transition-all duration-300 border-2 ${
                          propertySubType === 'residential'
                            ? 'bg-rose-600 text-white border-rose-600 shadow-md shadow-rose-500/25 scale-[1.02]'
                            : 'bg-white/80 text-gray-600 border-gray-200 hover:text-gray-900 hover:border-gray-300'
                        }`}
                      >
                        House/Flat
                      </button>
                      <button
                        onClick={() => setPropertySubType('pg')}
                        className={`flex-1 py-2.5 px-4 rounded-xl text-sm font-extrabold transition-all duration-300 border-2 ${
                          propertySubType === 'pg'
                            ? 'bg-amber-600 text-white border-amber-600 shadow-md shadow-amber-500/25 scale-[1.02]'
                            : 'bg-white/80 text-gray-600 border-gray-200 hover:text-gray-900 hover:border-gray-300'
                        }`}
                      >
                        PG/Hostel
                      </button>
                    </>
                  )}
                </div>
              </div>
            )}
            {renderFilterContent()}
          </div>

          <div className="sticky bottom-0 bg-white border-t border-gray-200 p-4">
            <button
              onClick={handleApplyFilters}
              className="w-full bg-gradient-to-r from-blue-600 to-blue-700 text-white py-4 rounded-full font-semibold text-base shadow-lg hover:shadow-xl transition-all"
            >
              View {activeFilterCount > 0 ? 'Filtered' : 'All'} Properties
            </button>
          </div>
        </div>
      </div>

      <div className="hidden md:block fixed left-0 top-0 bottom-0 w-96 bg-white z-50 shadow-2xl animate-slide-right">
        <div className="h-full flex flex-col">
          <div className="sticky top-0 bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between z-10">
            <h2 className="text-xl font-bold text-gray-900">
              Filters {activeFilterCount > 0 && `(${activeFilterCount})`}
            </h2>
            <div className="flex items-center gap-2">
              <button
                onClick={handleResetFilters}
                className="text-sm font-semibold text-red-600 hover:text-red-700 transition-colors"
              >
                Reset
              </button>
              <button
                onClick={onClose}
                className="p-2 hover:bg-gray-100 rounded-lg transition-colors"
                aria-label="Close filters"
              >
                <X className="h-5 w-5 text-gray-700" />
              </button>
            </div>
          </div>

          <div className="flex border-b border-gray-200 bg-white">
            <button
              onClick={() => onCategoryChange('buy')}
              className={`flex-1 py-4 px-4 font-semibold text-center text-sm transition-all relative ${
                selectedCategory === 'buy'
                  ? 'text-blue-600 bg-blue-50'
                  : 'text-gray-600'
              }`}
            >
              Buy
              {selectedCategory === 'buy' && (
                <div className="absolute bottom-0 left-0 right-0 h-1 bg-blue-600"></div>
              )}
            </button>
            <button
              onClick={() => onCategoryChange('rent')}
              className={`flex-1 py-4 px-4 font-semibold text-center text-sm transition-all relative ${
                selectedCategory === 'rent'
                  ? 'text-rose-600 bg-rose-50'
                  : 'text-gray-600'
              }`}
            >
              Rent
              {selectedCategory === 'rent' && (
                <div className="absolute bottom-0 left-0 right-0 h-1 bg-rose-600"></div>
              )}
            </button>
            <button
              onClick={() => onCategoryChange('projects')}
              className={`flex-1 py-4 px-4 font-semibold text-center text-sm transition-all relative ${
                selectedCategory === 'projects'
                  ? 'text-green-600 bg-green-50'
                  : 'text-gray-600'
              }`}
            >
              Projects
              {selectedCategory === 'projects' && (
                <div className="absolute bottom-0 left-0 right-0 h-1 bg-green-600"></div>
              )}
            </button>
            <button
              onClick={() => onCategoryChange('commercial')}
              className={`flex-1 py-4 px-4 font-semibold text-center text-sm transition-all relative ${
                selectedCategory === 'commercial'
                  ? 'text-orange-600 bg-orange-50'
                  : 'text-gray-600'
              }`}
            >
              Commercial
              {selectedCategory === 'commercial' && (
                <div className="absolute bottom-0 left-0 right-0 h-1 bg-orange-600"></div>
              )}
            </button>
          </div>

          <div className="flex-1 overflow-y-auto p-6">
            {(selectedCategory === 'buy' || selectedCategory === 'rent') && (
              <div className="mb-4">
                <div className="flex gap-2 bg-gray-100 rounded-lg p-1">
                  {selectedCategory === 'buy' ? (
                    <>
                      <button
                        onClick={() => setPropertySubType('residential')}
                        className={`flex-1 py-2.5 px-4 rounded-xl text-sm font-extrabold transition-all duration-300 border-2 ${
                          propertySubType === 'residential'
                            ? 'bg-blue-600 text-white border-blue-600 shadow-md shadow-blue-500/25 scale-[1.02]'
                            : 'bg-white/80 text-gray-600 border-gray-200 hover:text-gray-900 hover:border-gray-300'
                        }`}
                      >
                        Residential
                      </button>
                      <button
                        onClick={() => setPropertySubType('plot')}
                        className={`flex-1 py-2.5 px-4 rounded-xl text-sm font-extrabold transition-all duration-300 border-2 ${
                          propertySubType === 'plot'
                            ? 'bg-green-600 text-white border-green-600 shadow-md shadow-green-500/25 scale-[1.02]'
                            : 'bg-white/80 text-gray-600 border-gray-200 hover:text-gray-900 hover:border-gray-300'
                        }`}
                      >
                        Plot
                      </button>
                    </>
                  ) : (
                    <>
                      <button
                        onClick={() => setPropertySubType('residential')}
                        className={`flex-1 py-2.5 px-4 rounded-xl text-sm font-extrabold transition-all duration-300 border-2 ${
                          propertySubType === 'residential'
                            ? 'bg-rose-600 text-white border-rose-600 shadow-md shadow-rose-500/25 scale-[1.02]'
                            : 'bg-white/80 text-gray-600 border-gray-200 hover:text-gray-900 hover:border-gray-300'
                        }`}
                      >
                        House/Flat
                      </button>
                      <button
                        onClick={() => setPropertySubType('pg')}
                        className={`flex-1 py-2.5 px-4 rounded-xl text-sm font-extrabold transition-all duration-300 border-2 ${
                          propertySubType === 'pg'
                            ? 'bg-amber-600 text-white border-amber-600 shadow-md shadow-amber-500/25 scale-[1.02]'
                            : 'bg-white/80 text-gray-600 border-gray-200 hover:text-gray-900 hover:border-gray-300'
                        }`}
                      >
                        PG/Hostel
                      </button>
                    </>
                  )}
                </div>
              </div>
            )}
            {renderFilterContent()}
          </div>

          <div className="sticky bottom-0 bg-white border-t border-gray-200 p-6">
            <button
              onClick={handleApplyFilters}
              className="w-full bg-gradient-to-r from-blue-600 to-blue-700 text-white py-4 rounded-full font-semibold text-base shadow-lg hover:shadow-xl transition-all"
            >
              View {activeFilterCount > 0 ? 'Filtered' : 'All'} Properties
            </button>
          </div>
        </div>
      </div>
    </>
  )
}
