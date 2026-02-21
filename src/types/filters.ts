export interface AdvancedFilters {
  propertyType?: string
  bedrooms?: number[]
  bathrooms?: number[]
  furnishing?: string[]
  possession?: string[]
  saleType?: string[]
  amenities?: string[]
  coveredAreaMin?: number
  coveredAreaMax?: number
  areaUnit?: string
  commercialType?: string
  facing?: string[]
  boundaryWall?: boolean
  cornerPlot?: boolean
  tenantPreference?: string[]
  availableFrom?: string
  roomType?: string
  foodIncluded?: boolean
  gender?: string
  attachedBathroom?: boolean
  rentMin?: number
  rentMax?: number
  parking?: boolean
  washroom?: boolean
}

export type PropertyCategory = 'flat' | 'house' | 'villa' | 'plot' | 'commercial' | 'pg' | 'rent'
export type ListingType = 'buy' | 'rent' | 'projects' | 'commercial'

export const BEDROOM_OPTIONS = [1, 2, 3, 4, 5]
export const BATHROOM_OPTIONS = [1, 2, 3, 4, 5]

export const FURNISHING_OPTIONS = ['furnished', 'semi_furnished', 'unfurnished']
export const POSSESSION_OPTIONS = ['ready_to_move', 'under_construction']
export const SALE_TYPE_OPTIONS = ['new', 'resale']

export const AMENITIES_OPTIONS = [
  { value: 'parking', label: 'Parking' },
  { value: 'lift', label: 'Lift' },
  { value: 'security', label: 'Security' },
  { value: 'gym', label: 'Gym' },
  { value: 'swimming_pool', label: 'Swimming Pool' }
]

export const FACING_OPTIONS = ['north', 'south', 'east', 'west', 'north_east', 'north_west', 'south_east', 'south_west']

export const COMMERCIAL_TYPES = [
  { value: 'shop', label: 'Shop' },
  { value: 'office', label: 'Office' },
  { value: 'showroom', label: 'Showroom' },
  { value: 'warehouse', label: 'Warehouse' },
  { value: 'farmhouse', label: 'Farmhouse' },
  { value: 'coworking', label: 'Co-working' }
]

export const AREA_UNITS = [
  { value: 'sqft', label: 'Sq.ft' },
  { value: 'sqm', label: 'Sq.m' },
  { value: 'cents', label: 'Cents' },
  { value: 'acres', label: 'Acres' }
]

export const TENANT_PREFERENCES = [
  { value: 'family', label: 'Family' },
  { value: 'bachelor', label: 'Bachelor' },
  { value: 'company', label: 'Company' }
]

export const ROOM_TYPES = [
  { value: 'single', label: 'Single' },
  { value: 'double', label: 'Double' },
  { value: 'triple', label: 'Triple' }
]

export const GENDER_OPTIONS = [
  { value: 'male', label: 'Male' },
  { value: 'female', label: 'Female' },
  { value: 'any', label: 'Any' }
]
