import { MessageCircle } from 'lucide-react'
import { useState, useEffect } from 'react'

export function ScrollWhatsAppIcon() {
  const [isVisible, setIsVisible] = useState(false)

  useEffect(() => {
    const handleScroll = () => {
      const scrollPercent = (window.scrollY / (document.documentElement.scrollHeight - window.innerHeight)) * 100
      setIsVisible(scrollPercent >= 40)
    }

    window.addEventListener('scroll', handleScroll)
    return () => window.removeEventListener('scroll', handleScroll)
  }, [])

  if (!isVisible) return null

  return (
    <a
      href="https://wa.me/917207550499?text=Hi%20I%20am%20looking%20for%20properties%20in%20Vizag"
      target="_blank"
      rel="noopener noreferrer"
      className="fixed bottom-6 right-6 z-50 bg-green-500 hover:bg-green-600 text-white p-4 rounded-full shadow-2xl transition-all hover:scale-110 animate-slide-up"
      aria-label="Chat on WhatsApp"
    >
      <MessageCircle className="h-6 w-6" />
    </a>
  )
}
