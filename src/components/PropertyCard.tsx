import { Heart, MapPin, Bed, Maximize, MessageCircle, CheckCircle } from 'lucide-react'
import { Property } from '../types'
import { useState } from 'react'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import { openWhatsApp } from '../lib/whatsapp'

interface PropertyCardProps {
  property: Property
  onFavoriteChange?: () => void
}

export function PropertyCard({ property, onFavoriteChange }: PropertyCardProps) {
  const { user } = useAuth()
  const [isFavorite, setIsFavorite] = useState(false)
  const [loading, setLoading] = useState(false)

  const formatPrice = (price: number) => {
    if (price >= 10000000) {
      return `₹${(price / 10000000).toFixed(2)} Cr`
    } else if (price >= 100000) {
      return `₹${(price / 100000).toFixed(2)} L`
    }
    return `₹${price.toLocaleString('en-IN')}`
  }

  const handleFavoriteToggle = async (e: React.MouseEvent) => {
    e.preventDefault()
    if (!user) return

    setLoading(true)
    try {
      if (isFavorite) {
        await supabase
          .from('favorites')
          .delete()
          .eq('user_id', user.id)
          .eq('property_id', property.id)
        setIsFavorite(false)
      } else {
        await supabase
          .from('favorites')
          .insert({ user_id: user.id, property_id: property.id })
        setIsFavorite(true)
      }
      onFavoriteChange?.()
    } catch (error) {
      console.error('Error toggling favorite:', error)
    } finally {
      setLoading(false)
    }
  }

  const handleWhatsAppInquiry = (e: React.MouseEvent) => {
    e.preventDefault()
    openWhatsApp(
      `Hi, I'm interested in this ${property.property_type} in ${property.location}, Vizag listed on VizagProperty. Please share more details.`
    )
  }

  const mainImage = property.images[0] || 'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&w=800'

  return (
    <a
      href={`/property/${property.id}`}
      className="group bg-white rounded-2xl overflow-hidden shadow-lg hover:shadow-2xl transition-all duration-300 border border-gray-200 hover:border-primary-300 hover:-translate-y-1"
    >
      <div className="relative h-48 md:h-56 overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-t from-black/50 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 z-10"></div>
        <img
          src={mainImage}
          alt={`${property.listing_type === 'rent' ? 'Flats for rent' : 'Property for sale'} in ${property.location} - ${property.title}`}
          className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
        />
        {user && (
          <button
            onClick={handleFavoriteToggle}
            disabled={loading}
            className="absolute top-3 right-3 bg-white/90 backdrop-blur-sm p-2.5 md:p-2 rounded-full shadow-lg hover:scale-110 transition-transform z-20 min-h-[44px] min-w-[44px] md:min-h-0 md:min-w-0 flex items-center justify-center"
          >
            <Heart
              className={`h-5 w-5 ${isFavorite ? 'fill-red-500 text-red-500' : 'text-gray-600'}`}
            />
          </button>
        )}
        <div className="absolute top-3 left-3 flex flex-wrap gap-2 z-20">
          {property.featured && (
            <span className="bg-gradient-to-r from-yellow-500 to-yellow-600 text-white px-3 py-1.5 rounded-full text-xs md:text-xs font-semibold shadow-lg">
              Featured
            </span>
          )}
          {property.verified && (
            <span className="bg-gradient-to-r from-green-500 to-green-600 text-white px-3 py-1.5 rounded-full text-xs md:text-xs font-semibold shadow-lg flex items-center gap-1">
              <CheckCircle className="h-3 w-3" />
              Verified
            </span>
          )}
        </div>
      </div>

      <div className="p-4 md:p-5">
        <div className="flex items-start justify-between mb-2 gap-2">
          <h3 className="text-base md:text-lg font-bold text-gray-900 line-clamp-2 group-hover:text-primary-600 transition-colors">
            {property.title}
          </h3>
          <span className="hidden md:inline-flex text-xs px-2.5 py-1 bg-gradient-to-r from-primary-50 to-primary-100 text-primary-700 rounded-full capitalize font-semibold border border-primary-200 whitespace-nowrap">
            {property.listing_type}
          </span>
        </div>

        <div className="flex items-center text-gray-600 text-sm mb-3">
          <MapPin className="h-4 w-4 mr-1.5 text-primary-500 flex-shrink-0" />
          <span className="line-clamp-1 font-medium">{property.location}</span>
        </div>

        <div className="flex items-center gap-4 md:gap-4 text-gray-700 text-sm mb-4 pb-3 border-b border-gray-100">
          {property.bedrooms && property.bedrooms > 0 && (
            <div className="flex items-center gap-1">
              <Bed className="h-4 w-4 text-primary-500" />
              <span className="font-semibold">{property.bedrooms} BHK</span>
            </div>
          )}
          <div className="flex items-center gap-1">
            <Maximize className="h-4 w-4 text-primary-500" />
            <span className="font-semibold">{property.area_sqft} sqft</span>
          </div>
        </div>

        <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3">
          <div className="text-2xl md:text-2xl font-bold bg-gradient-to-r from-primary-600 to-primary-700 bg-clip-text text-transparent">
            {formatPrice(property.price)}
          </div>
          <button
            onClick={handleWhatsAppInquiry}
            className="w-full sm:w-auto flex items-center justify-center gap-2 px-6 py-3 bg-gradient-to-r from-green-600 to-green-700 text-white rounded-xl hover:from-green-700 hover:to-green-800 transition-all text-base font-semibold shadow-md hover:shadow-lg min-h-[44px] active:scale-95"
          >
            <MessageCircle className="h-5 w-5" />
            <span>WhatsApp</span>
          </button>
        </div>
      </div>
    </a>
  )
}
