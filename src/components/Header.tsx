import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { Heart, LogOut, Menu, X, Shield, MessageCircle, Building2, Bell } from 'lucide-react'
import { useAuth } from '../contexts/AuthContext'
import { UsernameModal } from './UsernameModal'
import { trackEvent } from '../lib/analytics'
import { openWhatsApp } from '../lib/whatsapp'
import { useNotifications } from '../hooks/useNotifications'

export function Header() {
  const navigate = useNavigate()
  const { user, profile, loading, isAdmin, signOut } = useAuth()
  const { unreadCount } = useNotifications()
  const [showUsernameModal, setShowUsernameModal] = useState(false)
  const [showMenu, setShowMenu] = useState(false)

  useEffect(() => {
    if (user && profile && !loading && !profile.username) {
      const hasSeenUsernameModal = sessionStorage.getItem('hasSeenUsernameModal')
      if (!hasSeenUsernameModal) {
        setShowUsernameModal(true)
        sessionStorage.setItem('hasSeenUsernameModal', 'true')
      }
    }
  }, [user, profile, loading])

  const handleSignOut = async () => {
    try {
      sessionStorage.removeItem('hasSeenUsernameModal')
      await signOut()
    } catch (error) {
    }
  }

  const handlePostPropertyClick = () => {
    trackEvent({
      event: 'post_property_click',
      category: 'CTA',
    })
    if (user) {
      navigate('/add-property')
    } else {
      navigate('/login?redirect=/add-property')
    }
    setShowMenu(false)
  }

  const handleLoginClick = () => {
    navigate('/login')
    setShowMenu(false)
  }

  return (
    <>
      <header className="bg-primary-600 sticky top-0 z-40 shadow-lg">
        <div className="max-w-7xl mx-auto px-3 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-14 md:h-18">
            <a href="/" className="flex items-center gap-2 py-2 flex-shrink-0">
              <button
                onClick={(e) => {
                  e.preventDefault()
                  setShowMenu(!showMenu)
                }}
                className="md:hidden text-white text-xl p-0 min-h-0 min-w-0"
                aria-label="Toggle menu"
              >
                {showMenu ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
              </button>
              <img
                src="../dist/assets/vizag-property-logo.png"
                alt="Vizag Property - Gateway to Coastal Living"
                className="hidden md:block h-10 md:h-14 w-auto"
              />
            </a>

            <nav className="hidden md:flex items-center space-x-3 md:space-x-4 lg:space-x-6 overflow-x-auto scrollbar-hide flex-1 mx-2 md:mx-4">
              <a href="/" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                Home
              </a>
              <a href="/properties" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                For Buyers
              </a>
              <a href="/recommendations" className="text-white hover:text-primary-100 transition-colors font-medium flex items-center space-x-1 text-sm lg:text-base whitespace-nowrap">
                <span>Insights</span>
                <span className="ml-1 px-1.5 py-0.5 text-[10px] font-bold bg-accent-500 text-white rounded">NEW</span>
              </a>
              <a href="/blog" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                Blog
              </a>
              <a href="/vizag" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                About
              </a>
              <button
                onClick={() => openWhatsApp('Hi, I want to list my property in Vizag listed on VizagProperty. Please share more details.')}
                className="bg-green-600 text-white px-3 lg:px-4 py-2 md:py-2.5 rounded-full hover:bg-green-700 transition-all font-semibold shadow-sm text-xs md:text-sm lg:text-base whitespace-nowrap flex items-center gap-1.5"
              >
                <MessageCircle className="h-3.5 w-3.5 lg:h-4 lg:w-4" />
                <span>List Property</span>
              </button>
              {!user && (
                <button
                  onClick={handleLoginClick}
                  className="bg-gradient-to-r from-[#16a34a] to-[#22c55e] text-white px-4 md:px-6 py-2 md:py-2.5 rounded-full hover:shadow-lg transition-all font-semibold shadow-sm text-xs md:text-sm lg:text-base whitespace-nowrap"
                >
                  Login / Sign up
                </button>
              )}
            </nav>

            <div className="flex items-center gap-2 md:gap-3 flex-shrink-0">
              {user ? (
                <>
                  <a
                    href="/add-property"
                    className="hidden sm:flex bg-gradient-to-r from-[#f6b300] to-[#f39c12] text-[#0d1b3d] px-4 md:px-7 py-2 md:py-2.5 rounded-full hover:shadow-lg transition-all font-semibold shadow-sm text-xs md:text-sm lg:text-base whitespace-nowrap items-center"
                  >
                    Post Property — Free
                  </a>
                  <a
                    href="https://wa.me/917207550499"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="md:hidden relative"
                  >
                    <div className="w-10 h-10 bg-green-500 rounded-full flex items-center justify-center hover:bg-green-600 transition-all shadow">
                      <MessageCircle className="h-5 w-5 text-white" />
                    </div>
                    <span className="absolute -top-2 -right-2 text-yellow-300 text-xs animate-bounce">
                      &#x1F446;
                    </span>
                  </a>
                  {isAdmin && (
                    <a href="/admin/dashboard" className="hidden md:flex w-10 h-10 rounded-full border-2 border-white/30 bg-primary-500/30 items-center justify-center text-white hover:bg-primary-500/50 transition-colors">
                      <Shield className="h-5 w-5" />
                    </a>
                  )}
                  {profile?.role === 'owner' && (
                    <a href="/my-listings" className="hidden md:flex w-10 h-10 rounded-full border-2 border-white/30 bg-primary-500/30 items-center justify-center text-white hover:bg-primary-500/50 transition-colors">
                      <Building2 className="h-5 w-5" />
                    </a>
                  )}
                  <a href="/dashboard" className="hidden md:flex w-10 h-10 rounded-full border-2 border-white/30 bg-primary-500/30 items-center justify-center text-white hover:bg-primary-500/50 transition-colors relative">
                    <Bell className="h-5 w-5" />
                    {unreadCount > 0 && (
                      <span className="absolute -top-1 -right-1 bg-red-500 text-white text-xs font-bold rounded-full h-5 w-5 flex items-center justify-center">
                        {unreadCount > 9 ? '9+' : unreadCount}
                      </span>
                    )}
                  </a>
                  <a href="/favorites" className="hidden md:flex w-10 h-10 rounded-full border-2 border-white/30 bg-primary-500/30 items-center justify-center text-white hover:bg-primary-500/50 transition-colors">
                    <Heart className="h-5 w-5" />
                  </a>
                  <button
                    onClick={handleSignOut}
                    className="hidden md:flex text-white hover:text-red-300 transition-colors items-center space-x-2 font-medium"
                  >
                    <LogOut className="h-4 w-4" />
                    <span>Sign Out</span>
                  </button>
                </>
              ) : (
                <>
                  <button
                    onClick={handlePostPropertyClick}
                    className="hidden sm:flex bg-gradient-to-r from-[#f6b300] to-[#f39c12] text-[#0d1b3d] px-4 md:px-7 py-2 md:py-2.5 rounded-full hover:shadow-lg transition-all font-semibold shadow-sm text-xs md:text-sm lg:text-base whitespace-nowrap items-center"
                  >
                    Post Property — Free
                  </button>
                  <button
                    onClick={handleLoginClick}
                    className="md:hidden bg-green-500 text-white text-xs font-semibold px-3 py-2 rounded-md whitespace-nowrap hover:bg-green-600 transition-colors"
                  >
                    Login / Sign up
                  </button>
                  <a
                    href="https://wa.me/917207550499"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="md:hidden relative"
                  >
                    <div className="w-10 h-10 bg-green-500 rounded-full flex items-center justify-center hover:bg-green-600 transition-all shadow">
                      <MessageCircle className="h-5 w-5 text-white" />
                    </div>
                    <span className="absolute -top-2 -right-2 text-yellow-300 text-xs animate-bounce">
                      &#x1F446;
                    </span>
                  </a>
                </>
              )}
            </div>
          </div>
        </div>

        <div className="hidden md:block bg-primary-400 border-t border-primary-500">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div className="flex items-center space-x-6 py-3 overflow-x-auto scrollbar-hide">
              <a
                href="/vmrda-approved-plots-vizag"
                className="text-sm text-white hover:text-primary-800 whitespace-nowrap transition-colors"
                aria-label="VMRDA Approved Plots in Vizag"
                title="VMRDA Approved Plots in Vizag"
              >
                VMRDA Approved Plots in Vizag
              </a>
              <a
                href="/residential-property-in-vizag"
                className="text-sm text-white hover:text-primary-800 whitespace-nowrap transition-colors"
                aria-label="Residential Property in Vizag"
                title="Residential Property in Vizag"
              >
                Residential Property in Vizag
              </a>
              <a
                href="/flats-for-sale-in-vizag"
                className="text-sm text-white hover:text-primary-800 whitespace-nowrap transition-colors"
                aria-label="Flats for Sale in Vizag"
                title="Flats for Sale in Vizag"
              >
                Flats for Sale in Vizag
              </a>
              <a
                href="/villas-in-vizag"
                className="text-sm text-white hover:text-primary-800 whitespace-nowrap transition-colors"
                aria-label="Villas in Vizag"
                title="Villas in Vizag"
              >
                Villas in Vizag
              </a>
              <a
                href="/flats-for-rent-vizag"
                className="text-sm text-white hover:text-primary-800 whitespace-nowrap transition-colors"
                aria-label="Flats for Rent in Vizag"
                title="Flats for Rent in Vizag"
              >
                Flats for Rent in Vizag
              </a>
              <a
                href="/pg-hostels-in-vizag"
                className="text-sm text-white hover:text-primary-800 whitespace-nowrap transition-colors"
                aria-label="PG & Hostels in Vizag"
                title="PG & Hostels in Vizag"
              >
                PG & Hostels in Vizag
              </a>
            </div>
          </div>
        </div>

        {showMenu && (
          <div className="md:hidden border-t border-primary-500 bg-primary-700">
            <nav className="flex flex-col px-4 py-2">
              <a href="/" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center" onClick={() => setShowMenu(false)}>
                Home
              </a>
              <a href="/properties" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center" onClick={() => setShowMenu(false)}>
                For Buyers
              </a>
              <a href="/recommendations" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center space-x-2" onClick={() => setShowMenu(false)}>
                <span>Insights</span>
                <span className="ml-1 px-1.5 py-0.5 text-[10px] font-bold bg-accent-500 text-white rounded">NEW</span>
              </a>
              <a href="/blog" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center" onClick={() => setShowMenu(false)}>
                Blog
              </a>
              <a href="/vizag" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center" onClick={() => setShowMenu(false)}>
                About
              </a>
              <button
                onClick={() => {
                  openWhatsApp('Hi, I want to list my property in Vizag listed on VizagProperty. Please share more details.')
                  setShowMenu(false)
                }}
                className="bg-green-600 text-white px-4 py-2.5 rounded-full hover:bg-green-700 transition-all font-semibold shadow-sm my-2 flex items-center gap-2"
              >
                <MessageCircle className="h-5 w-5" />
                <span>Post Property via WhatsApp</span>
              </button>

              {!user && (
                <button
                  onClick={handleLoginClick}
                  className="bg-gradient-to-r from-[#16a34a] to-[#22c55e] text-white px-4 py-2.5 rounded-full hover:shadow-lg transition-all font-semibold shadow-sm my-2"
                >
                  Login / Sign up
                </button>
              )}


              {user && (
                <>
                  {isAdmin && (
                    <a href="/admin/dashboard" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center space-x-2 border-t border-primary-500 mt-2" onClick={() => setShowMenu(false)}>
                      <Shield className="h-5 w-5" />
                      <span>Admin Dashboard</span>
                    </a>
                  )}
                  {profile?.role === 'owner' && (
                    <a href="/my-listings" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center space-x-2 border-t border-primary-500 mt-2" onClick={() => setShowMenu(false)}>
                      <Building2 className="h-5 w-5" />
                      <span>My Listings</span>
                    </a>
                  )}
                  <a href="/dashboard" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center justify-between border-t border-primary-500 mt-2" onClick={() => setShowMenu(false)}>
                    <div className="flex items-center space-x-2">
                      <Bell className="h-5 w-5" />
                      <span>Notifications</span>
                    </div>
                    {unreadCount > 0 && (
                      <span className="bg-red-500 text-white text-xs font-bold rounded-full px-2 py-0.5">
                        {unreadCount > 9 ? '9+' : unreadCount}
                      </span>
                    )}
                  </a>
                  <a href="/favorites" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center space-x-2" onClick={() => setShowMenu(false)}>
                    <Heart className="h-5 w-5" />
                    <span>Favorites</span>
                  </a>
                  <button
                    onClick={handleSignOut}
                    className="text-red-300 hover:text-red-200 py-3 min-h-[44px] flex items-center space-x-2 text-left w-full"
                  >
                    <LogOut className="h-5 w-5" />
                    <span>Sign Out</span>
                  </button>
                </>
              )}
            </nav>
          </div>
        )}
      </header>

      {showUsernameModal && (
        <UsernameModal
          onClose={() => setShowUsernameModal(false)}
        />
      )}
    </>
  )
}
