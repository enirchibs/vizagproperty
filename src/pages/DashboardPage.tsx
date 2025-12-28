import { useState, useEffect } from 'react'
import { Heart, User, History } from 'lucide-react'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import { Property } from '../types'
import { PropertyCard } from '../components/PropertyCard'

export function DashboardPage() {
  const { user, profile } = useAuth()
  const [activeTab, setActiveTab] = useState<'favorites' | 'profile' | 'history'>('favorites')
  const [favorites, setFavorites] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (user && activeTab === 'favorites') {
      loadFavorites()
    }
  }, [user, activeTab])

  const loadFavorites = async () => {
    setLoading(true)
    try {
      const { data: favData, error: favError } = await supabase
        .from('favorites')
        .select('property_id')
        .eq('user_id', user?.id)

      if (favError) throw favError

      const propertyIds = favData.map(f => f.property_id)

      if (propertyIds.length > 0) {
        const { data: properties, error: propError } = await supabase
          .from('properties')
          .select('*')
          .in('id', propertyIds)

        if (propError) throw propError
        setFavorites(properties || [])
      } else {
        setFavorites([])
      }
    } catch (error) {
      console.error('Error loading favorites:', error)
    } finally {
      setLoading(false)
    }
  }

  if (!user) {
    return (
      <div className="min-h-screen bg-gray-50 flex items-center justify-center">
        <div className="text-center">
          <h2 className="text-2xl font-bold text-gray-900 mb-2">Please sign in</h2>
          <a href="/" className="text-primary-600 hover:text-primary-700">
            Go to home
          </a>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 py-8">
        <div className="bg-white rounded-2xl p-6 shadow-sm border border-gray-100 mb-8">
          <div className="flex items-center space-x-4">
            <div className="w-16 h-16 bg-primary-100 rounded-full flex items-center justify-center">
              <User className="h-8 w-8 text-primary-600" />
            </div>
            <div>
              <h1 className="text-2xl font-bold text-gray-900">{profile?.full_name}</h1>
              <p className="text-gray-600 capitalize">{profile?.user_type}</p>
            </div>
          </div>
        </div>

        <div className="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
          <div className="border-b border-gray-200">
            <nav className="flex">
              <button
                onClick={() => setActiveTab('favorites')}
                className={`flex items-center space-x-2 px-6 py-4 border-b-2 transition-colors ${
                  activeTab === 'favorites'
                    ? 'border-primary-600 text-primary-600'
                    : 'border-transparent text-gray-600 hover:text-gray-900'
                }`}
              >
                <Heart className="h-5 w-5" />
                <span>Favorites</span>
              </button>
              <button
                onClick={() => setActiveTab('profile')}
                className={`flex items-center space-x-2 px-6 py-4 border-b-2 transition-colors ${
                  activeTab === 'profile'
                    ? 'border-primary-600 text-primary-600'
                    : 'border-transparent text-gray-600 hover:text-gray-900'
                }`}
              >
                <User className="h-5 w-5" />
                <span>Profile</span>
              </button>
              <button
                onClick={() => setActiveTab('history')}
                className={`flex items-center space-x-2 px-6 py-4 border-b-2 transition-colors ${
                  activeTab === 'history'
                    ? 'border-primary-600 text-primary-600'
                    : 'border-transparent text-gray-600 hover:text-gray-900'
                }`}
              >
                <History className="h-5 w-5" />
                <span>History</span>
              </button>
            </nav>
          </div>

          <div className="p-6">
            {activeTab === 'favorites' && (
              <div>
                <h2 className="text-xl font-semibold text-gray-900 mb-4">
                  Your Favorite Properties
                </h2>
                {loading ? (
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    {[1, 2, 3].map((i) => (
                      <div key={i} className="bg-gray-200 h-80 rounded-2xl animate-pulse" />
                    ))}
                  </div>
                ) : favorites.length === 0 ? (
                  <div className="text-center py-16">
                    <Heart className="h-16 w-16 text-gray-300 mx-auto mb-4" />
                    <h3 className="text-lg font-semibold text-gray-900 mb-2">
                      No favorites yet
                    </h3>
                    <p className="text-gray-600 mb-4">
                      Start adding properties to your favorites
                    </p>
                    <a
                      href="/properties"
                      className="inline-block bg-primary-600 text-white px-6 py-3 rounded-lg hover:bg-primary-700 transition-colors"
                    >
                      Browse Properties
                    </a>
                  </div>
                ) : (
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    {favorites.map((property) => (
                      <PropertyCard
                        key={property.id}
                        property={property}
                        onFavoriteChange={loadFavorites}
                      />
                    ))}
                  </div>
                )}
              </div>
            )}

            {activeTab === 'profile' && (
              <div>
                <h2 className="text-xl font-semibold text-gray-900 mb-4">Profile Information</h2>
                <div className="space-y-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Full Name
                    </label>
                    <div className="px-4 py-2 bg-gray-50 border border-gray-200 rounded-lg">
                      {profile?.full_name}
                    </div>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      Email
                    </label>
                    <div className="px-4 py-2 bg-gray-50 border border-gray-200 rounded-lg">
                      {user.email}
                    </div>
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">
                      User Type
                    </label>
                    <div className="px-4 py-2 bg-gray-50 border border-gray-200 rounded-lg capitalize">
                      {profile?.user_type}
                    </div>
                  </div>
                  {profile?.phone && (
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">
                        Phone
                      </label>
                      <div className="px-4 py-2 bg-gray-50 border border-gray-200 rounded-lg">
                        {profile.phone}
                      </div>
                    </div>
                  )}
                </div>
              </div>
            )}

            {activeTab === 'history' && (
              <div className="text-center py-16">
                <History className="h-16 w-16 text-gray-300 mx-auto mb-4" />
                <h3 className="text-lg font-semibold text-gray-900 mb-2">
                  Search History
                </h3>
                <p className="text-gray-600">
                  Your recent searches will appear here
                </p>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
