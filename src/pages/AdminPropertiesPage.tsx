import { useState, useEffect, useCallback } from 'react'
import { Navigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import { Property } from '../types'
import { MapPin, Bed, Bath, Maximize, CheckCircle, XCircle, Clock, Shield, Star, Award, BarChart3 } from 'lucide-react'
import { AdminAnalyticsDashboard } from '../components/AdminAnalyticsDashboard'

export function AdminPropertiesPage() {
  const { user, isPropertyAdmin, profile, loading: authLoading } = useAuth()
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [actionId, setActionId] = useState<string | null>(null)
  const [actionType, setActionType] = useState<'approve' | 'reject' | null>(null)
  const [processing, setProcessing] = useState(false)
  const [activeTab, setActiveTab] = useState<'analytics' | 'pending' | 'approved' | 'rejected'>('analytics')
  const [rejectionReason, setRejectionReason] = useState('')
  const [adminNotes, setAdminNotes] = useState('')
  const [togglingTrustId, setTogglingTrustId] = useState<string | null>(null)
  const [togglingFeatureId, setTogglingFeatureId] = useState<string | null>(null)

  const loadProperties = useCallback(async () => {
    if (!user) return

    try {
      const { data, error } = await supabase
        .from('properties')
        .select(`
          *,
          users!properties_owner_id_fkey (
            id,
            email,
            name,
            phone,
            trusted
          )
        `)
        .order('created_at', { ascending: false })

      if (error) throw error
      setProperties(data || [])
    } catch (err) {
    } finally {
      setLoading(false)
    }
  }, [user?.id])

  useEffect(() => {
    if (user && (isPropertyAdmin || profile?.role === 'admin')) {
      loadProperties()
    }
  }, [user, isPropertyAdmin, profile, loadProperties])

  const toggleTrustedStatus = async (userId: string, currentStatus: boolean) => {
    setTogglingTrustId(userId)
    try {
      const { error } = await supabase
        .from('users')
        .update({
          trusted: !currentStatus,
          trusted_at: !currentStatus ? new Date().toISOString() : null,
          trusted_by: !currentStatus ? user?.id : null
        })
        .eq('id', userId)

      if (error) throw error

      setProperties(prev => prev.map(p => {
        if (p.users && p.users.id === userId) {
          return {
            ...p,
            users: { ...p.users, trusted: !currentStatus }
          }
        }
        return p
      }))
    } catch (err) {
      alert('Failed to update trusted status. Please try again.')
    } finally {
      setTogglingTrustId(null)
    }
  }
  const toggleFeaturedStatus = async (propertyId: string, currentStatus: boolean) => {
    setTogglingFeatureId(propertyId)
    try {
      const { error } = await supabase
        .from('properties')
        .update({ featured: !currentStatus })
        .eq('id', propertyId)

      if (error) throw error

      setProperties(prev => prev.map(p => 
        p.id === propertyId ? { ...p, featured: !currentStatus } : p
      ))
    } catch (err) {
      alert('Failed to update featured status. Please try again.')
    } finally {
      setTogglingFeatureId(null)
    }
  }
  const handleAction = async (propertyId: string, action: 'approve' | 'reject') => {
    setProcessing(true)
    try {
      const newStatus = action === 'approve' ? 'approved' : 'rejected'
      const updateData: any = { status: newStatus }

      if (action === 'approve') {
        updateData.approved_at = new Date().toISOString()
        updateData.rejection_reason = null
      } else if (action === 'reject') {
        updateData.rejection_reason = rejectionReason.trim() || null
      }

      if (adminNotes.trim()) {
        updateData.admin_notes = adminNotes.trim()
      }

      const { error } = await supabase
        .from('properties')
        .update(updateData)
        .eq('id', propertyId)

      if (error) throw error

      setProperties(prev => prev.map(p =>
        p.id === propertyId ? { ...p, status: newStatus, approved_at: updateData.approved_at, rejection_reason: updateData.rejection_reason, admin_notes: updateData.admin_notes } : p
      ))
      setActionId(null)
      setActionType(null)
      setRejectionReason('')
      setAdminNotes('')
    } catch (err) {
      alert('Failed to update property. Please try again.')
    } finally {
      setProcessing(false)
    }
  }

  const formatPrice = (price: number) => {
    if (price >= 10000000) {
      return `₹${(price / 10000000).toFixed(2)} Cr`
    } else if (price >= 100000) {
      return `₹${(price / 100000).toFixed(2)} L`
    }
    return `₹${price.toLocaleString('en-IN')}`
  }

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'approved':
        return (
          <span className="flex items-center gap-1 bg-green-100 text-green-700 px-3 py-1.5 rounded-full text-xs font-semibold">
            <CheckCircle className="h-3 w-3" />
            Approved
          </span>
        )
      case 'pending':
        return (
          <span className="flex items-center gap-1 bg-yellow-100 text-yellow-700 px-3 py-1.5 rounded-full text-xs font-semibold">
            <Clock className="h-3 w-3" />
            Pending
          </span>
        )
      case 'rejected':
        return (
          <span className="flex items-center gap-1 bg-red-100 text-red-700 px-3 py-1.5 rounded-full text-xs font-semibold">
            <XCircle className="h-3 w-3" />
            Rejected
          </span>
        )
      default:
        return null
    }
  }

  if (authLoading || loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading properties...</p>
        </div>
      </div>
    )
  }

  if (!isPropertyAdmin && profile?.role !== 'admin') {
    return <Navigate to="/" />
  }

  const filteredProperties = activeTab === 'analytics' ? [] : properties.filter(p => p.status === activeTab)
  const pendingCount = properties.filter(p => p.status === 'pending').length
  const approvedCount = properties.filter(p => p.status === 'approved').length
  const rejectedCount = properties.filter(p => p.status === 'rejected').length

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <div className="flex items-center justify-between">
            <div>
              <div className="flex items-center gap-3 mb-2">
                <Shield className="h-8 w-8 text-primary-600" />
                <h1 className="text-3xl md:text-4xl font-bold text-gray-900">Property Management Hub</h1>
              </div>
              <p className="text-gray-600">Moderate and feature property listings</p>
            </div>
            <a
              href="/admin/dashboard"
              className="hidden sm:flex items-center gap-2 px-6 py-3 bg-blue-600 text-white rounded-xl hover:bg-blue-700 transition-colors font-semibold shadow-md"
            >
              <BarChart3 className="h-5 w-5" />
              <span>View Analytics</span>
            </a>
          </div>
        </div>

        <div className="mb-6 bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden">
          <div className="flex border-b border-gray-200">
            <button
              onClick={() => setActiveTab('analytics')}
              className={`flex-1 px-6 py-4 font-semibold transition-all border-b-2 ${
                activeTab === 'analytics'
                  ? 'border-blue-500 text-blue-700 bg-blue-50'
                  : 'border-transparent text-gray-600 hover:bg-gray-50'
              }`}
            >
              <div className="flex items-center justify-center gap-2">
                <BarChart3 className="h-5 w-5" />
                <span>Analytics</span>
              </div>
            </button>
            <button
              onClick={() => setActiveTab('pending')}
              className={`flex-1 px-6 py-4 font-semibold transition-all border-b-2 ${
                activeTab === 'pending'
                  ? 'border-yellow-500 text-yellow-700 bg-yellow-50'
                  : 'border-transparent text-gray-600 hover:bg-gray-50'
              }`}
            >
              <div className="flex items-center justify-center gap-2">
                <Clock className="h-5 w-5" />
                <span>Pending</span>
                <span className="bg-yellow-100 text-yellow-700 px-2 py-0.5 rounded-full text-xs font-bold">
                  {pendingCount}
                </span>
              </div>
            </button>
            <button
              onClick={() => setActiveTab('approved')}
              className={`flex-1 px-6 py-4 font-semibold transition-all border-b-2 ${
                activeTab === 'approved'
                  ? 'border-green-500 text-green-700 bg-green-50'
                  : 'border-transparent text-gray-600 hover:bg-gray-50'
              }`}
            >
              <div className="flex items-center justify-center gap-2">
                <CheckCircle className="h-5 w-5" />
                <span>Approved</span>
                <span className="bg-green-100 text-green-700 px-2 py-0.5 rounded-full text-xs font-bold">
                  {approvedCount}
                </span>
              </div>
            </button>
            <button
              onClick={() => setActiveTab('rejected')}
              className={`flex-1 px-6 py-4 font-semibold transition-all border-b-2 ${
                activeTab === 'rejected'
                  ? 'border-red-500 text-red-700 bg-red-50'
                  : 'border-transparent text-gray-600 hover:bg-gray-50'
              }`}
            >
              <div className="flex items-center justify-center gap-2">
                <XCircle className="h-5 w-5" />
                <span>Rejected</span>
                <span className="bg-red-100 text-red-700 px-2 py-0.5 rounded-full text-xs font-bold">
                  {rejectedCount}
                </span>
              </div>
            </button>
          </div>
        </div>

        {activeTab === 'analytics' ? (
          <AdminAnalyticsDashboard />
        ) : filteredProperties.length === 0 ? (
          <div className="bg-white rounded-2xl shadow-lg p-12 text-center">
            <div className="max-w-md mx-auto">
              <div className="bg-gray-100 rounded-full p-6 w-24 h-24 mx-auto mb-6 flex items-center justify-center">
                <CheckCircle className="h-12 w-12 text-gray-400" />
              </div>
              <h2 className="text-2xl font-bold text-gray-900 mb-3">
                {activeTab === 'pending' ? 'All Caught Up!' : `No ${activeTab} Properties`}
              </h2>
              <p className="text-gray-600">
                {activeTab === 'pending'
                  ? 'No pending properties to review.'
                  : activeTab === 'approved'
                  ? 'No approved properties yet.'
                  : 'No rejected properties.'}
              </p>
            </div>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {filteredProperties.map((property) => {
              const mainImage = property.images?.[0] || 'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&w=800'

              return (
                <div
                  key={property.id}
                  className="bg-white rounded-2xl overflow-hidden shadow-lg border border-gray-200 hover:shadow-xl transition-all duration-300"
                >
                  <div className="relative h-48 overflow-hidden">
                    <img
                      src={mainImage}
                      alt={property.title}
                      className="w-full h-full object-cover"
                    />
                    <div className="absolute top-3 left-3 flex flex-wrap gap-2">
                      <span className="bg-white/90 backdrop-blur-sm text-gray-900 px-3 py-1.5 rounded-full text-xs font-semibold shadow-lg capitalize">
                        {property.listing_type}
                      </span>
                      {property.featured && (
                        <span className="flex items-center gap-1 bg-gradient-to-r from-amber-400 to-yellow-500 text-white px-3 py-1.5 rounded-full text-xs font-semibold shadow-lg">
                          <Star className="h-3 w-3 fill-white" />
                          Featured
                        </span>
                      )}
                      {getStatusBadge(property.status || 'pending')}
                    </div>
                  </div>

                  <div className="p-5">
                    <h3 className="text-lg font-bold text-gray-900 mb-2 line-clamp-2">
                      {property.title}
                    </h3>

                    <div className="flex items-center text-gray-600 text-sm mb-2">
                      <MapPin className="h-4 w-4 mr-1.5 text-primary-500 flex-shrink-0" />
                      <span className="line-clamp-1">{property.location}, {property.city}</span>
                    </div>

                    {property.users && (
                      <div className="mb-3 space-y-2">
                        <div className="text-xs text-gray-500 bg-gray-50 px-2 py-1.5 rounded border border-gray-200">
                          <span className="font-medium">Owner: </span>
                          {property.users.email || property.users.phone || property.users.name}
                        </div>
                        <div className="flex items-center gap-2">
                          {property.users.trusted ? (
                            <div className="flex items-center gap-1 bg-gradient-to-r from-amber-100 to-yellow-100 text-amber-700 px-2 py-1 rounded-lg text-xs font-semibold border border-amber-200">
                              <Award className="h-3 w-3" />
                              <span>Trusted Owner</span>
                              <Star className="h-3 w-3 fill-amber-600" />
                            </div>
                          ) : (
                            <div className="flex items-center gap-1 bg-gray-100 text-gray-600 px-2 py-1 rounded-lg text-xs">
                              <Shield className="h-3 w-3" />
                              <span>Standard User</span>
                            </div>
                          )}
                          <button
                            onClick={() => property.users && toggleTrustedStatus(property.users.id, property.users.trusted)}
                            disabled={togglingTrustId === property.users?.id}
                            className={`flex items-center gap-1 px-2 py-1 rounded-lg text-xs font-medium transition-all ${
                              property.users.trusted
                                ? 'bg-red-50 text-red-600 hover:bg-red-100 border border-red-200'
                                : 'bg-green-50 text-green-600 hover:bg-green-100 border border-green-200'
                            } disabled:opacity-50`}
                          >
                            {togglingTrustId === property.users.id ? (
                              <div className="animate-spin rounded-full h-3 w-3 border-2 border-current border-t-transparent"></div>
                            ) : (
                              <>
                                {property.users.trusted ? (
                                  <>
                                    <XCircle className="h-3 w-3" />
                                    <span>Remove Trust</span>
                                  </>
                                ) : (
                                  <>
                                    <Star className="h-3 w-3" />
                                    <span>Mark Trusted</span>
                                  </>
                                )}
                              </>
                            )}
                          </button>
                        </div>
                        {property.users.trusted && property.status === 'pending' && (
                          <div className="bg-amber-50 border border-amber-200 rounded-lg p-2">
                            <p className="text-xs text-amber-700 flex items-center gap-1">
                              <Award className="h-3 w-3" />
                              This owner is trusted. Their future properties will be auto-approved.
                            </p>
                          </div>
                        )}
                      </div>
                    )}

                    <div className="flex items-center gap-4 text-gray-600 text-sm mb-3 pb-3 border-b border-gray-100">
                      {property.bedrooms && property.bedrooms > 0 && (
                        <div className="flex items-center gap-1">
                          <Bed className="h-4 w-4 text-primary-500" />
                          <span className="font-medium">{property.bedrooms} BHK</span>
                        </div>
                      )}
                      {property.bathrooms && property.bathrooms > 0 && (
                        <div className="flex items-center gap-1">
                          <Bath className="h-4 w-4 text-primary-500" />
                          <span className="font-medium">{property.bathrooms}</span>
                        </div>
                      )}
                      <div className="flex items-center gap-1">
                        <Maximize className="h-4 w-4 text-primary-500" />
                        <span className="font-medium">{property.area_sqft} sqft</span>
                      </div>
                    </div>

                    <div className="mb-4">
                      <div className="text-2xl font-bold bg-gradient-to-r from-primary-600 to-primary-700 bg-clip-text text-transparent">
                        {formatPrice(property.price)}
                      </div>
                    </div>

                    {property.status === 'rejected' && property.rejection_reason && (
                      <div className="mb-4 bg-red-50 border border-red-200 rounded-lg p-3">
                        <p className="text-xs font-semibold text-red-900 mb-1">Rejection Reason:</p>
                        <p className="text-sm text-red-700">{property.rejection_reason}</p>
                      </div>
                    )}

                    {property.admin_notes && (
                      <div className="mb-4 bg-blue-50 border border-blue-200 rounded-lg p-3">
                        <p className="text-xs font-semibold text-blue-900 mb-1 flex items-center gap-1">
                          <Shield className="h-3 w-3" />
                          Admin Notes (Internal Only)
                        </p>
                        <p className="text-sm text-blue-700 whitespace-pre-wrap">{property.admin_notes}</p>
                      </div>
                    )}

                    {property.status === 'pending' && (
                      <div className="flex gap-2">
                        <button
                          onClick={() => {
                            setActionId(property.id)
                            setActionType('approve')
                            setAdminNotes(property.admin_notes || '')
                          }}
                          className="flex-1 flex items-center justify-center gap-2 px-4 py-2.5 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-all text-sm font-semibold"
                        >
                          <CheckCircle className="h-4 w-4" />
                          <span>Approve</span>
                        </button>
                        <button
                          onClick={() => {
                            setActionId(property.id)
                            setActionType('reject')
                            setAdminNotes(property.admin_notes || '')
                          }}
                          className="flex-1 flex items-center justify-center gap-2 px-4 py-2.5 bg-red-50 text-red-600 rounded-lg hover:bg-red-100 transition-all text-sm font-semibold border border-red-200"
                        >
                          <XCircle className="h-4 w-4" />
                          <span>Reject</span>
                        </button>
                      </div>
                    )}

                    {property.status !== 'pending' && (
                      <div className="flex gap-2">
                        <a
                          href={`/property/${property.id}`}
                          className="flex-1 text-center px-4 py-2.5 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-all text-sm font-semibold flex items-center justify-center gap-1.5"
                        >
                          View Details
                        </a>
                        <button
                          onClick={() => toggleFeaturedStatus(property.id, !!property.featured)}
                          disabled={togglingFeatureId === property.id}
                          className={`flex-1 flex items-center justify-center gap-1.5 px-4 py-2.5 rounded-lg transition-all text-sm font-semibold ${
                            property.featured
                              ? 'bg-amber-100 text-amber-700 hover:bg-amber-200 border border-amber-300'
                              : 'bg-white text-amber-600 hover:bg-amber-50 border border-amber-200'
                          } disabled:opacity-50`}
                        >
                          {togglingFeatureId === property.id ? (
                            <div className="animate-spin rounded-full h-4 w-4 border-2 border-current border-t-transparent"></div>
                          ) : (
                            <>
                              <Star className={`h-4 w-4 ${property.featured ? 'fill-amber-600' : ''}`} />
                              <span>{property.featured ? 'Unfeature' : 'Feature'}</span>
                            </>
                          )}
                        </button>
                      </div>
                    )}
                  </div>
                </div>
              )
            })}
          </div>
        )}
      </div>

      {actionId && actionType && (
        <div
          onClick={() => { setActionId(null); setActionType(null); setRejectionReason('') }}
          className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-end md:items-center justify-center z-50 md:p-4 animate-fadeIn"
        >
          <div
            onClick={(e) => e.stopPropagation()}
            className="bg-white rounded-t-2xl md:rounded-2xl shadow-2xl max-w-md w-full p-6 animate-slideUpMobile md:animate-slide-up max-h-[95vh] overflow-y-auto"
          >
            <div className="flex items-center gap-3 mb-4">
              <div className={`rounded-full p-3 ${actionType === 'approve' ? 'bg-green-100' : 'bg-red-100'}`}>
                {actionType === 'approve' ? (
                  <CheckCircle className="h-6 w-6 text-green-600" />
                ) : (
                  <XCircle className="h-6 w-6 text-red-600" />
                )}
              </div>
              <h3 className="text-xl font-bold text-gray-900">
                {actionType === 'approve' ? 'Approve Property?' : 'Reject Property?'}
              </h3>
            </div>
            <p className="text-gray-600 mb-4">
              {actionType === 'approve'
                ? 'This property will be published and visible to all users.'
                : 'This property will be rejected and hidden from public view. The owner can still see it in their dashboard.'}
            </p>
            {actionType === 'reject' && (
              <div className="mb-6">
                <label htmlFor="rejection-reason" className="block text-sm font-semibold text-gray-700 mb-2">
                  Reason for Rejection (Optional)
                </label>
                <textarea
                  id="rejection-reason"
                  value={rejectionReason}
                  onChange={(e) => setRejectionReason(e.target.value)}
                  placeholder="e.g., Images are unclear, price seems incorrect, incomplete property details..."
                  className="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-transparent resize-none text-sm"
                  rows={3}
                />
                <p className="text-xs text-gray-500 mt-1">This will help the owner understand what needs to be fixed.</p>
              </div>
            )}
            <div className="mb-6">
              <label htmlFor="admin-notes" className="block text-sm font-semibold text-gray-700 mb-2 flex items-center gap-1">
                <Shield className="h-4 w-4 text-blue-600" />
                Admin Notes (Internal Only)
              </label>
              <textarea
                id="admin-notes"
                value={adminNotes}
                onChange={(e) => setAdminNotes(e.target.value)}
                placeholder="Internal notes about this property (not visible to owner)..."
                className="w-full px-4 py-3 border border-blue-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent resize-none text-sm bg-blue-50/30"
                rows={2}
              />
              <p className="text-xs text-blue-600 mt-1 flex items-center gap-1">
                <Shield className="h-3 w-3" />
                These notes are only visible to admins
              </p>
            </div>
            <div className="flex gap-3">
              <button
                onClick={() => {
                  setActionId(null)
                  setActionType(null)
                  setRejectionReason('')
                  setAdminNotes('')
                }}
                disabled={processing}
                className="flex-1 px-4 py-2.5 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200 transition-all font-semibold disabled:opacity-50"
              >
                Cancel
              </button>
              <button
                onClick={() => handleAction(actionId, actionType)}
                disabled={processing}
                className={`flex-1 px-4 py-2.5 text-white rounded-lg transition-all font-semibold disabled:opacity-50 flex items-center justify-center gap-2 ${
                  actionType === 'approve'
                    ? 'bg-green-600 hover:bg-green-700'
                    : 'bg-red-600 hover:bg-red-700'
                }`}
              >
                {processing ? (
                  <>
                    <div className="animate-spin rounded-full h-4 w-4 border-2 border-white border-t-transparent"></div>
                    <span>Processing...</span>
                  </>
                ) : (
                  <>
                    {actionType === 'approve' ? (
                      <>
                        <CheckCircle className="h-4 w-4" />
                        <span>Approve</span>
                      </>
                    ) : (
                      <>
                        <XCircle className="h-4 w-4" />
                        <span>Reject</span>
                      </>
                    )}
                  </>
                )}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
