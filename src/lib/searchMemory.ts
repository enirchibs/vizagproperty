import { supabase } from './supabase'

interface LastSearchData {
  localityId: string
  localityName: string
  propertyType: string
  listingType: 'sale' | 'rent'
  savedAt: number
}

const STORAGE_KEY = 'vizag_last_search'
const EXPIRY_DAYS = 7

export const saveLastSearch = async (data: Omit<LastSearchData, 'savedAt'>) => {
  try {
    const searchData: LastSearchData = {
      ...data,
      savedAt: Date.now()
    }
    localStorage.setItem(STORAGE_KEY, JSON.stringify(searchData))

    const { data: { user } } = await supabase.auth.getUser()
    if (user) {
      await supabase
        .from('user_last_search')
        .upsert({
          user_id: user.id,
          locality_id: data.localityId,
          locality_name: data.localityName,
          property_type: data.propertyType,
          listing_type: data.listingType,
          updated_at: new Date().toISOString()
        }, {
          onConflict: 'user_id'
        })
    }
  } catch (error) {
  }
}

export const getLastSearch = (): Omit<LastSearchData, 'savedAt'> | null => {
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    if (!raw) return null

    const data: LastSearchData = JSON.parse(raw)

    const expiryTime = EXPIRY_DAYS * 24 * 60 * 60 * 1000
    if (Date.now() - data.savedAt > expiryTime) {
      localStorage.removeItem(STORAGE_KEY)
      return null
    }

    const { savedAt, ...searchData } = data
    return searchData
  } catch (error) {
    return null
  }
}

export const clearLastSearch = () => {
  try {
    localStorage.removeItem(STORAGE_KEY)
  } catch (error) {
  }
}
