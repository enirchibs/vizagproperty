import { MessageCircle, X } from 'lucide-react'
import { openWhatsApp } from '../lib/whatsapp'

interface WhatsAppZeroResultsModalProps {
  isOpen: boolean
  onClose: () => void
}

export function WhatsAppZeroResultsModal({ isOpen, onClose }: WhatsAppZeroResultsModalProps) {
  if (!isOpen) return null

  const handleWhatsAppClick = () => {
    openWhatsApp('Hi, I searched but did not find results for properties in Vizag listed on VizagProperty. Please share more details.')
    onClose()
  }

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 px-4">
      <div className="bg-white rounded-2xl shadow-2xl max-w-md w-full p-6 relative animate-slide-up">
        <button
          onClick={onClose}
          className="absolute top-4 right-4 text-gray-400 hover:text-gray-600 transition-colors"
          aria-label="Close"
        >
          <X className="h-5 w-5" />
        </button>

        <div className="text-center">
          <div className="inline-flex items-center justify-center w-16 h-16 bg-green-100 rounded-full mb-4">
            <MessageCircle className="h-8 w-8 text-green-600" />
          </div>

          <h3 className="text-xl font-bold text-gray-900 mb-2">
            No matching properties found
          </h3>

          <p className="text-gray-600 mb-6">
            Get live listings on WhatsApp
          </p>

          <button
            onClick={handleWhatsAppClick}
            className="inline-flex items-center gap-2 bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 transition-all font-semibold shadow-lg w-full justify-center"
          >
            <MessageCircle className="h-5 w-5" />
            Get Properties on WhatsApp
          </button>

          <button
            onClick={onClose}
            className="mt-3 text-sm text-gray-500 hover:text-gray-700 transition-colors"
          >
            Close
          </button>
        </div>
      </div>
    </div>
  )
}
