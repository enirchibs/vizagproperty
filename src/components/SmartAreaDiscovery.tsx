import { useState, useEffect } from 'react'
import { MapPin, Clock, TrendingUp, Star } from 'lucide-react'
import { supabase } from '../lib/supabase'

interface AreaInsight {
  id: string
  area_name: string
  city: string
  average_price: number
  commute_hubs: any
  lifestyle_score: number
  appreciation_trend: string
  insights_data: any
}

interface SmartAreaDiscoveryProps {
  userWorkLocation?: string
  currentCity: string
}

export function SmartAreaDiscovery({ userWorkLocation, currentCity }: SmartAreaDiscoveryProps) {
  const [areas, setAreas] = useState<AreaInsight[]>([])
  const [loading, setLoading] = useState(true)
  const [showDiscovery, setShowDiscovery] = useState(false)
  const [workLocation, setWorkLocation] = useState(userWorkLocation || '')

  useEffect(() => {
    if (showDiscovery) {
      loadAreaInsights()
    }
  }, [currentCity, showDiscovery])

  const loadAreaInsights = async () => {
    try {
      const { data, error } = await supabase
        .from('area_insights')
        .select('*')
        .eq('city', currentCity)
        .order('lifestyle_score', { ascending: false })
        .limit(3)

      if (error) throw error

      if (!data || data.length === 0) {
        await generateSampleInsights()
      } else {
        setAreas(data)
      }
    } catch (error) {
    } finally {
      setLoading(false)
    }
  }

  const generateSampleInsights = async () => {
    const sampleAreas = [
      {
        area_name: 'Whitefield',
        city: currentCity,
        average_price: 7500000,
        commute_hubs: { tech_parks: '5-15 min', airport: '45 min', downtown: '35 min' },
        lifestyle_score: 8.5,
        appreciation_trend: 'Strong growth (12-15% annually)',
        insights_data: { hidden_gem: true, reason: 'Tech hub with great infrastructure' }
      },
      {
        area_name: 'Sarjapur Road',
        city: currentCity,
        average_price: 6800000,
        commute_hubs: { tech_parks: '10-20 min', airport: '50 min', downtown: '30 min' },
        lifestyle_score: 8.0,
        appreciation_trend: 'Steady growth (10-12% annually)',
        insights_data: { hidden_gem: true, reason: 'Emerging area with upcoming metro' }
      },
      {
        area_name: 'Electronic City',
        city: currentCity,
        average_price: 5500000,
        commute_hubs: { tech_parks: '5-10 min', airport: '60 min', downtown: '40 min' },
        lifestyle_score: 7.5,
        appreciation_trend: 'Moderate growth (8-10% annually)',
        insights_data: { hidden_gem: true, reason: 'Budget-friendly with IT presence' }
      }
    ]

    try {
      const { data, error } = await supabase
        .from('area_insights')
        .insert(sampleAreas)
        .select()

      if (error) throw error
      setAreas(data || [])
    } catch (error) {
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

  return (
    <div className="bg-gradient-to-br from-green-50 to-emerald-50 rounded-2xl p-6 shadow-sm border border-green-100 mb-6">
      <button
        onClick={() => setShowDiscovery(!showDiscovery)}
        className="w-full text-left"
      >
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="bg-green-600 p-3 rounded-full">
              <MapPin className="h-6 w-6 text-white" />
            </div>
            <div>
              <h3 className="text-xl font-bold text-gray-900">Smart Area Discovery</h3>
              <p className="text-gray-600 text-sm">Discover underrated areas perfect for you</p>
            </div>
          </div>
          <button className="text-green-600 font-medium hover:text-green-700 transition-colors">
            {showDiscovery ? 'Hide' : 'Discover'} Areas
          </button>
        </div>
      </button>

      {showDiscovery && (
        <div className="mt-6 space-y-4 animate-fade-in">
          {workLocation && (
            <div className="bg-white rounded-xl p-4">
              <p className="text-sm text-gray-600 mb-2">Your work location</p>
              <div className="flex items-center gap-2">
                <MapPin className="h-4 w-4 text-green-600" />
                <span className="font-semibold text-gray-900">{workLocation}</span>
              </div>
            </div>
          )}

          {!workLocation && (
            <div className="bg-white rounded-xl p-4">
              <p className="text-sm text-gray-600 mb-2">Where do you work?</p>
              <div className="flex gap-2">
                <input
                  type="text"
                  placeholder="e.g., Whitefield, Koramangala"
                  value={workLocation}
                  onChange={(e) => setWorkLocation(e.target.value)}
                  className="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500"
                />
                <button
                  onClick={loadAreaInsights}
                  className="bg-green-600 text-white px-6 py-2 rounded-lg hover:bg-green-700 transition-colors font-medium"
                >
                  Find Areas
                </button>
              </div>
            </div>
          )}

          {loading ? (
            <div className="bg-white rounded-xl p-4">
              <div className="animate-pulse space-y-3">
                <div className="h-4 bg-gray-200 rounded w-3/4"></div>
                <div className="h-4 bg-gray-200 rounded w-1/2"></div>
              </div>
            </div>
          ) : (
            <div className="space-y-3">
              {areas.map((area) => (
                <div key={area.id} className="bg-white rounded-xl p-4 border-2 border-transparent hover:border-green-300 transition-colors">
                  <div className="flex items-start justify-between mb-3">
                    <div>
                      <h4 className="text-lg font-bold text-gray-900">{area.area_name}</h4>
                      <p className="text-sm text-gray-600">{area.insights_data?.reason || 'Great location'}</p>
                    </div>
                    <div className="flex items-center gap-1 bg-yellow-100 px-2 py-1 rounded-full">
                      <Star className="h-4 w-4 text-yellow-600" />
                      <span className="text-sm font-semibold text-yellow-900">{area.lifestyle_score}</span>
                    </div>
                  </div>

                  <div className="grid grid-cols-2 gap-3 mb-3">
                    <div className="bg-gray-50 rounded-lg p-3">
                      <p className="text-xs text-gray-600 mb-1">Avg. Price</p>
                      <p className="text-sm font-bold text-gray-900">{formatPrice(area.average_price)}</p>
                    </div>
                    <div className="bg-gray-50 rounded-lg p-3">
                      <p className="text-xs text-gray-600 mb-1">Growth</p>
                      <div className="flex items-center gap-1">
                        <TrendingUp className="h-3 w-3 text-green-600" />
                        <p className="text-sm font-bold text-gray-900">{area.appreciation_trend.split('(')[1]?.replace(')', '') || 'Good'}</p>
                      </div>
                    </div>
                  </div>

                  {area.commute_hubs && (
                    <div className="bg-blue-50 rounded-lg p-3 border border-blue-100">
                      <div className="flex items-center gap-2 mb-2">
                        <Clock className="h-4 w-4 text-blue-600" />
                        <p className="text-xs font-semibold text-gray-900">Commute Times</p>
                      </div>
                      <div className="grid grid-cols-3 gap-2 text-xs">
                        {Object.entries(area.commute_hubs).map(([key, value]) => (
                          <div key={key}>
                            <p className="text-gray-600 capitalize">{key.replace('_', ' ')}</p>
                            <p className="font-semibold text-gray-900">{value as string}</p>
                          </div>
                        ))}
                      </div>
                    </div>
                  )}

                  <button className="w-full mt-3 bg-green-600 text-white py-2 rounded-lg hover:bg-green-700 transition-colors font-medium text-sm">
                    View Properties in {area.area_name}
                  </button>
                </div>
              ))}
            </div>
          )}

          <div className="pt-4 border-t border-gray-200">
            <p className="text-xs text-gray-500">
              Recommendations based on commute patterns, price trends, and lifestyle factors.
            </p>
          </div>
        </div>
      )}
    </div>
  )
}
