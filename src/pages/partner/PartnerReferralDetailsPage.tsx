import { useState, useEffect } from 'react'
import { useParams, Link, Navigate } from 'react-router-dom'
import { ArrowLeft, MapPin, User, IndianRupee, Clock, CheckCircle, FileText, Phone, Building2, AlertCircle } from 'lucide-react'
import { supabase } from '../../lib/supabase'
import { SEOHead } from '../../components/SEOHead'
import { useAuth } from '../../contexts/AuthContext'
import { PartnerReferral } from '../../types'

export function PartnerReferralDetailsPage() {
  const { id } = useParams<{ id: string }>()
  const { user, profile, loading: authLoading } = useAuth()
  
  const [referral, setReferral] = useState<PartnerReferral | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (!user || !id) {
      if (!authLoading) setLoading(false)
      return
    }

    const fetchReferral = async () => {
      try {
        const { data, error } = await supabase
          .from('partner_referrals')
          .select('*')
          .eq('id', id)
          .eq('partner_id', user.id)
          .single()

        if (error) throw error
        setReferral(data as PartnerReferral)
      } catch (err) {
        console.error('Error fetching referral:', err)
      } finally {
        setLoading(false)
      }
    }

    fetchReferral()
  }, [user, id, authLoading])

  if (authLoading || loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="w-12 h-12 border-4 border-primary-600 border-t-transparent rounded-full animate-spin"></div>
      </div>
    )
  }

  if (!user || !profile || !profile.is_partner || profile.partner_status !== 'approved') {
    return <Navigate to="/partner/apply" />
  }

  if (!referral) {
    return (
      <div className="min-h-screen bg-gray-50 flex flex-col items-center justify-center p-4">
        <div className="w-20 h-20 bg-gray-200 rounded-full flex items-center justify-center mb-4">
          <AlertCircle className="w-10 h-10 text-gray-400" />
        </div>
        <h2 className="text-2xl font-bold text-gray-900 mb-2">Referral Not Found</h2>
        <p className="text-gray-500 mb-6">The referral you are looking for does not exist or you don't have access.</p>
        <Link to="/partner/dashboard" className="bg-primary-600 text-white px-6 py-2 rounded-xl font-bold hover:bg-primary-700 transition-colors">
          Back to Dashboard
        </Link>
      </div>
    )
  }

  // Timeline Logic
  const allStages = [
    'New',
    'Contacted',
    'Property Shared',
    'Site Visit Scheduled',
    'Negotiation',
    'Deal Closed',
    'Commission Paid'
  ]

  let currentStageIndex = allStages.indexOf(referral.lead_status)
  
  // Handle statuses that map to intermediate stages or alternate names
  if (referral.lead_status === 'Qualified') currentStageIndex = 1 // After Contacted
  if (referral.lead_status === 'Commission Approved') currentStageIndex = 5 // Between Deal Closed and Paid

  const isRejected = referral.lead_status === 'Rejected'

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
      case 'Commission Paid': return 'bg-[#166534] text-white border-[#14532d]'
      case 'Rejected': return 'bg-red-100 text-red-800 border-red-200'
      default: return 'bg-gray-100 text-gray-800 border-gray-200'
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-12">
      <SEOHead title={`Referral: ${referral.customer_name} | VizagProperty Partner`} description="View referral details and status tracking." />
      
      {/* Top Navigation Bar */}
      <div className="bg-white border-b border-gray-200 sticky top-0 z-10">
        <div className="max-w-5xl mx-auto px-4 py-4 flex items-center justify-between">
          <div className="flex items-center gap-4">
            <Link to="/partner/dashboard" className="p-2 hover:bg-gray-100 rounded-full transition-colors">
              <ArrowLeft className="w-5 h-5 text-gray-600" />
            </Link>
            <div>
              <h1 className="text-xl font-bold text-gray-900">Referral Details</h1>
              <p className="text-sm text-gray-500">ID: {referral.id.split('-')[0].toUpperCase()}</p>
            </div>
          </div>
          <span className={`px-4 py-1.5 rounded-full text-sm font-bold border ${getBadgeColor(referral.lead_status)}`}>
            {referral.lead_status}
          </span>
        </div>
      </div>

      <div className="max-w-5xl mx-auto px-4 mt-8 space-y-8">
        
        {/* Customer Information Card */}
        <div className="bg-white rounded-3xl shadow-sm border border-gray-100 p-6 md:p-8">
          <div className="flex items-center gap-3 mb-6">
            <div className="bg-blue-100 p-2.5 rounded-xl">
              <User className="w-6 h-6 text-blue-600" />
            </div>
            <h2 className="text-2xl font-bold text-gray-900">Customer Information</h2>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div>
              <p className="text-sm text-gray-500 font-medium mb-1">Full Name</p>
              <p className="text-lg font-bold text-gray-900">{referral.customer_name}</p>
            </div>
            <div>
              <p className="text-sm text-gray-500 font-medium mb-1 flex items-center gap-1"><Phone className="w-4 h-4"/> Mobile</p>
              <p className="text-lg font-bold text-gray-900">{referral.customer_mobile}</p>
            </div>
            <div>
              <p className="text-sm text-gray-500 font-medium mb-1 flex items-center gap-1"><Clock className="w-4 h-4"/> Submitted On</p>
              <p className="text-lg font-bold text-gray-900">{new Date(referral.created_at).toLocaleDateString()}</p>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          
          {/* Requirement Details */}
          <div className="lg:col-span-2 space-y-8">
            <div className="bg-white rounded-3xl shadow-sm border border-gray-100 p-6 md:p-8">
              <div className="flex items-center gap-3 mb-6">
                <div className="bg-purple-100 p-2.5 rounded-xl">
                  <Building2 className="w-6 h-6 text-purple-600" />
                </div>
                <h2 className="text-2xl font-bold text-gray-900">Requirement Details</h2>
              </div>
              
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-6 mb-6">
                <div className="bg-gray-50 p-4 rounded-2xl border border-gray-100">
                  <p className="text-sm text-gray-500 font-medium mb-1">Type</p>
                  <p className="text-gray-900 font-bold">{referral.requirement_type}</p>
                </div>
                <div className="bg-gray-50 p-4 rounded-2xl border border-gray-100">
                  <p className="text-sm text-gray-500 font-medium mb-1 flex items-center gap-1"><MapPin className="w-4 h-4"/> Location</p>
                  <p className="text-gray-900 font-bold">{referral.preferred_location || 'Not Specified'}</p>
                </div>
                <div className="bg-gray-50 p-4 rounded-2xl border border-gray-100">
                  <p className="text-sm text-gray-500 font-medium mb-1 flex items-center gap-1"><IndianRupee className="w-4 h-4"/> Budget</p>
                  <p className="text-gray-900 font-bold">{referral.budget || 'Not Specified'}</p>
                </div>
                <div className="bg-emerald-50 p-4 rounded-2xl border border-emerald-100">
                  <p className="text-sm text-emerald-600 font-medium mb-1 flex items-center gap-1"><IndianRupee className="w-4 h-4"/> Expected Commission</p>
                  <p className="text-emerald-700 font-black text-xl">₹{(Number(referral.commission_amount) || 0).toLocaleString('en-IN')}</p>
                </div>
              </div>

              {referral.remarks && (
                <div>
                  <p className="text-sm text-gray-500 font-medium mb-2 flex items-center gap-1"><FileText className="w-4 h-4"/> Remarks / Notes</p>
                  <div className="bg-yellow-50/50 p-4 rounded-2xl border border-yellow-100 text-gray-800">
                    {referral.remarks}
                  </div>
                </div>
              )}
            </div>
          </div>

          {/* Status Timeline */}
          <div className="lg:col-span-1">
            <div className="bg-white rounded-3xl shadow-sm border border-gray-100 p-6 md:p-8 h-full">
              <h2 className="text-xl font-bold text-gray-900 mb-8">Status Timeline</h2>
              
              {isRejected ? (
                <div className="text-center py-8">
                  <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-4">
                    <AlertCircle className="w-8 h-8 text-red-600" />
                  </div>
                  <h3 className="text-lg font-bold text-gray-900 mb-1">Referral Rejected</h3>
                  <p className="text-sm text-gray-500">This lead did not progress further.</p>
                </div>
              ) : (
                <div className="relative pl-6 border-l-2 border-gray-100 space-y-8">
                  {allStages.map((stage, index) => {
                    // Determine state
                    const isCompleted = currentStageIndex >= index || referral.lead_status === 'Commission Paid'
                    const isCurrent = currentStageIndex === index && referral.lead_status !== 'Commission Paid' && referral.lead_status !== 'Commission Approved'
                    
                    // Special visual handling if exactly matching intermediate states not in list
                    let displayStage = stage
                    if (stage === 'Contacted' && referral.lead_status === 'Qualified') {
                      displayStage = 'Qualified'
                    } else if (stage === 'Deal Closed' && referral.lead_status === 'Commission Approved') {
                      displayStage = 'Commission Approved'
                    }

                    return (
                      <div key={stage} className="relative">
                        {/* Circle Marker */}
                        <div className={`absolute -left-[35px] w-6 h-6 rounded-full border-4 flex items-center justify-center bg-white ${
                          isCompleted ? 'border-green-500 text-green-500' : 
                          isCurrent ? 'border-primary-500 text-primary-500 shadow-[0_0_0_4px_rgba(59,130,246,0.2)]' : 
                          'border-gray-200'
                        }`}>
                          {isCompleted && <CheckCircle className="w-3 h-3 text-green-500" />}
                        </div>
                        
                        <div className={`pt-0.5 ${isCompleted || isCurrent ? 'opacity-100' : 'opacity-40'}`}>
                          <h4 className={`font-bold text-sm ${isCurrent ? 'text-primary-600' : 'text-gray-900'}`}>
                            {displayStage}
                          </h4>
                          {isCurrent && (
                            <p className="text-xs text-primary-500 mt-1 font-medium">Currently in progress...</p>
                          )}
                          {isCompleted && !isCurrent && index === 0 && (
                            <p className="text-xs text-gray-500 mt-1">{new Date(referral.created_at).toLocaleDateString()}</p>
                          )}
                        </div>
                      </div>
                    )
                  })}
                </div>
              )}
            </div>
          </div>
        </div>

      </div>
    </div>
  )
}
