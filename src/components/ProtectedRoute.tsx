import { Navigate, useLocation } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { ReactNode } from 'react'

interface ProtectedRouteProps {
  children: ReactNode
  allowedRoles?: ('super_admin' | 'property_admin' | 'partner_admin' | 'partner' | 'user' | 'buyer' | 'owner' | 'agent' | 'admin')[]
  requirePartnerApproved?: boolean
}

export function ProtectedRoute({ 
  children, 
  allowedRoles,
  requirePartnerApproved = false
}: ProtectedRouteProps) {
  const { user, profile, loading } = useAuth()
  const location = useLocation()

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="w-12 h-12 border-4 border-primary-600 border-t-transparent rounded-full animate-spin"></div>
      </div>
    )
  }

  // Not logged in
  if (!user || !profile) {
    return <Navigate to="/login" state={{ from: location }} replace />
  }

  // If specific roles are required
  if (allowedRoles && allowedRoles.length > 0) {
    const hasRole = allowedRoles.includes(profile.role)
    // Always let super_admin or legacy admin access everything protected
    const isSuper = profile.role === 'super_admin' || profile.role === 'admin'
    
    if (!hasRole && !isSuper) {
      // User is logged in but doesn't have the right role -> send home
      return <Navigate to="/" replace />
    }
  }

  // If specifically gating for approved partners
  if (requirePartnerApproved) {
    const isPartnerApproved = profile.is_partner && profile.partner_status === 'approved'
    const isSuper = profile.role === 'super_admin' || profile.role === 'admin'
    
    if (!isPartnerApproved && !isSuper) {
      return <Navigate to="/partner/apply" replace />
    }
  }

  return <>{children}</>
}
