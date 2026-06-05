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

// VIZAG LIFESTYLE & INFO TOPICS
const topics = [
  "Top 10 Places to Visit in Vizag for Tourists",
  "Best Luxury Hotels and Resorts in Visakhapatnam",
  "Must-Try Street Food Spots in Vizag",
  "A Guide to the Best Beaches in Visakhapatnam",
  "Top Bars and Nightlife Spots in Vizag",
  "Best Shopping Malls and Local Markets in Vizag",
  "Lifestyle and Culture: What It's Like Living in Vizag",
  "Top IT Companies and Tech Parks in Visakhapatnam",
  "Major Government Companies and Industries in Vizag",
  "Best Weekend Getaways near Visakhapatnam",
  "A Guide to Rushikonda Beach and Water Sports",
  "History and Heritage of Visakhapatnam City",
  "Best Schools and Educational Institutions in Vizag",
  "Top Hospitals and Healthcare Facilities in Vizag",
  "Upcoming Infrastructure Projects in Visakhapatnam"
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

    const prompt = `
You are a professional local guide and SEO blog writer for Visakhapatnam (Vizag).

Write a highly engaging, detailed, and SEO-optimized blog article about the city.

TOPIC:
${topic}

NICHE:
Vizag City Guide + Lifestyle + Indirect Real Estate Marketing

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
- Human, enthusiastic writing style like a local guide
- SEO optimized with local keywords
- Markdown formatting (Use headings, bullet points)
- Add FAQs and a conclusion
- No fake stats or robotic writing
- VERY IMPORTANT: Seamlessly and naturally transition the conclusion (or a relevant paragraph) into mentioning that if the reader is planning to move to Vizag, they should check out the best properties.
- INCLUDE AT LEAST 3 HYPERLINKS pointing to: https://vizagproperty.co.in/ (use anchor text like 'flats in Vizag', 'moving to Vizag', 'Vizag real estate', 'Vizag Property', etc.)

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
