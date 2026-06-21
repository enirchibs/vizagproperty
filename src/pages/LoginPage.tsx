import { useEffect, useState } from 'react'
import { useNavigate, useLocation } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { AuthModal } from '../components/AuthModal'

export function LoginPage() {
  const navigate = useNavigate()
  const location = useLocation()
  const { user, loading } = useAuth()
  const [showModal, setShowModal] = useState(true)

  const redirectParam = new URLSearchParams(location.search).get('redirect') || '/'

  useEffect(() => {
    if (user && !loading) {
      navigate(redirectParam, { replace: true })
    }
  }, [user, loading, navigate, redirectParam])

  const handleClose = () => {
    setShowModal(false)
    navigate('/')
  }

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-black/40">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600" />
      </div>
    )
  }

  if (!showModal) {
    return null
  }

  return (
    <div className="min-h-screen bg-gray-50 flex items-center justify-center">
      <AuthModal
        onClose={handleClose}
        redirectTo={redirectParam}
      />
    </div>
  )
}
