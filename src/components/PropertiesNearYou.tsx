import { MapPin, ArrowRight, Home } from 'lucide-react'
import { useNearbyProperties } from '../hooks/useNearbyProperties'
import { useNavigate } from 'react-router-dom'

export default function PropertiesNearYou() {
  const { properties, loading, locationSource } = useNearbyProperties()
  const navigate = useNavigate()

  if (loading) {
    return (
      <div className="mb-12">
        <div className="flex items-center justify-between mb-6">
          <div>
            <div className="h-8 w-48 bg-gray-200 rounded-lg animate-pulse mb-2" />
            <div className="h-4 w-32 bg-gray-200 rounded animate-pulse" />
          </div>
        </div>
        <div className="flex gap-4 overflow-x-auto pb-4 scrollbar-hide snap-x snap-mandatory">
          {[1, 2, 3].map((i) => (
            <div
              key={i}
              className="flex-none w-72 sm:w-80 h-80 bg-gradient-to-br from-gray-100 to-gray-200 rounded-2xl animate-pulse snap-start"
            />
          ))}
        </div>
      </div>
    )
  }

  if (!properties.length || !locationSource) {
    return null
  }

  const getSubtitle = () => {
    if (locationSource.type === 'last_search') {
      return 'Based on your last search'
    }
    if (locationSource.type === 'geolocation') {
      return `Near your location in ${locationSource.localityName}`
    }
    return `Popular properties in Visakhapatnam`
  }

  const handleViewAll = () => {
    navigate('/properties')
  }

  const handlePropertyClick = (propertyId: string) => {
    navigate(`/property/${propertyId}`)
  }

  return (
    <div className="mb-12">
      <div className="flex items-center justify-between mb-6">
        <div>
          <div className="flex items-center gap-2 mb-2">
            <MapPin className="h-6 w-6 text-primary-600" />
            <h2 className="text-2xl sm:text-3xl font-bold text-gray-900">
              Properties near you
            </h2>
          </div>
          <p className="text-sm sm:text-base text-gray-600">{getSubtitle()}</p>
        </div>
        <button
          onClick={handleViewAll}
          className="hidden sm:flex items-center gap-1 px-4 py-2 bg-primary-50 hover:bg-primary-100 text-primary-600 hover:text-primary-700 font-semibold rounded-lg transition-all"
        >
          View all
          <ArrowRight className="h-4 w-4" />
        </button>
      </div>

      <div className="relative">
        <div className="flex gap-4 overflow-x-auto pb-4 scrollbar-hide snap-x snap-mandatory -mx-4 px-4 sm:mx-0 sm:px-0">
          {properties.map((property) => (
            <div
              key={property.id}
              onClick={() => handlePropertyClick(property.id)}
              className="flex-none w-72 sm:w-80 bg-white rounded-2xl shadow-md hover:shadow-xl transition-all duration-300 overflow-hidden cursor-pointer snap-start group"
            >
              <div className="relative h-48 overflow-hidden bg-gradient-to-br from-gray-100 to-gray-200">
                {property.images && property.images.length > 0 ? (
                  <img
                    src={property.images?.[0] || 'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg'}
                    alt={property.title}
                    className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                  />
                ) : (
                  <div className="w-full h-full flex items-center justify-center">
                    <Home className="h-16 w-16 text-gray-300" />
                  </div>
                )}
                <div className="absolute top-3 left-3">
                  <span className="px-3 py-1 bg-white/90 backdrop-blur-sm text-primary-600 text-xs font-semibold rounded-full shadow-lg">
                    {property.listing_type === 'sale' ? 'For Sale' : 'For Rent'}
                  </span>
                </div>
              </div>

              <div className="p-4">
                <div className="flex items-start justify-between mb-2">
                  <h3 className="text-lg font-bold text-gray-900 line-clamp-1 flex-1">
                    {property.title}
                  </h3>
                </div>

                <div className="flex items-center gap-1 text-gray-600 mb-3">
                  <MapPin className="h-3.5 w-3.5 flex-shrink-0" />
                  <span className="text-sm line-clamp-1">
                    {property.location || property.city}
                  </span>
                </div>

                <div className="flex items-center justify-between">
                  <div>
                    <div className="text-2xl font-bold text-primary-600">
                      ₹{(property.price / 100000).toFixed(2)}L
                    </div>
                    {property.property_type === 'flat_apartment' && property.bedrooms && (
                      <div className="text-xs text-gray-500 mt-1">
                        {property.bedrooms} BHK
                      </div>
                    )}
                  </div>
                  <button
                    className="px-4 py-2 bg-primary-600 hover:bg-primary-700 text-white text-sm font-semibold rounded-lg transition-colors"
                    onClick={(e) => {
                      e.stopPropagation()
                      handlePropertyClick(property.id)
                    }}
                  >
                    View
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>

        <div className="absolute right-0 top-1/2 -translate-y-1/2 w-16 h-full bg-gradient-to-l from-white via-white to-transparent pointer-events-none hidden sm:block" />
      </div>

      <div className="mt-4 sm:hidden">
        <button
          onClick={handleViewAll}
          className="w-full flex items-center justify-center gap-2 px-4 py-3 bg-primary-50 hover:bg-primary-100 text-primary-600 hover:text-primary-700 font-semibold rounded-xl transition-all"
        >
          View all properties
          <ArrowRight className="h-4 w-4" />
        </button>
      </div>
    </div>
  )
}
