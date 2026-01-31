const WHATSAPP_NUMBER = import.meta.env.VITE_WHATSAPP_BUSINESS_NUMBER

const DEFAULT_MESSAGE = 'Hi, I\'m interested in this property listed on VizagProperty. Please share more details.'

const LOCALITY_MAP: Record<string, string> = {
  'madhurawada': 'Madhurawada',
  'yendada': 'Yendada',
  'pm-palem': 'PM Palem',
  'mvp-colony': 'MVP Colony',
  'gajuwaka': 'Gajuwaka',
}

function getLocalityFromUrl(): string | null {
  const path = window.location.pathname
  const segments = path.split('/').filter(Boolean)

  const lastSegment = segments[segments.length - 1]

  if (LOCALITY_MAP[lastSegment]) {
    return LOCALITY_MAP[lastSegment]
  }

  return null
}

function getDefaultMessage(): string {
  const locality = getLocalityFromUrl()

  if (locality) {
    return `Hi, I'm interested in properties in ${locality}, Vizag listed on VizagProperty. Please share more details.`
  }

  return DEFAULT_MESSAGE
}

export function getWhatsAppLink(message?: string): string {
  const finalMessage = message || getDefaultMessage()
  const encodedMessage = encodeURIComponent(finalMessage)
  return `https://wa.me/${WHATSAPP_NUMBER}?text=${encodedMessage}`
}

export function openWhatsApp(message?: string): void {
  const link = getWhatsAppLink(message)
  window.open(link, '_blank', 'noopener,noreferrer')
}
