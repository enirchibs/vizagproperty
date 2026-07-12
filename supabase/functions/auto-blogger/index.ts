// auto-blogger: Zero npm imports — uses only native Deno fetch
// This avoids import-level crashes in Supabase Edge Runtime

// --- CONFIG ---
const SUPABASE_URL = Deno.env.get('SUPABASE_URL') ?? ''
const SUPABASE_KEY = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
const GEMINI_API_KEY = Deno.env.get('GEMINI_API_KEY') ?? ''

// Hyper-local Vizag topics to search on Google News RSS
const TOPICS = [
  'vizag real estate projects',
  'visakhapatnam metro rail',
  'vizag it companies growth',
  'vizag cinema halls multiplexes',
  'vizag new showrooms openings',
  'bhogapuram airport construction update',
  'vizag new roads flyovers',
  'vizag steelplant status',
  'vizag pharma city parawada',
  'visakhapatnam smart city projects',
  'andhra pradesh real estate news'
]

// Fallback topics when Google RSS is blocked
const FALLBACK_TOPICS = [
  {
    topic: 'Bhogapuram International Airport',
    title: 'Bhogapuram Airport Progress and Its Direct Impact on Vizag Real Estate',
    snippet: 'The fast-tracked construction of Bhogapuram International Airport is creating massive real estate demand in northern Visakhapatnam corridors like Tagarapuvalasa, Bhogapuram, and Anandapuram.'
  },
  {
    topic: 'Vizag IT Corridor Expansion',
    title: 'Visakhapatnam IT Corridor Growth: Residential Demand Surges in Madhurawada',
    snippet: 'With major IT companies expanding operations in Madhurawada and Rushikonda, premium apartments and rental housing options are seeing unprecedented demand.'
  },
  {
    topic: 'VMRDA Approved Plots',
    title: 'Why VMRDA Approved Plots are the Safest Investment Choice in Vizag',
    snippet: 'Visakhapatnam Metropolitan Region Development Authority (VMRDA) layouts offer investors legal safety, guaranteed amenities, and high capital appreciation.'
  },
  {
    topic: 'Vizag Metro Rail Proposed Routes',
    title: 'Proposed Vizag Metro Rail: Identifying the Next Real Estate Hotspots',
    snippet: 'The upcoming Metro Rail project is set to transform connectivity and property prices along the National Highway (NH16) corridor in Visakhapatnam.'
  },
  {
    topic: 'Beach Road Luxury Real Estate',
    title: 'Beach Road Development and the Rise of Luxury Coastal Living in Visakhapatnam',
    snippet: 'Infrastructure projects along the scenic Vizag-Bheemili beach road are driving luxury residential villa projects and coastal holiday home investments.'
  },
  {
    topic: 'Vizag New Showrooms and Retail Growth',
    title: 'Retail Boom in Visakhapatnam: New Showrooms and Commercial Hubs on VIP Road',
    snippet: 'The launch of premium lifestyle, jewelry, and automobile showrooms on VIP Road and Gajuwaka highlights the surging purchasing power and commercial real estate potential of Vizag.'
  },
  {
    topic: 'Vizag Cinema Halls and Entertainment',
    title: 'New Multiplexes and Entertainment Centers Opening Across Visakhapatnam',
    snippet: 'With new cinema halls and multiplexes launching in growing suburban zones, neighborhood entertainment hubs are boosting adjacent residential land prices.'
  },
  {
    topic: 'New Roads and Infrastructure Flyovers',
    title: 'Road Infrastructure Upgrades: New Flyovers and Highways Easing Vizag Traffic',
    snippet: 'The completion of major flyovers and highway expansions along the Anandapuram-Pendurthi-Anakapalli stretch is opening up new areas for housing developments.'
  },
  {
    topic: 'Vizag Steelplant Industrial Impact',
    title: 'Vizag Steel Plant and Its Role in the Local Economy and Real Estate',
    snippet: 'The industrial presence of the Visakhapatnam Steel Plant continues to sustain high residential demand in Gajuwaka, Kurmannapalem, and Duvvada areas.'
  },
  {
    topic: 'Pharma City Parawada',
    title: 'Jawaharlal Nehru Pharma City Parawada: Industrial Expansion and Housing Demand',
    snippet: 'The expansion of pharma companies in Parawada is creating thousands of jobs, driving demand for affordable housing, rental apartments, and plots in Anakapalli.'
  }
]

// --- HELPERS ---
function shuffleArray<T>(arr: T[]): T[] {
  return [...arr].sort(() => Math.random() - 0.5)
}

function makeSlug(title: string): string {
  return title
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/(^-|-$)/g, '')
    .substring(0, 80) + '-' + Date.now()
}

function stripHtml(html: string): string {
  return html.replace(/<[^>]*>/gm, '')
}

// --- MAIN HANDLER ---
Deno.serve(async (_req) => {
  try {
    // 1. Check environment variables
    if (!GEMINI_API_KEY) throw new Error('GEMINI_API_KEY secret is not set in Supabase Edge Function Secrets.')
    if (!SUPABASE_URL) throw new Error('SUPABASE_URL secret is missing.')
    if (!SUPABASE_KEY) throw new Error('SUPABASE_SERVICE_ROLE_KEY secret is missing.')

    // 2. Try Google News RSS to find a real news item
    let query = ''
    let newsTitle = ''
    let newsSnippet = ''

    for (const topic of shuffleArray(TOPICS)) {
      try {
        const rssUrl = `https://news.google.com/rss/search?q=${encodeURIComponent(topic)}&hl=te&gl=IN&ceid=IN:te`
        const rssRes = await fetch(rssUrl, { signal: AbortSignal.timeout(5000) })
        const xml = await rssRes.text()

        const itemStart = xml.indexOf('<item>')
        const itemEnd = xml.indexOf('</item>', itemStart)

        if (itemStart !== -1 && itemEnd !== -1) {
          const item = xml.substring(itemStart, itemEnd)
          const titleMatch = item.match(/<title>(.*?)<\/title>/)
          const descMatch = item.match(/<description>(.*?)<\/description>/)
          query = topic
          newsTitle = titleMatch ? titleMatch[1].replace(/<!\[CDATA\[(.*?)\]\]>/g, '$1') : topic
          newsSnippet = descMatch ? descMatch[1].replace(/<!\[CDATA\[(.*?)\]\]>/g, '$1').replace(/<[^>]*>/gm, '') : ''
          console.log(`Found news for topic: ${topic}`)
          break
        }
      } catch (_e) {
        // RSS timeout or parse error — try next topic
      }
    }

    // 3. If RSS failed, use a rich fallback topic
    if (!query) {
      console.warn('Google RSS blocked or returned empty. Using fallback topic.')
      const f = FALLBACK_TOPICS[Math.floor(Math.random() * FALLBACK_TOPICS.length)]
      query = f.topic
      newsTitle = f.title
      newsSnippet = f.snippet
    }

    // 4. Build the Gemini prompt
    const prompt = `You are an expert real estate and city development journalist based in Visakhapatnam (Vizag).

Here is the latest trending topic regarding "${query}":
Headline: ${newsTitle}
Summary: ${newsSnippet}

Task: Write a highly engaging, SEO-optimized blog article in ENGLISH about this topic. Expand on how this impacts the local real estate market, plot values, or property investments in Vizag.

Strict Requirements:
1. Output ONLY valid HTML. No markdown code blocks (no \`\`\`html).
2. Include a catchy <h1> title, followed by at least two <h2> subheadings.
3. Include at least 3 contextual HTML links to https://vizagproperty.co.in/ using natural anchor texts like "flats for sale in Vizag" or "plots in Visakhapatnam".
4. End with a strong Call to Action paragraph.
5. Minimum 600 words.`

    // 5. Call Gemini API — try models in order until one works
    const GEMINI_MODELS = [
      { version: 'v1',     model: 'gemini-2.0-flash' },
      { version: 'v1',     model: 'gemini-2.0-flash-lite' },
      { version: 'v1',     model: 'gemini-1.5-flash' },
      { version: 'v1beta', model: 'gemini-1.5-flash' },
      { version: 'v1beta', model: 'gemini-1.5-flash-8b' },
    ]

    let generatedHtml = ''
    let lastError = ''

    for (const { version, model } of GEMINI_MODELS) {
      const geminiUrl = `https://generativelanguage.googleapis.com/${version}/models/${model}:generateContent?key=${GEMINI_API_KEY}`
      console.log(`Trying model: ${model} (${version})`)
      const geminiRes = await fetch(geminiUrl, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          contents: [{ parts: [{ text: prompt }] }],
          generationConfig: { temperature: 0.7, maxOutputTokens: 2048 }
        })
      })

      if (!geminiRes.ok) {
        lastError = `${model}(${version}): ${geminiRes.status} ${await geminiRes.text()}`
        console.warn(`Failed: ${lastError}`)
        continue
      }

      const geminiData = await geminiRes.json()
      generatedHtml = geminiData?.candidates?.[0]?.content?.parts?.[0]?.text?.trim() ?? ''
      if (generatedHtml) {
        console.log(`Success with model: ${model}`)
        break
      }
    }

    if (!generatedHtml) throw new Error(`All Gemini models failed. Last: ${lastError}`)

    // Clean up any markdown fences Gemini may still add
    generatedHtml = generatedHtml.replace(/^```html\n?/, '').replace(/\n?```$/, '').trim()

    // 6. Extract title and build slug/excerpt
    const h1Match = generatedHtml.match(/<h1[^>]*>(.*?)<\/h1>/i)
    const finalTitle = h1Match ? h1Match[1].replace(/<[^>]*>/g, '') : newsTitle
    const slug = makeSlug(finalTitle)
    const excerpt = stripHtml(generatedHtml).substring(0, 160) + '...'

    // 7. Insert into Supabase using native fetch
    const insertRes = await fetch(`${SUPABASE_URL}/rest/v1/blog_posts`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'apikey': SUPABASE_KEY,
        'Authorization': `Bearer ${SUPABASE_KEY}`,
        'Prefer': 'return=minimal'
      },
      body: JSON.stringify({
        topic: query,
        title: finalTitle,
        content: generatedHtml,
        slug: slug,
        excerpt: excerpt,
        published: true,
        category: 'news',
        author_name: 'AI Autoblogger',
        reading_time_min: Math.ceil(stripHtml(generatedHtml).split(/\s+/).length / 200)
      })
    })

    if (!insertRes.ok) {
      const insertErr = await insertRes.text()
      throw new Error(`Supabase insert error ${insertRes.status}: ${insertErr}`)
    }

    return new Response(JSON.stringify({ success: true, topic: query, title: finalTitle, slug }), {
      headers: { 'Content-Type': 'application/json' },
      status: 200
    })

  } catch (err: unknown) {
    const msg = err instanceof Error ? err.message : String(err)
    console.error('Autoblogging Error:', msg)
    return new Response(JSON.stringify({ success: false, error: msg }), {
      headers: { 'Content-Type': 'application/json' },
      status: 200  // Return 200 so Supabase Dashboard can read the JSON error body
    })
  }
})
