import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Search, MapPin, Shield, TrendingUp, Home, Building2, CheckCircle2, ArrowRight, Phone, Sparkles, Mic, MicOff, X, MessageCircle } from 'lucide-react'
import { LocationAutocomplete } from '../components/LocationAutocomplete'
import { WhatsAppButton } from '../components/WhatsAppButton'
import { supabase } from '../lib/supabase'
import type { Property } from '../types'
import { buildStrictQuery, CATEGORY_CONTEXTS } from '../lib/searchFilters'
import { useVoiceSearch } from '../hooks/useVoiceSearch'
import { openWhatsApp, getWhatsAppLink } from '../lib/whatsapp'

export default function VillasPage() {
  const { isListening, transcript, localityMatch, noMatchMessage, startListening, stopListening, resetTranscript, isSupported } = useVoiceSearch()
  const [searchQuery, setSearchQuery] = useState('')
  const [localityId, setLocalityId] = useState<string | undefined>()
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [selectedLocality, setSelectedLocality] = useState('')
  const [selectedBudget, setSelectedBudget] = useState('')
  const [selectedBHK, setSelectedBHK] = useState('')

  useEffect(() => {
    document.title = 'Villas in Vizag | Luxury Villas for Sale in Visakhapatnam'

    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Discover premium villas in Vizag including independent villas, luxury gated community villas, and beach-facing homes. Ideal for end-users and investors with 150-180% appreciation potential in next 5 years.')
    }

    const faqSchema = {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "What is the price of villas in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Villas in Vizag range from ₹1 crore to ₹5 crore+ depending on location, size, and amenities. Premium villas in Madhurawada and Yendada with 3-4 BHK cost ₹1.2-2.5 crore, while luxury beachside villas in Rushikonda with 4-5 BHK and private pools range from ₹2.5-5 crore+."
          }
        },
        {
          "@type": "Question",
          "name": "Which is the best area for villas in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Best areas for villas in Vizag include Madhurawada for IT professionals with modern gated communities, Yendada for premium beachside living with luxury amenities, Rushikonda for exclusive coastal villas with sea views, PM Palem for affordable villa options, and MVP Colony for established neighborhoods with excellent infrastructure."
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
      // IMMUTABLE: Villas for sale in Vizag only
      const categoryContext = CATEGORY_CONTEXTS['villas-in-vizag']
      const query = buildStrictQuery(supabase, {}, {}, categoryContext).limit(12)
      const { data, error } = await query

      if (error) throw error
      setProperties(data || [])
    } catch (error) {
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
    params.append('propertyType', 'villa')
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
      <section className="relative bg-gradient-to-r from-primary-600 to-primary-700 text-white py-20 px-4">
        <div className="absolute inset-0 bg-black/10"></div>
        <div className="relative max-w-7xl mx-auto">
          <div className="max-w-3xl">
            <div className="flex items-center gap-2 mb-4">
              <Sparkles className="h-8 w-8" />
              <span className="text-primary-100 font-semibold">Luxury Living</span>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold mb-6 leading-tight">
              Villas in Vizag
            </h1>
            <p className="text-xl text-primary-50 mb-8">
              Discover premium villas in Vizag including independent villas, luxury gated community villas, and beach-facing homes. Ideal for end-users and investors with 150-180% appreciation potential in next 5 years.
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
                    placeholder="Type 3+ characters to search localities (e.g., Madhurawada, Yendada, Rushikonda)"
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
            Find Luxury Villas in Vizag Using AI Search
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
                <option value="Yendada">Yendada</option>
                <option value="Rushikonda">Rushikonda</option>
                <option value="MVP Colony">MVP Colony</option>
                <option value="PM Palem">PM Palem</option>
                <option value="Seethammadhara">Seethammadhara</option>
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
                <option value="100-150">₹1Cr - ₹1.5Cr</option>
                <option value="150-200">₹1.5Cr - ₹2Cr</option>
                <option value="200-300">₹2Cr - ₹3Cr</option>
                <option value="300-500">₹3Cr - ₹5Cr</option>
                <option value="500+">Above ₹5 Crore</option>
              </select>
            </div>

            <div className="bg-gradient-to-br from-orange-50 to-white p-4 rounded-xl border-2 border-orange-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                <Building2 className="inline h-4 w-4 mr-1" />
                Search by Villa Type
              </label>
              <select
                value={selectedBHK}
                onChange={(e) => setSelectedBHK(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-orange-500 focus:outline-none"
              >
                <option value="">All BHK Types</option>
                <option value="3BHK">3 BHK Villa</option>
                <option value="4BHK">4 BHK Villa</option>
                <option value="5BHK">5 BHK Villa</option>
                <option value="6BHK+">6 BHK+ Villa</option>
              </select>
            </div>
          </div>

          <div className="text-center mt-6">
            <button
              onClick={() => {
                let searchUrl = '/properties?type=Villa'
                if (selectedLocality) searchUrl += `&locality=${encodeURIComponent(selectedLocality)}`
                if (selectedBudget) searchUrl += `&budget=${selectedBudget}`
                if (selectedBHK) searchUrl += `&bhk=${selectedBHK}`
                window.location.href = searchUrl
              }}
              className="bg-gradient-to-r from-primary-600 to-primary-700 hover:from-primary-700 hover:to-primary-800 text-white px-12 py-4 rounded-xl font-bold text-lg shadow-xl hover:shadow-2xl transition-all flex items-center gap-3 mx-auto"
            >
              <Search className="h-6 w-6" />
              Search Luxury Villas in Vizag
            </button>
            <p className="text-sm text-gray-600 mt-3">
              AI-powered search finds the best luxury villas matching your requirements
            </p>
          </div>
        </div>
      </section>

      <section className="py-16 px-4">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Types of Villas in Vizag
          </h2>
          <div className="prose prose-lg max-w-none">
            <p className="text-gray-700 leading-relaxed text-lg mb-6">
              Looking for <strong>villas in Vizag</strong>? Discover three distinct types of premium villa properties across Visakhapatnam's most prestigious localities:
            </p>

            <div className="grid md:grid-cols-3 gap-6 my-8">
              <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-xl border-2 border-primary-200">
                <h3 className="text-xl font-bold text-gray-900 mb-3">Independent Villas</h3>
                <p className="text-gray-700">Spacious standalone homes with private gardens, complete privacy, and freedom to customize. Perfect for families seeking traditional villa living with modern amenities.</p>
              </div>

              <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-xl border-2 border-orange-200">
                <h3 className="text-xl font-bold text-gray-900 mb-3">Gated Community Villas</h3>
                <p className="text-gray-700">Premium villas within secure, well-maintained communities offering clubhouse, swimming pools, sports facilities, landscaped gardens, and 24/7 security services.</p>
              </div>

              <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border-2 border-blue-200">
                <h3 className="text-xl font-bold text-gray-900 mb-3">Beach-Facing Homes</h3>
                <p className="text-gray-700">Exclusive coastal villas in Yendada and Rushikonda with stunning ocean views, beach access, and serene beachside living combined with luxury amenities.</p>
              </div>
            </div>

            <p className="text-gray-700 leading-relaxed text-lg">
              All villa types in Visakhapatnam feature <strong>3-5 BHK configurations</strong> with modern amenities, VMRDA-approved layouts, clear titles, and exceptional appreciation potential of <span className="text-primary-600 font-bold">150-180% in the next 5 years</span>. Whether you're an end-user seeking luxury living or an investor targeting high returns, <strong>vizag villas</strong> offer unmatched value at prices 40-50% lower than Hyderabad and Bengaluru.
            </p>
          </div>

          <div className="grid md:grid-cols-4 gap-6 mt-12">
            <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-2xl border-2 border-green-200 text-center">
              <div className="text-4xl font-bold text-green-600 mb-2">150-180%</div>
              <div className="text-gray-700 font-semibold">Appreciation</div>
              <div className="text-sm text-gray-500 mt-1">Next 5 years potential</div>
            </div>
            <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-2xl border-2 border-primary-200 text-center">
              <div className="text-4xl font-bold text-primary-600 mb-2">200+</div>
              <div className="text-gray-700 font-semibold">Luxury Villas</div>
              <div className="text-sm text-gray-500 mt-1">Premium locations</div>
            </div>
            <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-2xl border-2 border-orange-200 text-center">
              <div className="text-4xl font-bold text-orange-600 mb-2">₹1Cr-5Cr</div>
              <div className="text-gray-700 font-semibold">Price Range</div>
              <div className="text-sm text-gray-500 mt-1">All configurations</div>
            </div>
            <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-2xl border-2 border-blue-200 text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">50+</div>
              <div className="text-gray-700 font-semibold">Gated Communities</div>
              <div className="text-sm text-gray-500 mt-1">With villas</div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-12 text-center">
            Why Invest in Villas in Vizag
          </h2>

          <div className="grid md:grid-cols-3 gap-8">
            <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200 hover:shadow-xl transition-all">
              <div className="bg-green-600 w-16 h-16 rounded-full flex items-center justify-center mb-6">
                <TrendingUp className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Exceptional Appreciation</h3>
              <p className="text-gray-700 leading-relaxed">
                Independent villas, gated community villas, and beach-facing homes in premium Vizag localities offer 150-180% appreciation potential in next 5 years, making them ideal for both end-users and investors.
              </p>
            </div>

            <div className="bg-gradient-to-br from-primary-50 to-white p-8 rounded-2xl border-2 border-primary-200 hover:shadow-xl transition-all">
              <div className="bg-primary-600 w-16 h-16 rounded-full flex items-center justify-center mb-6">
                <Sparkles className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4">World-Class Amenities</h3>
              <p className="text-gray-700 leading-relaxed">
                Independent villas and gated community villas feature private pools, landscaped gardens, smart home automation, clubhouse facilities, sports amenities, and 24/7 security. Beach-facing homes offer stunning ocean views.
              </p>
            </div>

            <div className="bg-gradient-to-br from-orange-50 to-white p-8 rounded-2xl border-2 border-orange-200 hover:shadow-xl transition-all">
              <div className="bg-orange-600 w-16 h-16 rounded-full flex items-center justify-center mb-6">
                <Shield className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Legal Safety & Location</h3>
              <p className="text-gray-700 leading-relaxed">
                VMRDA-approved layouts ensure complete legal safety with clear titles. Prime locations near IT hubs, beaches, and excellent infrastructure provide unmatched lifestyle quality.
              </p>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-br from-green-50 via-white to-primary-50">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              Villa Investment Insights in Vizag
            </h2>
            <p className="text-xl text-gray-600 max-w-3xl mx-auto">
              Strategic insights for smart villa investments in Visakhapatnam's fastest-growing corridors
            </p>
          </div>

          <div className="grid md:grid-cols-3 gap-8 mb-12">
            <div className="bg-white rounded-2xl shadow-xl p-8 border-2 border-green-200 hover:shadow-2xl transition-all">
              <div className="flex items-center gap-3 mb-6">
                <div className="bg-green-100 p-4 rounded-xl">
                  <TrendingUp className="h-8 w-8 text-green-600" />
                </div>
                <div>
                  <div className="text-4xl font-bold text-green-600">150-180%</div>
                  <div className="text-sm text-gray-600">Expected Growth</div>
                </div>
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-3">Exceptional Appreciation</h3>
              <p className="text-gray-700 leading-relaxed mb-4">
                Villas in premium Vizag locations are projected to appreciate by 150-180% over the next 5 years, driven by IT sector expansion, infrastructure development, and growing demand from professionals and NRIs.
              </p>
              <div className="space-y-2 text-sm">
                <div className="flex items-center gap-2 text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Smart city infrastructure projects</span>
                </div>
                <div className="flex items-center gap-2 text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Metro rail expansion plans</span>
                </div>
                <div className="flex items-center gap-2 text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Coastal development initiatives</span>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-xl p-8 border-2 border-primary-200 hover:shadow-2xl transition-all">
              <div className="flex items-center gap-3 mb-6">
                <div className="bg-primary-100 p-4 rounded-xl">
                  <Building2 className="h-8 w-8 text-primary-600" />
                </div>
                <div>
                  <div className="text-4xl font-bold text-primary-600">High</div>
                  <div className="text-sm text-gray-600">Buyer Demand</div>
                </div>
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-3">NRIs & IT Professionals</h3>
              <p className="text-gray-700 leading-relaxed mb-4">
                Strong demand from NRI investors seeking secure assets and IT professionals relocating to Vizag's growing tech corridor ensures consistent appreciation and rental yields for villa properties.
              </p>
              <div className="space-y-2 text-sm">
                <div className="flex items-center gap-2 text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-primary-600" />
                  <span>NRI-preferred investment destination</span>
                </div>
                <div className="flex items-center gap-2 text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-primary-600" />
                  <span>IT sector job creation</span>
                </div>
                <div className="flex items-center gap-2 text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-primary-600" />
                  <span>Premium rental yields 4-6%</span>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-xl p-8 border-2 border-orange-200 hover:shadow-2xl transition-all">
              <div className="flex items-center gap-3 mb-6">
                <div className="bg-orange-100 p-4 rounded-xl">
                  <MapPin className="h-8 w-8 text-orange-600" />
                </div>
                <div>
                  <div className="text-4xl font-bold text-orange-600">Top 3</div>
                  <div className="text-sm text-gray-600">Growth Corridors</div>
                </div>
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-3">Prime Growth Corridors</h3>
              <p className="text-gray-700 leading-relaxed mb-4">
                Madhurawada IT Hub, Rushikonda beach corridor, and Yendada coastal belt are Vizag's fastest-appreciating villa zones with world-class infrastructure and lifestyle amenities.
              </p>
              <div className="space-y-2 text-sm">
                <div className="flex items-center gap-2 text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-orange-600" />
                  <span><strong>Madhurawada:</strong> IT hub, tech parks</span>
                </div>
                <div className="flex items-center gap-2 text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-orange-600" />
                  <span><strong>Rushikonda:</strong> Beach access, tourism</span>
                </div>
                <div className="flex items-center gap-2 text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-orange-600" />
                  <span><strong>Yendada:</strong> Luxury coastal living</span>
                </div>
              </div>
            </div>
          </div>

          <div className="bg-gradient-to-r from-primary-600 to-primary-700 rounded-2xl p-8 text-white">
            <div className="grid md:grid-cols-2 gap-8 items-center">
              <div>
                <h3 className="text-2xl font-bold mb-4">Why Smart Investors Choose Vizag Villas</h3>
                <ul className="space-y-3">
                  <li className="flex items-start gap-3">
                    <CheckCircle2 className="h-6 w-6 flex-shrink-0 mt-0.5" />
                    <span>40-50% lower prices compared to Hyderabad and Bengaluru for similar luxury</span>
                  </li>
                  <li className="flex items-start gap-3">
                    <CheckCircle2 className="h-6 w-6 flex-shrink-0 mt-0.5" />
                    <span>Government focus on smart city development and infrastructure upgrades</span>
                  </li>
                  <li className="flex items-start gap-3">
                    <CheckCircle2 className="h-6 w-6 flex-shrink-0 mt-0.5" />
                    <span>Established IT sector with expanding multinational presence</span>
                  </li>
                  <li className="flex items-start gap-3">
                    <CheckCircle2 className="h-6 w-6 flex-shrink-0 mt-0.5" />
                    <span>Strategic coastal location with beach access and natural beauty</span>
                  </li>
                </ul>
              </div>
              <div className="bg-white/10 rounded-xl p-6 backdrop-blur-sm">
                <div className="text-center mb-4">
                  <div className="text-5xl font-bold mb-2">₹1Cr - ₹5Cr</div>
                  <div className="text-primary-100">Typical Villa Investment Range</div>
                </div>
                <div className="grid grid-cols-2 gap-4 mt-6">
                  <div className="text-center">
                    <div className="text-3xl font-bold">4-6%</div>
                    <div className="text-sm text-primary-100">Annual Rental Yield</div>
                  </div>
                  <div className="text-center">
                    <div className="text-3xl font-bold">5 Years</div>
                    <div className="text-sm text-primary-100">Investment Horizon</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-b from-gray-50 to-white">
        <div className="max-w-5xl mx-auto text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Find Your Perfect Luxury Villa in Vizag
          </h2>
          <div className="bg-white rounded-2xl shadow-xl p-2 max-w-3xl mx-auto">
            <div className="flex gap-2">
              <input
                type="text"
                placeholder="Search beachside villas, gated community villas..."
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
            Villa Price Trends in Vizag
          </h2>
          <div className="prose prose-lg max-w-none">
            <p className="text-gray-700 leading-relaxed">
              <strong>Vizag real estate</strong> offers exceptional investment opportunities with <strong>independent villas</strong>, <strong>luxury gated community villas</strong>, and <strong>beach-facing homes</strong> in premium localities showing <span className="text-green-600 font-bold">150-180% appreciation potential in the next 5 years</span>. <strong>Villas in Vizag</strong> in prime areas like Madhurawada, Yendada, and Rushikonda are ideal for both end-users seeking premium lifestyle and investors targeting high returns. The city's transformation into a smart city with expanding IT sector, improving infrastructure, and coastal development projects continue to drive strong demand for luxury villa properties.
            </p>
          </div>

          <div className="grid md:grid-cols-2 gap-8 mt-10">
            <div className="bg-gradient-to-br from-primary-50 to-white p-8 rounded-2xl border-2 border-primary-200">
              <h3 className="text-2xl font-bold text-gray-900 mb-6">Premium Villa Areas (₹2.5Cr-5Cr+)</h3>
              <ul className="space-y-3">
                <li className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-primary-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <strong>Yendada:</strong> Beachside luxury villas with private pools and ocean views
                  </div>
                </li>
                <li className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-primary-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <strong>Rushikonda:</strong> Exclusive coastal villas with premium amenities
                  </div>
                </li>
                <li className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-primary-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <strong>Madhurawada:</strong> Modern IT corridor villas with smart features
                  </div>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200">
              <h3 className="text-2xl font-bold text-gray-900 mb-6">Value Villa Areas (₹1Cr-2.5Cr)</h3>
              <ul className="space-y-3">
                <li className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <strong>PM Palem:</strong> Affordable villa options with good appreciation
                  </div>
                </li>
                <li className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <strong>MVP Colony:</strong> Established villas with complete infrastructure
                  </div>
                </li>
                <li className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-0.5" />
                  <div>
                    <strong>Seethammadhara:</strong> Central location villas with amenities
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
            Gated Community Villas in Vizag
          </h2>
          <div className="prose prose-lg max-w-none mb-10">
            <p className="text-gray-700 leading-relaxed">
              <strong>Gated community villas in Vizag</strong> offer the perfect blend of luxury, security, and community living. These premium residential layouts provide world-class amenities including clubhouse facilities, swimming pools, sports courts, gymnasiums, children's play areas, and landscaped gardens. With 24/7 security, professional property management, and well-maintained infrastructure, gated communities ensure a hassle-free lifestyle. Popular gated villa communities in Madhurawada, Yendada, PM Palem, and MVP Colony feature <strong>3-5 BHK villas</strong> with modern architecture, smart home features, and VMRDA approvals. These properties offer 150-180% appreciation potential in next 5 years, making them ideal for families, professionals, and investors seeking premium lifestyle with strong returns.
            </p>
          </div>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6 mb-12">
            <div className="bg-white p-6 rounded-xl shadow-lg border-2 border-primary-200 hover:shadow-xl transition-all">
              <div className="flex items-center gap-3 mb-4">
                <div className="bg-primary-100 p-3 rounded-lg">
                  <Shield className="h-6 w-6 text-primary-600" />
                </div>
                <h3 className="text-xl font-bold text-gray-900">24/7 Security</h3>
              </div>
              <p className="text-gray-700">Gated entry with security personnel, CCTV surveillance, and controlled access for complete safety.</p>
            </div>

            <div className="bg-white p-6 rounded-xl shadow-lg border-2 border-orange-200 hover:shadow-xl transition-all">
              <div className="flex items-center gap-3 mb-4">
                <div className="bg-orange-100 p-3 rounded-lg">
                  <Sparkles className="h-6 w-6 text-orange-600" />
                </div>
                <h3 className="text-xl font-bold text-gray-900">Premium Amenities</h3>
              </div>
              <p className="text-gray-700">Clubhouse, swimming pool, gym, sports facilities, and recreational areas for residents.</p>
            </div>

            <div className="bg-white p-6 rounded-xl shadow-lg border-2 border-green-200 hover:shadow-xl transition-all">
              <div className="flex items-center gap-3 mb-4">
                <div className="bg-green-100 p-3 rounded-lg">
                  <Home className="h-6 w-6 text-green-600" />
                </div>
                <h3 className="text-xl font-bold text-gray-900">Maintained Spaces</h3>
              </div>
              <p className="text-gray-700">Professional maintenance of common areas, gardens, roads, and infrastructure.</p>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Best Areas to Buy Villas in Vizag
          </h2>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <Link to="/madhurawada" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-primary-600 to-primary-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">Madhurawada</h3>
                  <p className="text-primary-100 text-sm">IT Hub Modern Villas</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Contemporary gated community villas near IT companies with modern amenities and infrastructure.</p>
                  <div className="flex items-center text-primary-600 font-semibold group-hover:gap-2 transition-all">
                    View Villas <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/yendada" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-orange-600 to-orange-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">Yendada</h3>
                  <p className="text-orange-100 text-sm">Beachside Luxury</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Premium beachside luxury villas with ocean views, private pools, and world-class amenities.</p>
                  <div className="flex items-center text-orange-600 font-semibold group-hover:gap-2 transition-all">
                    View Villas <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/pm-palem" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-green-600 to-green-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">PM Palem</h3>
                  <p className="text-green-100 text-sm">Value Villas</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Affordable villa options in family-friendly residential hub with good appreciation potential.</p>
                  <div className="flex items-center text-green-600 font-semibold group-hover:gap-2 transition-all">
                    View Villas <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/mvp-colony" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-blue-600 to-blue-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">MVP Colony</h3>
                  <p className="text-blue-100 text-sm">Established Area</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Well-established villas with complete amenities and excellent infrastructure.</p>
                  <div className="flex items-center text-blue-600 font-semibold group-hover:gap-2 transition-all">
                    View Villas <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 p-6">
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-xl font-bold text-gray-900">Rushikonda</h3>
                  <p className="text-sm text-purple-600 font-semibold">Exclusive Coastal</p>
                </div>
                <MapPin className="h-6 w-6 text-purple-600" />
              </div>
              <p className="text-gray-700 mb-4">Ultra-luxury beachfront villas with panoramic sea views and private beach access.</p>
            </div>

            <Link to="/villas-in-vizag" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-red-600 to-red-700 p-6 text-white">
                  <Sparkles className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">All Luxury Villas</h3>
                  <p className="text-red-100 text-sm">Premium Properties</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4">Browse all luxury villas across Visakhapatnam with verified documentation and amenities.</p>
                  <div className="flex items-center text-red-600 font-semibold group-hover:gap-2 transition-all">
                    View All Villas <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
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
            Luxury Villas in Vizag
          </h2>
          <div className="prose prose-lg max-w-none mb-10">
            <p className="text-gray-700 leading-relaxed">
              <strong>Luxury villas in Vizag</strong> redefine premium living with world-class amenities and sophisticated designs. From <strong>independent villas</strong> with spacious private gardens to <strong>gated community villas</strong> featuring clubhouse facilities, swimming pools, sports courts, and landscaped gardens, Visakhapatnam offers diverse luxury options. <strong>Beach-facing homes</strong> in Yendada and Rushikonda provide stunning ocean views and exclusive coastal living. All luxury villas feature smart home automation, modern architecture, premium finishes, and VMRDA-approved layouts ensuring complete legal safety, clear titles, and 150-180% appreciation potential in next 5 years, making them ideal for both end-users and investors.
            </p>
          </div>

          {loading ? (
            <div className="text-center py-12">
              <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto"></div>
              <p className="mt-4 text-gray-600">Loading villas...</p>
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
            <div className="text-center py-12 bg-gray-50 rounded-2xl">
              <Home className="h-16 w-16 text-gray-400 mx-auto mb-4" />
              <h3 className="text-xl font-semibold text-gray-900 mb-2">No matching properties found in this area.</h3>
              <p className="text-gray-600 mb-6">We couldn't find any villas matching your criteria</p>
              <button
                onClick={() => {
                  let message = 'Hi Vizag Property Experts, I searched for villas in Vizag'
                  if (selectedLocality) message += ` in ${selectedLocality}`
                  if (selectedBHK) message += ` (${selectedBHK})`
                  message += ' but found no results. Please share matching options.'
                  openWhatsApp(message)
                }}
                className="inline-flex items-center gap-2 bg-green-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-green-700 transition-all"
              >
                <MessageCircle className="h-5 w-5" />
                Get properties on WhatsApp
              </button>
            </div>
          )}

          <div className="text-center mt-12">
            <Link
              to="/properties?type=Villa"
              className="inline-flex items-center gap-2 bg-primary-600 hover:bg-primary-700 text-white px-8 py-4 rounded-xl font-semibold text-lg transition-colors"
            >
              View All Villas in Vizag
              <ArrowRight className="h-5 w-5" />
            </Link>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-br from-primary-600 to-primary-700 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold mb-6">
            Ready to Invest in Premium Villas in Vizag?
          </h2>
          <p className="text-xl text-primary-50 mb-8">
            Discover independent villas, gated community villas, and beach-facing homes with 150-180% appreciation potential. Perfect for end-users and investors.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              to="/properties?type=Villa"
              className="inline-flex items-center justify-center gap-2 bg-white text-primary-600 px-8 py-4 rounded-xl font-semibold text-lg hover:bg-primary-50 transition-colors"
            >
              <Search className="h-5 w-5" />
              Browse All Villas
            </Link>
            <a
              href={getWhatsAppLink("Hi! I'm interested in luxury villas in Vizag")}
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
              placeholder="Quick search villas..."
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

      <WhatsAppButton
        autoOpen={true}
        message="Hi 👋 Are you looking for villas in Vizag? We can help you with verified listings."
        showVillaOption={true}
      />

    </div>
  )
}
