import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.39.3'
import { GoogleGenerativeAI } from 'npm:@google/generative-ai'

// 1. Define hyper-local search queries for the Google News RSS Feed
const TOPICS = [
  "vizag",
  "Visakhapatnam",
  "anakapalli",
  "boghapuram",
  "vizag steelplant",
  "visakhapatnam smart city",
  "visakhapatnam it companies",
  "andhra pradesh real estate",
  "andhra pradesh development",
  "andhra pradesh news",
  "amaravati andhra pradesh"
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
      throw new Error(`No recent news found in Google RSS for any of the topics.`);
    }

    // 4. Initialize Google Gemini API
    const geminiApiKey = Deno.env.get('GEMINI_API_KEY');
    if (!geminiApiKey) throw new Error("GEMINI_API_KEY is missing in environment variables.");
    
    const geminiUrl = `https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${geminiApiKey}`;

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

    // 6. Execute Gemini Generation
    const geminiResponse = await fetch(geminiUrl, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        contents: [{ parts: [{ text: prompt }] }],
        generationConfig: { temperature: 0.7 }
      })
    });

    if (!geminiResponse.ok) {
      const errText = await geminiResponse.text();
      // Throw the raw Google API error so the user can see EXACTLY what is wrong with their API key
      throw new Error(`Google API Rejected Key: ${errText}`);
    }

    const geminiData = await geminiResponse.json();
    let generatedHtml = geminiData.candidates?.[0]?.content?.parts?.[0]?.text?.trim() || '';

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

  } catch (error: any) {
    console.error("Autoblogging Error:", error.message);
    return new Response(JSON.stringify({ error: error.message }), {
      headers: { "Content-Type": "application/json" },
      status: 500,
    });
  }
});
