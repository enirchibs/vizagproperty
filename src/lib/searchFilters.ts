import { SupabaseClient } from '@supabase/supabase-js'

// Locality normalization map - converts user input to database-friendly slugs
export const LOCALITY_MAP: Record<string, string[]> = {
  'madhurawada': ['madhurawada', 'madhurwada', 'madhurvada', 'madhurawada vizag'],
  'pm-palem': ['pm palem', 'pmpalem', 'pm-palem', 'p m palem', 'pm palem vizag'],
  'yendada': ['yendada', 'endada', 'yendada vizag'],
  'mvp-colony': ['mvp colony', 'mvp', 'mvpcolony', 'mvp colony vizag'],
  'gajuwaka': ['gajuwaka', 'gajjuwaka', 'gajuvaka', 'gajuwaka vizag'],
  'kommadi': ['kommadi', 'komadi', 'kommadi vizag'],
  'rushikonda': ['rushikonda', 'rushikonda beach', 'rushikonda vizag'],
  'seethammadhara': ['seethammadhara', 'seethamadhara', 'seethammadhara vizag'],
  'dwaraka-nagar': ['dwaraka nagar', 'dwarakanagar', 'dwarka nagar'],
  'pedagantyada': ['pedagantyada', 'pedda gantyada', 'pedagantyada vizag'],
  'akkayyapalem': ['akkayyapalem', 'akkayapalem', 'akkayyapalem vizag'],
  'cbm-compound': ['cbm compound', 'cbm', 'cbm compound vizag'],
  'kapuluppada': ['kapuluppada', 'kapulupada', 'kapuluppada vizag'],
  'bheemunipatnam': ['bheemunipatnam', 'bheemili', 'bhimli', 'bheemunipatnam vizag'],
  'anandapuram': ['anandapuram', 'anandpuram', 'anandapuram vizag'],
  'pendurthi': ['pendurthi', 'pendurthy', 'pendurthi vizag'],
  'nad-junction': ['nad junction', 'nad', 'nad junction vizag'],
  'au-college': ['au college', 'au', 'andhra university', 'au college vizag'],
  'asilmetta': ['asilmetta', 'asilmeta', 'asilmetta vizag'],
  'kirlampudi': ['kirlampudi', 'kirlampudi vizag'],
  'chinagadili': ['chinagadili', 'chinagadili vizag'],
  'rtc-colony': ['rtc colony', 'rtc', 'rtc colony vizag']
}

// Property type normalization
export const PROPERTY_TYPE_MAP: Record<string, string[]> = {
  'flat': ['flat', 'apartment', 'flats', 'apartments', '2 bhk', '3 bhk', 'bhk'],
  'villa': ['villa', 'villas', 'independent villa', 'independent house'],
  'plot': ['plot', 'plots', 'land', 'open plot', 'residential plot', 'plot for sale'],
  'commercial': ['commercial', 'office', 'shop', 'showroom', 'commercial space'],
  'penthouse': ['penthouse', 'penthouses'],
  'farmhouse': ['farmhouse', 'farm house', 'farm'],
  'pg': ['pg', 'hostel', 'paying guest'],
}

// Normalize locality name to slug
export function normalizeLocality(input: string): string | null {
  const normalized = input.toLowerCase().trim()

  for (const [slug, variants] of Object.entries(LOCALITY_MAP)) {
    if (variants.some(variant => normalized.includes(variant))) {
      return slug
    }
  }

  return null
}

// Normalize property type
export function normalizePropertyType(input: string): string | null {
  const normalized = input.toLowerCase().trim()

  for (const [type, variants] of Object.entries(PROPERTY_TYPE_MAP)) {
    if (variants.some(variant => normalized.includes(variant))) {
      return type
    }
  }

  return null
}

// Property search filters interface with strict typing
export interface StrictSearchFilters {
  city?: string // EXACT match (case-insensitive)
  locality_slug?: string // EXACT match using normalized slug
  property_type?: string // EXACT match
  listing_type?: 'sale' | 'rent' // EXACT match
  bedrooms?: number
  min_price?: number
  max_price?: number
  min_area?: number
  max_area?: number
  status?: 'available' | 'sold' | 'rented' | 'inactive'
}

// Immutable category filters - CANNOT be overridden by user
export interface CategoryContext {
  category_type: 'vmrda-plots' | 'flats-sale' | 'flats-rent' | 'villas' | 'pg-hostels' | 'gated-plots' | 'residential' | 'locality'
  immutable_filters: StrictSearchFilters
}

// Category definitions with immutable filters
export const CATEGORY_CONTEXTS: Record<string, CategoryContext> = {
  'vmrda-approved-plots-vizag': {
    category_type: 'vmrda-plots',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'plot',
      listing_type: 'sale',
      status: 'available'
    }
  },
  'flats-for-sale-in-vizag': {
    category_type: 'flats-sale',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'flat',
      listing_type: 'sale',
      status: 'available'
    }
  },
  'flats-for-rent-vizag': {
    category_type: 'flats-rent',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'flat',
      listing_type: 'rent',
      status: 'available'
    }
  },
  'villas-in-vizag': {
    category_type: 'villas',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'villa',
      listing_type: 'sale',
      status: 'available'
    }
  },
  'pg-hostels-in-vizag': {
    category_type: 'pg-hostels',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'pg',
      listing_type: 'rent',
      status: 'available'
    }
  },
  'gated-community-plots-vizag': {
    category_type: 'gated-plots',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'plot',
      listing_type: 'sale',
      status: 'available'
    }
  },
  'residential-property-in-vizag': {
    category_type: 'residential',
    immutable_filters: {
      city: 'Vizag',
      listing_type: 'sale',
      status: 'available'
    }
  }
}

// Locality-specific immutable filters
export function getLocalityContext(localitySlug: string): CategoryContext {
  return {
    category_type: 'locality',
    immutable_filters: {
      city: 'Vizag',
      locality_slug: localitySlug,
      status: 'available'
    }
  }
}

// Build Supabase query with strict filters
export function buildStrictQuery(
  supabase: SupabaseClient,
  baseFilters: StrictSearchFilters,
  userFilters?: StrictSearchFilters,
  categoryContext?: CategoryContext
) {
  let query = supabase
    .from('properties')
    .select('*')

  // Apply immutable category filters FIRST (cannot be overridden)
  const immutableFilters = categoryContext?.immutable_filters || {}
  const finalFilters = { ...baseFilters, ...immutableFilters, ...userFilters }

  // But ensure immutable filters cannot be overridden
  Object.keys(immutableFilters).forEach(key => {
    const typedKey = key as keyof StrictSearchFilters
    ;(finalFilters as any)[typedKey] = immutableFilters[typedKey]
  })

  // Apply filters in strict order

  // MANDATORY: Status filter (always available)
  query = query.eq('status', finalFilters.status || 'available')

  // STRICT LOCATION FILTER - EXACT match
  if (finalFilters.city) {
    query = query.ilike('city', finalFilters.city)
  }

  if (finalFilters.locality_slug) {
    // Convert slug to proper case for location field
    const localityName = finalFilters.locality_slug
      .split('-')
      .map(word => word.charAt(0).toUpperCase() + word.slice(1))
      .join(' ')
    query = query.ilike('location', `%${localityName}%`)
  }

  // STRICT PROPERTY TYPE FILTER - EXACT match
  if (finalFilters.property_type) {
    query = query.eq('property_type', finalFilters.property_type)
  }

  // STRICT LISTING TYPE FILTER - EXACT match
  if (finalFilters.listing_type) {
    query = query.eq('listing_type', finalFilters.listing_type)
  }

  // OPTIONAL FILTERS
  if (finalFilters.bedrooms) {
    query = query.eq('bedrooms', finalFilters.bedrooms)
  }

  if (finalFilters.min_price) {
    query = query.gte('price', finalFilters.min_price)
  }

  if (finalFilters.max_price) {
    query = query.lte('price', finalFilters.max_price)
  }

  if (finalFilters.min_area) {
    query = query.gte('area_sqft', finalFilters.min_area)
  }

  if (finalFilters.max_area) {
    query = query.lte('area_sqft', finalFilters.max_area)
  }

  return query.order('created_at', { ascending: false })
}

// Extract filters from URL parameters
export function extractFiltersFromURL(): StrictSearchFilters {
  const params = new URLSearchParams(window.location.search)
  const filters: StrictSearchFilters = {}

  const location = params.get('location') || params.get('locality')
  if (location) {
    const slug = normalizeLocality(location)
    if (slug) {
      filters.locality_slug = slug
      filters.city = 'Vizag'
    }
  }

  const city = params.get('city')
  if (city) {
    filters.city = city
  }

  const propertyType = params.get('type') || params.get('property_type')
  if (propertyType) {
    const normalized = normalizePropertyType(propertyType)
    if (normalized) {
      filters.property_type = normalized
    }
  }

  const listingType = params.get('listing_type')
  if (listingType === 'sale' || listingType === 'rent') {
    filters.listing_type = listingType
  }

  const bedrooms = params.get('bedrooms') || params.get('bhk')
  if (bedrooms) {
    filters.bedrooms = parseInt(bedrooms)
  }

  const minPrice = params.get('min_price')
  if (minPrice) {
    filters.min_price = parseInt(minPrice)
  }

  const maxPrice = params.get('max_price')
  if (maxPrice) {
    filters.max_price = parseInt(maxPrice)
  }

  return filters
}

// Parse natural language query to extract filters
export function parseNaturalLanguageQuery(query: string): StrictSearchFilters {
  const filters: StrictSearchFilters = {}
  const lowerQuery = query.toLowerCase()

  // Extract location
  const localitySlug = normalizeLocality(query)
  if (localitySlug) {
    filters.locality_slug = localitySlug
    filters.city = 'Vizag'
  } else if (lowerQuery.includes('vizag') || lowerQuery.includes('visakhapatnam')) {
    filters.city = 'Vizag'
  }

  // Extract property type
  const propertyType = normalizePropertyType(query)
  if (propertyType) {
    filters.property_type = propertyType
  }

  // Extract listing type
  if (lowerQuery.includes('for sale') || lowerQuery.includes('buy')) {
    filters.listing_type = 'sale'
  } else if (lowerQuery.includes('for rent') || lowerQuery.includes('rent')) {
    filters.listing_type = 'rent'
  }

  // Extract BHK
  const bhkMatch = lowerQuery.match(/(\d+)\s*bhk/)
  if (bhkMatch) {
    filters.bedrooms = parseInt(bhkMatch[1])
  }

  // Extract price
  const lakhMatch = lowerQuery.match(/(\d+)\s*(?:lakh|lakhs|l)/i)
  if (lakhMatch) {
    const lakhs = parseInt(lakhMatch[1])
    if (lowerQuery.includes('under') || lowerQuery.includes('below')) {
      filters.max_price = lakhs * 100000
    }
  }

  const croreMatch = lowerQuery.match(/(\d+)\s*(?:crore|cr)/i)
  if (croreMatch) {
    const crores = parseInt(croreMatch[1])
    if (lowerQuery.includes('under') || lowerQuery.includes('below')) {
      filters.max_price = crores * 10000000
    }
  }

  return filters
}

// Validate filters completeness for search
export function validateSearchFilters(filters: StrictSearchFilters): {
  isValid: boolean
  missingFields: string[]
  message?: string
} {
  const missingFields: string[] = []

  if (!filters.city && !filters.locality_slug) {
    missingFields.push('location')
  }

  if (!filters.property_type) {
    missingFields.push('property type')
  }

  if (!filters.listing_type) {
    missingFields.push('buy or rent')
  }

  if (missingFields.length > 0) {
    return {
      isValid: false,
      missingFields,
      message: `Please specify: ${missingFields.join(', ')}`
    }
  }

  return { isValid: true, missingFields: [] }
}

// Get nearby localities for suggestions when no results found
export function getNearbyLocalities(localitySlug: string): string[] {
  const nearbyMap: Record<string, string[]> = {
    'madhurawada': ['pm-palem', 'yendada', 'rushikonda'],
    'pm-palem': ['madhurawada', 'kommadi', 'anandapuram'],
    'yendada': ['madhurawada', 'rushikonda', 'mvp-colony'],
    'mvp-colony': ['seethammadhara', 'dwaraka-nagar', 'yendada'],
    'gajuwaka': ['pedagantyada', 'pendurthi', 'anandapuram'],
    'rushikonda': ['yendada', 'madhurawada']
  }

  return nearbyMap[localitySlug] || []
}

// Generate SEO-friendly search description
export function generateSearchDescription(filters: StrictSearchFilters): string {
  const parts: string[] = []

  if (filters.bedrooms) {
    parts.push(`${filters.bedrooms} BHK`)
  }

  if (filters.property_type) {
    parts.push(filters.property_type)
  }

  if (filters.listing_type) {
    parts.push(`for ${filters.listing_type}`)
  }

  if (filters.locality_slug) {
    const localityName = filters.locality_slug
      .split('-')
      .map(word => word.charAt(0).toUpperCase() + word.slice(1))
      .join(' ')
    parts.push(`in ${localityName}`)
  } else if (filters.city) {
    parts.push(`in ${filters.city}`)
  }

  if (filters.max_price) {
    const lakhs = filters.max_price / 100000
    if (lakhs >= 100) {
      parts.push(`under ₹${lakhs / 10} Cr`)
    } else {
      parts.push(`under ₹${lakhs}L`)
    }
  }

  return parts.join(' ')
}
