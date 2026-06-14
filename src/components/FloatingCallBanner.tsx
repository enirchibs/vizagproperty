import { Phone } from 'lucide-react'

export function FloatingCallBanner() {
  return (
    <a
      href="tel:7207550499"
      className="fixed bottom-6 left-1/2 -translate-x-1/2 z-50 flex items-center gap-2.5 bg-white px-6 py-3 rounded-full shadow-[0_8px_30px_rgb(0,0,0,0.12)] border border-gray-100 hover:shadow-[0_8px_30px_rgb(0,0,0,0.18)] hover:scale-105 transition-all duration-300 active:scale-95 whitespace-nowrap"
    >
      <Phone className="h-5 w-5 text-green-600 fill-current" />
      <span className="text-gray-800 font-semibold text-sm sm:text-base flex items-center">
        ఇప్పుడే కాల్ చేయండి:&nbsp;<span className="text-green-600 font-bold">7207550499</span>
      </span>
    </a>
  )
}
