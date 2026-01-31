import { MapPin, Home, MessageCircle } from 'lucide-react'
import { openWhatsApp } from '../utils/whatsapp'

export function Footer() {
  const localities = [
    { name: 'Madhurawada', path: '/vizag/madhurawada' },
    { name: 'Yendada', path: '/vizag/yendada' },
    { name: 'PM Palem', path: '/vizag/pm-palem' },
    { name: 'MVP Colony', path: '/vizag/mvp-colony' },
    { name: 'Gajuwaka', path: '/vizag/gajuwaka' },
    { name: 'All Vizag Areas', path: '/vizag' },
  ]

  return (
    <footer className="bg-gray-900 text-gray-300 py-12 px-4">
      <div className="max-w-7xl mx-auto">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-8">
          <div>
            <div className="flex items-center gap-2 mb-4">
              <Home className="h-6 w-6 text-primary-400" />
              <h3 className="text-xl font-bold text-white">VizagProperty</h3>
            </div>
            <p className="text-sm leading-relaxed text-gray-300 mb-4">
              VizagProperty.co.in – AI-powered real estate platform for buying, selling & renting property in Vizag.
            </p>
            <div className="flex flex-wrap items-center gap-2 text-xs text-gray-400">
              <span>Transparent pricing</span>
              <span>•</span>
              <span>AI insights</span>
              <span>•</span>
              <span>Verified listings</span>
            </div>
          </div>

          <div>
            <h4 className="text-white font-semibold mb-4">Property Types</h4>
            <ul className="space-y-2">
              <li>
                <a href="/vizag" className="text-sm hover:text-primary-400 transition-colors">
                  Property in Vizag
                </a>
              </li>
              <li>
                <a href="/properties?q=Flats+in+Vizag" className="text-sm hover:text-primary-400 transition-colors">
                  Flats in Vizag
                </a>
              </li>
              <li>
                <a href="/properties?q=Plots+in+Vizag" className="text-sm hover:text-primary-400 transition-colors">
                  Plots in Vizag
                </a>
              </li>
              <li>
                <a href="/properties?q=Villas+in+Vizag" className="text-sm hover:text-primary-400 transition-colors">
                  Villas in Vizag
                </a>
              </li>
              <li>
                <a href="/vizag" className="text-sm hover:text-primary-400 transition-colors">
                  About Us
                </a>
              </li>
              <li>
                <a href="/vizag" className="text-sm hover:text-primary-400 transition-colors">
                  Contact
                </a>
              </li>
            </ul>
          </div>

          <div>
            <h4 className="text-white font-semibold mb-4 flex items-center gap-2">
              <MapPin className="h-5 w-5 text-primary-400" />
              Vizag Localities
            </h4>
            <ul className="space-y-2">
              {localities.map((locality) => (
                <li key={locality.path}>
                  <a
                    href={locality.path}
                    className="text-sm hover:text-primary-400 transition-colors"
                  >
                    {locality.name}
                  </a>
                </li>
              ))}
            </ul>
          </div>
        </div>

        <div className="border-t border-gray-800 pt-8">
          <div className="flex flex-col items-center gap-4 mb-6">
            <button
              onClick={() => openWhatsApp('Hi, I want to list my property in Vizag listed on VizagProperty. Please share more details.')}
              className="inline-flex items-center gap-2 bg-green-600 text-white px-6 py-3 rounded-full hover:bg-green-700 transition-all font-semibold shadow-lg"
            >
              <MessageCircle className="h-5 w-5" />
              <span>Post Property via WhatsApp</span>
            </button>
            <p className="text-xs text-gray-400">List your property for free and reach genuine buyers</p>
          </div>
          <p className="text-center text-sm text-gray-400">
            © 2024 VizagProperty.co.in. All rights reserved.
          </p>
        </div>
      </div>
    </footer>
  )
}
