import { useEffect, useState, useRef } from 'react'
import { useNavigate, useLocation } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { Chrome, X } from 'lucide-react'

export function LoginPage() {
  const navigate = useNavigate()
  const location = useLocation()
  const { user, loading, signInWithPhone, verifyOtp, signInWithEmail, signUpWithEmail, signInWithGoogle } = useAuth()

  const lastMethod = (localStorage.getItem('lastLogin') || 'phone') as 'phone' | 'email'
  const [authMode, setAuthMode] = useState<'phone' | 'email'>(lastMethod)
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
  const [otpSecondsLeft, setOtpSecondsLeft] = useState(60)
  const [canResendOtp, setCanResendOtp] = useState(false)
  const [shakeError, setShakeError] = useState(false)

  const phoneInputRef = useRef<HTMLInputElement>(null)
  const emailInputRef = useRef<HTMLInputElement>(null)
  const otpInputRef = useRef<HTMLInputElement>(null)

  const redirectParam = new URLSearchParams(location.search).get('redirect') || '/'

  useEffect(() => {
    if (user && !loading) {
      navigate(redirectParam)
    }
  }, [user, loading, navigate, redirectParam])

  useEffect(() => {
    if (showOtpInput) {
      setTimeout(() => {
        otpInputRef.current?.focus()
      }, 100)
    } else if (authMode === 'phone') {
      setTimeout(() => {
        phoneInputRef.current?.focus()
      }, 300)
    } else if (authMode === 'email') {
      setTimeout(() => {
        emailInputRef.current?.focus()
      }, 300)
    }
  }, [authMode, showOtpInput])

  useEffect(() => {
    if (!showOtpInput) return

    if (otpSecondsLeft === 0) {
      setCanResendOtp(true)
      return
    }

    const timer = setInterval(() => {
      setOtpSecondsLeft((s) => s - 1)
    }, 1000)

    return () => clearInterval(timer)
  }, [otpSecondsLeft, showOtpInput])

  const handlePhoneSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')
    setAuthLoading(true)

    try {
      const formattedPhone = phoneNumber.startsWith('+91') ? phoneNumber : `+91${phoneNumber}`
      await signInWithPhone(formattedPhone)
      setShowOtpInput(true)
      setOtpSecondsLeft(60)
      setCanResendOtp(false)
      setError('')
    } catch (err: any) {
      setError(err.message || 'Failed to send OTP. Please try again.')
    } finally {
      setAuthLoading(false)
    }
  }

  const handleResendOtp = async () => {
    if (!canResendOtp || authLoading) return

    setError('')
    setAuthLoading(true)

    try {
      const formattedPhone = phoneNumber.startsWith('+91') ? phoneNumber : `+91${phoneNumber}`
      await signInWithPhone(formattedPhone)
      setOtpSecondsLeft(60)
      setCanResendOtp(false)
      setOtp('')
      setError('OTP sent successfully')
    } catch (err: any) {
      setError(err.message || 'Failed to resend OTP. Please try again.')
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
      localStorage.setItem('lastLogin', 'phone')
    } catch (err: any) {
      setError(err.message || 'Invalid OTP. Please try again.')
      setShakeError(true)
      setTimeout(() => setShakeError(false), 300)
      setOtp('')
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
      localStorage.setItem('lastLogin', 'email')
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
      localStorage.setItem('lastLogin', 'phone')
    } catch (err: any) {
      setError(err.message || 'Google sign in failed.')
      setAuthLoading(false)
    }
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-black/40">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-indigo-600" />
      </div>
    )
  }

  return (
    <div className="fixed inset-0 z-50 bg-black/40 flex items-end animate-fade-in">
      <div className="w-full bg-white rounded-t-3xl animate-slide-up-modal max-h-[90vh] overflow-y-auto shadow-2xl">
        <div className="p-6 pb-8">
          <div className="flex justify-between items-center mb-6">
            <h2 className="text-xl font-bold text-gray-900">
              {showOtpInput ? 'Verify OTP' : 'Login / Sign up'}
            </h2>
            <button
              onClick={() => navigate(-1)}
              className="text-gray-500 hover:text-gray-700 transition-colors p-1"
              aria-label="Close"
            >
              <X className="h-6 w-6" />
            </button>
          </div>

          {showOtpInput && (
            <p className="text-gray-600 text-sm mb-6">
              Enter the code sent to {countryCode} {phoneNumber}
            </p>
          )}

          {!showOtpInput && (
            <ul className="text-sm text-gray-600 space-y-2 mb-6 bg-gray-50 p-4 rounded-xl">
              <li className="flex items-center gap-2">
                <span className="text-green-600 font-bold">✓</span>
                Zero brokerage
              </li>
              <li className="flex items-center gap-2">
                <span className="text-green-600 font-bold">✓</span>
                No spam calls
              </li>
              <li className="flex items-center gap-2">
                <span className="text-green-600 font-bold">✓</span>
                WhatsApp + AI support
              </li>
            </ul>
          )}

          {!showOtpInput && (
            <div className="flex bg-gray-100 rounded-xl p-1 mb-6">
              <button
                onClick={() => setAuthMode('phone')}
                className={`flex-1 py-3 rounded-lg font-medium transition-all ${
                  authMode === 'phone'
                    ? 'bg-indigo-600 text-white shadow-sm'
                    : 'text-gray-700'
                }`}
              >
                Phone
              </button>
              <button
                onClick={() => setAuthMode('email')}
                className={`flex-1 py-3 rounded-lg font-medium transition-all ${
                  authMode === 'email'
                    ? 'bg-indigo-600 text-white shadow-sm'
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
                <form onSubmit={handlePhoneSubmit} className="space-y-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Country Code
                    </label>
                    <select className="w-full border-2 border-gray-200 rounded-xl p-4 text-lg focus:border-indigo-600 focus:outline-none transition-colors">
                      <option>India {countryCode}</option>
                    </select>
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Mobile Number
                    </label>
                    <input
                      ref={phoneInputRef}
                      type="tel"
                      inputMode="numeric"
                      pattern="[0-9]*"
                      autoFocus
                      value={phoneNumber}
                      onChange={(e) => setPhoneNumber(e.target.value.replace(/\D/g, ''))}
                      placeholder="Enter Mobile Number"
                      className="w-full border-2 border-gray-200 rounded-xl p-4 text-lg focus:border-indigo-600 focus:ring-2 focus:ring-indigo-200 focus:outline-none transition-all"
                      maxLength={10}
                      required
                    />
                  </div>

                  {error && <p className="text-red-600 text-sm">{error}</p>}

                  <button
                    type="submit"
                    disabled={authLoading || phoneNumber.length !== 10}
                    className="w-full bg-indigo-600 text-white text-lg py-4 rounded-xl font-semibold disabled:opacity-50 disabled:cursor-not-allowed hover:bg-indigo-700 active:scale-[0.98] transition-all shadow-lg"
                  >
                    {authLoading ? 'Sending OTP...' : 'Continue'}
                  </button>
                </form>
              ) : (
                <form onSubmit={handleOtpSubmit} className="space-y-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Enter OTP
                    </label>
                    <input
                      ref={otpInputRef}
                      type="tel"
                      inputMode="numeric"
                      pattern="[0-9]*"
                      autoFocus
                      value={otp}
                      onChange={(e) => {
                        const value = e.target.value.replace(/\D/g, '')
                        setOtp(value)
                        if (value.length === 6) {
                          handleOtpSubmit(e as any)
                        }
                      }}
                      placeholder="Enter 6-digit OTP"
                      className={`w-full border-2 border-gray-200 rounded-xl p-4 text-center text-2xl tracking-widest focus:border-indigo-600 focus:ring-2 focus:ring-indigo-200 focus:outline-none transition-all ${shakeError ? 'animate-shake border-red-500' : ''}`}
                      maxLength={6}
                      required
                    />
                  </div>

                  {error && <p className="text-red-600 text-sm text-center">{error}</p>}

                  <button
                    type="submit"
                    disabled={authLoading || otp.length !== 6}
                    className="w-full bg-indigo-600 text-white text-lg py-4 rounded-xl font-semibold disabled:opacity-50 disabled:cursor-not-allowed hover:bg-indigo-700 active:scale-[0.98] transition-all shadow-lg"
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
                    className="w-full text-indigo-600 text-sm font-medium hover:text-indigo-700"
                  >
                    Change Phone Number
                  </button>

                  <div className="text-center mt-4 text-sm text-gray-600">
                    {!canResendOtp ? (
                      <>Resend OTP in <span className="font-semibold">{otpSecondsLeft}s</span></>
                    ) : (
                      <button
                        onClick={handleResendOtp}
                        disabled={authLoading}
                        className="text-blue-600 font-semibold hover:underline disabled:opacity-50"
                      >
                        Resend OTP
                      </button>
                    )}
                  </div>
                </form>
              )}
            </>
          ) : (
            <form onSubmit={handleEmailAuth} className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Email Address
                </label>
                <input
                  ref={emailInputRef}
                  type="email"
                  autoFocus
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  placeholder="Enter your email"
                  className="w-full border-2 border-gray-200 rounded-xl p-4 text-lg focus:border-indigo-600 focus:outline-none transition-colors"
                  required
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Password
                </label>
                <input
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder="Enter your password"
                  className="w-full border-2 border-gray-200 rounded-xl p-4 text-lg focus:border-indigo-600 focus:outline-none transition-colors"
                  required
                  minLength={6}
                />
              </div>

              {error && <p className="text-red-600 text-sm">{error}</p>}

              <button
                type="submit"
                disabled={authLoading}
                className="w-full bg-indigo-600 text-white text-lg py-4 rounded-xl font-semibold disabled:opacity-50 disabled:cursor-not-allowed hover:bg-indigo-700 active:scale-[0.98] transition-all shadow-lg"
              >
                {authLoading ? (isSignUp ? 'Creating Account...' : 'Signing In...') : (isSignUp ? 'Sign Up' : 'Sign In')}
              </button>

              <button
                type="button"
                onClick={() => {
                  setIsSignUp(!isSignUp)
                  setError('')
                }}
                className="w-full text-indigo-600 text-sm font-medium hover:text-indigo-700"
              >
                {isSignUp ? 'Already have an account? Sign In' : 'Need an account? Sign Up'}
              </button>
            </form>
          )}

          {!showOtpInput && (
            <>
              <div className="flex items-center my-6">
                <div className="flex-grow border-t border-gray-200"></div>
                <span className="mx-4 text-gray-400 text-sm">Or continue with</span>
                <div className="flex-grow border-t border-gray-200"></div>
              </div>

              <button
                onClick={handleGoogleSignIn}
                disabled={authLoading}
                className="w-full border-2 border-gray-200 py-4 rounded-xl flex items-center justify-center gap-2 disabled:opacity-50 hover:bg-gray-50 active:scale-[0.98] transition-all font-medium"
              >
                <Chrome className="h-5 w-5" />
                Sign in with Google
              </button>
            </>
          )}
        </div>
      </div>
    </div>
  )
}
