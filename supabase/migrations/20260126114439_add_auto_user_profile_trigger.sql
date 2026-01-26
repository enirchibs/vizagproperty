/*
  # Auto-Create User Profile Trigger

  1. New Functions
    - `handle_new_user()` - Automatically creates a public.users row when a new auth.users row is created

  2. New Triggers
    - `on_auth_user_created` - Trigger that fires after INSERT on auth.users

  3. Changes
    - Ensures every authenticated user automatically gets a profile in public.users
    - Eliminates race conditions where auth.users exists but public.users doesn't
    - Uses user metadata to populate name field (from Google OAuth, email, etc.)

  4. Security
    - Function runs with SECURITY DEFINER to bypass RLS
    - Uses ON CONFLICT to safely handle existing users
    - Default role is 'buyer' for all new users

  5. Notes
    - This fixes the "Please complete your profile" error for:
      - Google login
      - Phone OTP login
      - Email/password signup
      - All future authentication methods
    - Profile creation is now atomic with authentication
    - No manual profile creation needed in application code
*/

-- Drop existing trigger and function if they exist
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
DROP FUNCTION IF EXISTS handle_new_user();

-- Create function to auto-create user profile
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  INSERT INTO public.users (id, email, phone, name, role)
  VALUES (
    new.id,
    new.email,
    new.phone,
    COALESCE(
      new.raw_user_meta_data->>'name',
      new.raw_user_meta_data->>'full_name',
      SPLIT_PART(new.email, '@', 1),
      'User'
    ),
    'buyer'
  )
  ON CONFLICT (id) DO NOTHING;

  RETURN new;
END;
$$;

-- Create trigger on auth.users
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION handle_new_user();
