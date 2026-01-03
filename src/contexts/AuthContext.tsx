import { createContext, useContext, useEffect, useState, ReactNode } from 'react'
import { User, Session } from '@supabase/supabase-js'
import { supabase } from '../lib/supabase'
import { UserProfile } from '../types'

interface AuthContextType {
  user: User | null
  profile: UserProfile | null
  session: Session | null
  loading: boolean
  signUp: (email: string, password: string, fullName: string, userType: 'buyer' | 'seller' | 'agent') => Promise<void>
  signIn: (email: string, password: string) => Promise<void>
  signInWithPhone: (phone: string) => Promise<void>
  verifyOtp: (phone: string, otp: string, intentRole?: 'buyer' | 'owner', redirectTo?: string) => Promise<void>
  signInWithEmail: (email: string, password: string, redirectTo?: string) => Promise<void>
  signUpWithEmail: (email: string, password: string, name: string, intentRole?: 'buyer' | 'owner', redirectTo?: string) => Promise<void>
  signInWithOAuth: (provider: 'google', intentRole?: 'buyer' | 'owner', redirectTo?: string) => Promise<void>
  signOut: () => Promise<void>
}

const AuthContext = createContext<AuthContextType | undefined>(undefined)

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null)
  const [profile, setProfile] = useState<UserProfile | null>(null)
  const [session, setSession] = useState<Session | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session)
      setUser(session?.user ?? null)
      if (session?.user) {
        loadProfile(session.user.id)
      } else {
        setLoading(false)
      }
    })

    const { data: { subscription } } = supabase.auth.onAuthStateChange(async (event, session) => {
      setSession(session)
      setUser(session?.user ?? null)

      if (session?.user) {
        if (event === 'SIGNED_IN' || event === 'USER_UPDATED') {
          const urlParams = new URLSearchParams(window.location.search)
          const intentRole = urlParams.get('intent_role') || 'buyer'
          const redirectTo = urlParams.get('redirect_to')

          const { data: existingProfile } = await supabase
            .from('user_profiles')
            .select('*')
            .eq('id', session.user.id)
            .maybeSingle()

          if (!existingProfile) {
            await supabase
              .from('user_profiles')
              .insert({
                id: session.user.id,
                name: session.user.user_metadata?.name || session.user.email?.split('@')[0] || 'User',
                email: session.user.email,
                role: intentRole as 'buyer' | 'owner',
                auth_provider: 'google',
                user_type: intentRole === 'owner' ? 'seller' : 'buyer'
              })
              .then(() => loadProfile(session.user.id))
          } else {
            await loadProfile(session.user.id)
          }

          if (redirectTo && event === 'SIGNED_IN') {
            const cleanUrl = new URL(window.location.href)
            cleanUrl.searchParams.delete('intent_role')
            cleanUrl.searchParams.delete('redirect_to')
            window.history.replaceState({}, '', cleanUrl.toString())

            setTimeout(() => {
              window.location.href = redirectTo
            }, 500)
          } else if (event === 'SIGNED_IN') {
            const cleanUrl = new URL(window.location.href)
            cleanUrl.searchParams.delete('intent_role')
            cleanUrl.searchParams.delete('redirect_to')
            window.history.replaceState({}, '', cleanUrl.toString())
          }
        } else {
          await loadProfile(session.user.id)
        }
      } else {
        setProfile(null)
        setLoading(false)
      }
    })

    return () => subscription.unsubscribe()
  }, [])

  const loadProfile = async (userId: string) => {
    try {
      const { data, error } = await supabase
        .from('user_profiles')
        .select('*')
        .eq('id', userId)
        .maybeSingle()

      if (error) throw error
      setProfile(data)
    } catch (error) {
      console.error('Error loading profile:', error)
    } finally {
      setLoading(false)
    }
  }

  const signUp = async (email: string, password: string, fullName: string, userType: 'buyer' | 'seller' | 'agent') => {
    const { data, error } = await supabase.auth.signUp({ email, password })
    if (error) throw error

    if (data.user) {
      const { error: profileError } = await supabase
        .from('user_profiles')
        .insert({
          id: data.user.id,
          full_name: fullName,
          user_type: userType,
        })

      if (profileError) throw profileError
    }
  }

  const signIn = async (email: string, password: string) => {
    const { error } = await supabase.auth.signInWithPassword({ email, password })
    if (error) throw error
  }

  const signInWithPhone = async (phone: string) => {
    const { error } = await supabase.auth.signInWithOtp({
      phone,
      options: {
        channel: 'sms',
      },
    })
    if (error) throw error
  }

  const verifyOtp = async (phone: string, token: string, intentRole: 'buyer' | 'owner' = 'buyer', redirectTo?: string) => {
    const { data, error } = await supabase.auth.verifyOtp({
      phone,
      token,
      type: 'sms',
    })
    if (error) throw error

    if (data.user) {
      const { data: existingProfile } = await supabase
        .from('user_profiles')
        .select('*')
        .eq('id', data.user.id)
        .maybeSingle()

      if (!existingProfile) {
        const { error: profileError } = await supabase
          .from('user_profiles')
          .insert({
            id: data.user.id,
            name: data.user.phone || 'User',
            phone: data.user.phone,
            role: intentRole,
            auth_provider: 'phone',
            user_type: intentRole === 'owner' ? 'seller' : 'buyer'
          })

        if (profileError && profileError.code !== '23505') {
          console.error('Error creating profile:', profileError)
        }
      } else if (existingProfile.role !== 'both' && existingProfile.role !== intentRole) {
        await supabase.rpc('upgrade_user_role', { user_id: data.user.id, new_role: intentRole })
      }

      if (redirectTo) {
        window.location.href = redirectTo
      }
    }
  }

  const signInWithEmail = async (email: string, password: string, redirectTo?: string) => {
    const { data, error } = await supabase.auth.signInWithPassword({ email, password })
    if (error) throw error

    if (redirectTo && data.user) {
      window.location.href = redirectTo
    }
  }

  const signUpWithEmail = async (email: string, password: string, name: string, intentRole: 'buyer' | 'owner' = 'buyer', redirectTo?: string) => {
    const { data, error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: {
          name,
          role: intentRole
        }
      }
    })
    if (error) throw error

    if (data.user) {
      const { error: profileError } = await supabase
        .from('user_profiles')
        .insert({
          id: data.user.id,
          name,
          email: data.user.email,
          role: intentRole,
          auth_provider: 'email',
          user_type: intentRole === 'owner' ? 'seller' : 'buyer'
        })

      if (profileError && profileError.code !== '23505') {
        console.error('Error creating profile:', profileError)
      }

      if (redirectTo) {
        window.location.href = redirectTo
      }
    }
  }

  const signInWithOAuth = async (_provider: 'google', intentRole: 'buyer' | 'owner' = 'buyer', redirectTo?: string) => {
    const callbackUrl = new URL(redirectTo || window.location.href)
    callbackUrl.searchParams.set('intent_role', intentRole)
    if (redirectTo) {
      callbackUrl.searchParams.set('redirect_to', redirectTo)
    }

    const { error } = await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: callbackUrl.toString()
      }
    })
    if (error) throw error
  }

  const signOut = async () => {
    const { error } = await supabase.auth.signOut()
    if (error) throw error
  }

  return (
    <AuthContext.Provider value={{
      user,
      profile,
      session,
      loading,
      signUp,
      signIn,
      signInWithPhone,
      verifyOtp,
      signInWithEmail,
      signUpWithEmail,
      signInWithOAuth,
      signOut
    }}>
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth() {
  const context = useContext(AuthContext)
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider')
  }
  return context
}
