import { SupabaseClient } from '@supabase/supabase-js'
import { supabase } from './supabase'

export async function getLocalityIdByName(localityName: string): Promise<string | null> {
  const { data } = await supabase
    .from('localities')
    .select('id')
    .eq('city', 'Visakhapatnam')
    .ilike('name', localityName)
    .maybeSingle()

  return data?.id || null
}

export async function getLocalityIdBySlug(slug: string): Promise<string | null> {
  const { data } = await supabase
    .from('localities')
    .select('id')
    .eq('city', 'Visakhapatnam')
    .eq('slug', slug)
    .maybeSingle()

  return data?.id || null
}

export async function searchLocalities(query: string, limit: number = 10): Promise<Array<{id: string, name: string, slug: string}>> {
  if (query.length < 3) {
    return []
  }

  const { data } = await supabase
    .from('localities')
    .select('id, name, slug')
    .eq('city', 'Visakhapatnam')
    .ilike('name', `${query}%`)
    .order('name')
    .limit(limit)

  return data || []
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

export async function normalizeLocality(input: string): Promise<string | null> {
  const normalized = input.toLowerCase().trim()

  if (normalized.length < 3) {
    return null
  }

  const localities = await searchLocalities(normalized, 1)
  return localities.length > 0 ? localities[0].slug : null
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

export interface StrictSearchFilters {
  city?: string
  locality_id?: string
  locality_name?: string
  property_type?: string
  listing_type?: 'sale' | 'rent'
  bedrooms?: number
  min_price?: number
  max_price?: number
  min_area?: number
  max_area?: number
  status?: 'active' | 'sold' | 'rented' | 'inactive'
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
      status: 'active'
    }
  },
  'flats-for-sale-in-vizag': {
    category_type: 'flats-sale',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'flat',
      listing_type: 'sale',
      status: 'active'
    }
  },
  'flats-for-rent-vizag': {
    category_type: 'flats-rent',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'flat',
      listing_type: 'rent',
      status: 'active'
    }
  },
  'villas-in-vizag': {
    category_type: 'villas',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'villa',
      listing_type: 'sale',
      status: 'active'
    }
  },
  'pg-hostels-in-vizag': {
    category_type: 'pg-hostels',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'pg',
      listing_type: 'rent',
      status: 'active'
    }
  },
  'gated-community-plots-vizag': {
    category_type: 'gated-plots',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'plot',
      listing_type: 'sale',
      status: 'active'
    }
  },
  'residential-property-in-vizag': {
    category_type: 'residential',
    immutable_filters: {
      city: 'Vizag',
      listing_type: 'sale',
      status: 'active'
    }
  }
}

export async function getLocalityContextBySlug(slug: string): Promise<CategoryContext | null> {
  const localityId = await getLocalityIdBySlug(slug)

  if (!localityId) {
    return null
  }

  return {
    category_type: 'locality',
    immutable_filters: {
      city: 'Visakhapatnam',
      locality_id: localityId,
      status: 'active'
    }
  }
}

export function getLocalityContextById(localityId: string): CategoryContext {
  return {
    category_type: 'locality',
    immutable_filters: {
      city: 'Visakhapatnam',
      locality_id: localityId,
      status: 'active'
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

  if (finalFilters.locality_id) {
    query = query.eq('locality_id', finalFilters.locality_id)
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

export async function extractFiltersFromURL(): Promise<StrictSearchFilters> {
  const params = new URLSearchParams(window.location.search)
  const filters: StrictSearchFilters = {}

  const location = params.get('location') || params.get('locality')
  if (location && location.length >= 3) {
    const localityId = await getLocalityIdByName(location)
    if (localityId) {
      filters.locality_id = localityId
      filters.city = 'Visakhapatnam'
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

export async function parseNaturalLanguageQuery(query: string): Promise<StrictSearchFilters> {
  const filters: StrictSearchFilters = {}
  const lowerQuery = query.toLowerCase()

  if (lowerQuery.includes('vizag') || lowerQuery.includes('visakhapatnam')) {
    filters.city = 'Visakhapatnam'
  }

  const words = query.split(/\s+/)
  for (const word of words) {
    if (word.length >= 3) {
      const localities = await searchLocalities(word, 1)
      if (localities.length > 0) {
        filters.locality_id = localities[0].id
        filters.locality_name = localities[0].name
        filters.city = 'Visakhapatnam'
        break
      }
    }
  }

  const propertyType = normalizePropertyType(query)
  if (propertyType) {
    filters.property_type = propertyType
  }

  if (lowerQuery.includes('for sale') || lowerQuery.includes('buy')) {
    filters.listing_type = 'sale'
  } else if (lowerQuery.includes('for rent') || lowerQuery.includes('rent')) {
    filters.listing_type = 'rent'
  }

  const bhkMatch = lowerQuery.match(/(\d+)\s*bhk/)
  if (bhkMatch) {
    filters.bedrooms = parseInt(bhkMatch[1])
  }

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

export function validateSearchFilters(filters: StrictSearchFilters): {
  isValid: boolean
  missingFields: string[]
  message?: string
} {
  const missingFields: string[] = []

  if (!filters.city && !filters.locality_id) {
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

  if (filters.locality_name) {
    parts.push(`in ${filters.locality_name}`)
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
