# Phone Authentication Setup Guide

## ⚠️ CRITICAL: SMS Provider Required

Your application now uses **MOBILE OTP ONLY** for authentication. Email and Google login have been removed.

**Current Status:**
- ✅ Mobile OTP UI is implemented
- ✅ No auto-login popups
- ❌ SMS provider NOT configured (you need to do this)

**What works now:**
- Browsing properties (no login required)
- Searching and viewing listings

**What doesn't work until SMS is configured:**
- Logging in (users can't receive OTP)
- Posting properties
- Any authenticated features

---

## 🚀 Quick Start: Configure Phone Auth in 3 Steps

### Step 1: Find Phone Provider Settings

**Method A - Direct URL (Fastest):**
1. Open: `https://app.supabase.com/project/YOUR_PROJECT_ID/auth/providers`
2. Find your PROJECT_ID in your Supabase dashboard URL
3. Replace YOUR_PROJECT_ID with your actual project ID

**Method B - Navigate in Dashboard:**
1. Go to [Supabase Dashboard](https://app.supabase.com)
2. Select your project
3. Left sidebar → **Authentication** (shield icon)
4. Click **Providers** or **Auth Providers**
5. Scroll to **Phone** section
6. Enable the toggle

**Method C - Settings Path:**
1. Left sidebar → **Settings** (gear icon)
2. → **Authentication**
3. → **Auth Providers** tab
4. Find and enable **Phone**

### Step 2: Choose SMS Provider

Pick one based on your location and budget:
- **India:** Exotel (₹0.20-0.40/SMS) or MSG91 (₹0.15-0.30/SMS)
- **Global:** Twilio (₹0.60-1.20/SMS)

### Step 3: Add SMS Provider Credentials

Enter the credentials from your chosen SMS provider into Supabase Phone settings.

---

## Steps to Enable Phone Authentication

### 1. Configure SMS Provider in Supabase

**Updated Navigation for 2026:**

1. Go to your [Supabase Dashboard](https://app.supabase.com)
2. Select your project from the project list
3. In the left sidebar, look for **Authentication** (shield icon)
4. Click on **Authentication** to expand the menu
5. Click on **Providers** (or **Auth Providers**)
6. Scroll down to find **Phone** in the providers list
7. Click on **Phone** to expand its settings
8. Toggle the switch to **Enable Phone provider**

**Alternative path if above doesn't work:**
- Look for **Settings** in left sidebar
- Go to **Authentication** under Settings
- Find **Auth Providers** tab
- Enable **Phone** provider

**Note:** If you don't see the Phone option, ensure:
- You're on a Supabase project (not organization settings)
- Your project is fully provisioned (may take a few minutes for new projects)
- You have the necessary permissions (owner/admin role)

### 2. Choose and Configure an SMS Provider

Supabase supports several SMS providers. Choose one:

#### Option A: Exotel (Recommended for India)
1. Sign up at [Exotel](https://exotel.com)
2. Complete KYC verification
3. Get your API credentials from Settings → API Settings:
   - Account SID
   - API Key (create new)
   - API Token (auto-generated)
   - Sender ID (must be pre-approved)
4. In Supabase, configure Phone provider:
   - Provider: Exotel
   - Account SID: `<from Exotel>`
   - API Key: `<new API key>`
   - API Token: `<token>`
   - Sender ID: `<approved sender>`
   - Country: India (+91)

**DLT Compliance (Required for India):**
- Register SMS template with DLT
- Example: "Your OTP for property search is {otp}. Valid for 10 minutes."
- Wait 24-48 hours for approval
- Cost: ₹0.20-0.40 per SMS

#### Option B: Twilio
1. Sign up at [Twilio](https://www.twilio.com)
2. Get your Account SID and Auth Token
3. Get a Twilio phone number
4. In Supabase, select Twilio as provider and enter credentials
5. Cost: ₹0.60-1.20 per SMS (India)

#### Option C: MSG91 (India-focused)
1. Sign up at [MSG91](https://msg91.com)
2. Get your Auth Key
3. Register Sender ID (6-digit)
4. Register DLT template
5. Cost: ₹0.15-0.30 per SMS

#### Option D: Textlocal (India)
1. Sign up at [Textlocal](https://www.textlocal.in)
2. Get your API key
3. Configure 6-character Sender ID
4. Cost: ₹0.15-0.25 per SMS

### 3. Configure OTP Settings

In Supabase Phone provider settings:
- Set OTP expiration (default: 60 seconds)
- Configure OTP length (default: 6 digits)
- Set rate limiting for SMS sends

### 4. Test the Integration

1. Open your application
2. Click "Post Property Free" or any action requiring login
3. Enter a valid mobile number with country code: `+919876543210`
4. Verify you receive the OTP SMS
5. Enter the 6-digit OTP to complete authentication
6. Check that user profile is created with correct role

## Important Notes

- **SMS costs**: Each SMS sent will incur charges from your SMS provider
- **Rate limiting**: The modal limits resend attempts to 3 per session
- **OTP expiry**: OTPs expire after 60 seconds by default
- **Phone format**: Always use international format (+91 for India)
- **Security**: Phone numbers are masked after entry (XXXXXXX123)
- **DLT Compliance**: Required for all SMS in India (register templates first)

## Troubleshooting

### Can't Find Phone Provider in Dashboard
If you can't locate the Phone provider settings:

1. **Verify you're in the correct location:**
   - URL should be: `https://app.supabase.com/project/[your-project-id]/auth/providers`
   - Make sure you're not in Settings → API or Database settings

2. **Try direct URL access:**
   - Replace `[your-project-id]` with your actual project ID
   - Navigate to: `https://app.supabase.com/project/[your-project-id]/auth/providers`

3. **Check Supabase CLI as alternative:**
   ```bash
   # Install Supabase CLI if not already installed
   npm install -g supabase

   # Login to Supabase
   supabase login

   # Link your project
   supabase link --project-ref [your-project-id]
   ```

4. **Contact Supabase Support:**
   - If the option is completely missing, contact support
   - Phone auth may not be available in your region/plan

### OTP Not Received
1. Check Exotel Dashboard → SMS Logs for delivery status
2. Verify DLT template is approved
3. Ensure Sender ID is registered
4. Check phone number format includes +91
5. Review Supabase logs: Dashboard → Logs → Authentication

### Authentication Fails
1. Open browser console for error messages
2. Verify user_profiles table exists in Supabase
3. Check RLS policies are enabled
4. Ensure migration ran successfully
5. Verify `upgrade_user_role` function exists

### Profile Not Created
1. Check user_profiles table in Supabase Dashboard
2. Verify RLS policy allows authenticated inserts
3. Check console for profile creation errors
4. Ensure role column exists with proper constraints

## Quick Check: Is Phone Auth Working?

To verify your current setup status:

1. **Check if phone auth is already enabled:**
   - Open your app at `/add-property`
   - Try entering a mobile number
   - Click "Continue"
   - If you see an error about SMS provider, it needs configuration
   - If OTP is sent successfully, it's already working

2. **View current auth methods in Supabase:**
   - Dashboard → Authentication → Users
   - Create a test user to see which methods work
   - Check if phone numbers are being stored

## Testing Without SMS Provider

**Current Authentication Status:** Mobile OTP ONLY

Since we've removed Email and Google login, you MUST configure an SMS provider to use this application for authentication.

**What happens if SMS provider is not configured:**
1. Users can browse properties without login (this works)
2. Clicking "Login with Mobile OTP" will fail when sending OTP
3. Users cannot post properties until SMS is configured
4. The app is read-only until phone auth is set up

**Recommended Action:**
Configure an SMS provider immediately to enable full functionality. See SMS provider options below.

## Features Implemented

### Authentication Methods
✅ Mobile Number + OTP (ONLY method available)
❌ Google OAuth (REMOVED)
❌ Email + Password (REMOVED)
❌ Microsoft OAuth (REMOVED)
❌ Facebook login (REMOVED)

### UI Features
✅ Two-column responsive modal layout
✅ Single unified signup/login flow
✅ India +91 country code (default)
✅ 10-digit Indian mobile validation
✅ OTP send with automatic resend timer (30 seconds)
✅ Maximum 3 resend attempts per session
✅ 6-digit OTP verification
✅ Phone number masking after entry
✅ Clean, modern UI with smooth animations
✅ Mobile-first responsive design
✅ No auto-popup login prompts
✅ Distraction-free browsing experience

### Role Management
✅ Automatic role detection (buyer/owner)
✅ Smart role assignment based on user intent
✅ Role upgrade system (buyer → both, owner → both)
✅ No manual role selection required
✅ Session persistence with role tracking

### Database
✅ user_profiles table with role column
✅ Auth provider tracking (phone/email/google/microsoft)
✅ Phone and email fields
✅ upgrade_user_role() function
✅ Proper RLS policies
✅ Performance indexes

## Authentication Flow

### For Buyers (Optional - Browsing doesn't require login)
1. User browses properties freely without login
2. If user clicks contact/save/WhatsApp button (optional)
3. Auth modal opens with `intentRole='buyer'`
4. User enters mobile number + OTP
5. Profile created with `role='buyer'`
6. Redirected back to previous page

### For Owners (Login Required)
1. User clicks "Post Property Free" button or "Login with Mobile OTP"
2. Auth modal opens with `intentRole='owner'`
3. User enters mobile number + receives OTP via SMS
4. User enters 6-digit OTP to verify
5. Profile created with `role='owner'`
6. Redirected to `/add-property` page

### Role Upgrade
1. Existing buyer posts a property
2. System detects `intentRole='owner'`
3. Automatically upgrades role to `'both'`
4. User can now act as buyer and owner

## When Login Modal Appears

The Mobile OTP login modal ONLY opens when users explicitly:
- Click "Login / Sign up" button in header
- Click "Post Property — Free" button (when not logged in)
- Click "Login with Mobile OTP" on add-property page

**NO automatic popups:**
- ❌ No time-based popups (e.g., after 3 seconds)
- ❌ No scroll-triggered popups
- ❌ No exit-intent popups
- ❌ No browsing interruptions

Users can freely browse, search, and view all properties without any login prompts.
