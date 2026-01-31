import { MessageCircle } from 'lucide-react'
import { openWhatsApp } from '../lib/whatsapp'

interface NoResultsWhatsAppProps {
  searchQuery: string
}

export function NoResultsWhatsApp({ searchQuery }: NoResultsWhatsAppProps) {
  const handleWhatsAppClick = () => {
    openWhatsApp(`Hi, I could not find results for ${searchQuery} listed on VizagProperty. Please assist.`)
  }

  return (
    <div className="text-center py-12 px-4">
      <div className="max-w-md mx-auto">
        <div className="mb-6">
          <div className="inline-flex items-center justify-center w-16 h-16 bg-gray-100 rounded-full mb-4">
            <svg
              className="w-8 h-8 text-gray-400"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
              />
            </svg>
          </div>
          <h3 className="text-xl font-semibold text-gray-900 mb-2">
            No matching properties found
          </h3>
          <p className="text-gray-600 mb-6">
            We couldn't find properties matching your search. Let our experts help you find what you're looking for.
          </p>
        </div>
        <button
          onClick={handleWhatsAppClick}
          className="inline-flex items-center justify-center gap-2 px-6 py-3 bg-gradient-to-r from-green-600 to-green-700 text-white rounded-lg hover:from-green-700 hover:to-green-800 transition-all font-semibold shadow-md hover:shadow-lg"
        >
          <MessageCircle className="h-5 w-5" />
          <span>Contact Us on WhatsApp</span>
        </button>
      </div>
    </div>
  )
}
