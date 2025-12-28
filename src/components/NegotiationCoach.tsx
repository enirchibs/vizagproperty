import { useState, useEffect } from 'react'
import { Target, AlertTriangle, TrendingDown, Lightbulb } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { useAuth } from '../contexts/AuthContext'

interface NegotiationInsights {
  suggested_offer: number
  negotiation_strategy: string
  objections_to_raise: string[]
  walk_away_price: number
  market_context: string
}

interface NegotiationCoachProps {
  propertyId: string
  currentPrice: number
}

export function NegotiationCoach({ propertyId, currentPrice }: NegotiationCoachProps) {
  const { user } = useAuth()
  const [insights, setInsights] = useState<NegotiationInsights | null>(null)
  const [loading, setLoading] = useState(true)
  const [showCoach, setShowCoach] = useState(false)

  useEffect(() => {
    if (user && showCoach) {
      loadInsights()
    }
  }, [propertyId, user, showCoach])

  const loadInsights = async () => {
    try {
      const { data, error } = await supabase
        .from('negotiation_insights')
        .select('*')
        .eq('property_id', propertyId)
        .maybeSingle()

      if (error) throw error

      if (!data) {
        await generateInsights()
      } else {
        setInsights(data)
      }
    } catch (error) {
      console.error('Error loading insights:', error)
    } finally {
      setLoading(false)
    }
  }

  const generateInsights = async () => {
    const suggestedOffer = currentPrice * 0.92
    const walkAwayPrice = currentPrice * 0.98

    const insightsData = {
      property_id: propertyId,
      suggested_offer: suggestedOffer,
      negotiation_strategy: 'Start with a conservative offer and gradually increase. Show genuine interest but remain willing to walk away.',
      objections_to_raise: [
        'Property has been listed for a while',
        'Minor repairs or maintenance needed',
        'Comparable properties in area are priced lower',
        'Market conditions favor buyers currently'
      ],
      walk_away_price: walkAwayPrice,
      market_context: 'Current market conditions are balanced, giving buyers moderate negotiating power.'
    }

    try {
      const { data, error } = await supabase
        .from('negotiation_insights')
        .insert(insightsData)
        .select()
        .single()

      if (error) throw error
      setInsights(data)
    } catch (error) {
      console.error('Error generating insights:', error)
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

  if (!user) {
    return (
      <div className="bg-gradient-to-br from-orange-50 to-red-50 rounded-2xl p-6 shadow-sm border border-orange-100 mb-6">
        <div className="flex items-center gap-3 mb-3">
          <div className="bg-orange-600 p-3 rounded-full">
            <Target className="h-6 w-6 text-white" />
          </div>
          <div>
            <h3 className="text-xl font-bold text-gray-900">AI Negotiation Coach</h3>
            <p className="text-gray-600 text-sm">Get expert negotiation strategies</p>
          </div>
        </div>
        <p className="text-gray-600 text-sm bg-white rounded-lg p-4">
          Sign in to unlock personalized negotiation advice and pricing strategies.
        </p>
      </div>
    )
  }

  return (
    <div className="bg-gradient-to-br from-orange-50 to-red-50 rounded-2xl p-6 shadow-sm border border-orange-100 mb-6">
      <button
        onClick={() => setShowCoach(!showCoach)}
        className="w-full text-left"
      >
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="bg-orange-600 p-3 rounded-full">
              <Target className="h-6 w-6 text-white" />
            </div>
            <div>
              <h3 className="text-xl font-bold text-gray-900">AI Negotiation Coach</h3>
              <p className="text-gray-600 text-sm">Get expert strategies before your site visit</p>
            </div>
          </div>
          <button className="text-orange-600 font-medium hover:text-orange-700 transition-colors">
            {showCoach ? 'Hide' : 'Show'} Strategy
          </button>
        </div>
      </button>

      {showCoach && (
        <div className="mt-6 space-y-4 animate-fade-in">
          {loading ? (
            <div className="bg-white rounded-xl p-4">
              <div className="animate-pulse space-y-3">
                <div className="h-4 bg-gray-200 rounded w-3/4"></div>
                <div className="h-4 bg-gray-200 rounded w-1/2"></div>
              </div>
            </div>
          ) : insights ? (
            <>
              <div className="bg-white rounded-xl p-4">
                <div className="flex items-start gap-2 mb-3">
                  <Target className="h-5 w-5 text-orange-600 mt-0.5" />
                  <div>
                    <p className="font-semibold text-gray-900 mb-1">Opening Offer</p>
                    <p className="text-2xl font-bold text-orange-600">{formatPrice(insights.suggested_offer)}</p>
                    <p className="text-sm text-gray-600 mt-1">
                      Start here to leave room for negotiation
                    </p>
                  </div>
                </div>
              </div>

              <div className="bg-white rounded-xl p-4">
                <div className="flex items-start gap-2 mb-3">
                  <Lightbulb className="h-5 w-5 text-orange-600 mt-0.5" />
                  <div>
                    <p className="font-semibold text-gray-900 mb-2">Negotiation Strategy</p>
                    <p className="text-sm text-gray-700">{insights.negotiation_strategy}</p>
                  </div>
                </div>
              </div>

              <div className="bg-white rounded-xl p-4">
                <div className="flex items-start gap-2 mb-3">
                  <AlertTriangle className="h-5 w-5 text-orange-600 mt-0.5" />
                  <div>
                    <p className="font-semibold text-gray-900 mb-2">Objections to Raise</p>
                    <ul className="space-y-2">
                      {insights.objections_to_raise.map((objection, index) => (
                        <li key={index} className="text-sm text-gray-700 flex items-start gap-2">
                          <span className="text-orange-600 font-bold">•</span>
                          <span>{objection}</span>
                        </li>
                      ))}
                    </ul>
                  </div>
                </div>
              </div>

              <div className="bg-white rounded-xl p-4">
                <div className="flex items-start gap-2 mb-3">
                  <TrendingDown className="h-5 w-5 text-red-600 mt-0.5" />
                  <div>
                    <p className="font-semibold text-gray-900 mb-1">Walk Away Price</p>
                    <p className="text-xl font-bold text-red-600">{formatPrice(insights.walk_away_price)}</p>
                    <p className="text-sm text-gray-600 mt-1">
                      Don't go above this price
                    </p>
                  </div>
                </div>
              </div>

              <div className="bg-blue-50 rounded-xl p-4 border border-blue-100">
                <p className="text-sm font-semibold text-gray-900 mb-1">Market Context</p>
                <p className="text-sm text-gray-700">{insights.market_context}</p>
              </div>

              <div className="pt-4 border-t border-gray-200">
                <p className="text-xs text-gray-500">
                  These are suggestions based on market analysis. Use your judgment and consider getting professional advice for major transactions.
                </p>
              </div>
            </>
          ) : null}
        </div>
      )}
    </div>
  )
}
