interface AnalyticsEvent {
  event: string
  category?: string
  label?: string
  value?: number
  [key: string]: any
}

export const trackEvent = (eventData: AnalyticsEvent) => {
  if (typeof window === 'undefined') return

  const { event, category, label, value, ...customParams } = eventData

  if (window.gtag) {
    window.gtag('event', event, {
      event_category: category,
      event_label: label,
      value: value,
      ...customParams,
    })
  }

  if (window.dataLayer) {
    window.dataLayer.push({
      event,
      category,
      label,
      value,
      ...customParams,
    })
  }

}

declare global {
  interface Window {
    gtag?: (...args: any[]) => void
    dataLayer?: any[]
  }
}
