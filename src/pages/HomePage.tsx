import { useState, useEffect, useRef, useMemo } from 'react'
import { Link } from 'react-router-dom'
import { Search, Mic, MicOff, TrendingUp, Shield, Zap, CheckCircle, PhoneOff, DollarSign, Home, Building2, Store, MapPin, Users, ArrowRight, Key, X, MessageCircle } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { Property } from '../types'
import { AdvancedFilters } from '../types/filters'
import { LocationAutocomplete } from '../components/LocationAutocomplete'
import { ChatBot } from '../components/ChatBot'
import { AITypingAnimation } from '../components/AITypingAnimation'
import { AISearchSuggestions } from '../components/AISearchSuggestions'
import { WelcomeMessage } from '../components/WelcomeMessage'
import { AuthModal } from '../components/AuthModal'
import { StickySearchBar } from '../components/StickySearchBar'
import { MobileCategoryGrid } from '../components/MobileCategoryGrid'
import { MagicBricksSearchCard } from '../components/MagicBricksSearchCard'
import { PropertyActionCards } from '../components/PropertyActionCards'
import { FilterModal } from '../components/FilterModal'
import { useAuth } from '../contexts/AuthContext'
import { useSearch } from '../contexts/SearchContext'
import { useSearchHistory } from '../hooks/useSearchHistory'
import { useVoiceSearch } from '../hooks/useVoiceSearch'
import { openWhatsApp } from '../lib/whatsapp'
import { getLastSearch } from '../lib/searchMemory'
import RestoredSearchBanner from '../components/RestoredSearchBanner'
import PropertiesNearYou from '../components/PropertiesNearYou'
import { HomeBlogSection } from '../components/HomeBlogSection'

type PropertyCategory = 'full_house' | 'land_plot' | 'flat_apartment' | 'pg_hostel' | 'flatmates' | 'villa'

export function HomePage() {
  const { user } = useAuth()
  const { listingType, setListingType, propertyCategory: searchCategory, setPropertyCategory: setSearchCategory } = useSearch()
  const { lastSearch, saveSearch } = useSearchHistory()
  const { isListening, transcript, localityMatch, noMatchMessage, startListening, stopListening, resetTranscript, isSupported } = useVoiceSearch()
  const [propertyCategory, setPropertyCategory] = useState<PropertyCategory>('full_house')
  const [location, setLocation] = useState('Visakhapatnam')
  const [locality, setLocality] = useState('')
  const [localityId, setLocalityId] = useState<string | undefined>()
  const [featuredProperties, setFeaturedProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [showSuggestions, setShowSuggestions] = useState(false)
  const [showWelcome, setShowWelcome] = useState(false)
  const [showAuthModal, setShowAuthModal] = useState(false)
  const [showRestoredBanner, setShowRestoredBanner] = useState(false)
  const [restoredSearchData, setRestoredSearchData] = useState<{
    localityName: string
  } | null>(null)
  const searchInputRef = useRef<HTMLDivElement>(null)

  // Additional filter states
  const [minArea, setMinArea] = useState('')
  const [maxArea, setMaxArea] = useState('')
  const [areaUnit, setAreaUnit] = useState('sqft')
  const [saleType, setSaleType] = useState<string[]>([])
  const [postedBy, setPostedBy] = useState<string[]>([])
  const [furnishingStatus, setFurnishingStatus] = useState<string[]>([])
  const [amenities, setAmenities] = useState<string[]>([])
  const [selectedBedrooms, setSelectedBedrooms] = useState<string[]>([])
  const [possessionStatus, setPossessionStatus] = useState<string[]>([])
  const [showFilterModal, setShowFilterModal] = useState(false)
  const [filterCategory, setFilterCategory] = useState<'buy' | 'rent' | 'projects' | 'commercial'>('buy')
  const [filterCount, setFilterCount] = useState(0)
  const [advancedFilters, setAdvancedFilters] = useState<AdvancedFilters>({})
  const [propertySubType, setPropertySubType] = useState<'residential' | 'plot' | 'pg'>('residential')
  
  // Rent and PG/Hostel specific filter states
  const [tenantPreference, setTenantPreference] = useState<string[]>([])
  const [availableFrom, setAvailableFrom] = useState('')
  const [roomType, setRoomType] = useState('')
  const [foodIncluded, setFoodIncluded] = useState<boolean | undefined>(undefined)
  const [gender, setGender] = useState('')
  const [attachedBathroom, setAttachedBathroom] = useState<boolean | undefined>(undefined)
  const [minRent, setMinRent] = useState('')
  const [maxRent, setMaxRent] = useState('')

  const memoizedFilters = useMemo(() => advancedFilters, [advancedFilters])

  useEffect(() => {
    const params = new URLSearchParams(window.location.search)
    if (params.get('login') === 'true' && !user) {
      setShowAuthModal(true)
    }
    if (params.get('refresh') === '1') {
      loadFeaturedProperties()
      window.history.replaceState({}, '', '/')
    }
  }, [user])

  useEffect(() => {
    if (user && lastSearch) {
      setShowWelcome(true)
    }
  }, [user, lastSearch])

  useEffect(() => {
    const lastSearch = getLastSearch()
    if (lastSearch) {
      setRestoredSearchData({
        localityName: lastSearch.localityName
      })
      setShowRestoredBanner(true)
      loadRestoredSearchProperties(lastSearch)
    }
  }, [])

  useEffect(() => {
    if (transcript) {
      setLocality(transcript)
    }
  }, [transcript])

  useEffect(() => {
    if (localityMatch) {
      setLocality(localityMatch.locality_name)
    }
  }, [localityMatch])

  useEffect(() => {
    document.title = 'Vizag Real Estate: Buy, Sell & Rent Property in Visakhapatnam'

    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Find the best vizag real estate deals. Search vizag plots for sale, flats, villas, and houses in Madhurawada, PM Palem, Yendada. Vizag property prices with AI-powered search.')
    } else {
      const meta = document.createElement('meta')
      meta.name = 'description'
      meta.content = 'Find the best vizag real estate deals. Search vizag plots for sale, flats, villas, and houses in Madhurawada, PM Palem, Yendada. Vizag property prices with AI-powered search.'
      document.head.appendChild(meta)
    }

    const metaKeywords = document.querySelector('meta[name="keywords"]')
    if (metaKeywords) {
      metaKeywords.setAttribute('content', 'vizag real estate, vizag plots for sale, vizag house for sale, vizag flats for sale, vizag villas for sale, vizag real estate prices, vizag property, residential property in vizag')
    } else {
      const meta = document.createElement('meta')
      meta.name = 'keywords'
      meta.content = 'vizag real estate, vizag plots for sale, vizag house for sale, vizag flats for sale, vizag villas for sale, vizag real estate prices, vizag property, residential property in vizag'
      document.head.appendChild(meta)
    }

    const faqSchema = {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "What is the price of plots in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Vizag plot prices vary by location and size. Open plots in prime areas like Madhurawada and PM Palem range from ₹25 lakhs to ₹1 crore+ depending on proximity to IT SEZ and infrastructure. VMRDA approved plots in gated communities typically cost ₹3,000-₹8,000 per sq yard. Budget-friendly areas like Gajuwaka and Kommadi offer plots starting from ₹15-20 lakhs, while premium beachside locations like Yendada and Rushikonda can exceed ₹1.5 crore."
          }
        },
        {
          "@type": "Question",
          "name": "Which area is best to buy property in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "The best areas to buy property in Vizag depend on your needs: Madhurawada is ideal for IT professionals with excellent connectivity to IT SEZ and modern infrastructure. PM Palem offers affordable residential plots with good appreciation potential. Yendada provides premium beachside villas and luxury properties. MVP Colony is perfect for established neighborhoods with complete amenities. Rushikonda suits those seeking coastal living and investment opportunities near the beach."
          }
        },
        {
          "@type": "Question",
          "name": "Are VMRDA plots safe to buy in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Yes, VMRDA approved plots in Vizag are safe to buy. The Visakhapatnam Metropolitan Region Development Authority ensures all approved plots have clear title deeds, proper documentation, and legal compliance with urban planning regulations. VMRDA approval guarantees infrastructure development including roads, water supply, and electricity. Always verify VMRDA approval certificates, check land records, and ensure proper registration to avoid legal complications."
          }
        },
        {
          "@type": "Question",
          "name": "Is Vizag good for real estate investment?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Vizag is excellent for real estate investment due to multiple growth factors: expanding IT corridor in Madhurawada attracting tech companies, ongoing infrastructure projects including metro rail and port expansion, growing demand for residential and commercial properties, strong rental yields in IT hub areas (8-10% annually), government initiatives promoting industrial development, and strategic coastal location making it a prime business hub in Andhra Pradesh. Property values have shown consistent 10-15% annual appreciation in key localities."
          }
        }
      ]
    }

    const existingSchema = document.querySelector('script[type="application/ld+json"]')
    if (existingSchema) {
      existingSchema.textContent = JSON.stringify(faqSchema)
    } else {
      const script = document.createElement('script')
      script.type = 'application/ld+json'
      script.textContent = JSON.stringify(faqSchema)
      document.head.appendChild(script)
    }

    loadFeaturedProperties()
  }, [])

  const loadRestoredSearchProperties = async (searchData: {
    localityId: string
    propertyType: string
    listingType: string
  }) => {
    try {
      setLoading(true)

      const { buildUnifiedPropertyQuery } = await import('../lib/searchFilters')

      const query = buildUnifiedPropertyQuery({
        propertyType: searchData.propertyType as 'flat' | 'plot' | 'villa' | 'pg' | 'commercial',
        listingType: searchData.listingType as 'sale' | 'rent',
        localityId: searchData.localityId
      })

      const { data, error } = await query.limit(6)

      if (error) throw error
      setFeaturedProperties(data || [])
    } catch (error) {
      loadFeaturedProperties()
    } finally {
      setLoading(false)
    }
  }

  const loadFeaturedProperties = async () => {
    try {
      const { data, error } = await supabase
        .from('properties')
        .select('*')
        .eq('status', 'approved')
        .order('created_at', { ascending: false })
        .limit(6)

      if (error) throw error
      setFeaturedProperties(data || [])
    } catch (error) {
    } finally {
      setLoading(false)
    }
  }

  const toggleBedroom = (bhk: number) => {
    const bhkStr = String(bhk)
    if (selectedBedrooms.includes(bhkStr)) {
      setSelectedBedrooms(selectedBedrooms.filter(b => b !== bhkStr))
    } else {
      setSelectedBedrooms([...selectedBedrooms, bhkStr])
    }
  }

  const togglePossession = (status: string) => {
    const statusMap: { [key: string]: string } = {
      'Under Construction': 'under_construction',
      'Ready to Move': 'ready_to_move'
    }
    const dbValue = statusMap[status] || status
    if (possessionStatus.includes(dbValue)) {
      setPossessionStatus(possessionStatus.filter(s => s !== dbValue))
    } else {
      setPossessionStatus([...possessionStatus, dbValue])
    }
  }

  const handleAdvancedSearch = async () => {
    const searchType = searchCategory === 'commercial' ? 'commercial' : listingType

    if (user && locality) {
      await saveSearch(location, locality, searchType, locality)
    }

    const params = new URLSearchParams()

    // MANDATORY: property type based on category selection
    if (propertyCategory) params.append('category', propertyCategory)

    // OPTIONAL: Only add if explicitly set
    if (searchType) params.append('type', searchType)

    // OPTIONAL: Only add location/locality if provided
    if (localityId) {
      params.append('localityId', localityId)
    } else if (locality && locality.trim().length >= 3) {
      params.append('locality', locality.trim())
    }

    // OPTIONAL: Only add BHK filter if selected
    if (selectedBedrooms.length > 0) {
      params.append('bhk', selectedBedrooms.join(','))
    }

    // OPTIONAL: Only add property status if selected
    if (possessionStatus.length > 0) {
      params.append('status', possessionStatus.join(','))
    }

    // OPTIONAL: Only add area filters if set
    if (minArea) {
      params.append('minArea', minArea)
    }
    if (maxArea) {
      params.append('maxArea', maxArea)
    }
    if (areaUnit) {
      params.append('areaUnit', areaUnit)
    }

    // OPTIONAL: Add sale type filter
    if (saleType.length > 0) {
      params.append('saleType', saleType.join(','))
    }

    // OPTIONAL: Add posted by filter
    if (postedBy.length > 0) {
      params.append('postedBy', postedBy.join(','))
    }

    // OPTIONAL: Add furnishing status filter
    if (furnishingStatus.length > 0) {
      params.append('furnishing', furnishingStatus.join(','))
    }

    // OPTIONAL: Add amenities filter
    if (amenities.length > 0) {
      params.append('amenities', amenities.join(','))
    }
    
    // Rent specific parameters
    if (tenantPreference.length > 0) {
      params.append('tenantPreference', tenantPreference.join(','))
    }
    if (availableFrom) {
      params.append('availableFrom', availableFrom)
    }
    if (minRent) {
      params.append('minPrice', minRent)
    }
    if (maxRent) {
      params.append('maxPrice', maxRent)
    }
    
    // PG specific parameters
    if (roomType) {
      params.append('roomType', roomType)
    }
    if (foodIncluded !== undefined) {
      params.append('foodIncluded', foodIncluded.toString())
    }
    if (gender) {
      params.append('gender', gender)
    }
    if (attachedBathroom !== undefined) {
      params.append('attachedBathroom', attachedBathroom.toString())
    }

    window.location.href = `/properties?${params.toString()}`
  }

  const handleWelcomeSearch = () => {
    if (lastSearch?.locality) {
      setLocality(lastSearch.locality)
      setLocation(lastSearch.location || 'Visakhapatnam')
      const searchType = lastSearch.search_type || 'buy'
      if (searchType === 'commercial') {
        setSearchCategory('commercial')
      } else {
        setSearchCategory('residential')
        setListingType(searchType as 'buy' | 'rent')
      }
      setShowWelcome(false)
      setTimeout(() => {
        handleAdvancedSearch()
      }, 100)
    }
  }

  const handleSuggestionSelect = (query: string) => {
    setLocality(query)
    setShowSuggestions(false)
    handleAdvancedSearch()
  }

  const handleVoiceToggle = () => {
    if (isListening) {
      stopListening()
    } else {
      resetTranscript()
      startListening()
    }
  }

  const handleSearchCardClick = () => {
    setShowFilterModal(true)
  }

  const handlePostCardClick = () => {
    window.location.href = '/add-property'
  }

  const handleResetFilters = () => {
    setFilterCount(0)
    setAdvancedFilters({})
  }

  const handleApplyFilters = (
    filters: AdvancedFilters,
    category: 'buy' | 'rent' | 'projects' | 'commercial',
    subType: 'residential' | 'plot' | 'pg'
  ) => {
    setAdvancedFilters(filters)
    setPropertySubType(subType)

    const params = new URLSearchParams()

    if (category === 'buy' || category === 'projects') {
      params.append('type', 'sale')
    } else if (category === 'rent') {
      params.append('type', 'rent')
    } else if (category === 'commercial') {
      params.append('category', 'commercial')
    }

    if (subType === 'residential' && filters.propertyType) {
      params.append('propertyType', filters.propertyType)
    } else if (subType === 'plot') {
      params.append('propertyType', 'plot')
    } else if (subType === 'pg') {
      params.append('propertyType', 'pg')
    }

    if (localityId) {
      params.append('localityId', localityId)
    } else if (locality && locality.trim().length >= 3) {
      params.append('locality', locality.trim())
    }

    if (filters.bedrooms && Array.isArray(filters.bedrooms) && filters.bedrooms.length > 0) {
      params.append('bedrooms', filters.bedrooms.join(','))
    }

    if (filters.bathrooms && Array.isArray(filters.bathrooms) && filters.bathrooms.length > 0) {
      params.append('bathrooms', filters.bathrooms.join(','))
    }

    if (filters.furnishing && filters.furnishing.length > 0) {
      params.append('furnishing', filters.furnishing.join(','))
    }

    if (filters.possession && filters.possession.length > 0) {
      params.append('possession', filters.possession.join(','))
    }

    if (filters.saleType && filters.saleType.length > 0) {
      params.append('saleType', filters.saleType.join(','))
    }

    if (filters.amenities && filters.amenities.length > 0) {
      params.append('amenities', filters.amenities.join(','))
    }

    if (filters.coveredAreaMin) {
      params.append('minArea', filters.coveredAreaMin.toString())
    }

    if (filters.coveredAreaMax) {
      params.append('maxArea', filters.coveredAreaMax.toString())
    }

    if (filters.areaUnit) {
      params.append('areaUnit', filters.areaUnit)
    }

    if (filters.commercialType) {
      params.append('commercialType', filters.commercialType)
    }

    if (filters.facing && filters.facing.length > 0) {
      params.append('facing', filters.facing.join(','))
    }

    if (filters.boundaryWall !== undefined) {
      params.append('boundaryWall', filters.boundaryWall.toString())
    }

    if (filters.cornerPlot !== undefined) {
      params.append('cornerPlot', filters.cornerPlot.toString())
    }

    if (filters.tenantPreference && filters.tenantPreference.length > 0) {
      params.append('tenantPreference', filters.tenantPreference.join(','))
    }

    if (filters.availableFrom) {
      params.append('availableFrom', filters.availableFrom)
    }

    if (filters.roomType) {
      params.append('roomType', filters.roomType)
    }

    if (filters.foodIncluded !== undefined) {
      params.append('foodIncluded', filters.foodIncluded.toString())
    }

    if (filters.gender) {
      params.append('gender', filters.gender)
    }

    if (filters.attachedBathroom !== undefined) {
      params.append('attachedBathroom', filters.attachedBathroom.toString())
    }

    if (filters.parking !== undefined) {
      params.append('parking', filters.parking.toString())
    }

    if (filters.washroom !== undefined) {
      params.append('washroom', filters.washroom.toString())
    }

    window.location.href = `/properties?${params.toString()}`
  }

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      {showWelcome && lastSearch?.locality && (
        <WelcomeMessage
          locality={lastSearch.locality}
          onSearch={handleWelcomeSearch}
        />
      )}

      <StickySearchBar
        onSearch={(query) => {
          setLocality(query)
          handleAdvancedSearch()
        }}
        placeholder="Search locality (3+ letters)"
      />
      <MagicBricksSearchCard />
      <MobileCategoryGrid />

      <section id="search-section" className="relative py-8 md:py-16 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-6 md:mb-10">
            <h1 className="text-3xl md:text-5xl lg:text-6xl font-bold text-gray-900 mb-3 md:mb-4 leading-tight">
              Vizag Real Estate: Buy, Sell & Rent Property
            </h1>
            <p className="text-base md:text-lg lg:text-xl text-gray-600 max-w-3xl mx-auto leading-relaxed">
              Find vizag plots for sale, flats, villas & houses in Visakhapatnam with AI-powered search. Check vizag real estate prices and property listings across all localities.
            </p>
          </div>

          <PropertyActionCards
            onSearchClick={handleSearchCardClick}
            onPostClick={handlePostCardClick}
          />

          <div className="max-w-6xl mx-auto mb-8">
            <AITypingAnimation />

            <div className="mb-6 hidden md:flex flex-col items-center justify-center gap-2">
              <a
                href="/add-property"
                className="group bg-white text-primary-600 border-2 border-primary-600 px-8 py-3 rounded-full hover:bg-primary-50 transition-all font-bold text-base shadow-md hover:shadow-xl hover:scale-105 transform duration-200"
              >
                Post Property Free
              </a>
              <p className="text-xs text-gray-600 font-medium text-center">
                Get instant buyers & tenants in Vizag
              </p>
            </div>

            <div className="hidden md:block bg-white rounded-2xl shadow-xl border border-gray-200 overflow-hidden">
              <div className="flex border-b border-gray-200">
                <button
                  onClick={() => {
                    setSearchCategory('residential')
                    setListingType('buy')
                    setPropertyCategory('full_house')
                  }}
                  className={`flex-1 py-4 px-6 font-semibold text-center transition-all relative ${
                    listingType === 'buy' && searchCategory === 'residential'
                      ? 'text-primary-600 bg-primary-50'
                      : 'text-gray-600 hover:bg-gray-50'
                  }`}
                >
                  <div className="flex items-center justify-center gap-2">
                    <Home className="h-5 w-5" />
                    <span>Buy</span>
                  </div>
                  {listingType === 'buy' && searchCategory === 'residential' && (
                    <div className="absolute bottom-0 left-0 right-0 h-1 bg-primary-600"></div>
                  )}
                </button>

                <button
                  onClick={() => {
                    setSearchCategory('residential')
                    setListingType('rent')
                    setPropertyCategory('full_house')
                  }}
                  className={`flex-1 py-4 px-6 font-semibold text-center transition-all relative ${
                    listingType === 'rent' && searchCategory === 'residential'
                      ? 'text-rose-600 bg-rose-50'
                      : 'text-gray-600 hover:bg-gray-50'
                  }`}
                >
                  <div className="flex items-center justify-center gap-2">
                    <Building2 className="h-5 w-5" />
                    <span>Rent</span>
                  </div>
                  {listingType === 'rent' && searchCategory === 'residential' && (
                    <div className="absolute bottom-0 left-0 right-0 h-1 bg-rose-600"></div>
                  )}
                </button>

                <button
                  onClick={() => {
                    setSearchCategory('residential')
                    setListingType('projects')
                    setPropertyCategory('full_house')
                  }}
                  className={`flex-1 py-4 px-6 font-semibold text-center transition-all relative ${
                    listingType === 'projects' && searchCategory === 'residential'
                      ? 'text-green-600 bg-green-50'
                      : 'text-gray-600 hover:bg-gray-50'
                  }`}
                >
                  <div className="flex items-center justify-center gap-2">
                    <Building2 className="h-5 w-5" />
                    <span>Projects</span>
                  </div>
                  {listingType === 'projects' && searchCategory === 'residential' && (
                    <div className="absolute bottom-0 left-0 right-0 h-1 bg-green-600"></div>
                  )}
                </button>

                <button
                  onClick={() => {
                    setSearchCategory('commercial')
                    setListingType('commercial')
                    setPropertyCategory('full_house')
                  }}
                  className={`flex-1 py-4 px-6 font-semibold text-center transition-all relative ${
                    searchCategory === 'commercial'
                      ? 'text-orange-600 bg-orange-50'
                      : 'text-gray-600 hover:bg-gray-50'
                  }`}
                >
                  <div className="flex items-center justify-center gap-2">
                    <Store className="h-5 w-5" />
                    <span>Commercial</span>
                  </div>
                  {searchCategory === 'commercial' && (
                    <div className="absolute bottom-0 left-0 right-0 h-1 bg-orange-600"></div>
                  )}
                </button>
              </div>

              <div className="p-4 md:p-6">
                <div className="grid grid-cols-1 lg:grid-cols-12 gap-3 md:gap-4 mb-6">
                  <div className="lg:col-span-9">
                    <div className="relative" ref={searchInputRef}>
                      <LocationAutocomplete
                        value={locality}
                        onChange={(value, localityId) => {
                          setLocality(value)
                          setLocalityId(localityId)
                        }}
                        placeholder="Type 3+ characters to search Vizag localities (e.g., Madhurawada, Gajuwaka)"
                        className="h-12 border-4 border-red-600 text-base font-medium"
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
                        <div className="pointer-events-auto">
                          <button
                            onClick={() => openWhatsApp('Hi Vizag Property Experts, I am looking for a property in Vizag. Please assist.')}
                            className="p-2 rounded-lg transition-all text-green-600 hover:bg-green-50"
                            aria-label="Contact on WhatsApp"
                          >
                            <MessageCircle className="h-5 w-5" />
                          </button>
                        </div>
                      </div>
                      {showSuggestions && (
                        <AISearchSuggestions
                          onSelect={handleSuggestionSelect}
                          onClose={() => setShowSuggestions(false)}
                        />
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
                  </div>

                  <div className="lg:col-span-3">
                    <button
                      onClick={handleAdvancedSearch}
                      type="button"
                      className="w-full h-12 text-white px-6 py-3 rounded-full font-bold transition-all flex items-center justify-center gap-2 shadow-lg hover:shadow-xl bg-accent-500 hover:bg-accent-600"
                    >
                      <Search className="h-5 w-5" />
                      <span>Search</span>
                    </button>
                  </div>
                </div>

                {/* Rent Subcategory Tabs Pills */}
                {listingType === 'rent' && (
                  <div className="flex flex-wrap items-center gap-3 mt-4">
                    {[
                      { label: 'Full House', value: 'full_house', icon: Home },
                      { label: 'PG/Hostel', value: 'pg_hostel', icon: Users },
                      { label: 'Flatmates', value: 'flatmates', icon: Users },
                      { label: 'Flat/Apartment', value: 'flat_apartment', icon: Building2 }
                    ].map(type => (
                      <button
                        key={type.value}
                        type="button"
                        onClick={() => {
                          setPropertyCategory(type.value as PropertyCategory)
                        }}
                        className={`px-5 py-2.5 rounded-full font-semibold text-sm transition-all flex items-center gap-2 ${
                          propertyCategory === type.value
                            ? 'bg-rose-500 text-white shadow-lg'
                            : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                        }`}
                      >
                        <type.icon className="h-4 w-4" />
                        <span>{type.label}</span>
                      </button>
                    ))}
                  </div>
                )}

                {/* Buy Subcategory Tabs Pills */}
                {listingType === 'buy' && (
                  <div className="flex flex-wrap items-center gap-3 mt-4">
                    {[
                      { label: 'Full House', value: 'full_house', icon: Home },
                      { label: 'Flat/Apartment', value: 'flat_apartment', icon: Building2 },
                      { label: 'Plot/Land', value: 'land_plot', icon: MapPin }
                    ].map(type => (
                      <button
                        key={type.value}
                        type="button"
                        onClick={() => {
                          setPropertyCategory(type.value as PropertyCategory)
                        }}
                        className={`px-5 py-2.5 rounded-full font-semibold text-sm transition-all flex items-center gap-2 ${
                          propertyCategory === type.value
                            ? 'bg-primary-600 text-white shadow-lg'
                            : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                        }`}
                      >
                        <type.icon className="h-4 w-4" />
                        <span>{type.label}</span>
                      </button>
                    ))}
                  </div>
                )}

                {(listingType === 'buy' || listingType === 'rent' || listingType === 'projects' || listingType === 'commercial' || searchCategory === 'commercial') && (
                  <div className="space-y-3 border-t-2 border-gray-200 pt-4 mt-4">
                    <div className="bg-white rounded-2xl p-4 space-y-6">
                      <div className="flex items-center justify-between">
                        <h2 className="text-lg font-semibold">Filters</h2>
                        <button
                          onClick={() => {
                            setSelectedBedrooms([])
                            setPossessionStatus([])
                            setMinArea('')
                            setMaxArea('')
                            setAreaUnit('sqft')
                            setSaleType([])
                            setPostedBy([])
                            setFurnishingStatus([])
                            setAmenities([])
                          }}
                          className="text-sm text-red-600 font-medium"
                        >
                          Reset
                        </button>
                      </div>
                        {/* Rent Subcategory Switcher */}
                        {listingType === 'rent' && (
                          <div className="w-full">
                            <div className="flex gap-2 bg-gray-100 rounded-lg p-1 max-w-xs mb-4">
                              <button
                                type="button"
                                onClick={() => {
                                  setPropertyCategory('flat_apartment')
                                }}
                                className={`flex-1 py-2 px-4 rounded-md text-sm font-semibold transition-all ${
                                  propertyCategory !== 'pg_hostel'
                                    ? 'bg-white text-gray-900 shadow-sm'
                                    : 'text-gray-600 hover:text-gray-900'
                                }`}
                              >
                                House/Flat
                              </button>
                              <button
                                type="button"
                                onClick={() => {
                                  setPropertyCategory('pg_hostel')
                                }}
                                className={`flex-1 py-2 px-4 rounded-md text-sm font-semibold transition-all ${
                                  propertyCategory === 'pg_hostel'
                                    ? 'bg-white text-gray-900 shadow-sm'
                                    : 'text-gray-600 hover:text-gray-900'
                                }`}
                              >
                                PG/Hostel
                              </button>
                            </div>
                          </div>
                        )}

                        {listingType === 'rent' && propertyCategory === 'pg_hostel' ? (
                          <>
                            {/* Room Type */}
                            <div>
                              <label className="block text-sm font-semibold mb-3">Room Type</label>
                              <div className="flex flex-wrap gap-2">
                                {['Single', 'Double', 'Triple'].map(type => (
                                  <button
                                    key={type}
                                    type="button"
                                    onClick={() => setRoomType(type.toLowerCase())}
                                    className={`px-5 py-2.5 rounded-full text-sm border font-medium transition-all ${
                                      roomType === type.toLowerCase()
                                        ? 'bg-blue-50 border-blue-600 text-blue-600 font-semibold'
                                        : 'border-gray-300 text-gray-700 bg-white hover:border-gray-400'
                                    }`}
                                  >
                                    {type}
                                  </button>
                                ))}
                              </div>
                            </div>

                            {/* Food Included */}
                            <div>
                              <label className="block text-sm font-semibold mb-3">Food Included</label>
                              <div className="flex flex-wrap gap-2">
                                {[
                                  { label: 'Yes', value: true },
                                  { label: 'No', value: false }
                                ].map(option => (
                                  <button
                                    key={option.label}
                                    type="button"
                                    onClick={() => setFoodIncluded(option.value)}
                                    className={`px-5 py-2.5 rounded-full text-sm border font-medium transition-all ${
                                      foodIncluded === option.value
                                        ? 'bg-blue-50 border-blue-600 text-blue-600 font-semibold'
                                        : 'border-gray-300 text-gray-700 bg-white hover:border-gray-400'
                                    }`}
                                  >
                                    {option.label}
                                  </button>
                                ))}
                              </div>
                            </div>

                            {/* Gender */}
                            <div>
                              <label className="block text-sm font-semibold mb-3">Gender</label>
                              <div className="flex flex-wrap gap-2">
                                {['Male', 'Female', 'Any'].map(g => (
                                  <button
                                    key={g}
                                    type="button"
                                    onClick={() => setGender(g.toLowerCase())}
                                    className={`px-5 py-2.5 rounded-full text-sm border font-medium transition-all ${
                                      gender === g.toLowerCase()
                                        ? 'bg-blue-50 border-blue-600 text-blue-600 font-semibold'
                                        : 'border-gray-300 text-gray-700 bg-white hover:border-gray-400'
                                    }`}
                                  >
                                    {g}
                                  </button>
                                ))}
                              </div>
                            </div>

                            {/* Attached Bathroom */}
                            <div>
                              <label className="block text-sm font-semibold mb-3">Attached Bathroom</label>
                              <div className="flex flex-wrap gap-2">
                                {[
                                  { label: 'Yes', value: true },
                                  { label: 'No', value: false }
                                ].map(option => (
                                  <button
                                    key={option.label}
                                    type="button"
                                    onClick={() => setAttachedBathroom(option.value)}
                                    className={`px-5 py-2.5 rounded-full text-sm border font-medium transition-all ${
                                      attachedBathroom === option.value
                                        ? 'bg-blue-50 border-blue-600 text-blue-600 font-semibold'
                                        : 'border-gray-300 text-gray-700 bg-white hover:border-gray-400'
                                    }`}
                                  >
                                    {option.label}
                                  </button>
                                ))}
                              </div>
                            </div>

                            {/* Rent Range */}
                            <div>
                              <label className="block text-sm font-semibold mb-3">Rent Range</label>
                              <div className="grid grid-cols-2 gap-3">
                                <input
                                  type="number"
                                  placeholder="Min Rent"
                                  value={minRent}
                                  onChange={(e) => setMinRent(e.target.value)}
                                  className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white"
                                />
                                <input
                                  type="number"
                                  placeholder="Max Rent"
                                  value={maxRent}
                                  onChange={(e) => setMaxRent(e.target.value)}
                                  className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white"
                                />
                              </div>
                            </div>
                          </>
                        ) : (
                          <>
                            {/* Property Type */}
                            <div>
                              <label className="block text-sm font-semibold mb-3">Property Type</label>

                              <div className="grid grid-cols-3 gap-3">
                                {listingType === 'commercial' ? (
                                  [
                                    { label: 'Office', value: 'flat_apartment' },
                                    { label: 'Shop', value: 'full_house' },
                                    { label: 'Warehouse', value: 'land_plot' }
                                  ].map(type => (
                                    <button
                                      key={type.label}
                                      type="button"
                                      onClick={() => setPropertyCategory(type.value as PropertyCategory)}
                                      className={`p-4 rounded-xl border text-sm font-medium transition
                                      ${propertyCategory === type.value
                                        ? 'border-blue-600 bg-blue-50 text-blue-600'
                                        : 'border-gray-200 bg-white text-gray-700'
                                      }`}
                                    >
                                      {type.label}
                                    </button>
                                  ))
                                ) : listingType === 'rent' ? (
                                  [
                                    { label: 'Flat', value: 'flat_apartment' },
                                    { label: 'House', value: 'full_house' },
                                    { label: 'Villa', value: 'villa' }
                                  ].map(type => (
                                    <button
                                      key={type.label}
                                      type="button"
                                      onClick={() => setPropertyCategory(type.value as PropertyCategory)}
                                      className={`p-4 rounded-xl border text-sm font-medium transition
                                      ${propertyCategory === type.value
                                        ? 'border-blue-600 bg-blue-50 text-blue-600'
                                        : 'border-gray-200 bg-white text-gray-700'
                                      }`}
                                    >
                                      {type.label}
                                    </button>
                                  ))
                                ) : (
                                  [
                                    { label: 'Flat', value: 'flat_apartment' },
                                    { label: 'House/Villa', value: 'full_house' },
                                    { label: 'Plot', value: 'land_plot' }
                                  ].map(type => (
                                    <button
                                      key={type.value}
                                      type="button"
                                      onClick={() => setPropertyCategory(type.value as PropertyCategory)}
                                      className={`p-4 rounded-xl border text-sm font-medium transition
                                      ${propertyCategory === type.value
                                        ? 'border-blue-600 bg-blue-50 text-blue-600'
                                        : 'border-gray-200 bg-white text-gray-700'
                                      }`}
                                    >
                                      {type.label}
                                    </button>
                                  ))
                                )}
                              </div>
                            </div>

                        {/* No. of Bedrooms - Only for Flat/House/Villa */}
                        {(propertyCategory === 'flat_apartment' || propertyCategory === 'full_house' || propertyCategory === 'villa') && (
                          <div>
                            <label className="block text-sm font-semibold mb-3">No. of Bedrooms</label>

                            <div className="flex flex-wrap gap-2">
                              {[1, 2, 3, 4, 5].map(bhk => (
                                <button
                                  key={bhk}
                                  type="button"
                                  onClick={() => toggleBedroom(bhk)}
                                  className={`px-4 py-2 rounded-full text-sm border
                                  ${selectedBedrooms.includes(String(bhk))
                                    ? 'bg-blue-50 border-blue-600 text-blue-600'
                                    : 'border-gray-300 text-gray-700'
                                  }`}
                                >
                                  {bhk} BHK
                                </button>
                              ))}
                            </div>
                          </div>
                        )}

                        {/* Possession Status - Only for Buy / Sale */}
                        {listingType !== 'rent' && (propertyCategory === 'flat_apartment' || propertyCategory === 'full_house' || propertyCategory === 'villa') && (
                          <div>
                            <label className="block text-sm font-semibold mb-3">Possession Status</label>

                            <div className="flex flex-wrap gap-2">
                              {['Under Construction', 'Ready to Move'].map(status => (
                                <button
                                  key={status}
                                  type="button"
                                  onClick={() => togglePossession(status)}
                                  className={`px-4 py-2 rounded-full border text-sm
                                  ${possessionStatus.includes(status === 'Under Construction' ? 'under_construction' : 'ready_to_move')
                                    ? 'bg-blue-50 border-blue-600 text-blue-600'
                                    : 'border-gray-300 text-gray-700'
                                  }`}
                                >
                                  {status}
                                </button>
                              ))}
                            </div>
                          </div>
                        )}

                        {/* Covered Area */}
                        <div>
                          <label className="block text-sm font-semibold mb-3">Covered Area</label>

                          <div className="grid grid-cols-2 gap-3">
                            <input
                              type="number"
                              placeholder="Min"
                              value={minArea}
                              onChange={(e) => setMinArea(e.target.value)}
                              className="border rounded-lg px-3 py-2 bg-white"
                            />
                            <input
                              type="number"
                              placeholder="Max"
                              value={maxArea}
                              onChange={(e) => setMaxArea(e.target.value)}
                              className="border rounded-lg px-3 py-2 bg-white"
                            />
                          </div>

                          <select
                            value={areaUnit}
                            onChange={(e) => setAreaUnit(e.target.value)}
                            className="mt-3 w-full border rounded-lg px-3 py-2 bg-white"
                          >
                            <option value="sqft">Sqft</option>
                            <option value="sqyd">Sq.yd</option>
                            <option value="sqm">Sq.m</option>
                            <option value="acre">Acre</option>
                            <option value="cents">Cents</option>
                          </select>
                        </div>

                        {/* Sale Type - Only for Flat/House / Villa in Sale */}
                        {listingType !== 'rent' && (propertyCategory === 'flat_apartment' || propertyCategory === 'full_house' || propertyCategory === 'villa') && (
                          <div>
                            <label className="block text-sm font-semibold mb-3">Sale Type</label>
                            <div className="flex flex-wrap gap-2">
                              <button
                                type="button"
                                onClick={() => {
                                  if (saleType.includes('new')) {
                                    setSaleType(saleType.filter(t => t !== 'new'))
                                  } else {
                                    setSaleType([...saleType, 'new'])
                                  }
                                }}
                                className={`px-4 py-2 rounded-lg text-sm font-medium transition-all ${
                                  saleType.includes('new')
                                    ? 'bg-primary-600 text-white shadow-md'
                                    : 'bg-white border border-gray-300 text-gray-700 hover:border-primary-500'
                                }`}
                              >
                                + New
                              </button>
                              <button
                                type="button"
                                onClick={() => {
                                  if (saleType.includes('resale')) {
                                    setSaleType(saleType.filter(t => t !== 'resale'))
                                  } else {
                                    setSaleType([...saleType, 'resale'])
                                  }
                                }}
                                className={`px-4 py-2 rounded-lg text-sm font-medium transition-all ${
                                  saleType.includes('resale')
                                    ? 'bg-primary-600 text-white shadow-md'
                                    : 'bg-white border border-gray-300 text-gray-700 hover:border-primary-500'
                                }`}
                              >
                                + Resale
                              </button>
                            </div>
                          </div>
                        )}

                        {/* Posted By */}
                        <div>
                          <label className="block text-sm font-semibold mb-3">Posted By</label>
                          <div className="flex flex-wrap gap-2">
                            {['Agent', 'Owner', 'Builder'].map((type) => (
                              <button
                                key={type}
                                type="button"
                                onClick={() => {
                                  const lowerType = type.toLowerCase()
                                  if (postedBy.includes(lowerType)) {
                                    setPostedBy(postedBy.filter(p => p !== lowerType))
                                  } else {
                                    setPostedBy([...postedBy, lowerType])
                                  }
                                }}
                                className={`px-4 py-2 rounded-lg text-sm font-medium transition-all ${
                                  postedBy.includes(type.toLowerCase())
                                    ? 'bg-primary-600 text-white shadow-md'
                                    : 'bg-white border border-gray-300 text-gray-700 hover:border-primary-500'
                                }`}
                              >
                                + {type}
                              </button>
                            ))}
                          </div>
                        </div>

                        {/* Furnishing Status - Only for Flat/House/Villa */}
                        {(propertyCategory === 'flat_apartment' || propertyCategory === 'full_house' || propertyCategory === 'villa') && (
                          <div>
                            <label className="block text-sm font-semibold mb-3">Furnishing Status</label>
                            <div className="flex flex-wrap gap-2">
                              {['Furnished', 'Semi-Furnished', 'Unfurnished'].map((status) => (
                                <button
                                  key={status}
                                  type="button"
                                  onClick={() => {
                                    const lowerStatus = status.toLowerCase().replace('-', '_')
                                    if (furnishingStatus.includes(lowerStatus)) {
                                      setFurnishingStatus(furnishingStatus.filter(f => f !== lowerStatus))
                                    } else {
                                      setFurnishingStatus([...furnishingStatus, lowerStatus])
                                    }
                                  }}
                                  className={`px-4 py-2 rounded-lg text-sm font-medium transition-all ${
                                    furnishingStatus.includes(status.toLowerCase().replace('-', '_'))
                                      ? 'bg-primary-600 text-white shadow-md'
                                      : 'bg-white border border-gray-300 text-gray-700 hover:border-primary-500'
                                  }`}
                                >
                                  + {status}
                                </button>
                              ))}
                            </div>
                          </div>
                        )}

                        {/* Tenant Preference - Only for Rent */}
                        {listingType === 'rent' && (
                          <div>
                            <label className="block text-sm font-semibold mb-3">Tenant Preference</label>
                            <div className="flex flex-wrap gap-2">
                              {['Family', 'Bachelor', 'Company'].map((pref) => (
                                <button
                                  key={pref}
                                  type="button"
                                  onClick={() => {
                                    const lowerPref = pref.toLowerCase()
                                    if (tenantPreference.includes(lowerPref)) {
                                      setTenantPreference(tenantPreference.filter(p => p !== lowerPref))
                                    } else {
                                      setTenantPreference([...tenantPreference, lowerPref])
                                    }
                                  }}
                                  className={`px-4 py-2 rounded-lg text-sm font-medium transition-all ${
                                    tenantPreference.includes(pref.toLowerCase())
                                      ? 'bg-primary-600 text-white shadow-md'
                                      : 'bg-white border border-gray-300 text-gray-700 hover:border-primary-500'
                                  }`}
                                >
                                  + {pref}
                                </button>
                              ))}
                            </div>
                          </div>
                        )}

                        {/* Available From - Only for Rent */}
                        {listingType === 'rent' && (
                          <div>
                            <label className="block text-sm font-semibold mb-3">Available From</label>
                            <input
                              type="date"
                              value={availableFrom}
                              onChange={(e) => setAvailableFrom(e.target.value)}
                              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white"
                            />
                          </div>
                        )}

                        {/* Rent / Budget Range */}
                        <div>
                          <label className="block text-sm font-semibold mb-3">
                            {listingType === 'rent' ? 'Rent Range' : 'Budget Range'}
                          </label>
                          <div className="grid grid-cols-2 gap-3">
                            <input
                              type="number"
                              placeholder={listingType === 'rent' ? 'Min Rent' : 'Min'}
                              value={listingType === 'rent' ? minRent : minArea}
                              onChange={(e) => {
                                if (listingType === 'rent') {
                                  setMinRent(e.target.value)
                                } else {
                                  setMinArea(e.target.value)
                                }
                              }}
                              className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white"
                            />
                            <input
                              type="number"
                              placeholder={listingType === 'rent' ? 'Max Rent' : 'Max'}
                              value={listingType === 'rent' ? maxRent : maxArea}
                              onChange={(e) => {
                                if (listingType === 'rent') {
                                  setMaxRent(e.target.value)
                                } else {
                                  setMaxArea(e.target.value)
                                }
                              }}
                              className="border border-gray-300 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-white"
                            />
                          </div>
                        </div>

                        {/* Amenities - Only for Flat/House */}
                        {(propertyCategory === 'flat_apartment' || propertyCategory === 'full_house' || propertyCategory === 'villa') && (
                          <div>
                            <label className="block text-sm font-semibold mb-3">Amenities</label>
                            <div className="flex flex-wrap gap-2">
                              {['Parking', 'Gym', 'Swimming Pool', 'Security'].map((amenity) => (
                                <button
                                  key={amenity}
                                  type="button"
                                  onClick={() => {
                                    const lowerAmenity = amenity.toLowerCase().replace(' ', '_')
                                    if (amenities.includes(lowerAmenity)) {
                                      setAmenities(amenities.filter(a => a !== lowerAmenity))
                                    } else {
                                      setAmenities([...amenities, lowerAmenity])
                                    }
                                  }}
                                  className={`px-4 py-2 rounded-lg text-sm font-medium transition-all ${
                                    amenities.includes(amenity.toLowerCase().replace(' ', '_'))
                                      ? 'bg-primary-600 text-white shadow-md'
                                      : 'bg-white border border-gray-300 text-gray-700 hover:border-primary-500'
                                  }`}
                                >
                                  + {amenity}
                                </button>
                              ))}
                            </div>
                          </div>
                        )}
                          </>
                        )}
                    </div>

                    <div className="sticky bottom-0 bg-white pt-4 pb-2">
                      <button
                        onClick={handleAdvancedSearch}
                        className="w-full bg-red-600 text-white py-4 rounded-full font-semibold text-base"
                      >
                        View Properties
                      </button>
                    </div>
                  </div>
                )}
              </div>
            </div>
          </div>

          <div className="max-w-6xl mx-auto mb-12">
            <div className="mb-10">
              <h2 className="text-3xl sm:text-4xl md:text-5xl font-bold text-gray-900 mb-4">
                Best Areas to Buy Plots in Vizag
              </h2>
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
              <a
                href="/vizag/madhurawada"
                className="group bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all overflow-hidden"
              >
                <div className="bg-gradient-to-br from-blue-700 to-blue-800 p-6">
                  <MapPin className="h-10 w-10 text-white mb-3" />
                  <h3 className="text-2xl font-bold text-white mb-1">
                    Madhurawada
                  </h3>
                  <p className="text-blue-100 text-sm">
                    IT Hub & Premium Locality
                  </p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4 leading-relaxed">
                    Prime location near IT SEZ with excellent connectivity and modern infrastructure.
                  </p>
                  <div className="flex items-center text-blue-700 font-bold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1" />
                  </div>
                </div>
              </a>

              <a
                href="/vizag/pm-palem"
                className="group bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all overflow-hidden"
              >
                <div className="bg-gradient-to-br from-green-600 to-green-700 p-6">
                  <MapPin className="h-10 w-10 text-white mb-3" />
                  <h3 className="text-2xl font-bold text-white mb-1">
                    PM Palem
                  </h3>
                  <p className="text-green-100 text-sm">
                    Affordable Residential Hub
                  </p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4 leading-relaxed">
                    Growing residential area with good appreciation potential and family-friendly environment.
                  </p>
                  <div className="flex items-center text-green-600 font-bold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1" />
                  </div>
                </div>
              </a>

              <a
                href="/vizag/yendada"
                className="group bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all overflow-hidden"
              >
                <div className="bg-gradient-to-br from-orange-600 to-orange-700 p-6">
                  <MapPin className="h-10 w-10 text-white mb-3" />
                  <h3 className="text-2xl font-bold text-white mb-1">
                    Yendada
                  </h3>
                  <p className="text-orange-100 text-sm">
                    Premium Beachside Living
                  </p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4 leading-relaxed">
                    Luxury beachfront properties with scenic coastal views and premium amenities.
                  </p>
                  <div className="flex items-center text-orange-600 font-bold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1" />
                  </div>
                </div>
              </a>

              <a
                href="/vizag/mvp-colony"
                className="group bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all overflow-hidden"
              >
                <div className="bg-gradient-to-br from-blue-600 to-blue-700 p-6">
                  <MapPin className="h-10 w-10 text-white mb-3" />
                  <h3 className="text-2xl font-bold text-white mb-1">
                    MVP Colony
                  </h3>
                  <p className="text-blue-100 text-sm">
                    Established Prime Area
                  </p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4 leading-relaxed">
                    Well-established locality with complete amenities and excellent infrastructure.
                  </p>
                  <div className="flex items-center text-blue-600 font-bold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1" />
                  </div>
                </div>
              </a>

              <a
                href="/vizag/gajuwaka"
                className="group bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all overflow-hidden"
              >
                <div className="bg-gradient-to-br from-teal-600 to-teal-700 p-6">
                  <MapPin className="h-10 w-10 text-white mb-3" />
                  <h3 className="text-2xl font-bold text-white mb-1">
                    Gajuwaka
                  </h3>
                  <p className="text-teal-100 text-sm">
                    Budget-Friendly Investment
                  </p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4 leading-relaxed">
                    Affordable properties with high rental yields and strong growth potential.
                  </p>
                  <div className="flex items-center text-teal-600 font-bold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1" />
                  </div>
                </div>
              </a>

              <a
                href="/properties?q=rushikonda"
                className="group bg-white rounded-2xl shadow-lg hover:shadow-2xl transition-all overflow-hidden"
              >
                <div className="bg-gradient-to-br from-cyan-600 to-cyan-700 p-6">
                  <MapPin className="h-10 w-10 text-white mb-3" />
                  <h3 className="text-2xl font-bold text-white mb-1">
                    Rushikonda
                  </h3>
                  <p className="text-cyan-100 text-sm">
                    Coastal Paradise
                  </p>
                </div>
                <div className="p-6">
                  <p className="text-gray-700 mb-4 leading-relaxed">
                    Beachfront properties with panoramic ocean views and resort-style living.
                  </p>
                  <div className="flex items-center text-cyan-600 font-bold group-hover:gap-2 transition-all">
                    View Properties <ArrowRight className="h-5 w-5 ml-1" />
                  </div>
                </div>
              </a>
            </div>
          </div>

          <div className="max-w-6xl mx-auto mb-12">
            <div className="text-center mb-8">
              <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-2">
                Browse by Property Type
              </h2>
              <p className="text-gray-600">Explore different property categories across Visakhapatnam</p>
            </div>
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
              <Link
                to="/vmrda-approved-plots-vizag"
                className="group bg-gradient-to-br from-primary-50 to-white p-8 rounded-2xl border-2 border-primary-200 hover:border-primary-500 hover:shadow-2xl transition-all"
              >
                <div className="bg-primary-600 w-16 h-16 rounded-full flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <MapPin className="h-8 w-8 text-white" />
                </div>
                <h3 className="text-xl font-bold text-gray-900 mb-3">VMRDA Approved Plots</h3>
                <p className="text-gray-700 mb-4">
                  100% legal plots with VMRDA approval. Safe investment with 180% appreciation potential.
                </p>
                <div className="flex items-center text-primary-600 font-semibold group-hover:gap-2 transition-all">
                  View Plots <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                </div>
              </Link>

              <Link
                to="/residential-property-in-vizag"
                className="group bg-gradient-to-br from-green-50 to-white p-8 rounded-2xl border-2 border-green-200 hover:border-green-500 hover:shadow-2xl transition-all"
              >
                <div className="bg-green-600 w-16 h-16 rounded-full flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <Home className="h-8 w-8 text-white" />
                </div>
                <h3 className="text-xl font-bold text-gray-900 mb-3">Residential Property</h3>
                <p className="text-gray-700 mb-4">
                  Houses, villas, and independent homes in prime Vizag localities.
                </p>
                <div className="flex items-center text-green-600 font-semibold group-hover:gap-2 transition-all">
                  View Properties <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                </div>
              </Link>

              <Link
                to="/flats-for-sale-in-vizag"
                className="group bg-gradient-to-br from-blue-50 to-white p-8 rounded-2xl border-2 border-blue-200 hover:border-blue-500 hover:shadow-2xl transition-all"
              >
                <div className="bg-blue-600 w-16 h-16 rounded-full flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <Building2 className="h-8 w-8 text-white" />
                </div>
                <h3 className="text-xl font-bold text-gray-900 mb-3">Flats for Sale</h3>
                <p className="text-gray-700 mb-4">
                  2 BHK, 3 BHK apartments in Madhurawada, MVP Colony, and other areas.
                </p>
                <div className="flex items-center text-blue-600 font-semibold group-hover:gap-2 transition-all">
                  View Flats <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                </div>
              </Link>

              <Link
                to="/flats-for-rent-vizag"
                className="group bg-gradient-to-br from-orange-50 to-white p-8 rounded-2xl border-2 border-orange-200 hover:border-orange-500 hover:shadow-2xl transition-all"
              >
                <div className="bg-orange-600 w-16 h-16 rounded-full flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <Key className="h-8 w-8 text-white" />
                </div>
                <h3 className="text-xl font-bold text-gray-900 mb-3">Flats for Rent</h3>
                <p className="text-gray-700 mb-4">
                  Rental apartments from ₹8,000/month. 1 BHK, 2 BHK, 3 BHK options available.
                </p>
                <div className="flex items-center text-orange-600 font-semibold group-hover:gap-2 transition-all">
                  View Rentals <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                </div>
              </Link>

              <Link
                to="/pg-hostels-in-vizag"
                className="group bg-gradient-to-br from-purple-50 to-white p-8 rounded-2xl border-2 border-purple-200 hover:border-purple-500 hover:shadow-2xl transition-all"
              >
                <div className="bg-purple-600 w-16 h-16 rounded-full flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <Users className="h-8 w-8 text-white" />
                </div>
                <h3 className="text-xl font-bold text-gray-900 mb-3">PG & Hostels</h3>
                <p className="text-gray-700 mb-4">
                  Affordable PG accommodations for students and professionals across Vizag.
                </p>
                <div className="flex items-center text-purple-600 font-semibold group-hover:gap-2 transition-all">
                  View PG Options <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                </div>
              </Link>

              <Link
                to="/gated-community-plots-vizag"
                className="group bg-gradient-to-br from-teal-50 to-white p-8 rounded-2xl border-2 border-teal-200 hover:border-teal-500 hover:shadow-2xl transition-all"
              >
                <div className="bg-teal-600 w-16 h-16 rounded-full flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                  <Shield className="h-8 w-8 text-white" />
                </div>
                <h3 className="text-xl font-bold text-gray-900 mb-3">Gated Community Plots</h3>
                <p className="text-gray-700 mb-4">
                  Premium plots in secure gated communities with world-class amenities.
                </p>
                <div className="flex items-center text-teal-600 font-semibold group-hover:gap-2 transition-all">
                  View Communities <ArrowRight className="h-5 w-5 ml-1 group-hover:translate-x-1 transition-transform" />
                </div>
              </Link>
            </div>
          </div>

          <div className="flex flex-wrap justify-center gap-3 mb-8">
            {['Vizag Plots for Sale', 'Vizag Villas for Sale', 'Vizag Flats for Sale', 'Vizag House for Sale'].map((tag) => (
              <button
                key={tag}
                onClick={() => {
                  window.location.href = `/properties?q=${encodeURIComponent(tag)}`
                }}
                className="px-5 py-2.5 bg-white text-gray-700 rounded-full hover:bg-primary-600 hover:text-white transition-all border-2 border-gray-200 hover:border-primary-600 shadow-sm hover:shadow-lg font-medium"
              >
                {tag}
              </button>
            ))}
          </div>

          <div className="max-w-4xl mx-auto mb-12">
            <div className="bg-gradient-to-br from-primary-50 to-white rounded-2xl px-8 py-6 border border-primary-100 shadow-sm">
              <p className="text-gray-700 text-sm md:text-base leading-relaxed text-center">
                Vizag real estate market offers prime vizag plots for sale, vizag house for sale, and vizag villas for sale across top localities like Madhurawada, Yendada, and MVP Colony. Find open plots in vizag, independent houses, and gated community properties with transparent vizag real estate prices. Whether you're looking for residential property in vizag or commercial spaces, our AI-powered platform helps you discover verified listings. Search vizag flats for sale and rent with instant WhatsApp connectivity to property owners across Visakhapatnam.
              </p>
            </div>
          </div>

          <div className="max-w-4xl mx-auto">
            <div className="bg-white/80 backdrop-blur-sm rounded-2xl px-8 py-6 border border-gray-200 shadow-sm">
              <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div className="flex items-center justify-center md:justify-start gap-3">
                  <CheckCircle className="h-5 w-5 text-green-600 flex-shrink-0" />
                  <span className="text-sm font-medium text-gray-800">
                    AI does not rank listings by payment
                  </span>
                </div>
                <div className="flex items-center justify-center md:justify-start gap-3">
                  <PhoneOff className="h-5 w-5 text-green-600 flex-shrink-0" />
                  <span className="text-sm font-medium text-gray-800">
                    No spam calls
                  </span>
                </div>
                <div className="flex items-center justify-center md:justify-start gap-3">
                  <DollarSign className="h-5 w-5 text-green-600 flex-shrink-0" />
                  <span className="text-sm font-medium text-gray-800">
                    Explainable pricing
                  </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-white">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-3">
              Frequently Asked Questions
            </h2>
            <p className="text-gray-600">
              Everything you need to know about Vizag real estate
            </p>
          </div>

          <div className="space-y-6">
            <div className="bg-gradient-to-br from-white to-gray-50 border-2 border-gray-200 rounded-2xl p-6 hover:border-primary-500 hover:shadow-lg transition-all">
              <h3 className="text-xl font-bold text-gray-900 mb-3">
                What is the price of plots in Vizag?
              </h3>
              <p className="text-gray-700 leading-relaxed">
                Vizag plot prices vary by location and size. Open plots in prime areas like Madhurawada and PM Palem range from ₹25 lakhs to ₹1 crore+ depending on proximity to IT SEZ and infrastructure. VMRDA approved plots in gated communities typically cost ₹3,000-₹8,000 per sq yard. Budget-friendly areas like Gajuwaka and Kommadi offer plots starting from ₹15-20 lakhs, while premium beachside locations like Yendada and Rushikonda can exceed ₹1.5 crore.
              </p>
            </div>

            <div className="bg-gradient-to-br from-white to-gray-50 border-2 border-gray-200 rounded-2xl p-6 hover:border-primary-500 hover:shadow-lg transition-all">
              <h3 className="text-xl font-bold text-gray-900 mb-3">
                Which area is best to buy property in Vizag?
              </h3>
              <p className="text-gray-700 leading-relaxed">
                The best areas to buy property in Vizag depend on your needs: <strong>Madhurawada</strong> is ideal for IT professionals with excellent connectivity to IT SEZ and modern infrastructure. <strong>PM Palem</strong> offers affordable residential plots with good appreciation potential. <strong>Yendada</strong> provides premium beachside villas and luxury properties. <strong>MVP Colony</strong> is perfect for established neighborhoods with complete amenities. <strong>Rushikonda</strong> suits those seeking coastal living and investment opportunities near the beach.
              </p>
            </div>

            <div className="bg-gradient-to-br from-white to-gray-50 border-2 border-gray-200 rounded-2xl p-6 hover:border-primary-500 hover:shadow-lg transition-all">
              <h3 className="text-xl font-bold text-gray-900 mb-3">
                Are VMRDA plots safe to buy in Vizag?
              </h3>
              <p className="text-gray-700 leading-relaxed">
                Yes, VMRDA approved plots in Vizag are safe to buy. The Visakhapatnam Metropolitan Region Development Authority ensures all approved plots have clear title deeds, proper documentation, and legal compliance with urban planning regulations. VMRDA approval guarantees infrastructure development including roads, water supply, and electricity. Always verify VMRDA approval certificates, check land records, and ensure proper registration to avoid legal complications.
              </p>
            </div>

            <div className="bg-gradient-to-br from-white to-gray-50 border-2 border-gray-200 rounded-2xl p-6 hover:border-primary-500 hover:shadow-lg transition-all">
              <h3 className="text-xl font-bold text-gray-900 mb-3">
                Is Vizag good for real estate investment?
              </h3>
              <p className="text-gray-700 leading-relaxed">
                Vizag is excellent for real estate investment due to multiple growth factors: expanding IT corridor in Madhurawada attracting tech companies, ongoing infrastructure projects including metro rail and port expansion, growing demand for residential and commercial properties, strong rental yields in IT hub areas (8-10% annually), government initiatives promoting industrial development, and strategic coastal location making it a prime business hub in Andhra Pradesh. Property values have shown consistent 10-15% annual appreciation in key localities.
              </p>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4 bg-gradient-to-b from-white to-gray-50">
        <div className="max-w-7xl mx-auto">
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 md:gap-8 mb-16">
            <div className="bg-gradient-to-br from-white to-primary-50 p-6 rounded-2xl shadow-lg border border-primary-100 text-center hover:shadow-xl transition-all hover:-translate-y-1 duration-300">
              <div className="bg-gradient-to-br from-primary-500 to-primary-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4 shadow-lg">
                <Zap className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900 mb-2">AI-Powered Search</h3>
              <p className="text-gray-600 text-sm">
                Natural language search understands what you want
              </p>
            </div>

            <div className="bg-gradient-to-br from-white to-primary-50 p-6 rounded-2xl shadow-lg border border-primary-100 text-center hover:shadow-xl transition-all hover:-translate-y-1 duration-300">
              <div className="bg-gradient-to-br from-primary-500 to-primary-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4 shadow-lg">
                <Mic className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900 mb-2">Voice Assistant</h3>
              <p className="text-gray-600 text-sm">
                Search hands-free with voice commands
              </p>
            </div>

            <div className="bg-gradient-to-br from-white to-primary-50 p-6 rounded-2xl shadow-lg border border-primary-100 text-center hover:shadow-xl transition-all hover:-translate-y-1 duration-300">
              <div className="bg-gradient-to-br from-primary-500 to-primary-600 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4 shadow-lg">
                <Shield className="h-8 w-8 text-white" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900 mb-2">Verified Listings</h3>
              <p className="text-gray-600 text-sm">
                All properties verified by our team
              </p>
            </div>
          </div>

          {showRestoredBanner && restoredSearchData && (
            <RestoredSearchBanner
              localityName={restoredSearchData.localityName}
              onDismiss={() => setShowRestoredBanner(false)}
            />
          )}

          <PropertiesNearYou />

          {featuredProperties.length > 0 && (
            <>
              <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between mb-8 gap-4">
                <div>
                  <h2 className="text-2xl sm:text-3xl font-bold text-gray-900 mb-2 bg-gradient-to-r from-primary-600 to-primary-800 bg-clip-text text-transparent">
                    {showRestoredBanner ? 'Matching Properties' : 'Featured Properties'}
                  </h2>
                  <p className="text-gray-600">
                    {showRestoredBanner ? 'Based on your last search' : 'Handpicked properties just for you'}
                  </p>
                </div>
                <a
                  href="/properties"
                  className="text-primary-600 hover:text-primary-700 font-semibold flex items-center gap-1 px-4 py-2 bg-primary-50 hover:bg-primary-100 rounded-lg transition-all"
                >
                  View All
                  <TrendingUp className="h-4 w-4" />
                </a>
              </div>

              {loading ? (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
                  {[1, 2, 3].map((i) => (
                    <div key={i} className="bg-gradient-to-br from-gray-100 to-gray-200 h-80 rounded-2xl animate-pulse shadow-lg" />
                  ))}
                </div>
              ) : (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8">
                  {featuredProperties.map((property) => (
                    <div key={property.id} className="animate-slide-up">
                      <div className="bg-white rounded-lg shadow-md p-4 border border-gray-200">
                        <h3 className="font-bold text-lg mb-2">{property.title}</h3>
                        <p className="text-gray-600 text-sm mb-2">{property.description}</p>
                        <p className="text-primary-600 font-bold">₹{property.price?.toLocaleString()}</p>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </>
          )}
        </div>
      </section>

      <HomeBlogSection />

      <ChatBot />
      {showAuthModal && (
        <AuthModal onClose={() => setShowAuthModal(false)} />
      )}
      <FilterModal
        isOpen={showFilterModal}
        onClose={() => setShowFilterModal(false)}
        selectedCategory={filterCategory}
        onCategoryChange={setFilterCategory}
        filterCount={filterCount}
        onReset={handleResetFilters}
        onApply={handleApplyFilters}
        initialFilters={memoizedFilters}
        initialSubType={propertySubType}
      />
    </div>
  )
}
