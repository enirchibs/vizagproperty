import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Search, MapPin, Building2, CheckCircle2, ArrowRight, Phone, Shield, Zap, Users, TrendingUp, Mic, MicOff, X, MessageCircle } from 'lucide-react'
import type { Property } from '../types'
import { useVoiceSearch } from '../hooks/useVoiceSearch'
import { openWhatsApp, getWhatsAppLink } from '../lib/whatsapp'

export default function GatedCommunityPlotsPage() {
  const { isListening, transcript, localityMatch, noMatchMessage, startListening, stopListening, resetTranscript, isSupported } = useVoiceSearch()
  const [searchQuery, setSearchQuery] = useState('')
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [selectedLocation, setSelectedLocation] = useState('')
  const [selectedPlotSize, setSelectedPlotSize] = useState('')
  const [selectedBudget, setSelectedBudget] = useState('')

  useEffect(() => {
    document.title = 'Plots in Gated Community in Vizag | VMRDA Approved Plots for Sale'

    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Buy plots in gated community in Vizag with 24/7 security, modern amenities, and VMRDA approval. Secure living with 180% appreciation in 5 years. Explore premium gated projects.')
    }

    const faqSchema = {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "What is the price of plots in gated community in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Plots in gated community in Vizag range from ₹35 lakhs to ₹1.5 crores depending on location, plot size, and amenities. Budget-friendly plots in developing areas like PM Palem and Gajuwaka start from ₹35-50 lakhs, while premium gated communities in Madhurawada, MVP Colony, and Rushikonda cost ₹80 lakhs to ₹1.5 crores."
          }
        },
        {
          "@type": "Question",
          "name": "Which area has best gated community plots in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Best gated community plots in Vizag are in Madhurawada for IT professionals with excellent infrastructure, Yendada for luxury beachside living, PM Palem for affordable family-oriented communities, and MVP Colony for established premium neighborhoods. All offer VMRDA approval, 24/7 security, clubhouses, and modern amenities."
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
      const { buildUnifiedPropertyQuery } = await import('../lib/searchFilters')

      const query = buildUnifiedPropertyQuery({
        propertyType: 'plot',
        listingType: 'sale'
      })

      const { data, error } = await query.limit(50)

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
    window.location.href = `/properties?search=${encodeURIComponent(searchQuery)}`
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
              <Shield className="h-8 w-8" />
              <span className="text-green-100 font-semibold">Secure Gated Living</span>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold mb-6 leading-tight">
              Plots in Gated Community in Vizag
            </h1>
            <p className="text-xl text-green-50 mb-8">
              Premium VMRDA approved plots with 24/7 security, modern amenities, and guaranteed appreciation
            </p>

            <div className="bg-white rounded-2xl shadow-2xl p-2">
              <div className="flex gap-2">
                <div className="flex-1 relative">
                  <input
                    type="text"
                    placeholder="Search gated community plots in Madhurawada, Yendada..."
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
              Discover premium <strong>vizag plots in gated community</strong> offering unparalleled secure living, world-class amenities, and exceptional high appreciation potential. <strong>Vizag real estate</strong> has witnessed explosive demand for gated community plots as families prioritize safety, lifestyle, and investment returns. These exclusive <strong>vizag plots for sale</strong> in gated townships feature 24/7 security with CCTV surveillance, clubhouses, swimming pools, landscaped gardens, children's play areas, jogging tracks, and rainwater harvesting. With <span className="text-green-600 font-bold text-xl">180% appreciation in just 5 years</span>, gated community plots in prime locations like Madhurawada IT corridor, beachside Yendada, and family-friendly PM Palem offer the perfect combination of secure family living and outstanding investment growth, making them the most sought-after <strong>vizag real estate</strong> investment today.
            </p>
          </div>

          <div className="grid md:grid-cols-4 gap-6 mt-12">
            <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-2xl border-2 border-green-200 text-center">
              <div className="text-4xl font-bold text-green-600 mb-2">180%</div>
              <div className="text-gray-700 font-semibold">Appreciation</div>
              <div className="text-sm text-gray-500 mt-1">Last 5 years</div>
            </div>
            <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-2xl border-2 border-primary-200 text-center">
              <div className="text-4xl font-bold text-primary-600 mb-2">50+</div>
              <div className="text-gray-700 font-semibold">Gated Projects</div>
              <div className="text-sm text-gray-500 mt-1">Across Vizag</div>
            </div>
            <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-2xl border-2 border-blue-200 text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">₹35L-1.5Cr</div>
              <div className="text-gray-700 font-semibold">Price Range</div>
              <div className="text-sm text-gray-500 mt-1">All plot sizes</div>
            </div>
            <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-2xl border-2 border-orange-200 text-center">
              <div className="text-4xl font-bold text-orange-600 mb-2">100%</div>
              <div className="text-gray-700 font-semibold">VMRDA Approved</div>
              <div className="text-sm text-gray-500 mt-1">Legal & verified</div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-12 px-4 bg-white border-b-2 border-gray-100">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-gray-900 mb-6 text-center">
            Explore Gated Community Plots in Vizag
          </h2>
          <div className="grid md:grid-cols-3 gap-4 max-w-5xl mx-auto">
            <div className="bg-gradient-to-br from-green-50 to-white p-4 rounded-xl border-2 border-green-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                <MapPin className="inline h-4 w-4 mr-1" />
                Search by Location
              </label>
              <select
                value={selectedLocation}
                onChange={(e) => setSelectedLocation(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-green-500 focus:outline-none"
              >
                <option value="">All Locations</option>
                <option value="Madhurawada">Madhurawada</option>
                <option value="Yendada">Yendada</option>
                <option value="PM Palem">PM Palem</option>
                <option value="MVP Colony">MVP Colony</option>
                <option value="Gajuwaka">Gajuwaka</option>
                <option value="Rushikonda">Rushikonda</option>
              </select>
            </div>

            <div className="bg-gradient-to-br from-blue-50 to-white p-4 rounded-xl border-2 border-blue-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                Search by Plot Size
              </label>
              <select
                value={selectedPlotSize}
                onChange={(e) => setSelectedPlotSize(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-blue-500 focus:outline-none"
              >
                <option value="">All Plot Sizes</option>
                <option value="100-150">100-150 sq yards</option>
                <option value="150-200">150-200 sq yards</option>
                <option value="200-300">200-300 sq yards</option>
                <option value="300-500">300-500 sq yards</option>
                <option value="500+">Above 500 sq yards</option>
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
                <option value="60-80">₹60L - ₹80L</option>
                <option value="80-100">₹80L - ₹1 Crore</option>
                <option value="100-150">₹1Cr - ₹1.5Cr</option>
                <option value="150+">Above ₹1.5 Crore</option>
              </select>
            </div>
          </div>

          <div className="text-center mt-6">
            <div className="flex flex-col sm:flex-row gap-4 justify-center items-center">
              <button
                onClick={() => {
                  let searchUrl = '/properties?type=Plot&listing_type=sale&'
                  if (selectedLocation) searchUrl += `location=${encodeURIComponent(selectedLocation)}&`
                  if (selectedPlotSize) searchUrl += `size=${selectedPlotSize}&`
                  if (selectedBudget) searchUrl += `budget=${selectedBudget}&`
                  searchUrl = searchUrl.slice(0, -1)
                  window.location.href = searchUrl
                }}
                className="bg-gradient-to-r from-green-600 to-green-700 hover:from-green-700 hover:to-green-800 text-white px-12 py-4 rounded-xl font-bold text-lg shadow-xl hover:shadow-2xl transition-all flex items-center gap-3"
              >
                <Search className="h-6 w-6" />
                Search Gated Community Plots
              </button>
              <button
                onClick={() => openWhatsApp('Hi, I am looking for gated community plots in Vizag')}
                className="bg-primary-600 hover:bg-primary-700 text-white px-12 py-4 rounded-xl font-bold text-lg shadow-xl hover:shadow-2xl transition-all flex items-center gap-3"
              >
                <MessageCircle className="h-6 w-6" />
                Get Listings on WhatsApp
              </button>
            </div>
            <p className="text-sm text-gray-600 mt-3">
              AI-powered search finds the perfect gated community plots matching your requirements
            </p>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Benefits of Gated Community Plots in Vizag
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            Gated community plots in Vizag offer unmatched advantages combining security, lifestyle, and investment returns. Unlike standalone plots, gated communities provide 24/7 manned security with CCTV surveillance, controlled entry gates, and perimeter walls ensuring complete family safety. Residents enjoy premium amenities including clubhouses with indoor games, swimming pools, gymnasiums, landscaped gardens, children's play zones, jogging tracks, and community halls for social gatherings. Infrastructure is superior with paved roads, underground drainage, rainwater harvesting, solar street lights, and centralized sewage treatment. The sense of community fosters friendships and creates a vibrant neighborhood atmosphere. Most importantly, gated community plots command 25-30% premium over regular plots due to their desirability, ensuring exceptional appreciation and easier resale. With VMRDA approval and bank loan availability, these plots offer the perfect foundation to build your dream home in a secure, well-planned environment.
          </p>

          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
            <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-2xl border-2 border-green-200 text-center hover:shadow-xl transition-all">
              <div className="bg-green-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                <Shield className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-2">24/7 Security</h3>
              <p className="text-gray-600 text-sm">
                Manned security gates, CCTV surveillance, perimeter walls, and controlled access for complete safety
              </p>
            </div>

            <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-2xl border-2 border-blue-200 text-center hover:shadow-xl transition-all">
              <div className="bg-blue-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                <Building2 className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-2">Premium Amenities</h3>
              <p className="text-gray-600 text-sm">
                Clubhouse, swimming pool, gym, parks, jogging track, and community hall for modern lifestyle
              </p>
            </div>

            <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-2xl border-2 border-orange-200 text-center hover:shadow-xl transition-all">
              <div className="bg-orange-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                <TrendingUp className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-2">High Appreciation</h3>
              <p className="text-gray-600 text-sm">
                180% value growth in 5 years with 25-30% premium over regular plots and faster resale
              </p>
            </div>

            <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-2xl border-2 border-primary-200 text-center hover:shadow-xl transition-all">
              <div className="bg-primary-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                <Users className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-2">Community Living</h3>
              <p className="text-gray-600 text-sm">
                Vibrant neighborhood with like-minded families, social events, and strong community bonds
              </p>
            </div>
          </div>

          <div className="mt-12 bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200">
            <h3 className="text-2xl font-bold text-gray-900 mb-6 text-center">Why Choose Gated Community Plots?</h3>
            <div className="grid md:grid-cols-2 gap-6">
              <div className="space-y-4">
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900 mb-1">Complete Safety & Security</div>
                    <p className="text-gray-600 text-sm">24/7 manned security, CCTV monitoring, and gated access ensure your family's complete safety</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900 mb-1">World-Class Infrastructure</div>
                    <p className="text-gray-600 text-sm">Paved roads, street lights, underground drainage, water supply, and power backup</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900 mb-1">Lifestyle Amenities</div>
                    <p className="text-gray-600 text-sm">Clubhouse, swimming pool, gym, parks, and recreational facilities for modern living</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900 mb-1">VMRDA Approved</div>
                    <p className="text-gray-600 text-sm">100% legal plots with government approval, clear titles, and bank loan availability</p>
                  </div>
                </div>
              </div>
              <div className="space-y-4">
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900 mb-1">Better Appreciation</div>
                    <p className="text-gray-600 text-sm">25-30% premium over regular plots with 180% value growth in 5 years</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900 mb-1">Community Environment</div>
                    <p className="text-gray-600 text-sm">Like-minded neighbors, social events, and vibrant community atmosphere</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900 mb-1">Easy Resale</div>
                    <p className="text-gray-600 text-sm">Higher demand and faster resale due to desirability and premium location</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-green-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900 mb-1">Eco-Friendly Features</div>
                    <p className="text-gray-600 text-sm">Rainwater harvesting, solar lights, green spaces, and sustainable development</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-b from-gray-50 to-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Best Gated Community Projects in Vizag
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            Vizag's real estate landscape features premium gated community projects by renowned developers offering unparalleled living experiences. Madhurawada IT corridor hosts tech-focused gated communities with smart infrastructure catering to IT professionals seeking modern amenities near workplaces. Yendada and Rushikonda showcase luxury beachside gated projects with sea-facing plots, infinity pools, and resort-style clubhouses for affluent buyers. PM Palem and Gajuwaka offer family-oriented affordable gated communities with spacious plots, children's play areas, and strong community bonds. These projects feature meticulously planned layouts with wide roads, ample green spaces, designated parking, and 24/7 security ensuring peaceful living. Top developers provide additional benefits like in-house construction assistance, architectural consultation, and guaranteed buyback options making these gated communities the preferred choice for discerning homebuyers and investors seeking secure, luxurious, and appreciating real estate investments in Visakhapatnam.
          </p>

          <div className="grid md:grid-cols-3 gap-6">
            <div className="bg-white p-6 rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all">
              <div className="flex items-center gap-2 mb-3">
                <div className="bg-green-600 px-3 py-1 rounded-full text-white text-xs font-bold">PREMIUM</div>
                <div className="text-green-600 font-bold text-lg">Madhurawada IT Enclave</div>
              </div>
              <p className="text-gray-700 mb-4">Ultra-modern gated community with 150-300 sq yard plots, clubhouse, EV charging, co-working space. Walking distance to IT companies. VMRDA approved.</p>
              <div className="space-y-2 mb-4">
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>24/7 Security & CCTV</span>
                </div>
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Clubhouse & Pool</span>
                </div>
              </div>
              <div className="flex justify-between items-center border-t-2 border-gray-100 pt-4">
                <span className="text-gray-600 text-sm">From</span>
                <span className="text-green-600 font-bold text-xl">₹65L</span>
              </div>
            </div>

            <div className="bg-white p-6 rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all">
              <div className="flex items-center gap-2 mb-3">
                <div className="bg-blue-600 px-3 py-1 rounded-full text-white text-xs font-bold">LUXURY</div>
                <div className="text-blue-600 font-bold text-lg">Yendada Beach Villas</div>
              </div>
              <p className="text-gray-700 mb-4">Exclusive beachside gated project with 300-500 sq yard plots, sea views, infinity pool, landscaped gardens, private beach access. Ultimate luxury living.</p>
              <div className="space-y-2 mb-4">
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-blue-600" />
                  <span>Beachside Location</span>
                </div>
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-blue-600" />
                  <span>Premium Amenities</span>
                </div>
              </div>
              <div className="flex justify-between items-center border-t-2 border-gray-100 pt-4">
                <span className="text-gray-600 text-sm">From</span>
                <span className="text-blue-600 font-bold text-xl">₹1.2Cr</span>
              </div>
            </div>

            <div className="bg-white p-6 rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all">
              <div className="flex items-center gap-2 mb-3">
                <div className="bg-orange-600 px-3 py-1 rounded-full text-white text-xs font-bold">AFFORDABLE</div>
                <div className="text-orange-600 font-bold text-lg">PM Palem Green Valley</div>
              </div>
              <p className="text-gray-700 mb-4">Budget-friendly family gated community with 100-200 sq yard plots, children's park, community hall, green spaces. Excellent appreciation potential.</p>
              <div className="space-y-2 mb-4">
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-orange-600" />
                  <span>Family-Friendly</span>
                </div>
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-orange-600" />
                  <span>Great Connectivity</span>
                </div>
              </div>
              <div className="flex justify-between items-center border-t-2 border-gray-100 pt-4">
                <span className="text-gray-600 text-sm">From</span>
                <span className="text-orange-600 font-bold text-xl">₹42L</span>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Amenities & Security in Gated Communities
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            Modern gated communities in Vizag redefine residential living with world-class amenities and multi-layered security systems ensuring complete peace of mind. Security infrastructure includes professionally trained guards, high-resolution CCTV cameras covering all entry points and common areas, biometric access control, visitor management systems, and emergency response protocols. Lifestyle amenities rival luxury resorts with state-of-the-art clubhouses featuring indoor games rooms, air-conditioned gymnasiums with modern equipment, Olympic-size swimming pools with separate children's sections, landscaped gardens with walking paths, outdoor sports courts for badminton and tennis, dedicated children's play zones with safe equipment, and spacious community halls for events. Infrastructure excellence extends to wide paved roads, underground electrical cabling, street lighting with solar backup, rainwater harvesting systems, sewage treatment plants, waste segregation facilities, and dedicated parking areas. These comprehensive features create a self-sustained ecosystem where families enjoy resort-style living while property values consistently appreciate, making gated community plots the smartest real estate investment in Vizag.
          </p>

          <div className="grid md:grid-cols-2 gap-8">
            <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200">
              <div className="flex items-center gap-3 mb-6">
                <Shield className="h-10 w-10 text-green-600" />
                <h3 className="text-2xl font-bold text-gray-900">Security Features</h3>
              </div>
              <div className="space-y-3">
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">24/7 Professional security guards with training</span>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">High-resolution CCTV surveillance at all entry points</span>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Biometric access control and visitor management</span>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Perimeter walls with controlled entry/exit gates</span>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Emergency response system and fire safety</span>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">24x7 security patrol and monitoring</span>
                </div>
              </div>
            </div>

            <div className="bg-gradient-to-br from-blue-50 to-white p-8 rounded-2xl border-2 border-blue-200">
              <div className="flex items-center gap-3 mb-6">
                <Building2 className="h-10 w-10 text-blue-600" />
                <h3 className="text-2xl font-bold text-gray-900">Lifestyle Amenities</h3>
              </div>
              <div className="space-y-3">
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Modern clubhouse with indoor games and AC gym</span>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Swimming pool with separate kids and adult sections</span>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Landscaped gardens, jogging track, and yoga lawn</span>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Children's play area with safe equipment</span>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Badminton/Tennis courts and sports facilities</span>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Community hall for events and celebrations</span>
                </div>
              </div>
            </div>
          </div>

          <div className="mt-8 bg-gradient-to-br from-orange-50 to-white p-8 rounded-2xl border-2 border-orange-200">
            <div className="flex items-center gap-3 mb-6">
              <Zap className="h-10 w-10 text-orange-600" />
              <h3 className="text-2xl font-bold text-gray-900">Infrastructure Excellence</h3>
            </div>
            <div className="grid md:grid-cols-3 gap-4">
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Wide paved roads with proper drainage</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Solar-powered street lighting</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Underground electrical cabling</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Rainwater harvesting systems</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Sewage treatment plant</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Waste management & recycling</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">24/7 water supply & power backup</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Ample visitor & resident parking</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">High-speed internet connectivity</span>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-b from-gray-50 to-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Price Appreciation - 180% Growth in 5 Years
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            Gated community plots in Vizag have delivered exceptional <span className="text-green-600 font-bold text-xl">180% appreciation over the last 5 years</span>, significantly outperforming regular plots and other real estate investments. This remarkable growth is driven by multiple factors: Vizag's emergence as an IT hub attracting high-income professionals preferring secure gated living, port and industrial expansion creating massive employment opportunities, metro rail and smart city infrastructure boosting connectivity, and limited supply of premium gated projects meeting surging demand. Data shows plots in Madhurawada IT corridor appreciated from ₹25,000 per sq yard in 2019 to ₹70,000 in 2024 (180% growth), while Yendada beachside gated communities saw values jump from ₹40,000 to ₹1.1 lakh per sq yard (175% growth). Even affordable locations like PM Palem witnessed 150-160% appreciation. Gated community plots consistently command 25-30% premium over regular plots due to superior amenities, security, and lifestyle appeal. With Vizag's continued infrastructure development, IT expansion, and increasing preference for gated living, experts project sustained 12-15% annual appreciation making these plots the most lucrative real estate investment offering both lifestyle enhancement and wealth creation.
          </p>

          <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200">
            <h3 className="text-2xl font-bold text-gray-900 mb-6 text-center">Area-wise Appreciation Analysis (2019-2024)</h3>
            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
              <div className="bg-white p-6 rounded-xl border-2 border-green-200">
                <div className="font-bold text-gray-900 text-lg mb-3">Madhurawada (IT Hub)</div>
                <div className="space-y-2">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 text-sm">2019 Price:</span>
                    <span className="text-gray-900 font-semibold">₹25,000/sq yd</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 text-sm">2024 Price:</span>
                    <span className="text-gray-900 font-semibold">₹70,000/sq yd</span>
                  </div>
                  <div className="border-t-2 border-green-200 pt-2 mt-2">
                    <div className="flex justify-between items-center">
                      <span className="text-gray-700 font-bold">Appreciation:</span>
                      <span className="text-green-600 font-bold text-xl">180%</span>
                    </div>
                  </div>
                </div>
              </div>

              <div className="bg-white p-6 rounded-xl border-2 border-green-200">
                <div className="font-bold text-gray-900 text-lg mb-3">Yendada (Beachside)</div>
                <div className="space-y-2">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 text-sm">2019 Price:</span>
                    <span className="text-gray-900 font-semibold">₹40,000/sq yd</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 text-sm">2024 Price:</span>
                    <span className="text-gray-900 font-semibold">₹1,10,000/sq yd</span>
                  </div>
                  <div className="border-t-2 border-green-200 pt-2 mt-2">
                    <div className="flex justify-between items-center">
                      <span className="text-gray-700 font-bold">Appreciation:</span>
                      <span className="text-green-600 font-bold text-xl">175%</span>
                    </div>
                  </div>
                </div>
              </div>

              <div className="bg-white p-6 rounded-xl border-2 border-green-200">
                <div className="font-bold text-gray-900 text-lg mb-3">MVP Colony (Premium)</div>
                <div className="space-y-2">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 text-sm">2019 Price:</span>
                    <span className="text-gray-900 font-semibold">₹35,000/sq yd</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 text-sm">2024 Price:</span>
                    <span className="text-gray-900 font-semibold">₹90,000/sq yd</span>
                  </div>
                  <div className="border-t-2 border-green-200 pt-2 mt-2">
                    <div className="flex justify-between items-center">
                      <span className="text-gray-700 font-bold">Appreciation:</span>
                      <span className="text-green-600 font-bold text-xl">157%</span>
                    </div>
                  </div>
                </div>
              </div>

              <div className="bg-white p-6 rounded-xl border-2 border-green-200">
                <div className="font-bold text-gray-900 text-lg mb-3">PM Palem (Affordable)</div>
                <div className="space-y-2">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 text-sm">2019 Price:</span>
                    <span className="text-gray-900 font-semibold">₹15,000/sq yd</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 text-sm">2024 Price:</span>
                    <span className="text-gray-900 font-semibold">₹38,000/sq yd</span>
                  </div>
                  <div className="border-t-2 border-green-200 pt-2 mt-2">
                    <div className="flex justify-between items-center">
                      <span className="text-gray-700 font-bold">Appreciation:</span>
                      <span className="text-green-600 font-bold text-xl">153%</span>
                    </div>
                  </div>
                </div>
              </div>

              <div className="bg-white p-6 rounded-xl border-2 border-green-200">
                <div className="font-bold text-gray-900 text-lg mb-3">Rushikonda (Beach)</div>
                <div className="space-y-2">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 text-sm">2019 Price:</span>
                    <span className="text-gray-900 font-semibold">₹50,000/sq yd</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 text-sm">2024 Price:</span>
                    <span className="text-gray-900 font-semibold">₹1,35,000/sq yd</span>
                  </div>
                  <div className="border-t-2 border-green-200 pt-2 mt-2">
                    <div className="flex justify-between items-center">
                      <span className="text-gray-700 font-bold">Appreciation:</span>
                      <span className="text-green-600 font-bold text-xl">170%</span>
                    </div>
                  </div>
                </div>
              </div>

              <div className="bg-white p-6 rounded-xl border-2 border-green-200">
                <div className="font-bold text-gray-900 text-lg mb-3">Gajuwaka (Budget)</div>
                <div className="space-y-2">
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 text-sm">2019 Price:</span>
                    <span className="text-gray-900 font-semibold">₹12,000/sq yd</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-gray-600 text-sm">2024 Price:</span>
                    <span className="text-gray-900 font-semibold">₹30,000/sq yd</span>
                  </div>
                  <div className="border-t-2 border-green-200 pt-2 mt-2">
                    <div className="flex justify-between items-center">
                      <span className="text-gray-700 font-bold">Appreciation:</span>
                      <span className="text-green-600 font-bold text-xl">150%</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <p className="text-sm text-gray-600 mt-6 text-center">
              * Prices are for gated community plots. Data reflects market trends from Dec 2019 to Dec 2024. Actual prices vary by specific project and plot size.
            </p>
          </div>

          <div className="mt-8 bg-gradient-to-br from-blue-50 to-white p-8 rounded-2xl border-2 border-blue-200">
            <h3 className="text-xl font-bold text-gray-900 mb-4">Key Drivers of Appreciation</h3>
            <div className="grid md:grid-cols-2 gap-6">
              <div className="space-y-3">
                <div className="flex items-start gap-3">
                  <TrendingUp className="h-6 w-6 text-blue-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900">IT Sector Boom</div>
                    <p className="text-gray-600 text-sm">Massive IT investments and job creation driving demand for premium gated living</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <TrendingUp className="h-6 w-6 text-blue-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900">Infrastructure Development</div>
                    <p className="text-gray-600 text-sm">Metro rail, smart city projects, and improved connectivity enhancing property values</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <TrendingUp className="h-6 w-6 text-blue-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900">Limited Premium Supply</div>
                    <p className="text-gray-600 text-sm">Scarcity of quality gated community plots meeting surging demand from affluent buyers</p>
                  </div>
                </div>
              </div>
              <div className="space-y-3">
                <div className="flex items-start gap-3">
                  <TrendingUp className="h-6 w-6 text-blue-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900">Security Preference</div>
                    <p className="text-gray-600 text-sm">Growing preference for gated living among families creating consistent demand</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <TrendingUp className="h-6 w-6 text-blue-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900">Investment Migration</div>
                    <p className="text-gray-600 text-sm">Investors from Hyderabad and metros diversifying into Vizag's appreciating market</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <TrendingUp className="h-6 w-6 text-blue-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900">Government Support</div>
                    <p className="text-gray-600 text-sm">VMRDA approvals and regulatory support ensuring transparent property transactions</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gray-50">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-12 text-center">
            Featured Gated Community Plots in Vizag
          </h2>

          {loading ? (
            <div className="text-center py-12">
              <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-green-600 mx-auto"></div>
              <p className="mt-4 text-gray-600">Loading plots...</p>
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
              <Building2 className="h-16 w-16 text-gray-400 mx-auto mb-4" />
              <h3 className="text-xl font-semibold text-gray-900 mb-2">No matching properties found in this area.</h3>
              <p className="text-gray-600 mb-6">We couldn't find any gated community plots matching your search</p>
              <button
                onClick={() => {
                  let message = 'Hi Vizag Property Experts, I searched for gated community plots in Vizag'
                  if (selectedLocation) message += ` in ${selectedLocation}`
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
              to="/properties?type=Plot&listing_type=sale"
              className="inline-flex items-center gap-2 bg-green-600 hover:bg-green-700 text-white px-8 py-4 rounded-xl font-semibold text-lg transition-colors"
            >
              View All Gated Community Plots
              <ArrowRight className="h-5 w-5" />
            </Link>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-br from-green-600 to-green-700 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold mb-6">
            Ready to Invest in Gated Community Plots?
          </h2>
          <p className="text-xl text-green-50 mb-8">
            Get expert guidance on the best gated community projects in Vizag with 180% appreciation potential
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link
              to="/properties?type=Plot"
              className="inline-flex items-center justify-center gap-2 bg-white text-green-600 px-8 py-4 rounded-xl font-semibold text-lg hover:bg-green-50 transition-colors"
            >
              <Search className="h-5 w-5" />
              Browse All Plots
            </Link>
            <a
              href={getWhatsAppLink("Hi! I'm interested in gated community plots in Vizag")}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center justify-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-8 py-4 rounded-xl font-semibold text-lg transition-colors"
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
              placeholder="Quick search plots..."
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
