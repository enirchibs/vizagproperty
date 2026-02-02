# Authentication Auto-Redirect Feature

## Overview

The authentication system now supports automatic redirection after successful login/signup via any method (Phone OTP, Email, Google OAuth).

## How It Works

### 1. Save Intent Before Login

Before showing the auth modal, save the redirect destination in localStorage:

```typescript
localStorage.setItem('auth_redirect', 'post-property')
// OR any other path like '/properties', '/dashboard', etc.
```

### 2. Automatic Redirect After Auth Success

After successful authentication (OTP verification, email login, or Google OAuth), the system will:

1. Check for `auth_redirect` in localStorage
2. Redirect to the appropriate page:
   - If `auth_redirect === 'post-property'` → Navigate to `/add-property`
   - Otherwise → Navigate to the path stored in `auth_redirect`
3. Clean up localStorage automatically

## Usage Examples

### Example 1: Post Property Button

```typescript
const handlePostPropertyClick = () => {
  if (user) {
    window.location.href = '/add-property'
  } else {
    // Save the redirect intent
    localStorage.setItem('auth_redirect', 'post-property')
    setShowAuthModal(true)
  }
}
```

### Example 2: View Property Details (Require Login)

```typescript
const handleViewDetails = () => {
  if (!user) {
    // Save the current property page as redirect
    localStorage.setItem('auth_redirect', `/property/${propertyId}`)
    setShowAuthModal(true)
  }
}
```

### Example 3: Save to Favorites

```typescript
const handleSaveToFavorites = () => {
  if (!user) {
    localStorage.setItem('auth_redirect', window.location.pathname)
    setShowAuthModal(true)
  }
}
```

## Supported Auth Methods

The auto-redirect works seamlessly with:

- **Phone OTP** - Redirects after successful OTP verification
- **Email/Password** - Redirects after successful email login or signup
- **Google OAuth** - Redirects after Google authentication callback

## Special Handling for Google OAuth

For Google OAuth, the redirect intent is preserved across the OAuth flow:

1. Before initiating Google auth, the system saves `auth_redirect` to `google_auth_redirect`
2. After OAuth callback, the system checks both `auth_redirect` and `google_auth_redirect`
3. Both are automatically cleaned up after redirect

## Implementation Details

### AuthModal Component

The AuthModal component automatically handles:
- Checking localStorage for redirect intents
- Prioritizing redirects: `auth_redirect` → `google_auth_redirect` → `redirectTo` prop
- Cleaning up localStorage after use
- Special case for 'post-property' → '/add-property'

### No Code Changes Required

If you're already using the AuthModal component, the auto-redirect feature is automatically available. Just set `localStorage.setItem('auth_redirect', 'your-path')` before showing the modal.

## Testing

To test the feature:

1. Log out if logged in
2. Click "Post Property" button
3. Complete authentication (any method)
4. Verify automatic redirect to `/add-property`

## Notes

- The redirect happens after successful authentication
- localStorage is automatically cleaned up to prevent unwanted redirects on subsequent logins
- The feature is backwards compatible - existing code using `redirectTo` prop still works
