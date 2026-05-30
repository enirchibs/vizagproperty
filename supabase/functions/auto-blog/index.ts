import { GoogleGenerativeAI } from "npm:@google/generative-ai@0.11.4";
import { createClient } from "npm:@supabase/supabase-js";
import slugify from "npm:slugify";

// GEMINI
const genAI = new GoogleGenerativeAI(
  Deno.env.get("GEMINI_API_KEY")!
);

const model = genAI.getGenerativeModel({
  model: "gemini-flash-latest"
});

// SUPABASE
const supabase = createClient(
  Deno.env.get("SUPABASE_URL")!,
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
);

// BLOG TOPICS
const topics = [
  "Vizag Property Prices 2026",
  "Best Areas to Buy Flats in Vizag",
  "Vizag Real Estate Investment Guide",
  "PMAY Housing Scheme Andhra Pradesh",
  "Best Villas in Vizag",
  "Home Loan Tips India",
  "Real Estate Trends Andhra Pradesh",
  "Plots vs Flats Investment",
  "Top Residential Areas in Vizag",
  "2BHK Flats Buying Guide"
];

// RANDOM TOPIC
function getRandomTopic() {
  return topics[
    Math.floor(Math.random() * topics.length)
  ];
}

// DYNAMIC AI IMAGE
function getDynamicImage(title: string) {
  // We use Pollinations AI to generate a free, dynamic, royalty-free image on the fly
  const prompt = `luxury modern real estate property photography, high quality, 8k resolution, ${title}`;
  const encodedPrompt = encodeURIComponent(prompt);
  return `https://image.pollinations.ai/prompt/${encodedPrompt}?width=1200&height=630&nologo=true`;
}

// READING TIME
function calculateReadingTime(content: string) {
  const words = content.split(/\s+/).length;
  return Math.ceil(words / 200);
}

Deno.serve(async () => {
  try {
    const topic = getRandomTopic();

    // GEMINI PROMPT
    const prompt = `
You are a professional SEO blog writer.

Write a detailed SEO optimized blog article.

TOPIC:
${topic}

NICHE:
Real Estate + Vizag + Investment

Return ONLY valid JSON.

FORMAT:
{
  "title": "",
  "excerpt": "",
  "content": "",
  "category": "",
  "tags": [],
  "meta_title": "",
  "meta_description": ""
}

RULES:
- 1200+ words
- Human writing style
- SEO optimized
- Markdown formatting
- Use headings
- Use bullet points
- Add FAQs
- Add conclusion
- No fake stats
- No robotic writing

CATEGORY OPTIONS:
- real-estate
- investment
- infrastructure
- lifestyle
- technology
`;

    // GENERATE BLOG
    const result = await model.generateContent(prompt);
    const response = await result.response;
    let text = response.text();

    // CLEAN JSON
    text = text
      .replace(/```json/g, "")
      .replace(/```/g, "")
      .trim();

    const aiData = JSON.parse(text);

    // GENERATE SLUG
    const slug = slugify(aiData.title, {
      lower: true,
      strict: true
    });

    // CHECK DUPLICATES
    const { data: existingBlog } = await supabase
      .from("blog_posts")
      .select("id")
      .eq("slug", slug)
      .maybeSingle();

    if (existingBlog) {
      return new Response(
        JSON.stringify({
          success: false,
          message: "Duplicate blog skipped"
        }),
        {
          headers: {
            "Content-Type": "application/json"
          },
          status: 200
        }
      );
    }

    // READING TIME
    const readingTime = calculateReadingTime(aiData.content);

    // INSERT BLOG
    const { error } = await supabase
      .from("blog_posts")
      .insert({
        slug: slug,
        title: aiData.title,
        excerpt: aiData.excerpt,
        content: aiData.content,
        category: aiData.category,
        tags: aiData.tags,
        meta_title: aiData.meta_title,
        meta_description: aiData.meta_description,
        og_image: getDynamicImage(aiData.title),
        author_name: "VizagProperty AI",
        published: true,
        featured: false,
        reading_time_min: readingTime,
        published_at: new Date().toISOString()
      });

    if (error) {
      console.error(error);
      return new Response(
        JSON.stringify(error),
        {
          headers: {
            "Content-Type": "application/json"
          },
          status: 500
        }
      );
    }

    return new Response(
      JSON.stringify({
        success: true,
        topic,
        slug
      }),
      {
        headers: {
          "Content-Type": "application/json"
        },
        status: 200
      }
    );

  } catch (err) {
    console.error(err);
    return new Response(
      JSON.stringify({
        success: false,
        error: String(err)
      }),
      {
        headers: {
          "Content-Type": "application/json"
        },
        status: 500
      }
    );
  }
});
