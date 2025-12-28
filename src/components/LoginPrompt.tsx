import { X } from 'lucide-react'
import { useState, useEffect } from 'react'

interface LoginPromptProps {
  onLogin: () => void
}

export function LoginPrompt({ onLogin }: LoginPromptProps) {
  const [visible, setVisible] = useState(true)

  useEffect(() => {
    const hasClosedPrompt = sessionStorage.getItem('loginPromptClosed')
    if (hasClosedPrompt) {
      setVisible(false)
    }
  }, [])

  const handleClose = () => {
    setVisible(false)
    sessionStorage.setItem('loginPromptClosed', 'true')
  }

  if (!visible) return null

  return (
    <div className="fixed top-20 left-1/2 -translate-x-1/2 z-50 animate-slide-down">
      <div className="bg-white border-2 border-primary-600 rounded-2xl shadow-2xl p-6 max-w-md relative">
        <button
          onClick={handleClose}
          className="absolute top-3 right-3 text-gray-400 hover:text-gray-600 transition-colors"
        >
          <X className="h-5 w-5" />
        </button>

        <div className="text-center">
          <h3 className="text-xl font-bold text-gray-900 mb-2">
            Login to get price alerts & exclusive listings
          </h3>
          <p className="text-sm text-gray-600 mb-4">
            Get instant updates on properties matching your preferences
          </p>
          <button
            onClick={onLogin}
            className="w-full bg-gradient-to-r from-primary-600 to-primary-700 text-white px-6 py-3 rounded-full hover:shadow-lg transition-all font-semibold mb-3"
          >
            Login with Mobile
          </button>
          <p className="text-xs text-gray-500">
            We never spam. OTP based secure login.
          </p>
        </div>
      </div>
    </div>
  )
}
