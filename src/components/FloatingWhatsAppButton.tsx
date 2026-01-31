import { MessageCircle } from 'lucide-react'
import { openWhatsApp } from '../lib/whatsapp'

export function FloatingWhatsAppButton() {
  const handleClick = () => {
    openWhatsApp('Hi, I am looking for property in Vizag listed on VizagProperty. Please share more details.')
  }

  return (
    <button
      onClick={handleClick}
      className="fixed bottom-4 right-4 z-50 bg-green-500 text-white p-4 rounded-full shadow-lg hover:bg-green-600 hover:shadow-xl transition-all md:hidden active:scale-95"
      aria-label="Chat with Vizag Property Experts"
    >
      <MessageCircle className="h-6 w-6" />
    </button>
  )
}
