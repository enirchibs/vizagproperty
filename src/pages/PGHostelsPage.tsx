import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Search, MapPin, Users, CheckCircle2, Home, Wifi, Utensils, ShieldCheck, Building2, TrendingUp, Zap, DollarSign, Upload, Mic, MicOff, X } from 'lucide-react'
import { useVoiceSearch } from '../hooks/useVoiceSearch'

export default function PGHostelsPage() {
  const { isListening, transcript, localityMatch, noMatchMessage, startListening, stopListening, resetTranscript, isSupported } = useVoiceSearch()
  const [searchQuery, setSearchQuery] = useState('')
  const [showBudgetPrompt, setShowBudgetPrompt] = useState(false)
  const [selectedLocation, setSelectedLocation] = useState('')
  const [selectedType, setSelectedType] = useState('')
  const [selectedBudget, setSelectedBudget] = useState('')

  useEffect(() => {
    document.title = 'PG & Hostels in Vizag | Best Paying Guest Accommodation for Students & Professionals'

    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Find affordable PG & hostels in Vizag from ₹3,000/month for students, IT employees, working professionals. Men PG, women PG, co-living spaces near colleges & IT companies in Madhurawada, MVP Colony, Gajuwaka.')
    }

    const faqSchema = {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "What is the cost of PG in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "PG accommodation in Vizag costs between ₹3,000 to ₹15,000 per month depending on facilities, location, and room type. Basic sharing PG with food costs ₹3,000-6,000, standard PG with WiFi and AC costs ₹6,000-10,000, while premium single rooms with all amenities in areas like Madhurawada and MVP Colony range from ₹10,000-15,000 per month. Vizag PG rents are 30-40% cheaper than Hyderabad and Bengaluru."
          }
        },
        {
          "@type": "Question",
          "name": "Which area is best for PG in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Best areas for PG in Vizag include Madhurawada for IT professionals near tech parks (₹6K-13K), MVP Colony for premium PG with excellent facilities (₹7K-15K), Gajuwaka for industrial area workers (₹4K-8K), PM Palem for affordable student accommodation (₹3K-7K), Rushikonda for beachside living (₹5K-10K), and Seethammadhara for central location with good connectivity (₹5K-9K)."
          }
        },
        {
          "@type": "Question",
          "name": "Are there girls PG in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Yes, Vizag has numerous safe and secure girls-only PG accommodations across all major areas. Women's PG hostels offer 24/7 security, CCTV surveillance, secure entry systems, home-cooked meals, WiFi, and housekeeping. Popular areas for girls PG include MVP Colony, Madhurawada, Seethammadhara, and Dwaraka Nagar with prices ranging from ₹4,000 to ₹15,000 per month."
          }
        },
        {
          "@type": "Question",
          "name": "What facilities are included in Vizag PG?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Most PG accommodations in Vizag include 3 home-cooked meals per day, high-speed WiFi, furnished rooms, laundry service, housekeeping, 24/7 security with CCTV, power backup, water supply, common areas, TV, refrigerator access, and parking. Premium PG additionally offer AC rooms, gym, hot water, attached bathrooms, and geyser facilities."
          }
        },
        {
          "@type": "Question",
          "name": "Is PG accommodation in Vizag cheaper than other cities?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Yes, PG accommodation in Vizag is 30-40% cheaper than Hyderabad and Bengaluru. A sharing room with food costs ₹4,000-6,000 in Vizag compared to ₹8,000-12,000 in Hyderabad or Bengaluru. Single rooms with AC and all amenities cost ₹10,000-12,000 in Vizag versus ₹15,000-20,000 in metro cities, making Vizag an affordable destination for students and professionals."
          }
        }
      ]
    }

    const script = document.createElement('script')
    script.type = 'application/ld+json'
    script.textContent = JSON.stringify(faqSchema)
    document.head.appendChild(script)

    setTimeout(() => setShowBudgetPrompt(true), 10000)

    return () => {
      const existingScript = document.querySelector('script[type="application/ld+json"]')
      if (existingScript) existingScript.remove()
    }
  }, [])

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

  const handleAISearch = () => {
    let searchUrl = '/properties?type=PG/Hostel&'
    if (selectedLocation) searchUrl += `location=${encodeURIComponent(selectedLocation)}&`
    if (selectedType) searchUrl += `pg_type=${selectedType}&`
    if (selectedBudget) searchUrl += `budget=${selectedBudget}&`
    searchUrl = searchUrl.slice(0, -1)
    window.location.href = searchUrl
  }

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      <section className="relative bg-gradient-to-r from-blue-600 to-blue-700 text-white py-20 px-4">
        <div className="absolute inset-0 bg-black/10"></div>
        <div className="relative max-w-7xl mx-auto">
          <div className="max-w-3xl">
            <div className="flex items-center gap-2 mb-4">
              <Users className="h-8 w-8" />
              <span className="text-blue-100 font-semibold">Affordable Accommodation</span>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold mb-6 leading-tight">
              PG & Hostels in Vizag
            </h1>
            <p className="text-xl text-blue-50 mb-8">
              Verified paying guest accommodation for students, IT employees, and working professionals
            </p>

            <div className="bg-white rounded-2xl shadow-2xl p-2">
              <div className="flex gap-2">
                <div className="flex-1 relative">
                  <input
                    type="text"
                    placeholder="Search PG & Hostels in Vizag..."
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
              Discover affordable and verified <strong>pg & hostels in vizag</strong> perfect for students attending GITAM, Andhra University, or other colleges, IT employees working in Madhurawada tech corridor, working professionals, and job seekers. <strong>Vizag pg for rent</strong> options span premium localities like MVP Colony and Madhurawada to budget-friendly areas like Gajuwaka, PM Palem, and Seethammadhara. Whether you need <strong>pg near colleges in vizag</strong> with study-friendly environments or <strong>pg near it companies in vizag</strong> for convenient commutes, <strong>affordable pg in vizag</strong> offers unbeatable value with comprehensive facilities including home-cooked meals, WiFi, 24/7 security, and housekeeping. <strong>Vizag hostels</strong> provide safe, comfortable accommodation starting from just ₹3,000 per month, making <strong>vizag real estate</strong> ideal for young professionals and students seeking quality living at <span className="text-blue-600 font-bold text-xl">30-40% lower costs than Hyderabad and Bengaluru</span>. Find men's PG, women's PG, and co-living spaces across Rushikonda beachside areas, ensuring you get the perfect accommodation matching your budget, lifestyle, and location preferences in Visakhapatnam.
            </p>
          </div>

          <div className="grid md:grid-cols-4 gap-6 mt-12">
            <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-2xl border-2 border-blue-200 text-center">
              <div className="text-4xl font-bold text-blue-600 mb-2">₹3K+</div>
              <div className="text-gray-700 font-semibold">Starting Price</div>
              <div className="text-sm text-gray-500 mt-1">Per month</div>
            </div>
            <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-2xl border-2 border-green-200 text-center">
              <div className="text-4xl font-bold text-green-600 mb-2">40%</div>
              <div className="text-gray-700 font-semibold">Cheaper</div>
              <div className="text-sm text-gray-500 mt-1">vs Hyderabad</div>
            </div>
            <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-2xl border-2 border-orange-200 text-center">
              <div className="text-4xl font-bold text-orange-600 mb-2">500+</div>
              <div className="text-gray-700 font-semibold">PG Options</div>
              <div className="text-sm text-gray-500 mt-1">Across Vizag</div>
            </div>
            <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-2xl border-2 border-primary-200 text-center">
              <div className="text-4xl font-bold text-primary-600 mb-2">100%</div>
              <div className="text-gray-700 font-semibold">Verified</div>
              <div className="text-sm text-gray-500 mt-1">Safe & secure</div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-12 px-4 bg-white border-b-2 border-gray-100">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-2xl md:text-3xl font-bold text-gray-900 mb-6 text-center">
            Find PG & Hostels in Vizag with AI Search
          </h2>
          <div className="grid md:grid-cols-3 gap-4 max-w-5xl mx-auto">
            <div className="bg-gradient-to-br from-blue-50 to-white p-4 rounded-xl border-2 border-blue-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                <MapPin className="inline h-4 w-4 mr-1" />
                Search by Location
              </label>
              <select
                value={selectedLocation}
                onChange={(e) => setSelectedLocation(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-blue-500 focus:outline-none"
              >
                <option value="">All Locations</option>
                <option value="Madhurawada">Madhurawada (IT Hub)</option>
                <option value="MVP Colony">MVP Colony (Premium)</option>
                <option value="Seethammadhara">Seethammadhara (Central)</option>
                <option value="Gajuwaka">Gajuwaka (Industrial)</option>
                <option value="PM Palem">PM Palem (Budget)</option>
                <option value="Rushikonda">Rushikonda (Beachside)</option>
                <option value="Dwaraka Nagar">Dwaraka Nagar (Peaceful)</option>
              </select>
            </div>

            <div className="bg-gradient-to-br from-green-50 to-white p-4 rounded-xl border-2 border-green-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                <Users className="inline h-4 w-4 mr-1" />
                Search by Type
              </label>
              <select
                value={selectedType}
                onChange={(e) => setSelectedType(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-green-500 focus:outline-none"
              >
                <option value="">All Types</option>
                <option value="Men PG">Men's PG</option>
                <option value="Women PG">Women's PG</option>
                <option value="Co-living">Co-living Spaces</option>
                <option value="Student Hostel">Student Hostels</option>
                <option value="Professional PG">Working Professional PG</option>
              </select>
            </div>

            <div className="bg-gradient-to-br from-orange-50 to-white p-4 rounded-xl border-2 border-orange-200">
              <label className="block text-sm font-semibold text-gray-700 mb-2">
                <DollarSign className="inline h-4 w-4 mr-1" />
                Search by Budget
              </label>
              <select
                value={selectedBudget}
                onChange={(e) => setSelectedBudget(e.target.value)}
                className="w-full px-4 py-3 rounded-lg border-2 border-gray-300 focus:border-orange-500 focus:outline-none"
              >
                <option value="">All Budgets</option>
                <option value="3000-5000">₹3,000 - ₹5,000</option>
                <option value="5000-7000">₹5,000 - ₹7,000</option>
                <option value="7000-10000">₹7,000 - ₹10,000</option>
                <option value="10000-15000">₹10,000 - ₹15,000</option>
              </select>
            </div>
          </div>

          <div className="text-center mt-6">
            <button
              onClick={handleAISearch}
              className="bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white px-12 py-4 rounded-xl font-bold text-lg shadow-xl hover:shadow-2xl transition-all flex items-center gap-3 mx-auto"
            >
              <Search className="h-6 w-6" />
              Find PG & Hostels in Vizag with AI Search
            </button>
            <p className="text-sm text-gray-600 mt-3">
              AI-powered search finds verified PG & hostels matching your exact requirements
            </p>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-b from-gray-50 to-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Types of PG & Hostels in Vizag
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            Vizag offers diverse PG accommodation types catering to different preferences, budgets, and lifestyles. <strong>Men's PG</strong> hostels provide secure, comfortable spaces for male students and working professionals with separate shared or single rooms, common areas, and recreational facilities. <strong>Women's PG</strong> accommodations prioritize safety with 24/7 security guards, CCTV surveillance, restricted entry, and homely environments with home-cooked vegetarian meals and supportive owners. <strong>Co-living spaces</strong> represent modern shared housing combining affordability with community living, featuring furnished private rooms, shared common areas, high-speed WiFi, flexible lease terms, and networking opportunities perfect for young professionals. <strong>Student hostels</strong> near GITAM University, Andhra University, and engineering colleges offer budget-friendly accommodation with study rooms, library access, group study spaces, and exam-friendly environments. <strong>Working professional PGs</strong> in IT hubs like Madhurawada provide premium amenities including AC rooms, workspace areas, parking, power backup, and proximity to tech parks ensuring convenient commutes and productive living for IT employees and corporate professionals seeking quality accommodation.
          </p>

          <div className="grid md:grid-cols-3 gap-8 mb-12">
            <div className="bg-gradient-to-br from-blue-50 to-white p-8 rounded-2xl border-2 border-blue-200 hover:shadow-xl transition-all">
              <div className="bg-blue-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-6">
                <Users className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4 text-center">Men's PG</h3>
              <p className="text-gray-700 mb-4 text-center">
                Secure and comfortable accommodation for male students and working professionals
              </p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Shared & single room options</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Common recreation areas</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Parking & bike storage</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">₹3,000 - ₹12,000/month</span>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-pink-50 to-white p-8 rounded-2xl border-2 border-pink-200 hover:shadow-xl transition-all">
              <div className="bg-pink-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-6">
                <ShieldCheck className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4 text-center">Women's PG</h3>
              <p className="text-gray-700 mb-4 text-center">
                Safe and secure ladies-only accommodation with 24/7 security
              </p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-pink-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">24/7 CCTV & security guards</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-pink-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Home-cooked vegetarian meals</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-pink-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Restricted entry systems</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-pink-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">₹4,000 - ₹15,000/month</span>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-primary-50 to-white p-8 rounded-2xl border-2 border-primary-200 hover:shadow-xl transition-all">
              <div className="bg-primary-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-6">
                <Building2 className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4 text-center">Co-living Spaces</h3>
              <p className="text-gray-700 mb-4 text-center">
                Modern shared housing for young professionals seeking community
              </p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Fully furnished private rooms</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Shared kitchen & lounge</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Networking events & activities</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">₹6,000 - ₹15,000/month</span>
                </li>
              </ul>
            </div>
          </div>

          <div className="grid md:grid-cols-2 gap-8">
            <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200 hover:shadow-xl transition-all">
              <div className="bg-green-600 w-16 h-16 rounded-full flex items-center justify-center mb-6">
                <Home className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Student Hostels</h3>
              <p className="text-gray-700 mb-4">
                Budget-friendly hostels near GITAM, Andhra University, and engineering colleges with study-focused environments
              </p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Study rooms & library access</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Group study spaces</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Budget meals & tiffin service</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">₹3,000 - ₹8,000/month</span>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-orange-50 to-white p-8 rounded-2xl border-2 border-orange-200 hover:shadow-xl transition-all">
              <div className="bg-orange-600 w-16 h-16 rounded-full flex items-center justify-center mb-6">
                <Zap className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Working Professional PG</h3>
              <p className="text-gray-700 mb-4">
                Premium PG near IT companies in Madhurawada with modern amenities and comfortable living
              </p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">AC rooms with workspace</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Power backup & parking</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Near tech parks & offices</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-orange-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">₹7,000 - ₹15,000/month</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Best Areas for PG & Hostels in Vizag
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            Vizag's diverse localities offer PG accommodations suited to different lifestyles and budgets. <strong>Madhurawada</strong> stands as the IT hub hosting tech parks like Infosys, TCS, and Wipro, making it ideal for <strong>pg near it companies in vizag</strong> with premium furnished PG offering AC rooms, high-speed WiFi, and short commutes costing ₹6,000-13,000 per month. <strong>MVP Colony</strong> represents premium residential living with established infrastructure, excellent connectivity, shopping centers, and high-quality PG featuring superior amenities, housekeeping, and peaceful environments at ₹7,000-15,000 per month. <strong>Gajuwaka</strong> serves industrial area workers with budget-friendly PG near manufacturing units, railway workshops, and factories offering basic comfortable accommodation at ₹4,000-8,000 per month. <strong>PM Palem</strong> provides <strong>affordable pg in vizag</strong> perfect for students and job seekers with numerous <strong>pg near colleges in vizag</strong> like engineering colleges and coaching centers costing just ₹3,000-7,000 per month. <strong>Rushikonda</strong> offers unique beachside living for students and young professionals seeking scenic environments near GITAM University with ocean views and refreshing coastal atmosphere at ₹5,000-10,000 per month. <strong>Seethammadhara</strong> delivers central location advantage with excellent connectivity to all city parts, markets, hospitals, and educational institutions providing convenient PG accommodation at ₹5,000-9,000 per month ideal for those prioritizing accessibility.
          </p>

          <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <div className="bg-white rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all p-6">
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-xl font-bold text-gray-900">Madhurawada</h3>
                  <p className="text-sm text-primary-600 font-semibold">IT Hub & Tech Parks</p>
                </div>
                <MapPin className="h-6 w-6 text-primary-600" />
              </div>
              <p className="text-gray-700 mb-4">
                Perfect for IT professionals. Premium PG near Infosys, TCS, Wipro with modern amenities and infrastructure.
              </p>
              <div className="space-y-2 mb-4">
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>PG near IT companies</span>
                </div>
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>AC rooms with WiFi</span>
                </div>
              </div>
              <div className="border-t-2 border-gray-100 pt-4">
                <div className="flex justify-between text-sm mb-2">
                  <span className="text-gray-600">Sharing:</span>
                  <span className="font-semibold text-green-600">₹6K-8K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">Single:</span>
                  <span className="font-semibold text-primary-600">₹10K-13K</span>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all p-6">
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-xl font-bold text-gray-900">MVP Colony</h3>
                  <p className="text-sm text-blue-600 font-semibold">Premium Residential</p>
                </div>
                <MapPin className="h-6 w-6 text-blue-600" />
              </div>
              <p className="text-gray-700 mb-4">
                High-quality PG with premium amenities in established colony with excellent connectivity.
              </p>
              <div className="space-y-2 mb-4">
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Premium facilities</span>
                </div>
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Peaceful environment</span>
                </div>
              </div>
              <div className="border-t-2 border-gray-100 pt-4">
                <div className="flex justify-between text-sm mb-2">
                  <span className="text-gray-600">Sharing:</span>
                  <span className="font-semibold text-green-600">₹7K-10K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">Single:</span>
                  <span className="font-semibold text-primary-600">₹12K-15K</span>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all p-6">
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-xl font-bold text-gray-900">Gajuwaka</h3>
                  <p className="text-sm text-orange-600 font-semibold">Industrial Area</p>
                </div>
                <MapPin className="h-6 w-6 text-orange-600" />
              </div>
              <p className="text-gray-700 mb-4">
                Budget-friendly PG near manufacturing units, railway workshops, and factories.
              </p>
              <div className="space-y-2 mb-4">
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Near industries</span>
                </div>
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Affordable rates</span>
                </div>
              </div>
              <div className="border-t-2 border-gray-100 pt-4">
                <div className="flex justify-between text-sm mb-2">
                  <span className="text-gray-600">Sharing:</span>
                  <span className="font-semibold text-green-600">₹4K-6K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">Single:</span>
                  <span className="font-semibold text-primary-600">₹7K-8K</span>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all p-6">
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-xl font-bold text-gray-900">PM Palem</h3>
                  <p className="text-sm text-green-600 font-semibold">Budget Student Area</p>
                </div>
                <MapPin className="h-6 w-6 text-green-600" />
              </div>
              <p className="text-gray-700 mb-4">
                Affordable PG for students near colleges, coaching centers, and educational institutions.
              </p>
              <div className="space-y-2 mb-4">
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>PG near colleges</span>
                </div>
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Most affordable</span>
                </div>
              </div>
              <div className="border-t-2 border-gray-100 pt-4">
                <div className="flex justify-between text-sm mb-2">
                  <span className="text-gray-600">Sharing:</span>
                  <span className="font-semibold text-green-600">₹3K-5K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">Single:</span>
                  <span className="font-semibold text-primary-600">₹6K-7K</span>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all p-6">
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-xl font-bold text-gray-900">Rushikonda</h3>
                  <p className="text-sm text-blue-600 font-semibold">Beachside Living</p>
                </div>
                <MapPin className="h-6 w-6 text-blue-600" />
              </div>
              <p className="text-gray-700 mb-4">
                Unique beachside PG near GITAM University with ocean views and refreshing coastal atmosphere.
              </p>
              <div className="space-y-2 mb-4">
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Beachside location</span>
                </div>
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Near GITAM campus</span>
                </div>
              </div>
              <div className="border-t-2 border-gray-100 pt-4">
                <div className="flex justify-between text-sm mb-2">
                  <span className="text-gray-600">Sharing:</span>
                  <span className="font-semibold text-green-600">₹5K-7K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">Single:</span>
                  <span className="font-semibold text-primary-600">₹8K-10K</span>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl shadow-lg border-2 border-gray-200 hover:shadow-xl transition-all p-6">
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-xl font-bold text-gray-900">Seethammadhara</h3>
                  <p className="text-sm text-primary-600 font-semibold">Central Location</p>
                </div>
                <MapPin className="h-6 w-6 text-primary-600" />
              </div>
              <p className="text-gray-700 mb-4">
                Central location with excellent connectivity to all parts of city, markets, and hospitals.
              </p>
              <div className="space-y-2 mb-4">
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Best connectivity</span>
                </div>
                <div className="flex items-center gap-2 text-sm text-gray-600">
                  <CheckCircle2 className="h-4 w-4 text-green-600" />
                  <span>Near markets & hospitals</span>
                </div>
              </div>
              <div className="border-t-2 border-gray-100 pt-4">
                <div className="flex justify-between text-sm mb-2">
                  <span className="text-gray-600">Sharing:</span>
                  <span className="font-semibold text-green-600">₹5K-7K</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-gray-600">Single:</span>
                  <span className="font-semibold text-primary-600">₹8K-9K</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-b from-gray-50 to-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            PG & Hostel Facilities in Vizag
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            Modern PG accommodations in Vizag provide comprehensive facilities ensuring comfortable, convenient, and hassle-free living. <strong>Furnished rooms</strong> come equipped with beds, mattresses, study tables, chairs, wardrobes, and storage shelves eliminating furniture costs. <strong>High-speed WiFi</strong> enables seamless work-from-home, online classes, streaming, and entertainment with unlimited data access. <strong>Home-cooked food</strong> includes 3 nutritious meals daily breakfast, lunch, and dinner with regional cuisine options, tiffin services, and special dietary accommodations. <strong>Power backup</strong> ensures uninterrupted electricity during outages with inverters and generators maintaining comfort. <strong>Housekeeping services</strong> provide regular room cleaning, common area maintenance, and pest control keeping premises hygienic. <strong>24/7 security</strong> features CCTV surveillance, secure entry systems, night guards, and visitor management ensuring resident safety. Additional amenities include laundry service with washing and ironing, refrigerator and microwave access, TV and entertainment areas, attached or shared bathrooms with hot water and geysers, parking facilities for bikes and cars, water purifiers for drinking water, and common lounges for socializing making PG living in Vizag comfortable, secure, and affordable.
          </p>

          <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6 mb-12">
            <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-2xl border-2 border-blue-200 text-center hover:shadow-xl transition-all">
              <div className="bg-blue-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                <Utensils className="h-8 w-8 text-white" />
              </div>
              <h3 className="font-bold text-gray-900 mb-2 text-lg">Meals Included</h3>
              <p className="text-sm text-gray-600">3 home-cooked meals daily with regional cuisine and dietary options</p>
            </div>

            <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-2xl border-2 border-green-200 text-center hover:shadow-xl transition-all">
              <div className="bg-green-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                <Wifi className="h-8 w-8 text-white" />
              </div>
              <h3 className="font-bold text-gray-900 mb-2 text-lg">High-Speed WiFi</h3>
              <p className="text-sm text-gray-600">Unlimited WiFi for work, study, and entertainment streaming</p>
            </div>

            <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-2xl border-2 border-orange-200 text-center hover:shadow-xl transition-all">
              <div className="bg-orange-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                <ShieldCheck className="h-8 w-8 text-white" />
              </div>
              <h3 className="font-bold text-gray-900 mb-2 text-lg">24/7 Security</h3>
              <p className="text-sm text-gray-600">CCTV surveillance, secure entry, and night guards for safety</p>
            </div>

            <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-2xl border-2 border-primary-200 text-center hover:shadow-xl transition-all">
              <div className="bg-primary-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                <Home className="h-8 w-8 text-white" />
              </div>
              <h3 className="font-bold text-gray-900 mb-2 text-lg">Housekeeping</h3>
              <p className="text-sm text-gray-600">Regular room cleaning, laundry, and maintenance included</p>
            </div>
          </div>

          <div className="bg-gradient-to-br from-blue-50 to-white p-8 rounded-2xl border-2 border-blue-200">
            <h3 className="text-2xl font-bold text-gray-900 mb-6 text-center">Complete Facilities Checklist</h3>
            <div className="grid md:grid-cols-3 gap-4">
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Fully furnished rooms</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">3 meals per day included</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">High-speed WiFi internet</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Power backup (inverter/generator)</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">24/7 water supply</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Laundry service (washing + ironing)</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">CCTV security cameras</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Refrigerator & microwave access</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">TV & entertainment area</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Hot water & geyser</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Bike/car parking facility</span>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                <span className="text-gray-700">Water purifier (RO filtered)</span>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            PG & Hostel Rent in Vizag
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            PG accommodation rent in Vizag offers exceptional value with prices significantly lower than metropolitan cities. <strong>Budget PG</strong> options starting from ₹3,000-6,000 per month provide basic sharing rooms with 3 meals, WiFi, and essential amenities in areas like PM Palem, Gajuwaka, and outskirts perfect for students and job seekers on tight budgets. <strong>Standard PG</strong> ranging ₹6,000-10,000 per month offer comfortable sharing or single rooms with AC options, quality meals, high-speed WiFi, and better facilities in localities like Madhurawada, Dwaraka Nagar, and NAD Junction catering to working professionals seeking balanced value. <strong>Premium PG</strong> costing ₹10,000-15,000 per month deliver luxury single AC rooms, gourmet meals, housekeeping, parking, gym access, and superior amenities in prime areas like MVP Colony, Rushikonda, and upscale Madhurawada neighborhoods serving senior professionals and executives. The <span className="text-green-600 font-bold text-xl">average PG rent in Vizag is 30-40% cheaper than Hyderabad and Bengaluru</span> where similar accommodations cost substantially more, making Visakhapatnam an extremely affordable destination for students pursuing education, IT professionals working in tech companies, and working professionals seeking quality living at reasonable costs with comprehensive facilities and safety features.
          </p>

          <div className="grid md:grid-cols-3 gap-8 mb-12">
            <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200 hover:shadow-xl transition-all">
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Budget PG</h3>
              <p className="text-4xl font-bold text-green-600 mb-4">₹3K - ₹6K</p>
              <p className="text-gray-600 mb-4">Per month</p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Sharing rooms (2-3 beds)</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">3 meals per day included</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Basic WiFi & laundry</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-green-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">PM Palem, Gajuwaka areas</span>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-primary-50 to-white p-8 rounded-2xl border-2 border-primary-200 hover:shadow-xl transition-all">
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Standard PG</h3>
              <p className="text-4xl font-bold text-primary-600 mb-4">₹6K - ₹10K</p>
              <p className="text-gray-600 mb-4">Per month</p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Sharing or single rooms</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">All meals + AC option</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">High-speed WiFi, TV room</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-primary-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Madhurawada, Dwaraka Nagar</span>
                </li>
              </ul>
            </div>

            <div className="bg-gradient-to-br from-blue-50 to-white p-8 rounded-2xl border-2 border-blue-200 hover:shadow-xl transition-all">
              <h3 className="text-2xl font-bold text-gray-900 mb-4">Premium PG</h3>
              <p className="text-4xl font-bold text-blue-600 mb-4">₹10K - ₹15K</p>
              <p className="text-gray-600 mb-4">Per month</p>
              <ul className="space-y-3">
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Fully furnished single AC</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Gourmet meals + snacks</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">Gym, housekeeping, parking</span>
                </li>
                <li className="flex items-start gap-2">
                  <CheckCircle2 className="h-5 w-5 text-blue-600 flex-shrink-0 mt-0.5" />
                  <span className="text-gray-700">MVP Colony, Rushikonda</span>
                </li>
              </ul>
            </div>
          </div>

          <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200">
            <div className="flex items-center gap-3 mb-6">
              <TrendingUp className="h-10 w-10 text-green-600" />
              <h3 className="text-2xl font-bold text-gray-900">Vizag PG is 30-40% Cheaper than Metro Cities</h3>
            </div>
            <div className="grid md:grid-cols-3 gap-6">
              <div>
                <h4 className="font-bold text-gray-900 mb-3">Vizag (Visakhapatnam)</h4>
                <div className="space-y-2">
                  <div className="flex justify-between items-center bg-white p-3 rounded-lg">
                    <span className="text-gray-600 text-sm">Sharing Room:</span>
                    <span className="font-bold text-green-600">₹4K-6K</span>
                  </div>
                  <div className="flex justify-between items-center bg-white p-3 rounded-lg">
                    <span className="text-gray-600 text-sm">Single Room:</span>
                    <span className="font-bold text-green-600">₹10K-12K</span>
                  </div>
                </div>
              </div>
              <div>
                <h4 className="font-bold text-gray-900 mb-3">Hyderabad</h4>
                <div className="space-y-2">
                  <div className="flex justify-between items-center bg-white p-3 rounded-lg">
                    <span className="text-gray-600 text-sm">Sharing Room:</span>
                    <span className="font-bold text-orange-600">₹8K-12K</span>
                  </div>
                  <div className="flex justify-between items-center bg-white p-3 rounded-lg">
                    <span className="text-gray-600 text-sm">Single Room:</span>
                    <span className="font-bold text-orange-600">₹15K-20K</span>
                  </div>
                </div>
              </div>
              <div>
                <h4 className="font-bold text-gray-900 mb-3">Bengaluru</h4>
                <div className="space-y-2">
                  <div className="flex justify-between items-center bg-white p-3 rounded-lg">
                    <span className="text-gray-600 text-sm">Sharing Room:</span>
                    <span className="font-bold text-red-600">₹9K-14K</span>
                  </div>
                  <div className="flex justify-between items-center bg-white p-3 rounded-lg">
                    <span className="text-gray-600 text-sm">Single Room:</span>
                    <span className="font-bold text-red-600">₹16K-22K</span>
                  </div>
                </div>
              </div>
            </div>
            <p className="text-sm text-gray-600 mt-6 text-center">
              * Prices include food, WiFi, and basic amenities. Vizag offers significant savings for students and working professionals.
            </p>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-b from-gray-50 to-white">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6">
            Price Trend & Demand Insight
          </h2>
          <p className="text-gray-700 leading-relaxed text-lg mb-8">
            Vizag's PG accommodation market is experiencing robust growth driven by multiple economic and demographic factors. <strong>Rising demand due to IT companies</strong> has been the primary catalyst, with tech giants like Infosys, TCS, Wipro, Tech Mahindra, and numerous startups establishing operations in Madhurawada IT SEZ, attracting thousands of young software professionals seeking convenient, affordable housing near workplaces. <strong>Expanding college infrastructure</strong> with GITAM University, Andhra University, engineering colleges, and professional institutions enrolling growing student populations creates consistent year-round demand for budget-friendly student accommodation near campuses. <strong>Startup ecosystem development</strong> has brought entrepreneurs, digital marketers, and freelancers preferring flexible co-living arrangements over traditional apartments. <strong>High occupancy in Madhurawada & Rushikonda areas</strong> reflects premium location demand, with IT corridor PG maintaining 85-95% occupancy throughout the year and beachside Rushikonda hostels near GITAM running at 90% capacity. This sustained high occupancy indicates strong market fundamentals, limited supply, and investor confidence. PG rent appreciation has remained moderate at 5-8% annually, significantly lower than property prices, ensuring continued affordability while providing stable returns for PG owners and operators in Visakhapatnam's thriving rental accommodation sector.
          </p>

          <div className="grid md:grid-cols-2 gap-8">
            <div className="bg-gradient-to-br from-blue-50 to-white p-8 rounded-2xl border-2 border-blue-200">
              <div className="flex items-center gap-3 mb-6">
                <TrendingUp className="h-10 w-10 text-blue-600" />
                <h3 className="text-2xl font-bold text-gray-900">Key Demand Drivers</h3>
              </div>
              <div className="space-y-4">
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-blue-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900 mb-1">IT Sector Boom</div>
                    <p className="text-gray-600 text-sm">Massive tech company expansion creating demand for 10,000+ IT professional accommodations annually</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-blue-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900 mb-1">Growing Student Population</div>
                    <p className="text-gray-600 text-sm">25,000+ students from other cities seeking affordable PG near GITAM, Andhra University, engineering colleges</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-blue-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900 mb-1">Startup Ecosystem</div>
                    <p className="text-gray-600 text-sm">Emerging startup culture with entrepreneurs, freelancers, and digital nomads seeking flexible co-living</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle2 className="h-6 w-6 text-blue-600 flex-shrink-0 mt-1" />
                  <div>
                    <div className="font-bold text-gray-900 mb-1">Industrial Growth</div>
                    <p className="text-gray-600 text-sm">Port expansion, manufacturing units, and special economic zones bringing industrial workforce to Vizag</p>
                  </div>
                </div>
              </div>
            </div>

            <div className="bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200">
              <div className="flex items-center gap-3 mb-6">
                <Users className="h-10 w-10 text-green-600" />
                <h3 className="text-2xl font-bold text-gray-900">High Occupancy Areas</h3>
              </div>
              <div className="space-y-4">
                <div className="bg-white p-4 rounded-xl border-2 border-green-200">
                  <div className="flex justify-between items-center mb-2">
                    <span className="font-bold text-gray-900">Madhurawada IT Corridor</span>
                    <span className="text-green-600 font-bold text-xl">95%</span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-3">
                    <div className="bg-green-600 h-3 rounded-full" style={{ width: '95%' }}></div>
                  </div>
                  <p className="text-sm text-gray-600 mt-2">Year-round high demand from IT professionals near tech parks</p>
                </div>

                <div className="bg-white p-4 rounded-xl border-2 border-green-200">
                  <div className="flex justify-between items-center mb-2">
                    <span className="font-bold text-gray-900">Rushikonda (Near GITAM)</span>
                    <span className="text-green-600 font-bold text-xl">90%</span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-3">
                    <div className="bg-green-600 h-3 rounded-full" style={{ width: '90%' }}></div>
                  </div>
                  <p className="text-sm text-gray-600 mt-2">Consistent occupancy from university students and beachside preference</p>
                </div>

                <div className="bg-white p-4 rounded-xl border-2 border-green-200">
                  <div className="flex justify-between items-center mb-2">
                    <span className="font-bold text-gray-900">MVP Colony Premium PG</span>
                    <span className="text-green-600 font-bold text-xl">85%</span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-3">
                    <div className="bg-green-600 h-3 rounded-full" style={{ width: '85%' }}></div>
                  </div>
                  <p className="text-sm text-gray-600 mt-2">Strong demand for premium facilities in established residential area</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-br from-blue-600 to-blue-700 text-white">
        <div className="max-w-4xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-bold mb-6">
            Ready to Find Your Perfect PG in Vizag?
          </h2>
          <p className="text-xl text-blue-50 mb-8">
            Get verified PG recommendations matching your budget, location, and amenity preferences
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <button
              onClick={handleAISearch}
              className="inline-flex items-center justify-center gap-2 bg-white text-blue-600 px-8 py-4 rounded-xl font-semibold text-lg hover:bg-blue-50 transition-colors"
            >
              <Search className="h-5 w-5" />
              Find PG & Hostels in Vizag with AI Search
            </button>
            <Link
              to="/add-property"
              className="inline-flex items-center justify-center gap-2 bg-green-500 hover:bg-green-600 text-white px-8 py-4 rounded-xl font-semibold text-lg transition-colors"
            >
              <Upload className="h-5 w-5" />
              Post PG / Hostel - Free
            </Link>
          </div>
        </div>
      </section>

      <div className="fixed bottom-4 right-4 z-40">
        <Link
          to="/add-property"
          className="bg-gradient-to-r from-green-600 to-green-700 hover:from-green-700 hover:to-green-800 text-white px-6 py-3 rounded-full font-bold shadow-2xl flex items-center gap-2 hover:scale-105 transition-all"
        >
          <Upload className="h-5 w-5" />
          Post PG - Free
        </Link>
      </div>

      <div className="fixed bottom-4 left-1/2 transform -translate-x-1/2 md:hidden z-40 w-[calc(100%-2rem)]">
        <div className="bg-white rounded-2xl shadow-2xl p-3 border-2 border-blue-500">
          <div className="flex gap-2">
            <input
              type="text"
              placeholder="Quick search PG..."
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

      {showBudgetPrompt && (
        <div className="fixed bottom-24 right-4 z-50 max-w-sm">
          <div className="bg-white rounded-2xl shadow-2xl p-6 border-2 border-blue-500 animate-bounce">
            <button
              onClick={() => setShowBudgetPrompt(false)}
              className="absolute top-2 right-2 text-gray-400 hover:text-gray-600"
            >
              ✕
            </button>
            <div className="flex items-center gap-3 mb-3">
              <Users className="h-8 w-8 text-blue-600" />
              <h3 className="font-bold text-gray-900">Still searching?</h3>
            </div>
            <p className="text-gray-700 mb-4">Tell us your budget & location for personalized recommendations!</p>
            <a
              href="https://wa.me/919182737473?text=Hi! I'm looking for PG in Vizag. Can you help me find options?"
              target="_blank"
              rel="noopener noreferrer"
              className="block text-center bg-blue-600 hover:bg-blue-700 text-white px-4 py-3 rounded-xl font-semibold transition-colors"
            >
              Chat Now
            </a>
          </div>
        </div>
      )}

    </div>
  )
}
