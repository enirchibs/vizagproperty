import { MessageCircle, X } from 'lucide-react'
import { useState } from 'react'

export function FixedWhatsAppCTA() {
  const [isVisible, setIsVisible] = useState(true)

  if (!isVisible) return null

  return (
    <div className="fixed bottom-24 right-4 z-40 max-w-sm">
      <div className="bg-white rounded-2xl shadow-2xl border-2 border-green-500 p-4 pr-8 relative animate-slide-up">
        <button
          onClick={() => setIsVisible(false)}
          className="absolute top-2 right-2 text-gray-400 hover:text-gray-600 transition-colors"
          aria-label="Close"
        >
          <X className="h-4 w-4" />
        </button>
        <div className="flex items-start gap-3">
          <div className="bg-green-500 p-2 rounded-full flex-shrink-0">
            <MessageCircle className="h-5 w-5 text-white" />
          </div>
          <div>
            <p className="text-sm font-semibold text-gray-900 mb-2">
              Need verified Vizag properties?
            </p>
            <p className="text-xs text-gray-600 mb-3">
              Chat on WhatsApp
            </p>
            <a
              href="https://wa.me/917207550499?text=Hi%20I%20am%20looking%20for%20properties%20in%20Vizag"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-2 bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition-all text-sm font-semibold shadow-md"
            >
              <MessageCircle className="h-4 w-4" />
              Chat Now
            </a>
          </div>
        </div>
      </div>
    </div>
  )
}
