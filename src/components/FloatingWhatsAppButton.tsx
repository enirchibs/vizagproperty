import { MessageCircle } from 'lucide-react'
import { openWhatsApp } from '../lib/whatsapp'

export function FloatingWhatsAppButton() {
  const handleClick = () => {
    openWhatsApp('Hi, I am looking for properties in Vizag listed on VizagProperty. Please share more details.')
  }

  return (
    <div className="fixed bottom-6 right-6 z-50 flex items-center gap-2.5 select-none">
      {/* "Talk to Expert" capsule */}
      <button
        onClick={handleClick}
        className="bg-[#22c55e] text-white px-5 py-2.5 rounded-full font-bold shadow-[0_4px_15px_rgba(34,197,94,0.3)] hover:bg-[#16a34a] hover:shadow-[0_6px_20px_rgba(22,163,74,0.4)] transition-all duration-300 active:scale-95 text-sm md:text-base border border-green-400/20"
      >
        Talk to Expert
      </button>

      {/* Circle button with badge */}
      <button
        onClick={handleClick}
        className="relative bg-[#22c55e] hover:bg-[#16a34a] text-white w-14 h-14 rounded-full shadow-[0_4px_15px_rgba(34,197,94,0.3)] hover:shadow-[0_6px_20px_rgba(22,163,74,0.4)] transition-all duration-300 hover:scale-105 active:scale-95 flex items-center justify-center border border-green-400/20"
        aria-label="Chat on WhatsApp"
      >
        <MessageCircle className="h-7 w-7 text-white stroke-[2]" />
        {/* Red notification badge "1" */}
        <span className="absolute -top-1 -right-1 bg-[#ef4444] text-white text-[11px] font-bold w-5.5 h-5.5 rounded-full flex items-center justify-center border-2 border-white shadow-[0_2px_8px_rgba(0,0,0,0.15)]">
          1
        </span>
      </button>
    </div>
  )
}
