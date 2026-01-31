import { Search, Home } from 'lucide-react'

interface MobileActionCardsProps {
  onSearchClick?: () => void
  onPostClick?: () => void
}

export function MobileActionCards({ onSearchClick, onPostClick }: MobileActionCardsProps) {
  return (
    <div className="md:hidden px-4 py-4">
      <div className="grid grid-cols-2 gap-3">
        <button
          onClick={onSearchClick}
          className="rounded-2xl bg-gradient-to-br from-red-500 to-red-600 text-white p-5 shadow-lg hover:shadow-xl transition-all active:scale-[0.98] text-left"
        >
          <Search className="h-6 w-6 mb-2" />
          <h3 className="text-base font-bold mb-1">Search Property</h3>
          <p className="text-xs opacity-90">Buy & Rent easily</p>
        </button>

        <button
          onClick={onPostClick}
          className="rounded-2xl bg-gradient-to-br from-orange-500 to-orange-600 text-white p-5 shadow-lg hover:shadow-xl transition-all active:scale-[0.98] text-left"
        >
          <Home className="h-6 w-6 mb-2" />
          <h3 className="text-base font-bold mb-1">Post Property</h3>
          <p className="text-xs opacity-90">100% Free</p>
        </button>
      </div>
    </div>
  )
}
