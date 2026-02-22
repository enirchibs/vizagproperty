import { useNavigate } from 'react-router-dom'
import { Bell, Home, X, CheckCheck } from 'lucide-react'
import { useNotifications } from '../hooks/useNotifications'

export function NotificationsPanel() {
  const navigate = useNavigate()
  const { notifications, unreadCount, loading, markAsRead, markAllAsRead, deleteNotification } = useNotifications()

  const formatTimestamp = (timestamp: string) => {
    const date = new Date(timestamp)
    const now = new Date()
    const diffMs = now.getTime() - date.getTime()
    const diffMins = Math.floor(diffMs / 60000)
    const diffHours = Math.floor(diffMs / 3600000)
    const diffDays = Math.floor(diffMs / 86400000)

    if (diffMins < 1) return 'Just now'
    if (diffMins < 60) return `${diffMins}m ago`
    if (diffHours < 24) return `${diffHours}h ago`
    if (diffDays < 7) return `${diffDays}d ago`
    return date.toLocaleDateString()
  }

  const handleNotificationClick = (notificationId: string, propertyId: string) => {
    markAsRead(notificationId)
    navigate(`/property/${propertyId}`)
  }

  const getPropertyTypeLabel = (type: string) => {
    const labels: Record<string, string> = {
      'flat_apartment': 'Flat',
      'independent_house_villa': 'Villa',
      'plot_land': 'Plot',
      'pg_hostel': 'PG',
      'farmhouse': 'Farmhouse'
    }
    return labels[type] || type
  }

  if (loading) {
    return (
      <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6">
        <div className="flex items-center justify-center">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-primary-600"></div>
        </div>
      </div>
    )
  }

  if (notifications.length === 0) {
    return (
      <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-8">
        <div className="text-center">
          <div className="bg-gray-100 rounded-full p-4 w-16 h-16 mx-auto mb-4 flex items-center justify-center">
            <Bell className="h-8 w-8 text-gray-400" />
          </div>
          <h3 className="text-lg font-bold text-gray-900 mb-2">No Notifications</h3>
          <p className="text-gray-600 text-sm">
            You'll see new property alerts here based on your searches
          </p>
        </div>
      </div>
    )
  }

  return (
    <div className="bg-white rounded-2xl shadow-lg border border-gray-200 overflow-hidden">
      <div className="bg-gradient-to-r from-primary-600 to-primary-700 p-4 sm:p-6">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="bg-white/20 backdrop-blur-sm rounded-full p-2">
              <Bell className="h-5 w-5 sm:h-6 sm:w-6 text-white" />
            </div>
            <div>
              <h2 className="text-lg sm:text-xl font-bold text-white">Notifications</h2>
              <p className="text-primary-100 text-xs sm:text-sm">Properties matching your search</p>
            </div>
          </div>
          {unreadCount > 0 && (
            <button
              onClick={markAllAsRead}
              className="hidden sm:flex items-center gap-1 px-3 py-1 bg-white/20 hover:bg-white/30 text-white text-sm font-medium rounded-lg transition-colors"
            >
              <CheckCheck className="h-4 w-4" />
              Mark all read
            </button>
          )}
        </div>
      </div>

      <div className="divide-y divide-gray-100 max-h-[600px] overflow-y-auto">
        {notifications.map((notification) => {
          const property = notification.property
          if (!property) return null

          return (
            <div
              key={notification.id}
              className={`p-4 hover:bg-gray-50 transition-colors cursor-pointer ${
                !notification.is_read ? 'bg-primary-50/30' : ''
              }`}
              onClick={() => handleNotificationClick(notification.id, property.id)}
            >
              <div className="flex items-start gap-3">
                <div className="flex-shrink-0 w-16 h-16 sm:w-20 sm:h-20 rounded-lg overflow-hidden bg-gradient-to-br from-gray-100 to-gray-200">
                  {property.images && property.images.length > 0 ? (
                    <img
                      src={property.images?.[0] || 'https://images.pexels.com/photos/1396122/pexels-photo-1396122.jpeg'}
                      alt={property.title}
                      className="w-full h-full object-cover"
                    />
                  ) : (
                    <div className="w-full h-full flex items-center justify-center">
                      <Home className="h-6 w-6 sm:h-8 sm:w-8 text-gray-400" />
                    </div>
                  )}
                </div>

                <div className="flex-1 min-w-0">
                  <div className="flex items-start justify-between gap-2 mb-1">
                    <h3 className={`text-sm sm:text-base line-clamp-1 ${
                      !notification.is_read ? 'font-bold text-gray-900' : 'font-semibold text-gray-800'
                    }`}>
                      New {getPropertyTypeLabel(property.property_type)} near you
                    </h3>
                    {!notification.is_read && (
                      <div className="flex-shrink-0 h-2 w-2 bg-primary-600 rounded-full"></div>
                    )}
                  </div>

                  <p className="text-sm text-gray-900 line-clamp-1 mb-2">
                    {property.title}
                  </p>

                  <div className="flex items-center gap-3 flex-wrap">
                    <span className="text-base sm:text-lg font-bold text-primary-600">
                      ₹{(property.price / 100000).toFixed(2)}L
                    </span>
                    {property.bedrooms && (
                      <span className="text-xs text-gray-600">
                        {property.bedrooms} BHK
                      </span>
                    )}
                    <span className="text-xs text-gray-500">
                      {formatTimestamp(notification.created_at)}
                    </span>
                  </div>

                  <div className="flex items-center gap-2 mt-2">
                    <span className={`text-xs px-2 py-1 rounded-full ${
                      property.listing_type === 'sale'
                        ? 'bg-green-100 text-green-700'
                        : 'bg-blue-100 text-blue-700'
                    }`}>
                      For {property.listing_type === 'sale' ? 'Sale' : 'Rent'}
                    </span>
                  </div>
                </div>

                <button
                  onClick={(e) => {
                    e.stopPropagation()
                    deleteNotification(notification.id)
                  }}
                  className="flex-shrink-0 p-1 hover:bg-gray-200 rounded-lg transition-colors"
                >
                  <X className="h-4 w-4 text-gray-400 hover:text-gray-600" />
                </button>
              </div>
            </div>
          )
        })}
      </div>

      {notifications.length >= 20 && (
        <div className="p-4 bg-gray-50 text-center">
          <p className="text-xs text-gray-500">Showing latest 20 notifications</p>
        </div>
      )}

      {unreadCount > 0 && (
        <div className="p-3 bg-gray-50 border-t border-gray-200 sm:hidden">
          <button
            onClick={markAllAsRead}
            className="w-full flex items-center justify-center gap-2 px-4 py-2 bg-primary-600 hover:bg-primary-700 text-white text-sm font-semibold rounded-lg transition-colors"
          >
            <CheckCheck className="h-4 w-4" />
            Mark all as read
          </button>
        </div>
      )}
    </div>
  )
}
