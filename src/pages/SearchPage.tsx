import { useState, useEffect } from 'react'
import { Search, ChevronLeft, MessageCircle, Plus, MapPin, Mic } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import { PropertyCard } from '../components/PropertyCard'
import { usePropertySearch } from '../hooks/usePropertySearch'
import { LocationAutocomplete } from '../components/LocationAutocomplete'
import { VIZAG_PROPERTY_PHONE_WITH_CODE } from '../config/contact'

export function SearchPage() {
  const navigate = useNavigate()

  const [listingType, setListingType] = useState<'buy' | 'rent' | 'commercial'>('buy')
  const [propertyCategory, setPropertyCategory] = useState<'residential' | 'commercial'>('residential')
  const [locality, setLocality] = useState('')
  const [localityId, setLocalityId] = useState<string | undefined>()
  const [hasSearched, setHasSearched] = useState(false)

  const { properties, loading, error, search } = usePropertySearch()

  useEffect(() => {
    setListingType('buy')
    setPropertyCategory('residential')
  }, [])

  const startVoiceSearch = () => {
    const SpeechRecognition =
      (window as any).SpeechRecognition || (window as any).webkitSpeechRecognition

    if (!SpeechRecognition) {
      alert('Voice search not supported')
      return
    }

    const recognition = new SpeechRecognition()
    recognition.lang = 'en-IN'
    recognition.start()

    recognition.onresult = (event: any) => {
      const transcript = event.results[0][0].transcript.trim()
      setLocality(transcript)
    }
  }

  const getPropertyType = () => {
    if (propertyCategory === 'commercial') return 'commercial'
    return 'flat'
  }

  const handleSearch = async () => {
    if (locality.trim().length < 3) return

    setHasSearched(true)

    await search({
      propertyType: getPropertyType(),
      listingType: listingType === 'rent' ? 'rent' : 'sale',
      localityId,
      localityName: locality.trim()
    })
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-20">

      {/* HEADER */}
      <div className="sticky top-0 z-40 bg-white px-4 pt-4 pb-3 shadow-sm">
        <div className="flex items-center gap-2 mb-3">
          <button onClick={() => navigate('/')} className="p-2 rounded-lg hover:bg-gray-100">
            <ChevronLeft className="h-5 w-5 text-gray-600" />
          </button>
          <h1 className="text-lg font-bold">Search Property</h1>
        </div>

        {/* BUY / RENT / COMMERCIAL */}
        <div className="flex rounded-xl overflow-hidden border border-gray-200 mb-3">
          {['buy', 'rent', 'commercial'].map((type) => (
            <button
              key={type}
              onClick={() => setListingType(type as any)}
              className={`flex-1 py-2 text-sm font-semibold ${
                listingType === type
                  ? type === 'buy'
                    ? 'bg-blue-600 text-white'
                    : type === 'rent'
                    ? 'bg-red-500 text-white'
                    : 'bg-purple-600 text-white'
                  : 'bg-white text-gray-600'
              }`}
            >
              {type.toUpperCase()}
            </button>
          ))}
        </div>

        {/* RESIDENTIAL / COMMERCIAL CATEGORY */}
        {listingType !== 'commercial' && (
          <div className="flex gap-2 mb-3">
            {['residential', 'commercial'].map((cat) => (
              <button
                key={cat}
                onClick={() => setPropertyCategory(cat as any)}
                className={`flex-1 py-2 rounded-lg text-sm font-medium border ${
                  propertyCategory === cat
                    ? 'bg-blue-50 border-blue-600 text-blue-700'
                    : 'bg-white border-gray-300'
                }`}
              >
                {cat.charAt(0).toUpperCase() + cat.slice(1)}
              </button>
            ))}
          </div>
        )}

        {/* LOCATION INPUT */}
        <div className="relative mb-3">
          <LocationAutocomplete
            value={locality}
            onChange={(value, id) => {
              setLocality(value)
              setLocalityId(id)
            }}
            placeholder="Type 3+ characters to search Vizag localities"
            className="h-11 pr-12 text-sm"
          />
          <button
            type="button"
            onClick={startVoiceSearch}
            className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-500"
          >
            <Mic className="w-5 h-5" />
          </button>
        </div>

        <button
          onClick={handleSearch}
          disabled={locality.trim().length < 3}
          className="w-full bg-orange-500 text-white py-3 rounded-xl font-semibold text-sm disabled:opacity-50"
        >
          <Search className="inline w-4 h-4 mr-2" />
          Search
        </button>
      </div>

      {/* RESULTS */}
      <div className="px-4 py-4">

        {!hasSearched && (
          <div className="text-center py-10">
            <MapPin className="h-14 w-14 text-gray-300 mx-auto mb-3" />
            <h3 className="font-semibold text-lg">Start Your Property Search</h3>
            <p className="text-sm text-gray-600 mt-2">
              Enter a locality and tap Search
            </p>
          </div>
        )}

        {hasSearched && (
          <>
            {loading && (
              <div className="text-center py-10">
                <div className="h-8 w-8 border-4 border-orange-500 border-r-transparent rounded-full animate-spin mx-auto"></div>
              </div>
            )}

            {error && (
              <p className="text-center text-red-600">{error}</p>
            )}

            {!loading && properties.length === 0 && (
              <div className="text-center py-10">
                <h3 className="font-semibold">No properties found</h3>
              </div>
            )}

            {!loading && properties.length > 0 && (
              <div className="grid grid-cols-2 gap-3">
                {properties.map((property) => (
                  <PropertyCard key={property.id} property={property} />
                ))}
              </div>
            )}
          </>
        )}
      </div>

      {/* FLOATING BUTTONS */}
      <div className="fixed bottom-16 right-4 md:hidden">
        <button
          onClick={() => navigate('/add-property')}
          className="bg-green-600 text-white px-4 py-2 rounded-full shadow-lg text-sm flex items-center gap-2"
        >
          <Plus className="w-4 h-4" />
          Post
        </button>
      </div>

      <div className="fixed bottom-4 right-4 md:hidden">
        <a
          href={`https://wa.me/${VIZAG_PROPERTY_PHONE_WITH_CODE}`}
          target="_blank"
          rel="noopener noreferrer"
          className="bg-green-500 w-12 h-12 rounded-full flex items-center justify-center shadow-xl"
        >
          <MessageCircle className="text-white w-6 h-6" />
        </a>
      </div>

    </div>
  )
}
