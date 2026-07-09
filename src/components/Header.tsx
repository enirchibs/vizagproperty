import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { Heart, LogOut, Menu, X, Shield, MessageCircle, Building2, Bell, Briefcase } from 'lucide-react'
import { useAuth } from '../contexts/AuthContext'
import { UsernameModal } from './UsernameModal'
import { trackEvent } from '../lib/analytics'
import { openWhatsApp } from '../lib/whatsapp'
import { useNotifications } from '../hooks/useNotifications'

export function Header() {
  const navigate = useNavigate()
  const { user, profile, loading, isSuperAdmin, isPropertyAdmin, isPartnerAdmin, isPartner, signOut } = useAuth()
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

  useEffect(() => {
    document.body.classList.toggle('mobile-nav-open', showMenu)

    return () => {
      document.body.classList.remove('mobile-nav-open')
    }
  }, [showMenu])

  useEffect(() => {
    const closeMenuOnDesktop = () => {
      if (window.innerWidth >= 768) {
        setShowMenu(false)
      }
    }

    window.addEventListener('resize', closeMenuOnDesktop)
    return () => window.removeEventListener('resize', closeMenuOnDesktop)
  }, [])

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
      <header className="bg-primary-600 sticky top-0 z-50 shadow-lg">
        <div className="max-w-7xl mx-auto px-3 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-14 md:h-18">
            <a href="/" className="flex items-center gap-2 py-1 flex-shrink min-w-0">
              <button
                onClick={(e) => {
                  e.preventDefault()
                  setShowMenu(!showMenu)
                }}
                className="md:hidden inline-flex h-10 w-10 flex-none items-center justify-center rounded-lg text-white hover:bg-white/10 focus:outline-none focus:ring-2 focus:ring-white/50"
                aria-label={showMenu ? 'Close menu' : 'Open menu'}
                aria-expanded={showMenu}
              >
                {showMenu ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
              </button>
              <div className="flex items-center gap-3 select-none bg-blue-900 px-4 py-2 rounded-xl shadow-[0_4px_15px_rgba(30,58,138,0.4)] border border-blue-800">
                <div className="bg-white p-2 rounded-xl text-blue-900 shadow-md">
                  <Building2 className="h-6 w-6 md:h-8 md:w-8" />
                </div>
                <div className="flex flex-col">
                  <span className="text-xl md:text-3xl font-black tracking-tight text-white leading-none drop-shadow-sm">
                    VizagProperty
                  </span>
                  <span className="text-[10px] md:text-sm text-white font-medium tracking-wide">
                    Gateway to Coastal Living
                  </span>
                </div>
              </div>
            </a>

            <nav className="hidden md:flex items-center space-x-3 md:space-x-4 lg:space-x-6 overflow-x-auto scrollbar-hide flex-1 mx-2 md:mx-4">
              <a href="/" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                Home
              </a>
              <a href="/properties?q=buy" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                Buy
              </a>
              <a href="/properties?q=rent" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                Rent
              </a>
              <a href="/properties?q=commercial" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                Commercial
              </a>
              <a href="/blog" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                VizagInformation
              </a>
              <a href="/about" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                About Us
              </a>
              <a href="/builders" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                Top Builders
              </a>
              <a href="/news" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                Daily News
              </a>
              <a href="/home-loans" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                Home Loans
              </a>
              <a href="/contact" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                Contact Us
              </a>
              
              {/* Social Links */}
              <div className="hidden lg:flex items-center gap-3 ml-2 pl-4 border-l border-white/20">
                <a href="https://facebook.com" target="_blank" rel="noopener noreferrer" className="text-white/80 hover:text-white transition-transform hover:scale-110" title="Follow us on Facebook">
                  <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.469h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.469h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
                </a>
                <a href="https://instagram.com" target="_blank" rel="noopener noreferrer" className="text-white/80 hover:text-white transition-transform hover:scale-110" title="Follow us on Instagram">
                  <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.052.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98C8.333 23.986 8.741 24 12 24c3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z"/></svg>
                </a>
                <a href="https://twitter.com" target="_blank" rel="noopener noreferrer" className="text-white/80 hover:text-white transition-transform hover:scale-110" title="Follow us on X">
                  <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 24 24"><path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/></svg>
                </a>
              </div>

              <button
                onClick={() => openWhatsApp('Hi, I want to list my property in Vizag listed on VizagProperty. Please share more details.')}
                className="bg-green-600 text-white px-3 lg:px-4 py-2 md:py-2.5 rounded-full hover:bg-green-700 transition-all font-semibold shadow-sm text-xs md:text-sm lg:text-base whitespace-nowrap flex items-center gap-1.5 ml-2"
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

            <div className="flex items-center gap-1.5 md:gap-3 flex-shrink-0">
              {user ? (
                <>
                  <a
                    href="/add-property"
                    className="flex bg-yellow-400 text-red-600 px-3 md:px-7 py-1.5 md:py-2.5 rounded-full hover:bg-yellow-500 hover:shadow-lg transition-all font-bold shadow-sm text-sm md:text-lg whitespace-nowrap items-center animate-heartbeat"
                  >
                    Post Free Property Ad
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
                  {isSuperAdmin && (
                    <a href="/admin/dashboard" className="hidden md:flex w-10 h-10 rounded-full border-2 border-white/30 bg-primary-500/30 items-center justify-center text-white hover:bg-primary-500/50 transition-colors" title="Super Admin Dashboard">
                      <Shield className="h-5 w-5" />
                    </a>
                  )}
                  {isPropertyAdmin && !isSuperAdmin && (
                    <a href="/property-admin" className="hidden md:flex w-10 h-10 rounded-full border-2 border-white/30 bg-primary-500/30 items-center justify-center text-white hover:bg-primary-500/50 transition-colors" title="Property Admin">
                      <Building2 className="h-5 w-5" />
                    </a>
                  )}
                  {isPartnerAdmin && !isSuperAdmin && (
                    <a href="/partner-admin" className="hidden md:flex w-10 h-10 rounded-full border-2 border-white/30 bg-primary-500/30 items-center justify-center text-white hover:bg-primary-500/50 transition-colors" title="Partner Admin">
                      <Briefcase className="h-5 w-5" />
                    </a>
                  )}
                  {profile?.role === 'owner' && (
                    <a href="/my-listings" className="hidden md:flex w-10 h-10 rounded-full border-2 border-white/30 bg-primary-500/30 items-center justify-center text-white hover:bg-primary-500/50 transition-colors">
                      <Building2 className="h-5 w-5" />
                    </a>
                  )}
                  {isPartner && (
                    <a href="/partner/dashboard" className="hidden md:flex w-10 h-10 rounded-full border-2 border-green-400 bg-green-500/30 items-center justify-center text-green-400 hover:bg-green-500/50 transition-colors" title="Partner Dashboard">
                      <Briefcase className="h-5 w-5" />
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
                    className="flex bg-yellow-400 text-red-600 px-3 md:px-7 py-1.5 md:py-2.5 rounded-full hover:bg-yellow-500 hover:shadow-lg transition-all font-bold shadow-sm text-sm md:text-lg whitespace-nowrap items-center animate-heartbeat"
                  >
                    Post Free Property Ad
                  </button>
                  <button
                    onClick={handleLoginClick}
                    className="md:hidden inline-flex h-10 min-w-0 items-center justify-center rounded-lg bg-green-500 px-2.5 text-xs font-semibold text-white whitespace-nowrap transition-colors hover:bg-green-600"
                  >
                    Login
                  </button>
                  <a
                    href="https://wa.me/917207550499"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="md:hidden relative flex h-10 w-10 flex-none items-center justify-center"
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
          <div className="md:hidden fixed inset-x-0 top-14 z-50 max-h-[calc(100dvh-3.5rem)] overflow-y-auto overscroll-contain border-t border-primary-500 bg-primary-700 shadow-2xl">
            <nav className="flex flex-col px-4 py-3">
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
                VizagInformation
              </a>
              <a href="/vizag" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center" onClick={() => setShowMenu(false)}>
                About
              </a>
              <button
                onClick={() => {
                  openWhatsApp('Hi, I want to list my property in Vizag listed on VizagProperty. Please share more details.')
                  setShowMenu(false)
                }}
                className="bg-green-600 text-white px-4 py-2.5 rounded-lg hover:bg-green-700 transition-all font-semibold shadow-sm my-2 flex items-center justify-center gap-2"
              >
                <MessageCircle className="h-5 w-5" />
                <span>Post Property via WhatsApp</span>
              </button>

              {!user && (
                <button
                  onClick={handleLoginClick}
                  className="bg-gradient-to-r from-[#16a34a] to-[#22c55e] text-white px-4 py-2.5 rounded-lg hover:shadow-lg transition-all font-semibold shadow-sm my-2"
                >
                  Login / Sign up
                </button>
              )}


              {user && (
                <>
                  {isSuperAdmin && (
                    <a href="/admin/dashboard" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center space-x-2 border-t border-primary-500 mt-2" onClick={() => setShowMenu(false)}>
                      <Shield className="h-5 w-5" />
                      <span>Super Admin</span>
                    </a>
                  )}
                  {isPropertyAdmin && !isSuperAdmin && (
                    <a href="/property-admin" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center space-x-2 border-t border-primary-500 mt-2" onClick={() => setShowMenu(false)}>
                      <Building2 className="h-5 w-5" />
                      <span>Property Admin</span>
                    </a>
                  )}
                  {isPartnerAdmin && !isSuperAdmin && (
                    <a href="/partner-admin" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center space-x-2 border-t border-primary-500 mt-2" onClick={() => setShowMenu(false)}>
                      <Briefcase className="h-5 w-5" />
                      <span>Partner Admin</span>
                    </a>
                  )}
                  {profile?.role === 'owner' && (
                    <a href="/my-listings" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center space-x-2 border-t border-primary-500 mt-2" onClick={() => setShowMenu(false)}>
                      <Building2 className="h-5 w-5" />
                      <span>My Listings</span>
                    </a>
                  )}
                  {isPartner && (
                    <a href="/partner/dashboard" className="text-green-400 hover:text-green-300 py-3 min-h-[44px] flex items-center space-x-2 border-t border-primary-500 mt-2" onClick={() => setShowMenu(false)}>
                      <Briefcase className="h-5 w-5" />
                      <span>Partner Dashboard</span>
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
