import { supabase } from './supabase'
import { trackEvent } from './analytics'
import { VIZAG_PROPERTY_PHONE } from '../config/contact'

export interface CallLeadRecord {
  id: string
  property_id?: string | null
  property_title?: string | null
  target_phone: string
  contact_type: 'call' | 'whatsapp'
  user_id?: string | null
  user_email?: string | null
  source: string
  created_at: string
}

const LOCAL_STORAGE_CALL_LEADS_KEY = 'vizagproperty_call_leads_v2'

/**
 * Get all call leads saved in localStorage
 */
export function getLocalCallLeads(): CallLeadRecord[] {
  try {
    const raw = localStorage.getItem(LOCAL_STORAGE_CALL_LEADS_KEY)
    if (!raw) return []
    return JSON.parse(raw) as CallLeadRecord[]
  } catch (err) {
    return []
  }
}

/**
 * Save lead into local storage
 */
function saveLocalCallLead(lead: CallLeadRecord) {
  try {
    const existing = getLocalCallLeads()
    const updated = [lead, ...existing].slice(0, 500)
    localStorage.setItem(LOCAL_STORAGE_CALL_LEADS_KEY, JSON.stringify(updated))
  } catch (err) {
    console.warn('Could not save lead to localStorage:', err)
  }
}

/**
 * Track a Phone Call or WhatsApp Click Event across the platform
 */
export async function trackCallOrWhatsAppLead(params: {
  property_id?: string
  property_title?: string
  target_phone?: string
  contact_type: 'call' | 'whatsapp'
  user_id?: string
  user_email?: string
  source?: string
}) {
  const targetPhone = params.target_phone || VIZAG_PROPERTY_PHONE
  const source = params.source || 'website'
  const title = params.property_title || 'General Platform Lead'
  const timestamp = new Date().toISOString()

  // 1. Trigger Google Analytics Event
  trackEvent({
    event: params.contact_type === 'call' ? 'phone_call_initiated' : 'whatsapp_lead_initiated',
    category: 'Lead Contact',
    label: `${params.contact_type.toUpperCase()}: ${title} (${targetPhone})`,
    property_id: params.property_id,
    target_phone: targetPhone,
    source,
  })

  // 2. Build lead record object
  const leadRecord: CallLeadRecord = {
    id: `lead_${Date.now()}_${Math.random().toString(36).substring(2, 7)}`,
    property_id: params.property_id || null,
    property_title: title,
    target_phone: targetPhone,
    contact_type: params.contact_type,
    user_id: params.user_id || null,
    user_email: params.user_email || null,
    source,
    created_at: timestamp,
  }

  // 3. Save locally
  saveLocalCallLead(leadRecord)

  // 4. Async sync to Supabase table (property_contact_leads)
  try {
    await supabase.from('property_contact_leads').insert({
      property_id: params.property_id || null,
      property_title: title,
      target_phone: targetPhone,
      contact_type: params.contact_type,
      user_id: params.user_id || null,
      user_email: params.user_email || null,
      source: source,
      created_at: timestamp,
    })
  } catch (err) {
    // Local storage persistence serves as fallback
  }
}

/**
 * Fetch complete Call Analytics stats for Admin Dashboard & Property Owners
 */
export async function fetchCallAnalyticsStats() {
  let dbLeads: CallLeadRecord[] = []

  // Try fetching from Supabase database table
  try {
    const { data, error } = await supabase
      .from('property_contact_leads')
      .select('*')
      .order('created_at', { ascending: false })
      .limit(500)

    if (!error && data && data.length > 0) {
      dbLeads = data as CallLeadRecord[]
    }
  } catch (err) {
    // Database query fallback
  }

  const localLeads = getLocalCallLeads()

  // Deduplicate and merge by ID/timestamp
  const leadMap = new Map<string, CallLeadRecord>()
  localLeads.forEach(l => leadMap.set(l.id || l.created_at, l))
  dbLeads.forEach(l => leadMap.set(l.id || l.created_at, l))

  const allLeads = Array.from(leadMap.values()).sort(
    (a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime()
  )

  const totalCalls = allLeads.filter(l => l.contact_type === 'call').length
  const totalWhatsApps = allLeads.filter(l => l.contact_type === 'whatsapp').length
  const totalLeads = allLeads.length

  // Compute property specific stats
  const propertyStats: Record<string, { callCount: number; whatsappCount: number; total: number; title: string; lastLeadAt: string }> = {}

  allLeads.forEach(l => {
    const propKey = l.property_id || 'general'
    if (!propertyStats[propKey]) {
      propertyStats[propKey] = {
        callCount: 0,
        whatsappCount: 0,
        total: 0,
        title: l.property_title || 'General Platform Inquiry',
        lastLeadAt: l.created_at,
      }
    }
    if (l.contact_type === 'call') {
      propertyStats[propKey].callCount++
    } else {
      propertyStats[propKey].whatsappCount++
    }
    propertyStats[propKey].total++
  })

  return {
    totalCalls,
    totalWhatsApps,
    totalLeads,
    allLeads,
    propertyStats,
  }
}
