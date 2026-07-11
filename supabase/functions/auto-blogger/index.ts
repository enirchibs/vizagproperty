import { createClient } from "npm:@supabase/supabase-js"

// 1. Define hyper-local search queries for the Google News RSS Feed
const TOPICS = [
  "vizag real estate projects",
  "visakhapatnam metro rail",
  "vizag it companies growth",
  "vizag cinema halls multiplexes",
  "vizag new showrooms openings",
  "bhogapuram airport construction update",
  "vizag new roads flyovers",
  "vizag steelplant status",
  "vizag pharma city parawada",
  "visakhapatnam smart city projects",
  "andhra pradesh real estate news"
];

Deno.serve(async (req) => {
  try {
    // 2. Shuffle topics to try them in random order until we find news
    const shuffledTopics = [...TOPICS].sort(() => 0.5 - Math.random());
    
    let query = '';
    let newsTitle = '';
    let newsSnippet = '';
    
    for (const topic of shuffledTopics) {
      // Google News RSS endpoint configured for Telugu (India)
      const rssUrl = `https://news.google.com/rss/search?q=${encodeURIComponent(topic)}&hl=te&gl=IN&ceid=IN:te`;
      const rssResponse = await fetch(rssUrl);
      const xmlData = await rssResponse.text();

      // 3. Extract the top news headline and description using native string parsing
      const itemStart = xmlData.indexOf('<item>');
      const itemEnd = xmlData.indexOf('</item>', itemStart);
      
      if (itemStart !== -1 && itemEnd !== -1) {
        query = topic;
        const firstItem = xmlData.substring(itemStart, itemEnd);
        const titleMatch = firstItem.match(/<title>(.*?)<\/title>/);
        const descMatch = firstItem.match(/<description>(.*?)<\/description>/);
        
        newsTitle = titleMatch ? titleMatch[1].replace(/<!\[CDATA\[(.*?)\]\]>/g, '$1') : query;
        newsSnippet = descMatch ? descMatch[1].replace(/<!\[CDATA\[(.*?)\]\]>/g, '$1') : "";
        // Clean raw HTML out of the RSS description snippet
        newsSnippet = newsSnippet.replace(/<[^>]*>?/gm, ''); 
        break; // Found news, stop searching
      }
    }
    
    if (!query) {
      console.warn("Google RSS blocked or returned empty. Falling back to a predefined local topic...");
      const fallbackTopics = [
        {
          topic: "Bhogapuram International Airport Development",
          title: "Bhogapuram Airport Progress and Its Direct Impact on Vizag Real Estate",
          snippet: "The fast-tracked construction of Bhogapuram International Airport is creating massive real estate demand in northern Visakhapatnam corridors like Tagarapuvalasa, Bhogapuram, and Anandapuram."
        },
        {
          topic: "Vizag IT Corridor Expansion",
          title: "Visakhapatnam IT Corridor Growth: Residential Demand Surges in Madhurawada",
          snippet: "With major IT companies expanding operations in Madhurawada and Rushikonda, premium apartments and rental housing options are seeing unprecedented demand."
        },
        {
          topic: "VMRDA Approved Plots",
          title: "Why VMRDA Approved Plots are the Safest Investment Choice in Vizag",
          snippet: "Visakhapatnam Metropolitan Region Development Authority (VMRDA) layouts offer investors legal safety, guaranteed amenities, and high capital appreciation."
        },
        {
          topic: "Vizag Metro Rail Proposed Routes",
          title: "Proposed Vizag Metro Rail: Identifying the Next Real Estate Hotspots",
          snippet: "The upcoming Metro Rail project connecting Steel Plant to Bhogapuram is set to transform connectivity and property prices along the National Highway (NH16) corridor."
        },
        {
          topic: "Beach Road Luxury Real Estate",
          title: "Beach Road Development and the Rise of Luxury Coastal Living in Visakhapatnam",
          snippet: "Infrastructure projects along the scenic Vizag-Bheemili beach road are driving luxury residential villa projects and coastal holiday home investments."
        },
        {
          topic: "Vizag New Showrooms and Retail Growth",
          title: "Retail Boom in Visakhapatnam: New Showrooms and Commercial Hubs Redefining VIP Road and Gajuwaka",
          snippet: "The launch of premium lifestyle, jewelry, and automobile showrooms on VIP Road and Gajuwaka highlights the surging purchasing power and commercial real estate potential of Vizag."
        },
        {
          topic: "Vizag Cinema Halls and Entertainment Hubs",
          title: "New Multiplexes and Entertainment Centers Opening Across Visakhapatnam",
          snippet: "With new cinema halls and multiplexes launching in growing suburban zones, neighborhood entertainment hubs are boosting adjacent residential land prices."
        },
        {
          topic: "New Roads and Infrastructure Flyovers",
          title: "Road Infrastructure Upgrades: New Flyovers and Highway Expansions Easing Vizag Traffic",
          snippet: "The completion of major flyovers and highway expansions along the Anandapuram-Pendurthi-Anakapalli stretch is opening up new outskirts for housing developments."
        },
        {
          topic: "Vizag Steelplant Industrial Impact",
          title: "Vizag Steel Plant and Its Crucial Role in the Local Economy and Real Estate",
          snippet: "The industrial presence of the Visakhapatnam Steel Plant continues to sustain high residential demand in Gajuwaka, Kurmannapalem, and Duvvada areas."
        },
        {
          topic: "Pharma City Parawada Growth",
          title: "Jawaharlal Nehru Pharma City Parawada: Industrial Expansion and Housing Demand in Anakapalli District",
          snippet: "The expansion of pharma companies in Parawada is creating thousands of jobs, driving demand for affordable housing, rental apartments, and plots in Anakapalli and nearby suburbs."
        }
      ];
      
      const chosenFallback = fallbackTopics[Math.floor(Math.random() * fallbackTopics.length)];
      query = chosenFallback.topic;
      newsTitle = chosenFallback.title;
      newsSnippet = chosenFallback.snippet;
    }

    // 4. Initialize Google Gemini API
    const geminiApiKey = Deno.env.get('GEMINI_API_KEY');
    if (!geminiApiKey) throw new Error("GEMINI_API_KEY is missing in environment variables.");
    
    // 5. The strict Gemini Prompt: Rewriting news & injecting links
    const prompt = `
      You are an expert real estate and city development journalist based in Visakhapatnam (Vizag). 
      Here is the latest trending news (it might be in Telugu) regarding "${query}":
      
      Original Headline: ${newsTitle}
      News Summary: ${newsSnippet}
      
      Task: Translate the core news into English (if it's in Telugu) and rewrite this news into a highly engaging, SEO-optimized English blog article. Expand on how this specific news impacts the local real estate market, plot values, or property investments in Vizag.
      
      Strict Requirements:
      1. Write the entire article in ENGLISH. Format the output entirely in clean HTML. Do NOT wrap the response in markdown blocks (e.g., no \`\`\`html).
      2. Include a catchy <H1> title, followed by at least two <H2> subheadings.
      3. CRITICAL SEO LINKING: You MUST organically include at least 3 contextual HTML links pointing exactly to "https://vizagproperty.co.in/". 
         - Use natural anchor texts like "plots for sale in Vizag", "premium flats in Visakhapatnam", or "Vizag real estate investments".
         - Format example: <a href="https://vizagproperty.co.in/" class="text-blue-600 font-medium">plots for sale in Vizag</a>
      4. End with a strong Call to Action encouraging readers to visit the site to view verified properties.
    `;

    // Try a list of fallback models because Google restricts some models on free accounts
    const fallbackModels = [
      'gemini-1.5-flash',
      'gemini-1.5-flash-8b',
      'gemini-1.0-pro',
      'gemini-pro',
      'gemini-1.5-pro'
    ];
    
    let generatedHtml = '';
    let lastError = '';

    for (const modelName of fallbackModels) {
      const geminiUrl = `https://generativelanguage.googleapis.com/v1beta/models/${modelName}:generateContent?key=${geminiApiKey}`;
      
      const geminiResponse = await fetch(geminiUrl, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          contents: [{ parts: [{ text: prompt }] }],
          generationConfig: { temperature: 0.7 }
        })
      });

      if (!geminiResponse.ok) {
        lastError = await geminiResponse.text();
        continue; // Try the next model
      }

      const geminiData = await geminiResponse.json();
      generatedHtml = geminiData.candidates?.[0]?.content?.parts?.[0]?.text?.trim() || '';
      break; // Success! Stop looping.
    }

    if (!generatedHtml) {
      throw new Error(`Google API Rejected Key for ALL models. Last error: ${lastError}`);
    }

    // Fallback cleanup if Gemini includes markdown ticks anyway
    generatedHtml = generatedHtml.replace(/^```html\n?/, '').replace(/\n?```$/, '');

    // Extract the H1 for the database title row
    const h1Match = generatedHtml.match(/<h1[^>]*>(.*?)<\/h1>/i);
    const finalTitle = h1Match ? h1Match[1] : `Market Update: ${newsTitle}`;

    const slug = finalTitle
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/(^-|-$)+/g, '') + '-' + Date.now();

    const excerpt = generatedHtml.replace(/<[^>]*>?/gm, '').substring(0, 150) + '...';

    // 7. Save to Supabase Database
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
    );

    const { error } = await supabaseAdmin.from('blog_posts').insert({
      topic: query,
      title: finalTitle,
      content: generatedHtml,
      slug: slug,
      excerpt: excerpt,
      published: true,
      category: 'news',
      author_name: 'AI Autoblogger',
      reading_time_min: Math.ceil(generatedHtml.length / 1000)
    });

    if (error) throw error;

    return new Response(JSON.stringify({ success: true, topic: query, title: finalTitle }), {
      headers: { "Content-Type": "application/json" },
      status: 200,
    });

  } catch (err: any) {
    const errorMsg = err instanceof Error ? err.message : String(err);
    console.error("Autoblogging Error:", errorMsg);
    // Returning 200 here instead of 500 prevents the Supabase Dashboard "Test" UI from crashing 
    // with "Cannot read properties of undefined (reading 'error')".
    return new Response(JSON.stringify({ success: false, error: errorMsg }), {
      headers: { "Content-Type": "application/json" },
      status: 200,
    });
  }
});
