import { Navigate, useLocation } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { useState, useEffect, useRef } from 'react'

interface AuthGuardProps {
  children: React.ReactNode
}

export function AuthGuard({ children }: AuthGuardProps) {
  const { user, loading } = useAuth()
  const location = useLocation()
  const [initialCheckDone, setInitialCheckDone] = useState(!loading)
  const wasAuthenticated = useRef(false)

  useEffect(() => {
    if (!loading) {
      setInitialCheckDone(true)
      if (user) {
        wasAuthenticated.current = true
      }
    }
  }, [loading, user])

  if (!initialCheckDone) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="animate-spin rounded-full h-8 w-8 border-4 border-primary-600 border-r-transparent" />
      </div>
    )
  }

  if (!user && !wasAuthenticated.current) {
    return <Navigate to={`/login?redirect=${encodeURIComponent(location.pathname)}`} replace />
  }

  if (!user && wasAuthenticated.current) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="animate-spin rounded-full h-8 w-8 border-4 border-primary-600 border-r-transparent" />
      </div>
    )
  }

  return <>{children}</>
}
