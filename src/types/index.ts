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

export interface Property {
  id: string
  title: string
  description: string
  property_type: 'apartment' | 'villa' | 'plot' | 'commercial' | 'penthouse' | 'farmhouse'
  listing_type: 'sale' | 'rent'
  price: number
  bedrooms: number
  bathrooms: number
  area_sqft: number
  locality_id: string
  location?: string
  city?: string
  state: string
  pincode?: string
  latitude?: number
  longitude?: number
  amenities: string[]
  images: string[]
  video_url?: string
  status: 'pending' | 'approved' | 'rejected'
  featured: boolean
  verified: boolean
  owner_id?: string
  agent_name: string
  agent_phone: string
  agent_whatsapp?: string
  views_count: number
  created_at: string
  updated_at: string
  users?: {
    email?: string
    name?: string
    phone?: string
  }
}

export interface UserProfile {
  id: string
  full_name?: string
  name?: string
  username?: string
  phone?: string
  email?: string
  avatar_url?: string
  role: 'buyer' | 'owner' | 'agent' | 'admin'
  auth_provider?: 'phone' | 'email' | 'google' | 'microsoft'
  preferences?: Record<string, any>
  created_at: string
  updated_at: string
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
  amenities?: string[]
  radius_enabled?: boolean
  radius_km?: number
  center_latitude?: number
  center_longitude?: number
}
