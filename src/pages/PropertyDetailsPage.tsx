import { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { MapPin, Bed, Bath, Maximize, Heart, Share2, Phone, MessageCircle, Check, MessageSquare } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { Property } from '../types'
import { useAuth } from '../contexts/AuthContext'
import { openWhatsApp } from '../lib/whatsapp'
import { GoodDealAnalysis } from '../components/GoodDealAnalysis'
import { BudgetStretchAdvisor } from '../components/BudgetStretchAdvisor'
import { NegotiationCoach } from '../components/NegotiationCoach'
import { SmartAreaDiscovery } from '../components/SmartAreaDiscovery'
import { PropertyShortlistMemory } from '../components/PropertyShortlistMemory'
import { VisitPreparation } from '../components/VisitPreparation'
import { MediaGallery } from '../components/MediaGallery'
import { VIZAG_PROPERTY_PHONE } from '../config/contact'

export function PropertyDetailsPage() {
  const { id } = useParams()
  const { user } = useAuth()
  const [property, setProperty] = useState<Property | null>(null)
  const [loading, setLoading] = useState(true)
  const [isFavorite, setIsFavorite] = useState(false)

  useEffect(() => {
    if (id) {
      loadProperty()
      recordView()
      checkFavorite()
    }
  }, [id, user])

  useEffect(() => {
    if (property) {
      const schema = {
        "@context": "https://schema.org",
        "@type": "Product",
        "name": property.title,
        "description": property.description,
        "image": property.images.length > 0 ? property.images : ["https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg"],
        "offers": {
          "@type": "Offer",
          "price": property.price,
          "priceCurrency": "INR",
          "availability": "https://schema.org/InStock",
          "url": window.location.href
        },
        "category": property.property_type,
        "additionalProperty": [
          {
            "@type": "PropertyValue",
            "name": "Bedrooms",
            "value": property.bedrooms
          },
          {
            "@type": "PropertyValue",
            "name": "Bathrooms",
            "value": property.bathrooms
          },
          {
            "@type": "PropertyValue",
            "name": "Area",
            "value": property.area_sqft + " sqft"
          },
          {
            "@type": "PropertyValue",
            "name": "Listing Type",
            "value": property.listing_type
          }
        ],
        "address": {
          "@type": "PostalAddress",
          "addressLocality": property.city,
          "addressRegion": property.state,
          "addressCountry": "IN"
        }
      }

      const script = document.createElement('script')
      script.type = 'application/ld+json'
      script.text = JSON.stringify(schema)
      script.id = 'property-schema'
      document.head.appendChild(script)

      document.title = `${property.title} - ${property.location} | VizagProperty`
      const metaDescription = document.querySelector('meta[name="description"]')
      if (metaDescription) {
        metaDescription.setAttribute('content', `${property.title} in ${property.location}. ${property.bedrooms} BHK, ${property.area_sqft} sqft. ${property.listing_type === 'sale' ? 'For Sale' : 'For Rent'}. Contact now for more details.`)
      }

      return () => {
        const existingScript = document.getElementById('property-schema')
        if (existingScript) {
          existingScript.remove()
        }
      }
    }
  }, [property])

  const loadProperty = async () => {
    try {
      const { data, error } = await supabase
        .from('properties')
        .select('*')
        .eq('id', id)
        .maybeSingle()

      if (error) throw error
      setProperty(data)
    } catch (error) {
      console.error('Error loading property:', error)
    } finally {
      setLoading(false)
    }
  }

  const recordView = async () => {
    try {
      await supabase.from('property_views').insert({
        property_id: id,
        user_id: user?.id
      })
    } catch (error) {
      console.error('Error recording view:', error)
    }
  }

  const checkFavorite = async () => {
    if (!user) return
    try {
      const { data } = await supabase
        .from('favorites')
        .select('id')
        .eq('user_id', user.id)
        .eq('property_id', id)
        .maybeSingle()

      setIsFavorite(!!data)
    } catch (error) {
      console.error('Error checking favorite:', error)
    }
  }

  const toggleFavorite = async () => {
    if (!user) return

    try {
      if (isFavorite) {
        await supabase
          .from('favorites')
          .delete()
          .eq('user_id', user.id)
          .eq('property_id', id)
        setIsFavorite(false)
      } else {
        await supabase
          .from('favorites')
          .insert({ user_id: user.id, property_id: id })
        setIsFavorite(true)
      }
    } catch (error) {
      console.error('Error toggling favorite:', error)
    }
  }

  const handleWhatsApp = () => {
    if (!property) return
    openWhatsApp(
      `Hi, I'm interested in ${property.title} listed on VizagProperty. Can you provide more details?`
    )
  }

  const handleCall = () => {
    window.location.href = `tel:${VIZAG_PROPERTY_PHONE}`
  }

  const handleShare = async () => {
    const url = window.location.href
    if (navigator.share) {
      try {
        await navigator.share({
          title: property?.title,
          text: property?.description,
          url: url
        })
      } catch (error) {
        console.log('Share cancelled')
      }
    } else {
      navigator.clipboard.writeText(url)
      alert('Link copied to clipboard!')
    }
  }

  const formatPrice = (price: number) => {
    if (price >= 10000000) {
      return `₹${(price / 10000000).toFixed(2)} Cr`
    } else if (price >= 100000) {
      return `₹${(price / 100000).toFixed(2)} L`
    }
    return `₹${price.toLocaleString('en-IN')}`
  }

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="w-16 h-16 border-4 border-primary-600 border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
          <p className="text-gray-600">Loading property...</p>
        </div>
      </div>
    )
  }

  if (!property) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <h2 className="text-2xl font-bold text-gray-900 mb-2">Property not found</h2>
          <a href="/properties" className="text-primary-600 hover:text-primary-700">
            Browse all properties
          </a>
        </div>
      </div>
    )
  }

  const images = property.images.length > 0
    ? property.images
    : ['https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&w=1200']

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 py-8">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <div className="lg:col-span-2">
            <div className="relative mb-6">
              <MediaGallery images={images} propertyId={property.id} propertyTitle={property.title} propertyLocation={property.location} />

              <div className="absolute top-4 right-4 flex space-x-2 z-20">
                {user && (
                  <button
                    onClick={toggleFavorite}
                    className="bg-white p-3 rounded-full shadow-lg hover:scale-110 transition-transform"
                  >
                    <Heart className={`h-6 w-6 ${isFavorite ? 'fill-red-500 text-red-500' : 'text-gray-600'}`} />
                  </button>
                )}
                <button
                  onClick={handleShare}
                  className="bg-white p-3 rounded-full shadow-lg hover:scale-110 transition-transform"
                >
                  <Share2 className="h-6 w-6 text-gray-600" />
                </button>
              </div>

              <div className="absolute top-4 left-4 flex gap-2 z-20">
                {property.featured && (
                  <span className="bg-yellow-500 text-white px-4 py-2 rounded-full text-sm font-medium">
                    Featured
                  </span>
                )}
                {property.verified && (
                  <span className="bg-green-500 text-white px-4 py-2 rounded-full text-sm font-medium">
                    Verified
                  </span>
                )}
              </div>
            </div>

            <div className="bg-white rounded-2xl p-4 md:p-6 shadow-sm border border-gray-100 mb-6">
              <div className="flex flex-col md:flex-row md:items-start md:justify-between mb-4 gap-3">
                <div className="flex-1">
                  <h1 className="text-2xl md:text-3xl font-bold text-gray-900 mb-2">{property.title}</h1>
                  <div className="flex items-start text-gray-600 text-base md:text-lg">
                    <MapPin className="h-5 w-5 mr-2 flex-shrink-0 mt-0.5" />
                    <span>{property.location}, {property.city}, {property.state}</span>
                  </div>
                </div>
                <span className="px-4 py-2 bg-primary-50 text-primary-700 rounded-full capitalize font-medium text-sm whitespace-nowrap self-start">
                  For {property.listing_type}
                </span>
              </div>

              <div className="flex flex-wrap items-center gap-4 md:gap-6 py-4 border-y border-gray-200 mb-4">
                {property.bedrooms && property.bedrooms > 0 && (
                  <div className="flex items-center">
                    <Bed className="h-5 w-5 mr-2 text-gray-600" />
                    <span className="text-gray-900 font-medium text-sm md:text-base">{property.bedrooms} BHK</span>
                  </div>
                )}
                {property.bathrooms && property.bathrooms > 0 && (
                  <div className="flex items-center">
                    <Bath className="h-5 w-5 mr-2 text-gray-600" />
                    <span className="text-gray-900 font-medium text-sm md:text-base">{property.bathrooms} Bathrooms</span>
                  </div>
                )}
                <div className="flex items-center">
                  <Maximize className="h-5 w-5 mr-2 text-gray-600" />
                  <span className="text-gray-900 font-medium text-sm md:text-base">{property.area_sqft} sqft</span>
                </div>
              </div>

              <div className="mb-6">
                <h2 className="text-xl font-semibold text-gray-900 mb-3">Description</h2>
                <p className="text-gray-600 leading-relaxed whitespace-pre-line">{property.description}</p>
              </div>

              {property.amenities.length > 0 && (
                <div>
                  <h2 className="text-xl font-semibold text-gray-900 mb-3">Amenities</h2>
                  <div className="grid grid-cols-2 gap-3">
                    {property.amenities.map((amenity, index) => (
                      <div key={index} className="flex items-center text-gray-700">
                        <Check className="h-5 w-5 text-green-600 mr-2" />
                        <span>{amenity}</span>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </div>

            <GoodDealAnalysis propertyId={property.id} currentPrice={property.price} />

            <BudgetStretchAdvisor
              currentPrice={property.price}
              propertyType={property.property_type}
              location={property.location || property.city || 'Vizag'}
              bedrooms={property.bedrooms || 0}
            />

            <NegotiationCoach propertyId={property.id} currentPrice={property.price} />

            <SmartAreaDiscovery currentCity={property.city || 'Vizag'} />

            <PropertyShortlistMemory propertyId={property.id} />

            <VisitPreparation property={property} />
          </div>

          <div className="lg:col-span-1">
            <div className="bg-white rounded-2xl p-5 md:p-6 shadow-sm border border-gray-100 lg:sticky lg:top-24">
              <div className="mb-5 md:mb-6">
                <div className="text-3xl md:text-4xl font-bold text-primary-600 mb-2">
                  {formatPrice(property.price)}
                </div>
                <p className="text-gray-600 capitalize text-base">{property.property_type}</p>
              </div>

              <div className="space-y-3 mb-5 md:mb-6">
                <button
                  onClick={handleWhatsApp}
                  className="w-full bg-green-600 text-white py-3.5 md:py-3 rounded-lg hover:bg-green-700 transition-colors flex items-center justify-center space-x-2 font-medium text-base min-h-[48px]"
                >
                  <MessageCircle className="h-5 w-5" />
                  <span>WhatsApp Agent</span>
                </button>

                <button
                  onClick={handleCall}
                  className="w-full bg-primary-600 text-white py-3.5 md:py-3 rounded-lg hover:bg-primary-700 transition-colors flex items-center justify-center space-x-2 font-medium text-base min-h-[48px]"
                >
                  <Phone className="h-5 w-5" />
                  <span>Call Now</span>
                </button>

                <button
                  onClick={() => openWhatsApp(`Hi Vizag Property Experts, I am interested in this property:\n${property.title}\nLocation: ${property.location}\nPrice: ${formatPrice(property.price)}\nPlease share more details.`)}
                  className="w-full bg-green-50 text-green-700 border-2 border-green-600 py-3.5 md:py-3 rounded-lg hover:bg-green-100 transition-colors flex items-center justify-center space-x-2 font-medium text-base min-h-[48px]"
                >
                  <MessageSquare className="h-5 w-5" />
                  <span>Enquire on WhatsApp</span>
                </button>
              </div>

              <div className="pt-6 border-t border-gray-200">
                <h3 className="font-semibold text-gray-900 mb-3">Contact Agent</h3>
                <div className="space-y-2 text-gray-600">
                  <p><span className="font-medium">Name:</span> {property.agent_name}</p>
                  <p><span className="font-medium">Phone:</span> {property.agent_phone}</p>
                </div>
              </div>

              <div className="pt-6 border-t border-gray-200 mt-6">
                <p className="text-sm text-gray-500">
                  <span className="font-medium">Views:</span> {property.views_count}
                </p>
                <p className="text-sm text-gray-500 mt-1">
                  <span className="font-medium">Posted:</span> {new Date(property.created_at).toLocaleDateString()}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
