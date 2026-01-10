import { useState, useEffect } from 'react'
import { Navigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import { Property } from '../types'
import { MapPin, Bed, Bath, Maximize, CheckCircle, XCircle, Clock, Shield } from 'lucide-react'

export function AdminPropertiesPage() {
  const { user, isAdmin, loading: authLoading } = useAuth()
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [actionId, setActionId] = useState<string | null>(null)
  const [actionType, setActionType] = useState<'approve' | 'reject' | null>(null)
  const [processing, setProcessing] = useState(false)
  const [filter, setFilter] = useState<'pending' | 'all'>('pending')

  useEffect(() => {
    if (user && isAdmin) {
      loadProperties()
    }
  }, [user, isAdmin, filter])

  const loadProperties = async () => {
    if (!user) return

    try {
      let query = supabase
        .from('properties')
        .select(`
          *,
          users!properties_owner_id_fkey (
            email,
            name,
            phone
          )
        `)
        .order('created_at', { ascending: false })

      if (filter === 'pending') {
        query = query.eq('status', 'pending')
      }

      const { data, error } = await query

      if (error) throw error
      setProperties(data || [])
    } catch (err) {
      console.error('Error loading properties:', err)
    } finally {
      setLoading(false)
    }
  }

  const handleAction = async (propertyId: string, action: 'approve' | 'reject') => {
    setProcessing(true)
    try {
      const newStatus = action === 'approve' ? 'approved' : 'rejected'

      const { error } = await supabase
        .from('properties')
        .update({ status: newStatus })
        .eq('id', propertyId)

      if (error) throw error

      setProperties(prev => prev.map(p =>
        p.id === propertyId ? { ...p, status: newStatus } : p
      ))
      setActionId(null)
      setActionType(null)
    } catch (err) {
      console.error('Error updating property:', err)
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

  if (!isAdmin) {
    return <Navigate to="/" />
  }

  const pendingCount = properties.filter(p => p.status === 'pending').length

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-2">
            <Shield className="h-8 w-8 text-primary-600" />
            <h1 className="text-3xl md:text-4xl font-bold text-gray-900">Admin Dashboard</h1>
          </div>
          <p className="text-gray-600">Moderate property listings</p>
        </div>

        <div className="mb-6 flex items-center justify-between flex-wrap gap-4">
          <div className="flex gap-2">
            <button
              onClick={() => setFilter('pending')}
              className={`px-4 py-2 rounded-lg font-semibold transition-all ${
                filter === 'pending'
                  ? 'bg-primary-600 text-white shadow-md'
                  : 'bg-white text-gray-700 hover:bg-gray-50'
              }`}
            >
              Pending ({pendingCount})
            </button>
            <button
              onClick={() => setFilter('all')}
              className={`px-4 py-2 rounded-lg font-semibold transition-all ${
                filter === 'all'
                  ? 'bg-primary-600 text-white shadow-md'
                  : 'bg-white text-gray-700 hover:bg-gray-50'
              }`}
            >
              All Properties ({properties.length})
            </button>
          </div>
        </div>

        {properties.length === 0 ? (
          <div className="bg-white rounded-2xl shadow-lg p-12 text-center">
            <div className="max-w-md mx-auto">
              <div className="bg-gray-100 rounded-full p-6 w-24 h-24 mx-auto mb-6 flex items-center justify-center">
                <CheckCircle className="h-12 w-12 text-gray-400" />
              </div>
              <h2 className="text-2xl font-bold text-gray-900 mb-3">All Caught Up!</h2>
              <p className="text-gray-600">
                {filter === 'pending'
                  ? 'No pending properties to review.'
                  : 'No properties found.'}
              </p>
            </div>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {properties.map((property) => {
              const mainImage = property.images[0] || 'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg?auto=compress&cs=tinysrgb&w=800'

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
                      <div className="text-xs text-gray-500 mb-3 bg-gray-50 px-2 py-1.5 rounded border border-gray-200">
                        <span className="font-medium">Owner: </span>
                        {property.users.email || property.users.phone || property.users.name}
                      </div>
                    )}

                    <div className="flex items-center gap-4 text-gray-600 text-sm mb-3 pb-3 border-b border-gray-100">
                      {property.bedrooms > 0 && (
                        <div className="flex items-center gap-1">
                          <Bed className="h-4 w-4 text-primary-500" />
                          <span className="font-medium">{property.bedrooms} BHK</span>
                        </div>
                      )}
                      {property.bathrooms > 0 && (
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

                    {property.status === 'pending' && (
                      <div className="flex gap-2">
                        <button
                          onClick={() => {
                            setActionId(property.id)
                            setActionType('approve')
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
                          }}
                          className="flex-1 flex items-center justify-center gap-2 px-4 py-2.5 bg-red-50 text-red-600 rounded-lg hover:bg-red-100 transition-all text-sm font-semibold border border-red-200"
                        >
                          <XCircle className="h-4 w-4" />
                          <span>Reject</span>
                        </button>
                      </div>
                    )}

                    {property.status !== 'pending' && (
                      <a
                        href={`/property/${property.id}`}
                        className="block w-full text-center px-4 py-2.5 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition-all text-sm font-semibold"
                      >
                        View Details
                      </a>
                    )}
                  </div>
                </div>
              )
            })}
          </div>
        )}
      </div>

      {actionId && actionType && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl shadow-2xl max-w-md w-full p-6">
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
            <p className="text-gray-600 mb-6">
              {actionType === 'approve'
                ? 'This property will be published and visible to all users.'
                : 'This property will be rejected and hidden from public view. The owner can still see it in their dashboard.'}
            </p>
            <div className="flex gap-3">
              <button
                onClick={() => {
                  setActionId(null)
                  setActionType(null)
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
