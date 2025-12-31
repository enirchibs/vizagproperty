import { MapPin, Minus, Plus } from 'lucide-react'

interface MapRadiusToggleProps {
  isEnabled: boolean
  radiusKm: number
  onToggle: (enabled: boolean) => void
  onRadiusChange: (radius: number) => void
  className?: string
}

export default function MapRadiusToggle({
  isEnabled,
  radiusKm,
  onToggle,
  onRadiusChange,
  className = ''
}: MapRadiusToggleProps) {

  const handleRadiusDecrease = () => {
    if (radiusKm > 1) {
      onRadiusChange(Math.max(1, radiusKm - 0.5))
    }
  }

  const handleRadiusIncrease = () => {
    if (radiusKm < 5) {
      onRadiusChange(Math.min(5, radiusKm + 0.5))
    }
  }

  return (
    <div className={`border border-gray-200 rounded-lg bg-white ${className}`}>
      <div className="flex items-center justify-between p-3">
        <div className="flex items-center space-x-3">
          <MapPin className="h-5 w-5 text-primary-600" />
          <div>
            <div className="font-medium text-gray-900 text-sm">Map Radius Search</div>
            <div className="text-xs text-gray-500">
              {isEnabled ? `Within ${radiusKm}km` : 'Exact locality only'}
            </div>
          </div>
        </div>
        <button
          onClick={() => {
            const newState = !isEnabled
            onToggle(newState)
            if (newState && radiusKm < 1) {
              onRadiusChange(3)
            }
          }}
          className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2 ${
            isEnabled ? 'bg-primary-600' : 'bg-gray-200'
          }`}
          aria-label={`${isEnabled ? 'Disable' : 'Enable'} radius search`}
        >
          <span
            className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${
              isEnabled ? 'translate-x-6' : 'translate-x-1'
            }`}
          />
        </button>
      </div>

      {isEnabled && (
        <div className="px-3 pb-3 border-t border-gray-100 pt-3 animate-slide-down">
          <div className="flex items-center justify-between">
            <span className="text-sm font-medium text-gray-700">Radius</span>
            <div className="flex items-center space-x-3">
              <button
                onClick={handleRadiusDecrease}
                disabled={radiusKm <= 1}
                className={`p-1.5 rounded-md transition-colors ${
                  radiusKm <= 1
                    ? 'bg-gray-100 text-gray-400 cursor-not-allowed'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
                aria-label="Decrease radius"
              >
                <Minus className="h-4 w-4" />
              </button>
              <div className="flex items-center space-x-1 min-w-[60px] justify-center">
                <span className="text-lg font-semibold text-gray-900">{radiusKm}</span>
                <span className="text-sm text-gray-600">km</span>
              </div>
              <button
                onClick={handleRadiusIncrease}
                disabled={radiusKm >= 5}
                className={`p-1.5 rounded-md transition-colors ${
                  radiusKm >= 5
                    ? 'bg-gray-100 text-gray-400 cursor-not-allowed'
                    : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                }`}
                aria-label="Increase radius"
              >
                <Plus className="h-4 w-4" />
              </button>
            </div>
          </div>
          <div className="mt-2">
            <input
              type="range"
              min="1"
              max="5"
              step="0.5"
              value={radiusKm}
              onChange={(e) => onRadiusChange(parseFloat(e.target.value))}
              className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-primary-600"
              aria-label="Adjust radius"
            />
            <div className="flex justify-between text-xs text-gray-500 mt-1">
              <span>1km</span>
              <span>5km</span>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
