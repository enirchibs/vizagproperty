import { Heart, CheckCircle } from 'lucide-react'
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
      className="block bg-white rounded-2xl shadow hover:shadow-lg transition-shadow p-3"
    >
      <div className="relative">
        <img
          src={mainImage}
          alt={`${property.listing_type === 'rent' ? 'Flats for rent' : 'Property for sale'} in ${property.location} - ${property.title}`}
          className="rounded-xl h-40 md:h-48 w-full object-cover"
        />
        {user && (
          <button
            onClick={handleFavoriteToggle}
            disabled={loading}
            className="absolute top-2 right-2 bg-white/90 backdrop-blur-sm p-2 rounded-full shadow hover:scale-110 transition-transform z-20 min-h-[40px] min-w-[40px] flex items-center justify-center"
          >
            <Heart
              className={`h-4 w-4 ${isFavorite ? 'fill-red-500 text-red-500' : 'text-gray-600'}`}
            />
          </button>
        )}
        <div className="absolute top-2 left-2 flex flex-wrap gap-1.5 z-20">
          {property.featured && (
            <span className="bg-yellow-500 text-white px-2 py-0.5 rounded-full text-xs font-semibold shadow">
              Featured
            </span>
          )}
          {property.verified && (
            <span className="bg-green-500 text-white px-2 py-0.5 rounded-full text-xs font-semibold shadow flex items-center gap-1">
              <CheckCircle className="h-3 w-3" />
              Verified
            </span>
          )}
        </div>
      </div>

      <div className="mt-3">
        <p className="text-lg font-bold text-gray-900">
          {formatPrice(property.price)}
        </p>
        <p className="text-sm text-gray-600 mt-0.5">{property.location}</p>

        <p className="text-xs text-gray-500 mt-1">
          {property.bedrooms && property.bedrooms > 0 ? `${property.bedrooms} BHK • ` : ''}{property.area_sqft} sqft
        </p>

        <div className="flex gap-2 mt-3">
          <a
            href="tel:7207550499"
            onClick={(e) => e.stopPropagation()}
            className="flex-1 border border-gray-300 rounded-lg py-2 text-center text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors"
          >
            Call
          </a>

          <button
            onClick={handleWhatsAppInquiry}
            className="flex-1 bg-green-500 text-white rounded-lg py-2 text-center text-sm font-medium hover:bg-green-600 transition-colors"
          >
            WhatsApp
          </button>
        </div>
      </div>
    </a>
  )
}
