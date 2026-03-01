import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { Sparkles, Heart, X, MapPin, Bed, Bath, Maximize, ThumbsUp } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { useAuth } from '../contexts/AuthContext'
import { Property } from '../types'

interface PropertyRecommendation {
  property: Property
  reason: string
  match_score: number
}

export function AIRecommendations() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [recommendations, setRecommendations] = useState<PropertyRecommendation[]>([])
  const [loading, setLoading] = useState(true)
  const [interactedProperties, setInteractedProperties] = useState<Set<string>>(new Set())

  useEffect(() => {
    loadRecommendations()
    if (user) {
      loadInteractions()
    }
  }, [user])

  const loadInteractions = async () => {
    if (!user) return

    try {
      const { data, error } = await supabase
        .from('property_interactions')
        .select('property_id')
        .eq('user_id', user.id)

      if (error) throw error
      setInteractedProperties(new Set(data?.map(i => i.property_id) || []))
    } catch (error) {
      console.error('Error loading interactions:', error)
    }
  }

  const loadRecommendations = async () => {
    try {
      let query = supabase
        .from('properties')
        .select('*')
        .eq('status', 'approved')
        .order('created_at', { ascending: false })
        .limit(7)

      if (user) {
        const { data: preferences } = await supabase
          .from('user_preferences')
          .select('*')
          .eq('user_id', user.id)
          .maybeSingle()

        if (preferences) {
          if (preferences.budget_min && preferences.budget_max) {
            query = query
              .gte('price', preferences.budget_min)
              .lte('price', preferences.budget_max)
          }
          if (preferences.bedrooms) {
            query = query.eq('bedrooms', preferences.bedrooms)
          }
        }
      }

      const { data, error } = await query

      if (error) throw error

      const recommendationsWithReasons: PropertyRecommendation[] = (data || []).map(property => ({
        property,
        reason: generateReason(property),
        match_score: calculateMatchScore(property)
      }))

      recommendationsWithReasons.sort((a, b) => b.match_score - a.match_score)
      setRecommendations(recommendationsWithReasons.slice(0, 7))
    } catch (error) {
      console.error('Error loading recommendations:', error)
    } finally {
      setLoading(false)
    }
  }

  const generateReason = (property: Property): string => {
    const reasons = []

    if (property.featured) {
      reasons.push('Featured property with high demand')
    }

    if (property.verified) {
      reasons.push('Verified listing with authentic details')
    }

    if (property.amenities && property.amenities.length >= 5) {
      reasons.push('Premium amenities included')
    }

    if (property.views_count && property.views_count > 50) {
      reasons.push('Popular choice among buyers')
    }

    if (property.price < 5000000) {
      reasons.push('Budget-friendly option')
    } else if (property.price > 10000000) {
      reasons.push('Premium property in prime location')
    } else {
      reasons.push('Great value for money')
    }

    if (property.bedrooms && property.bedrooms >= 3) {
      reasons.push('Spacious for families')
    }

    return reasons[0] || 'Matches your search criteria'
  }

  const calculateMatchScore = (property: Property): number => {
    let score = 50

    if (property.featured) score += 15
    if (property.verified) score += 10
    if (property.amenities && property.amenities.length >= 5) score += 10
    if (property.views_count && property.views_count > 50) score += 5
    if (property.bedrooms && property.bedrooms >= 2 && property.bedrooms <= 3) score += 10

    return Math.min(score, 100)
  }

  const handleInteraction = async (propertyId: string, type: 'liked' | 'rejected', reason: string = '') => {
    if (!user) {
      navigate('/properties')
      return
    }

    try {
      await supabase.from('property_interactions').insert({
        user_id: user.id,
        property_id: propertyId,
        interaction_type: type,
        reason: reason
      })

      setInteractedProperties(prev => new Set(prev).add(propertyId))
      setRecommendations(prev => prev.filter(r => r.property.id !== propertyId))

      if (recommendations.length <= 2) {
        loadRecommendations()
      }
    } catch (error) {
      console.error('Error recording interaction:', error)
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
      <div className="animate-pulse space-y-4">
        {[1, 2, 3].map(i => (
          <div key={i} className="bg-gray-200 h-48 rounded-2xl"></div>
        ))}
      </div>
    )
  }

  if (recommendations.length === 0) {
    return (
      <div className="text-center py-12 bg-white rounded-2xl shadow-sm border border-gray-100">
        <Sparkles className="h-12 w-12 mx-auto text-gray-400 mb-4" />
        <h3 className="text-xl font-bold text-gray-900 mb-2">No recommendations yet</h3>
        <p className="text-gray-600 mb-6">Browse properties to help us understand your preferences</p>
        <button
          onClick={() => navigate('/properties')}
          className="bg-primary-600 text-white px-6 py-3 rounded-lg hover:bg-primary-700 transition-colors font-medium"
        >
          Browse Properties
        </button>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      <div className="bg-gradient-to-r from-purple-50 to-pink-50 rounded-2xl p-6 border border-purple-200">
        <div className="flex items-center gap-3 mb-2">
          <Sparkles className="h-6 w-6 text-purple-600" />
          <h2 className="text-2xl font-bold text-gray-900">Your Curated Matches</h2>
        </div>
        <p className="text-gray-600">
          AI-selected properties based on your preferences. Like or pass to refine future recommendations.
        </p>
      </div>

      <div className="grid grid-cols-1 gap-6">
        {recommendations.map((rec) => (
          <div
            key={rec.property.id}
            className="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden hover:shadow-lg transition-all"
          >
            <div className="md:flex">
              <div
                className="md:w-1/3 h-64 md:h-auto cursor-pointer relative group"
                onClick={() => navigate(`/property/${rec.property.id}`)}
              >
                <img
                  src={rec.property.images?.[0] || 'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg'}
                  alt={`${rec.property.property_type || 'Property'} for sale in ${rec.property.location} - ${rec.property.title}`}
                  className="w-full h-full object-cover"
                />
                <div className="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-30 transition-all flex items-center justify-center">
                  <span className="text-white opacity-0 group-hover:opacity-100 font-semibold">View Details</span>
                </div>
                {rec.property.featured && (
                  <span className="absolute top-3 left-3 bg-yellow-500 text-white px-3 py-1 rounded-full text-xs font-medium">
                    Featured
                  </span>
                )}
                {rec.property.verified && (
                  <span className="absolute top-3 right-3 bg-green-500 text-white px-3 py-1 rounded-full text-xs font-medium">
                    Verified
                  </span>
                )}
              </div>

              <div className="md:w-2/3 p-6">
                <div className="flex items-start justify-between mb-4">
                  <div className="flex-1">
                    <h3
                      className="text-xl font-bold text-gray-900 mb-2 cursor-pointer hover:text-primary-600 transition-colors"
                      onClick={() => navigate(`/property/${rec.property.id}`)}
                    >
                      {rec.property.title}
                    </h3>
                    <div className="flex items-center text-gray-600 mb-3">
                      <MapPin className="h-4 w-4 mr-2" />
                      <span className="text-sm">{rec.property.location}, {rec.property.city}</span>
                    </div>
                    <div className="inline-flex items-center gap-2 bg-purple-50 border border-purple-200 px-3 py-1.5 rounded-full mb-4">
                      <Sparkles className="h-4 w-4 text-purple-600" />
                      <span className="text-sm font-medium text-purple-900">{rec.reason}</span>
                    </div>
                  </div>
                </div>

                <div className="flex items-center gap-6 mb-4 text-gray-700">
                  {rec.property.bedrooms && rec.property.bedrooms > 0 && (
                    <div className="flex items-center gap-2">
                      <Bed className="h-5 w-5" />
                      <span className="font-medium">{rec.property.bedrooms} BHK</span>
                    </div>
                  )}
                  {rec.property.bathrooms && rec.property.bathrooms > 0 && (
                    <div className="flex items-center gap-2">
                      <Bath className="h-5 w-5" />
                      <span className="font-medium">{rec.property.bathrooms}</span>
                    </div>
                  )}
                  <div className="flex items-center gap-2">
                    <Maximize className="h-5 w-5" />
                    <span className="font-medium">{rec.property.area_sqft} sqft</span>
                  </div>
                </div>

                <div className="flex items-center justify-between pt-4 border-t border-gray-200">
                  <div>
                    <span className="text-3xl font-bold text-primary-600">
                      {formatPrice(rec.property.price)}
                    </span>
                    <span className="text-gray-500 text-sm ml-2 capitalize">
                      For {rec.property.listing_type}
                    </span>
                  </div>

                  {user && !interactedProperties.has(rec.property.id) && (
                    <div className="flex gap-2">
                      <button
                        onClick={() => handleInteraction(rec.property.id, 'rejected', 'Not interested')}
                        className="flex items-center gap-2 px-4 py-2 bg-red-50 text-red-600 rounded-lg hover:bg-red-100 transition-colors border border-red-200"
                        title="Not for me"
                      >
                        <X className="h-5 w-5" />
                        <span className="font-medium">Pass</span>
                      </button>
                      <button
                        onClick={() => handleInteraction(rec.property.id, 'liked', 'Interested')}
                        className="flex items-center gap-2 px-4 py-2 bg-green-50 text-green-600 rounded-lg hover:bg-green-100 transition-colors border border-green-200"
                        title="I'm interested"
                      >
                        <Heart className="h-5 w-5" />
                        <span className="font-medium">Interested</span>
                      </button>
                    </div>
                  )}

                  {interactedProperties.has(rec.property.id) && (
                    <div className="flex items-center gap-2 text-green-600">
                      <ThumbsUp className="h-5 w-5" />
                      <span className="font-medium">Shortlisted</span>
                    </div>
                  )}
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
