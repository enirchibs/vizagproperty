import { useState, useEffect } from 'react'
import { MessageCircle, X, Home, Building2, Key, Phone, Sparkles } from 'lucide-react'
import { openWhatsApp } from '../utils/whatsapp'

interface WhatsAppButtonProps {
  autoOpen?: boolean
  message?: string
  showVillaOption?: boolean
}

export function WhatsAppButton({ autoOpen = false, message, showVillaOption = false }: WhatsAppButtonProps) {
  const [showPopup, setShowPopup] = useState(false)

  useEffect(() => {
    if (autoOpen) {
      const timer = setTimeout(() => {
        setShowPopup(true)
      }, 5000)
      return () => clearTimeout(timer)
    }
  }, [autoOpen])

  const getLocalityFromUrl = (): string | null => {
    const localityMap: Record<string, string> = {
      'madhurawada': 'Madhurawada',
      'yendada': 'Yendada',
      'pm-palem': 'PM Palem',
      'mvp-colony': 'MVP Colony',
      'gajuwaka': 'Gajuwaka',
    }

    const path = window.location.pathname
    const segments = path.split('/').filter(Boolean)
    const lastSegment = segments[segments.length - 1]

    return localityMap[lastSegment] || null
  }

  const handleWhatsAppClick = (message?: string) => {
    openWhatsApp(message || 'Hi, I am looking for property in Vizag listed on VizagProperty. Please share more details.')
    setShowPopup(false)
  }

  const handleQuickReply = (type: string) => {
    const locality = getLocalityFromUrl()
    const locationText = locality ? ` in ${locality}, Vizag` : ' in Vizag'

    const messages = {
      plot: `Hi 👋 I'm looking for a Plot${locationText}. Can you help me find VMRDA approved plots?`,
      flat: `Hi 👋 I'm interested in buying a Flat${locationText}. What options are available?`,
      villa: `Hi 👋 I'm interested in luxury villas${locationText}. Can you show me available properties?`,
      rent: `Hi 👋 I'm looking for a flat for Rent${locationText}. Can you show me available properties?`,
      expert: `Hi 👋 I need expert guidance on${locationText} real estate. Can we discuss?`
    }
    handleWhatsAppClick(messages[type as keyof typeof messages])
  }

  return (
    <>
      {showPopup && (
        <div className="fixed bottom-24 right-4 md:bottom-24 md:right-6 z-40 animate-in slide-in-from-bottom-5 duration-500">
          <div className="bg-white rounded-2xl shadow-2xl border-2 border-green-500 w-80 overflow-hidden">
            <div className="bg-gradient-to-r from-green-600 to-green-700 p-4 flex items-center justify-between text-white">
              <div className="flex items-center gap-3">
                <div className="bg-white/20 p-2 rounded-full">
                  <MessageCircle className="h-5 w-5" />
                </div>
                <div>
                  <div className="font-bold">VizagProperty</div>
                  <div className="text-xs text-green-100">Typically replies instantly</div>
                </div>
              </div>
              <button
                onClick={() => setShowPopup(false)}
                className="hover:bg-white/20 p-1 rounded-full transition-colors"
              >
                <X className="h-5 w-5" />
              </button>
            </div>

            <div className="p-6">
              <div className="bg-green-50 rounded-2xl p-4 mb-4 relative">
                <div className="absolute -top-2 left-4 w-0 h-0 border-l-8 border-r-8 border-b-8 border-transparent border-b-green-50"></div>
                <p className="text-gray-800 font-medium">
                  {message || "Hi 👋 Are you looking for a Plot or Flat in Vizag?"}
                </p>
              </div>

              <div className="space-y-2">
                {showVillaOption ? (
                  <>
                    <button
                      onClick={() => handleQuickReply('villa')}
                      className="w-full flex items-center gap-3 p-3 bg-gradient-to-r from-purple-50 to-white border-2 border-purple-200 rounded-xl hover:border-purple-500 hover:shadow-md transition-all text-left"
                    >
                      <div className="bg-purple-600 p-2 rounded-lg">
                        <Sparkles className="h-4 w-4 text-white" />
                      </div>
                      <span className="font-semibold text-gray-800">Yes, Show Villas</span>
                    </button>

                    <button
                      onClick={() => handleQuickReply('expert')}
                      className="w-full flex items-center gap-3 p-3 bg-gradient-to-r from-blue-50 to-white border-2 border-blue-200 rounded-xl hover:border-blue-500 hover:shadow-md transition-all text-left"
                    >
                      <div className="bg-blue-600 p-2 rounded-lg">
                        <Phone className="h-4 w-4 text-white" />
                      </div>
                      <span className="font-semibold text-gray-800">Talk to Expert</span>
                    </button>
                  </>
                ) : (
                  <>
                    <button
                      onClick={() => handleQuickReply('plot')}
                      className="w-full flex items-center gap-3 p-3 bg-gradient-to-r from-primary-50 to-white border-2 border-primary-200 rounded-xl hover:border-primary-500 hover:shadow-md transition-all text-left"
                    >
                      <div className="bg-primary-600 p-2 rounded-lg">
                        <Home className="h-4 w-4 text-white" />
                      </div>
                      <span className="font-semibold text-gray-800">Plot</span>
                    </button>

                    <button
                      onClick={() => handleQuickReply('flat')}
                      className="w-full flex items-center gap-3 p-3 bg-gradient-to-r from-green-50 to-white border-2 border-green-200 rounded-xl hover:border-green-500 hover:shadow-md transition-all text-left"
                    >
                      <div className="bg-green-600 p-2 rounded-lg">
                        <Building2 className="h-4 w-4 text-white" />
                      </div>
                      <span className="font-semibold text-gray-800">Flat</span>
                    </button>

                    <button
                      onClick={() => handleQuickReply('rent')}
                      className="w-full flex items-center gap-3 p-3 bg-gradient-to-r from-orange-50 to-white border-2 border-orange-200 rounded-xl hover:border-orange-500 hover:shadow-md transition-all text-left"
                    >
                      <div className="bg-orange-600 p-2 rounded-lg">
                        <Key className="h-4 w-4 text-white" />
                      </div>
                      <span className="font-semibold text-gray-800">Rent</span>
                    </button>

                    <button
                      onClick={() => handleQuickReply('expert')}
                      className="w-full flex items-center gap-3 p-3 bg-gradient-to-r from-blue-50 to-white border-2 border-blue-200 rounded-xl hover:border-blue-500 hover:shadow-md transition-all text-left"
                    >
                      <div className="bg-blue-600 p-2 rounded-lg">
                        <Phone className="h-4 w-4 text-white" />
                      </div>
                      <span className="font-semibold text-gray-800">Talk to Expert</span>
                    </button>
                  </>
                )}
              </div>
            </div>
          </div>
        </div>
      )}

      <button
        onClick={() => setShowPopup(!showPopup)}
        className="fixed bottom-4 right-4 md:bottom-6 md:right-6 bg-green-600 text-white p-4 rounded-full shadow-2xl hover:bg-green-700 hover:scale-110 transition-all duration-300 z-30 flex items-center justify-center group min-h-[56px] min-w-[56px]"
        aria-label="Chat on WhatsApp"
      >
        <MessageCircle className="h-6 w-6" />
        <span className="absolute right-16 md:right-16 bg-green-600 text-white px-3 md:px-4 py-1.5 md:py-2 rounded-lg text-xs md:text-sm font-medium whitespace-nowrap opacity-0 group-hover:opacity-100 transition-opacity duration-300 shadow-lg">
          Chat on WhatsApp
        </span>
      </button>
    </>
  )
}
