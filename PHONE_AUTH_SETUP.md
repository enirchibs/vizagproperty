# Phone Authentication Setup Guide

Your mobile number authentication modal is now ready! However, to enable SMS OTP functionality, you need to configure an SMS provider in your Supabase project.

## Steps to Enable Phone Authentication

### 1. Configure SMS Provider in Supabase

1. Go to your [Supabase Dashboard](https://app.supabase.com)
2. Select your project
3. Navigate to **Authentication** → **Providers**
4. Find **Phone** in the list and click to configure
5. Enable the Phone provider

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

## Testing Without SMS Provider

If you haven't configured an SMS provider yet:
1. The modal will show an error when trying to send OTP
2. Configure the SMS provider first before testing
3. Use Email or OAuth login as alternative during development

## Features Implemented

### Authentication Methods
✅ Mobile Number + OTP (Primary)
✅ Google OAuth
✅ Email + Password
✅ Microsoft OAuth
✅ Facebook login removed (as requested)

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
✅ Method switching (phone/email/OAuth)

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

### For Buyers
1. User browses properties or uses search
2. Clicks contact/save/WhatsApp button
3. Auth modal opens with `intentRole='buyer'`
4. User signs up via phone/email/OAuth
5. Profile created with `role='buyer'`
6. Redirected back to previous page

### For Owners
1. User clicks "Post Property Free" button
2. Auth modal opens with `intentRole='owner'`
3. User signs up via phone/email/OAuth
4. Profile created with `role='owner'`
5. Redirected to `/post-property` page

### Role Upgrade
1. Existing buyer posts a property
2. System detects `intentRole='owner'`
3. Automatically upgrades role to `'both'`
4. User can now act as buyer and owner

## Triggers

The login modal opens when users:
- Click "Post Property Free" (opens with role='owner')
- Try to contact an owner (opens with role='buyer')
- Try to save a property (opens with role='buyer')
- Use WhatsApp features (opens with role='buyer')
