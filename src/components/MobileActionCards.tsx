import { Search, Home } from 'lucide-react'

interface MobileActionCardsProps {
  onSearchClick?: () => void
  onPostClick?: () => void
}

export function MobileActionCards({ onSearchClick, onPostClick }: MobileActionCardsProps) {
  return (
    <div className="md:hidden px-4 py-4 bg-gray-50">
      <div className="flex flex-col gap-3">
        <button
          onClick={onSearchClick}
          className="w-full bg-white border-2 border-primary-500 text-primary-700 px-6 py-5 rounded-2xl hover:bg-primary-50 transition-all font-semibold shadow-md text-lg flex items-center justify-center gap-3 active:scale-[0.98]"
        >
          <Search className="h-6 w-6" />
          <span>Search Property</span>
        </button>

        <button
          onClick={onPostClick}
          className="w-full bg-gradient-to-r from-[#f6b300] to-[#f39c12] text-[#0d1b3d] px-6 py-5 rounded-2xl hover:shadow-xl transition-all font-semibold shadow-md text-lg flex items-center justify-center gap-3 active:scale-[0.98]"
        >
          <Home className="h-6 w-6" />
          <span>Post Property — FREE</span>
        </button>
      </div>
    </div>
  )
}
