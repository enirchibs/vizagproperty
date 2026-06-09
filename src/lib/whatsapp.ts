import { VIZAG_PROPERTY_PHONE_WITH_CODE } from '../config/contact'

const WHATSAPP_NUMBER = VIZAG_PROPERTY_PHONE_WITH_CODE

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

export function getWhatsAppLink(message?: string, customPhone?: string): string {
  const finalMessage = message || getDefaultMessage()
  const encodedMessage = encodeURIComponent(finalMessage)
  const phone = customPhone ? customPhone.replace(/[^0-9]/g, '') : WHATSAPP_NUMBER
  // Ensure the phone number has country code (e.g. 91 for India)
  const targetPhone = phone.length === 10 ? `91${phone}` : phone
  return `https://wa.me/${targetPhone}?text=${encodedMessage}`
}

export function openWhatsApp(message?: string, customPhone?: string): void {
  const link = getWhatsAppLink(message, customPhone)
  window.open(link, '_blank', 'noopener,noreferrer')
}
