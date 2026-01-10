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
  signInWithPhone: (phone: string) => Promise<void>
  verifyOtp: (
    phone: string,
    otp: string,
    intentRole?: 'buyer' | 'owner',
    redirectTo?: string
  ) => Promise<void>
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
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session)
      setUser(session?.user ?? null)
      if (session?.user) {
        loadProfile(session.user.id)
      } else {
        setLoading(false)
      }
    })

    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      (event, session) => {
        setSession(session)
        setUser(session?.user ?? null)

        if (session?.user) {
          (async () => {
            const { data: existingProfile } = await supabase
              .from('users')
              .select('*')
              .eq('id', session.user.id)
              .maybeSingle()

            // Determine auth provider from user metadata or app metadata
            const authProvider = session.user.phone ? 'phone'
              : session.user.app_metadata?.provider === 'google' ? 'google'
              : 'email'

            if (!existingProfile && (event === 'SIGNED_IN' || event === 'USER_UPDATED')) {
              // Get intent role from user metadata if available
              const intentRole = session.user.user_metadata?.intent_role || 'buyer'

              // Create new user row
              const { error: insertError } = await supabase.from('users').insert({
                id: session.user.id,
                name: session.user.user_metadata?.full_name || session.user.email?.split('@')[0] || 'User',
                email: session.user.email,
                phone: session.user.phone,
                role: intentRole
              })

              // Show username prompt only for email signups (not phone or Google)
              if (!insertError && authProvider === 'email') {
                setShowUsernamePrompt(true)
              }
            }

            await loadProfile(session.user.id)
          })()
        } else {
          setProfile(null)
          setLoading(false)
        }
      }
    )

    return () => subscription.unsubscribe()
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
     ✅ MOBILE + OTP LOGIN (TWILIO VERIFY COMPATIBLE)
     ====================================================== */

  const signInWithPhone = async (phone: string) => {
    const { error } = await supabase.auth.signInWithOtp({
      phone // MUST be +91XXXXXXXXXX
    })

    if (error) {
      console.error('OTP send error:', error.message)
      throw error
    }
  }

  const verifyOtp = async (
    phone: string,
    otp: string,
    intentRole: 'buyer' | 'owner' = 'buyer',
    redirectTo?: string
  ) => {
    const { data, error } = await supabase.auth.verifyOtp({
      phone,
      token: otp,
      type: 'sms'
    })

    if (error) {
      console.error('OTP verify error:', error.message)
      throw error
    }

    if (data?.user) {
      const { data: existingProfile } = await supabase
        .from('users')
        .select('*')
        .eq('id', data.user.id)
        .maybeSingle()

      if (!existingProfile) {
        await supabase.from('users').insert({
          id: data.user.id,
          name: data.user.phone || 'User',
          phone: data.user.phone,
          role: intentRole
        })
      }

      if (redirectTo) {
        window.location.href = redirectTo
      }
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
