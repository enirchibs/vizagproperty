import { useState, useEffect } from 'react'
import { Navigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import { PartnerApplication, PartnerReferral, UserProfile } from '../types'
import { Search } from 'lucide-react'

export function AdminPartnersPage() {
  const { user, profile, loading: authLoading } = useAuth()
  
  const [activeTab, setActiveTab] = useState<'applications' | 'partners' | 'referrals'>('applications')
  
  const [applications, setApplications] = useState<PartnerApplication[]>([])
  const [partners, setPartners] = useState<UserProfile[]>([])
  const [referrals, setReferrals] = useState<(PartnerReferral & { users: { full_name: string } })[]>([])
  
  const [loading, setLoading] = useState(true)
  const [searchTerm, setSearchTerm] = useState('')

  useEffect(() => {
    if (user && profile?.role === 'admin') {
      fetchData()
    }
  }, [user, profile, activeTab])

  const fetchData = async () => {
    setLoading(true)
    try {
      if (activeTab === 'applications') {
        const { data, error } = await supabase
          .from('partner_applications')
          .select('*')
          .order('created_at', { ascending: false })
        if (error) throw error
        setApplications(data as PartnerApplication[])
      } else if (activeTab === 'partners') {
        const { data, error } = await supabase
          .from('users')
          .select('*')
          .eq('is_partner', true)
          .order('partner_since', { ascending: false })
        if (error) throw error
        setPartners(data as UserProfile[])
      } else if (activeTab === 'referrals') {
        const { data, error } = await supabase
          .from('partner_referrals')
          .select('*, users(full_name)')
          .order('created_at', { ascending: false })
        if (error) throw error
        setReferrals(data as any[])
      }
    } catch (err) {
      console.error('Error fetching data:', err)
    } finally {
      setLoading(false)
    }
  }

  const handleApproveApplication = async (application: PartnerApplication) => {
    if (!user) return
    try {
      // 1. Update application status
      const { error: appError } = await supabase
        .from('partner_applications')
        .update({ status: 'approved' })
        .eq('id', application.id)
      
      if (appError) throw appError

      // 2. Upgrade user profile
      const { error: userError } = await supabase
        .from('users')
        .update({ 
          is_partner: true,
          partner_status: 'approved',
          partner_type: application.partner_type,
          membership_type: 'free',
          partner_since: new Date().toISOString(),
          approved_by: user.id
        })
        .eq('id', application.user_id)

      if (userError) throw userError

      setApplications(prev => prev.map(a => a.id === application.id ? { ...a, status: 'approved' } : a))
      alert('Partner Approved successfully!')
    } catch (err) {
      console.error('Error approving application:', err)
      alert('Failed to approve application')
    }
  }

  const handleRejectApplication = async (id: string) => {
    try {
      const { error } = await supabase
        .from('partner_applications')
        .update({ status: 'rejected' })
        .eq('id', id)
      
      if (error) throw error
      setApplications(prev => prev.map(a => a.id === id ? { ...a, status: 'rejected' } : a))
    } catch (err) {
      console.error('Error rejecting application:', err)
      alert('Failed to reject application')
    }
  }

  const handleUpdatePartnerStatus = async (id: string, newStatus: string) => {
    try {
      const { error } = await supabase
        .from('users')
        .update({ partner_status: newStatus })
        .eq('id', id)
      
      if (error) throw error
      setPartners(prev => prev.map(p => p.id === id ? { ...p, partner_status: newStatus as any } : p))
    } catch (err) {
      console.error('Error updating status:', err)
      alert('Failed to update status')
    }
  }

  const handleUpdateReferralStatus = async (id: string, newStatus: string) => {
    try {
      const { error } = await supabase
        .from('partner_referrals')
        .update({ lead_status: newStatus })
        .eq('id', id)
      
      if (error) throw error
      setReferrals(prev => prev.map(r => r.id === id ? { ...r, lead_status: newStatus as any } : r))
    } catch (err) {
      console.error('Error updating referral:', err)
      alert('Failed to update referral status')
    }
  }

  if (authLoading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"></div>
      </div>
    )
  }

  if (!user || !profile || profile.role !== 'admin') {
    return <Navigate to="/" />
  }

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-8 gap-4">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">Partner Management</h1>
            <p className="text-gray-600 mt-1">Manage partner applications, active partners, and their referrals.</p>
          </div>
        </div>

        {/* Tabs */}
        <div className="flex space-x-4 mb-6 border-b border-gray-200">
          <button
            onClick={() => setActiveTab('applications')}
            className={`pb-4 px-2 font-medium text-sm transition-colors relative ${
              activeTab === 'applications' ? 'text-primary-600' : 'text-gray-500 hover:text-gray-700'
            }`}
          >
            Applications
            {activeTab === 'applications' && (
              <span className="absolute bottom-0 left-0 w-full h-0.5 bg-primary-600 rounded-t-full"></span>
            )}
          </button>
          <button
            onClick={() => setActiveTab('partners')}
            className={`pb-4 px-2 font-medium text-sm transition-colors relative ${
              activeTab === 'partners' ? 'text-primary-600' : 'text-gray-500 hover:text-gray-700'
            }`}
          >
            Active Partners
            {activeTab === 'partners' && (
              <span className="absolute bottom-0 left-0 w-full h-0.5 bg-primary-600 rounded-t-full"></span>
            )}
          </button>
          <button
            onClick={() => setActiveTab('referrals')}
            className={`pb-4 px-2 font-medium text-sm transition-colors relative ${
              activeTab === 'referrals' ? 'text-primary-600' : 'text-gray-500 hover:text-gray-700'
            }`}
          >
            Referrals (Leads)
            {activeTab === 'referrals' && (
              <span className="absolute bottom-0 left-0 w-full h-0.5 bg-primary-600 rounded-t-full"></span>
            )}
          </button>
        </div>

        {/* Data Table Container */}
        <div className="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden">
          
          <div className="p-4 border-b border-gray-200">
            <div className="relative max-w-md">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 w-5 h-5" />
              <input
                type="text"
                placeholder={`Search ${activeTab}...`}
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
              />
            </div>
          </div>

          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50">
                {activeTab === 'applications' && (
                  <tr>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Applicant</th>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Contact</th>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Type</th>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Location</th>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Status</th>
                    <th className="px-6 py-3 text-right text-xs font-bold text-gray-500 uppercase">Actions</th>
                  </tr>
                )}
                {activeTab === 'partners' && (
                  <tr>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Partner</th>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Contact</th>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Type / Plan</th>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Status</th>
                    <th className="px-6 py-3 text-right text-xs font-bold text-gray-500 uppercase">Actions</th>
                  </tr>
                )}
                {activeTab === 'referrals' && (
                  <tr>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Date</th>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Referred By</th>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Customer</th>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Requirement</th>
                    <th className="px-6 py-3 text-left text-xs font-bold text-gray-500 uppercase">Status</th>
                  </tr>
                )}
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {loading ? (
                  <tr>
                    <td colSpan={6} className="px-6 py-10 text-center text-gray-500">Loading...</td>
                  </tr>
                ) : activeTab === 'applications' ? (
                  applications.filter(a => a.full_name.toLowerCase().includes(searchTerm.toLowerCase())).map(a => (
                    <tr key={a.id}>
                      <td className="px-6 py-4">
                        <div className="font-bold text-gray-900">{a.full_name}</div>
                        {a.company_name && <div className="text-sm text-gray-500">{a.company_name}</div>}
                        <div className="text-xs text-gray-400 mt-1">Applied: {new Date(a.created_at).toLocaleDateString()}</div>
                      </td>
                      <td className="px-6 py-4">
                        <div className="text-sm">{a.mobile}</div>
                        <div className="text-sm text-gray-500">{a.email}</div>
                      </td>
                      <td className="px-6 py-4">
                        <div className="text-sm font-medium">{a.partner_type}</div>
                      </td>
                      <td className="px-6 py-4 text-sm">{a.city}</td>
                      <td className="px-6 py-4">
                        <span className={`px-2 py-1 rounded text-xs font-bold ${
                          a.status === 'approved' ? 'bg-green-100 text-green-800' : 
                          a.status === 'pending' ? 'bg-yellow-100 text-yellow-800' : 
                          'bg-red-100 text-red-800'
                        }`}>
                          {a.status}
                        </span>
                      </td>
                      <td className="px-6 py-4 text-right">
                        {a.status === 'pending' && (
                          <>
                            <button onClick={() => handleApproveApplication(a)} className="text-green-600 hover:text-green-900 mr-3">Approve</button>
                            <button onClick={() => handleRejectApplication(a.id)} className="text-red-600 hover:text-red-900">Reject</button>
                          </>
                        )}
                      </td>
                    </tr>
                  ))
                ) : activeTab === 'partners' ? (
                  partners.filter(p => (p.full_name || p.name || '').toLowerCase().includes(searchTerm.toLowerCase())).map(p => (
                    <tr key={p.id}>
                      <td className="px-6 py-4">
                        <div className="font-bold text-gray-900">{p.full_name || p.name}</div>
                        <div className="text-xs text-gray-400 mt-1">Partner Since: {p.partner_since ? new Date(p.partner_since).toLocaleDateString() : '-'}</div>
                      </td>
                      <td className="px-6 py-4">
                        <div className="text-sm">{p.phone || '-'}</div>
                        <div className="text-sm text-gray-500">{p.email}</div>
                      </td>
                      <td className="px-6 py-4">
                        <div className="text-sm font-medium">{p.partner_type || 'Unknown'}</div>
                        <div className="text-xs uppercase bg-gray-100 inline-block px-2 py-0.5 rounded mt-1">{p.membership_type || 'Free'}</div>
                      </td>
                      <td className="px-6 py-4">
                        <span className={`px-2 py-1 rounded text-xs font-bold ${
                          p.partner_status === 'approved' ? 'bg-green-100 text-green-800' : 
                          p.partner_status === 'suspended' ? 'bg-red-100 text-red-800' : 
                          'bg-yellow-100 text-yellow-800'
                        }`}>
                          {p.partner_status}
                        </span>
                      </td>
                      <td className="px-6 py-4 text-right">
                        {p.partner_status === 'approved' && (
                          <button onClick={() => handleUpdatePartnerStatus(p.id, 'suspended')} className="text-red-600 hover:text-red-900">Suspend</button>
                        )}
                        {p.partner_status === 'suspended' && (
                          <button onClick={() => handleUpdatePartnerStatus(p.id, 'approved')} className="text-green-600 hover:text-green-900">Reactivate</button>
                        )}
                      </td>
                    </tr>
                  ))
                ) : activeTab === 'referrals' ? (
                  referrals.filter(r => r.customer_name.toLowerCase().includes(searchTerm.toLowerCase())).map(r => (
                    <tr key={r.id}>
                      <td className="px-6 py-4 text-sm">{new Date(r.created_at).toLocaleDateString()}</td>
                      <td className="px-6 py-4">
                        <div className="font-medium text-primary-600">{r.users?.full_name || 'Unknown Partner'}</div>
                      </td>
                      <td className="px-6 py-4">
                        <div className="font-bold">{r.customer_name}</div>
                        <div className="text-sm text-gray-500">{r.customer_mobile}</div>
                      </td>
                      <td className="px-6 py-4">
                        <div className="text-sm font-medium">{r.requirement_type}</div>
                        <div className="text-xs text-gray-500">{r.preferred_location} {r.budget ? `(${r.budget})` : ''}</div>
                        {r.remarks && <div className="text-xs text-gray-400 mt-1 truncate max-w-[200px]">{r.remarks}</div>}
                      </td>
                      <td className="px-6 py-4">
                        <select 
                          value={r.lead_status}
                          onChange={(e) => handleUpdateReferralStatus(r.id, e.target.value)}
                          className="text-sm border-gray-300 rounded-lg focus:ring-primary-500 focus:border-primary-500 bg-white"
                        >
                          <option value="New">New</option>
                          <option value="Contacted">Contacted</option>
                          <option value="Interested">Interested</option>
                          <option value="Site Visit Scheduled">Site Visit Scheduled</option>
                          <option value="Deal Closed">Deal Closed</option>
                          <option value="Rejected">Rejected</option>
                        </select>
                      </td>
                    </tr>
                  ))
                ) : null}
              </tbody>
            </table>
          </div>
        </div>

      </div>
    </div>
  )
}
