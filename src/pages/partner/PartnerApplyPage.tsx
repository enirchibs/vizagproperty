import { useState, useEffect } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Building2, ArrowRight, CheckCircle, AlertCircle } from 'lucide-react'
import { supabase } from '../../lib/supabase'
import { SEOHead } from '../../components/SEOHead'
import { useAuth } from '../../contexts/AuthContext'

export function PartnerApplyPage() {
  const navigate = useNavigate()
  const { user, profile } = useAuth()
  const [loading, setLoading] = useState(false)
  const [success, setSuccess] = useState(false)
  const [error, setError] = useState<string | null>(null)
  
  // If user already applied and is pending/approved
  const [existingApplication, setExistingApplication] = useState<any>(null)
  const [checking, setChecking] = useState(true)

  const [formData, setFormData] = useState({
    fullName: profile?.full_name || profile?.name || '',
    mobile: profile?.phone || '',
    email: profile?.email || '',
    city: 'Visakhapatnam',
    partnerType: 'Agent',
    companyName: '',
    agreeTerms: false
  })

  useEffect(() => {
    window.scrollTo(0, 0)
    
    // Redirect if not logged in
    if (!user) {
      navigate('/login', { state: { returnTo: '/partner/apply' } })
      return
    }

    // Check if user is already a partner or has a pending application
    const checkStatus = async () => {
      if (profile?.is_partner) {
        navigate('/partner/dashboard')
        return
      }

      try {
        const { data, error } = await supabase
          .from('partner_applications')
          .select('*')
          .eq('user_id', user.id)
          .order('created_at', { ascending: false })
          .limit(1)

        if (error) throw error

        if (data && data.length > 0) {
          setExistingApplication(data[0])
        }
      } catch (err) {
        console.error('Error checking application status:', err)
      } finally {
        setChecking(false)
      }
    }

    checkStatus()
  }, [user, profile, navigate])

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value, type } = e.target
    setFormData(prev => ({
      ...prev,
      [name]: type === 'checkbox' ? (e.target as HTMLInputElement).checked : value
    }))
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!user) return

    setLoading(true)
    setError(null)

    try {
      const { error: insertError } = await supabase.from('partner_applications').insert({
        user_id: user.id,
        full_name: formData.fullName,
        mobile: formData.mobile,
        email: formData.email,
        city: formData.city,
        partner_type: formData.partnerType,
        company_name: formData.companyName || null,
        status: 'pending'
      })

      if (insertError) throw insertError

      setSuccess(true)
    } catch (err: any) {
      console.error('Application error:', err)
      setError(err.message || 'Something went wrong while submitting your application.')
    } finally {
      setLoading(false)
    }
  }

  if (checking) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="w-12 h-12 border-4 border-primary-600 border-t-transparent rounded-full animate-spin"></div>
      </div>
    )
  }

  if (existingApplication || success) {
    const app = existingApplication || {
      id: 'PND-' + Math.floor(1000 + Math.random() * 9000),
      status: 'pending',
      partner_type: formData.partnerType,
      email: formData.email,
      mobile: formData.mobile,
      created_at: new Date().toISOString()
    }
    const isApproved = profile?.is_partner && profile?.partner_status === 'approved'
    const isRejected = app.status === 'rejected'
    
    return (
      <div className="min-h-screen bg-gray-50 py-12 px-4 sm:px-6 lg:px-8 flex flex-col items-center">
        <SEOHead title="Application Status | Vizag Property Partners" description="Partner application status." />
        
        <div className="flex justify-center mb-8">
          <Link to="/" className="flex items-center gap-2">
            <div className="bg-primary-600 p-2 rounded-lg">
              <Building2 className="h-8 w-8 text-white" />
            </div>
            <span className="text-2xl font-extrabold text-gray-900 tracking-tight">
              VizagProperty<span className="text-primary-600">.co.in</span>
            </span>
          </Link>
        </div>

        <div className="max-w-2xl w-full bg-white rounded-3xl shadow-xl overflow-hidden border border-gray-100">
          
          {/* Header */}
          {isApproved ? (
            <div className="bg-green-600 p-8 text-center text-white">
              <div className="w-20 h-20 bg-white/20 rounded-full flex items-center justify-center mx-auto mb-6 backdrop-blur-sm">
                <CheckCircle className="w-10 h-10 text-white" />
              </div>
              <h2 className="text-3xl font-extrabold mb-2">🎉 Congratulations! Your Partner Account is Active.</h2>
            </div>
          ) : isRejected ? (
            <div className="bg-red-600 p-8 text-center text-white">
              <div className="w-20 h-20 bg-white/20 rounded-full flex items-center justify-center mx-auto mb-6 backdrop-blur-sm">
                <AlertCircle className="w-10 h-10 text-white" />
              </div>
              <h2 className="text-3xl font-extrabold mb-2">Application Requires Verification</h2>
            </div>
          ) : (
            <div className="bg-gradient-to-r from-emerald-600 to-green-600 p-8 text-center text-white relative overflow-hidden">
              <div className="absolute top-0 right-0 w-64 h-64 bg-white opacity-10 rounded-full blur-[80px] -mr-20 -mt-20"></div>
              <div className="w-20 h-20 bg-white/20 rounded-full flex items-center justify-center mx-auto mb-6 backdrop-blur-sm relative z-10 border border-white/30">
                <CheckCircle className="w-12 h-12 text-white" />
              </div>
              <h2 className="text-3xl font-extrabold mb-2 relative z-10">Partner Application Submitted Successfully!</h2>
              <p className="text-emerald-50 text-lg relative z-10">
                Thank you for applying to become a VizagProperty.co.in Partner.
              </p>
            </div>
          )}

          <div className="p-8">
            {!isApproved && !isRejected && (
              <>
                <div className="mb-8">
                  <p className="text-gray-700 text-lg leading-relaxed mb-4">
                    Your application has been submitted for review. Our team will verify your details and approve your partner account within <strong className="text-gray-900">24-48 hours</strong>.
                  </p>
                  
                  <div className="bg-emerald-50 border border-emerald-100 rounded-2xl p-6 mb-8">
                    <h3 className="font-bold text-emerald-900 mb-4 text-lg">Once approved:</h3>
                    <ul className="space-y-3">
                      <li className="flex items-center gap-3 text-emerald-800"><CheckCircle className="w-5 h-5 text-emerald-500 flex-shrink-0" /> Your account will be upgraded to Partner Status</li>
                      <li className="flex items-center gap-3 text-emerald-800"><CheckCircle className="w-5 h-5 text-emerald-500 flex-shrink-0" /> You will gain access to the Partner Dashboard</li>
                      <li className="flex items-center gap-3 text-emerald-800"><CheckCircle className="w-5 h-5 text-emerald-500 flex-shrink-0" /> You can submit buyer, seller, tenant, and property referrals</li>
                      <li className="flex items-center gap-3 text-emerald-800"><CheckCircle className="w-5 h-5 text-emerald-500 flex-shrink-0" /> You can track referral status and earnings</li>
                      <li className="flex items-center gap-3 text-emerald-800"><CheckCircle className="w-5 h-5 text-emerald-500 flex-shrink-0" /> You can access exclusive partner benefits</li>
                    </ul>
                  </div>
                </div>

                {/* Status Details */}
                <div className="bg-gray-50 rounded-2xl p-6 border border-gray-100 mb-8">
                  <div className="flex items-center justify-between mb-6 pb-6 border-b border-gray-200">
                    <span className="text-gray-600 font-medium">Application Status:</span>
                    <span className="bg-yellow-100 text-yellow-800 px-4 py-1.5 rounded-full font-bold text-sm border border-yellow-200 animate-pulse">
                      Pending Approval
                    </span>
                  </div>
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-y-4 gap-x-8">
                    <div>
                      <p className="text-sm text-gray-500 mb-1">Application ID</p>
                      <p className="font-bold text-gray-900 font-mono text-sm">{app.id.substring(0, 8).toUpperCase()}</p>
                    </div>
                    <div>
                      <p className="text-sm text-gray-500 mb-1">Partner Type</p>
                      <p className="font-bold text-gray-900">{app.partner_type}</p>
                    </div>
                    <div>
                      <p className="text-sm text-gray-500 mb-1">Registered Email</p>
                      <p className="font-bold text-gray-900 text-sm truncate">{app.email}</p>
                    </div>
                    <div>
                      <p className="text-sm text-gray-500 mb-1">Registered Mobile</p>
                      <p className="font-bold text-gray-900 text-sm">{app.mobile}</p>
                    </div>
                  </div>
                </div>

                {/* Progress Tracker */}
                <div className="mb-8 hidden sm:block">
                  <div className="flex items-center justify-between relative px-4">
                    <div className="absolute left-10 right-10 top-5 -translate-y-1/2 h-1 bg-gray-200 -z-10 rounded-full"></div>
                    <div className="absolute left-10 w-1/3 top-5 -translate-y-1/2 h-1 bg-emerald-500 -z-10 rounded-full"></div>
                    
                    <div className="flex flex-col items-center">
                      <div className="w-10 h-10 rounded-full bg-emerald-500 text-white flex items-center justify-center font-bold shadow-md border-4 border-white">✓</div>
                      <span className="text-xs font-bold text-emerald-600 mt-2 text-center">Application<br/>Submitted</span>
                    </div>
                    <div className="flex flex-col items-center">
                      <div className="w-10 h-10 rounded-full bg-yellow-400 text-white flex items-center justify-center font-bold shadow-md border-4 border-white animate-pulse">⏳</div>
                      <span className="text-xs font-bold text-yellow-600 mt-2 text-center">Under<br/>Review</span>
                    </div>
                    <div className="flex flex-col items-center">
                      <div className="w-10 h-10 rounded-full bg-gray-200 text-gray-400 flex items-center justify-center font-bold border-4 border-white">🔒</div>
                      <span className="text-xs font-bold text-gray-400 mt-2 text-center">Approved</span>
                    </div>
                    <div className="flex flex-col items-center">
                      <div className="w-10 h-10 rounded-full bg-gray-200 text-gray-400 flex items-center justify-center font-bold border-4 border-white">🚀</div>
                      <span className="text-xs font-bold text-gray-400 mt-2 text-center">Partner<br/>Dashboard</span>
                    </div>
                  </div>
                </div>

                <div className="bg-blue-50 border-l-4 border-blue-500 p-4 rounded-r-xl mb-8">
                  <h4 className="font-bold text-blue-900 mb-2">IMPORTANT NOTICE</h4>
                  <p className="text-sm text-blue-800 mb-3">
                    You can continue using VizagProperty.co.in normally while your application is being reviewed.
                  </p>
                  <p className="text-sm text-blue-800 mb-2">You will receive approval notifications through:</p>
                  <div className="flex flex-wrap gap-2">
                    <span className="text-xs font-bold text-blue-700 bg-blue-100 border border-blue-200 px-3 py-1 rounded-full">✓ Email</span>
                    <span className="text-xs font-bold text-blue-700 bg-blue-100 border border-blue-200 px-3 py-1 rounded-full">✓ Mobile Number</span>
                    <span className="text-xs font-bold text-blue-700 bg-blue-100 border border-blue-200 px-3 py-1 rounded-full">✓ Website Notifications</span>
                  </div>
                </div>
              </>
            )}

            {isRejected && (
              <div className="mb-8 text-center">
                 <p className="text-gray-700 text-lg">Your application requires additional verification before we can approve it.</p>
              </div>
            )}

            {/* Actions */}
            <div className="flex flex-col sm:flex-row gap-4 mt-8">
              {isApproved ? (
                <Link 
                  to="/partner/dashboard"
                  className="flex-1 bg-green-600 text-white font-bold py-4 px-6 rounded-xl hover:bg-green-700 transition-colors text-center shadow-lg"
                >
                  Open Partner Dashboard
                </Link>
              ) : isRejected ? (
                <Link 
                  to="/contact"
                  className="flex-1 bg-primary-600 text-white font-bold py-4 px-6 rounded-xl hover:bg-primary-700 transition-colors text-center shadow-lg"
                >
                  Contact Support
                </Link>
              ) : (
                <>
                  <Link 
                    to="/dashboard"
                    className="flex-1 bg-emerald-600 text-white font-bold py-4 px-6 rounded-xl hover:bg-emerald-700 transition-colors text-center shadow-lg hover:shadow-xl hover:-translate-y-0.5 duration-200"
                  >
                    Go To My Dashboard
                  </Link>
                  <Link 
                    to="/"
                    className="flex-1 bg-white text-gray-700 border border-gray-200 font-bold py-4 px-6 rounded-xl hover:bg-gray-50 transition-colors text-center"
                  >
                    Return To Home
                  </Link>
                </>
              )}
            </div>
            
            {(!isApproved && !isRejected) && (
              <div className="mt-6 text-center">
                <button 
                  onClick={() => window.location.reload()}
                  className="text-primary-600 font-bold hover:underline text-sm transition-colors"
                >
                  View My Application Status
                </button>
              </div>
            )}
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col py-12 px-4 sm:px-6 lg:px-8">
      <SEOHead 
        title="Apply for Partner Program | VizagProperty.co.in" 
        description="Submit your application to upgrade your account to a Partner role and start earning commissions."
      />

      <div className="sm:mx-auto sm:w-full sm:max-w-xl">
        <div className="flex justify-center mb-6">
          <Link to="/" className="flex items-center gap-2">
            <div className="bg-primary-600 p-2 rounded-lg">
              <Building2 className="h-8 w-8 text-white" />
            </div>
            <span className="text-2xl font-extrabold text-gray-900 tracking-tight">
              VizagProperty<span className="text-primary-600">.co.in</span>
            </span>
          </Link>
        </div>
        <h2 className="mt-2 text-center text-3xl font-extrabold text-gray-900">
          Partner Application
        </h2>
        <p className="mt-2 text-center text-sm text-gray-600">
          Upgrade your account to access the Partner Dashboard and submit referrals.
        </p>
      </div>

      <div className="mt-8 sm:mx-auto sm:w-full sm:max-w-2xl">
        <div className="bg-white py-8 px-4 shadow sm:rounded-2xl sm:px-10 border border-gray-100">
          <form className="space-y-6" onSubmit={handleSubmit}>
            {error && (
              <div className="bg-red-50 border border-red-200 text-red-600 px-4 py-3 rounded-lg text-sm">
                {error}
              </div>
            )}

            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label className="block text-sm font-medium text-gray-700">Full Name *</label>
                <div className="mt-1">
                  <input
                    name="fullName"
                    type="text"
                    required
                    value={formData.fullName}
                    onChange={handleChange}
                    className="appearance-none block w-full px-4 py-3 border border-gray-300 rounded-xl shadow-sm placeholder-gray-400 focus:outline-none focus:ring-primary-500 focus:border-primary-500 sm:text-sm"
                  />
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700">Mobile Number *</label>
                <div className="mt-1">
                  <input
                    name="mobile"
                    type="tel"
                    required
                    value={formData.mobile}
                    onChange={handleChange}
                    className="appearance-none block w-full px-4 py-3 border border-gray-300 rounded-xl shadow-sm placeholder-gray-400 focus:outline-none focus:ring-primary-500 focus:border-primary-500 sm:text-sm"
                  />
                </div>
              </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label className="block text-sm font-medium text-gray-700">Email Address *</label>
                <div className="mt-1">
                  <input
                    name="email"
                    type="email"
                    required
                    value={formData.email}
                    onChange={handleChange}
                    className="appearance-none block w-full px-4 py-3 border border-gray-300 rounded-xl shadow-sm placeholder-gray-400 focus:outline-none focus:ring-primary-500 focus:border-primary-500 sm:text-sm"
                  />
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700">City *</label>
                <div className="mt-1">
                  <input
                    name="city"
                    type="text"
                    required
                    value={formData.city}
                    onChange={handleChange}
                    className="appearance-none block w-full px-4 py-3 border border-gray-300 rounded-xl shadow-sm placeholder-gray-400 focus:outline-none focus:ring-primary-500 focus:border-primary-500 sm:text-sm"
                  />
                </div>
              </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <label className="block text-sm font-medium text-gray-700">Partner Type *</label>
                <div className="mt-1">
                  <select
                    name="partnerType"
                    required
                    value={formData.partnerType}
                    onChange={handleChange}
                    className="block w-full px-4 py-3 border border-gray-300 rounded-xl shadow-sm focus:outline-none focus:ring-primary-500 focus:border-primary-500 sm:text-sm bg-white"
                  >
                    <option value="Agent">Real Estate Agent</option>
                    <option value="Builder">Builder & Developer</option>
                    <option value="Referral Partner">Referral Partner</option>
                    <option value="Retired Employee">Retired Employee</option>
                    <option value="Student">Student</option>
                    <option value="Working Professional">Working Professional</option>
                    <option value="Homemaker">Homemaker</option>
                    <option value="Channel Partner">Channel Partner</option>
                  </select>
                </div>
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700">Company Name (Optional)</label>
                <div className="mt-1">
                  <input
                    name="companyName"
                    type="text"
                    value={formData.companyName}
                    onChange={handleChange}
                    className="appearance-none block w-full px-4 py-3 border border-gray-300 rounded-xl shadow-sm placeholder-gray-400 focus:outline-none focus:ring-primary-500 focus:border-primary-500 sm:text-sm"
                    placeholder="If applicable"
                  />
                </div>
              </div>
            </div>

            <div className="flex items-start mt-6">
              <div className="flex items-center h-5">
                <input
                  id="agreeTerms"
                  name="agreeTerms"
                  type="checkbox"
                  required
                  checked={formData.agreeTerms}
                  onChange={handleChange}
                  className="focus:ring-primary-500 h-4 w-4 text-primary-600 border-gray-300 rounded"
                />
              </div>
              <div className="ml-3 text-sm">
                <label htmlFor="agreeTerms" className="font-medium text-gray-700">
                  I agree to the <Link to="/terms-and-conditions" className="text-primary-600 hover:underline" target="_blank">Terms & Conditions</Link> and <Link to="/privacy-policy" className="text-primary-600 hover:underline" target="_blank">Privacy Policy</Link>.
                </label>
              </div>
            </div>

            <div className="pt-4">
              <button
                type="submit"
                disabled={loading || !formData.agreeTerms}
                className="w-full flex justify-center py-4 px-4 border border-transparent rounded-xl shadow-sm text-lg font-bold text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 disabled:opacity-50 transition-colors"
              >
                {loading ? (
                  <div className="w-6 h-6 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                ) : (
                  <>Submit Application <ArrowRight className="ml-2 w-6 h-6" /></>
                )}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  )
}
