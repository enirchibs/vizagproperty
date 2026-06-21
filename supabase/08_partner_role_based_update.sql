-- Add partner columns to the existing users table
ALTER TABLE public.users
ADD COLUMN IF NOT EXISTS is_partner BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS partner_status TEXT DEFAULT NULL,
ADD COLUMN IF NOT EXISTS partner_type TEXT DEFAULT NULL,
ADD COLUMN IF NOT EXISTS membership_type TEXT DEFAULT 'free',
ADD COLUMN IF NOT EXISTS partner_since TIMESTAMP WITH TIME ZONE DEFAULT NULL,
ADD COLUMN IF NOT EXISTS approved_by UUID REFERENCES auth.users(id) DEFAULT NULL;

-- Create partner_applications table
CREATE TABLE IF NOT EXISTS public.partner_applications (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL,
    mobile TEXT NOT NULL,
    city TEXT NOT NULL,
    partner_type TEXT NOT NULL,
    company_name TEXT,
    status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Enable RLS
ALTER TABLE public.partner_applications ENABLE ROW LEVEL SECURITY;

-- Policies for partner_applications
-- Users can insert their own application
CREATE POLICY "Users can insert their own applications" 
ON public.partner_applications FOR INSERT 
WITH CHECK (auth.uid() = user_id);

-- Users can view their own application
CREATE POLICY "Users can view their own applications" 
ON public.partner_applications FOR SELECT 
USING (auth.uid() = user_id);

-- Admins can view all applications
CREATE POLICY "Admins can view all applications" 
ON public.partner_applications FOR SELECT 
USING (
    EXISTS (
        SELECT 1 FROM public.users
        WHERE users.id = auth.uid() AND users.role = 'admin'
    )
);

-- Admins can update applications
CREATE POLICY "Admins can update applications" 
ON public.partner_applications FOR UPDATE 
USING (
    EXISTS (
        SELECT 1 FROM public.users
        WHERE users.id = auth.uid() AND users.role = 'admin'
    )
);

-- Note: In a real environment, you might want to create a trigger or handle the 
-- users table update from your application code when an admin approves an application.
-- Since the application will do it via Supabase client, the admin needs UPDATE rights on public.users.
-- Our existing public.users policies might only allow self-update. 
-- We should ensure admins can update the users table.

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE tablename = 'users' AND policyname = 'Admins can update all users'
    ) THEN
        CREATE POLICY "Admins can update all users" 
        ON public.users FOR UPDATE 
        USING (
            EXISTS (
                SELECT 1 FROM public.users admins 
                WHERE admins.id = auth.uid() AND admins.role = 'admin'
            )
        );
    END IF;
END $$;
