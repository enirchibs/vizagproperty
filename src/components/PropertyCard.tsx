import { Heart, Phone, MessageCircle, MapPin, BedDouble, Maximize2, Star, CheckCircle, ChevronLeft, ChevronRight, Camera } from 'lucide-react'
import { Property } from '../types'
import { useState, useEffect, useRef } from 'react'
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
  const [currentImageIndex, setCurrentImageIndex] = useState(0)
  const [isHovered, setIsHovered] = useState(false)
  const autoPlayTimerRef = useRef<ReturnType<typeof setInterval> | null>(null)

  const images = property.images && property.images.length > 0 ? property.images : ['/placeholder-property.jpg']

  // Auto-loop image slideshow on hover for multi-image properties
  useEffect(() => {
    if (isHovered && images.length > 1) {
      autoPlayTimerRef.current = setInterval(() => {
        setCurrentImageIndex((prev) => (prev + 1) % images.length)
      }, 2500)
    } else {
      if (autoPlayTimerRef.current) {
        clearInterval(autoPlayTimerRef.current)
      }
    }
    return () => {
      if (autoPlayTimerRef.current) {
        clearInterval(autoPlayTimerRef.current)
      }
    }
  }, [isHovered, images.length])

  const handleNextImage = (e: React.MouseEvent) => {
    e.preventDefault()
    e.stopPropagation()
    setCurrentImageIndex((prev) => (prev + 1) % images.length)
  }

  const handlePrevImage = (e: React.MouseEvent) => {
    e.preventDefault()
    e.stopPropagation()
    setCurrentImageIndex((prev) => (prev - 1 + images.length) % images.length)
  }

  const handleDotClick = (e: React.MouseEvent, index: number) => {
    e.preventDefault()
    e.stopPropagation()
    setCurrentImageIndex(index)
  }

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
      <div 
        className="relative aspect-[16/10] overflow-hidden bg-gray-100 group/image"
        onMouseEnter={() => setIsHovered(true)}
        onMouseLeave={() => setIsHovered(false)}
      >
        <img
          key={images[currentImageIndex]}
          src={images[currentImageIndex]}
          alt={`${property.title} - Photo ${currentImageIndex + 1}`}
          className="w-full h-full object-cover group-hover/image:scale-105 transition-all duration-500"
          loading="lazy"
        />

        {/* Status Badges */}
        <div className="absolute top-2 left-2 flex flex-col gap-1 z-10 pointer-events-none">
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

        {/* Photo Count Badge for Multiple Images */}
        {images.length > 1 && (
          <div className="absolute top-2 right-10 z-10 bg-slate-900/80 backdrop-blur-md text-white text-[10px] font-extrabold px-2 py-0.5 rounded-full flex items-center gap-1 shadow-md border border-white/20">
            <Camera className="w-3 h-3 text-yellow-400 animate-pulse" />
            <span>{currentImageIndex + 1}/{images.length}</span>
          </div>
        )}

        {/* Gallery Controls & Indicators for Multiple Images */}
        {images.length > 1 && (
          <>
            <button
              type="button"
              onClick={handlePrevImage}
              className="absolute left-1.5 top-1/2 -translate-y-1/2 z-20 bg-slate-900/70 hover:bg-slate-900 text-white p-1 rounded-full opacity-0 group-hover/image:opacity-100 transition-opacity duration-200 shadow-md backdrop-blur-sm"
              aria-label="Previous image"
            >
              <ChevronLeft className="w-4 h-4" />
            </button>
            <button
              type="button"
              onClick={handleNextImage}
              className="absolute right-1.5 top-1/2 -translate-y-1/2 z-20 bg-slate-900/70 hover:bg-slate-900 text-white p-1 rounded-full opacity-0 group-hover/image:opacity-100 transition-opacity duration-200 shadow-md backdrop-blur-sm"
              aria-label="Next image"
            >
              <ChevronRight className="w-4 h-4" />
            </button>

            {/* Pagination Dots */}
            <div className="absolute bottom-2 left-1/2 -translate-x-1/2 z-20 flex items-center gap-1 bg-slate-900/50 backdrop-blur-sm px-2 py-0.5 rounded-full">
              {images.map((_, idx) => (
                <button
                  key={idx}
                  type="button"
                  onClick={(e) => handleDotClick(e, idx)}
                  className={`h-1.5 rounded-full transition-all duration-300 ${
                    idx === currentImageIndex ? 'w-3.5 bg-yellow-400' : 'w-1.5 bg-white/70 hover:bg-white'
                  }`}
                  aria-label={`Go to slide ${idx + 1}`}
                />
              ))}
            </div>
          </>
        )}

        {user && (
          <button
            onClick={handleFavoriteToggle}
            disabled={isTogglingFavorite}
            className="absolute top-2 right-2 p-1.5 bg-white/90 backdrop-blur-sm rounded-full hover:bg-white transition-all shadow-md active:scale-90 z-20"
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
