import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Search, MapPin, Building2, CheckCircle2, ArrowRight, Phone, Mic, MicOff, X, MessageCircle } from 'lucide-react'
import { PropertyCard } from '../components/PropertyCard'
import { supabase } from '../lib/supabase'
import type { Property } from '../types'
import { useVoiceSearch } from '../hooks/useVoiceSearch'
import { openWhatsApp } from '../lib/whatsapp'
import { FixedWhatsAppCTA } from '../components/FixedWhatsAppCTA'
import { ScrollWhatsAppIcon } from '../components/ScrollWhatsAppIcon'
import { WhatsAppZeroResultsModal } from '../components/WhatsAppZeroResultsModal'

export default function FlatsForSalePage() {
  const { isListening, transcript, localityMatch, noMatchMessage, startListening, stopListening, resetTranscript, isSupported } = useVoiceSearch()
  const [searchQuery, setSearchQuery] = useState('')
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [selectedBHK, setSelectedBHK] = useState('')
  const [selectedBudget, setSelectedBudget] = useState('')
  const [selectedStatus, setSelectedStatus] = useState('')
  const [showZeroResultsModal, setShowZeroResultsModal] = useState(false)

  useEffect(() => {
    document.title = 'Flats for Sale in Vizag | 2 BHK, 3 BHK Apartments in Visakhapatnam'

    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Buy flats in Vizag with best prices. Explore 2 BHK, 3 BHK apartments for sale in Madhurawada, MVP Colony, PM Palem. Premium vizag flats for sale with excellent amenities.')
    }

    const faqSchema = {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "What is the price of 2 BHK flat in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "2 BHK flats in Vizag range from ₹35 lakhs to ₹80 lakhs depending on location and amenities. Budget-friendly 2 BHK apartments in areas like PM Palem and Gajuwaka start from ₹35-40 lakhs, while premium 2 BHK flats in Madhurawada, MVP Colony, and beachside areas cost ₹60-80 lakhs."
          }
        },
        {
          "@type": "Question",
          "name": "Which area is best to buy flat in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Best areas to buy flats in Vizag include Madhurawada for IT professionals with modern apartments and excellent connectivity, MVP Colony for established neighborhoods with complete amenities, Seethammadhara for central location, Rushikonda for beachside luxury living, and PM Palem for affordable family-friendly apartments."
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
  }, [selectedBudget, selectedBHK])

  const loadProperties = async () => {
    try {
      let query = supabase
        .from('properties')
        .select('*')
        .eq('city', 'Vizag')
        .eq('status', 'available')
        .in('property_type', ['apartment', 'flat'])
        .eq('listing_type', 'sale')

      if (selectedBudget) {
        const [min, max] = selectedBudget.split('-').map(v => v.replace('+', ''))
        if (min) {
          const minPrice = parseInt(min) * 100000
          query = query.gte('price', minPrice)
        }
        if (max) {
          const maxPrice = parseInt(max) * 100000
          query = query.lte('price', maxPrice)
        }
      }

      if (selectedBHK) {
        const bhkNum = selectedBHK.replace('BHK', '').trim()
        query = query.eq('bedrooms', parseInt(bhkNum))
      }

      query = query.order('created_at', { ascending: false }).limit(12)

      const { data, error } = await query

      if (error) throw error
      setProperties(data || [])

      if (data && data.length === 0) {
        setShowZeroResultsModal(true)
      }
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
    params.append('propertyType', 'flat')
    params.append('listingType', 'sale')
    if (searchQuery) params.append('keyword', searchQuery)
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
      <section className="relative bg-gradient-to-r from-blue-600 to-blue-700 text-white py-20 px-4">
        <div className="absolute inset-0 bg-black/10"></div>
        <div className="relative max-w-7xl mx-auto">
          <div className="max-w-3xl">
            <div className="flex items-center gap-2 mb-4">
              <Building2 className="h-8 w-8" />
              <span className="text-blue-100 font-semibold">Premium Apartments</span>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold mb-6 leading-tight">
              Flats for Sale in Vizag
            </h1>
            <p className="text-xl text-blue-50 mb-8">
              Discover your perfect apartment in Visakhapatnam's prime locations with world-class amenities
            </p>

            <div className="bg-white rounded-2xl shadow-2xl p-2">
              <div className="flex gap-2">
                <div className="flex-1 relative">
                  <input
                    type="text"
                    placeholder="Search 2 BHK, 3 BHK flats in Madhurawada, MVP Colony..."
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
                    className="w-full px-6 py-4 pr-14 text-gray-900 rounded-xl focus:outline-none"
                  />
                  {isSupported && (
                    <button
                      onClick={handleVoiceToggle}
                      className={`absolute right-2 top-1/2 -translate-y-1/2 p-2 rounded-lg transition-all ${
                        isListening
                          ? 'bg-red-600 text-white animate-pulse'
                          : 'text-gray-600 hover:bg-gray-200'
                      }`}
                      aria-label={isListening ? "Stop voice search" : "Start voice search"}
                    >
                      {isListening ? <MicOff className="h-5 w-5" /> : <Mic className="h-5 w-5" />}
                    </button>
                  )}
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
                  className="bg-blue-600 hover:bg-blue-700 text-white px-8 py-4 rounded-xl font-semibold flex items-center gap-2 transition-colors"
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
              Discover premium <strong>flats for sale in Vizag</strong> driven by booming IT sector growth, modern lifestyle aspirations, and unmatched affordability compared to metros. <strong>Vizag real estate</strong> has witnessed explosive demand for <strong>vizag apartments</strong> as IT professionals, young families, and investors flock to this smart city with world-class infrastructure. From budget-friendly 2 BHK <strong>vizag flats for sale</strong> starting at just ₹35 lakhs to ultra-luxury penthouses exceeding ₹3 crore, Visakhapatnam offers exceptional value. <strong>Vizag real estate prices</strong> have appreciated by <span className="text-blue-600 font-bold">150-180% in the last 5 years</span>, making apartments in prime localities like Madhurawada IT corridor, MVP Colony, and beachside Rushikonda highly sought-after investments combining lifestyle enhancement with outstanding returns.
            </p>
          </div>

          <div className="grid md:grid-cols-4 gap-6 mt-12">
            <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-2xl border-2 border-blue-200 text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">150-180%</div>
              <div className="text-gray-700 font-semibold">Appreciation</div>
              <div className="text-sm text-gray-500 mt-1">Last 5 years</div>
            </div>
            <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-2xl border-2 border-primary-200 text-center">
              <div className="text-4xl font-bold text-primary-600 mb-2">1000+</div>
              <div className="text-gray-700 font-semibold">Flats Available</div>
              <div className="text-sm text-gray-500 mt-1">Ready & under construction</div>
            </div>
            <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-2xl border-2 border-green-200 text-center">
              <div className="text-4xl font-bold text-green-600 mb-2">₹35L-2Cr</div>
              <div className="text-gray-700 font-semibold">Price Range</div>
              <div className="text-sm text-gray-500 mt-1">All configurations</div>
            </div>
            <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-2xl border-2 border-orange-200 text-center">
              <div className="text-4xl font-bold text-orange-600 mb-2">8-10%</div>
              <div className="text-gray-700 font-semibold">Rental Yield</div>
              <div className="text-sm text-gray-500 mt-1">Prime locations</div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-12 px-4 bg-white border-b-2 border-gray-100">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-gray-900 mb-6 text-center">
            Find Flats for Sale in Vizag Using AI Search
          </h2>
          <div className="grid md:grid-cols-3 gap-4 max-w-5xl mx-auto">
            <div className="bg-gradient-to-br from-blue-50 to-white p-4 rounded-xl border-2 border-blue-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                <Building2 className="inline h-4 w-4 mr-1" />
                Search by Configuration
              </label>
              <select
                value={selectedBHK}
                onChange={(e) => setSelectedBHK(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-blue-500 focus:outline-none"
              >
                <option value="">All BHK Types</option>
                <option value="1BHK">1 BHK</option>
                <option value="2BHK">2 BHK</option>
                <option value="3BHK">3 BHK</option>
                <option value="4BHK">4 BHK</option>
                <option value="Penthouse">Penthouse</option>
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
                <option value="0-40">Under ₹40 Lakhs</option>
                <option value="40-60">₹40L - ₹60L</option>
                <option value="60-80">₹60L - ₹80L</option>
                <option value="80-100">₹80L - ₹1 Crore</option>
                <option value="100-150">₹1Cr - ₹1.5Cr</option>
                <option value="150+">Above ₹1.5 Crore</option>
              </select>
            </div>

            <div className="bg-gradient-to-br from-orange-50 to-white p-4 rounded-xl border-2 border-orange-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                Property Status
              </label>
              <select
                value={selectedStatus}
                onChange={(e) => setSelectedStatus(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-orange-500 focus:outline-none"
              >
                <option value="">All Status</option>
                <option value="ready">Ready to Move</option>
                <option value="construction">Under Construction</option>
              </select>
            </div>
          </div>

          <div className="text-center mt-6">
            <button
              onClick={() => {
                loadProperties()
              }}
              className="bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white px-12 py-4 rounded-xl font-bold text-lg shadow-xl hover:shadow-2xl transition-all flex items-center gap-3 mx-auto"
            >
              <Search className="h-6 w-6" />
              Search Flats in Vizag
            </button>
            <p className="text-sm text-gray-600 mt-3">
              AI-powered search finds the perfect flats matching your budget and preferences
            </p>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Types of Flats Available in Vizag
          </h2>

          <div className="grid md:grid-cols-3 gap-8 mb-12">
            <div className="bg-gradient-to-br from-primary-50 to-white p-8 rounded-2xl border-2 border-primary-200 hover:shadow-xl transition-all">
              <h3 className="text-2xl font-bold text-gray-900 mb-4">2 BHK Flats</h3>
              <p className="text-gray-700 leading-relaxed mb-4">
                Perfect for small families and young professionals. Compact yet comfortable with modern amenities.
              </p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">₹35L - ₹80L price range</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">900-1200 sq ft area</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Best in PM Palem, Gajuwaka</span>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-blue-50 to-white p-8 rounded-2xl border-2 border-blue-200 hover:shadow-xl transition-all">
              <h3 className="text-2xl font-bold text-gray-900 mb-4">3 BHK Flats</h3>
              <p className="text-gray-700 leading-relaxed mb-4">
                Ideal for growing families needing extra space. Most popular configuration in Vizag.
              </p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">₹60L - ₹1.5Cr price range</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">1300-1800 sq ft area</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Best in Madhurawada, MVP Colony</span>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200 hover:shadow-xl transition-all">
              <h3 className="text-2xl font-bold text-gray-900 mb-4">4 BHK & Penthouses</h3>
              <p className="text-gray-700 leading-relaxed mb-4">
                Luxury apartments with premium amenities and spacious layouts for affluent families.
              </p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">₹1.2Cr - ₹3Cr+ price range</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">2000-3500 sq ft area</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Best in Rushikonda, Yendada</span>
                </li>
              </ul>
            </div>
          </div>

          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-8 mt-16">
            Best Areas to Buy Flats in Vizag
          </h2>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <Link to="/madhurawada" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-primary-500">
                <div className="bg-gradient-to-br from-primary-600 to-primary-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">Madhurawada</h3>
                  <p className="text-primary-100 text-sm">IT Hub & Modern Living</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-2 font-semibold">2 BHK: ₹50L-75L | 3 BHK: ₹80L-1.2Cr</p>
                  <p className="text-gray-600 text-sm mb-4">Prime location near IT SEZ with modern apartment complexes and excellent connectivity.</p>
                  <div className="flex items-center text-primary-600 font-semibold group-hover:gap-2 transition-all">
                    View Flats <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/mvp-colony" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-blue-500">
                <div className="bg-gradient-to-br from-blue-600 to-blue-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">MVP Colony</h3>
                  <p className="text-blue-100 text-sm">Established Premium Area</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-2 font-semibold">2 BHK: ₹60L-85L | 3 BHK: ₹90L-1.5Cr</p>
                  <p className="text-gray-600 text-sm mb-4">Well-established colony with complete amenities, schools, and shopping centers.</p>
                  <div className="flex items-center text-blue-600 font-semibold group-hover:gap-2 transition-all">
                    View Flats <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/pm-palem" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-green-500">
                <div className="bg-gradient-to-br from-green-600 to-green-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">PM Palem</h3>
                  <p className="text-green-100 text-sm">Affordable & Value</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-2 font-semibold">2 BHK: ₹35L-55L | 3 BHK: ₹60L-90L</p>
                  <p className="text-gray-600 text-sm mb-4">Budget-friendly flats with good appreciation potential and family-friendly environment.</p>
                  <div className="flex items-center text-green-600 font-semibold group-hover:gap-2 transition-all">
                    View Flats <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/yendada" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-orange-500">
                <div className="bg-gradient-to-br from-orange-600 to-orange-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">Yendada</h3>
                  <p className="text-orange-100 text-sm">Beachside Luxury</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-2 font-semibold">3 BHK: ₹1Cr-1.8Cr | 4 BHK: ₹1.5Cr-2.5Cr</p>
                  <p className="text-gray-600 text-sm mb-4">Premium beachside apartments with sea views and world-class amenities.</p>
                  <div className="flex items-center text-orange-600 font-semibold group-hover:gap-2 transition-all">
                    View Flats <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <Link to="/gajuwaka" className="block group">
              <div className="bg-white rounded-2xl shadow-lg overflow-hidden hover:shadow-2xl transition-all border-2 border-gray-200 hover:border-purple-500">
                <div className="bg-gradient-to-br from-purple-600 to-purple-700 p-6 text-white">
                  <MapPin className="h-8 w-8 mb-2" />
                  <h3 className="text-2xl font-bold">Gajuwaka</h3>
                  <p className="text-purple-100 text-sm">Budget-Friendly</p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-2 font-semibold">2 BHK: ₹30L-50L | 3 BHK: ₹50L-75L</p>
                  <p className="text-gray-600 text-sm mb-4">Most affordable flats in Vizag with developing infrastructure and connectivity.</p>
                  <div className="flex items-center text-purple-600 font-semibold group-hover:gap-2 transition-all">
                    View Flats <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                  </div>
                </div>
              </div>
            </Link>

            <div className="bg-gradient-to-br from-gray-800 to-gray-900 rounded-2xl shadow-lg overflow-hidden p-6 text-white flex items-center justify-center">
              <div className="text-center">
                <Building2 className="h-12 w-12 mx-auto mb-4 text-blue-400" />
                <h3 className="text-xl font-bold mb-2">Explore More Areas</h3>
                <Link to="/vizag" className="inline-flex items-center gap-2 text-blue-400 hover:text-blue-300 font-semibold">
                  View All Localities
                  <ArrowRight className="h-5 w-5" />
                </Link>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-b from-gray-50 to-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            New Apartment Projects in Vizag
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            Vizag's real estate boom has attracted top developers launching premium apartment projects with cutting-edge amenities. New flat complexes are coming up across Madhurawada IT corridor with smart home features and co-working spaces catering to tech professionals. Beachside localities like Rushikonda and Yendada are seeing luxury high-rise apartments with infinity pools and sea-facing balconies. Even affordable housing is expanding in PM Palem and Gajuwaka with government-backed schemes ensuring quality construction and timely delivery. These new projects offer modern living with clubhouses, gyms, children's play areas, rainwater harvesting, solar power, and 24/7 security, making them ideal for families seeking contemporary lifestyle combined with strong appreciation potential.
          </p>

          <div className="grid md:grid-cols-3 gap-6">
            <div className="bg-white p-6 rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all">
              <div className="flex items-center gap-2 mb-3">
                <div className="bg-blue-600 px-3 py-1 rounded-full text-white text-xs font-bold">NEW</div>
                <div className="text-blue-600 font-bold text-lg">Madhurawada Tech Park Apts</div>
              </div>
              <p className="text-gray-700 mb-4">Ultra-modern 2 & 3 BHK apartments with smart home automation, co-working spaces, and EV charging stations. Walking distance to IT companies.</p>
              <div className="flex justify-between items-center border-t-2 border-gray-100 pt-4">
                <span className="text-gray-600 text-sm">2 BHK from</span>
                <span className="text-blue-600 font-bold text-xl">₹65L</span>
              </div>
            </div>

            <div className="bg-white p-6 rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all">
              <div className="flex items-center gap-2 mb-3">
                <div className="bg-green-600 px-3 py-1 rounded-full text-white text-xs font-bold">PREMIUM</div>
                <div className="text-green-600 font-bold text-lg">Rushikonda Ocean Towers</div>
              </div>
              <p className="text-gray-700 mb-4">Luxury beachfront apartments with panoramic sea views, infinity pool, private beach access, and concierge services.</p>
              <div className="flex justify-between items-center border-t-2 border-gray-100 pt-4">
                <span className="text-gray-600 text-sm">3 BHK from</span>
                <span className="text-green-600 font-bold text-xl">₹1.2Cr</span>
              </div>
            </div>

            <div className="bg-white p-6 rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all">
              <div className="flex items-center gap-2 mb-3">
                <div className="bg-orange-600 px-3 py-1 rounded-full text-white text-xs font-bold">AFFORDABLE</div>
                <div className="text-orange-600 font-bold text-lg">PM Palem Family Residences</div>
              </div>
              <p className="text-gray-700 mb-4">Budget-friendly 2 BHK flats with children's play area, community hall, and 24/7 security. PMAY subsidy eligible.</p>
              <div className="flex justify-between items-center border-t-2 border-gray-100 pt-4">
                <span className="text-gray-600 text-sm">2 BHK from</span>
                <span className="text-orange-600 font-bold text-xl">₹38L</span>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Flat Price Trends in Vizag
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            Vizag real estate prices for flats have shown remarkable growth trajectory over the past 5 years, with appreciation ranging from <span className="text-blue-600 font-bold text-xl">150-180%</span> in prime localities. The IT corridor expansion in Madhurawada has been a game-changer, with 2 BHK flat prices jumping from ₹40 lakhs in 2019 to ₹65-75 lakhs in 2024. MVP Colony and Seethammadhara, being established areas, continue to command premium with 3 BHK apartments now touching ₹1.2-1.5 crore. Even affordable zones like PM Palem and Gajuwaka have witnessed 120-130% appreciation. With metro rail construction, port expansion, and increasing IT investments, flat prices in Vizag are projected to maintain strong upward momentum, making current valuations attractive for both end-users and investors seeking capital appreciation alongside rental income.
          </p>

          <div className="bg-gradient-to-br from-blue-50 to-white p-8 rounded-2xl border-2 border-blue-200">
            <h3 className="text-2xl font-bold text-gray-900 mb-6">Average Flat Prices by Area (2024)</h3>
            <div className="grid md:grid-cols-2 gap-6">
              <div className="space-y-4">
                <div className="bg-white p-4 rounded-xl border border-blue-200">
                  <div className="font-bold text-gray-900 mb-2">Madhurawada (IT Hub)</div>
                  <div className="text-sm text-gray-600 mb-1">2 BHK: <span className="text-blue-600 font-bold">₹65-75L</span></div>
                  <div className="text-sm text-gray-600">3 BHK: <span className="text-blue-600 font-bold">₹95L-1.2Cr</span></div>
                </div>

                <div className="bg-white p-4 rounded-xl border border-blue-200">
                  <div className="font-bold text-gray-900 mb-2">MVP Colony (Premium)</div>
                  <div className="text-sm text-gray-600 mb-1">2 BHK: <span className="text-blue-600 font-bold">₹70-85L</span></div>
                  <div className="text-sm text-gray-600">3 BHK: <span className="text-blue-600 font-bold">₹1-1.5Cr</span></div>
                </div>

                <div className="bg-white p-4 rounded-xl border border-blue-200">
                  <div className="font-bold text-gray-900 mb-2">Rushikonda (Beachside)</div>
                  <div className="text-sm text-gray-600 mb-1">3 BHK: <span className="text-blue-600 font-bold">₹1.2-1.8Cr</span></div>
                  <div className="text-sm text-gray-600">4 BHK: <span className="text-blue-600 font-bold">₹1.8-2.5Cr</span></div>
                </div>
              </div>

              <div className="space-y-4">
                <div className="bg-white p-4 rounded-xl border border-blue-200">
                  <div className="font-bold text-gray-900 mb-2">PM Palem (Affordable)</div>
                  <div className="text-sm text-gray-600 mb-1">2 BHK: <span className="text-blue-600 font-bold">₹38-55L</span></div>
                  <div className="text-sm text-gray-600">3 BHK: <span className="text-blue-600 font-bold">₹60-85L</span></div>
                </div>

                <div className="bg-white p-4 rounded-xl border border-blue-200">
                  <div className="font-bold text-gray-900 mb-2">Gajuwaka (Budget)</div>
                  <div className="text-sm text-gray-600 mb-1">2 BHK: <span className="text-blue-600 font-bold">₹32-48L</span></div>
                  <div className="text-sm text-gray-600">3 BHK: <span className="text-blue-600 font-bold">₹55-75L</span></div>
                </div>

                <div className="bg-white p-4 rounded-xl border border-blue-200">
                  <div className="font-bold text-gray-900 mb-2">Yendada (Luxury)</div>
                  <div className="text-sm text-gray-600 mb-1">3 BHK: <span className="text-blue-600 font-bold">₹1.1-1.7Cr</span></div>
                  <div className="text-sm text-gray-600">Penthouse: <span className="text-blue-600 font-bold">₹2-3Cr+</span></div>
                </div>
              </div>
            </div>
            <p className="text-sm text-gray-600 mt-6 text-center">
              * Prices vary based on builder reputation, floor level, amenities, and exact location. Data reflects Dec 2024 market rates.
            </p>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gray-50">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-12 text-center">
            Featured Flats for Sale in Vizag
          </h2>

          {loading ? (
            <div className="text-center py-12">
              <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
              <p className="mt-4 text-gray-600">Loading flats...</p>
            </div>
          ) : properties.length > 0 ? (
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {properties.map((property) => (
                <PropertyCard key={property.id} property={property} />
              ))}
            </div>
          ) : (
            <div className="text-center py-12 bg-white rounded-2xl">
              <Building2 className="h-16 w-16 text-gray-400 mx-auto mb-4" />
              <h3 className="text-xl font-semibold text-gray-900 mb-2">No matching properties found in this area.</h3>
              <p className="text-gray-600 mb-6">We couldn't find any flats matching your criteria</p>
              <button
                onClick={() => {
                  let message = 'Hi Vizag Property Experts, I searched for flats for sale in Vizag'
                  if (selectedBHK) message += ` (${selectedBHK})`
                  if (selectedBudget) message += ` with budget ${selectedBudget}`
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
              to="/properties?type=Apartment,Flat&listing_type=sale"
              className="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-8 py-4 rounded-xl font-semibold text-lg transition-colors"
            >
              View All Flats for Sale
              <ArrowRight className="h-5 w-5" />
            </Link>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-br from-blue-600 to-blue-700 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold mb-6">
            Ready to Buy Your Dream Flat in Vizag?
          </h2>
          <p className="text-xl text-blue-50 mb-8">
            Get personalized recommendations and expert guidance from our real estate specialists
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              to="/properties?type=Apartment,Flat"
              className="inline-flex items-center justify-center gap-2 bg-white text-blue-600 px-8 py-4 rounded-xl font-semibold text-lg hover:bg-blue-50 transition-colors"
            >
              <Search className="h-5 w-5" />
              Browse All Flats
            </Link>
            <a
              href="https://wa.me/919182737473?text=Hi! I'm looking to buy a flat in Vizag"
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
        <div className="bg-white rounded-2xl shadow-2xl p-3 border-2 border-blue-500">
          <div className="flex gap-2">
            <input
              type="text"
              placeholder="Quick search flats..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              onKeyPress={(e) => e.key === 'Enter' && handleSearch()}
              className="flex-1 px-4 py-3 text-gray-900 rounded-xl focus:outline-none border border-gray-300"
            />
            <button
              onClick={handleSearch}
              className="bg-blue-600 text-white p-3 rounded-xl"
            >
              <Search className="h-5 w-5" />
            </button>
          </div>
        </div>
      </div>

      <FixedWhatsAppCTA />
      <ScrollWhatsAppIcon />
      <WhatsAppZeroResultsModal
        isOpen={showZeroResultsModal}
        onClose={() => setShowZeroResultsModal(false)}
      />
    </div>
  )
}
