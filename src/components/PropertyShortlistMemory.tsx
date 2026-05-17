import { useState, useEffect } from 'react'
import { Heart, X, ThumbsUp, ThumbsDown, Sparkles } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { useAuth } from '../contexts/AuthContext'

interface PropertyInteraction {
  id: string
  property_id: string
  interaction_type: string
  reason: string
  created_at: string
}

interface PropertyShortlistMemoryProps {
  propertyId: string
  onInteraction?: () => void
}

export function PropertyShortlistMemory({ propertyId, onInteraction }: PropertyShortlistMemoryProps) {
  const { user } = useAuth()
  const [interactions, setInteractions] = useState<PropertyInteraction[]>([])
  const [showMemory, setShowMemory] = useState(false)
  const [hasInteracted, setHasInteracted] = useState(false)
  const [showFeedback, setShowFeedback] = useState(false)
  const [feedbackReason, setFeedbackReason] = useState('')

  useEffect(() => {
    if (user) {
      loadInteractions()
      checkInteraction()
    }
  }, [propertyId, user])

  const loadInteractions = async () => {
    if (!user) return

    try {
      const { data, error } = await supabase
        .from('property_interactions')
        .select('*')
        .eq('user_id', user.id)
        .order('created_at', { ascending: false })
        .limit(5)

      if (error) throw error
      setInteractions(data || [])
    } catch (error) {
    }
  }

  const checkInteraction = async () => {
    if (!user) return

    try {
      const { data, error } = await supabase
        .from('property_interactions')
        .select('id')
        .eq('user_id', user.id)
        .eq('property_id', propertyId)
        .maybeSingle()

      if (error) throw error
      setHasInteracted(!!data)
    } catch (error) {
    }
  }

  const recordInteraction = async (type: string, reason: string = '') => {
    if (!user) return

    try {
      await supabase.from('property_interactions').insert({
        user_id: user.id,
        property_id: propertyId,
        interaction_type: type,
        reason: reason
      })

      setHasInteracted(true)
      setShowFeedback(false)
      loadInteractions()
      onInteraction?.()
    } catch (error) {
    }
  }

  const handleLike = () => {
    setShowFeedback(true)
  }

  const handleReject = () => {
    setShowFeedback(true)
  }

  const submitFeedback = (type: string) => {
    recordInteraction(type, feedbackReason)
  }

  if (!user) {
    return (
      <div className="bg-gradient-to-br from-pink-50 to-purple-50 rounded-2xl p-6 shadow-sm border border-pink-100 mb-6">
        <div className="flex items-center gap-3 mb-3">
          <div className="bg-pink-600 p-3 rounded-full">
            <Sparkles className="h-6 w-6 text-white" />
          </div>
          <div>
            <h3 className="text-xl font-bold text-gray-900">AI learns your preferences</h3>
            <p className="text-gray-600 text-sm">Get smarter recommendations over time</p>
          </div>
        </div>
        <p className="text-gray-600 text-sm bg-white rounded-lg p-4">
          Sign in to let AI remember what you like and get personalized property recommendations.
        </p>
      </div>
    )
  }

  return (
    <div className="bg-gradient-to-br from-pink-50 to-purple-50 rounded-2xl p-6 shadow-sm border border-pink-100 mb-6">
      <div className="flex items-center justify-between mb-4">
        <div className="flex items-center gap-3">
          <div className="bg-pink-600 p-3 rounded-full">
            <Sparkles className="h-6 w-6 text-white" />
          </div>
          <div>
            <h3 className="text-xl font-bold text-gray-900">Help AI Learn Your Taste</h3>
            <p className="text-gray-600 text-sm">Your feedback improves future recommendations</p>
          </div>
        </div>
      </div>

      {!hasInteracted && !showFeedback && (
        <div className="space-y-3 animate-fade-in">
          <p className="text-gray-700 font-medium">What do you think about this property?</p>
          <div className="flex gap-3">
            <button
              onClick={handleLike}
              className="flex-1 bg-green-600 text-white py-3 rounded-lg hover:bg-green-700 transition-colors flex items-center justify-center gap-2 font-medium"
            >
              <ThumbsUp className="h-5 w-5" />
              <span>I like it</span>
            </button>
            <button
              onClick={handleReject}
              className="flex-1 bg-red-600 text-white py-3 rounded-lg hover:bg-red-700 transition-colors flex items-center justify-center gap-2 font-medium"
            >
              <ThumbsDown className="h-5 w-5" />
              <span>Not for me</span>
            </button>
          </div>
        </div>
      )}

      {showFeedback && (
        <div className="bg-white rounded-xl p-4 space-y-3 animate-fade-in">
          <div className="flex items-center justify-between">
            <p className="font-semibold text-gray-900">Tell us why (optional)</p>
            <button
              onClick={() => setShowFeedback(false)}
              className="text-gray-400 hover:text-gray-600"
            >
              <X className="h-5 w-5" />
            </button>
          </div>

          <textarea
            value={feedbackReason}
            onChange={(e) => setFeedbackReason(e.target.value)}
            placeholder="e.g., Great location but too expensive, Perfect size for my family, etc."
            className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500 resize-none"
            rows={3}
          />

          <div className="flex gap-2">
            <button
              onClick={() => submitFeedback('liked')}
              className="flex-1 bg-green-600 text-white py-2 rounded-lg hover:bg-green-700 transition-colors font-medium"
            >
              Submit as Liked
            </button>
            <button
              onClick={() => submitFeedback('rejected')}
              className="flex-1 bg-red-600 text-white py-2 rounded-lg hover:bg-red-700 transition-colors font-medium"
            >
              Submit as Rejected
            </button>
          </div>
        </div>
      )}

      {hasInteracted && (
        <div className="bg-white rounded-xl p-4">
          <div className="flex items-center gap-2 text-green-600 mb-2">
            <Heart className="h-5 w-5 fill-current" />
            <span className="font-semibold">Thanks for your feedback!</span>
          </div>
          <p className="text-sm text-gray-600">
            AI is learning your preferences to show better recommendations.
          </p>
        </div>
      )}

      {interactions.length > 0 && (
        <div className="mt-4">
          <button
            onClick={() => setShowMemory(!showMemory)}
            className="text-pink-600 font-medium hover:text-pink-700 transition-colors text-sm"
          >
            {showMemory ? 'Hide' : 'View'} your recent activity
          </button>

          {showMemory && (
            <div className="mt-3 bg-white rounded-xl p-4 space-y-2 animate-fade-in max-h-48 overflow-y-auto">
              {interactions.map((interaction) => (
                <div key={interaction.id} className="flex items-start gap-2 pb-2 border-b border-gray-100 last:border-0">
                  <div className={`p-1 rounded-full ${
                    interaction.interaction_type === 'liked' ? 'bg-green-100' : 'bg-red-100'
                  }`}>
                    {interaction.interaction_type === 'liked' ? (
                      <ThumbsUp className="h-3 w-3 text-green-600" />
                    ) : (
                      <ThumbsDown className="h-3 w-3 text-red-600" />
                    )}
                  </div>
                  <div className="flex-1">
                    <p className="text-xs text-gray-600">
                      {new Date(interaction.created_at).toLocaleDateString()}
                    </p>
                    {interaction.reason && (
                      <p className="text-sm text-gray-700 mt-1">{interaction.reason}</p>
                    )}
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  )
}
