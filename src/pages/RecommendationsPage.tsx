import { AIRecommendations } from '../components/AIRecommendations'

export function RecommendationsPage() {
  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-6xl mx-auto px-4">
        <div className="mb-8">
          <h1 className="text-4xl font-bold text-gray-900 mb-2">Your Property Matches</h1>
          <p className="text-lg text-gray-600">
            AI-curated properties based on your preferences and search history
          </p>
        </div>

        <AIRecommendations />
      </div>
    </div>
  )
}
