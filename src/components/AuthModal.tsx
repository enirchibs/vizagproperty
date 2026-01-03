import { useState, useEffect } from 'react'
import { X, Home, Search, CheckCircle2 } from 'lucide-react'
import { useAuth } from '../contexts/AuthContext'

interface AuthModalProps {
  onClose: () => void
  intentRole?: 'buyer' | 'owner'
  redirectTo?: string
}

export function AuthModal({ onClose, intentRole = 'buyer', redirectTo }: AuthModalProps) {
  const { user, signInWithPhone, verifyOtp } = useAuth()
  const [countryCode, setCountryCode] = useState('+91')
  const [phoneNumber, setPhoneNumber] = useState('')
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
            {!otpSent ? (
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
              </>
            ) : (
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
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
