import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Search, MapPin, Shield, TrendingUp, Home, Building2, CheckCircle2, ArrowRight, Phone } from 'lucide-react'
import { PropertyCard } from '../components/PropertyCard'
import { supabase } from '../lib/supabase'
import type { Property } from '../types'
import { buildStrictQuery, CATEGORY_CONTEXTS } from '../lib/searchFilters'

export default function VMRDAApprovedPlotsPage() {
  const [searchQuery, setSearchQuery] = useState('')
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [selectedLocality, setSelectedLocality] = useState('')
  const [selectedBudget, setSelectedBudget] = useState('')
  const [selectedSize, setSelectedSize] = useState('')

  useEffect(() => {
    document.title = 'VMRDA Approved Plots in Vizag | Safe & Legal Plots for Sale in Visakhapatnam'

    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Buy VMRDA approved plots in Vizag with 180% appreciation. Explore gated community plots, open plots, and residential plots in Madhurawada, PM Palem, Yendada. Safe & legal VMRDA plots.')
    }

    const faqSchema = {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "What are VMRDA approved plots in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "VMRDA approved plots in Vizag are residential plots that have received official approval from the Visakhapatnam Metropolitan Region Development Authority. These plots come with clear title deeds, proper documentation, legal compliance, and guaranteed infrastructure development including roads, water supply, and electricity."
          }
        },
        {
          "@type": "Question",
          "name": "What is the price of VMRDA plots in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "VMRDA approved plots in Vizag range from ₹3,000 to ₹8,000 per sq yard depending on location. Budget-friendly areas like Gajuwaka and Kommadi start from ₹15-20 lakhs for complete plots, while premium locations like Madhurawada and PM Palem range from ₹25 lakhs to ₹1 crore+."
          }
        }
      ]
    }

    const script = document.createElement('script')
    script.type = 'application/ld+json'
    script.textContent = JSON.stringify(faqSchema)
    document.head.appendChild(script)

    loadProperties()

    return () => {
      const existingScript = document.querySelector('script[type="application/ld+json"]')
      if (existingScript) existingScript.remove()
    }
  }, [])

  const loadProperties = async () => {
    try {
      // IMMUTABLE: VMRDA plots in Vizag only
      const categoryContext = CATEGORY_CONTEXTS['vmrda-approved-plots-vizag']
      const query = buildStrictQuery(supabase, {}, {}, categoryContext).limit(12)
      const { data, error } = await query

      if (error) throw error
      setProperties(data || [])
    } catch (error) {
      console.error('Error loading properties:', error)
    } finally {
      setLoading(false)
    }
  }

  const handleSearch = () => {
    // Always maintain category filters
    window.location.href = `/properties?city=Vizag&property_type=plot&listing_type=sale&q=${encodeURIComponent(searchQuery)}`
  }

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      <section className="relative bg-gradient-to-r from-primary-600 to-primary-700 text-white py-20 px-4">
        <div className="absolute inset-0 bg-black/10"></div>
        <div className="relative max-w-7xl mx-auto">
          <div className="max-w-3xl">
            <div className="flex items-center gap-2 mb-4">
              <Shield className="h-8 w-8" />
              <span className="text-primary-100 font-semibold">100% Legal & Safe</span>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold mb-6 leading-tight">
              VMRDA Approved Plots in Vizag
            </h1>
            <p className="text-xl text-primary-50 mb-8">
              Secure your future with government-approved plots in Visakhapatnam's fastest-growing localities
            </p>

            <div className="bg-white rounded-2xl shadow-2xl p-2">
              <div className="flex gap-2">
                <input
                  type="text"
                  placeholder="Search plots in Madhurawada, PM Palem, Yendada..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                  className="flex-1 px-6 py-4 text-gray-900 rounded-xl focus:outline-none"
                />
                <button
                  onClick={handleSearch}
                  className="bg-primary-600 hover:bg-primary-700 text-white px-8 py-4 rounded-xl font-semibold flex items-center gap-2 transition-colors"
                >
                  <Search className="h-5 w-5" />
                  Search
                </button>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-12 px-4 bg-white border-b-2 border-gray-100">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-gray-900 mb-6 text-center">
            Find Verified VMRDA Approved Plots in Vizag Using AI Search
          </h2>
          <div className="grid md:grid-cols-3 gap-4 max-w-5xl mx-auto">
            <div className="bg-gradient-to-br from-primary-50 to-white p-4 rounded-xl border-2 border-primary-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                <MapPin className="inline h-4 w-4 mr-1" />
                Search by Locality
              </label>
              <select
                value={selectedLocality}
                onChange={(e) => setSelectedLocality(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-primary-500 focus:outline-none"
              >
                <option value="">All Localities</option>
                <option value="Madhurawada">Madhurawada</option>
                <option value="PM Palem">PM Palem</option>
                <option value="Yendada">Yendada</option>
                <option value="Anandapuram">Anandapuram</option>
                <option value="Kommadi">Kommadi</option>
                <option value="Gajuwaka">Gajuwaka</option>
                <option value="Rushikonda">Rushikonda</option>
              </select>
            </div>

            <div className="bg-gradient-to-br from-green-50 to-white p-4 rounded-xl border-2 border-green-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                Search by Budget
              </label>
              <select
                value={selectedBudget}
                onChange={(e) => setSelectedBudget(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-green-500 focus:outline-none"
              >
                <option value="">All Budgets</option>
                <option value="0-20">Under ₹20 Lakhs</option>
                <option value="20-40">₹20L - ₹40L</option>
                <option value="40-60">₹40L - ₹60L</option>
                <option value="60-100">₹60L - ₹1 Crore</option>
                <option value="100+">Above ₹1 Crore</option>
              </select>
            </div>

            <div className="bg-gradient-to-br from-orange-50 to-white p-4 rounded-xl border-2 border-orange-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                Search by Plot Size
              </label>
              <select
                value={selectedSize}
                onChange={(e) => setSelectedSize(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-orange-500 focus:outline-none"
              >
                <option value="">All Sizes</option>
                <option value="0-150">Under 150 sq yards</option>
                <option value="150-300">150 - 300 sq yards</option>
                <option value="300-500">300 - 500 sq yards</option>
                <option value="500+">Above 500 sq yards</option>
              </select>
            </div>
          </div>

          <div className="text-center mt-6">
            <button
              onClick={() => {
                let searchUrl = '/properties?type=Plot'
                if (selectedLocality) searchUrl += `&locality=${encodeURIComponent(selectedLocality)}`
                if (selectedBudget) searchUrl += `&budget=${selectedBudget}`
                if (selectedSize) searchUrl += `&size=${selectedSize}`
                window.location.href = searchUrl
              }}
              className="bg-gradient-to-r from-primary-600 to-primary-700 hover:from-primary-700 hover:to-primary-800 text-white px-12 py-4 rounded-xl font-bold text-lg shadow-xl hover:shadow-2xl transition-all flex items-center gap-3 mx-auto"
            >
              <Search className="h-6 w-6" />
              Search VMRDA Approved Plots
            </button>
            <p className="text-sm text-gray-600 mt-3">
              AI-powered search finds the best VMRDA plots matching your requirements
            </p>
          </div>
        </div>
      </section>

      <section className="py-16 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="prose prose-lg max-w-none">
            <p className="text-gray-700 leading-relaxed text-lg">
              Looking for <strong>VMRDA approved plots in Vizag</strong>? Visakhapatnam's real estate market is experiencing unprecedented growth, making it one of India's most promising investment destinations. VMRDA (Visakhapatnam Metropolitan Region Development Authority) ensures that all approved plots meet stringent legal and infrastructure standards, providing complete safety to buyers. With the expanding IT corridor, port development, and metro rail projects, <strong>vizag plots for sale</strong> have shown remarkable appreciation of up to <span className="text-primary-600 font-bold">180% over the last 5 years</span> in key areas like Madhurawada, PM Palem, Yendada, and Kommadi.
            </p>
            <p className="text-gray-700 leading-relaxed text-lg mt-4">
              Whether you're looking for <strong>vizag plots in gated community</strong>, open plots, or residential plots in established colonies, investing in VMRDA approved properties guarantees clear titles, proper documentation, and excellent infrastructure. The demand for <strong>vizag real estate</strong> continues to surge as more professionals move to the city for career opportunities, making <strong>residential property in vizag</strong> a smart long-term investment.
            </p>
          </div>

          <div className="grid md:grid-cols-4 gap-6 mt-12">
            <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-2xl border-2 border-green-200 text-center">
              <div className="text-4xl font-bold text-green-600 mb-2">180%</div>
              <div className="text-gray-700 font-semibold">Appreciation</div>
              <div className="text-sm text-gray-500 mt-1">Last 5 years</div>
            </div>
            <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-2xl border-2 border-primary-200 text-center">
              <div className="text-4xl font-bold text-primary-600 mb-2">100+</div>
              <div className="text-gray-700 font-semibold">VMRDA Plots</div>
              <div className="text-sm text-gray-500 mt-1">Available now</div>
            </div>
            <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-2xl border-2 border-orange-200 text-center">
              <div className="text-4xl font-bold text-orange-600 mb-2">₹3K-8K</div>
              <div className="text-gray-700 font-semibold">Per Sq Yard</div>
              <div className="text-sm text-gray-500 mt-1">Competitive rates</div>
            </div>
            <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-2xl border-2 border-blue-200 text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">50+</div>
              <div className="text-gray-700 font-semibold">Gated Communities</div>
              <div className="text-sm text-gray-500 mt-1">Premium locations</div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-12 text-center">
            Why VMRDA Approved Plots are Safest in Vizag
          </h2>

          <div className="grid md:grid-cols-3 gap-8">
            <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200 hover:shadow-xl transition-all">
              <div className="bg-green-600 w-16 h-16 rounded-full flex items-center justify-center mb-6">
                <Shield className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4">100% Legal Safety</h3>
              <p className="text-gray-700 leading-relaxed">
                VMRDA approval guarantees clear title deeds, verified land records, and complete legal compliance. No risk of property disputes or illegal construction issues.
              </p>
            </div>

            <div className="bg-gradient-to-br from-primary-50 to-white p-8 rounded-2xl border-2 border-primary-200 hover:shadow-xl transition-all">
              <div className="bg-primary-600 w-16 h-16 rounded-full flex items-center justify-center mb-6">
                <Building2 className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Infrastructure Guarantee</h3>
              <p className="text-gray-700 leading-relaxed">
                All VMRDA plots come with assured infrastructure including roads, drainage, water supply, electricity, and street lighting as per urban planning standards.
              </p>
            </div>

            <div className="bg-gradient-to-br from-orange-50 to-white p-8 rounded-2xl border-2 border-orange-200 hover:shadow-xl transition-all">
              <div className="bg-orange-600 w-16 h-16 rounded-full flex items-center justify-center mb-6">
                <TrendingUp className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Higher Appreciation</h3>
              <p className="text-gray-700 leading-relaxed">
                VMRDA approved plots appreciate 30-40% faster than non-approved plots due to legal clarity, better infrastructure, and higher buyer confidence.
              </p>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-b from-gray-50 to-white">
        <div className="max-w-5xl mx-auto text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Find Your Perfect VMRDA Plot in Vizag
          </h2>
          <div className="bg-white rounded-2xl shadow-xl p-2 max-w-3xl mx-auto">
            <div className="flex gap-2">
              <input
                type="text"
                placeholder="Search gated community plots, open plots..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                className="flex-1 px-6 py-4 text-gray-900 rounded-xl focus:outline-none border-2 border-gray-200 focus:border-primary-500"
              />
              <button
                onClick={handleSearch}
                className="bg-primary-600 hover:bg-primary-700 text-white px-8 py-4 rounded-xl font-semibold flex items-center gap-2 transition-colors"
              >
                <Search className="h-5 w-5" />
                Search
              </button>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Vizag Plot Price Trends & Appreciation
          </h2>
          <div className="prose prose-lg max-w-none">
            <p className="text-gray-700 leading-relaxed">
              <strong>Vizag real estate prices</strong> have witnessed exponential growth over the past five years, driven by rapid urbanization, IT sector expansion, and infrastructure development. VMRDA approved <strong>vizag plots</strong> in prime localities like Madhurawada, PM Palem, and Yendada have delivered returns of <span className="text-green-600 font-bold">150-180% appreciation</span>, significantly outperforming traditional investment options.
            </p>
          </div>

          <div className="grid md:grid-cols-2 gap-8 mt-10">
            <div className="bg-gradient-to-br from-primary-50 to-white p-8 rounded-2xl border-2 border-primary-200">
              <h3 className="text-2xl font-bold text-gray-900 mb-6">Premium Areas (₹6,000-₹8,000/sq yd)</h3>
              <ul className="space-y-3">
                <li className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-primary-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <strong>Madhurawada:</strong> IT corridor proximity, excellent connectivity
                  </div>
                </li>
                <li className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-primary-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <strong>Yendada:</strong> Beachside luxury, premium gated communities
                  </div>
                </li>
                <li className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-primary-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <strong>Rushikonda:</strong> Coastal living, tourist hotspot
                  </div>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200">
              <h3 className="text-2xl font-bold text-gray-900 mb-6">Affordable Areas (₹3,000-₹5,000/sq yd)</h3>
              <ul className="space-y-3">
                <li className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <strong>PM Palem:</strong> Residential hub, good appreciation potential
                  </div>
                </li>
                <li className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <strong>Gajuwaka:</strong> Budget-friendly, developing infrastructure
                  </div>
                </li>
                <li className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <strong>Kommadi:</strong> Upcoming area, affordable plots
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-b from-gray-50 to-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Best Areas to Buy Plots in Vizag
          </h2>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <Link to="/madhurawada" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-primary-600 to-primary-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">Madhurawada</h3>
                  <p className="text-primary-100 text-sm">IT Hub & Premium Locality</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Prime location near IT SEZ with excellent connectivity and modern infrastructure.</p>
                  <div className="flex items-center text-primary-600 font-semibold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/pm-palem" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-green-600 to-green-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">PM Palem</h3>
                  <p className="text-green-100 text-sm">Affordable Residential Hub</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Growing residential area with good appreciation potential and family-friendly environment.</p>
                  <div className="flex items-center text-green-600 font-semibold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/yendada" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-orange-600 to-orange-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">Yendada</h3>
                  <p className="text-orange-100 text-sm">Beachside Premium</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Premium beachside location with luxury villas and high-end gated communities.</p>
                  <div className="flex items-center text-orange-600 font-semibold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/gajuwaka" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-blue-600 to-blue-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">Gajuwaka</h3>
                  <p className="text-blue-100 text-sm">Budget-Friendly Zone</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Affordable plots with developing infrastructure and good connectivity.</p>
                  <div className="flex items-center text-blue-600 font-semibold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/mvp-colony" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-purple-600 to-purple-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">MVP Colony</h3>
                  <p className="text-purple-100 text-sm">Established Neighborhood</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Well-established area with complete amenities and excellent infrastructure.</p>
                  <div className="flex items-center text-purple-600 font-semibold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/vmrda-plots" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-red-600 to-red-700 p-6 text-white">
                  <Shield className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">All VMRDA Plots</h3>
                  <p className="text-red-100 text-sm">Approved & Safe</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Browse all VMRDA approved plots across Visakhapatnam with verified documentation.</p>
                  <div className="flex items-center text-red-600 font-semibold group-hover:gap-2 transition-all">
                    View All Plots <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Gated Community Plots in Vizag
          </h2>
          <div className="prose prose-lg max-w-none mb-10">
            <p className="text-gray-700 leading-relaxed">
              <strong>Vizag plots in gated community</strong> offer premium amenities, 24/7 security, and world-class infrastructure. These planned residential layouts provide a modern lifestyle with clubhouse facilities, swimming pools, parks, and recreational areas. VMRDA approved gated communities in Vizag ensure complete legal safety, clear titles, and excellent appreciation potential. Popular gated communities in Madhurawada, PM Palem, and Yendada offer <strong>vizag plots for sale</strong> with sizes ranging from 150 sq yards to 500 sq yards, catering to diverse budgets.
            </p>
          </div>

          {loading ? (
            <div className="text-center py-12">
              <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto"></div>
              <p className="mt-4 text-gray-600">Loading properties...</p>
            </div>
          ) : properties.length > 0 ? (
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {properties.map((property) => (
                <PropertyCard key={property.id} property={property} />
              ))}
            </div>
          ) : (
            <div className="text-center py-12 bg-gray-50 rounded-2xl">
              <Home className="h-16 w-16 text-gray-400 mx-auto mb-4" />
              <p className="text-gray-600 text-lg">New properties coming soon!</p>
            </div>
          )}

          <div className="text-center mt-12">
            <Link
              to="/properties?type=Plot"
              className="inline-flex items-center gap-2 bg-primary-600 hover:bg-primary-700 text-white px-8 py-4 rounded-xl font-semibold text-lg transition-colors"
            >
              View All VMRDA Plots
              <ArrowRight className="h-5 w-5" />
            </Link>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-br from-primary-600 to-primary-700 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold mb-6">
            Ready to Invest in VMRDA Approved Plots?
          </h2>
          <p className="text-xl text-primary-50 mb-8">
            Get expert guidance and find the perfect plot in Vizag's best localities
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              to="/properties?type=Plot"
              className="inline-flex items-center justify-center gap-2 bg-white text-primary-600 px-8 py-4 rounded-xl font-semibold text-lg hover:bg-primary-50 transition-colors"
            >
              <Search className="h-5 w-5" />
              Browse All Plots
            </Link>
            <a
              href="https://wa.me/919182737473?text=Hi! I'm interested in VMRDA approved plots in Vizag"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center justify-center gap-2 bg-green-500 hover:bg-green-600 text-white px-8 py-4 rounded-xl font-semibold text-lg transition-colors"
            >
              <Phone className="h-5 w-5" />
              Talk to Expert
            </a>
          </div>
        </div>
      </section>

      <div className="fixed bottom-4 left-1/2 transform -translate-x-1/2 md:hidden z-40 w-[calc(100%-2rem)]">
        <div className="bg-white rounded-2xl shadow-2xl p-3 border-2 border-primary-500">
          <div className="flex gap-2">
            <input
              type="text"
              placeholder="Quick search plots..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
              className="flex-1 px-4 py-3 text-gray-900 rounded-xl focus:outline-none border border-gray-300"
            />
            <button
              onClick={handleSearch}
              className="bg-primary-600 text-white p-3 rounded-xl"
            >
              <Search className="h-5 w-5" />
            </button>
          </div>
        </div>
      </div>

    </div>
  )
}
