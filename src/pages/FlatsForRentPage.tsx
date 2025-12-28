import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Search, MapPin, Key, CheckCircle2, ArrowRight, Phone, Building2 } from 'lucide-react'
import { PropertyCard } from '../components/PropertyCard'
import { supabase } from '../lib/supabase'
import type { Property } from '../types'
import { buildStrictQuery, CATEGORY_CONTEXTS } from '../lib/searchFilters'

export default function FlatsForRentPage() {
  const [searchQuery, setSearchQuery] = useState('')
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    document.title = 'Flats for Rent in Vizag | 1 BHK, 2 BHK, 3 BHK Rental Apartments in Visakhapatnam'

    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Find flats for rent in Vizag starting from ₹8,000/month. Explore 1 BHK, 2 BHK, 3 BHK rental apartments in Madhurawada, MVP Colony, PM Palem. Best vizag rental properties.')
    }

    const faqSchema = {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "What is the rent of 2 BHK flat in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "2 BHK flat rent in Vizag ranges from ₹10,000 to ₹25,000 per month depending on location and amenities. Budget-friendly areas like PM Palem and Gajuwaka offer 2 BHK flats for ₹10,000-15,000, while premium localities like Madhurawada, MVP Colony, and beachside areas charge ₹18,000-25,000 per month."
          }
        },
        {
          "@type": "Question",
          "name": "Which is the best area for rental flats in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Best areas for rental flats in Vizag include Madhurawada for IT professionals with proximity to tech parks, MVP Colony for families with complete amenities, PM Palem for affordable rentals with good connectivity, Seethammadhara for central location, and NAD Junction for accessibility to all parts of the city."
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
      // IMMUTABLE: Flats for rent in Vizag only
      const categoryContext = CATEGORY_CONTEXTS['flats-for-rent-vizag']
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
    window.location.href = `/properties?city=Vizag&property_type=flat&listing_type=rent&q=${encodeURIComponent(searchQuery)}`
  }

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      <section className="relative bg-gradient-to-r from-orange-600 to-orange-700 text-white py-20 px-4">
        <div className="absolute inset-0 bg-black/10"></div>
        <div className="relative max-w-7xl mx-auto">
          <div className="max-w-3xl">
            <div className="flex items-center gap-2 mb-4">
              <Key className="h-8 w-8" />
              <span className="text-orange-100 font-semibold">Affordable Rentals</span>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold mb-6 leading-tight">
              Flats for Rent in Vizag
            </h1>
            <p className="text-xl text-orange-50 mb-8">
              Find your perfect rental apartment in Visakhapatnam with flexible lease options and prime locations
            </p>

            <div className="bg-white rounded-2xl shadow-2xl p-2">
              <div className="flex gap-2">
                <input
                  type="text"
                  placeholder="Search 1 BHK, 2 BHK flats for rent in Madhurawada, PM Palem..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                  className="flex-1 px-6 py-4 text-gray-900 rounded-xl focus:outline-none"
                />
                <button
                  onClick={handleSearch}
                  className="bg-orange-600 hover:bg-orange-700 text-white px-8 py-4 rounded-xl font-semibold flex items-center gap-2 transition-colors"
                >
                  <Search className="h-5 w-5" />
                  Search
                </button>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="prose prose-lg max-w-none">
            <p className="text-gray-700 leading-relaxed text-lg">
              Looking for <strong>flats for rent in Vizag</strong>? Visakhapatnam offers a wide range of rental apartments catering to students, working professionals, and families. From budget-friendly 1 BHK flats starting at ₹8,000 per month to luxurious 3 BHK apartments in premium localities, <strong>vizag real estate</strong> rental market provides excellent options for every budget and requirement.
            </p>
            <p className="text-gray-700 leading-relaxed text-lg mt-4">
              The city's growing IT sector and port activities have created high demand for rental properties, especially in areas like Madhurawada near the IT SEZ. Most rental flats in <strong>vizag</strong> come with semi-furnished or fully-furnished options, including essential amenities like power backup, water supply, parking, and security. Whether you're an IT professional relocating for work or a student seeking accommodation near universities, rental flats in <strong>Visakhapatnam</strong> offer convenient, affordable housing solutions.
            </p>
          </div>

          <div className="grid md:grid-cols-4 gap-6 mt-12">
            <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-2xl border-2 border-orange-200 text-center">
              <div className="text-4xl font-bold text-orange-600 mb-2">₹8K+</div>
              <div className="text-gray-700 font-semibold">Starting Rent</div>
              <div className="text-sm text-gray-500 mt-1">Per month</div>
            </div>
            <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-2xl border-2 border-primary-200 text-center">
              <div className="text-4xl font-bold text-primary-600 mb-2">2000+</div>
              <div className="text-gray-700 font-semibold">Flats Available</div>
              <div className="text-sm text-gray-500 mt-1">Across Vizag</div>
            </div>
            <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-2xl border-2 border-green-200 text-center">
              <div className="text-4xl font-bold text-green-600 mb-2">Flexible</div>
              <div className="text-gray-700 font-semibold">Lease Terms</div>
              <div className="text-sm text-gray-500 mt-1">11-24 months</div>
            </div>
            <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-2xl border-2 border-blue-200 text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">50+</div>
              <div className="text-gray-700 font-semibold">Prime Areas</div>
              <div className="text-sm text-gray-500 mt-1">All localities</div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-b from-gray-50 to-white">
        <div className="max-w-5xl mx-auto text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Find Your Rental Flat in Vizag
          </h2>
          <div className="bg-white rounded-2xl shadow-xl p-2 max-w-3xl mx-auto">
            <div className="flex gap-2">
              <input
                type="text"
                placeholder="Search by budget, BHK, or location..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                className="flex-1 px-6 py-4 text-gray-900 rounded-xl focus:outline-none border-2 border-gray-200 focus:border-orange-500"
              />
              <button
                onClick={handleSearch}
                className="bg-orange-600 hover:bg-orange-700 text-white px-8 py-4 rounded-xl font-semibold flex items-center gap-2 transition-colors"
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
            Rental Flats by Budget
          </h2>

          <div className="grid md:grid-cols-3 gap-8 mb-12">
            <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200 hover:shadow-xl transition-all">
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Budget Rentals</h3>
              <p className="text-3xl font-bold text-green-600 mb-4">₹8K - ₹15K/mo</p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">1 BHK & 2 BHK options</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Semi-furnished flats</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">PM Palem, Gajuwaka, Kommadi</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Basic amenities included</span>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-primary-50 to-white p-8 rounded-2xl border-2 border-primary-200 hover:shadow-xl transition-all">
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Mid-Range Rentals</h3>
              <p className="text-3xl font-bold text-primary-600 mb-4">₹15K - ₹25K/mo</p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">2 BHK & 3 BHK flats</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Fully-furnished options</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Madhurawada, MVP Colony</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Gym, parking, security</span>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-orange-50 to-white p-8 rounded-2xl border-2 border-orange-200 hover:shadow-xl transition-all">
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Premium Rentals</h3>
              <p className="text-3xl font-bold text-orange-600 mb-4">₹25K - ₹50K+/mo</p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">3 BHK & 4 BHK luxury</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Fully-furnished premium</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Yendada, Rushikonda</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Clubhouse, pool, concierge</span>
                </li>
              </ul>
            </div>
          </div>

          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-8 mt-16">
            Popular Areas for Rental Flats in Vizag
          </h2>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <div className="bg-white rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all p-6">
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-xl font-bold text-gray-900">Madhurawada</h3>
                  <p className="text-sm text-gray-500">IT Hub</p>
                </div>
                <MapPin className="h-6 w-6 text-primary-600" />
              </div>
              <p className="text-gray-700 mb-3">Perfect for IT professionals. Close to tech parks.</p>
              <div className="space-y-2">
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">1 BHK:</span>
                  <span className="font-semibold">₹10K-15K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">2 BHK:</span>
                  <span className="font-semibold">₹15K-22K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">3 BHK:</span>
                  <span className="font-semibold">₹22K-35K</span>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all p-6">
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-xl font-bold text-gray-900">MVP Colony</h3>
                  <p className="text-sm text-gray-500">Premium Area</p>
                </div>
                <MapPin className="h-6 w-6 text-blue-600" />
              </div>
              <p className="text-gray-700 mb-3">Established colony with all amenities.</p>
              <div className="space-y-2">
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">1 BHK:</span>
                  <span className="font-semibold">₹12K-18K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">2 BHK:</span>
                  <span className="font-semibold">₹18K-28K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">3 BHK:</span>
                  <span className="font-semibold">₹28K-40K</span>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all p-6">
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-xl font-bold text-gray-900">PM Palem</h3>
                  <p className="text-sm text-gray-500">Affordable</p>
                </div>
                <MapPin className="h-6 w-6 text-green-600" />
              </div>
              <p className="text-gray-700 mb-3">Budget-friendly with good connectivity.</p>
              <div className="space-y-2">
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">1 BHK:</span>
                  <span className="font-semibold">₹8K-12K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">2 BHK:</span>
                  <span className="font-semibold">₹12K-18K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">3 BHK:</span>
                  <span className="font-semibold">₹18K-25K</span>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all p-6">
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-xl font-bold text-gray-900">Seethammadhara</h3>
                  <p className="text-sm text-gray-500">Central</p>
                </div>
                <MapPin className="h-6 w-6 text-orange-600" />
              </div>
              <p className="text-gray-700 mb-3">Central location, excellent connectivity.</p>
              <div className="space-y-2">
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">1 BHK:</span>
                  <span className="font-semibold">₹10K-15K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">2 BHK:</span>
                  <span className="font-semibold">₹15K-24K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">3 BHK:</span>
                  <span className="font-semibold">₹24K-35K</span>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all p-6">
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-xl font-bold text-gray-900">Gajuwaka</h3>
                  <p className="text-sm text-gray-500">Budget Zone</p>
                </div>
                <MapPin className="h-6 w-6 text-purple-600" />
              </div>
              <p className="text-gray-700 mb-3">Most affordable rentals in Vizag.</p>
              <div className="space-y-2">
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">1 BHK:</span>
                  <span className="font-semibold">₹7K-10K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">2 BHK:</span>
                  <span className="font-semibold">₹10K-15K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">3 BHK:</span>
                  <span className="font-semibold">₹15K-22K</span>
                </div>
              </div>
            </div>

            <div className="bg-gradient-to-br from-gray-800 to-gray-900 rounded-2xl shadow-lg p-6 text-white flex items-center justify-center">
              <div className="text-center">
                <Building2 className="h-12 w-12 mx-auto mb-4 text-orange-400" />
                <h3 className="text-xl font-bold mb-2">More Areas</h3>
                <Link to="/vizag" className="inline-flex items-center gap-2 text-orange-400 hover:text-orange-300 font-semibold">
                  Explore All
                  <ArrowRight className="h-5 w-5" />
                </Link>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gray-50">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-12 text-center">
            Available Rental Flats in Vizag
          </h2>

          {loading ? (
            <div className="text-center py-12">
              <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-orange-600 mx-auto"></div>
              <p className="mt-4 text-gray-600">Loading rental flats...</p>
            </div>
          ) : properties.length > 0 ? (
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {properties.map((property) => (
                <PropertyCard key={property.id} property={property} />
              ))}
            </div>
          ) : (
            <div className="text-center py-12 bg-white rounded-2xl">
              <Key className="h-16 w-16 text-gray-400 mx-auto mb-4" />
              <p className="text-gray-600 text-lg">New rental properties coming soon!</p>
            </div>
          )}

          <div className="text-center mt-12">
            <Link
              to="/properties?listing_type=rent"
              className="inline-flex items-center gap-2 bg-orange-600 hover:bg-orange-700 text-white px-8 py-4 rounded-xl font-semibold text-lg transition-colors"
            >
              View All Rental Flats
              <ArrowRight className="h-5 w-5" />
            </Link>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-br from-orange-600 to-orange-700 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold mb-6">
            Looking for a Rental Flat in Vizag?
          </h2>
          <p className="text-xl text-orange-50 mb-8">
            Get personalized recommendations based on your budget, location preference, and requirements
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              to="/properties?listing_type=rent"
              className="inline-flex items-center justify-center gap-2 bg-white text-orange-600 px-8 py-4 rounded-xl font-semibold text-lg hover:bg-orange-50 transition-colors"
            >
              <Search className="h-5 w-5" />
              Browse Rentals
            </Link>
            <a
              href="https://wa.me/919182737473?text=Hi! I'm looking for a flat for rent in Vizag"
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
        <div className="bg-white rounded-2xl shadow-2xl p-3 border-2 border-orange-500">
          <div className="flex gap-2">
            <input
              type="text"
              placeholder="Quick search rentals..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
              className="flex-1 px-4 py-3 text-gray-900 rounded-xl focus:outline-none border border-gray-300"
            />
            <button
              onClick={handleSearch}
              className="bg-orange-600 text-white p-3 rounded-xl"
            >
              <Search className="h-5 w-5" />
            </button>
          </div>
        </div>
      </div>

    </div>
  )
}
