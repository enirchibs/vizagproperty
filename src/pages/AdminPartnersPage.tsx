import { useState, useEffect } from 'react'
import { Navigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import { PartnerEnquiry } from '../types'
import { Download, Users, Building2, TrendingUp, Search } from 'lucide-react'

export function AdminPartnersPage() {
  const { user, profile, loading: authLoading } = useAuth()
  const [enquiries, setEnquiries] = useState<PartnerEnquiry[]>([])
  const [loading, setLoading] = useState(true)
  const [searchTerm, setSearchTerm] = useState('')

  useEffect(() => {
    if (user && profile?.role === 'admin') {
      fetchEnquiries()
    }
  }, [user, profile])

  const fetchEnquiries = async () => {
    try {
      setLoading(true)
      const { data, error } = await supabase
        .from('partner_enquiries')
        .select('*')
        .order('created_at', { ascending: false })

      if (error) throw error
      setEnquiries(data || [])
    } catch (err) {
      console.error('Error fetching partner enquiries:', err)
    } finally {
      setLoading(false)
    }
  }

  const handleExportCSV = () => {
    if (enquiries.length === 0) return

    const headers = ['Date', 'Name', 'Mobile', 'Email', 'City', 'Type', 'Company', 'Message']
    const csvContent = [
      headers.join(','),
      ...enquiries.map(e => [
        new Date(e.created_at).toLocaleDateString(),
        `"${e.full_name}"`,
        `"${e.mobile}"`,
        `"${e.email}"`,
        `"${e.city}"`,
        `"${e.partner_type}"`,
        `"${e.company_name || ''}"`,
        `"${(e.message || '').replace(/"/g, '""')}"`
      ].join(','))
    ].join('\n')

    const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' })
    const link = document.createElement('a')
    const url = URL.createObjectURL(blob)
    link.setAttribute('href', url)
    link.setAttribute('download', `partner_enquiries_${new Date().toISOString().split('T')[0]}.csv`)
    link.style.visibility = 'hidden'
    document.body.appendChild(link)
    link.click()
    document.body.removeChild(link)
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

  const filteredEnquiries = enquiries.filter(e => 
    e.full_name.toLowerCase().includes(searchTerm.toLowerCase()) ||
    e.mobile.includes(searchTerm) ||
    e.email.toLowerCase().includes(searchTerm.toLowerCase()) ||
    e.city.toLowerCase().includes(searchTerm.toLowerCase())
  )

  const stats = {
    total: enquiries.length,
    agents: enquiries.filter(e => e.partner_type === 'Agent').length,
    builders: enquiries.filter(e => e.partner_type === 'Builder').length,
    referrals: enquiries.filter(e => e.partner_type === 'Referral Partner').length,
  }

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-8 gap-4">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">Partner Enquiries</h1>
            <p className="text-gray-600 mt-1">Manage leads from agents, builders, and referral partners.</p>
          </div>
          <button
            onClick={handleExportCSV}
            className="flex items-center gap-2 px-4 py-2 bg-white border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 shadow-sm transition-colors"
          >
            <Download className="w-5 h-5" />
            Export CSV
          </button>
        </div>

        {/* Stats Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 flex items-center gap-4">
            <div className="w-12 h-12 bg-primary-100 text-primary-600 rounded-xl flex items-center justify-center">
              <Users className="w-6 h-6" />
            </div>
            <div>
              <p className="text-sm font-medium text-gray-500">Total Enquiries</p>
              <p className="text-2xl font-bold text-gray-900">{stats.total}</p>
            </div>
          </div>
          <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 flex items-center gap-4">
            <div className="w-12 h-12 bg-blue-100 text-blue-600 rounded-xl flex items-center justify-center">
              <Users className="w-6 h-6" />
            </div>
            <div>
              <p className="text-sm font-medium text-gray-500">Agents</p>
              <p className="text-2xl font-bold text-gray-900">{stats.agents}</p>
            </div>
          </div>
          <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 flex items-center gap-4">
            <div className="w-12 h-12 bg-orange-100 text-orange-600 rounded-xl flex items-center justify-center">
              <Building2 className="w-6 h-6" />
            </div>
            <div>
              <p className="text-sm font-medium text-gray-500">Builders</p>
              <p className="text-2xl font-bold text-gray-900">{stats.builders}</p>
            </div>
          </div>
          <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100 flex items-center gap-4">
            <div className="w-12 h-12 bg-green-100 text-green-600 rounded-xl flex items-center justify-center">
              <TrendingUp className="w-6 h-6" />
            </div>
            <div>
              <p className="text-sm font-medium text-gray-500">Referrals</p>
              <p className="text-2xl font-bold text-gray-900">{stats.referrals}</p>
            </div>
          </div>
        </div>

        {/* Search & Filter */}
        <div className="bg-white rounded-t-2xl border-t border-l border-r border-gray-200 p-4">
          <div className="relative max-w-md">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 w-5 h-5" />
            <input
              type="text"
              placeholder="Search by name, email, mobile, or city..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
            />
          </div>
        </div>

        {/* Data Table */}
        <div className="bg-white rounded-b-2xl shadow-sm border border-gray-200 overflow-hidden">
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50">
                <tr>
                  <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                  <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name & Contact</th>
                  <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Type / Company</th>
                  <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Location</th>
                  <th scope="col" className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Message</th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {loading ? (
                  <tr>
                    <td colSpan={5} className="px-6 py-10 text-center">
                      <div className="inline-block animate-spin rounded-full h-8 w-8 border-4 border-primary-500 border-t-transparent"></div>
                      <p className="mt-2 text-gray-500">Loading enquiries...</p>
                    </td>
                  </tr>
                ) : filteredEnquiries.length === 0 ? (
                  <tr>
                    <td colSpan={5} className="px-6 py-10 text-center text-gray-500">
                      No enquiries found.
                    </td>
                  </tr>
                ) : (
                  filteredEnquiries.map((enquiry) => (
                    <tr key={enquiry.id} className="hover:bg-gray-50 transition-colors">
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        {new Date(enquiry.created_at).toLocaleDateString()}
                      </td>
                      <td className="px-6 py-4">
                        <div className="text-sm font-medium text-gray-900">{enquiry.full_name}</div>
                        <div className="text-sm text-gray-500">{enquiry.mobile}</div>
                        <div className="text-sm text-gray-500">{enquiry.email}</div>
                      </td>
                      <td className="px-6 py-4">
                        <span className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${
                          enquiry.partner_type === 'Agent' ? 'bg-blue-100 text-blue-800' :
                          enquiry.partner_type === 'Builder' ? 'bg-orange-100 text-orange-800' :
                          enquiry.partner_type === 'Referral Partner' ? 'bg-green-100 text-green-800' :
                          'bg-gray-100 text-gray-800'
                        }`}>
                          {enquiry.partner_type}
                        </span>
                        {enquiry.company_name && (
                          <div className="text-sm text-gray-500 mt-1">{enquiry.company_name}</div>
                        )}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                        {enquiry.city}
                      </td>
                      <td className="px-6 py-4 text-sm text-gray-500 max-w-xs">
                        <div className="truncate" title={enquiry.message}>
                          {enquiry.message || '-'}
                        </div>
                      </td>
                    </tr>
                  ))
                )}
              </tbody>
            </table>
          </div>
        </div>

      </div>
    </div>
  )
}
