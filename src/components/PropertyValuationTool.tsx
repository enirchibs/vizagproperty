import React, { useState } from 'react'
import { TrendingUp, Home, MapPin, Calculator, RefreshCw } from 'lucide-react'
import { getAllLocalities, getValuation } from '../lib/marketTrendsData'

export function PropertyValuationTool() {
  const localities = getAllLocalities()
  const [selectedLocality, setSelectedLocality] = useState(localities[0].id)
  const [area, setArea] = useState<number | ''>(1000)
  const [age, setAge] = useState<number | ''>(0)
  const [valuation, setValuation] = useState<any>(null)

  const handleCalculate = (e: React.FormEvent) => {
    e.preventDefault()
    if (!area || typeof area !== 'number') return
    const result = getValuation(selectedLocality, area, typeof age === 'number' ? age : 0)
    setValuation(result)
  }

  const formatCurrency = (amount: number) => {
    if (amount >= 10000000) {
      return `₹${(amount / 10000000).toFixed(2)} Cr`
    } else if (amount >= 100000) {
      return `₹${(amount / 100000).toFixed(2)} Lakhs`
    }
    return `₹${amount.toLocaleString('en-IN')}`
  }

  return (
    <div className="bg-white rounded-2xl shadow-lg border border-gray-100 overflow-hidden">
      <div className="bg-gradient-to-r from-primary-900 to-primary-700 px-6 py-8 text-center">
        <Calculator className="h-12 w-12 text-white mx-auto mb-4 opacity-90" />
        <h2 className="text-2xl font-bold text-white mb-2">Free Property Valuation</h2>
        <p className="text-primary-100">Get an instant estimate based on real-time Vizag market data.</p>
      </div>

      <div className="p-6 md:p-8">
        <form onSubmit={handleCalculate} className="space-y-6">
          
          <div>
            <label className="block text-sm font-semibold text-gray-700 mb-2 flex items-center">
              <MapPin className="h-4 w-4 mr-2 text-primary-600" />
              Select Locality
            </label>
            <select
              value={selectedLocality}
              onChange={(e) => {
                setSelectedLocality(e.target.value)
                setValuation(null)
              }}
              className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent bg-gray-50 text-gray-900 font-medium"
            >
              {localities.map((loc) => (
                <option key={loc.id} value={loc.id}>
                  {loc.name} ({loc.type === 'residential_apartment' ? 'Apartments' : 'Plots'})
                </option>
              ))}
            </select>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label className="block text-sm font-semibold text-gray-700 mb-2 flex items-center">
                <Home className="h-4 w-4 mr-2 text-primary-600" />
                Area (Sq.ft / Sq.yards)
              </label>
              <input
                type="number"
                min="100"
                max="100000"
                value={area}
                onChange={(e) => {
                  setArea(e.target.value === '' ? '' : Number(e.target.value))
                  setValuation(null)
                }}
                className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent bg-gray-50 text-gray-900 font-medium"
                placeholder="e.g. 1200"
                required
              />
            </div>
            
            <div>
              <label className="block text-sm font-semibold text-gray-700 mb-2 flex items-center">
                <RefreshCw className="h-4 w-4 mr-2 text-primary-600" />
                Property Age (Years)
              </label>
              <input
                type="number"
                min="0"
                max="50"
                value={age}
                onChange={(e) => {
                  setAge(e.target.value === '' ? '' : Number(e.target.value))
                  setValuation(null)
                }}
                className="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-transparent bg-gray-50 text-gray-900 font-medium"
                placeholder="0 for New"
              />
            </div>
          </div>

          <button
            type="submit"
            className="w-full bg-primary-600 text-white font-bold py-4 rounded-xl hover:bg-primary-700 transition-colors shadow-md hover:shadow-lg flex items-center justify-center text-lg"
          >
            Calculate Value
          </button>
        </form>

        {valuation && (
          <div className="mt-8 pt-8 border-t border-gray-100 animate-slide-up">
            <h3 className="text-center text-sm font-semibold text-gray-500 uppercase tracking-widest mb-4">Estimated Market Value</h3>
            
            <div className="text-center mb-6">
              <div className="text-5xl font-black text-gray-900 mb-2">
                {formatCurrency(valuation.estimatedValue)}
              </div>
              <p className="text-gray-500 font-medium flex items-center justify-center">
                <TrendingUp className="h-4 w-4 mr-1 text-green-500" />
                Based on ₹{valuation.avgPricePerSqft.toLocaleString('en-IN')}/sqft average
              </p>
            </div>

            <div className="flex justify-between items-center p-4 bg-gray-50 rounded-xl border border-gray-200">
              <div className="text-center flex-1">
                <p className="text-xs text-gray-500 font-semibold mb-1">Likely Minimum</p>
                <p className="text-lg font-bold text-gray-800">{formatCurrency(valuation.lowerBound)}</p>
              </div>
              <div className="w-px h-10 bg-gray-300 mx-4"></div>
              <div className="text-center flex-1">
                <p className="text-xs text-gray-500 font-semibold mb-1">Likely Maximum</p>
                <p className="text-lg font-bold text-gray-800">{formatCurrency(valuation.upperBound)}</p>
              </div>
            </div>
            
            <p className="text-xs text-center text-gray-400 mt-4">
              * This is an algorithmic estimate based on historical and current market trends in Vizag. Actual property values may vary based on facing, floor, exact location, and amenities.
            </p>
          </div>
        )}
      </div>
    </div>
  )
}
