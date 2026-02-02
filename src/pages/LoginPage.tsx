import { useEffect, useState } from 'react'
import { useNavigate, useLocation } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { Chrome, Home, ArrowLeft } from 'lucide-react'

export function LoginPage() {
  const navigate = useNavigate()
  const location = useLocation()
  const { user, loading, signInWithPhone, verifyOtp, signInWithEmail, signUpWithEmail, signInWithGoogle } = useAuth()

  const [authMode, setAuthMode] = useState<'phone' | 'email'>('phone')
  const [isSignUp, setIsSignUp] = useState(false)
  const [phoneNumber, setPhoneNumber] = useState('')
  const [otp, setOtp] = useState('')
  const [showOtpInput, setShowOtpInput] = useState(false)
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [authLoading, setAuthLoading] = useState(false)
  const [error, setError] = useState('')
  const intentRole: 'buyer' | 'owner' = 'buyer'
  const [countryCode] = useState('+91')

  const redirectParam = new URLSearchParams(location.search).get('redirect') || '/'

  useEffect(() => {
    if (user && !loading) {
      navigate(redirectParam)
    }
  }, [user, loading, navigate, redirectParam])

  const handlePhoneSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')
    setAuthLoading(true)

    try {
      const formattedPhone = phoneNumber.startsWith('+91') ? phoneNumber : `+91${phoneNumber}`
      await signInWithPhone(formattedPhone)
      setShowOtpInput(true)
      setError('')
    } catch (err: any) {
      setError(err.message || 'Failed to send OTP. Please try again.')
    } finally {
      setAuthLoading(false)
    }
  }

  const handleOtpSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')
    setAuthLoading(true)

    try {
      const formattedPhone = phoneNumber.startsWith('+91') ? phoneNumber : `+91${phoneNumber}`
      await verifyOtp(formattedPhone, otp, intentRole, redirectParam)
    } catch (err: any) {
      setError(err.message || 'Invalid OTP. Please try again.')
    } finally {
      setAuthLoading(false)
    }
  }

  const handleEmailAuth = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')
    setAuthLoading(true)

    try {
      if (isSignUp) {
        await signUpWithEmail(email, password, intentRole)
        setError('Account created! Logging you in...')
      } else {
        await signInWithEmail(email, password)
      }
    } catch (err: any) {
      setError(err.message || 'Authentication failed. Please try again.')
    } finally {
      setAuthLoading(false)
    }
  }

  const handleGoogleSignIn = async () => {
    setError('')
    setAuthLoading(true)
    try {
      await signInWithGoogle()
    } catch (err: any) {
      setError(err.message || 'Google sign in failed.')
      setAuthLoading(false)
    }
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600" />
      </div>
    )
  }

  return (
    <div className="min-h-screen flex flex-col md:flex-row">
      <div className="hidden md:flex w-1/2 bg-indigo-700 text-white p-10 flex-col justify-center">
        <div className="max-w-md">
          <div className="inline-flex items-center justify-center w-16 h-16 bg-white/10 rounded-2xl mb-6">
            <Home className="h-8 w-8 text-white" />
          </div>
          <h1 className="text-4xl font-bold mb-4">Welcome to VizagProperty</h1>
          <p className="text-indigo-200 text-lg leading-relaxed">
            Find your dream property in Visakhapatnam. Connect with verified owners, explore thousands of listings, and make informed decisions.
          </p>
          <div className="mt-8 space-y-3">
            <div className="flex items-center gap-3">
              <div className="w-6 h-6 bg-indigo-500 rounded-full flex items-center justify-center text-sm">✓</div>
              <span className="text-indigo-100">Verified Properties</span>
            </div>
            <div className="flex items-center gap-3">
              <div className="w-6 h-6 bg-indigo-500 rounded-full flex items-center justify-center text-sm">✓</div>
              <span className="text-indigo-100">Direct Owner Contact</span>
            </div>
            <div className="flex items-center gap-3">
              <div className="w-6 h-6 bg-indigo-500 rounded-full flex items-center justify-center text-sm">✓</div>
              <span className="text-indigo-100">Zero Brokerage</span>
            </div>
          </div>
        </div>
      </div>

      <div className="w-full md:w-1/2 p-6 flex flex-col justify-center">
        <div className="max-w-md w-full mx-auto">
          <button
            onClick={() => navigate('/')}
            className="flex items-center gap-2 text-gray-600 hover:text-gray-900 mb-6 transition-colors"
          >
            <ArrowLeft className="h-5 w-5" />
            <span>Back to Home</span>
          </button>

          <div className="mb-8">
            <h2 className="text-3xl font-bold text-gray-900 mb-2">
              {showOtpInput ? 'Verify OTP' : isSignUp ? 'Create Account' : 'Sign In'}
            </h2>
            <p className="text-gray-600">
              {showOtpInput
                ? `Enter the code sent to ${countryCode} ${phoneNumber}`
                : 'Continue to your account'}
            </p>
          </div>

          {!showOtpInput && (
            <div className="flex bg-gray-100 rounded-lg p-1 mb-4">
              <button
                onClick={() => setAuthMode('phone')}
                className={`flex-1 py-2 rounded-md ${
                  authMode === 'phone'
                    ? 'bg-indigo-600 text-white'
                    : 'text-gray-700'
                }`}
              >
                Phone
              </button>
              <button
                onClick={() => setAuthMode('email')}
                className={`flex-1 py-2 rounded-md ${
                  authMode === 'email'
                    ? 'bg-indigo-600 text-white'
                    : 'text-gray-700'
                }`}
              >
                Email
              </button>
            </div>
          )}

          {authMode === 'phone' ? (
            <>
              {!showOtpInput ? (
                <form onSubmit={handlePhoneSubmit}>
                  <select className="w-full border rounded-lg p-3 mb-3">
                    <option>India {countryCode}</option>
                  </select>

                  <input
                    type="tel"
                    value={phoneNumber}
                    onChange={(e) => setPhoneNumber(e.target.value.replace(/\D/g, ''))}
                    placeholder="Enter Mobile Number"
                    className="w-full border rounded-lg p-3 mb-4"
                    maxLength={10}
                    required
                  />

                  {error && <p className="text-red-600 text-sm mb-4">{error}</p>}

                  <button
                    type="submit"
                    disabled={authLoading || phoneNumber.length !== 10}
                    className="w-full bg-indigo-500 text-white py-3 rounded-lg disabled:opacity-50"
                  >
                    {authLoading ? 'Sending OTP...' : 'Continue'}
                  </button>
                </form>
              ) : (
                <form onSubmit={handleOtpSubmit}>
                  <input
                    type="text"
                    value={otp}
                    onChange={(e) => setOtp(e.target.value.replace(/\D/g, ''))}
                    placeholder="Enter 6-digit OTP"
                    className="w-full border rounded-lg p-3 mb-4 text-center text-2xl tracking-widest"
                    maxLength={6}
                    required
                  />

                  {error && <p className="text-red-600 text-sm mb-4 text-center">{error}</p>}

                  <button
                    type="submit"
                    disabled={authLoading || otp.length !== 6}
                    className="w-full bg-indigo-500 text-white py-3 rounded-lg mb-3 disabled:opacity-50"
                  >
                    {authLoading ? 'Verifying...' : 'Verify OTP'}
                  </button>

                  <button
                    type="button"
                    onClick={() => {
                      setShowOtpInput(false)
                      setOtp('')
                      setError('')
                    }}
                    className="w-full text-indigo-600 text-sm"
                  >
                    Change Phone Number
                  </button>
                </form>
              )}
            </>
          ) : (
            <form onSubmit={handleEmailAuth}>
              <input
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="Email Address"
                className="w-full border rounded-lg p-3 mb-3"
                required
              />

              <input
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="Password"
                className="w-full border rounded-lg p-3 mb-4"
                required
                minLength={6}
              />

              {error && <p className="text-red-600 text-sm mb-4">{error}</p>}

              <button
                type="submit"
                disabled={authLoading}
                className="w-full bg-indigo-500 text-white py-3 rounded-lg mb-3 disabled:opacity-50"
              >
                {authLoading ? (isSignUp ? 'Creating Account...' : 'Signing In...') : (isSignUp ? 'Sign Up' : 'Sign In')}
              </button>

              <button
                type="button"
                onClick={() => {
                  setIsSignUp(!isSignUp)
                  setError('')
                }}
                className="w-full text-indigo-600 text-sm"
              >
                {isSignUp ? 'Already have an account? Sign In' : 'Need an account? Sign Up'}
              </button>
            </form>
          )}

          <div className="flex items-center my-6">
            <div className="flex-grow border-t"></div>
            <span className="mx-3 text-gray-400 text-sm">Or continue with</span>
            <div className="flex-grow border-t"></div>
          </div>

          <button
            onClick={handleGoogleSignIn}
            disabled={authLoading}
            className="w-full border py-3 rounded-lg flex items-center justify-center gap-2 disabled:opacity-50"
          >
            <Chrome className="h-5" />
            Sign in with Google
          </button>
        </div>
      </div>
    </div>
  )
}
