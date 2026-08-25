import { Heart, Phone, MessageCircle, MapPin, BedDouble, Maximize2, Star, CheckCircle } from 'lucide-react'
import { Property } from '../types'
import { useState } from 'react'
import { supabase } from '../lib/supabase'
import { useAuth } from '../contexts/AuthContext'
import { openWhatsApp } from '../lib/whatsapp'
import { VIZAG_PROPERTY_PHONE } from '../config/contact'

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
    const targetPhone = property.agent_phone || VIZAG_PROPERTY_PHONE
    window.location.href = `tel:${targetPhone}`
  }

  const handleWhatsApp = (e: React.MouseEvent) => {
    e.preventDefault()
    e.stopPropagation()
    const message = `Hi, I'm interested in your property: ${property.title} - ${formatPrice(property.price)}`
    const targetPhone = property.agent_whatsapp || property.agent_phone || VIZAG_PROPERTY_PHONE
    openWhatsApp(message, targetPhone)
  }

  return (
    <a
      href={`/property/${property.id}`}
      className="group bg-white rounded-xl shadow-sm hover:shadow-lg transition-all duration-300 overflow-hidden border border-gray-200 hover:border-primary-500 flex flex-col hover:-translate-y-0.5"
    >
      <div className="relative aspect-[16/10] overflow-hidden bg-gray-100">
        <img
          src={mainImage}
          alt={property.title}
          className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
          loading="lazy"
        />

        <div className="absolute top-2 left-2 flex flex-col gap-1 z-10">
          {property.featured && (
            <span className="bg-gradient-to-r from-yellow-500 to-orange-500 text-white px-2 py-0.5 rounded-md text-[10px] font-extrabold flex items-center gap-1 shadow-md">
              <Star className="h-3 w-3 fill-current" />
              Featured
            </span>
          )}
          {property.verified && (
            <span className="bg-gradient-to-r from-green-500 to-emerald-500 text-white px-2 py-0.5 rounded-md text-[10px] font-extrabold flex items-center gap-1 shadow-md">
              <CheckCircle className="h-3 w-3 fill-current" />
              Verified
            </span>
          )}
        </div>

        {user && (
          <button
            onClick={handleFavoriteToggle}
            disabled={isTogglingFavorite}
            className="absolute top-2 right-2 p-1.5 bg-white/90 backdrop-blur-sm rounded-full hover:bg-white transition-all shadow-md active:scale-90"
            aria-label={isFavorited ? 'Remove from favorites' : 'Add to favorites'}
          >
            <Heart
              className={`h-4 w-4 transition-all ${
                isFavorited ? 'fill-red-500 text-red-500' : 'text-gray-600'
              }`}
            />
          </button>
        )}
      </div>

      <div className="p-3 flex flex-col flex-1 justify-between">
        <div>
          <div className="flex items-baseline justify-between gap-2 mb-1">
            <div className="text-lg md:text-xl font-black text-primary-600">
              {formatPrice(property.price)}
            </div>
            <span className="text-[11px] font-bold uppercase tracking-wider text-gray-500 bg-gray-100 px-2 py-0.5 rounded">
              {property.listing_type || 'Sale'}
            </span>
          </div>

          <h3 className="font-bold text-sm md:text-base text-gray-900 line-clamp-1 group-hover:text-primary-600 transition-colors mb-1">
            {property.title}
          </h3>

          <div className="flex items-center text-gray-500 text-xs mb-2">
            <MapPin className="h-3.5 w-3.5 mr-1 text-gray-400 flex-shrink-0" />
            <span className="line-clamp-1 font-medium">
              {property.location || 'Visakhapatnam'}
            </span>
          </div>

          <div className="flex items-center gap-3 text-xs font-semibold text-gray-600 mb-3 bg-gray-50 px-2.5 py-1.5 rounded-lg">
            {property.bedrooms && property.bedrooms > 0 && (
              <div className="flex items-center gap-1">
                <BedDouble className="h-3.5 w-3.5 text-primary-500" />
                <span>{property.bedrooms} BHK</span>
              </div>
            )}
            {property.area_sqft && (
              <div className="flex items-center gap-1">
                <Maximize2 className="h-3.5 w-3.5 text-primary-500" />
                <span>{property.area_sqft.toLocaleString()} sqft</span>
              </div>
            )}
            {(!property.bedrooms || property.bedrooms === 0) && (
              <span className="text-gray-500 capitalize">{property.property_type?.replace(/_/g, ' ') || 'Property'}</span>
            )}
          </div>
        </div>

        {/* Action Buttons */}
        <div className="flex items-center gap-2 pt-2 border-t border-gray-100 mt-1">
          <button
            onClick={handleCall}
            className="flex-1 bg-blue-50 text-blue-700 hover:bg-blue-600 hover:text-white px-3 py-1.5 rounded-lg font-bold text-xs transition-all duration-200 active:scale-95 flex items-center justify-center gap-1.5 shadow-sm"
          >
            <Phone className="h-3.5 w-3.5 animate-pulse" />
            Call
          </button>
          <button
            onClick={handleWhatsApp}
            className="flex-1 bg-green-600 text-white hover:bg-green-700 px-3 py-1.5 rounded-lg font-bold text-xs transition-all duration-200 active:scale-95 flex items-center justify-center gap-1.5 shadow-sm"
          >
            <MessageCircle className="h-3.5 w-3.5" />
            WhatsApp
          </button>
        </div>
      </div>
    </a>
  )
}
