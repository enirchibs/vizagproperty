import { useState } from 'react'
import { SEOHead } from '../components/SEOHead'
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, BarChart, Bar } from 'recharts'
import { getAllLocalities } from '../lib/marketTrendsData'
import { PropertyValuationTool } from '../components/PropertyValuationTool'
import { TrendingUp, ArrowUpRight, Percent, Map } from 'lucide-react'

export function MarketTrendsPage() {
  const localities = getAllLocalities()
  const [selectedLocality, setSelectedLocality] = useState(localities[0])

  const schema = {
    "@context": "https://schema.org",
    "@type": "WebPage",
    "name": "Vizag Real Estate Market Trends & Property Valuation | VizagProperty",
    "description": "Explore current property prices, historical market trends, and get a free instant property valuation for all major localities in Visakhapatnam.",
    "url": "https://vizagproperty.co.in/market-trends",
    "publisher": {
      "@type": "Organization",
      "name": "VizagProperty"
    }
  }

  // Format data for chart
  const comparisonData = localities.map(loc => ({
    name: loc.name,
    'Price (₹/sqft)': loc.currentAvgPricePerSqft,
    Growth: loc.yoyGrowth
  }))

  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <SEOHead 
        title="Vizag Property Market Trends & Free Valuation 2026"
        description="Check current real estate prices, historical trends, and get an instant property valuation for Madhurawada, MVP Colony, Yendada, and other top Vizag localities."
        schema={schema}
      />
      
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        
        {/* Header Section */}
        <div className="text-center mb-12">
          <span className="inline-block px-4 py-1.5 rounded-full bg-primary-100 text-primary-800 text-sm font-semibold tracking-wider mb-4">
            MARKET INTELLIGENCE
          </span>
          <h1 className="text-3xl md:text-5xl font-extrabold text-gray-900 mb-6">
            Vizag Real Estate Trends
          </h1>
          <p className="text-lg md:text-xl text-gray-600 max-w-3xl mx-auto">
            Make informed investment decisions with our data-driven insights. Track historical prices, compare localities, and instantly calculate your property's current market value.
          </p>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          
          {/* Left Column: Interactive Tools & Valuation */}
          <div className="lg:col-span-1 space-y-8">
            <PropertyValuationTool />

            <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6">
              <h3 className="text-lg font-bold text-gray-900 mb-4 flex items-center">
                <Map className="h-5 w-5 mr-2 text-primary-600" />
                Select Locality Details
              </h3>
              <div className="space-y-3">
                {localities.map((loc) => (
                  <button
                    key={loc.id}
                    onClick={() => setSelectedLocality(loc)}
                    className={`w-full text-left px-4 py-3 rounded-xl transition-all border ${
                      selectedLocality.id === loc.id
                        ? 'bg-primary-50 border-primary-300 ring-1 ring-primary-500'
                        : 'bg-white border-gray-200 hover:border-primary-300 hover:bg-gray-50'
                    }`}
                  >
                    <div className="flex justify-between items-center">
                      <span className="font-semibold text-gray-900">{loc.name}</span>
                      <ArrowUpRight className={`h-4 w-4 ${selectedLocality.id === loc.id ? 'text-primary-600' : 'text-gray-400'}`} />
                    </div>
                    <div className="text-xs text-gray-500 mt-1 capitalize">
                      {loc.type.replace('_', ' ')}
                    </div>
                  </button>
                ))}
              </div>
            </div>
          </div>

          {/* Right Column: Charts & Analysis */}
          <div className="lg:col-span-2 space-y-8">
            
            {/* Highlight Cards */}
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
              <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 text-center">
                <TrendingUp className="h-8 w-8 text-primary-600 mx-auto mb-3" />
                <p className="text-sm text-gray-500 font-semibold mb-1">Avg Price ({selectedLocality.name})</p>
                <h4 className="text-2xl font-black text-gray-900">₹{selectedLocality.currentAvgPricePerSqft.toLocaleString('en-IN')}/sqft</h4>
              </div>
              <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 text-center">
                <ArrowUpRight className="h-8 w-8 text-green-500 mx-auto mb-3" />
                <p className="text-sm text-gray-500 font-semibold mb-1">YoY Growth</p>
                <h4 className="text-2xl font-black text-gray-900 text-green-600">+{selectedLocality.yoyGrowth}%</h4>
              </div>
              <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 text-center">
                <Percent className="h-8 w-8 text-orange-500 mx-auto mb-3" />
                <p className="text-sm text-gray-500 font-semibold mb-1">Avg Rental Yield</p>
                <h4 className="text-2xl font-black text-gray-900">{selectedLocality.rentalYield}%</h4>
              </div>
            </div>

            {/* Historical Trend Chart */}
            <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
              <div className="mb-6">
                <h3 className="text-xl font-bold text-gray-900">Historical Price Trend: {selectedLocality.name}</h3>
                <p className="text-gray-600 mt-2">{selectedLocality.description}</p>
              </div>
              <div className="h-[350px] w-full">
                <ResponsiveContainer width="100%" height="100%">
                  <LineChart
                    data={selectedLocality.historicalData}
                    margin={{ top: 10, right: 30, left: 0, bottom: 0 }}
                  >
                    <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#E5E7EB" />
                    <XAxis dataKey="year" axisLine={false} tickLine={false} tick={{fill: '#6B7280'}} dy={10} />
                    <YAxis 
                      axisLine={false} 
                      tickLine={false} 
                      tick={{fill: '#6B7280'}} 
                      tickFormatter={(value) => `₹${value}`} 
                      domain={['auto', 'auto']}
                    />
                    <Tooltip 
                      contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)' }}
                      formatter={(value: any) => [`₹${Number(value).toLocaleString('en-IN')}/sqft`, 'Average Price']}
                    />
                    <Legend />
                    <Line 
                      type="monotone" 
                      dataKey="price" 
                      name="Price per Sq.ft"
                      stroke="#0284c7" // primary-600
                      strokeWidth={4}
                      dot={{ r: 6, fill: '#0284c7', strokeWidth: 2, stroke: '#fff' }}
                      activeDot={{ r: 8 }} 
                    />
                  </LineChart>
                </ResponsiveContainer>
              </div>
            </div>

            {/* Locality Comparison Chart */}
            <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
              <div className="mb-6">
                <h3 className="text-xl font-bold text-gray-900">Locality Price Comparison</h3>
                <p className="text-gray-600 mt-2">Compare current average prices across top micro-markets in Visakhapatnam.</p>
              </div>
              <div className="h-[350px] w-full">
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart
                    data={comparisonData}
                    margin={{ top: 10, right: 30, left: 0, bottom: 20 }}
                  >
                    <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#E5E7EB" />
                    <XAxis 
                      dataKey="name" 
                      axisLine={false} 
                      tickLine={false} 
                      tick={{fill: '#6B7280', fontSize: 12}} 
                      dy={10} 
                      interval={0}
                    />
                    <YAxis 
                      axisLine={false} 
                      tickLine={false} 
                      tick={{fill: '#6B7280'}} 
                      tickFormatter={(value) => `₹${value}`}
                    />
                    <Tooltip 
                      contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)' }}
                      formatter={(value: any) => [`₹${Number(value).toLocaleString('en-IN')}`, 'Current Price (₹/sqft)']}
                      cursor={{fill: '#f3f4f6'}}
                    />
                    <Bar 
                      dataKey="Price (₹/sqft)" 
                      fill="#0ea5e9" // primary-500 
                      radius={[6, 6, 0, 0]} 
                      barSize={40}
                    />
                  </BarChart>
                </ResponsiveContainer>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  )
}
