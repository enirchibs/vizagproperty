-- Migration: Create Property Contact Leads Table for Phone Call & WhatsApp Analytics
CREATE TABLE IF NOT EXISTS public.property_contact_leads (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    property_id UUID REFERENCES public.properties(id) ON DELETE SET NULL,
    property_title TEXT,
    target_phone TEXT NOT NULL,
    contact_type TEXT NOT NULL CHECK (contact_type IN ('call', 'whatsapp')),
    user_id UUID REFERENCES auth.users(id) ON DELETE SET NULL,
    user_email TEXT,
    source TEXT DEFAULT 'website',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE public.property_contact_leads ENABLE ROW LEVEL SECURITY;

-- Allow public and authenticated users to insert call lead records
CREATE POLICY "Allow public lead inserts" ON public.property_contact_leads
    FOR INSERT WITH CHECK (true);

-- Allow admins and owners read access
CREATE POLICY "Allow admin read access" ON public.property_contact_leads
    FOR SELECT USING (true);
