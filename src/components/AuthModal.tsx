import { useState, useEffect } from 'react'
import { Home } from 'lucide-react'
import { useAuth } from '../contexts/AuthContext'

interface AuthModalProps {
  onClose: () => void
  intentRole?: 'buyer' | 'owner'
  redirectTo?: string
}

export function AuthModal({ onClose, intentRole = 'buyer', redirectTo }: AuthModalProps) {
  const { user, signInWithPhone, verifyOtp, signInWithEmail, signUpWithEmail, signInWithGoogle } = useAuth()
  const [authMethod, setAuthMethod] = useState<'phone' | 'email'>('phone')
  const [countryCode, setCountryCode] = useState('+91')
  const [phoneNumber, setPhoneNumber] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [otp, setOtp] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [otpSent, setOtpSent] = useState(false)
  const [resendTimer, setResendTimer] = useState(0)
  const [resendAttempts, setResendAttempts] = useState(0)

  useEffect(() => {
    if (user) {
      onClose()
      if (redirectTo) {
        setTimeout(() => {
          window.location.href = redirectTo
        }, 100)
      }
    }
  }, [user, onClose, redirectTo])

  if (user) {
    return null
  }

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

  const handleResendOtp = async () => {
    if (resendTimer > 0 || resendAttempts >= 3) return
    setOtp('')
    await handleSendOtp(new Event('submit') as any)
  }

  const handleEmailAuth = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')

    if (!email || !password) {
      setError('Please enter both email and password')
      return
    }

    if (password.length < 6) {
      setError('Password must be at least 6 characters')
      return
    }

    setLoading(true)

    try {
      try {
        await signInWithEmail(email, password)
      } catch (loginError: any) {
        if (loginError.message?.includes('Invalid login credentials') || loginError.message?.includes('User not found')) {
          await signUpWithEmail(email, password, intentRole)
        } else {
          throw loginError
        }
      }

      onClose()
      if (redirectTo) {
        setTimeout(() => {
          window.location.href = redirectTo
        }, 100)
      }
    } catch (err: any) {
      setError(err.message || 'Authentication failed. Please try again.')
    } finally {
      setLoading(false)
    }
  }

  const handleGoogleAuth = async () => {
    setError('')
    setLoading(true)

    try {
      await signInWithGoogle()
    } catch (err: any) {
      setError(err.message || 'Google sign-in failed. Please try again.')
      setLoading(false)
    }
  }

  const maskPhoneNumber = (phone: string) => {
    if (phone.length < 10) return phone
    return `XXXXXXX${phone.slice(-3)}`
  }

  return (
    <div className="fixed inset-0 bg-black/40 flex items-end md:items-center justify-center z-50">
      <div className="bg-white w-full md:max-w-4xl md:mx-4 rounded-t-2xl md:rounded-2xl overflow-hidden shadow-2xl animate-slide-up max-h-[95vh] md:max-h-[90vh] overflow-y-auto relative md:flex">
        <div className="hidden md:flex md:w-1/2 bg-gradient-to-b from-[#2F4DA0] to-[#1E3A8A] text-white p-8 flex-col justify-center">
          <div className="space-y-6">
            <h3 className="text-2xl font-bold">Login / Sign up</h3>

            <div className="space-y-4">
              <div className="flex items-start gap-3">
                <span className="text-green-400 text-xl flex-shrink-0">✓</span>
                <span className="text-base">Zero brokerage</span>
              </div>
              <div className="flex items-start gap-3">
                <span className="text-green-400 text-xl flex-shrink-0">✓</span>
                <span className="text-base">No spam calls</span>
              </div>
              <div className="flex items-start gap-3">
                <span className="text-green-400 text-xl flex-shrink-0">✓</span>
                <span className="text-base">Search with AI agents / WhatsApp</span>
              </div>
            </div>
          </div>
        </div>

        <div className="p-4 md:p-6 md:w-1/2">
          {!otpSent ? (
            <>
              <div className="flex items-center justify-between mb-6">
                <div className="flex items-center gap-2">
                  <Home className="h-5 w-5 text-primary-600" />
                  <h2 className="text-lg font-semibold text-gray-900">Login / Sign up</h2>
                </div>
                <button
                  onClick={onClose}
                  className="text-gray-500 hover:text-gray-700 text-2xl leading-none"
                >
                  ✕
                </button>
              </div>

              <p className="text-sm text-gray-600 text-center mb-6">Zero brokerage • No spam calls</p>

              <div className="bg-gray-100 rounded-lg p-1 mb-6">
                <div className="flex gap-1">
                  <button
                    onClick={() => setAuthMethod('phone')}
                    className={`flex-1 py-2.5 text-sm font-medium rounded-md transition-all ${
                      authMethod === 'phone'
                        ? 'bg-[#2F4DA0] text-white shadow-sm'
                        : 'text-gray-600 hover:text-gray-900'
                    }`}
                  >
                    Phone
                  </button>
                  <button
                    onClick={() => setAuthMethod('email')}
                    className={`flex-1 py-2.5 text-sm font-medium rounded-md transition-all ${
                      authMethod === 'email'
                        ? 'bg-[#2F4DA0] text-white shadow-sm'
                        : 'text-gray-600 hover:text-gray-900'
                    }`}
                  >
                    Email
                  </button>
                </div>
              </div>

              {error && (
                <div className="bg-red-50 text-red-600 px-4 py-3 rounded-xl mb-4 text-sm">
                  {error}
                </div>
              )}

              {authMethod === 'phone' ? (
                <form onSubmit={handleSendOtp} className="space-y-3">
                  <div>
                    <label className="block text-sm text-gray-600 mb-2">
                      Country
                    </label>
                    <select
                      value={countryCode}
                      onChange={(e) => setCountryCode(e.target.value)}
                      className="w-full h-11 px-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#2F4DA0] focus:border-transparent bg-white"
                    >
                      <option value="+91">India +91</option>
                    </select>
                  </div>

                  <div>
                    <label className="block text-sm text-gray-600 mb-2">
                      Mobile Number
                    </label>
                    <input
                      type="tel"
                      required
                      value={phoneNumber}
                      onChange={(e) => setPhoneNumber(e.target.value.replace(/\D/g, '').slice(0, 10))}
                      className="w-full h-11 px-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#2F4DA0] focus:border-transparent"
                      placeholder="Enter Mobile Number"
                      maxLength={10}
                    />
                  </div>

                  <button
                    type="submit"
                    disabled={loading || phoneNumber.length !== 10}
                    className="w-full h-11 mt-4 bg-[#2F4DA0] text-white rounded-lg font-semibold hover:bg-[#253a7a] transition-all disabled:opacity-50 disabled:cursor-not-allowed active:scale-[0.98]"
                  >
                    {loading ? 'Sending OTP...' : 'Continue'}
                  </button>
                </form>
              ) : (
                <>
                  <form onSubmit={handleEmailAuth} className="space-y-3">
                    <div>
                      <label className="block text-sm text-gray-600 mb-2">
                        Email
                      </label>
                      <input
                        type="email"
                        required
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        className="w-full h-11 px-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#2F4DA0] focus:border-transparent"
                        placeholder="Enter email"
                      />
                    </div>

                    <div>
                      <label className="block text-sm text-gray-600 mb-2">
                        Password
                      </label>
                      <input
                        type="password"
                        required
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        className="w-full h-11 px-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#2F4DA0] focus:border-transparent"
                        placeholder="Enter password"
                      />
                    </div>

                    <button
                      type="submit"
                      disabled={loading || !email || !password}
                      className="w-full h-11 mt-4 bg-[#2F4DA0] text-white rounded-lg font-semibold hover:bg-[#253a7a] transition-all disabled:opacity-50 disabled:cursor-not-allowed active:scale-[0.98]"
                    >
                      {loading ? 'Please wait...' : 'Continue'}
                    </button>
                  </form>
                </>
              )}

              <div className="flex items-center my-4">
                <div className="flex-1 h-px bg-gray-300"></div>
                <span className="px-3 text-sm text-gray-500">Or continue with</span>
                <div className="flex-1 h-px bg-gray-300"></div>
              </div>

              <button
                onClick={handleGoogleAuth}
                disabled={loading}
                className="w-full h-11 border border-gray-300 rounded-lg flex items-center justify-center gap-2 hover:bg-gray-50 transition-all disabled:opacity-50 disabled:cursor-not-allowed active:scale-[0.98]"
              >
                <svg className="w-5 h-5" viewBox="0 0 24 24">
                  <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                  <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                  <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                  <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                </svg>
                <span className="text-sm font-medium">Sign in with Google</span>
              </button>
            </>
          ) : (
            <>
              <div className="flex items-center justify-between mb-6">
                <div className="flex items-center gap-2">
                  <Home className="h-5 w-5 text-primary-600" />
                  <h2 className="text-lg font-semibold text-gray-900">Verify OTP</h2>
                </div>
                <button
                  onClick={onClose}
                  className="text-gray-500 hover:text-gray-700 text-2xl leading-none"
                >
                  ✕
                </button>
              </div>

              <p className="text-sm text-gray-600 text-center mb-6">
                Enter OTP sent to {countryCode} {maskPhoneNumber(phoneNumber)}
              </p>

              {error && (
                <div className="bg-red-50 text-red-600 px-4 py-3 rounded-xl mb-4 text-sm">
                  {error}
                </div>
              )}

              <form onSubmit={handleVerifyOtp} className="space-y-4">
                <div>
                  <label className="block text-sm text-gray-600 mb-2">
                    Enter OTP
                  </label>
                  <input
                    type="text"
                    required
                    value={otp}
                    onChange={(e) => setOtp(e.target.value.replace(/\D/g, '').slice(0, 6))}
                    className="w-full h-14 px-4 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-[#2F4DA0] focus:border-transparent text-center text-2xl tracking-[0.5em] font-bold"
                    placeholder="000000"
                    maxLength={6}
                  />
                </div>

                <button
                  type="submit"
                  disabled={loading || otp.length !== 6}
                  className="w-full h-11 mt-4 bg-[#2F4DA0] text-white rounded-lg font-semibold hover:bg-[#253a7a] transition-all disabled:opacity-50 disabled:cursor-not-allowed active:scale-[0.98]"
                >
                  {loading ? 'Verifying...' : 'Verify OTP'}
                </button>
              </form>

              <div className="mt-6 text-center">
                {resendTimer > 0 ? (
                  <p className="text-gray-600 text-sm font-medium">
                    Resend OTP in {resendTimer}s
                  </p>
                ) : (
                  <button
                    onClick={handleResendOtp}
                    disabled={resendAttempts >= 3}
                    className="text-[#2F4DA0] hover:text-[#253a7a] text-sm font-semibold disabled:opacity-50 disabled:cursor-not-allowed"
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
                className="mt-6 text-gray-600 hover:text-gray-800 text-sm font-semibold text-center w-full"
              >
                Change mobile number
              </button>
            </>
          )}
        </div>
      </div>
    </div>
  )
}
