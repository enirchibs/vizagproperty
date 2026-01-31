import { MessageCircle } from 'lucide-react'
import { openWhatsApp } from '../lib/whatsapp'

export function FloatingWhatsAppButton() {
  const handleClick = () => {
    openWhatsApp('Hi, I am looking for property in Vizag listed on VizagProperty. Please share more details.')
  }

  return (
    <button
      onClick={handleClick}
      className="fixed bottom-6 right-6 bg-green-500 hover:bg-green-600 text-white p-4 rounded-full shadow-lg hover:shadow-xl transition-all duration-300 z-50 flex items-center justify-center group"
      aria-label="Chat with Vizag Property Experts"
    >
      <MessageCircle className="h-6 w-6" />
      <span className="absolute right-full mr-3 bg-gray-900 text-white px-3 py-2 rounded-lg text-sm whitespace-nowrap opacity-0 group-hover:opacity-100 transition-opacity duration-200 pointer-events-none">
        Chat with Vizag Property Experts
      </span>
    </button>
  )
}
