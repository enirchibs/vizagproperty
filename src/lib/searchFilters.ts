import { SupabaseClient } from '@supabase/supabase-js'
import { supabase } from './supabase'
import { fuzzySearchLocalities } from './fuzzySearch'

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

  return await fuzzySearchLocalities(query, limit)
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
  status?: 'approved' | 'pending' | 'rejected'
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
      status: 'approved'
    }
  },
  'flats-for-sale-in-vizag': {
    category_type: 'flats-sale',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'flat',
      listing_type: 'sale',
      status: 'approved'
    }
  },
  'flats-for-rent-vizag': {
    category_type: 'flats-rent',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'flat',
      listing_type: 'rent',
      status: 'approved'
    }
  },
  'villas-in-vizag': {
    category_type: 'villas',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'villa',
      listing_type: 'sale',
      status: 'approved'
    }
  },
  'pg-hostels-in-vizag': {
    category_type: 'pg-hostels',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'pg',
      listing_type: 'rent',
      status: 'approved'
    }
  },
  'gated-community-plots-vizag': {
    category_type: 'gated-plots',
    immutable_filters: {
      city: 'Vizag',
      property_type: 'plot',
      listing_type: 'sale',
      status: 'approved'
    }
  },
  'residential-property-in-vizag': {
    category_type: 'residential',
    immutable_filters: {
      city: 'Vizag',
      listing_type: 'sale',
      status: 'approved'
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
      status: 'approved'
    }
  }
}

export function getLocalityContextById(localityId: string): CategoryContext {
  return {
    category_type: 'locality',
    immutable_filters: {
      city: 'Visakhapatnam',
      locality_id: localityId,
      status: 'approved'
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

// Property type mapping for search consistency
export const DB_PROPERTY_TYPE_MAP: Record<string, string> = {
  flat: 'flat_apartment',
  plot: 'plot_land',
  villa: 'independent_house_villa',
  pg: 'pg_hostel',
  commercial: 'commercial'
}

export interface UnifiedSearchParams {
  propertyType: 'flat' | 'plot' | 'villa' | 'pg' | 'commercial'
  listingType?: 'sale' | 'rent'
  localityId?: string
  localityName?: string
  bedrooms?: number | number[]
  bathrooms?: number | number[]
  minPrice?: number
  maxPrice?: number
  propertyStatus?: string
  keyword?: string
  possessionStatus?: string[]
  saleType?: string[]
  postedBy?: string[]
  furnishingStatus?: string[]
  amenities?: string[]
  minArea?: number
  maxArea?: number
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
  parking?: boolean
  washroom?: boolean
}

/**
 * Unified query builder for property search
 *
 * MANDATORY FILTERS (always applied):
 * - city = 'Visakhapatnam'
 * - status = 'approved'
 * - property_type = params.propertyType
 *
 * OPTIONAL FILTERS (applied ONLY if value exists):
 * - listing_type (only if provided)
 * - locality_id (only if provided)
 * - bedrooms (only if provided and > 0)
 * - min_price (only if provided and > 0)
 * - max_price (only if provided and < 10000000)
 * - property_status (only if provided)
 * - keyword (only if provided)
 */
export function buildUnifiedPropertyQuery(params: UnifiedSearchParams) {
  let query = supabase
    .from('properties')
    .select(`
      id,
      title,
      description,
      category,
      property_type,
      listing_type,
      price,
      bedrooms,
      bathrooms,
      area_sqft,
      locality_id,
      location,
      city,
      state,
      pincode,
      latitude,
      longitude,
      amenities,
      images,
      video_url,
      status,
      featured,
      verified,
      owner_id,
      agent_name,
      agent_phone,
      agent_whatsapp,
      views_count,
      created_at,
      updated_at,
      localities!inner(name, slug, city)
    `, { count: 'exact' })

  // MANDATORY FILTERS - Always applied
  query = query.eq('localities.city', 'Visakhapatnam')
  query = query.eq('status', 'approved')

  const dbPropertyType = DB_PROPERTY_TYPE_MAP[params.propertyType] || params.propertyType
  query = query.eq('property_type', dbPropertyType)

  // OPTIONAL FILTERS - Only applied if value exists
  if (params.listingType) {
    query = query.eq('listing_type', params.listingType)
  }

  if (params.localityId) {
    query = query.eq('locality_id', params.localityId)
  }

  if (params.bedrooms) {
    if (Array.isArray(params.bedrooms)) {
      if (params.bedrooms.length > 0) {
        query = query.in('bedrooms', params.bedrooms)
      }
    } else if (params.bedrooms > 0) {
      query = query.eq('bedrooms', params.bedrooms)
    }
  }

  if (params.bathrooms) {
    if (Array.isArray(params.bathrooms)) {
      if (params.bathrooms.length > 0) {
        query = query.in('bathrooms', params.bathrooms)
      }
    } else if (params.bathrooms > 0) {
      query = query.eq('bathrooms', params.bathrooms)
    }
  }

  if (params.minPrice !== undefined && params.minPrice > 0) {
    query = query.gte('price', params.minPrice)
  }

  if (params.maxPrice !== undefined && params.maxPrice < 10000000) {
    query = query.lte('price', params.maxPrice)
  }

  if (params.propertyStatus) {
    query = query.eq('property_status', params.propertyStatus)
  }

  if (params.keyword) {
    query = query.or(`title.ilike.%${params.keyword}%,description.ilike.%${params.keyword}%`)
  }

  if (params.possessionStatus?.length) {
    query = query.in('possession_status', params.possessionStatus)
  }

  if (params.saleType?.length) {
    query = query.in('sale_type', params.saleType)
  }

  if (params.postedBy?.length) {
    query = query.in('posted_by', params.postedBy)
  }

  if (params.furnishingStatus?.length) {
    query = query.in('furnishing_status', params.furnishingStatus)
  }

  if (params.amenities?.length) {
    query = query.contains('amenities', params.amenities)
  }

  if (params.minArea !== undefined && params.minArea > 0) {
    query = query.gte('area_sqft', params.minArea)
  }

  if (params.maxArea !== undefined && params.maxArea < 10000) {
    query = query.lte('area_sqft', params.maxArea)
  }

  if (params.commercialType) {
    query = query.eq('commercial_type', params.commercialType)
  }

  if (params.facing?.length) {
    query = query.in('facing', params.facing)
  }

  if (params.boundaryWall !== undefined) {
    query = query.eq('boundary_wall', params.boundaryWall)
  }

  if (params.cornerPlot !== undefined) {
    query = query.eq('corner_plot', params.cornerPlot)
  }

  if (params.tenantPreference?.length) {
    query = query.in('tenant_preference', params.tenantPreference)
  }

  if (params.availableFrom) {
    query = query.gte('available_from', params.availableFrom)
  }

  if (params.roomType) {
    query = query.eq('room_type', params.roomType)
  }

  if (params.foodIncluded !== undefined) {
    query = query.eq('food_included', params.foodIncluded)
  }

  if (params.gender) {
    query = query.eq('gender_preference', params.gender)
  }

  if (params.attachedBathroom !== undefined) {
    query = query.eq('attached_bathroom', params.attachedBathroom)
  }

  if (params.parking !== undefined) {
    query = query.eq('parking_available', params.parking)
  }

  if (params.washroom !== undefined) {
    query = query.eq('washroom_available', params.washroom)
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
