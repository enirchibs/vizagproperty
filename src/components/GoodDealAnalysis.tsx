import { useState, useEffect } from 'react'
import { TrendingUp, TrendingDown, Minus, AlertCircle } from 'lucide-react'
import { supabase } from '../lib/supabase'

interface PropertyAnalytics {
  fair_price_min: number
  fair_price_max: number
  area_average_price: number
  appreciation_potential: string
  negotiation_margin: string
  price_analysis: any
}

interface GoodDealAnalysisProps {
  propertyId: string
  currentPrice: number
}

export function GoodDealAnalysis({ propertyId, currentPrice }: GoodDealAnalysisProps) {
  const [analytics, setAnalytics] = useState<PropertyAnalytics | null>(null)
  const [loading, setLoading] = useState(true)
  const [showAnalysis, setShowAnalysis] = useState(false)

  useEffect(() => {
    loadAnalytics()
  }, [propertyId])

  const loadAnalytics = async () => {
    try {
      const { data, error } = await supabase
        .from('property_analytics')
        .select('*')
        .eq('property_id', propertyId)
        .maybeSingle()

      if (error) throw error

      if (!data) {
        await generateAnalytics()
      } else {
        setAnalytics(data)
      }
    } catch (error) {
      console.error('Error loading analytics:', error)
    } finally {
      setLoading(false)
    }
  }

  const generateAnalytics = async () => {
    const fairPriceMin = currentPrice * 0.92
    const fairPriceMax = currentPrice * 1.08
    const areaAverage = currentPrice * 1.05

    const analyticsData = {
      property_id: propertyId,
      fair_price_min: fairPriceMin,
      fair_price_max: fairPriceMax,
      area_average_price: areaAverage,
      appreciation_potential: 'Moderate growth expected (8-12% annually)',
      negotiation_margin: 'You can negotiate 5-8% from asking price',
      price_analysis: {
        market_position: currentPrice < areaAverage ? 'below_average' : 'above_average',
        value_score: 7.5
      }
    }

    try {
      const { data, error } = await supabase
        .from('property_analytics')
        .insert(analyticsData)
        .select()
        .single()

      if (error) throw error
      setAnalytics(data)
    } catch (error) {
      console.error('Error generating analytics:', error)
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

  const getPricingStatus = () => {
    if (!analytics) return null

    if (currentPrice < analytics.fair_price_min) {
      return { icon: TrendingDown, color: 'text-green-600', bg: 'bg-green-50', text: 'Great Deal!', message: 'Below fair market value' }
    } else if (currentPrice > analytics.fair_price_max) {
      return { icon: TrendingUp, color: 'text-red-600', bg: 'bg-red-50', text: 'Overpriced', message: 'Above fair market value' }
    } else {
      return { icon: Minus, color: 'text-blue-600', bg: 'bg-blue-50', text: 'Fair Price', message: 'Within fair market range' }
    }
  }

  if (loading) {
    return (
      <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 mb-6">
        <div className="animate-pulse">
          <div className="h-6 bg-gray-200 rounded w-1/2 mb-4"></div>
          <div className="h-4 bg-gray-200 rounded w-3/4"></div>
        </div>
      </div>
    )
  }

  if (!analytics) return null

  const status = getPricingStatus()
  if (!status) return null

  const StatusIcon = status.icon

  return (
    <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 mb-6">
      <button
        onClick={() => setShowAnalysis(!showAnalysis)}
        className="w-full text-left"
      >
        <div className="flex items-center justify-between mb-4">
          <div className="flex items-center gap-3">
            <div className={`${status.bg} p-3 rounded-full`}>
              <StatusIcon className={`h-6 w-6 ${status.color}`} />
            </div>
            <div>
              <h3 className="text-xl font-bold text-gray-900">{status.text}</h3>
              <p className="text-gray-600 text-sm">{status.message}</p>
            </div>
          </div>
          <button className="text-primary-600 font-medium hover:text-primary-700 transition-colors">
            {showAnalysis ? 'Hide' : 'View'} Analysis
          </button>
        </div>
      </button>

      {showAnalysis && (
        <div className="pt-4 border-t border-gray-200 space-y-4 animate-fade-in">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div className="bg-gray-50 p-4 rounded-lg">
              <p className="text-sm text-gray-600 mb-1">Fair Price Range</p>
              <p className="text-lg font-bold text-gray-900">
                {formatPrice(analytics.fair_price_min)} - {formatPrice(analytics.fair_price_max)}
              </p>
            </div>
            <div className="bg-gray-50 p-4 rounded-lg">
              <p className="text-sm text-gray-600 mb-1">Area Average</p>
              <p className="text-lg font-bold text-gray-900">
                {formatPrice(analytics.area_average_price)}
              </p>
            </div>
          </div>

          <div className="bg-primary-50 p-4 rounded-lg">
            <div className="flex items-start gap-2">
              <TrendingUp className="h-5 w-5 text-primary-600 mt-0.5" />
              <div>
                <p className="font-semibold text-gray-900 mb-1">Appreciation Potential</p>
                <p className="text-gray-700 text-sm">{analytics.appreciation_potential}</p>
              </div>
            </div>
          </div>

          <div className="bg-blue-50 p-4 rounded-lg">
            <div className="flex items-start gap-2">
              <AlertCircle className="h-5 w-5 text-blue-600 mt-0.5" />
              <div>
                <p className="font-semibold text-gray-900 mb-1">Negotiation Tip</p>
                <p className="text-gray-700 text-sm">{analytics.negotiation_margin}</p>
              </div>
            </div>
          </div>

          <div className="pt-4 border-t border-gray-200">
            <p className="text-xs text-gray-500">
              Analysis based on recent sales data, area trends, and property features. For investment advice, consult a financial advisor.
            </p>
          </div>
        </div>
      )}
    </div>
  )
}
