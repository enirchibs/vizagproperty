import { X, MapPin } from 'lucide-react'

interface RestoredSearchBannerProps {
  localityName: string
  onDismiss: () => void
}

export default function RestoredSearchBanner({
  localityName,
  onDismiss
}: RestoredSearchBannerProps) {
  return (
    <div className="bg-blue-50 border border-blue-200 rounded-lg p-3 sm:p-4 mb-4 animate-slide-down">
      <div className="flex items-start justify-between gap-3">
        <div className="flex items-start gap-3 flex-1">
          <div className="flex-shrink-0 w-8 h-8 bg-blue-100 rounded-lg flex items-center justify-center mt-0.5">
            <MapPin className="h-4 w-4 text-blue-600" />
          </div>
          <div className="flex-1 min-w-0">
            <h3 className="text-sm font-semibold text-blue-900 mb-1">
              Showing saved search
            </h3>
            <p className="text-xs sm:text-sm text-blue-800">
              Results in <span className="font-medium">{localityName}</span>
            </p>
          </div>
        </div>
        <button
          onClick={onDismiss}
          className="flex-shrink-0 p-1 hover:bg-blue-100 rounded-md transition-colors"
          aria-label="Dismiss"
        >
          <X className="h-4 w-4 text-blue-600" />
        </button>
      </div>
    </div>
  )
}
