import { useState, useEffect } from 'react'
import { X, Home, Search, CheckCircle2 } from 'lucide-react'
import { useAuth } from '../contexts/AuthContext'

interface AuthModalProps {
  onClose: () => void
  intentRole?: 'buyer' | 'owner'
  redirectTo?: string
}

type AuthMethod = 'phone' | 'email' | 'google'

export function AuthModal({ onClose, intentRole = 'buyer', redirectTo }: AuthModalProps) {
  const { signInWithPhone, verifyOtp, signInWithEmail, signUpWithEmail, signInWithOAuth } = useAuth()
  const [authMethod, setAuthMethod] = useState<AuthMethod>('phone')
  const [countryCode, setCountryCode] = useState('+91')
  const [phoneNumber, setPhoneNumber] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [name, setName] = useState('')
  const [isSignUp, setIsSignUp] = useState(false)
  const [otp, setOtp] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [otpSent, setOtpSent] = useState(false)
  const [resendTimer, setResendTimer] = useState(0)
  const [resendAttempts, setResendAttempts] = useState(0)

  useEffect(() => {
    if (resendTimer > 0) {
      const interval = setInterval(() => {
        setResendTimer((prev) => prev - 1)
      }, 1000)
      return () => clearInterval(interval)
    }
  }, [resendTimer])

  const validatePhoneNumber = (phone: string) => {
    const cleaned = phone.replace(/\D/g, '')
    return cleaned.length === 10 && /^[6-9]\d{9}$/.test(cleaned)
  }

  const handleSendOtp = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')

    if (!validatePhoneNumber(phoneNumber)) {
      setError('Please enter a valid 10-digit mobile number')
      return
    }

    if (resendAttempts >= 3) {
      setError('Maximum resend attempts reached. Please try again later.')
      return
    }

    setLoading(true)

    try {
      const fullPhone = `${countryCode}${phoneNumber}`
      await signInWithPhone(fullPhone)
      setOtpSent(true)
      setResendTimer(30)
      setResendAttempts((prev) => prev + 1)
    } catch (err: any) {
      setError(err.message || 'Failed to send OTP. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const handleVerifyOtp = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')

    if (otp.length !== 6) {
      setError('Please enter a valid 6-digit OTP')
      return
    }

    setLoading(true)

    try {
      const fullPhone = `${countryCode}${phoneNumber}`
      await verifyOtp(fullPhone, otp, intentRole, redirectTo)
      onClose()
    } catch (err: any) {
      setError(err.message || 'Invalid OTP. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const handleEmailAuth = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')

    if (isSignUp) {
      if (!name) {
        setError('Please enter your name')
        return
      }
      const passwordError = validatePassword(password)
      if (passwordError) {
        setError(passwordError)
        return
      }
    }

    setLoading(true)

    try {
      if (isSignUp) {
        await signUpWithEmail(email, password, name, intentRole, redirectTo)
      } else {
        await signInWithEmail(email, password, redirectTo)
      }
      onClose()
    } catch (err: any) {
      setError(err.message || 'Authentication failed. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const handleOAuthSignIn = async () => {
    setError('')
    setLoading(true)

    try {
      await signInWithOAuth('google', intentRole, redirectTo)
    } catch (err: any) {
      setError(err.message || 'Authentication failed. Please try again.')
      setLoading(false)
    }
  }

  const validatePassword = (password: string): string | null => {
    if (password.length < 8) {
      return 'Password must be at least 8 characters long'
    }
    if (!/\d/.test(password)) {
      return 'Password must contain at least one number'
    }
    if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) {
      return 'Password must contain at least one special character'
    }
    return null
  }

  const handleResendOtp = async () => {
    if (resendTimer > 0 || resendAttempts >= 3) return
    setOtp('')
    await handleSendOtp(new Event('submit') as any)
  }

  const maskPhoneNumber = (phone: string) => {
    if (phone.length < 10) return phone
    return `XXXXXXX${phone.slice(-3)}`
  }

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl max-w-4xl w-full overflow-hidden shadow-2xl animate-slide-up">
        <button
          onClick={onClose}
          className="absolute top-4 right-4 text-gray-400 hover:text-gray-600 z-10"
        >
          <X className="h-6 w-6" />
        </button>

        <div className="flex flex-col md:flex-row">
          <div className="bg-gradient-to-br from-primary-600 to-primary-800 text-white p-8 md:p-12 md:w-2/5 flex flex-col justify-center">
            <div className="flex items-center gap-3 mb-6">
              <div className="bg-white bg-opacity-20 p-3 rounded-lg">
                <Home className="h-8 w-8" />
              </div>
              <Search className="h-6 w-6" />
            </div>

            <h2 className="text-3xl font-bold mb-6">Login / Sign up</h2>

            <div className="space-y-4">
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-6 w-6 flex-shrink-0 mt-0.5" />
                <p className="text-lg">Zero brokerage</p>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-6 w-6 flex-shrink-0 mt-0.5" />
                <p className="text-lg">No spam calls</p>
              </div>
              <div className="flex items-start gap-3">
                <CheckCircle2 className="h-6 w-6 flex-shrink-0 mt-0.5" />
                <p className="text-lg">Search with AI agents / Whatsapp</p>
              </div>
            </div>
          </div>

          <div className="p-8 md:p-12 md:w-3/5 flex flex-col justify-center">
            {authMethod === 'phone' && !otpSent ? (
              <>
                <h3 className="text-2xl font-bold text-gray-900 mb-6">
                  Enter phone to continue
                </h3>

                {error && (
                  <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg mb-4 text-sm">
                    {error}
                  </div>
                )}

                <form onSubmit={handleSendOtp} className="space-y-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Country
                    </label>
                    <select
                      value={countryCode}
                      onChange={(e) => setCountryCode(e.target.value)}
                      className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent bg-white text-gray-900"
                    >
                      <option value="+91">India +91</option>
                    </select>
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Mobile Number
                    </label>
                    <input
                      type="tel"
                      required
                      value={phoneNumber}
                      onChange={(e) => setPhoneNumber(e.target.value.replace(/\D/g, '').slice(0, 10))}
                      className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent text-lg"
                      placeholder="Enter Mobile Number"
                      maxLength={10}
                    />
                  </div>

                  <button
                    type="submit"
                    disabled={loading || !phoneNumber}
                    className="w-full bg-primary-600 text-white py-3 rounded-lg hover:bg-primary-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed font-semibold text-lg"
                  >
                    {loading ? 'Sending OTP...' : 'Continue'}
                  </button>
                </form>

                <div className="mt-6">
                  <div className="relative">
                    <div className="absolute inset-0 flex items-center">
                      <div className="w-full border-t border-gray-300"></div>
                    </div>
                    <div className="relative flex justify-center text-sm">
                      <span className="px-2 bg-white text-gray-500">Or continue with</span>
                    </div>
                  </div>

                  <div className="mt-6">
                    <button
                      onClick={handleOAuthSignIn}
                      disabled={loading}
                      className="w-full flex items-center justify-center gap-2 px-4 py-3 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors disabled:opacity-50 mb-3"
                    >
                      <svg className="h-5 w-5" viewBox="0 0 24 24">
                        <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                        <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                        <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                        <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                      </svg>
                      <span className="text-sm font-medium">Continue with Google</span>
                    </button>

                    <button
                      onClick={() => setAuthMethod('email')}
                      className="w-full text-sm text-primary-600 hover:text-primary-700 font-medium"
                    >
                      Continue with Email & Password
                    </button>
                  </div>
                </div>
              </>
            ) : authMethod === 'phone' && otpSent ? (
              <>
                <h3 className="text-2xl font-bold text-gray-900 mb-2">
                  Verify OTP
                </h3>
                <p className="text-gray-600 mb-6">
                  Enter OTP sent to {countryCode} {maskPhoneNumber(phoneNumber)}
                </p>

                {error && (
                  <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg mb-4 text-sm">
                    {error}
                  </div>
                )}

                <form onSubmit={handleVerifyOtp} className="space-y-4">
                  <div>
                    <input
                      type="text"
                      required
                      value={otp}
                      onChange={(e) => setOtp(e.target.value.replace(/\D/g, '').slice(0, 6))}
                      className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent text-center text-2xl tracking-widest"
                      placeholder="000000"
                      maxLength={6}
                    />
                  </div>

                  <button
                    type="submit"
                    disabled={loading || otp.length !== 6}
                    className="w-full bg-primary-600 text-white py-3 rounded-lg hover:bg-primary-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed font-semibold text-lg"
                  >
                    {loading ? 'Verifying...' : 'Verify OTP'}
                  </button>
                </form>

                <div className="mt-4 text-center">
                  {resendTimer > 0 ? (
                    <p className="text-gray-600 text-sm">
                      Resend OTP in {resendTimer}s
                    </p>
                  ) : (
                    <button
                      onClick={handleResendOtp}
                      disabled={resendAttempts >= 3}
                      className="text-primary-600 hover:text-primary-700 text-sm font-medium disabled:opacity-50 disabled:cursor-not-allowed"
                    >
                      Resend OTP
                    </button>
                  )}
                </div>

                <button
                  onClick={() => {
                    setOtpSent(false)
                    setOtp('')
                    setError('')
                  }}
                  className="mt-4 text-gray-600 hover:text-gray-800 text-sm text-center w-full"
                >
                  Change mobile number
                </button>
              </>
            ) : authMethod === 'email' ? (
              <>
                <h3 className="text-2xl font-bold text-gray-900 mb-6">
                  {isSignUp ? 'Create Account' : 'Sign In with Email'}
                </h3>

                {error && (
                  <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg mb-4 text-sm">
                    {error}
                  </div>
                )}

                <form onSubmit={handleEmailAuth} className="space-y-4">
                  {isSignUp && (
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-2">
                        Full Name
                      </label>
                      <input
                        type="text"
                        required
                        value={name}
                        onChange={(e) => setName(e.target.value)}
                        className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                        placeholder="Enter your name"
                      />
                    </div>
                  )}

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Email
                    </label>
                    <input
                      type="email"
                      required
                      value={email}
                      onChange={(e) => setEmail(e.target.value)}
                      className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                      placeholder="Enter your email"
                    />
                  </div>

                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-2">
                      Password
                    </label>
                    <input
                      type="password"
                      required
                      value={password}
                      onChange={(e) => setPassword(e.target.value)}
                      className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent"
                      placeholder={isSignUp ? "Create a password" : "Enter your password"}
                      minLength={8}
                    />
                    {isSignUp && (
                      <p className="text-xs text-gray-500 mt-1">
                        Must be at least 8 characters with 1 number and 1 special character
                      </p>
                    )}
                  </div>

                  <button
                    type="submit"
                    disabled={loading}
                    className="w-full bg-primary-600 text-white py-3 rounded-lg hover:bg-primary-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed font-semibold text-lg"
                  >
                    {loading ? 'Please wait...' : (isSignUp ? 'Create Account' : 'Sign In')}
                  </button>
                </form>

                <div className="mt-4 text-center">
                  <button
                    onClick={() => setIsSignUp(!isSignUp)}
                    className="text-sm text-primary-600 hover:text-primary-700 font-medium"
                  >
                    {isSignUp ? 'Already have an account? Sign in' : "Don't have an account? Sign up"}
                  </button>
                </div>

                <div className="mt-4 text-center">
                  <button
                    onClick={() => setAuthMethod('phone')}
                    className="text-sm text-gray-600 hover:text-gray-800"
                  >
                    Use phone instead
                  </button>
                </div>
              </>
            ) : null}
          </div>
        </div>
      </div>
    </div>
  )
}
