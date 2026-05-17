import { Search, Home } from 'lucide-react'

interface PropertyActionCardsProps {
  onSearchClick: () => void
  onPostClick: () => void
}

export function PropertyActionCards({ onSearchClick, onPostClick }: PropertyActionCardsProps) {
  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <button
          onClick={onSearchClick}
          className="group relative rounded-2xl shadow-lg p-6 text-white overflow-hidden transition-all duration-300 hover:scale-105 hover:shadow-2xl"
        >
          <div className="absolute inset-0 bg-gradient-to-br from-red-500 to-red-700"></div>
          <div className="relative z-10 flex flex-col items-center justify-center min-h-[180px]">
            <div className="bg-white/20 backdrop-blur-sm rounded-full p-4 mb-4 group-hover:scale-110 transition-transform duration-300">
              <Search className="h-8 w-8 text-white" />
            </div>
            <h3 className="text-2xl font-bold mb-2">Search Property</h3>
            <p className="text-red-100 text-sm text-center">
              Find your dream home in Vizag
            </p>
          </div>
        </button>

        <button
          onClick={onPostClick}
          className="group relative rounded-2xl shadow-lg p-6 text-white overflow-hidden transition-all duration-300 hover:scale-105 hover:shadow-2xl"
        >
          <div className="absolute inset-0 bg-gradient-to-br from-orange-500 to-orange-700"></div>
          <div className="relative z-10 flex flex-col items-center justify-center min-h-[180px]">
            <div className="bg-white/20 backdrop-blur-sm rounded-full p-4 mb-4 group-hover:scale-110 transition-transform duration-300">
              <Home className="h-8 w-8 text-white" />
            </div>
            <h3 className="text-2xl font-bold mb-2">Post Property</h3>
            <p className="text-orange-100 text-sm text-center">
              List your property for free
            </p>
          </div>
        </button>
      </div>
    </div>
  )
}
