# Authentication Flow - NoBroker Style (Dedicated Login Page)

This document describes the clean authentication flow implemented in the application, using a dedicated login page similar to NoBroker's user experience.

## Overview

The app uses a dedicated `/login` page with automatic redirects after successful authentication. Users can access the login page from multiple entry points throughout the app.

## Key Features

**ONE LOGIN PAGE — MULTIPLE ENTRY POINTS**

1. Click "Login / Sign up" button → Navigate to `/login` → After login, return to home
2. Click "Post Property – Free" (not logged in) → Navigate to `/login?redirect=/add-property` → After login, redirect to `/add-property`
3. Access protected route directly → Redirect to `/login?redirect=/intended-route` → After login, return to intended page

## Implementation

### Login Page (`src/pages/LoginPage.tsx`)

**Full-page authentication interface with:**
- Phone OTP authentication (primary method)
- Email/password authentication (alternative)
- Google OAuth integration
- Role selection (Buyer/Owner) during signup
- Automatic redirect handling via URL query parameter

**Redirect Logic:**
```tsx
const redirectParam = new URLSearchParams(location.search).get('redirect') || '/'

// After successful authentication
useEffect(() => {
  if (user && !loading) {
    navigate(redirectParam)
  }
}, [user, loading])
```

### Auth Guard Component (`src/components/AuthGuard.tsx`)

Protected routes use the `AuthGuard` component to ensure users are authenticated:

**Features:**
- Shows loading spinner while checking auth status
- Redirects to `/login` with return URL if user is not authenticated
- URL encodes the redirect parameter for safety

**Usage:**
```tsx
<AuthGuard redirectTo="/add-property">
  {/* Protected content */}
</AuthGuard>
```

### Updated Components

#### Header (`src/components/Header.tsx`)

**Navigation-based authentication:**
```tsx
const handlePostPropertyClick = () => {
  if (user) {
    navigate('/add-property')
  } else {
    navigate('/login?redirect=/add-property')
  }
}

const handleLoginClick = () => {
  navigate('/login')
}
```

#### Add Property Page (`src/pages/AddPropertyPage.tsx`)

**Protected with AuthGuard:**
```tsx
<AuthGuard redirectTo="/add-property">
  {/* Property posting form */}
</AuthGuard>
```

## User Flow Examples

### Scenario 1: Post Property (Not Logged In)

1. User clicks "Post Property – Free" button
2. Header navigates to `/login?redirect=/add-property`
3. User sees full-page login screen
4. User authenticates (Phone OTP / Email / Google)
5. LoginPage detects successful auth
6. Automatically navigates to `/add-property`
7. User sees property posting form

### Scenario 2: Direct Access to Protected Route

1. User navigates to `/add-property` directly (not authenticated)
2. AuthGuard detects no authenticated user
3. Redirects to `/login?redirect=/add-property`
4. User sees login page with redirect parameter
5. After authentication, LoginPage redirects to `/add-property`
6. User lands on intended page

### Scenario 3: Regular Login

1. User clicks "Login / Sign up" button
2. Navigates to `/login` (no redirect parameter)
3. User authenticates
4. Redirects to home page `/`
5. User continues browsing

## Auth Methods Supported

All methods work with the redirect system:

1. **Phone OTP** - SMS-based one-time password (Primary method)
2. **Email + Password** - Traditional email authentication
3. **Google OAuth** - Social login with Google

## Login Page Features

**Tabbed Interface:**
- Phone tab (default)
- Email tab
- Both support role selection (Buyer/Owner)

**Phone Authentication:**
- Enter 10-digit mobile number
- Receive OTP via SMS
- Verify OTP
- Auto-login on success

**Email Authentication:**
- Toggle between Sign In / Sign Up
- Email and password fields
- Role selection during signup
- Instant login on success

**Google OAuth:**
- One-click Google sign-in
- Automatic profile creation
- Seamless integration

**Mobile-First Design:**
- Responsive layout
- Touch-optimized buttons
- Clear visual hierarchy
- Gradient backgrounds

## URL Structure

**Login Page:**
- `/login` - Default login page
- `/login?redirect=/add-property` - Login with redirect to property posting
- `/login?redirect=/dashboard` - Login with redirect to dashboard
- `/login?redirect=/edit-property/123` - Login with redirect to specific property edit

**Protected Routes:**
All routes wrapped with `AuthGuard` will redirect to `/login?redirect=<current-path>`

## Security

- Row Level Security (RLS) policies enforce data access
- Auth state managed by Supabase Auth
- Protected routes use AuthGuard for consistent security
- Session management handled by Supabase client
- Redirect URLs are properly encoded

## Benefits

- **Clean separation** - Dedicated login page separate from main app flow
- **Better mobile UX** - Full-page experience optimized for mobile
- **SEO friendly** - Dedicated `/login` route
- **Deep linking** - Direct links to protected pages work correctly
- **URL-based state** - Redirect logic in URL, not state
- **Consistent behavior** - All protected routes use same auth pattern
- **No modals** - Cleaner, more professional full-page experience

## Technical Notes

**Removed from previous modal-based approach:**
- AuthModal component usage in Header
- redirectAfterAuth state in AuthContext
- Modal-based authentication flow
- Complex state management for redirects

**New approach:**
- URL query parameters for redirect logic
- Full-page login experience
- React Router navigation
- Simplified AuthContext (no redirect state needed)
