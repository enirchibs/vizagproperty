import { useState, useEffect } from 'react'
import { Navigate, Link } from 'react-router-dom'
import { 
  Building2, Users, Clock, CheckCircle, 
  PlusCircle, LayoutDashboard, FileText, Settings, LogOut, XCircle
} from 'lucide-react'
import { supabase } from '../../lib/supabase'
import { SEOHead } from '../../components/SEOHead'
import { useAuth } from '../../contexts/AuthContext'
import { PartnerReferral } from '../../types'

export function PartnerDashboardPage() {
  const { user, profile, loading: authLoading, signOut } = useAuth()
  
  const [referrals, setReferrals] = useState<PartnerReferral[]>([])
  const [loading, setLoading] = useState(true)
  const [showReferralForm, setShowReferralForm] = useState(false)
  const [formSuccess, setFormSuccess] = useState(false)
  const [formError, setFormError] = useState<string | null>(null)
  const [submitting, setSubmitting] = useState(false)

  const [formData, setFormData] = useState({
    customerName: '',
    customerMobile: '',
    requirementType: 'Buy Property',
    preferredLocation: '',
    budget: '',
    remarks: ''
  })

  useEffect(() => {
    if (!user) {
      if (!authLoading) setLoading(false)
      return
    }

    const fetchReferrals = async () => {
      try {
        const { data: referralsData, error: referralsError } = await supabase
          .from('partner_referrals')
          .select('*')
          .eq('partner_id', user.id)
          .order('created_at', { ascending: false })

        if (referralsError) {
          console.error('Error fetching referrals:', referralsError)
        } else if (referralsData) {
          setReferrals(referralsData as PartnerReferral[])
        }

      } catch (err) {
        console.error('Error in fetchReferrals:', err)
      } finally {
        setLoading(false)
      }
    }

    fetchReferrals()
  }, [user, authLoading])

  const handleSignOut = async () => {
    await signOut()
  }

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement>) => {
    setFormData(prev => ({ ...prev, [e.target.name]: e.target.value }))
  }

  const handleSubmitReferral = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!user) return

    setSubmitting(true)
    setFormError(null)
    setFormSuccess(false)

    try {
      const { data, error } = await supabase
        .from('partner_referrals')
        .insert({
          partner_id: user.id,
          customer_name: formData.customerName,
          customer_mobile: formData.customerMobile,
          requirement_type: formData.requirementType,
          preferred_location: formData.preferredLocation || null,
          budget: formData.budget || null,
          remarks: formData.remarks || null,
          lead_status: 'New'
        })
        .select()
        .single()

      if (error) throw error

      setReferrals([data as PartnerReferral, ...referrals])
      setFormSuccess(true)
      setFormData({
        customerName: '',
        customerMobile: '',
        requirementType: 'Buy Property',
        preferredLocation: '',
        budget: '',
        remarks: ''
      })
      
      setTimeout(() => {
        setShowReferralForm(false)
        setFormSuccess(false)
      }, 2000)

    } catch (err: any) {
      console.error('Error submitting referral:', err)
      setFormError(err.message || 'Failed to submit referral.')
    } finally {
      setSubmitting(false)
    }
  }

  if (authLoading || loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="w-12 h-12 border-4 border-primary-600 border-t-transparent rounded-full animate-spin"></div>
      </div>
    )
  }

  // Ensure user is authenticated and has an approved partner profile
  if (!user || !profile || !profile.is_partner || profile.partner_status !== 'approved') {
    return <Navigate to="/partner/apply" />
  }

  // Calculate Stats
  const totalReferrals = referrals.length
  const activeReferrals = referrals.filter(r => !['Deal Closed', 'Commission Paid', 'Rejected'].includes(r.lead_status)).length
  const successfulReferrals = referrals.filter(r => ['Deal Closed', 'Commission Approved', 'Commission Paid'].includes(r.lead_status)).length
  
  const totalEarned = referrals
    .filter(r => ['Deal Closed', 'Commission Approved', 'Commission Paid'].includes(r.lead_status))
    .reduce((sum, r) => sum + (Number(r.commission_amount) || 0), 0)
    
  const pendingCommission = referrals
    .filter(r => !['Deal Closed', 'Commission Approved', 'Commission Paid', 'Rejected'].includes(r.lead_status))
    .reduce((sum, r) => sum + (Number(r.commission_amount) || 0), 0)

  const paidCommission = referrals
    .filter(r => r.lead_status === 'Commission Paid')
    .reduce((sum, r) => sum + (Number(r.commission_amount) || 0), 0)

  const getBadgeColor = (status: string) => {
    switch (status) {
      case 'New': return 'bg-blue-100 text-blue-800 border-blue-200'
      case 'Contacted':
      case 'Qualified':
      case 'Negotiation': return 'bg-yellow-100 text-yellow-800 border-yellow-200'
      case 'Property Shared':
      case 'Site Visit Scheduled': return 'bg-purple-100 text-purple-800 border-purple-200'
      case 'Deal Closed':
      case 'Commission Approved': return 'bg-green-100 text-green-800 border-green-200'
      case 'Commission Paid': return 'bg-[#166534] text-white border-[#14532d]' // Dark Green
      case 'Rejected': return 'bg-red-100 text-red-800 border-red-200'
      default: return 'bg-gray-100 text-gray-800 border-gray-200'
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 flex">
      <SEOHead title="Partner Dashboard | VizagProperty.co.in" description="Manage your real estate partner referrals and earnings." />

      {/* Sidebar */}
      <div className="w-64 bg-slate-900 text-white flex-shrink-0 hidden md:flex flex-col">
        <div className="p-6">
          <Link to="/" className="flex items-center gap-2">
            <div className="bg-primary-600 p-1.5 rounded-md">
              <Building2 className="h-6 w-6 text-white" />
            </div>
            <span className="text-xl font-extrabold text-white tracking-tight">
              VizagProperty
            </span>
          </Link>
        </div>

        <div className="flex-1 py-6 px-4 space-y-2">
          <div className="bg-white/10 text-white rounded-xl px-4 py-3 flex items-center gap-3 font-medium">
            <LayoutDashboard className="h-5 w-5 text-primary-400" />
            Dashboard
          </div>
          <button 
            onClick={() => {
              setShowReferralForm(true)
              window.scrollTo(0, 0)
            }}
            className="w-full text-slate-300 hover:bg-white/5 hover:text-white rounded-xl px-4 py-3 flex items-center gap-3 font-medium transition-colors"
          >
            <PlusCircle className="h-5 w-5 text-slate-400" />
            Submit Referral
          </button>
          <div className="w-full text-slate-300 hover:bg-white/5 hover:text-white rounded-xl px-4 py-3 flex items-center gap-3 font-medium transition-colors cursor-pointer">
            <FileText className="h-5 w-5 text-slate-400" />
            My Referrals
          </div>
          <div className="w-full text-slate-300 hover:bg-white/5 hover:text-white rounded-xl px-4 py-3 flex items-center gap-3 font-medium transition-colors cursor-pointer">
            <Settings className="h-5 w-5 text-slate-400" />
            Settings
          </div>
        </div>

        <div className="p-4 mt-auto">
          <button 
            onClick={handleSignOut}
            className="w-full flex items-center justify-center gap-2 px-4 py-3 bg-red-500/10 text-red-400 hover:bg-red-500/20 rounded-xl font-bold transition-colors"
          >
            <LogOut className="h-5 w-5" />
            Log Out
          </button>
        </div>
      </div>

      {/* Main Content */}
      <div className="flex-1 flex flex-col min-w-0 overflow-hidden">
        
        {/* Mobile Header */}
        <div className="md:hidden bg-slate-900 text-white p-4 flex justify-between items-center">
          <Link to="/" className="flex items-center gap-2">
            <div className="bg-primary-600 p-1.5 rounded-md">
              <Building2 className="h-5 w-5 text-white" />
            </div>
            <span className="text-lg font-extrabold text-white tracking-tight">
              VizagProperty
            </span>
          </Link>
          <button onClick={handleSignOut} className="text-sm bg-red-500/20 text-red-300 px-3 py-1.5 rounded-md font-medium">
            Logout
          </button>
        </div>

        <main className="flex-1 overflow-y-auto p-4 md:p-8">
          
          <div className="max-w-6xl mx-auto space-y-8">
            
            {/* Header & Welcome */}
            <div className="flex flex-col md:flex-row md:items-end justify-between gap-4 bg-white p-6 md:p-8 rounded-3xl shadow-sm border border-gray-100">
              <div>
                <p className="text-gray-500 font-medium mb-1">Welcome back,</p>
                <h1 className="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4">{profile.full_name || profile.name || 'Partner'}</h1>
                <div className="flex flex-wrap items-center gap-3 text-sm">
                  <span className="bg-blue-50 text-blue-700 px-3 py-1 rounded-full font-bold border border-blue-100">
                    {profile.partner_type || 'Partner'}
                  </span>
                  <span className={`px-3 py-1 rounded-full font-bold border bg-green-50 text-green-700 border-green-100`}>
                    ACTIVE
                  </span>
                  <span className="bg-purple-50 text-purple-700 px-3 py-1 rounded-full font-bold border border-purple-100 uppercase">
                    {profile.membership_type || 'Free'} Member
                  </span>
                  <span className="bg-gray-50 text-gray-700 px-3 py-1 rounded-full font-bold border border-gray-200">
                    Partner Since: {profile.partner_since ? new Date(profile.partner_since).toLocaleDateString() : new Date(profile.created_at).toLocaleDateString()}
                  </span>
                </div>
              </div>
              
              <button 
                onClick={() => setShowReferralForm(true)}
                className="bg-primary-600 hover:bg-primary-700 text-white font-bold py-3 px-6 rounded-xl shadow-lg transition-colors flex items-center justify-center gap-2"
              >
                <PlusCircle className="w-5 h-5" />
                Submit New Referral
              </button>
            </div>



            {/* Referrals Stats Grid */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 flex flex-col justify-between">
                <div className="flex justify-between items-start mb-4">
                  <div className="bg-blue-100 p-3 rounded-xl">
                    <Users className="w-6 h-6 text-blue-600" />
                  </div>
                  <span className="text-3xl font-black text-gray-900">{totalReferrals}</span>
                </div>
                <p className="text-gray-500 font-medium">Total Referrals</p>
              </div>

              <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 flex flex-col justify-between">
                <div className="flex justify-between items-start mb-4">
                  <div className="bg-yellow-100 p-3 rounded-xl">
                    <Clock className="w-6 h-6 text-yellow-600" />
                  </div>
                  <span className="text-3xl font-black text-gray-900">{activeReferrals}</span>
                </div>
                <p className="text-gray-500 font-medium">Active Referrals</p>
              </div>

              <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 flex flex-col justify-between">
                <div className="flex justify-between items-start mb-4">
                  <div className="bg-green-100 p-3 rounded-xl">
                    <CheckCircle className="w-6 h-6 text-green-600" />
                  </div>
                  <span className="text-3xl font-black text-gray-900">{successfulReferrals}</span>
                </div>
                <p className="text-gray-500 font-medium">Closed Deals</p>
              </div>
            </div>

            {/* Earnings Stats Grid */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                <p className="text-gray-500 font-medium mb-1">Pending Commission</p>
                <div className="flex items-baseline gap-1">
                  <span className="text-xl text-yellow-600">₹</span>
                  <span className="text-3xl font-black text-gray-900">{pendingCommission.toLocaleString('en-IN')}</span>
                </div>
              </div>

              <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                <p className="text-gray-500 font-medium mb-1">Paid Commission</p>
                <div className="flex items-baseline gap-1">
                  <span className="text-xl text-green-600">₹</span>
                  <span className="text-3xl font-black text-gray-900">{paidCommission.toLocaleString('en-IN')}</span>
                </div>
              </div>

              <div className="bg-gradient-to-br from-slate-900 to-slate-800 p-6 rounded-2xl shadow-lg border border-slate-700 text-white">
                <p className="text-slate-400 font-medium mb-1">Total Earned</p>
                <div className="flex items-baseline gap-1">
                  <span className="text-xl text-emerald-400">₹</span>
                  <span className="text-3xl font-black">{totalEarned.toLocaleString('en-IN')}</span>
                </div>
              </div>
            </div>

            {/* Referral Form Modal/Section */}
            {showReferralForm && (
              <div className="bg-white rounded-3xl shadow-xl border border-primary-100 overflow-hidden animate-fadeIn relative">
                <div className="absolute top-4 right-4">
                  <button 
                    onClick={() => setShowReferralForm(false)}
                    className="text-gray-400 hover:text-gray-600 transition-colors"
                  >
                    <XCircle className="w-8 h-8" />
                  </button>
                </div>

                <div className="bg-primary-50 p-6 md:p-8 border-b border-primary-100">
                  <h2 className="text-2xl font-bold text-gray-900">Submit a New Referral</h2>
                  <p className="text-primary-700 mt-1">Provide details of the buyer, seller, or tenant you are referring.</p>
                </div>

                {formSuccess ? (
                  <div className="p-12 text-center">
                    <div className="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
                      <CheckCircle className="w-10 h-10 text-green-600" />
                    </div>
                    <h3 className="text-2xl font-bold text-gray-900 mb-2">Referral Submitted Successfully!</h3>
                    <p className="text-gray-600">Our team will contact the lead shortly and update the status here.</p>
                  </div>
                ) : (
                  <form onSubmit={handleSubmitReferral} className="p-6 md:p-8 space-y-6">
                    {formError && (
                      <div className="bg-red-50 text-red-600 p-4 rounded-xl text-sm font-medium border border-red-100">
                        {formError}
                      </div>
                    )}

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">Customer Name *</label>
                        <input
                          type="text"
                          name="customerName"
                          required
                          value={formData.customerName}
                          onChange={handleChange}
                          className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors"
                          placeholder="Full Name"
                        />
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">Customer Mobile *</label>
                        <input
                          type="tel"
                          name="customerMobile"
                          required
                          value={formData.customerMobile}
                          onChange={handleChange}
                          className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors"
                          placeholder="10-digit mobile number"
                        />
                      </div>
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">Requirement Type *</label>
                        <select
                          name="requirementType"
                          required
                          value={formData.requirementType}
                          onChange={handleChange}
                          className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors bg-white"
                        >
                          <option value="Buy Property">Buy Property</option>
                          <option value="Sell Property">Sell Property</option>
                          <option value="Rent Property">Take on Rent</option>
                          <option value="Rent Out Property">Rent Out Property</option>
                          <option value="Plot Purchase">Plot Purchase</option>
                          <option value="Apartment Purchase">Apartment Purchase</option>
                          <option value="Commercial Property">Commercial Property</option>
                          <option value="Builder Enquiry">Builder Enquiry</option>
                        </select>
                      </div>
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">Preferred Location</label>
                        <input
                          type="text"
                          name="preferredLocation"
                          value={formData.preferredLocation}
                          onChange={handleChange}
                          className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors"
                          placeholder="e.g. Madhurawada, MVP Colony"
                        />
                      </div>
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                      <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">Approx Budget</label>
                        <input
                          type="text"
                          name="budget"
                          value={formData.budget}
                          onChange={handleChange}
                          className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors"
                          placeholder="e.g. 50 Lakhs"
                        />
                      </div>
                    </div>

                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Additional Remarks</label>
                      <textarea
                        name="remarks"
                        rows={3}
                        value={formData.remarks}
                        onChange={handleChange}
                        className="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-colors"
                        placeholder="Any specific requirements or context about the lead..."
                      ></textarea>
                    </div>

                    <div className="flex justify-end gap-4 pt-4">
                      <button
                        type="button"
                        onClick={() => setShowReferralForm(false)}
                        className="px-6 py-3 font-bold text-gray-600 hover:text-gray-900 transition-colors"
                      >
                        Cancel
                      </button>
                      <button
                        type="submit"
                        disabled={submitting}
                        className="bg-primary-600 hover:bg-primary-700 text-white font-bold py-3 px-8 rounded-xl shadow-lg transition-colors flex items-center justify-center min-w-[200px]"
                      >
                        {submitting ? (
                          <div className="w-6 h-6 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                        ) : (
                          "Submit Referral"
                        )}
                      </button>
                    </div>
                  </form>
                )}
              </div>
            )}

            {/* Referrals List Table */}
            <div className="bg-white rounded-3xl shadow-sm border border-gray-100 overflow-hidden">
              <div className="p-6 md:p-8 border-b border-gray-100">
                <h2 className="text-2xl font-bold text-gray-900">My Referrals</h2>
                <p className="text-gray-500 mt-1">Track the status of the leads you have submitted.</p>
              </div>

              {referrals.length === 0 ? (
                <div className="p-12 text-center">
                  <div className="w-20 h-20 bg-gray-50 rounded-full flex items-center justify-center mx-auto mb-4">
                    <FileText className="w-10 h-10 text-gray-300" />
                  </div>
                  <h3 className="text-lg font-bold text-gray-900 mb-1">No Referrals Yet</h3>
                  <p className="text-gray-500">Submit your first referral to start earning commissions.</p>
                </div>
              ) : (
                <div className="overflow-x-auto">
                  <table className="w-full text-left border-collapse">
                    <thead>
                      <tr className="bg-gray-50 text-gray-500 text-sm font-bold uppercase tracking-wider">
                        <th className="p-4 border-b border-gray-100">Customer Name</th>
                        <th className="p-4 border-b border-gray-100">Requirement</th>
                        <th className="p-4 border-b border-gray-100">Location</th>
                        <th className="p-4 border-b border-gray-100">Date</th>
                        <th className="p-4 border-b border-gray-100">Status</th>
                        <th className="p-4 border-b border-gray-100">Commission</th>
                        <th className="p-4 border-b border-gray-100 text-right">Actions</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-100">
                      {referrals.map((referral) => (
                        <tr key={referral.id} className="hover:bg-gray-50/50 transition-colors">
                          <td className="p-4">
                            <div className="font-bold text-gray-900">{referral.customer_name}</div>
                            <div className="text-sm text-gray-500">{referral.customer_mobile}</div>
                          </td>
                          <td className="p-4">
                            <span className="bg-gray-100 text-gray-700 px-3 py-1 rounded-full text-xs font-bold">
                              {referral.requirement_type}
                            </span>
                          </td>
                          <td className="p-4 text-gray-600 text-sm">
                            {referral.preferred_location || '-'}
                          </td>
                          <td className="p-4 text-sm text-gray-500">
                            {new Date(referral.created_at).toLocaleDateString()}
                          </td>
                          <td className="p-4">
                            <span className={`px-3 py-1 rounded-full text-xs font-bold border ${getBadgeColor(referral.lead_status)}`}>
                              {referral.lead_status}
                            </span>
                          </td>
                          <td className="p-4 font-bold text-gray-900">
                            ₹{(Number(referral.commission_amount) || 0).toLocaleString('en-IN')}
                          </td>
                          <td className="p-4 text-right">
                            <Link to={`/partner/referrals/${referral.id}`} className="text-primary-600 hover:text-primary-800 font-bold text-sm bg-primary-50 hover:bg-primary-100 px-3 py-1.5 rounded-lg transition-colors inline-block text-center whitespace-nowrap">
                              View Details
                            </Link>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </div>

          </div>
        </main>
      </div>
    </div>
  )
}
