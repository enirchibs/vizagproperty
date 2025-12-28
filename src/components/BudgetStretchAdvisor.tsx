import { useState } from 'react'
import { DollarSign, TrendingUp, MapPin, Home } from 'lucide-react'

interface BudgetStretchAdvisorProps {
  currentPrice: number
  propertyType: string
  location: string
  bedrooms: number
}

export function BudgetStretchAdvisor({ currentPrice }: BudgetStretchAdvisorProps) {
  const [showAdvisor, setShowAdvisor] = useState(false)
  const [customBudget, setCustomBudget] = useState('')

  const formatPrice = (price: number) => {
    if (price >= 10000000) {
      return `₹${(price / 10000000).toFixed(2)} Cr`
    } else if (price >= 100000) {
      return `₹${(price / 100000).toFixed(2)} L`
    }
    return `₹${price.toLocaleString('en-IN')}`
  }

  const getBudgetOptions = () => {
    const options = [
      { budget: currentPrice * 1.1, label: '+10%' },
      { budget: currentPrice * 1.2, label: '+20%' },
      { budget: currentPrice * 1.3, label: '+30%' }
    ]

    return options.map(option => ({
      ...option,
      benefits: generateBenefits(option.budget, currentPrice)
    }))
  }

  const generateBenefits = (newBudget: number, oldBudget: number) => {
    const increase = ((newBudget - oldBudget) / oldBudget) * 100
    const benefits = []

    if (increase >= 10) {
      benefits.push({
        icon: Home,
        title: 'Better Amenities',
        description: 'Access to premium amenities like swimming pool, gym, and clubhouse'
      })
    }

    if (increase >= 20) {
      benefits.push({
        icon: MapPin,
        title: 'Prime Locations Unlocked',
        description: 'Top-tier neighborhoods with better infrastructure and connectivity'
      })
    }

    if (increase >= 30) {
      benefits.push({
        icon: TrendingUp,
        title: 'Higher ROI Potential',
        description: '15-20% better appreciation expected in premium areas'
      })
    }

    return benefits
  }

  const budgetOptions = getBudgetOptions()

  return (
    <div className="bg-gradient-to-br from-blue-50 to-indigo-50 rounded-2xl p-6 shadow-sm border border-blue-100 mb-6">
      <button
        onClick={() => setShowAdvisor(!showAdvisor)}
        className="w-full text-left"
      >
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="bg-blue-600 p-3 rounded-full">
              <DollarSign className="h-6 w-6 text-white" />
            </div>
            <div>
              <h3 className="text-xl font-bold text-gray-900">Can you stretch your budget?</h3>
              <p className="text-gray-600 text-sm">See what extra you get at higher price points</p>
            </div>
          </div>
          <button className="text-blue-600 font-medium hover:text-blue-700 transition-colors">
            {showAdvisor ? 'Hide' : 'Explore'}
          </button>
        </div>
      </button>

      {showAdvisor && (
        <div className="mt-6 space-y-4 animate-fade-in">
          <div className="bg-white rounded-xl p-4">
            <p className="text-sm text-gray-600 mb-3">Current Property Budget</p>
            <p className="text-2xl font-bold text-gray-900">{formatPrice(currentPrice)}</p>
          </div>

          <div className="space-y-3">
            {budgetOptions.map((option, index) => (
              <div key={index} className="bg-white rounded-xl p-4 border-2 border-transparent hover:border-blue-300 transition-colors">
                <div className="flex items-center justify-between mb-3">
                  <div>
                    <span className="text-lg font-bold text-gray-900">{formatPrice(option.budget)}</span>
                    <span className="ml-2 text-sm text-blue-600 font-medium">{option.label} more</span>
                  </div>
                </div>

                <div className="space-y-2">
                  {option.benefits.map((benefit, idx) => {
                    const BenefitIcon = benefit.icon
                    return (
                      <div key={idx} className="flex items-start gap-2">
                        <BenefitIcon className="h-4 w-4 text-blue-600 mt-0.5 flex-shrink-0" />
                        <div>
                          <p className="text-sm font-semibold text-gray-900">{benefit.title}</p>
                          <p className="text-xs text-gray-600">{benefit.description}</p>
                        </div>
                      </div>
                    )
                  })}
                </div>
              </div>
            ))}
          </div>

          <div className="bg-white rounded-xl p-4">
            <p className="text-sm font-semibold text-gray-900 mb-2">Or enter your maximum budget</p>
            <div className="flex gap-2">
              <input
                type="number"
                placeholder="Enter amount"
                value={customBudget}
                onChange={(e) => setCustomBudget(e.target.value)}
                className="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              />
              <button className="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition-colors font-medium">
                Analyze
              </button>
            </div>
          </div>

          <div className="pt-4 border-t border-gray-200">
            <p className="text-xs text-gray-500">
              Recommendations based on market data and property availability. Actual benefits may vary.
            </p>
          </div>
        </div>
      )}
    </div>
  )
}
