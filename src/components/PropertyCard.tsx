import { Heart, Phone, MessageCircle, MapPin, BedDouble, Maximize2, Star, CheckCircle } from 'lucide-react'
import { Property } from '../types'
import { useState } from 'react'
import { supabase } from '../lib/supabase'
import { useAuth } from '../contexts/AuthContext'
import { openWhatsApp } from '../lib/whatsapp'

interface PropertyCardProps {
  property: Property
}

export function PropertyCard({ property }: PropertyCardProps) {
  const { user } = useAuth()
  const [isFavorited, setIsFavorited] = useState(false)
  const [isTogglingFavorite, setIsTogglingFavorite] = useState(false)

  const mainImage = property.images?.[0] || '/placeholder-property.jpg'

  const formatPrice = (price: number) => {
    if (price >= 10000000) {
      return `₹${(price / 10000000).toFixed(2)} Cr`
    } else if (price >= 100000) {
      return `₹${(price / 100000).toFixed(2)} L`
    }
    return `₹${price.toLocaleString()}`
  }

  const handleFavoriteToggle = async (e: React.MouseEvent) => {
    e.preventDefault()
    e.stopPropagation()

    if (!user) {
      window.location.href = '/?login=true'
      return
    }

    setIsTogglingFavorite(true)

    try {
      if (isFavorited) {
        const { error } = await supabase
          .from('favorites')
          .delete()
          .eq('user_id', user.id)
          .eq('property_id', property.id)

        if (error) throw error
        setIsFavorited(false)
      } else {
        const { error } = await supabase
          .from('favorites')
          .insert({ user_id: user.id, property_id: property.id })

        if (error) throw error
        setIsFavorited(true)
      }
    } catch (error) {
      // Handle error silently
    } finally {
      setIsTogglingFavorite(false)
    }
  }

  const handleCall = (e: React.MouseEvent) => {
    e.preventDefault()
    e.stopPropagation()
    window.location.href = `tel:${property.agent_phone}`
  }

  const handleWhatsApp = (e: React.MouseEvent) => {
    e.preventDefault()
    e.stopPropagation()
    const message = `Hi, I'm interested in your property: ${property.title} - ${formatPrice(property.price)}`
    openWhatsApp(message)
  }

  return (
    <a
      href={`/property/${property.id}`}
      className="group bg-white rounded-xl shadow-md hover:shadow-xl transition-all overflow-hidden border border-gray-200 hover:border-primary-500 flex flex-col"
    >
      <div className="relative aspect-[4/3] overflow-hidden">
        <img
          src={mainImage}
          alt={property.title}
          className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300"
          loading="lazy"
        />

        <div className="absolute top-3 left-3 flex flex-col gap-2">
          {property.featured && (
            <span className="bg-gradient-to-r from-yellow-500 to-orange-500 text-white px-3 py-1 rounded-full text-xs font-bold flex items-center gap-1 shadow-lg">
              <Star className="h-3 w-3 fill-current" />
              Featured
            </span>
          )}
          {property.verified && (
            <span className="bg-gradient-to-r from-green-500 to-emerald-500 text-white px-3 py-1 rounded-full text-xs font-bold flex items-center gap-1 shadow-lg">
              <CheckCircle className="h-3 w-3 fill-current" />
              Verified
            </span>
          )}
        </div>

        {user && (
          <button
            onClick={handleFavoriteToggle}
            disabled={isTogglingFavorite}
            className="absolute top-3 right-3 p-2 bg-white/90 backdrop-blur-sm rounded-full hover:bg-white transition-all shadow-lg"
            aria-label={isFavorited ? 'Remove from favorites' : 'Add to favorites'}
          >
            <Heart
              className={`h-5 w-5 transition-all ${
                isFavorited ? 'fill-red-500 text-red-500' : 'text-gray-600'
              }`}
            />
          </button>
        )}

        <div className="absolute bottom-3 left-3 right-3 flex gap-2">
          <button
            onClick={handleCall}
            className="flex-1 bg-white/95 backdrop-blur-sm text-gray-900 px-3 py-2 rounded-lg font-semibold text-sm hover:bg-white transition-all shadow-lg flex items-center justify-center gap-1.5"
          >
            <Phone className="h-4 w-4" />
            Call
          </button>
          <button
            onClick={handleWhatsApp}
            className="flex-1 bg-green-600 text-white px-3 py-2 rounded-lg font-semibold text-sm hover:bg-green-700 transition-all shadow-lg flex items-center justify-center gap-1.5"
          >
            <MessageCircle className="h-4 w-4" />
            WhatsApp
          </button>
        </div>
      </div>

      <div className="p-4 flex flex-col flex-1">
        <div className="flex items-start justify-between mb-2">
          <h3 className="font-bold text-lg text-gray-900 line-clamp-2 flex-1">
            {property.title}
          </h3>
        </div>

        <div className="flex items-center text-gray-600 text-sm mb-3">
          <MapPin className="h-4 w-4 mr-1 flex-shrink-0" />
          <span className="line-clamp-1">
            {property.location || 'Visakhapatnam'}
          </span>
        </div>

        <div className="flex items-center gap-4 text-sm text-gray-600 mb-3">
          {property.bedrooms && property.bedrooms > 0 && (
            <div className="flex items-center gap-1">
              <BedDouble className="h-4 w-4" />
              <span>{property.bedrooms} BHK</span>
            </div>
          )}
          {property.area_sqft && (
            <div className="flex items-center gap-1">
              <Maximize2 className="h-4 w-4" />
              <span>{property.area_sqft.toLocaleString()} sqft</span>
            </div>
          )}
        </div>

        <div className="mt-auto pt-3 border-t border-gray-100">
          <div className="flex items-center justify-between">
            <div>
              <div className="text-2xl font-bold text-primary-600">
                {formatPrice(property.price)}
              </div>
              <div className="text-xs text-gray-500 capitalize">
                {property.listing_type}
              </div>
            </div>
          </div>
        </div>

        <div className="mt-3 text-xs text-gray-500 border-t border-gray-100 pt-3">
          * Prices and availability are subject to change. Please verify details with the agent.
        </div>
      </div>
    </a>
  )
}
