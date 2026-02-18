import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Search, MapPin, Home, Building2, TrendingUp, ArrowRight, Phone, CheckCircle2, Mic, MicOff, X, MessageCircle } from 'lucide-react'
import { LocationAutocomplete } from '../components/LocationAutocomplete'
import { supabase } from '../lib/supabase'
import type { Property } from '../types'
import { useVoiceSearch } from '../hooks/useVoiceSearch'
import { openWhatsApp, getWhatsAppLink } from '../lib/whatsapp'

export default function ResidentialPropertyPage() {
  const { isListening, transcript, localityMatch, noMatchMessage, startListening, stopListening, resetTranscript, isSupported } = useVoiceSearch()
  const [searchQuery, setSearchQuery] = useState('')
  const [localityId, setLocalityId] = useState<string | undefined>()
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [selectedPropertyType, setSelectedPropertyType] = useState('')
  const [selectedLocality, setSelectedLocality] = useState('')
  const [selectedBudget, setSelectedBudget] = useState('')

  useEffect(() => {
    document.title = 'Residential Property in Vizag | Houses, Villas & Colonies in Visakhapatnam'

    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Buy residential property in Vizag with 150-180% appreciation. Explore vizag houses for sale, villas, colonies in Madhurawada, PM Palem, Yendada. Premium vizag real estate.')
    }

    const faqSchema = {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "What is the price of residential property in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Residential property prices in Vizag vary by location and type. Houses in vizag colony areas range from ₹40 lakhs to ₹2 crore+. Budget-friendly residential properties in areas like Gajuwaka and PM Palem start from ₹35-40 lakhs, while premium villas in Madhurawada, Yendada, and Rushikonda can exceed ₹2-3 crore."
          }
        },
        {
          "@type": "Question",
          "name": "Which colony is best in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Best colonies in Vizag include MVP Colony for established neighborhoods with complete amenities, Madhurawada for IT professionals with modern infrastructure, Seethammadhara for central location with excellent connectivity, Dwaraka Nagar for residential tranquility, and PM Palem for affordable family-friendly living."
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
      const { data, error } = await supabase
        .from('properties')
        .select('*, localities!inner(name, slug, city)')
        .eq('localities.city', 'Visakhapatnam')
        .eq('status', 'approved')
        .order('created_at', { ascending: false })
        .limit(50)

      if (error) throw error
      setProperties(data || [])
    } catch (error) {
      console.error('Error loading properties:', error)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    if (transcript) {
      setSearchQuery(transcript)
    }
  }, [transcript])

  useEffect(() => {
    if (localityMatch) {
      setSearchQuery(localityMatch.locality_name)
    }
  }, [localityMatch])

  const handleSearch = () => {
    const params = new URLSearchParams()
    if (localityId) {
      params.append('localityId', localityId)
    } else if (searchQuery) {
      params.append('keyword', searchQuery)
    }
    window.location.href = `/properties?${params.toString()}`
  }

  const handleVoiceToggle = () => {
    if (isListening) {
      stopListening()
    } else {
      resetTranscript()
      startListening()
    }
  }

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      <section className="relative bg-gradient-to-r from-green-600 to-green-700 text-white py-20 px-4">
        <div className="absolute inset-0 bg-black/10"></div>
        <div className="relative max-w-7xl mx-auto">
          <div className="max-w-3xl">
            <div className="flex items-center gap-2 mb-4">
              <Home className="h-8 w-8" />
              <span className="text-green-100 font-semibold">Premium Residential Living</span>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold mb-6 leading-tight">
              Residential Property in Vizag
            </h1>
            <p className="text-xl text-green-50 mb-8">
              Find your dream home in Visakhapatnam's most desirable colonies and neighborhoods
            </p>

            <div className="bg-white rounded-2xl shadow-2xl p-2">
              <div className="flex gap-2">
                <div className="flex-1 relative">
                  <LocationAutocomplete
                    value={searchQuery}
                    onChange={(value, locId) => {
                      setSearchQuery(value)
                      setLocalityId(locId)
                    }}
                    placeholder="Type 3+ characters to search localities (e.g., MVP Colony, Madhurawada)"
                    className="w-full px-6 py-4 text-gray-900 rounded-xl focus:outline-none"
                  />
                  <div className="absolute right-2 top-1/2 -translate-y-1/2 flex items-center gap-1 z-10 pointer-events-none">
                    <div className="pointer-events-auto">
                      {isSupported && (
                        <button
                          onClick={handleVoiceToggle}
                          className={`p-2 rounded-lg transition-all ${
                            isListening
                              ? 'bg-red-600 text-white animate-pulse'
                              : 'text-gray-600 hover:bg-gray-200'
                          }`}
                          aria-label={isListening ? "Stop voice search" : "Start voice search"}
                        >
                          {isListening ? <MicOff className="h-5 w-5" /> : <Mic className="h-5 w-5" />}
                        </button>
                      )}
                    </div>
                  </div>
                  {localityMatch && (
                    <div className="absolute top-full left-0 right-0 mt-2 p-3 bg-green-50 border border-green-200 rounded-lg flex items-center justify-between z-20">
                      <div className="flex items-center space-x-2">
                        <MapPin className="h-5 w-5 text-green-600 flex-shrink-0" />
                        <div>
                          <div className="text-sm font-medium text-green-900">
                            Found: {localityMatch.locality_name}
                          </div>
                          <div className="text-xs text-green-600">
                            {localityMatch.confidence === 'exact' ? 'Exact match' : 'Similar match'}
                          </div>
                        </div>
                      </div>
                      <button
                        onClick={() => resetTranscript()}
                        className="text-green-600 hover:text-green-800"
                      >
                        <X className="h-5 w-5" />
                      </button>
                    </div>
                  )}
                  {noMatchMessage && (
                    <div className="absolute top-full left-0 right-0 mt-2 p-3 bg-yellow-50 border border-yellow-200 rounded-lg flex items-center justify-between z-20">
                      <div className="flex items-center space-x-2">
                        <MapPin className="h-5 w-5 text-yellow-600 flex-shrink-0" />
                        <div className="text-sm font-medium text-yellow-900">{noMatchMessage}</div>
                      </div>
                      <button
                        onClick={() => resetTranscript()}
                        className="text-yellow-600 hover:text-yellow-800"
                      >
                        <X className="h-5 w-5" />
                      </button>
                    </div>
                  )}
                </div>
                <button
                  onClick={handleSearch}
                  className="bg-green-600 hover:bg-green-700 text-white px-8 py-4 rounded-xl font-semibold flex items-center gap-2 transition-colors"
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
              Looking for <strong>residential property in Vizag</strong>? Visakhapatnam has emerged as a fast-growing residential hub offering diverse housing options including <strong>vizag flats for sale</strong>, villas, independent houses, and well-planned gated communities. <strong>Vizag real estate</strong> has witnessed exceptional growth driven by IT corridor expansion, port development, and world-class infrastructure projects. <strong>Vizag colony</strong> areas like MVP Colony, Madhurawada, and Seethammadhara provide family-friendly environments with excellent schools, hospitals, and shopping centers. With <strong>vizag real estate prices</strong> showing remarkable appreciation of up to 180% in just 5 years, investing in a <strong>vizag house for sale</strong> offers both lifestyle enhancement and outstanding returns in one of India's most livable cities.
            </p>
          </div>

          <div className="grid md:grid-cols-4 gap-6 mt-12">
            <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-2xl border-2 border-green-200 text-center">
              <div className="text-4xl font-bold text-green-600 mb-2">150-180%</div>
              <div className="text-gray-700 font-semibold">Appreciation</div>
              <div className="text-sm text-gray-500 mt-1">Last 5 years</div>
            </div>
            <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-2xl border-2 border-primary-200 text-center">
              <div className="text-4xl font-bold text-primary-600 mb-2">500+</div>
              <div className="text-gray-700 font-semibold">Houses Available</div>
              <div className="text-sm text-gray-500 mt-1">In top colonies</div>
            </div>
            <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-2xl border-2 border-orange-200 text-center">
              <div className="text-4xl font-bold text-orange-600 mb-2">₹40L-2Cr</div>
              <div className="text-gray-700 font-semibold">Price Range</div>
              <div className="text-sm text-gray-500 mt-1">All budgets</div>
            </div>
            <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-2xl border-2 border-blue-200 text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">20+</div>
              <div className="text-gray-700 font-semibold">Prime Colonies</div>
              <div className="text-sm text-gray-500 mt-1">Established areas</div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-12 px-4 bg-white border-b-2 border-gray-100">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-gray-900 mb-6 text-center">
            Search Residential Property in Vizag with AI
          </h2>
          <div className="grid md:grid-cols-3 gap-4 max-w-5xl mx-auto">
            <div className="bg-gradient-to-br from-green-50 to-white p-4 rounded-xl border-2 border-green-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                <Home className="inline h-4 w-4 mr-1" />
                Search by Property Type
              </label>
              <select
                value={selectedPropertyType}
                onChange={(e) => setSelectedPropertyType(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-green-500 focus:outline-none"
              >
                <option value="">All Property Types</option>
                <option value="Flat">Flat/Apartment</option>
                <option value="Villa">Villa</option>
                <option value="House">Independent House</option>
                <option value="Row House">Row House</option>
              </select>
            </div>

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
                <option value="MVP Colony">MVP Colony</option>
                <option value="Seethammadhara">Seethammadhara</option>
                <option value="PM Palem">PM Palem</option>
                <option value="Yendada">Yendada</option>
                <option value="Dwaraka Nagar">Dwaraka Nagar</option>
                <option value="Gajuwaka">Gajuwaka</option>
                <option value="Rushikonda">Rushikonda</option>
              </select>
            </div>

            <div className="bg-gradient-to-br from-orange-50 to-white p-4 rounded-xl border-2 border-orange-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                Search by Budget
              </label>
              <select
                value={selectedBudget}
                onChange={(e) => setSelectedBudget(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-orange-500 focus:outline-none"
              >
                <option value="">All Budgets</option>
                <option value="0-40">Under ₹40 Lakhs</option>
                <option value="40-60">₹40L - ₹60L</option>
                <option value="60-100">₹60L - ₹1 Crore</option>
                <option value="100-200">₹1Cr - ₹2Cr</option>
                <option value="200+">Above ₹2 Crore</option>
              </select>
            </div>
          </div>

          <div className="text-center mt-6">
            <button
              onClick={() => {
                let searchUrl = '/properties?'
                if (selectedPropertyType) searchUrl += `type=${encodeURIComponent(selectedPropertyType)}&`
                if (selectedLocality) searchUrl += `locality=${encodeURIComponent(selectedLocality)}&`
                if (selectedBudget) searchUrl += `budget=${selectedBudget}&`
                searchUrl = searchUrl.slice(0, -1)
                window.location.href = searchUrl || '/properties'
              }}
              className="bg-gradient-to-r from-green-600 to-green-700 hover:from-green-700 hover:to-green-800 text-white px-12 py-4 rounded-xl font-bold text-lg shadow-xl hover:shadow-2xl transition-all flex items-center gap-3 mx-auto"
            >
              <Search className="h-6 w-6" />
              Search Residential Properties
            </button>
            <p className="text-sm text-gray-600 mt-3">
              AI-powered search finds the best residential properties matching your requirements
            </p>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Types of Residential Property in Vizag
          </h2>

          <div className="grid md:grid-cols-3 gap-8 mb-12">
            <div className="bg-gradient-to-br from-primary-50 to-white p-8 rounded-2xl border-2 border-primary-200 hover:shadow-xl transition-all">
              <div className="bg-primary-600 w-16 h-16 rounded-full flex items-center justify-center mb-6">
                <Home className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Independent Houses</h3>
              <p className="text-gray-700 leading-relaxed mb-4">
                Standalone houses with private compound, parking, and garden space. Popular in MVP Colony, Seethammadhara, and Dwaraka Nagar.
              </p>
              <ul className="space-y-2">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">₹40L - ₹1.5Cr range</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">2BHK to 4BHK options</span>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200 hover:shadow-xl transition-all">
              <div className="bg-green-600 w-16 h-16 rounded-full flex items-center justify-center mb-6">
                <Building2 className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Luxury Villas</h3>
              <p className="text-gray-700 leading-relaxed mb-4">
                Premium gated community villas with world-class amenities, clubhouse, and 24/7 security. Available in Madhurawada, Yendada, Rushikonda.
              </p>
              <ul className="space-y-2">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">₹1Cr - ₹3Cr+ range</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">3BHK to 5BHK luxury</span>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-orange-50 to-white p-8 rounded-2xl border-2 border-orange-200 hover:shadow-xl transition-all">
              <div className="bg-orange-600 w-16 h-16 rounded-full flex items-center justify-center mb-6">
                <TrendingUp className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Row Houses</h3>
              <p className="text-gray-700 leading-relaxed mb-4">
                Modern row houses in planned layouts with shared amenities and private entrances. Common in PM Palem and Gajuwaka.
              </p>
              <ul className="space-y-2">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">₹50L - ₹1.2Cr range</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">2BHK to 3BHK compact</span>
                </li>
              </ul>
            </div>
          </div>

          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-8 mt-16">
            Popular Colonies in Vizag
          </h2>

          <div className="grid md:grid-cols-2 gap-6">
            <Link to="/mvp-colony" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-primary-600 to-primary-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">MVP Colony</h3>
                  <p className="text-primary-100 text-sm">Established Premium Colony</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Well-established residential colony with complete infrastructure, schools, hospitals, and shopping centers. Ideal for families.</p>
                  <div className="flex items-center text-primary-600 font-semibold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/madhurawada" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-green-500">
                <div className="bg-gradient-to-br from-green-600 to-green-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">Madhurawada</h3>
                  <p className="text-green-100 text-sm">IT Hub Modern Colony</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Modern residential area near IT SEZ with contemporary housing, excellent connectivity, and rapid development.</p>
                  <div className="flex items-center text-green-600 font-semibold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/pm-palem" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-orange-500">
                <div className="bg-gradient-to-br from-orange-600 to-orange-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">PM Palem</h3>
                  <p className="text-orange-100 text-sm">Affordable Residential Area</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Growing residential hub offering affordable housing options with good appreciation potential and family-friendly environment.</p>
                  <div className="flex items-center text-orange-600 font-semibold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/yendada" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-blue-500">
                <div className="bg-gradient-to-br from-blue-600 to-blue-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">Yendada</h3>
                  <p className="text-blue-100 text-sm">Premium Beachside Living</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Exclusive beachside locality with luxury villas, high-end apartments, and premium gated communities.</p>
                  <div className="flex items-center text-blue-600 font-semibold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-b from-gray-50 to-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            New Residential Projects in Vizag
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            Vizag's residential real estate market is booming with exciting new projects offering modern amenities, smart home features, and sustainable living. From luxury gated communities in Madhurawada to affordable housing projects in PM Palem and Gajuwaka, developers are launching innovative residential complexes with clubhouses, swimming pools, and 24/7 security. The expansion of IT corridor and metro rail connectivity has accelerated new residential development, particularly in areas like Rushikonda, Yendada, and Anandapuram. These new projects combine contemporary architecture with traditional vizag colony planning, ensuring a perfect blend of modern lifestyle and community living.
          </p>

          <div className="grid md:grid-cols-3 gap-6">
            <div className="bg-white p-6 rounded-2xl shadow-lg border-2 border-gray-200">
              <div className="text-primary-600 font-bold text-xl mb-2">Madhurawada IT Hub</div>
              <p className="text-gray-700 mb-4">Premium gated villa communities with smart home integration, clubhouse amenities, and proximity to IT companies. 3-4 BHK villas starting from ₹1.2 crore.</p>
              <div className="flex items-center gap-2 text-green-600 font-semibold">
                <TrendingUp className="h-5 w-5" />
                High Appreciation Zone
              </div>
            </div>

            <div className="bg-white p-6 rounded-2xl shadow-lg border-2 border-gray-200">
              <div className="text-primary-600 font-bold text-xl mb-2">Rushikonda Beachfront</div>
              <p className="text-gray-700 mb-4">Luxury apartments and penthouses with sea views, infinity pools, and world-class amenities. 3-4 BHK flats from ₹80 lakhs to ₹2.5 crore.</p>
              <div className="flex items-center gap-2 text-green-600 font-semibold">
                <TrendingUp className="h-5 w-5" />
                Premium Lifestyle
              </div>
            </div>

            <div className="bg-white p-6 rounded-2xl shadow-lg border-2 border-gray-200">
              <div className="text-primary-600 font-bold text-xl mb-2">PM Palem Affordable</div>
              <p className="text-gray-700 mb-4">Budget-friendly row houses and independent houses for first-time homebuyers. 2-3 BHK houses starting from ₹35 lakhs with all basic amenities.</p>
              <div className="flex items-center gap-2 text-green-600 font-semibold">
                <TrendingUp className="h-5 w-5" />
                Best Value for Money
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Residential Property Price Trends in Vizag
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            Vizag real estate prices have shown exceptional growth over the past 5 years, with residential properties in prime localities appreciating by <span className="text-green-600 font-bold text-xl">150-180%</span>. Areas like Madhurawada, which was considered peripheral just 5 years ago, has transformed into a premium residential hub with property values tripling in some gated communities. MVP Colony and Seethammadhara continue to command premium prices due to their established infrastructure and central location. Even budget-friendly areas like PM Palem and Gajuwaka have witnessed 120-150% appreciation as infrastructure development spreads across the city. With ongoing metro rail construction, expanded IT parks, and port modernization, vizag real estate prices are projected to continue their upward trajectory, making now an opportune time to invest in residential property.
          </p>

          <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200">
            <h3 className="text-2xl font-bold text-gray-900 mb-6">Average Price Per Sq Ft by Area</h3>
            <div className="grid md:grid-cols-2 gap-4">
              <div className="flex justify-between items-center border-b-2 border-green-200 pb-3">
                <span className="text-gray-700 font-semibold">Madhurawada (IT Hub)</span>
                <span className="text-green-600 font-bold text-lg">₹5,000-7,000</span>
              </div>
              <div className="flex justify-between items-center border-b-2 border-green-200 pb-3">
                <span className="text-gray-700 font-semibold">MVP Colony (Established)</span>
                <span className="text-green-600 font-bold text-lg">₹6,000-8,500</span>
              </div>
              <div className="flex justify-between items-center border-b-2 border-green-200 pb-3">
                <span className="text-gray-700 font-semibold">Rushikonda (Premium)</span>
                <span className="text-green-600 font-bold text-lg">₹7,000-12,000</span>
              </div>
              <div className="flex justify-between items-center border-b-2 border-green-200 pb-3">
                <span className="text-gray-700 font-semibold">Seethammadhara (Central)</span>
                <span className="text-green-600 font-bold text-lg">₹5,500-7,500</span>
              </div>
              <div className="flex justify-between items-center border-b-2 border-green-200 pb-3">
                <span className="text-gray-700 font-semibold">PM Palem (Affordable)</span>
                <span className="text-green-600 font-bold text-lg">₹3,500-5,000</span>
              </div>
              <div className="flex justify-between items-center border-b-2 border-green-200 pb-3">
                <span className="text-gray-700 font-semibold">Yendada (Beachside)</span>
                <span className="text-green-600 font-bold text-lg">₹6,500-10,000</span>
              </div>
            </div>
            <p className="text-sm text-gray-600 mt-6 text-center">
              * Prices vary based on property type, amenities, and exact location. Data updated December 2024.
            </p>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gray-50">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-12 text-center">
            Available Residential Properties
          </h2>

          {loading ? (
            <div className="text-center py-12">
              <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto"></div>
              <p className="mt-4 text-gray-600">Loading properties...</p>
            </div>
          ) : properties.length > 0 ? (
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {properties.map((property) => (
                <div key={property.id} className="bg-white rounded-lg shadow-md p-4 border border-gray-200">
                  <h3 className="font-bold text-lg mb-2">{property.title}</h3>
                  <p className="text-gray-600 text-sm mb-2">{property.description}</p>
                  <p className="text-primary-600 font-bold">₹{property.price?.toLocaleString()}</p>
                </div>
              ))}
            </div>
          ) : (
            <div className="text-center py-12 bg-white rounded-2xl">
              <Home className="h-16 w-16 text-gray-400 mx-auto mb-4" />
              <h3 className="text-xl font-semibold text-gray-900 mb-2">No matching properties found in this area.</h3>
              <p className="text-gray-600 mb-6">We couldn't find any residential properties matching your search</p>
              <button
                onClick={() => openWhatsApp('Hi Vizag Property Experts, I searched for residential property in Vizag but found no results. Please share matching options.')}
                className="inline-flex items-center gap-2 bg-green-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-green-700 transition-all"
              >
                <MessageCircle className="h-5 w-5" />
                Get properties on WhatsApp
              </button>
            </div>
          )}

          <div className="text-center mt-12">
            <Link
              to="/properties?type=House,Villa,Independent+House"
              className="inline-flex items-center gap-2 bg-green-600 hover:bg-green-700 text-white px-8 py-4 rounded-xl font-semibold text-lg transition-colors"
            >
              View All Residential Properties
              <ArrowRight className="h-5 w-5" />
            </Link>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-br from-green-600 to-green-700 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold mb-6">
            Find Your Dream Home in Vizag Today
          </h2>
          <p className="text-xl text-green-50 mb-8">
            Expert guidance for buying residential property in Visakhapatnam's best colonies
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              to="/properties"
              className="inline-flex items-center justify-center gap-2 bg-white text-green-600 px-8 py-4 rounded-xl font-semibold text-lg hover:bg-green-50 transition-colors"
            >
              <Search className="h-5 w-5" />
              Browse All Properties
            </Link>
            <a
              href={getWhatsAppLink("Hi! I'm looking for residential property in Vizag")}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center justify-center gap-2 bg-primary-600 hover:bg-primary-700 text-white px-8 py-4 rounded-xl font-semibold text-lg transition-colors"
            >
              <Phone className="h-5 w-5" />
              Talk to Expert
            </a>
          </div>
        </div>
      </section>

      <div className="fixed bottom-4 left-1/2 transform -translate-x-1/2 md:hidden z-40 w-[calc(100%-2rem)]">
        <div className="bg-white rounded-2xl shadow-2xl p-3 border-2 border-green-500">
          <div className="flex gap-2">
            <input
              type="text"
              placeholder="Quick search houses..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
              className="flex-1 px-4 py-3 text-gray-900 rounded-xl focus:outline-none border border-gray-300"
            />
            <button
              onClick={handleSearch}
              className="bg-green-600 text-white p-3 rounded-xl"
            >
              <Search className="h-5 w-5" />
            </button>
          </div>
        </div>
      </div>

    </div>
  )
}
