export function openWhatsApp(message: string) {
  const number = import.meta.env.VITE_WHATSAPP_BUSINESS_NUMBER
  const encoded = encodeURIComponent(message)
  window.open(`https://wa.me/${number}?text=${encoded}`, '_blank')
}
