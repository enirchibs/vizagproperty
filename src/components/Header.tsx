import { useState, useEffect } from 'react'
import { Heart, LogOut, Menu, X, Shield, Plus, MessageCircle, Building2 } from 'lucide-react'
import { useAuth } from '../contexts/AuthContext'
import { AuthModal } from './AuthModal'
import { UsernameModal } from './UsernameModal'
import { trackEvent } from '../lib/analytics'

export function Header() {
  const { user, profile, loading, signOut } = useAuth()
  const [showAuthModal, setShowAuthModal] = useState(false)
  const [showUsernameModal, setShowUsernameModal] = useState(false)
  const [authModalProps, setAuthModalProps] = useState<{ intentRole?: 'buyer' | 'owner'; redirectTo?: string }>({})
  const [showMenu, setShowMenu] = useState(false)
  const [showTooltip, setShowTooltip] = useState(false)

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
      // Small delay to ensure session is fully cleared
      await new Promise(resolve => setTimeout(resolve, 100))
      window.location.href = '/'
    } catch (error) {
      console.error('Sign out error:', error)
    }
  }

  const handlePostPropertyClick = () => {
    trackEvent({
      event: 'post_property_click',
      category: 'CTA',
    })
    if (user) {
      window.location.href = '/add-property'
    } else {
      setAuthModalProps({ intentRole: 'owner', redirectTo: '/add-property' })
      setShowAuthModal(true)
      setShowMenu(false)
    }
  }

  return (
    <>
      <header className="bg-primary-600 sticky top-0 z-40 shadow-lg">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-16 md:h-18">
            <a href="/" className="flex items-center py-2 flex-shrink-0">
              <img
                src="/assets/logo/vizag-property-logo.png"
                alt="Vizag Property Experts logo"
                className="h-8 md:h-10 w-auto"
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
              <a href="/vizag" className="text-white hover:text-primary-100 transition-colors font-medium text-sm lg:text-base whitespace-nowrap">
                About
              </a>
              <a
                href="https://wa.me/917207550499?text=Hi%20Vizag%20Property%20Experts%2C%20I%20want%20to%20list%20my%20property%20in%20Vizag.%20Please%20guide%20me."
                target="_blank"
                rel="noopener noreferrer"
                className="bg-green-600 text-white px-3 lg:px-4 py-2 md:py-2.5 rounded-full hover:bg-green-700 transition-all font-semibold shadow-sm text-xs md:text-sm lg:text-base whitespace-nowrap flex items-center gap-1.5"
              >
                <MessageCircle className="h-3.5 w-3.5 lg:h-4 lg:w-4" />
                <span>List Property</span>
              </a>
              {!user && (
                <button
                  onClick={() => setShowAuthModal(true)}
                  className="bg-gradient-to-r from-[#16a34a] to-[#22c55e] text-white px-4 md:px-6 py-2 md:py-2.5 rounded-full hover:shadow-lg transition-all font-semibold shadow-sm text-xs md:text-sm lg:text-base whitespace-nowrap"
                >
                  Login / Sign up
                </button>
              )}
            </nav>

            <div className="flex items-center space-x-2 md:space-x-3 flex-shrink-0">
              {user ? (
                <>
                  <a
                    href="/add-property"
                    className="hidden sm:flex bg-gradient-to-r from-[#f6b300] to-[#f39c12] text-[#0d1b3d] px-4 md:px-7 py-2 md:py-2.5 rounded-full hover:shadow-lg transition-all font-semibold shadow-sm text-xs md:text-sm lg:text-base whitespace-nowrap items-center"
                  >
                    Post Property — Free
                  </a>
                  <div className="relative sm:hidden">
                    <a
                      href="/add-property"
                      className="w-10 h-10 bg-gradient-to-r from-[#f6b300] to-[#f39c12] text-[#0d1b3d] rounded-full hover:shadow-lg transition-all shadow-sm flex items-center justify-center"
                      onMouseEnter={() => setShowTooltip(true)}
                      onMouseLeave={() => setShowTooltip(false)}
                      onTouchStart={() => setShowTooltip(true)}
                      onTouchEnd={() => setTimeout(() => setShowTooltip(false), 2000)}
                      aria-label="Post Property Free"
                    >
                      <Plus className="h-5 w-5" strokeWidth={3} />
                    </a>
                    {showTooltip && (
                      <div className="absolute top-full left-1/2 -translate-x-1/2 mt-2 px-3 py-1.5 bg-gray-900 text-white text-xs rounded-lg whitespace-nowrap shadow-lg z-50">
                        Post Property Free
                        <div className="absolute -top-1 left-1/2 -translate-x-1/2 w-2 h-2 bg-gray-900 rotate-45"></div>
                      </div>
                    )}
                  </div>
                  {profile?.role === 'admin' && (
                    <a href="/admin/properties" className="hidden md:flex w-10 h-10 rounded-full border-2 border-white/30 bg-primary-500/30 items-center justify-center text-white hover:bg-primary-500/50 transition-colors">
                      <Shield className="h-5 w-5" />
                    </a>
                  )}
                  {profile?.role === 'owner' && (
                    <a href="/my-listings" className="hidden md:flex w-10 h-10 rounded-full border-2 border-white/30 bg-primary-500/30 items-center justify-center text-white hover:bg-primary-500/50 transition-colors">
                      <Building2 className="h-5 w-5" />
                    </a>
                  )}
                  <a href="/favorites" className="hidden md:flex w-10 h-10 rounded-full border-2 border-white/30 bg-primary-500/30 items-center justify-center text-white hover:bg-primary-500/50 transition-colors">
                    <Heart className="h-5 w-5" />
                  </a>
                  <a href="/dashboard" className="hidden md:flex w-10 h-10 rounded-full border-2 border-white/30 bg-primary-500/30 items-center justify-center text-white hover:bg-primary-500/50 transition-colors">
                    <Shield className="h-5 w-5" />
                  </a>
                  <button
                    onClick={handleSignOut}
                    className="hidden md:flex text-white hover:text-red-300 transition-colors items-center space-x-2 font-medium"
                  >
                    <LogOut className="h-4 w-4" />
                    <span>Sign Out</span>
                  </button>
                  <button
                    onClick={() => setShowMenu(!showMenu)}
                    className="md:hidden text-white p-2 min-h-[44px] min-w-[44px] flex items-center justify-center"
                    aria-label={showMenu ? "Close menu" : "Open menu"}
                  >
                    {showMenu ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
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
                  <div className="relative sm:hidden">
                    <button
                      onClick={handlePostPropertyClick}
                      className="w-10 h-10 bg-gradient-to-r from-[#f6b300] to-[#f39c12] text-[#0d1b3d] rounded-full hover:shadow-lg transition-all shadow-sm flex items-center justify-center"
                      onMouseEnter={() => setShowTooltip(true)}
                      onMouseLeave={() => setShowTooltip(false)}
                      onTouchStart={() => setShowTooltip(true)}
                      onTouchEnd={() => setTimeout(() => setShowTooltip(false), 2000)}
                      aria-label="Post Property Free"
                    >
                      <Plus className="h-5 w-5" strokeWidth={3} />
                    </button>
                    {showTooltip && (
                      <div className="absolute top-full left-1/2 -translate-x-1/2 mt-2 px-3 py-1.5 bg-gray-900 text-white text-xs rounded-lg whitespace-nowrap shadow-lg z-50">
                        Post Property Free
                        <div className="absolute -top-1 left-1/2 -translate-x-1/2 w-2 h-2 bg-gray-900 rotate-45"></div>
                      </div>
                    )}
                  </div>
                  <button
                    onClick={() => setShowMenu(!showMenu)}
                    className="md:hidden text-white p-2 min-h-[44px] min-w-[44px] flex items-center justify-center"
                    aria-label={showMenu ? "Close menu" : "Open menu"}
                  >
                    {showMenu ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
                  </button>
                </>
              )}
            </div>
          </div>
        </div>

        <div className="bg-primary-700 border-t border-primary-500">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div className="flex items-center space-x-6 py-3 overflow-x-auto scrollbar-hide">
              <a
                href="/vmrda-approved-plots-vizag"
                className="text-sm text-white hover:text-primary-100 whitespace-nowrap transition-colors"
                aria-label="VMRDA Approved Plots in Vizag"
                title="VMRDA Approved Plots in Vizag"
              >
                VMRDA Approved Plots in Vizag
              </a>
              <a
                href="/residential-property-in-vizag"
                className="text-sm text-white hover:text-primary-100 whitespace-nowrap transition-colors"
                aria-label="Residential Property in Vizag"
                title="Residential Property in Vizag"
              >
                Residential Property in Vizag
              </a>
              <a
                href="/flats-for-sale-in-vizag"
                className="text-sm text-white hover:text-primary-100 whitespace-nowrap transition-colors"
                aria-label="Flats for Sale in Vizag"
                title="Flats for Sale in Vizag"
              >
                Flats for Sale in Vizag
              </a>
              <a
                href="/villas-in-vizag"
                className="text-sm text-white hover:text-primary-100 whitespace-nowrap transition-colors"
                aria-label="Villas in Vizag"
                title="Villas in Vizag"
              >
                Villas in Vizag
              </a>
              <a
                href="/flats-for-rent-vizag"
                className="text-sm text-white hover:text-primary-100 whitespace-nowrap transition-colors"
                aria-label="Flats for Rent in Vizag"
                title="Flats for Rent in Vizag"
              >
                Flats for Rent in Vizag
              </a>
              <a
                href="/pg-hostels-in-vizag"
                className="text-sm text-white hover:text-primary-100 whitespace-nowrap transition-colors"
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
              <a href="/vizag" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center" onClick={() => setShowMenu(false)}>
                About
              </a>
              <a
                href="https://wa.me/917207550499?text=Hi%20Vizag%20Property%20Experts%2C%20I%20want%20to%20list%20my%20property%20in%20Vizag.%20Please%20guide%20me."
                target="_blank"
                rel="noopener noreferrer"
                className="bg-green-600 text-white px-4 py-2.5 rounded-full hover:bg-green-700 transition-all font-semibold shadow-sm my-2 flex items-center gap-2"
                onClick={() => setShowMenu(false)}
              >
                <MessageCircle className="h-5 w-5" />
                <span>Post Property via WhatsApp</span>
              </a>

              {!user && (
                <button
                  onClick={() => {
                    setShowAuthModal(true)
                    setShowMenu(false)
                  }}
                  className="bg-gradient-to-r from-[#16a34a] to-[#22c55e] text-white px-4 py-2.5 rounded-full hover:shadow-lg transition-all font-semibold shadow-sm my-2"
                >
                  Login / Sign up
                </button>
              )}


              {user && (
                <>
                  {profile?.role === 'admin' && (
                    <a href="/admin/properties" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center space-x-2 border-t border-primary-500 mt-2" onClick={() => setShowMenu(false)}>
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
                  <a href="/favorites" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center space-x-2 border-t border-primary-500 mt-2" onClick={() => setShowMenu(false)}>
                    <Heart className="h-5 w-5" />
                    <span>Favorites</span>
                  </a>
                  <a href="/dashboard" className="text-white hover:text-primary-100 py-3 min-h-[44px] flex items-center space-x-2" onClick={() => setShowMenu(false)}>
                    <Shield className="h-5 w-5" />
                    <span>Dashboard</span>
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

      {showAuthModal && (
        <AuthModal
          onClose={() => {
            setShowAuthModal(false)
            setAuthModalProps({})
          }}
          intentRole={authModalProps.intentRole}
          redirectTo={authModalProps.redirectTo}
        />
      )}

      {showUsernameModal && (
        <UsernameModal
          onClose={() => setShowUsernameModal(false)}
        />
      )}
    </>
  )
}
