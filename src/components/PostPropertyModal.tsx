import { useState } from 'react'
import { X, Mail, Phone, Check } from 'lucide-react'
import { useAuth } from '../contexts/AuthContext'

interface PostPropertyModalProps {
  onClose: () => void
}

export function PostPropertyModal({ onClose }: PostPropertyModalProps) {
  const { signInWithPhone } = useAuth()
  const [authType, setAuthType] = useState<'email' | 'mobile'>('mobile')
  const [email, setEmail] = useState('')
  const [mobile, setMobile] = useState('')
  const [password, setPassword] = useState('')
  const [fullName, setFullName] = useState('')
  const [agreeToTerms, setAgreeToTerms] = useState(false)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')

    if (!agreeToTerms) {
      setError('Please agree to the Terms & Privacy Policy')
      return
    }

    setLoading(true)
    try {
      if (authType === 'mobile' && mobile) {
        await signInWithPhone(`+91${mobile}`)
        setError('OTP sent! Please check your phone.')
      } else {
        setError('Email authentication is temporarily unavailable. Please use mobile.')
      }
    } catch (err: any) {
      setError(err.message || 'An error occurred. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div
      onClick={onClose}
      className="fixed inset-0 bg-black/60 flex items-end md:items-center justify-center z-50 md:p-4 animate-fadeIn"
    >
      <div
        onClick={(e) => e.stopPropagation()}
        className="bg-white rounded-t-2xl md:rounded-2xl max-w-lg w-full p-6 md:p-8 relative animate-slideUpMobile md:animate-slide-up shadow-2xl max-h-[95vh] overflow-y-auto"
      >
        <button
          onClick={onClose}
          className="absolute top-4 right-4 text-gray-400 hover:text-gray-600 transition-colors"
        >
          <X className="h-6 w-6" />
        </button>

        <div className="text-center mb-6">
          <h2 className="text-3xl font-bold text-gray-900 mb-2">
            Post Your Property for Free
          </h2>
          <p className="text-gray-600">
            Register to list your property and reach genuine buyers
          </p>
        </div>

        <div className="bg-gradient-to-r from-green-50 to-blue-50 rounded-xl p-4 mb-6 space-y-2">
          <div className="flex items-center gap-2 text-sm text-gray-700">
            <Check className="h-4 w-4 text-green-600 flex-shrink-0" />
            <span>No brokers | Free listing</span>
          </div>
          <div className="flex items-center gap-2 text-sm text-gray-700">
            <Check className="h-4 w-4 text-green-600 flex-shrink-0" />
            <span>AI-powered visibility</span>
          </div>
          <div className="flex items-center gap-2 text-sm text-gray-700">
            <Check className="h-4 w-4 text-green-600 flex-shrink-0" />
            <span>Verified buyers only</span>
          </div>
        </div>

        <div className="flex gap-2 mb-6">
          <button
            type="button"
            onClick={() => setAuthType('mobile')}
            className={`flex-1 py-3 px-4 rounded-lg font-medium transition-all flex items-center justify-center gap-2 ${
              authType === 'mobile'
                ? 'bg-primary-600 text-white shadow-md'
                : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
            }`}
          >
            <Phone className="h-4 w-4" />
            Mobile Number
          </button>
          <button
            type="button"
            onClick={() => setAuthType('email')}
            className={`flex-1 py-3 px-4 rounded-lg font-medium transition-all flex items-center justify-center gap-2 ${
              authType === 'email'
                ? 'bg-primary-600 text-white shadow-md'
                : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
            }`}
          >
            <Mail className="h-4 w-4" />
            Email
          </button>
        </div>

        {error && (
          <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg mb-4 text-sm">
            {error}
          </div>
        )}

        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Full Name
            </label>
            <input
              type="text"
              required
              value={fullName}
              onChange={(e) => setFullName(e.target.value)}
              className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              placeholder="Enter your full name"
            />
          </div>

          {authType === 'email' ? (
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Email Address
              </label>
              <input
                type="email"
                required
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                placeholder="you@example.com"
              />
            </div>
          ) : (
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Mobile Number
              </label>
              <div className="flex gap-2">
                <div className="w-20 px-3 py-3 border border-gray-300 rounded-lg bg-gray-50 flex items-center justify-center font-medium text-gray-700">
                  +91
                </div>
                <input
                  type="tel"
                  required
                  value={mobile}
                  onChange={(e) => setMobile(e.target.value.replace(/\D/g, '').slice(0, 10))}
                  className="flex-1 px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                  placeholder="9876543210"
                  pattern="[0-9]{10}"
                  maxLength={10}
                />
              </div>
            </div>
          )}

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Password
            </label>
            <input
              type="password"
              required
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
              placeholder="Create a password (min 6 characters)"
              minLength={6}
            />
          </div>

          <div className="flex items-start gap-2">
            <input
              type="checkbox"
              id="terms"
              checked={agreeToTerms}
              onChange={(e) => setAgreeToTerms(e.target.checked)}
              className="mt-1 h-4 w-4 text-primary-600 border-gray-300 rounded focus:ring-primary-500"
            />
            <label htmlFor="terms" className="text-sm text-gray-600">
              I agree to the{' '}
              <a href="#" className="text-primary-600 hover:text-primary-700 font-medium">
                Terms & Conditions
              </a>{' '}
              and{' '}
              <a href="#" className="text-primary-600 hover:text-primary-700 font-medium">
                Privacy Policy
              </a>
            </label>
          </div>

          <button
            type="submit"
            disabled={loading}
            className="w-full bg-gradient-to-r from-amber-400 via-yellow-500 to-amber-500 text-gray-900 py-3.5 rounded-lg hover:from-amber-500 hover:via-yellow-600 hover:to-amber-600 transition-all font-semibold shadow-md hover:shadow-lg disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {loading ? 'Creating Account...' : authType === 'email' ? 'Continue with Email' : 'Send OTP'}
          </button>
        </form>

        <div className="mt-6 text-center">
          <p className="text-sm text-gray-600">
            Already have an account?{' '}
            <a href="/?auth=signin" className="text-primary-600 hover:text-primary-700 font-semibold">
              Sign in here
            </a>
          </p>
        </div>
      </div>
    </div>
  )
}
