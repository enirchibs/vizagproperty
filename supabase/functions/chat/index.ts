import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.39.3";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

interface PropertySearchCriteria {
  bedrooms?: number;
  city?: string;
  location?: string;
  minPrice?: number;
  maxPrice?: number;
  propertyType?: string;
  listingType?: string;
}

const SYSTEM_PROMPT = `You are VizagProperty Expert, a specialized local real estate AI assistant for Visakhapatnam (Vizag), Andhra Pradesh, India.

LOCALITY & DOMAIN KNOWLEDGE:
- Primary City: Visakhapatnam (Vizag)
- Approval Authority: VMRDA (Visakhapatnam Metropolitan Region Development Authority) - ALWAYS use VMRDA (NOT CRDA/Amaravati)
- High-demand areas: Madhurawada, PM Palem, Kommadi, Yendada, Rushikonda (IT Corridor & Beach Road)
- Central Prime areas: MVP Colony, Seethammadhara, Akkayyapalem, Dwaraka Nagar, CBM Compound
- Industrial/South: Gajuwaka, Pedagantyada, Kurmannapalem, Steel Plant
- Growth Corridors: Pendurthi, Anandapuram, Kapuluppada, Bheemunipatnam (Bheemili)
- Major Landmarks: NH-16 Highway, Rushikonda Beach, IT SEZ Hill 3, AU College, NAD Junction

INSTRUCTIONS:
1. Respond concisely (2-4 sentences max).
2. Keep responses warm, professional, and Vizag-focused.
3. If property listings are provided in context, invite the user to tap/click property cards below.`;

// STRICT ALLOWED MODELS ONLY
const ALLOWED_MODELS = [
  'llama-3.3-70b-versatile',
  'llama-3.1-8b-instant',
  'mixtral-8x7b-32768'
];

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    });
  }

  try {
    const { message, session_id } = await req.json();

    if (!message) {
      return new Response(
        JSON.stringify({ error: "Message is required" }),
        {
          status: 400,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
    const supabaseKey = Deno.env.get("SUPABASE_ANON_KEY")!;
    const supabase = createClient(supabaseUrl, supabaseKey);

    const { response, properties } = await generateResponse(message, supabase);

    return new Response(
      JSON.stringify({ response, properties, session_id }),
      {
        status: 200,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  } catch (error) {
    console.error("Error in chat edge function:", error);
    return new Response(
      JSON.stringify({ error: "Internal server error" }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});

function extractSearchCriteria(message: string): PropertySearchCriteria {
  const lowerMessage = message.toLowerCase();
  const criteria: PropertySearchCriteria = {};

  const bhkMatch = lowerMessage.match(/(\d+)\s*bhk/);
  if (bhkMatch) {
    criteria.bedrooms = parseInt(bhkMatch[1]);
  }

  criteria.city = 'Visakhapatnam';

  const vizagLocations = [
    'madhurawada', 'pm palem', 'kommadi', 'yendada', 'rushikonda', 'mvp colony',
    'dwaraka nagar', 'gajuwaka', 'pedagantyada', 'akkayyapalem', 'seethammadhara',
    'cbm compound', 'kapuluppada', 'bheemunipatnam', 'anandapuram', 'pendurthi',
    'nad junction', 'au college', 'asilmetta', 'kirlampudi', 'chinagadili'
  ];

  for (const loc of vizagLocations) {
    if (lowerMessage.includes(loc)) {
      criteria.location = loc.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
      break;
    }
  }

  const lakhMatch = lowerMessage.match(/(\d+)\s*(?:lakh|lakhs|l)/);
  if (lakhMatch) {
    const lakhs = parseInt(lakhMatch[1]);
    if (lowerMessage.includes('under') || lowerMessage.includes('below') || lowerMessage.includes('less than')) {
      criteria.maxPrice = lakhs * 100000;
    } else if (lowerMessage.includes('above') || lowerMessage.includes('more than')) {
      criteria.minPrice = lakhs * 100000;
    } else {
      criteria.maxPrice = lakhs * 100000;
    }
  }

  const croreMatch = lowerMessage.match(/(\d+)\s*(?:crore|crores|cr)/);
  if (croreMatch) {
    const crores = parseInt(croreMatch[1]);
    if (lowerMessage.includes('under') || lowerMessage.includes('below') || lowerMessage.includes('less than')) {
      criteria.maxPrice = crores * 10000000;
    } else if (lowerMessage.includes('above') || lowerMessage.includes('more than')) {
      criteria.minPrice = crores * 10000000;
    } else {
      criteria.maxPrice = crores * 10000000;
    }
  }

  if (lowerMessage.includes('flat') || lowerMessage.includes('apartment')) {
    criteria.propertyType = 'flat';
  } else if (lowerMessage.includes('villa') || lowerMessage.includes('bungalow')) {
    criteria.propertyType = 'villa';
  } else if (lowerMessage.includes('plot') || lowerMessage.includes('land')) {
    criteria.propertyType = 'plot';
  } else if (lowerMessage.includes('commercial') || lowerMessage.includes('shop') || lowerMessage.includes('office')) {
    criteria.propertyType = 'commercial';
  }

  if (lowerMessage.includes('rent') || lowerMessage.includes('lease')) {
    criteria.listingType = 'rent';
  } else if (lowerMessage.includes('buy') || lowerMessage.includes('sale') || lowerMessage.includes('purchase')) {
    criteria.listingType = 'sale';
  }

  return criteria;
}

async function searchProperties(criteria: PropertySearchCriteria, supabase: any) {
  let query = supabase
    .from('properties')
    .select('*')
    .eq('status', 'approved')
    .order('created_at', { ascending: false })
    .limit(5);

  if (criteria.bedrooms) {
    query = query.eq('bedrooms', criteria.bedrooms);
  }
  if (criteria.location) {
    query = query.ilike('location', `%${criteria.location}%`);
  }
  if (criteria.minPrice) {
    query = query.gte('price', criteria.minPrice);
  }
  if (criteria.maxPrice) {
    query = query.lte('price', criteria.maxPrice);
  }
  if (criteria.propertyType) {
    query = query.eq('property_type', criteria.propertyType);
  }
  if (criteria.listingType) {
    query = query.eq('listing_type', criteria.listingType);
  }

  const { data, error } = await query;

  if (error || !data || data.length === 0) {
    // If no exact criteria match, fetch top featured properties
    const { data: topData } = await supabase
      .from('properties')
      .select('*')
      .eq('status', 'approved')
      .order('views_count', { ascending: false })
      .limit(3);
    return topData || [];
  }

  return data;
}

/**
 * Call Groq API strictly using only the specified models:
 * 1. llama-3.3-70b-versatile
 * 2. llama-3.1-8b-instant
 * 3. mixtral-8x7b-32768
 */
async function callGroqAPI(userMessage: string, contextPrompt: string): Promise<string> {
  const groqApiKey = Deno.env.get('GROQ_API_KEY') || Deno.env.get('VITE_GROQ_API_KEY');
  if (!groqApiKey) return '';

  for (const model of ALLOWED_MODELS) {
    try {
      const response = await fetch('https://api.groq.com/openai/v1/chat/completions', {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${groqApiKey}`,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          model: model,
          messages: [
            { role: 'system', content: `${SYSTEM_PROMPT}\n\n${contextPrompt}` },
            { role: 'user', content: userMessage }
          ],
          temperature: 0.7,
          max_tokens: 300,
        }),
      });

      if (response.ok) {
        const data = await response.json();
        const content = data.choices?.[0]?.message?.content;
        if (content) return content;
      } else {
        console.warn(`Groq model ${model} returned error status ${response.status}, trying next model...`);
      }
    } catch (err) {
      console.error(`Groq model ${model} call error:`, err);
    }
  }

  return '';
}

async function generateResponse(message: string, supabase: any): Promise<{ response: string; properties?: any[] }> {
  const criteria = extractSearchCriteria(message);
  const properties = await searchProperties(criteria, supabase);

  let contextPrompt = '';
  if (properties.length > 0) {
    contextPrompt = `Found ${properties.length} relevant properties in Vizag: ${properties.map(p => `${p.title} in ${p.location} (₹${p.price})`).join(', ')}. Invite user to click property cards below.`;
  } else {
    contextPrompt = `No specific properties matched the query. Suggest popular Vizag areas like Madhurawada, PM Palem, MVP Colony, or adjusting budget.`;
  }

  // Call Groq API strictly using allowed models
  let aiText = await callGroqAPI(message, contextPrompt);

  // Local Template Fallback if Groq API key is missing or failed
  if (!aiText) {
    if (properties.length > 0) {
      aiText = `Great news! I found ${properties.length} verified properties matching your query in Visakhapatnam. Check out the property cards below for photos, pricing, and details!`;
    } else {
      aiText = `Welcome to VizagProperty! I'm here to help you find plots, flats, and villas across Visakhapatnam. Try asking: "Plots in Madhurawada under 30L" or "VMRDA approved plots near IT area"!`;
    }
  }

  return { response: aiText, properties };
}
