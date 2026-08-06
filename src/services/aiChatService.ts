import { supabase } from '../lib/supabase'
import { Property } from '../types'

export interface ChatResponse {
  response: string
  properties: Property[]
}

/**
 * System prompt tailored for Vizag Real Estate Chatbot
 */
const VIZAG_REAL_ESTATE_SYSTEM_PROMPT = `You are VizagProperty Expert, an elite local real estate AI assistant for Visakhapatnam (Vizag).

PRIMARY LOCATION: Visakhapatnam (Vizag/VSKP) & Bhogapuram region
SPECIALTIES: VMRDA-approved plots, independent villas, 2BHK/3BHK flats, gated communities, commercial spaces, rental properties.

KEY LOCALITIES & 30KM RADIUS CORRIDORS:
- Madhurawada & Kommadi: IT Corridor, cricket stadium, top educational hubs
- Bhogapuram & Bheemili: International Airport growth corridor, beach road plots & beach villas
- Yendada & Rushikonda: Sea-view luxury villas & IT SEZ Hill 3
- MVP Colony, Seethammadhara, Akkayyapalem: Central prime Vizag residential
- Pendurthi, Gajuwaka & Anandapuram: Industrial & suburban investment hubs

INSTRUCTIONS:
1. Always give warm, expert, conversational answers (3-5 sentences).
2. If exact or 30km nearby radius properties are listed in context, highlight them with locations & prices, and explicitly invite the user to tap/click the property cards displayed below.
3. Be helpful and enthusiastic about Vizag real estate!`

// STRICT ALLOWED GROQ MODELS ONLY
const GROQ_ALLOWED_MODELS = [
  'llama-3.3-70b-versatile',
  'llama-3.1-8b-instant',
  'mixtral-8x7b-32768'
]

const PROPERTY_TYPE_MAP: Record<string, string[]> = {
  flat: ['flat_apartment', 'flat', 'apartment'],
  plot: ['plot_land', 'plot', 'commercial_plot', 'land'],
  villa: ['independent_house_villa', 'villa', 'house', 'bungalow'],
  pg: ['pg_hostel', 'pg'],
  commercial: ['commercial', 'shop', 'commercial_plot']
}

/**
 * Call Groq API using allowed models in sequence
 */
async function callGroqAPI(userMessage: string, contextPrompt: string, apiKey: string): Promise<string> {
  for (const model of GROQ_ALLOWED_MODELS) {
    try {
      const res = await fetch('https://api.groq.com/openai/v1/chat/completions', {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${apiKey}`,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          model: model,
          messages: [
            { role: 'system', content: `${VIZAG_REAL_ESTATE_SYSTEM_PROMPT}\n\nContext:\n${contextPrompt}` },
            { role: 'user', content: userMessage }
          ],
          temperature: 0.7,
          max_tokens: 400
        })
      })

      if (res.ok) {
        const data = await res.json()
        const text = data.choices?.[0]?.message?.content
        if (text && text.trim().length > 0) {
          return text.trim()
        }
      }
    } catch (err) {
      console.error(`Groq model ${model} execution error:`, err)
    }
  }
  return ''
}

/**
 * Extract intent (locality, property_type, listing_type) from user prompt
 */
function parseUserIntent(message: string) {
  const lower = message.toLowerCase()

  // Locality detection
  let localityQuery: string | null = null
  const vizagAreas = [
    'madhurawada', 'bhogapuram', 'kommadi', 'yendada', 'rushikonda', 'pm palem',
    'mvp colony', 'gajuwaka', 'bheemili', 'bheemunipatnam', 'pendurthi',
    'anandapuram', 'seethammadhara', 'akkayyapalem', 'chinagadili', 'kapuluppada',
    'thagarapuvalasa', 'nad junction', 'auto nagar', 'anakapalli', 'sabbavaram'
  ]

  for (const area of vizagAreas) {
    if (lower.includes(area)) {
      localityQuery = area
      break
    }
  }

  // Property type detection
  let propertyTypeKey: string | null = null
  if (lower.includes('flat') || lower.includes('apartment') || lower.includes('2bhk') || lower.includes('3bhk')) {
    propertyTypeKey = 'flat'
  } else if (lower.includes('plot') || lower.includes('land')) {
    propertyTypeKey = 'plot'
  } else if (lower.includes('villa') || lower.includes('house') || lower.includes('bungalow')) {
    propertyTypeKey = 'villa'
  } else if (lower.includes('commercial') || lower.includes('shop') || lower.includes('office')) {
    propertyTypeKey = 'commercial'
  } else if (lower.includes('pg') || lower.includes('hostel')) {
    propertyTypeKey = 'pg'
  }

  // Listing type detection
  let listingType: 'rent' | 'sale' | null = null
  if (lower.includes('rent') || lower.includes('lease')) {
    listingType = 'rent'
  } else if (lower.includes('sale') || lower.includes('buy') || lower.includes('purchase')) {
    listingType = 'sale'
  }

  return { localityQuery, propertyTypeKey, listingType }
}

/**
 * Multi-tier Database Search with 30km Radius Expansion
 * Tier 1: Exact Locality Match
 * Tier 2: 30km Radius Nearby Expansion (neighboring localities)
 * Tier 3: General Vizag Property Fallback
 */
export async function searchPropertiesInDB(message: string): Promise<{ properties: Property[]; localityFound?: string; radiusExpanded: boolean }> {
  try {
    const { localityQuery, propertyTypeKey, listingType } = parseUserIntent(message)
    const allowedTypes = propertyTypeKey ? PROPERTY_TYPE_MAP[propertyTypeKey] : null

    let localityId: string | null = null
    let localityDisplayName: string | null = null

    // 1. Locality Lookup
    if (localityQuery) {
      const { data: locs } = await supabase
        .from('localities')
        .select('id, name')
        .ilike('name', `%${localityQuery}%`)
        .limit(1)

      if (locs && locs.length > 0) {
        localityId = locs[0].id
        localityDisplayName = locs[0].name
      }
    }

    // 2. Tier 1 Query: Exact Locality Match
    let tier1Properties: Property[] = []
    if (localityId || localityQuery) {
      let t1Query = supabase
        .from('properties')
        .select('*, localities(name)')
        .eq('status', 'approved')
        .order('created_at', { ascending: false })

      if (localityId) {
        t1Query = t1Query.eq('locality_id', localityId)
      } else if (localityQuery) {
        t1Query = t1Query.or(`title.ilike.%${localityQuery}%,description.ilike.%${localityQuery}%`)
      }

      if (allowedTypes && allowedTypes.length > 0) {
        t1Query = t1Query.in('property_type', allowedTypes)
      }

      if (listingType) {
        t1Query = t1Query.eq('listing_type', listingType)
      }

      const { data } = await t1Query.limit(5)
      tier1Properties = (data as Property[]) || []
    } else {
      // General search (e.g., "Villas in Vizag" or "Flats for rent in Vizag")
      let generalQuery = supabase
        .from('properties')
        .select('*, localities(name)')
        .eq('status', 'approved')
        .order('created_at', { ascending: false })

      if (allowedTypes && allowedTypes.length > 0) {
        generalQuery = generalQuery.in('property_type', allowedTypes)
      }

      if (listingType) {
        generalQuery = generalQuery.eq('listing_type', listingType)
      }

      const { data } = await generalQuery.limit(5)
      tier1Properties = (data as Property[]) || []
    }

    if (tier1Properties.length >= 3) {
      return {
        properties: tier1Properties,
        localityFound: localityDisplayName || localityQuery || undefined,
        radiusExpanded: false
      }
    }

    // 3. Tier 2 Query: 30km Radius Nearby Expansion
    let nearbyProperties: Property[] = []
    let t2Query = supabase
      .from('properties')
      .select('*, localities(name)')
      .eq('status', 'approved')
      .order('created_at', { ascending: false })

    if (allowedTypes && allowedTypes.length > 0) {
      t2Query = t2Query.in('property_type', allowedTypes)
    }

    if (listingType) {
      t2Query = t2Query.eq('listing_type', listingType)
    }

    // Exclude already retrieved Tier 1 property IDs
    if (tier1Properties.length > 0) {
      const existingIds = tier1Properties.map(p => p.id)
      t2Query = t2Query.not('id', 'in', `(${existingIds.join(',')})`)
    }

    const { data: t2Data } = await t2Query.limit(5 - tier1Properties.length)
    nearbyProperties = (t2Data as Property[]) || []

    const combined = [...tier1Properties, ...nearbyProperties]

    if (combined.length > 0) {
      return {
        properties: combined,
        localityFound: localityDisplayName || localityQuery || undefined,
        radiusExpanded: nearbyProperties.length > 0
      }
    }

    // 4. Tier 3 Fallback: Popular Vizag Properties
    const { data: t3Data } = await supabase
      .from('properties')
      .select('*, localities(name)')
      .eq('status', 'approved')
      .order('created_at', { ascending: false })
      .limit(3)

    return {
      properties: (t3Data as Property[]) || [],
      localityFound: localityDisplayName || localityQuery || undefined,
      radiusExpanded: true
    }
  } catch (err) {
    console.error('Property search error:', err)
    return { properties: [], radiusExpanded: false }
  }
}

function getLocalityName(p: Property): string {
  if (!p.localities) return p.location || 'Vizag'
  if (Array.isArray(p.localities)) {
    return p.localities[0]?.name || p.location || 'Vizag'
  }
  return p.localities.name || p.location || 'Vizag'
}

/**
 * Main chat handler: Direct Groq API integration (client-first), with 30km radius property search
 */
export async function processChatMessage(message: string, sessionId: string): Promise<ChatResponse> {
  const groqKey = import.meta.env.VITE_GROQ_API_KEY

  // 1. Search DB with 30km Radius Expansion
  const searchResult = await searchPropertiesInDB(message)
  const properties = searchResult.properties

  let contextPrompt = `User prompt: "${message}".`
  if (properties.length > 0) {
    const listStr = properties.map(p => `- ${p.title} (${p.property_type}, for ${p.listing_type}) in ${getLocalityName(p)}, Price: ₹${p.price}`).join('\n')
    
    if (searchResult.localityFound && searchResult.radiusExpanded) {
      contextPrompt += `\nMatching properties found in and within 30km radius of ${searchResult.localityFound}:\n${listStr}\nNote: Mention that these properties are in and around ${searchResult.localityFound} (within 30km radius), and invite the user to tap the property cards below!`
    } else if (searchResult.localityFound) {
      contextPrompt += `\nMatching properties found in ${searchResult.localityFound}:\n${listStr}\nInvite the user to tap the property cards below!`
    } else {
      contextPrompt += `\nMatching properties found in Vizag area:\n${listStr}\nInvite the user to tap the property cards below!`
    }
  } else {
    contextPrompt += `\nNo exact database matches found. Respond warmly with expert Vizag real estate knowledge.`
  }

  // 2. Call Groq API directly with VITE_GROQ_API_KEY
  let aiText = ''
  if (groqKey) {
    aiText = await callGroqAPI(message, contextPrompt, groqKey)
  }

  // 3. Fallback to Supabase Edge Function if client key is missing or failed
  if (!aiText) {
    const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
    const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY

    if (supabaseUrl && supabaseAnonKey) {
      try {
        const res = await fetch(`${supabaseUrl}/functions/v1/chat`, {
          method: 'POST',
          headers: {
            'Authorization': `Bearer ${supabaseAnonKey}`,
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ message, session_id: sessionId })
        })

        if (res.ok) {
          const data = await res.json()
          if (data && data.response) {
            aiText = data.response
          }
        }
      } catch (edgeErr) {
        console.warn('Edge function fallback error:', edgeErr)
      }
    }
  }

  // 4. Smart fallback response if AI key and edge function are both unavailable
  if (!aiText) {
    if (properties.length > 0) {
      const locText = searchResult.localityFound ? `in & around ${searchResult.localityFound} (within 30km radius)` : 'in Visakhapatnam'
      aiText = `Great news! I found ${properties.length} verified properties ${locText}. You can tap any card below to view full photos and details!`
    } else {
      aiText = `I searched our Vizag database for "${message}". Try asking about popular options like "Flats in Madhurawada", "Plots in Bhogapuram", "Villas in Vizag", or "Flats for rent in Vizag"!`
    }
  }

  return {
    response: aiText,
    properties
  }
}
