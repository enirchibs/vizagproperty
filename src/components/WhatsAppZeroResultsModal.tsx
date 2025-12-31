import { MessageCircle, X } from 'lucide-react'

interface WhatsAppZeroResultsModalProps {
  isOpen: boolean
  onClose: () => void
}

export function WhatsAppZeroResultsModal({ isOpen, onClose }: WhatsAppZeroResultsModalProps) {
  if (!isOpen) return null

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

          <a
            href="https://wa.me/917207550499?text=Hi%20I%20searched%20but%20did%20not%20find%20results%20for%20Vizag"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-2 bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 transition-all font-semibold shadow-lg w-full justify-center"
            onClick={onClose}
          >
            <MessageCircle className="h-5 w-5" />
            Get Properties on WhatsApp
          </a>

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
