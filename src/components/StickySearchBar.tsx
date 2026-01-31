import { useState } from 'react'
import { X } from 'lucide-react'
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
    <div className="md:hidden sticky top-14 z-40 bg-white px-3 py-2 shadow-md">
      <div className="relative">
        <div className="flex gap-2">
          <div className="relative flex-1">
            <input
              type="text"
              value={searchQuery}
              onChange={(e) => {
                setSearchQuery(e.target.value)
                setShowAutocomplete(e.target.value.length >= 3)
              }}
              onFocus={() => searchQuery.length >= 3 && setShowAutocomplete(true)}
              placeholder={placeholder}
              className="w-full rounded-xl border border-gray-300 px-4 py-3 text-sm focus:outline-none focus:ring-2 focus:ring-primary-500"
            />
            {searchQuery && (
              <button
                onClick={handleClear}
                className="absolute right-3 top-1/2 -translate-y-1/2 p-1 hover:bg-gray-100 rounded-full transition-colors"
                aria-label="Clear search"
              >
                <X className="h-4 w-4 text-gray-400" />
              </button>
            )}
          </div>
          <button
            onClick={handleSearchClick}
            disabled={!searchQuery.trim()}
            className="bg-orange-500 text-white px-5 rounded-xl text-sm font-semibold hover:bg-orange-600 transition-colors disabled:opacity-50 disabled:cursor-not-allowed whitespace-nowrap"
          >
            Search
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
  )
}
