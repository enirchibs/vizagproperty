export interface VizagLocality {
  id: string
  locality_name: string
  locality_slug: string
  city: string
  latitude: number
  longitude: number
  is_active: boolean
  created_at: string
}

export type PropertyCategory = 'residential' | 'commercial'

export type ResidentialPropertyType =
  | 'flat_apartment'
  | 'independent_house_villa'
  | 'plot_land'
  | 'pg_hostel'
  | 'farmhouse'
  | 'serviced_apartment'
  | 'other_residential'

export type CommercialPropertyType =
  | 'office'
  | 'shop'
  | 'showroom'
  | 'warehouse'
  | 'industrial_land'
  | 'commercial_plot'
  | 'commercial_farmhouse'
  | 'coworking_space'
  | 'other_commercial'

export type PropertyType = ResidentialPropertyType | CommercialPropertyType

export type ListingType = 'sale' | 'rent' | 'lease'

export interface Property {
  id: string
  title: string
  description: string
  category: PropertyCategory
  property_type: PropertyType
  listing_type: ListingType
  price: number
  bedrooms?: number
  bathrooms?: number
  area_sqft: number
  locality_id: string
  location?: string
  city?: string
  state?: string
  pincode?: string
  latitude?: number
  longitude?: number
  amenities?: string[]
  images?: string[]
  video_url?: string
  status: 'pending' | 'approved' | 'rejected'
  rejection_reason?: string
  approved_at?: string
  admin_notes?: string
  featured?: boolean
  verified?: boolean
  owner_id?: string
  agent_name?: string
  agent_phone?: string
  agent_whatsapp?: string
  views_count?: number
  created_at: string
  updated_at?: string
  is_vmrda_approved?: boolean
  localities?: {
    latitude?: number
    longitude?: number
    name?: string
    slug?: string
    city?: string
  } | {
    latitude?: number
    longitude?: number
    name?: string
    slug?: string
    city?: string
  }[]
  users?: {
    id: string
    email?: string
    name?: string
    phone?: string
    trusted: boolean
  }
}

export interface PropertyDetail {
  id: string
  property_id: string
  key: string
  value: string
}

export interface UserProfile {
  id: string
  full_name?: string
  name?: string
  username?: string
  phone?: string
  email?: string
  avatar_url?: string
  role: 'super_admin' | 'property_admin' | 'partner_admin' | 'partner' | 'user' | 'buyer' | 'owner' | 'agent' | 'admin'
  auth_provider?: 'phone' | 'email' | 'google' | 'microsoft'
  preferences?: Record<string, any>
  created_at: string
  updated_at: string
  is_partner?: boolean
  partner_status?: 'pending' | 'approved' | 'rejected' | 'suspended' | null
  partner_type?: string | null
  membership_type?: string
  partner_since?: string | null
  created_by?: string | null
  approved_by?: string | null
}

export interface PartnerApplication {
  id: string
  user_id: string
  full_name: string
  email: string
  mobile: string
  city: string
  partner_type: string
  company_name?: string
  status: 'pending' | 'approved' | 'rejected'
  created_at: string
}

export interface Favorite {
  id: string
  user_id: string
  property_id: string
  created_at: string
}

export interface ChatMessage {
  id: string
  user_id?: string
  session_id: string
  role: 'user' | 'assistant'
  message: string
  metadata?: Record<string, any>
  created_at: string
}

export interface SearchFilters {
  property_type?: string
  listing_type?: string
  locality_id?: string
  city?: string
  min_price?: number
  max_price?: number
  bedrooms?: number
  bathrooms?: number
  min_area?: number
  max_area?: number
  property_status?: string
  amenities?: string[]
  radius_enabled?: boolean
  radius_km?: number
  center_latitude?: number
  center_longitude?: number
}

export interface PartnerEnquiry {
  id: string
  created_at: string
  full_name: string
  mobile: string
  email: string
  city: string
  partner_type: 'Agent' | 'Builder' | 'Referral Partner' | string
  company_name?: string
  message?: string
}

export interface PartnerProfile {
  id: string
  created_at: string
  full_name: string
  mobile: string
  email: string
  city: string
  partner_type: string
  company_name?: string
  status: 'pending' | 'active' | 'inactive' | 'rejected'
  membership_type: 'free' | 'silver' | 'gold' | 'builder_pro'
  last_login?: string
}

export interface PartnerReferral {
  id: string
  partner_id: string
  customer_name: string
  customer_mobile: string
  requirement_type: string
  preferred_location?: string
  budget?: string
  remarks?: string
  lead_status: 'New' | 'Contacted' | 'Qualified' | 'Property Shared' | 'Site Visit Scheduled' | 'Negotiation' | 'Deal Closed' | 'Commission Approved' | 'Commission Paid' | 'Rejected'
  commission_amount: number
  created_at: string
  updated_at?: string
}
