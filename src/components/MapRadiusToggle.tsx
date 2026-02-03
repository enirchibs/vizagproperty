import { MapPin, Target } from 'lucide-react'

interface MapRadiusToggleProps {
  isEnabled: boolean
  radiusKm: 1 | 3 | 5
  onToggle: (enabled: boolean) => void
  onRadiusChange: (radius: 1 | 3 | 5) => void
  localityName?: string
  className?: string
}

const radiusOptions: Array<1 | 3 | 5> = [1, 3, 5]

export default function MapRadiusToggle({
  isEnabled,
  radiusKm,
  onToggle,
  onRadiusChange,
  localityName,
  className = ''
}: MapRadiusToggleProps) {
  return (
    <div className={`border border-gray-200 rounded-lg bg-white shadow-sm ${className}`}>
      <div className="flex items-center justify-between p-3 sm:p-4">
        <div className="flex items-center space-x-3">
          <div className="flex-shrink-0 w-10 h-10 bg-primary-50 rounded-lg flex items-center justify-center">
            <Target className="h-5 w-5 text-primary-600" />
          </div>
          <div>
            <div className="font-semibold text-gray-900 text-sm sm:text-base">Search Radius</div>
            <div className="text-xs sm:text-sm text-gray-500">
              {isEnabled ? (
                <span>
                  {localityName ? (
                    <>
                      Within <span className="font-medium text-primary-600">{radiusKm}km</span> of {localityName}
                    </>
                  ) : (
                    <>
                      <span className="font-medium text-primary-600">{radiusKm}km</span> radius
                    </>
                  )}
                </span>
              ) : (
                'Exact locality only'
              )}
            </div>
          </div>
        </div>
        <button
          onClick={() => onToggle(!isEnabled)}
          className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors focus:outline-none focus:ring-2 focus:ring-primary-500 focus:ring-offset-2 ${
            isEnabled ? 'bg-primary-600' : 'bg-gray-200'
          }`}
          aria-label={`${isEnabled ? 'Disable' : 'Enable'} radius search`}
        >
          <span
            className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform shadow-sm ${
              isEnabled ? 'translate-x-6' : 'translate-x-1'
            }`}
          />
        </button>
      </div>

      {isEnabled && (
        <div className="px-3 sm:px-4 pb-3 sm:pb-4 border-t border-gray-100 pt-3 sm:pt-4 animate-slide-down">
          <div className="flex items-center justify-between mb-3">
            <div className="flex items-center gap-2">
              <MapPin className="h-4 w-4 text-gray-400" />
              <span className="text-sm font-medium text-gray-700">Distance</span>
            </div>
          </div>

          <div className="grid grid-cols-3 gap-2 sm:gap-3">
            {radiusOptions.map((radius) => (
              <button
                key={radius}
                onClick={() => onRadiusChange(radius)}
                className={`
                  relative py-3 sm:py-4 px-2 rounded-lg font-semibold text-center transition-all
                  ${
                    radiusKm === radius
                      ? 'bg-primary-600 text-white shadow-md ring-2 ring-primary-600 ring-offset-2'
                      : 'bg-gray-50 text-gray-700 hover:bg-gray-100 border border-gray-200'
                  }
                `}
                aria-label={`Set radius to ${radius} kilometers`}
                aria-pressed={radiusKm === radius}
              >
                <div className="text-xl sm:text-2xl font-bold">{radius}</div>
                <div className={`text-xs sm:text-sm ${radiusKm === radius ? 'text-primary-100' : 'text-gray-500'}`}>
                  km
                </div>
                {radiusKm === radius && (
                  <div className="absolute -top-1 -right-1 w-5 h-5 bg-green-500 rounded-full flex items-center justify-center">
                    <svg className="w-3 h-3 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={3} d="M5 13l4 4L19 7" />
                    </svg>
                  </div>
                )}
              </button>
            ))}
          </div>

          <div className="mt-3 p-2 bg-blue-50 border border-blue-100 rounded-lg">
            <div className="flex items-start gap-2">
              <svg className="w-4 h-4 text-blue-600 flex-shrink-0 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clipRule="evenodd" />
              </svg>
              <p className="text-xs text-blue-800">
                Searches nearby localities within selected distance
              </p>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
