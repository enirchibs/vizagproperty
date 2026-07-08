import { Link } from 'react-router-dom'
import { SEOHead } from '../components/SEOHead'
import { Globe, ChevronRight, CheckCircle2, Building, Plane, TrendingUp } from 'lucide-react'

export function NRIInvestmentPage() {
  const schema = {
    "@context": "https://schema.org",
    "@type": "WebPage",
    "name": "NRI Property Investment in Visakhapatnam | VizagProperty",
    "description": "Exclusive real estate investment opportunities in Visakhapatnam for Non-Resident Indians (NRIs). Get end-to-end property management, legal assistance, and high ROI properties.",
    "url": "https://vizagproperty.co.in/nri-investments"
  }

  return (
    <div className="min-h-screen bg-white">
      <SEOHead 
        title="NRI Property Investments in Visakhapatnam | VizagProperty"
        description="Premium property investment opportunities for NRIs in Vizag. High ROI, secure transactions, and end-to-end property management services."
        schema={schema}
      />
      
      {/* Hero Section */}
      <div className="relative bg-gradient-to-r from-primary-900 to-primary-800 text-white overflow-hidden">
        <div className="absolute inset-0 opacity-10">
          <svg className="w-full h-full" xmlns="http://www.w3.org/2000/svg">
            <defs>
              <pattern id="grid-pattern" width="40" height="40" patternUnits="userSpaceOnUse">
                <path d="M 40 0 L 0 0 0 40" fill="none" stroke="currentColor" strokeWidth="1"/>
              </pattern>
            </defs>
            <rect width="100%" height="100%" fill="url(#grid-pattern)" />
          </svg>
        </div>
        
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20 lg:py-32 relative z-10">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <div>
              <span className="inline-flex items-center px-4 py-1.5 rounded-full bg-primary-700/50 border border-primary-500 text-sm font-semibold tracking-wider mb-6">
                <Globe className="h-4 w-4 mr-2" />
                NRI EXCLUSIVE HUB
              </span>
              <h1 className="text-4xl md:text-5xl lg:text-6xl font-extrabold leading-tight mb-6">
                Invest in Vizag's Booming Real Estate Market
              </h1>
              <p className="text-lg md:text-xl text-primary-100 mb-8 max-w-lg">
                Secure, high-yield property investments in Andhra Pradesh's executive capital. We offer end-to-end management for Non-Resident Indians.
              </p>
              <div className="flex flex-col sm:flex-row gap-4">
                <Link
                  to="/properties"
                  className="inline-flex justify-center items-center px-8 py-4 bg-white text-primary-900 rounded-xl font-bold hover:bg-gray-50 transition-colors shadow-lg text-lg"
                >
                  Explore Premium Projects
                  <ChevronRight className="ml-2 h-5 w-5" />
                </Link>
                <a
                  href="#services"
                  className="inline-flex justify-center items-center px-8 py-4 bg-primary-700 text-white rounded-xl font-bold hover:bg-primary-600 transition-colors border border-primary-600 text-lg"
                >
                  View Services
                </a>
              </div>
            </div>
            
            <div className="hidden lg:block relative">
              <div className="absolute inset-0 bg-gradient-to-tr from-primary-500/30 to-transparent rounded-full blur-3xl" />
              <img 
                src="https://images.unsplash.com/photo-1574362848149-11496d93a7c7?auto=format&fit=crop&q=80&w=1000" 
                alt="Vizag Aerial View" 
                className="relative rounded-2xl shadow-2xl border-4 border-white/10 transform rotate-2 hover:rotate-0 transition-transform duration-500"
              />
            </div>
          </div>
        </div>
      </div>

      {/* Why Vizag Section */}
      <div className="py-20 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center max-w-3xl mx-auto mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">Why Invest in Visakhapatnam Now?</h2>
            <p className="text-lg text-gray-600">
              Vizag is transforming rapidly into a global IT and manufacturing hub. Early investors are seeing unprecedented capital appreciation.
            </p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-md transition-shadow">
              <div className="w-14 h-14 bg-blue-100 text-blue-600 rounded-2xl flex items-center justify-center mb-6">
                <Building className="h-7 w-7" />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-3">Executive Capital Status</h3>
              <p className="text-gray-600">With immense government focus and infrastructure development, real estate values in key corridors are surging.</p>
            </div>
            
            <div className="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-md transition-shadow">
              <div className="w-14 h-14 bg-green-100 text-green-600 rounded-2xl flex items-center justify-center mb-6">
                <Plane className="h-7 w-7" />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-3">Bhogapuram Int. Airport</h3>
              <p className="text-gray-600">The upcoming greenfield airport is driving massive demand for plots and villas in the northern corridor.</p>
            </div>
            
            <div className="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-md transition-shadow">
              <div className="w-14 h-14 bg-purple-100 text-purple-600 rounded-2xl flex items-center justify-center mb-6">
                <TrendingUp className="h-7 w-7" />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-3">High Rental Yields</h3>
              <p className="text-gray-600">A booming IT sector (Rushikonda & Madhurawada) ensures a steady influx of professionals seeking premium rentals.</p>
            </div>
          </div>
        </div>
      </div>

      {/* Services for NRIs */}
      <div id="services" className="py-20 bg-white border-t border-gray-100">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
            <div>
              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">End-to-End NRI Property Services</h2>
              <p className="text-lg text-gray-600 mb-8">
                Investing from thousands of miles away shouldn't be stressful. VizagProperty acts as your dedicated proxy on the ground.
              </p>
              
              <div className="space-y-6">
                {[
                  { title: 'Zero-Hassle Property Management', desc: 'We handle tenant screening, rent collection, and property maintenance.' },
                  { title: 'Legal & Taxation Assistance', desc: 'Expert guidance on FEMA regulations, TDS, and property registration.' },
                  { title: 'Verified Builder Projects', desc: 'We strictly list RERA-approved properties from grade-A developers.' },
                  { title: 'Virtual Tours & Live Tracking', desc: 'Inspect properties and monitor construction progress via live video calls.' }
                ].map((item, idx) => (
                  <div key={idx} className="flex">
                    <div className="flex-shrink-0 mt-1">
                      <CheckCircle2 className="h-6 w-6 text-primary-600" />
                    </div>
                    <div className="ml-4">
                      <h4 className="text-lg font-bold text-gray-900">{item.title}</h4>
                      <p className="text-gray-600 mt-1">{item.desc}</p>
                    </div>
                  </div>
                ))}
              </div>
            </div>
            
            <div className="bg-gray-50 rounded-3xl p-8 lg:p-12 border border-gray-100">
              <h3 className="text-2xl font-bold text-gray-900 mb-6 text-center">Schedule a Strategy Call</h3>
              <form className="space-y-4">
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">First Name</label>
                    <input type="text" className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary-500 focus:border-transparent" placeholder="John" />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Last Name</label>
                    <input type="text" className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary-500 focus:border-transparent" placeholder="Doe" />
                  </div>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                  <input type="email" className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary-500 focus:border-transparent" placeholder="john@example.com" />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Country of Residence</label>
                  <select className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                    <option>United States</option>
                    <option>United Arab Emirates</option>
                    <option>United Kingdom</option>
                    <option>Australia</option>
                    <option>Canada</option>
                    <option>Singapore</option>
                    <option>Other</option>
                  </select>
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Investment Budget</label>
                  <select className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                    <option>₹50L - ₹1 Crore</option>
                    <option>₹1 Crore - ₹2 Crores</option>
                    <option>₹2 Crores+</option>
                  </select>
                </div>
                <button type="button" className="w-full bg-primary-600 text-white font-bold py-4 rounded-xl hover:bg-primary-700 transition-colors mt-4 shadow-md">
                  Request Callback
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
