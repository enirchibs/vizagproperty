import { useAdminAnalytics } from '../hooks/useAdminAnalytics'
import { TrendingUp, Clock, CheckCircle, XCircle, Users, Home, BarChart3, MapPin, Calendar, Award } from 'lucide-react'

export function AdminAnalyticsDashboard() {
  const { kpis, propertyTypeDistribution, localityDistribution, loading, error } = useAdminAnalytics()

  if (loading) {
    return (
      <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-12">
        <div className="flex items-center justify-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="bg-red-50 border border-red-200 rounded-2xl p-6">
        <p className="text-red-700 text-center">{error}</p>
      </div>
    )
  }

  const formatPropertyType = (type: string) => {
    return type
      .split('_')
      .map(word => word.charAt(0).toUpperCase() + word.slice(1))
      .join(' ')
  }

  const maxLocalityCount = Math.max(...localityDistribution.map(l => l.total), 1)
  const maxTypeCount = Math.max(...propertyTypeDistribution.map(t => t.total), 1)

  return (
    <div className="space-y-6">
      <div className="bg-gradient-to-r from-blue-600 to-blue-700 rounded-2xl p-8 text-white shadow-xl">
        <div className="flex items-center gap-3 mb-2">
          <BarChart3 className="h-8 w-8" />
          <h2 className="text-3xl font-bold">Analytics Dashboard</h2>
        </div>
        <p className="text-blue-100">Real-time insights and key performance metrics</p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6 hover:shadow-xl transition-shadow">
          <div className="flex items-center justify-between mb-4">
            <div className="bg-blue-100 rounded-full p-3">
              <Home className="h-6 w-6 text-blue-600" />
            </div>
            <span className="text-xs font-semibold text-gray-500 uppercase tracking-wide">Total</span>
          </div>
          <div className="text-3xl font-bold text-gray-900 mb-1">{kpis.totalProperties}</div>
          <p className="text-sm text-gray-600">Total Properties</p>
        </div>

        <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6 hover:shadow-xl transition-shadow">
          <div className="flex items-center justify-between mb-4">
            <div className="bg-yellow-100 rounded-full p-3">
              <Clock className="h-6 w-6 text-yellow-600" />
            </div>
            <span className="text-xs font-semibold text-gray-500 uppercase tracking-wide">Pending</span>
          </div>
          <div className="text-3xl font-bold text-gray-900 mb-1">{kpis.pendingApprovals}</div>
          <p className="text-sm text-gray-600">Pending Approvals</p>
        </div>

        <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6 hover:shadow-xl transition-shadow">
          <div className="flex items-center justify-between mb-4">
            <div className="bg-green-100 rounded-full p-3">
              <CheckCircle className="h-6 w-6 text-green-600" />
            </div>
            <span className="text-xs font-semibold text-gray-500 uppercase tracking-wide">Live</span>
          </div>
          <div className="text-3xl font-bold text-gray-900 mb-1">{kpis.approvedListings}</div>
          <p className="text-sm text-gray-600">Approved Listings</p>
        </div>

        <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6 hover:shadow-xl transition-shadow">
          <div className="flex items-center justify-between mb-4">
            <div className="bg-red-100 rounded-full p-3">
              <XCircle className="h-6 w-6 text-red-600" />
            </div>
            <span className="text-xs font-semibold text-gray-500 uppercase tracking-wide">Rejected</span>
          </div>
          <div className="text-3xl font-bold text-gray-900 mb-1">{kpis.rejectedListings}</div>
          <p className="text-sm text-gray-600">Rejected Listings</p>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6 hover:shadow-xl transition-shadow">
          <div className="flex items-center gap-3 mb-4">
            <div className="bg-amber-100 rounded-full p-3">
              <Award className="h-6 w-6 text-amber-600" />
            </div>
            <div>
              <div className="text-2xl font-bold text-gray-900">{kpis.trustedOwnersCount}</div>
              <p className="text-sm text-gray-600">Trusted Owners</p>
            </div>
          </div>
          <div className="bg-amber-50 border border-amber-200 rounded-lg p-3">
            <p className="text-xs text-amber-700">
              Owners with auto-approval privileges
            </p>
          </div>
        </div>

        <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6 hover:shadow-xl transition-shadow">
          <div className="flex items-center gap-3 mb-4">
            <div className="bg-green-100 rounded-full p-3">
              <Calendar className="h-6 w-6 text-green-600" />
            </div>
            <div>
              <div className="text-2xl font-bold text-gray-900">{kpis.newListings7Days}</div>
              <p className="text-sm text-gray-600">Last 7 Days</p>
            </div>
          </div>
          <div className="bg-green-50 border border-green-200 rounded-lg p-3">
            <p className="text-xs text-green-700">
              New property submissions this week
            </p>
          </div>
        </div>

        <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6 hover:shadow-xl transition-shadow">
          <div className="flex items-center gap-3 mb-4">
            <div className="bg-blue-100 rounded-full p-3">
              <TrendingUp className="h-6 w-6 text-blue-600" />
            </div>
            <div>
              <div className="text-2xl font-bold text-gray-900">{kpis.newListings30Days}</div>
              <p className="text-sm text-gray-600">Last 30 Days</p>
            </div>
          </div>
          <div className="bg-blue-50 border border-blue-200 rounded-lg p-3">
            <p className="text-xs text-blue-700">
              Monthly growth trajectory
            </p>
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6">
          <div className="flex items-center gap-3 mb-6">
            <div className="bg-blue-100 rounded-full p-2">
              <BarChart3 className="h-5 w-5 text-blue-600" />
            </div>
            <h3 className="text-xl font-bold text-gray-900">Property Type Distribution</h3>
          </div>
          {propertyTypeDistribution.length === 0 ? (
            <div className="text-center py-8 text-gray-500">
              <p>No approved properties yet</p>
            </div>
          ) : (
            <div className="space-y-4">
              {propertyTypeDistribution.map((item) => (
                <div key={item.property_type}>
                  <div className="flex items-center justify-between mb-2">
                    <span className="text-sm font-medium text-gray-700">
                      {formatPropertyType(item.property_type)}
                    </span>
                    <span className="text-sm font-bold text-gray-900">{item.total}</span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-2.5 overflow-hidden">
                    <div
                      className="bg-gradient-to-r from-blue-500 to-blue-600 h-2.5 rounded-full transition-all duration-500"
                      style={{ width: `${(item.total / maxTypeCount) * 100}%` }}
                    ></div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>

        <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6">
          <div className="flex items-center gap-3 mb-6">
            <div className="bg-green-100 rounded-full p-2">
              <MapPin className="h-5 w-5 text-green-600" />
            </div>
            <h3 className="text-xl font-bold text-gray-900">Top Localities</h3>
          </div>
          {localityDistribution.length === 0 ? (
            <div className="text-center py-8 text-gray-500">
              <p>No locality data available</p>
            </div>
          ) : (
            <div className="space-y-4">
              {localityDistribution.map((item, index) => (
                <div key={item.locality}>
                  <div className="flex items-center justify-between mb-2">
                    <div className="flex items-center gap-2">
                      <span className="flex items-center justify-center w-6 h-6 bg-gray-100 rounded-full text-xs font-bold text-gray-600">
                        {index + 1}
                      </span>
                      <span className="text-sm font-medium text-gray-700">{item.locality}</span>
                    </div>
                    <span className="text-sm font-bold text-gray-900">{item.total}</span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-2.5 overflow-hidden">
                    <div
                      className="bg-gradient-to-r from-green-500 to-green-600 h-2.5 rounded-full transition-all duration-500"
                      style={{ width: `${(item.total / maxLocalityCount) * 100}%` }}
                    ></div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>

      <div className="bg-gradient-to-r from-gray-50 to-gray-100 rounded-2xl p-6 border border-gray-200">
        <div className="flex items-center justify-between">
          <div>
            <h4 className="text-lg font-bold text-gray-900 mb-1">Quick Summary</h4>
            <p className="text-sm text-gray-600">
              {kpis.pendingApprovals > 0 ? (
                <>
                  You have <span className="font-bold text-yellow-700">{kpis.pendingApprovals} pending</span> approval
                  {kpis.pendingApprovals !== 1 ? 's' : ''} waiting for review
                </>
              ) : (
                <>All caught up! No pending approvals at the moment.</>
              )}
            </p>
          </div>
          <div className="bg-white rounded-full p-4 shadow-md">
            <Users className="h-8 w-8 text-blue-600" />
          </div>
        </div>
      </div>
    </div>
  )
}
