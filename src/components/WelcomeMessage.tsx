import { X } from 'lucide-react'
import { useState, useEffect } from 'react'

interface WelcomeMessageProps {
  locality: string
  onSearch: () => void
}

export function WelcomeMessage({ locality, onSearch }: WelcomeMessageProps) {
  const [visible, setVisible] = useState(true)

  useEffect(() => {
    const timer = setTimeout(() => {
      setVisible(false)
    }, 10000)

    return () => clearTimeout(timer)
  }, [])

  if (!visible) return null

  return (
    <div className="fixed top-20 left-1/2 -translate-x-1/2 z-50 animate-slide-down">
      <div className="bg-gradient-to-r from-primary-600 to-primary-700 text-white px-6 py-4 rounded-full shadow-2xl flex items-center gap-4 max-w-2xl">
        <div className="flex-1">
          <p className="text-sm md:text-base font-medium">
            Hi, I just logged in on VizagPropertyExperts.{' '}
            {locality && (
              <button
                onClick={onSearch}
                className="underline hover:text-primary-100 font-bold transition-colors"
              >
                Show me properties in {locality}
              </button>
            )}
            {!locality && <span>What are you looking for today?</span>}
          </p>
        </div>
        <button
          onClick={() => setVisible(false)}
          className="text-white hover:text-primary-100 transition-colors"
        >
          <X className="h-5 w-5" />
        </button>
      </div>
    </div>
  )
}
