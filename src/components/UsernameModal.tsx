import { useState } from 'react'
import { X, User } from 'lucide-react'
import { useAuth } from '../contexts/AuthContext'

interface UsernameModalProps {
  onClose: () => void
}

export function UsernameModal({ onClose }: UsernameModalProps) {
  const { updateUsername } = useAuth()
  const [username, setUsername] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')

    if (!username.trim()) {
      setError('Please enter a username')
      return
    }

    if (username.length < 3) {
      setError('Username must be at least 3 characters')
      return
    }

    if (!/^[a-zA-Z0-9_]+$/.test(username)) {
      setError('Username can only contain letters, numbers, and underscores')
      return
    }

    setLoading(true)

    try {
      await updateUsername(username)
      onClose()
    } catch (err: any) {
      if (err.message.includes('duplicate') || err.message.includes('unique')) {
        setError('This username is already taken. Please try another.')
      } else {
        setError(err.message || 'Failed to set username. Please try again.')
      }
    } finally {
      setLoading(false)
    }
  }

  const handleSkip = () => {
    onClose()
  }

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl max-w-md w-full overflow-hidden shadow-2xl animate-slide-up">
        <div className="bg-gradient-to-br from-primary-600 to-primary-800 text-white p-6">
          <div className="flex items-center justify-between mb-4">
            <div className="flex items-center gap-3">
              <div className="bg-white bg-opacity-20 p-3 rounded-lg">
                <User className="h-6 w-6" />
              </div>
              <h2 className="text-2xl font-bold">Choose Username</h2>
            </div>
            <button
              onClick={handleSkip}
              className="text-white/80 hover:text-white"
            >
              <X className="h-6 w-6" />
            </button>
          </div>
          <p className="text-white/90 text-sm">
            Choose a unique username to personalize your profile
          </p>
        </div>

        <div className="p-6">
          {error && (
            <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg mb-4 text-sm">
              {error}
            </div>
          )}

          <form onSubmit={handleSubmit} className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">
                Username
              </label>
              <input
                type="text"
                value={username}
                onChange={(e) => setUsername(e.target.value.toLowerCase().replace(/[^a-z0-9_]/g, ''))}
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                placeholder="e.g., john_doe"
                maxLength={20}
              />
              <p className="text-xs text-gray-500 mt-1">
                Only letters, numbers, and underscores (3-20 characters)
              </p>
            </div>

            <div className="flex gap-3">
              <button
                type="button"
                onClick={handleSkip}
                className="flex-1 bg-gray-100 text-gray-700 py-3 rounded-lg hover:bg-gray-200 transition-colors font-medium"
              >
                Skip for Now
              </button>
              <button
                type="submit"
                disabled={loading || !username}
                className="flex-1 bg-primary-600 text-white py-3 rounded-lg hover:bg-primary-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed font-semibold"
              >
                {loading ? 'Saving...' : 'Continue'}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  )
}
