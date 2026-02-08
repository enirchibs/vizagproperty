import { createContext, useContext, useState, ReactNode } from 'react'

export type ListingType = 'buy' | 'rent' | 'commercial'
export type PropertyCategory = 'residential' | 'commercial'

interface SearchContextType {
  // Primary filters
  listingType: ListingType
  setListingType: (type: ListingType) => void
  propertyCategory: PropertyCategory
  setPropertyCategory: (category: PropertyCategory) => void

  // Location
  locality: string
  setLocality: (locality: string) => void
  localityId: string | undefined
  setLocalityId: (id: string | undefined) => void

  // Property sub-type (derived from listingType + propertyCategory)
  propertySubType: string | null
  setPropertySubType: (type: string | null) => void

  // Additional filters
  bhkFilter: string
  setBhkFilter: (bhk: string) => void
  propertyStatus: string
  setPropertyStatus: (status: string) => void
  newBuilderProjects: boolean
  setNewBuilderProjects: (value: boolean) => void
  priceRange: [number, number]
  setPriceRange: (range: [number, number]) => void

  // Search state
  hasSearched: boolean
  setHasSearched: (value: boolean) => void

  // Helper functions
  resetFilters: () => void
  getDefaultSubType: (listing: ListingType, category: PropertyCategory) => string | null
  getPropertyTypeForSearch: () => 'flat' | 'plot' | 'villa' | 'pg' | 'commercial' | undefined
}

const SearchContext = createContext<SearchContextType | undefined>(undefined)

export function SearchProvider({ children }: { children: ReactNode }) {
  const [listingType, setListingType] = useState<ListingType>('buy')
  const [propertyCategory, setPropertyCategory] = useState<PropertyCategory>('residential')
  const [propertySubType, setPropertySubType] = useState<string | null>('Flat / Apartment')
  const [locality, setLocality] = useState('')
  const [localityId, setLocalityId] = useState<string | undefined>()
  const [bhkFilter, setBhkFilter] = useState<string>('')
  const [propertyStatus, setPropertyStatus] = useState<string>('')
  const [newBuilderProjects, setNewBuilderProjects] = useState(false)
  const [priceRange, setPriceRange] = useState<[number, number]>([0, 10000000])
  const [hasSearched, setHasSearched] = useState(false)

  const getDefaultSubType = (_listing: ListingType, category: PropertyCategory): string | null => {
    if (category === 'commercial') return null
    return 'Flat / Apartment'
  }

  const getPropertyTypeForSearch = (): 'flat' | 'plot' | 'villa' | 'pg' | 'commercial' | undefined => {
    if (propertyCategory === 'commercial') return 'commercial'

    if (!propertySubType) return undefined

    if (propertySubType === 'Land / Plot') return 'plot'
    if (propertySubType === 'Villa') return 'villa'
    if (propertySubType === 'PG / Hostel' || propertySubType === 'Flatmates') return 'pg'
    if (propertySubType === 'Flat / Apartment' || propertySubType === 'Full House') return 'flat'

    return undefined
  }

  const resetFilters = () => {
    setPropertySubType(getDefaultSubType(listingType, propertyCategory))
    setBhkFilter('')
    setPropertyStatus('')
    setNewBuilderProjects(false)
    setPriceRange([0, 10000000])
  }

  const value: SearchContextType = {
    listingType,
    setListingType,
    propertyCategory,
    setPropertyCategory,
    locality,
    setLocality,
    localityId,
    setLocalityId,
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
    hasSearched,
    setHasSearched,
    resetFilters,
    getDefaultSubType,
    getPropertyTypeForSearch,
  }

  return <SearchContext.Provider value={value}>{children}</SearchContext.Provider>
}

export function useSearch() {
  const context = useContext(SearchContext)
  if (context === undefined) {
    throw new Error('useSearch must be used within a SearchProvider')
  }
  return context
}
