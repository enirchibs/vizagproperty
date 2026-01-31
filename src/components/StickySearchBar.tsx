import { useState } from 'react'
import { Search, X, MapPin } from 'lucide-react'
import { LocationAutocomplete } from './LocationAutocomplete'

interface StickySearchBarProps {
  onSearch?: (locality: string) => void
  placeholder?: string
}

export function StickySearchBar({ onSearch, placeholder = "Search locality (3+ letters)" }: StickySearchBarProps) {
  const [searchQuery, setSearchQuery] = useState('')
  const [showAutocomplete, setShowAutocomplete] = useState(false)

  const handleLocationSelect = (locality: string) => {
    setSearchQuery(locality)
    setShowAutocomplete(false)
    if (onSearch) {
      onSearch(locality)
    }
  }

  const handleSearchClick = () => {
    if (searchQuery.trim() && onSearch) {
      onSearch(searchQuery)
    }
  }

  const handleClear = () => {
    setSearchQuery('')
    setShowAutocomplete(false)
  }

  return (
    <div className="sticky top-14 md:top-[72px] z-40 bg-white border-b border-gray-200 shadow-sm">
      <div className="max-w-7xl mx-auto px-4 py-3">
        <div className="relative">
          <div className="flex items-center gap-2">
            <div className="relative flex-1">
              <MapPin className="absolute left-3 top-1/2 -translate-y-1/2 h-5 w-5 text-gray-400" />
              <input
                type="text"
                value={searchQuery}
                onChange={(e) => {
                  setSearchQuery(e.target.value)
                  setShowAutocomplete(e.target.value.length >= 3)
                }}
                onFocus={() => searchQuery.length >= 3 && setShowAutocomplete(true)}
                placeholder={placeholder}
                className="w-full pl-10 pr-10 py-3 md:py-3.5 border-2 border-gray-300 rounded-xl focus:outline-none focus:border-primary-500 text-base md:text-lg font-medium"
              />
              {searchQuery && (
                <button
                  onClick={handleClear}
                  className="absolute right-3 top-1/2 -translate-y-1/2 p-1 hover:bg-gray-100 rounded-full transition-colors"
                  aria-label="Clear search"
                >
                  <X className="h-5 w-5 text-gray-400" />
                </button>
              )}
            </div>
            <button
              onClick={handleSearchClick}
              disabled={!searchQuery.trim()}
              className="px-6 md:px-8 py-3 md:py-3.5 bg-primary-600 text-white rounded-xl font-semibold hover:bg-primary-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed whitespace-nowrap text-base md:text-lg flex items-center gap-2"
            >
              <Search className="h-5 w-5" />
              <span className="hidden sm:inline">Search</span>
            </button>
          </div>

          {showAutocomplete && searchQuery.length >= 3 && (
            <div className="absolute top-full left-0 right-0 mt-2 z-50">
              <LocationAutocomplete
                value={searchQuery}
                onChange={(value) => {
                  handleLocationSelect(value)
                }}
                placeholder="Select locality"
              />
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
