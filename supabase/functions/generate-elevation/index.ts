import { serve } from "https://deno.land/std@0.168.0/http/server.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  // Handle CORS preflight request
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const { style, locality, cantilever } = await req.json()

    // Base prompt construction based on payload
    const prompt = `A hyper-realistic ultra-modern cantilevered villa in ${locality}, ${style} style architecture, projecting ${cantilever} meters outward, floating architecture, cinematic lighting, 8k resolution, architectural digest style, stunning landscape, photorealistic.`
    
    const STABILITY_API_KEY = Deno.env.get('STABILITY_API_KEY')

    if (!STABILITY_API_KEY) {
      throw new Error('Missing Stability API Key.')
    }

    // Call Stability AI SDXL Engine
    const response = await fetch(
      "https://api.stability.ai/v1/generation/stable-diffusion-xl-1024-v1-0/text-to-image",
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Accept: 'application/json',
          Authorization: `Bearer ${STABILITY_API_KEY}`,
        },
        body: JSON.stringify({
          text_prompts: [
            {
              text: prompt,
              weight: 1
            }
          ],
          cfg_scale: 7,
          height: 1024,
          width: 1024,
          steps: 30,
          samples: 1,
        }),
      }
    )

    if (!response.ok) {
      const errorText = await response.text();
      console.error("Stability API Error: ", errorText)
      throw new Error(`Stability API responded with ${response.status}: ${errorText}`)
    }

    const responseJSON = await response.json()
    const base64Image = responseJSON.artifacts[0].base64

    // Return the image as a base64 data URL so the frontend can display it easily
    return new Response(
      JSON.stringify({ url: `data:image/png;base64,${base64Image}` }),
      { 
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 200 
      }
    )

  } catch (error) {
    console.error("Function error:", error.message)
    return new Response(
      JSON.stringify({ error: error.message }),
      { 
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        status: 400 
      }
    )
  }
})
