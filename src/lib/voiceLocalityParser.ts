import { supabase } from './supabase'

interface LocalityMatch {
  locality_name: string
  locality_slug: string
  confidence: 'exact' | 'partial' | 'none'
}

const normalizeText = (text: string): string => {
  return text
    .toLowerCase()
    .trim()
    .replace(/\s+/g, ' ')
    .replace(/[^\w\s]/g, '')
}

export async function parseVoiceToLocality(voiceText: string): Promise<LocalityMatch | null> {
  if (!voiceText || voiceText.trim().length === 0) {
    return null
  }

  const searchTerm = normalizeText(voiceText)

  try {
    const { data: allLocalities } = await supabase
      .from('vizag_localities')
      .select('locality_name, locality_slug')
      .eq('is_active', true)

    if (!allLocalities || allLocalities.length === 0) {
      return null
    }

    for (const locality of allLocalities) {
      const normalizedLocality = normalizeText(locality.locality_name)
      if (normalizedLocality === searchTerm) {
        return {
          ...locality,
          confidence: 'exact'
        }
      }
    }

    for (const locality of allLocalities) {
      const normalizedLocality = normalizeText(locality.locality_name)
      if (normalizedLocality.includes(searchTerm) || searchTerm.includes(normalizedLocality)) {
        return {
          ...locality,
          confidence: 'partial'
        }
      }
    }

    const words = searchTerm.split(' ').filter(w => w.length >= 3)
    for (const word of words) {
      for (const locality of allLocalities) {
        const normalizedLocality = normalizeText(locality.locality_name)
        if (normalizedLocality.includes(word)) {
          return {
            ...locality,
            confidence: 'partial'
          }
        }
      }
    }

    return null
  } catch (error) {
    console.error('Error parsing voice to locality:', error)
    return null
  }
}
