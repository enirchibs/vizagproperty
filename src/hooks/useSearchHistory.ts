import { useState, useEffect } from 'react'
import { supabase } from '../lib/supabase'
import { useAuth } from '../contexts/AuthContext'

interface SearchHistory {
  id: string
  user_id: string
  location: string
  locality: string
  search_type: string
  search_query: string
  created_at: string
  updated_at: string
}

export function useSearchHistory() {
  const { user } = useAuth()
  const [lastSearch, setLastSearch] = useState<SearchHistory | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (user) {
      loadLastSearch()
    } else {
      setLastSearch(null)
      setLoading(false)
    }
  }, [user])

  const loadLastSearch = async () => {
    if (!user) return

    try {
      const { data, error } = await supabase
        .from('user_search_history')
        .select('*')
        .eq('user_id', user.id)
        .order('created_at', { ascending: false })
        .limit(1)
        .maybeSingle()

      if (error) throw error
      setLastSearch(data)
    } catch (error) {
    } finally {
      setLoading(false)
    }
  }

  const saveSearch = async (
    location: string,
    locality: string,
    searchType: string,
    searchQuery: string = ''
  ) => {
    if (!user) return

    try {
      const { error } = await supabase
        .from('user_search_history')
        .insert({
          user_id: user.id,
          location,
          locality,
          search_type: searchType,
          search_query: searchQuery,
        })

      if (error) throw error
      await loadLastSearch()
    } catch (error) {
    }
  }

  return { lastSearch, loading, saveSearch }
}
