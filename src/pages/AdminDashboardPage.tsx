import { Navigate } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { useAdminAnalytics } from '../hooks/useAdminAnalytics'
import { Shield, AlertTriangle, TrendingUp } from 'lucide-react'
import { AdminAnalyticsDashboard } from '../components/AdminAnalyticsDashboard'

export function AdminDashboardPage() {
  const { user, profile, loading: authLoading } = useAuth()
  const { kpis, loading } = useAdminAnalytics()

  if (authLoading || loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
      </div>
    )
  }

  if (!user || !profile || profile.role !== 'admin') {
    return <Navigate to="/" />
  }

  const showPendingWarning = kpis.pendingApprovals > 10

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="mb-8">
          <div className="flex items-center justify-between">
            <div>
              <div className="flex items-center gap-3 mb-2">
                <Shield className="h-8 w-8 text-blue-600" />
                <h1 className="text-3xl md:text-4xl font-bold text-gray-900">Admin Dashboard</h1>
              </div>
              <p className="text-gray-600">Business insights and platform analytics</p>
            </div>
            <a
              href="/admin/properties"
              className="hidden sm:flex items-center gap-2 px-6 py-3 bg-yellow-600 text-white rounded-xl hover:bg-yellow-700 transition-colors font-semibold shadow-md"
            >
              <Shield className="h-5 w-5" />
              <span>Moderate Properties</span>
            </a>
          </div>
        </div>

        {showPendingWarning && (
          <div className="mb-6 bg-yellow-50 border-l-4 border-yellow-500 rounded-lg p-6 shadow-md">
            <div className="flex items-start gap-4">
              <div className="flex-shrink-0">
                <AlertTriangle className="h-6 w-6 text-yellow-600" />
              </div>
              <div className="flex-1">
                <h3 className="text-lg font-bold text-yellow-900 mb-1">
                  Pending Approvals Are Piling Up
                </h3>
                <p className="text-yellow-800 mb-3">
                  You have <span className="font-bold">{kpis.pendingApprovals}</span> properties waiting for review.
                  Consider reviewing them soon to keep the platform active.
                </p>
                <a
                  href="/admin/properties"
                  className="inline-flex items-center gap-2 px-4 py-2 bg-yellow-600 text-white rounded-lg hover:bg-yellow-700 transition-colors font-semibold text-sm"
                >
                  Review Now
                </a>
              </div>
            </div>
          </div>
        )}

        {kpis.newListings7Days > 20 && (
          <div className="mb-6 bg-green-50 border-l-4 border-green-500 rounded-lg p-6 shadow-md">
            <div className="flex items-start gap-4">
              <div className="flex-shrink-0">
                <TrendingUp className="h-6 w-6 text-green-600" />
              </div>
              <div className="flex-1">
                <h3 className="text-lg font-bold text-green-900 mb-1">
                  Strong Growth This Week
                </h3>
                <p className="text-green-800">
                  Platform is growing! <span className="font-bold">{kpis.newListings7Days}</span> new properties were added in the last 7 days.
                </p>
              </div>
            </div>
          </div>
        )}

        <AdminAnalyticsDashboard />
      </div>
    </div>
  )
}
