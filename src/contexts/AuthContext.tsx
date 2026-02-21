import { createContext, useContext, useEffect, useState, ReactNode } from 'react'
import { User, Session } from '@supabase/supabase-js'
import { supabase } from '../lib/supabase'
import { UserProfile } from '../types'

interface AuthContextType {
  user: User | null
  profile: UserProfile | null
  session: Session | null
  loading: boolean
  isAdmin: boolean
  showUsernamePrompt: boolean
  setShowUsernamePrompt: (show: boolean) => void
  signInWithPhone: (phone: string, intentRole?: 'buyer' | 'owner') => Promise<void>
  verifyOtp: (phone: string, otp: string) => Promise<void>
  signInWithEmail: (email: string, password: string) => Promise<void>
  signUpWithEmail: (email: string, password: string, intentRole?: 'buyer' | 'owner') => Promise<void>
  signInWithGoogle: () => Promise<void>
  updateUsername: (username: string) => Promise<void>
  signOut: () => Promise<void>
}

const AuthContext = createContext<AuthContextType | undefined>(undefined)

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null)
  const [profile, setProfile] = useState<UserProfile | null>(null)
  const [session, setSession] = useState<Session | null>(null)
  const [loading, setLoading] = useState(true)
  const [showUsernamePrompt, setShowUsernamePrompt] = useState(false)

  useEffect(() => {
    let mounted = true

    const getSession = async () => {
      const { data } = await supabase.auth.getSession()
      if (mounted) {
        setSession(data.session)
        setUser(data.session?.user ?? null)
        if (data.session?.user) {
          loadProfile(data.session.user.id)
        } else {
          setLoading(false)
        }
      }
    }

    getSession()

    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      async (event, session) => {
        if (!mounted) return

        setSession(session)
        setUser(session?.user ?? null)

        if (session?.user) {
          const { data: existingProfile } = await supabase
            .from('users')
            .select('*')
            .eq('id', session.user.id)
            .maybeSingle()

          const authProvider = session.user.phone ? 'phone'
            : session.user.app_metadata?.provider === 'google' ? 'google'
            : 'email'

          if (!existingProfile && (event === 'SIGNED_IN' || event === 'USER_UPDATED')) {
            const intentRole = session.user.user_metadata?.intent_role || 'buyer'

            const { error: insertError } = await supabase.from('users').insert({
              id: session.user.id,
              name: session.user.user_metadata?.full_name || session.user.phone || session.user.email?.split('@')[0] || 'User',
              email: session.user.email,
              phone: session.user.phone,
              role: intentRole
            })

            if (!insertError && authProvider === 'email') {
              setShowUsernamePrompt(true)
            }
          }

          await loadProfile(session.user.id)
        } else {
          setProfile(null)
          setLoading(false)
        }
      }
    )

    return () => {
      mounted = false
      subscription.unsubscribe()
    }
  }, [])

  const loadProfile = async (userId: string) => {
    try {
      const { data, error } = await supabase
        .from('users')
        .select('*')
        .eq('id', userId)
        .maybeSingle()

      if (error) throw error
      setProfile(data)
    } catch (err) {
      console.error('Error loading profile:', err)
    } finally {
      setLoading(false)
    }
  }

  /* ======================================================
     ✅ PRODUCTION MOBILE OTP LOGIN
     ====================================================== */

  const signInWithPhone = async (phone: string, intentRole?: 'buyer' | 'owner') => {
    const { error } = await supabase.auth.signInWithOtp({
      phone,
      options: {
        shouldCreateUser: true,
        data: {
          intent_role: intentRole || 'buyer'
        }
      }
    })

    if (error) {
      console.error('OTP send error:', error.message)
      throw new Error(error.message)
    }
  }

  const verifyOtp = async (phone: string, otp: string) => {
    if (!phone || !otp) {
      throw new Error('Session expired. Please request OTP again.')
    }

    const { error } = await supabase.auth.verifyOtp({
      phone,
      token: otp,
      type: 'sms'
    })

    if (error) {
      console.error('OTP verify error:', error.message)
      throw new Error('Invalid or expired OTP')
    }
  }

  /* ======================================================
     ✅ EMAIL + PASSWORD LOGIN
     ====================================================== */

  const signUpWithEmail = async (
    email: string,
    password: string,
    intentRole: 'buyer' | 'owner' = 'buyer'
  ) => {
    const { error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: {
          intent_role: intentRole
        }
      }
    })

    if (error) {
      console.error('Email signup error:', error.message)
      throw error
    }

    // User row will be created by onAuthStateChange handler
  }

  const signInWithEmail = async (email: string, password: string) => {
    const { error } = await supabase.auth.signInWithPassword({
      email,
      password
    })

    if (error) {
      console.error('Email signin error:', error.message)
      throw error
    }
  }

  /* ======================================================
     ✅ GOOGLE OAUTH LOGIN
     ====================================================== */

  const signInWithGoogle = async () => {
    const { error } = await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: `${window.location.origin}/`
      }
    })

    if (error) {
      console.error('Google signin error:', error.message)
      throw error
    }
  }

  /* ======================================================
     ✅ UPDATE USERNAME
     ====================================================== */

  const updateUsername = async (username: string) => {
    if (!user) throw new Error('No user logged in')

    const { error } = await supabase
      .from('users')
      .update({ username })
      .eq('id', user.id)

    if (error) {
      console.error('Update username error:', error.message)
      throw error
    }

    await loadProfile(user.id)
  }

  const signOut = async () => {
    const { error } = await supabase.auth.signOut({ scope: 'global' })
    if (error) throw error

    // Clear local state immediately
    setUser(null)
    setProfile(null)
    setSession(null)

    // Redirect to home page
    window.location.href = '/'
  }

  const isAdmin = profile?.role === 'admin'

  return (
    <AuthContext.Provider
      value={{
        user,
        profile,
        session,
        loading,
        isAdmin,
        showUsernamePrompt,
        setShowUsernamePrompt,
        signInWithPhone,
        verifyOtp,
        signInWithEmail,
        signUpWithEmail,
        signInWithGoogle,
        updateUsername,
        signOut
      }}
    >
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth() {
  const context = useContext(AuthContext)
  if (!context) {
    throw new Error('useAuth must be used within AuthProvider')
  }
  return context
}
