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

#### Option A: Twilio (Recommended)
1. Sign up at [Twilio](https://www.twilio.com)
2. Get your Account SID and Auth Token
3. Get a Twilio phone number
4. In Supabase, select Twilio as provider and enter credentials

#### Option B: MessageBird
1. Sign up at [MessageBird](https://www.messagebird.com)
2. Get your API key
3. In Supabase, select MessageBird as provider and enter credentials

#### Option C: Vonage (formerly Nexmo)
1. Sign up at [Vonage](https://www.vonage.com)
2. Get your API key and secret
3. In Supabase, select Vonage as provider and enter credentials

### 3. Configure OTP Settings

In Supabase Phone provider settings:
- Set OTP expiration (default: 60 seconds)
- Configure OTP length (default: 6 digits)
- Set rate limiting for SMS sends

### 4. Test the Integration

1. Open your application
2. Click "Post Property Free" or any action requiring login
3. Enter a valid mobile number
4. Verify you receive the OTP SMS
5. Enter the OTP to complete authentication

## Important Notes

- **SMS costs**: Each SMS sent will incur charges from your SMS provider
- **Rate limiting**: The modal limits resend attempts to 3 per session
- **OTP expiry**: OTPs expire after 60 seconds for security
- **Phone format**: The system expects Indian mobile numbers (+91) by default
- **Security**: Phone numbers are masked after entry (XXXXXXX123)

## Testing Without SMS Provider

If you haven't configured an SMS provider yet:
1. The modal will show an error when trying to send OTP
2. Configure the SMS provider first before testing
3. Alternatively, you can use Supabase's test mode (if available) for development

## Features Implemented

✅ Two-column responsive modal layout
✅ India +91 country code (default)
✅ 10-digit Indian mobile validation
✅ OTP send with automatic resend timer (30 seconds)
✅ Maximum 3 resend attempts per session
✅ 6-digit OTP verification
✅ Phone number masking after entry
✅ Auto-registration on first login
✅ Clean, modern UI with smooth animations
✅ Mobile-first responsive design
✅ Proper error handling

## Triggers

The login modal opens when users:
- Click "Post Property Free" (when not logged in)
- Try to save a property (future implementation)
- Try to contact an owner (future implementation)
