import { useState, useEffect } from 'react'
import { supabase } from '../lib/supabase'
import { useAuth } from '../contexts/AuthContext'
import { Bell, CheckCircle, Mail, MessageCircle, AlertCircle } from 'lucide-react'

interface Notification {
  id: string
  message: string
  channel: string
  sent: boolean
  created_at: string
  property_id: string | null
}

export function NotificationsPanel() {
  const { user } = useAuth()
  const [notifications, setNotifications] = useState<Notification[]>([])
  const [loading, setLoading] = useState(true)
  const [unreadCount, setUnreadCount] = useState(0)

  useEffect(() => {
    if (user) {
      loadNotifications()
    }
  }, [user])

  const loadNotifications = async () => {
    if (!user) return

    try {
      const { data, error } = await supabase
        .from('notifications_queue')
        .select('*')
        .eq('user_id', user.id)
        .order('created_at', { ascending: false })
        .limit(10)

      if (error) throw error

      setNotifications(data || [])
      setUnreadCount(data?.filter(n => !n.sent).length || 0)
    } catch (err) {
      console.error('Error loading notifications:', err)
    } finally {
      setLoading(false)
    }
  }

  const markAsRead = async (notificationId: string) => {
    try {
      const { error } = await supabase
        .from('notifications_queue')
        .update({ sent: true, sent_at: new Date().toISOString() })
        .eq('id', notificationId)

      if (error) throw error

      setNotifications(prev => prev.map(n =>
        n.id === notificationId ? { ...n, sent: true } : n
      ))
      setUnreadCount(prev => Math.max(0, prev - 1))
    } catch (err) {
      console.error('Error marking notification as read:', err)
    }
  }

  const getChannelIcon = (channel: string) => {
    switch (channel) {
      case 'whatsapp':
        return <MessageCircle className="h-4 w-4 text-green-600" />
      case 'email':
        return <Mail className="h-4 w-4 text-blue-600" />
      case 'sms':
        return <AlertCircle className="h-4 w-4 text-orange-600" />
      default:
        return <Bell className="h-4 w-4 text-gray-600" />
    }
  }

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
            You'll receive updates about your property listings here
          </p>
        </div>
      </div>
    )
  }

  return (
    <div className="bg-white rounded-2xl shadow-lg border border-gray-200 overflow-hidden">
      <div className="bg-gradient-to-r from-primary-600 to-primary-700 p-6">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="bg-white/20 backdrop-blur-sm rounded-full p-2">
              <Bell className="h-6 w-6 text-white" />
            </div>
            <div>
              <h2 className="text-xl font-bold text-white">Notifications</h2>
              <p className="text-primary-100 text-sm">Stay updated on your listings</p>
            </div>
          </div>
          {unreadCount > 0 && (
            <div className="bg-white text-primary-600 rounded-full px-3 py-1 text-sm font-bold">
              {unreadCount} new
            </div>
          )}
        </div>
      </div>

      <div className="divide-y divide-gray-100">
        {notifications.map((notification) => (
          <div
            key={notification.id}
            className={`p-4 hover:bg-gray-50 transition-colors ${
              !notification.sent ? 'bg-blue-50/30' : ''
            }`}
          >
            <div className="flex items-start gap-3">
              <div className="flex-shrink-0 mt-1">
                {getChannelIcon(notification.channel)}
              </div>
              <div className="flex-1 min-w-0">
                <p className={`text-sm ${!notification.sent ? 'font-semibold text-gray-900' : 'text-gray-700'}`}>
                  {notification.message}
                </p>
                <div className="flex items-center gap-3 mt-2">
                  <span className="text-xs text-gray-500">
                    {formatTimestamp(notification.created_at)}
                  </span>
                  <span className="text-xs px-2 py-0.5 bg-gray-100 text-gray-600 rounded capitalize">
                    {notification.channel}
                  </span>
                  {!notification.sent && (
                    <button
                      onClick={() => markAsRead(notification.id)}
                      className="text-xs text-primary-600 hover:text-primary-700 font-medium"
                    >
                      Mark as read
                    </button>
                  )}
                </div>
              </div>
              <div className="flex-shrink-0">
                {notification.sent ? (
                  <CheckCircle className="h-5 w-5 text-green-500" />
                ) : (
                  <div className="h-2 w-2 bg-blue-500 rounded-full animate-pulse"></div>
                )}
              </div>
            </div>
          </div>
        ))}
      </div>

      {notifications.length >= 10 && (
        <div className="p-4 bg-gray-50 text-center">
          <p className="text-xs text-gray-500">Showing latest 10 notifications</p>
        </div>
      )}
    </div>
  )
}
