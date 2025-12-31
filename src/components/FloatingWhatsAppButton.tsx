import { MessageCircle } from 'lucide-react'

export function FloatingWhatsAppButton() {
  const handleClick = () => {
    const message = encodeURIComponent('Hi Vizag Property Experts, I am looking for property in Vizag')
    window.open(`https://wa.me/917207550499?text=${message}`, '_blank')
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
