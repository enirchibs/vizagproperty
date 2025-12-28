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
    console.error("Error:", error);
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

  // Vizag-first city detection with aliases and keyword variations
  const vizagAliases = [
    'vizag', 'visakhapatnam', 'vskp', 'vishakhapatnam', 'vishakapatnam',
    'vizag real estate', 'vizag property', 'vizag plots', 'vizag colony'
  ];
  const hasVizagMention = vizagAliases.some(alias => lowerMessage.includes(alias));

  const otherCities = ['bangalore', 'bengaluru', 'mumbai', 'delhi', 'pune', 'hyderabad', 'chennai', 'kolkata'];
  const hasOtherCity = otherCities.some(city => lowerMessage.includes(city));

  if (hasVizagMention || !hasOtherCity) {
    criteria.city = 'Visakhapatnam';
  } else {
    for (const city of otherCities) {
      if (lowerMessage.includes(city)) {
        criteria.city = city.charAt(0).toUpperCase() + city.slice(1);
        break;
      }
    }
  }

  // Vizag-first locations (HIGH PRIORITY)
  const vizagLocations = [
    'madhurawada', 'pm palem', 'kommadi', 'yendada', 'rushikonda', 'mvp colony',
    'dwaraka nagar', 'gajuwaka', 'pedagantyada', 'akkayyapalem', 'seethammadhara',
    'cbm compound', 'kapuluppada', 'bheemunipatnam', 'anandapuram', 'pendurthi',
    'nad junction', 'au college', 'asilmetta', 'kirlampudi', 'chinagadili'
  ];

  // Check Vizag locations first
  for (const location of vizagLocations) {
    if (lowerMessage.includes(location)) {
      criteria.location = location.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
      criteria.city = 'Visakhapatnam';
      break;
    }
  }

  // Check other city locations only if no Vizag location found
  if (!criteria.location) {
    const otherLocations = [
      'whitefield', 'koramangala', 'indiranagar', 'hsr layout', 'marathahalli', 'electronic city', 'btm',
      'gachibowli', 'hitec city', 'madhapur', 'kondapur', 'kukatpally', 'banjara hills', 'jubilee hills'
    ];
    for (const location of otherLocations) {
      if (lowerMessage.includes(location)) {
        criteria.location = location.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');
        break;
      }
    }
  }

  const lakhMatch = lowerMessage.match(/(\d+)\s*lakh/);
  if (lakhMatch) {
    const lakhs = parseInt(lakhMatch[1]);
    if (lowerMessage.includes('under') || lowerMessage.includes('below') || lowerMessage.includes('less than')) {
      criteria.maxPrice = lakhs * 100000;
    } else if (lowerMessage.includes('above') || lowerMessage.includes('more than') || lowerMessage.includes('over')) {
      criteria.minPrice = lakhs * 100000;
    } else {
      criteria.maxPrice = lakhs * 100000;
    }
  }

  const croreMatch = lowerMessage.match(/(\d+)\s*crore/);
  if (croreMatch) {
    const crores = parseInt(croreMatch[1]);
    if (lowerMessage.includes('under') || lowerMessage.includes('below') || lowerMessage.includes('less than')) {
      criteria.maxPrice = crores * 10000000;
    } else if (lowerMessage.includes('above') || lowerMessage.includes('more than') || lowerMessage.includes('over')) {
      criteria.minPrice = crores * 10000000;
    } else {
      criteria.maxPrice = crores * 10000000;
    }
  }

  // Property type with high-intent keyword variations
  if (lowerMessage.includes('flat') || lowerMessage.includes('apartment') || lowerMessage.includes('flats for sale') || lowerMessage.includes('flats for rent')) {
    criteria.propertyType = 'apartment';
  }
  if (lowerMessage.includes('villa') || lowerMessage.includes('bungalow') || lowerMessage.includes('villas for sale') || lowerMessage.includes('independent villa')) {
    criteria.propertyType = 'villa';
  }
  if (lowerMessage.includes('house') || lowerMessage.includes('independent house') || lowerMessage.includes('house for sale')) {
    criteria.propertyType = 'house';
  }
  if (lowerMessage.includes('plot') || lowerMessage.includes('land') || lowerMessage.includes('open plot') ||
      lowerMessage.includes('plots for sale') || lowerMessage.includes('residential plot') ||
      lowerMessage.includes('gated community plot')) {
    criteria.propertyType = 'plot';
  }
  if (lowerMessage.includes('commercial') || lowerMessage.includes('commercial property')) {
    criteria.propertyType = 'commercial';
  }
  if (lowerMessage.includes('penthouse')) {
    criteria.propertyType = 'penthouse';
  }
  if (lowerMessage.includes('farmhouse') || lowerMessage.includes('farm house')) {
    criteria.propertyType = 'farmhouse';
  }

  // Listing type detection
  if (lowerMessage.includes('rent') || lowerMessage.includes('lease') || lowerMessage.includes('for rent')) {
    criteria.listingType = 'rent';
  }
  if (lowerMessage.includes('buy') || lowerMessage.includes('sale') || lowerMessage.includes('purchase') ||
      lowerMessage.includes('for sale')) {
    criteria.listingType = 'sale';
  }

  return criteria;
}

// Check if user query contains Vizag-specific intent and high-priority keywords
function hasVizagIntent(message: string): { isVizagFocused: boolean; keywords: string[] } {
  const lowerMessage = message.toLowerCase();
  const vizagKeywords = [
    'vmrda', 'it sez', 'it corridor', 'nh-16', 'nh16', 'national highway',
    'it area', 'tech park', 'fintech', 'cyber towers',
    'gated community', 'real estate prices', 'colony', 'open plots',
    'residential property', 'independent house', 'plots in gated community'
  ];

  const matchedKeywords = vizagKeywords.filter(kw => lowerMessage.includes(kw));
  return {
    isVizagFocused: matchedKeywords.length > 0,
    keywords: matchedKeywords
  };
}

async function searchProperties(criteria: PropertySearchCriteria, supabase: any) {
  let query = supabase
    .from('properties')
    .select('*')
    .eq('status', 'available')
    .order('created_at', { ascending: false })
    .limit(5);

  if (criteria.bedrooms) {
    query = query.eq('bedrooms', criteria.bedrooms);
  }
  if (criteria.city) {
    query = query.ilike('city', `%${criteria.city}%`);
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

  if (error) {
    console.error('Database error:', error);
    return [];
  }

  return data || [];
}

async function callGeminiAPI(userMessage: string, context: string): Promise<string> {
  try {
    const apiKey = Deno.env.get('GEMINI_API_KEY');
    if (!apiKey) {
      console.log('No Gemini API key found, using fallback responses');
      return '';
    }

    const response = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=${apiKey}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        contents: [{
          parts: [{
            text: `You are VizagProperty Expert, a local real estate assistant specializing in Visakhapatnam (Vizag) properties.

PRIMARY CITY: Visakhapatnam (Vizag/VSKP)
EXPERTISE: Vizag real estate - plots for sale, flats, villas, houses, VMRDA-approved properties

HIGH-INTENT KEYWORDS TO RECOGNIZE:
- "vizag real estate", "vizag plots for sale", "vizag plots"
- "vizag house for sale", "vizag flats for sale", "vizag villas for sale"
- "vizag real estate prices", "vizag colony"
- "open plots in vizag", "gated community plots", "residential property"
- "independent house", "plots in gated community"

LOCAL KNOWLEDGE:
- Key areas: Madhurawada, PM Palem, Kommadi, Yendada, MVP Colony, Gajuwaka
- IT corridor: Near IT SEZ Madhurawada
- Approval authority: VMRDA (NOT CRDA)
- Major landmarks: NH-16, Rushikonda Beach, AU College, NAD Junction

RESPONSE RULES:
- Short, clear, conversational (2-3 sentences max)
- ALWAYS assume Vizag context unless user says otherwise
- Use high-intent keywords naturally: "vizag plots for sale", "vizag real estate prices", "gated community"
- Use local terminology: "VMRDA-approved", "open plots", "residential property"
- Mention nearby landmarks when relevant (IT SEZ, schools, NH-16)
- Be honest about what you know and don't know
- NEVER suggest CRDA or mention Amaravathi unless asked
- NEVER make up property details

SMART CLARIFICATIONS (when needed):
- "Looking for VMRDA-approved plots or open plots?"
- "Want gated community or independent layout?"
- "What's your budget range for vizag real estate?"

${context}

User: ${userMessage}`
          }]
        }],
        generationConfig: {
          temperature: 0.7,
          maxOutputTokens: 300,
        }
      }),
    });

    if (!response.ok) {
      console.error('Gemini API error:', await response.text());
      return '';
    }

    const data = await response.json();
    return data.candidates?.[0]?.content?.parts?.[0]?.text || '';
  } catch (error) {
    console.error('Error calling Gemini API:', error);
    return '';
  }
}

async function generateResponse(message: string, supabase: any): Promise<{ response: string; properties?: any[] }> {
  const lowerMessage = message.toLowerCase();

  if (lowerMessage.includes('hello') || lowerMessage.includes('hi')) {
    const aiResponse = await callGeminiAPI(
      message,
      "The user is greeting you. Introduce yourself as VizagProperty Expert specializing in Vizag real estate. Keep it short, welcoming, and local."
    );

    return {
      response: aiResponse || "Hello! I'm your VizagProperty Expert. I help you find vizag plots for sale, flats, villas & houses in Visakhapatnam. Try asking: 'Vizag plots for sale under 30 lakhs' or 'VMRDA approved plots near IT area'!"
    };
  }

  if (lowerMessage.includes('thank')) {
    const aiResponse = await callGeminiAPI(
      message,
      "The user is thanking you. Respond warmly in local context."
    );

    return {
      response: aiResponse || "You're welcome! Happy property hunting in Vizag! Feel free to ask about more properties anytime."
    };
  }

  if (lowerMessage.includes('how') || lowerMessage.includes('help')) {
    const aiResponse = await callGeminiAPI(
      message,
      "The user wants to know how you can help. Explain you specialize in Vizag real estate with local knowledge of areas, VMRDA approvals, and high-intent keywords."
    );

    return {
      response: aiResponse || "I help you find vizag real estate - plots for sale, flats, villas & houses! Tell me what you're looking for like 'open plots in vizag', 'gated community plots under 25 lakhs', or 'vizag house for sale near IT area'. I know all the local areas!"
    };
  }

  const criteria = extractSearchCriteria(message);
  const hasCriteria = Object.keys(criteria).length > 0;

  const vizagIntent = hasVizagIntent(message);

  if (hasCriteria) {
    const properties = await searchProperties(criteria, supabase);

    if (properties.length > 0) {
      const details = [];
      if (criteria.bedrooms) details.push(`${criteria.bedrooms} BHK`);
      if (criteria.propertyType) details.push(criteria.propertyType);
      if (criteria.listingType) details.push(`for ${criteria.listingType}`);
      if (criteria.city || criteria.location) details.push(`in ${criteria.location || criteria.city}`);
      if (criteria.maxPrice) {
        const priceInLakhs = criteria.maxPrice / 100000;
        details.push(priceInLakhs >= 100 ? `under ${priceInLakhs/10} crore` : `under ${priceInLakhs} lakhs`);
      }

      const isVizagSearch = criteria.city === 'Visakhapatnam';
      let localContext = '';

      if (isVizagSearch && vizagIntent.keywords.length > 0) {
        localContext = ` User mentioned: ${vizagIntent.keywords.join(', ')}. Highlight relevant features like VMRDA approval, gated community, open plots, or real estate prices.`;
      } else if (isVizagSearch) {
        localContext = ' These are vizag real estate properties. Mention local advantages briefly if relevant.';
      }

      const propertyContext = `Found ${properties.length} properties matching: ${details.join(', ')}. Properties: ${properties.map(p => `${p.title} in ${p.location}`).join(', ')}.${localContext}`;

      const aiResponse = await callGeminiAPI(
        message,
        `${propertyContext} Respond with excitement. Use high-intent keywords if Vizag properties. Keep conversational. Remind them to tap properties for details.`
      );

      return {
        response: aiResponse || `Great! Found ${properties.length} ${isVizagSearch ? 'vizag real estate' : ''} properties matching ${details.join(', ')}. Tap any property to see full details with photos and location!`,
        properties
      };
    } else {
      const details = [];
      if (criteria.bedrooms) details.push(`${criteria.bedrooms} BHK`);
      if (criteria.propertyType) details.push(criteria.propertyType);
      if (criteria.city || criteria.location) details.push(`in ${criteria.location || criteria.city}`);
      if (criteria.maxPrice) {
        const priceInLakhs = criteria.maxPrice / 100000;
        details.push(priceInLakhs >= 100 ? `under ${priceInLakhs/10} crore` : `under ${priceInLakhs} lakhs`);
      }

      const isVizagSearch = criteria.city === 'Visakhapatnam';
      const noResultContext = `No properties found for: ${details.join(', ')}.${isVizagSearch ? ' This is a Vizag search.' : ''}`;

      const aiResponse = await callGeminiAPI(
        message,
        `${noResultContext} Apologize warmly. ${isVizagSearch ? 'Suggest nearby Vizag areas like Madhurawada, PM Palem, Yendada, or' : 'Suggest'} adjusting budget/location. Be helpful.`
      );

      return {
        response: aiResponse || `No properties found matching ${details.join(', ')} right now.${isVizagSearch ? ' Try nearby areas like Madhurawada, PM Palem, or Yendada, or' : ' Try'} adjusting your budget or requirements!`
      };
    }
  }

  const aiResponse = await callGeminiAPI(
    message,
    "The user's message doesn't have clear search criteria. Encourage them to tell you what they're looking for. Use high-intent examples: 'vizag plots for sale under 30 lakhs', 'open plots in gated community', 'vizag house for sale near IT area'."
  );

  return {
    response: aiResponse || "Tell me what you're looking for in Vizag! Try: 'Vizag plots for sale under 30 lakhs', 'Open plots in gated community', or 'Vizag house for sale near IT area'. I know all the local areas and vizag real estate prices!"
  };
}
