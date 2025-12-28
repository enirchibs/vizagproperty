interface AISearchSuggestionsProps {
  onSelect: (query: string) => void
  onClose: () => void
}

const SUGGESTIONS = [
  'Vizag plots for sale under 50 lakhs',
  '2 BHK flats in Madhurawada for sale',
  'VMRDA approved plots near NH16 Vizag',
  'Villas in Vizag gated communities',
  'PG & Hostels near IT SEZ Vizag',
  '3 BHK flats in MVP Colony',
  'Houses in PM Palem for sale',
  'Beachside properties in Rushikonda'
]

export function AISearchSuggestions({ onSelect, onClose }: AISearchSuggestionsProps) {
  return (
    <>
      <div
        className="fixed inset-0 z-10"
        onClick={onClose}
      />
      <div className="absolute top-full left-0 right-0 mt-2 bg-white rounded-lg shadow-2xl border-2 border-primary-200 z-20 max-h-80 overflow-y-auto">
        <div className="p-3 bg-primary-50 border-b border-primary-100">
          <p className="text-xs font-semibold text-primary-700">AI SUGGESTED SEARCHES</p>
        </div>
        <div className="py-2">
          {SUGGESTIONS.map((suggestion, index) => (
            <button
              key={index}
              onClick={() => onSelect(suggestion)}
              className="w-full px-4 py-3 text-left hover:bg-primary-50 transition-colors flex items-start gap-3 group"
            >
              <svg
                className="w-5 h-5 text-primary-600 flex-shrink-0 mt-0.5 group-hover:scale-110 transition-transform"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"
                />
              </svg>
              <span className="text-sm text-gray-700 group-hover:text-primary-700 font-medium">
                {suggestion}
              </span>
            </button>
          ))}
        </div>
      </div>
    </>
  )
}
