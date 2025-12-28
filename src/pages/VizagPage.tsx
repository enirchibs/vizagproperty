import { useEffect, useState } from 'react'
import { Home, TrendingUp, MapPin, DollarSign, Building2, Landmark, CheckCircle, Search } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { Property } from '../types'
import { PropertyCard } from '../components/PropertyCard'
import { WhatsAppButton } from '../components/WhatsAppButton'

export function VizagPage() {
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    document.title = 'Vizag Property – Flats, Villas & Plots for Sale in Visakhapatnam'
    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Explore verified flats, villas and plots for sale & rent in Vizag. AI-powered search, fair pricing insights & WhatsApp support.')
    }

    loadVizagProperties()
  }, [])

  const loadVizagProperties = async () => {
    try {
      const { data, error } = await supabase
        .from('properties')
        .select('*')
        .eq('status', 'available')
        .ilike('location', '%Visakhapatnam%')
        .order('created_at', { ascending: false })
        .limit(9)

      if (error) throw error
      setProperties(data || [])
    } catch (error) {
      console.error('Error loading properties:', error)
    } finally {
      setLoading(false)
    }
  }

  const localities = [
    { name: 'Madhurawada', description: 'Emerging IT hub with modern apartments', link: '/vizag/madhurawada' },
    { name: 'Yendada', description: 'Premium residential area near beach', link: '/vizag/yendada' },
    { name: 'PM Palem', description: 'Well-connected with affordable options', link: '/vizag/pm-palem' },
    { name: 'MVP Colony', description: 'Established locality with amenities', link: '/vizag/mvp-colony' },
    { name: 'Gajuwaka', description: 'Budget-friendly residential area', link: '/vizag/gajuwaka' },
    { name: 'Rushikonda', description: 'Beachside living with scenic views', link: '/properties?location=Visakhapatnam&locality=Rushikonda' }
  ]

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      <section className="bg-gradient-to-br from-primary-600 to-primary-800 text-white py-16 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="max-w-4xl">
            <h1 className="text-4xl md:text-5xl font-bold mb-4">
              Property in Vizag
            </h1>
            <p className="text-xl text-primary-100 mb-6">
              Explore verified flats, villas and plots for sale & rent in Visakhapatnam with AI-powered search, transparent pricing insights and instant WhatsApp support
            </p>
            <div className="flex flex-wrap gap-4">
              <a
                href="/properties?location=Visakhapatnam&type=buy"
                className="bg-white text-primary-600 px-6 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-all flex items-center gap-2"
              >
                <Search className="h-5 w-5" />
                Search Properties
              </a>
              <a
                href="/"
                className="bg-primary-700 text-white px-6 py-3 rounded-lg font-semibold hover:bg-primary-800 transition-all border-2 border-white/20"
              >
                Use AI Search
              </a>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4">
        <div className="max-w-7xl mx-auto">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-8 flex items-center gap-3">
            <Building2 className="h-8 w-8 text-primary-600" />
            Flats for Sale in Vizag
          </h2>
          <div className="mb-12">
            <p className="text-gray-700 leading-relaxed mb-4">
              Visakhapatnam offers a wide range of flats and apartments across various price points and localities. From premium 3 BHK apartments in gated communities to affordable 2 BHK flats in upcoming areas, Vizag's real estate market caters to diverse buyer preferences. Popular localities for flat purchases include Madhurawada, MVP Colony, and Yendada, each offering unique advantages in terms of connectivity, amenities, and lifestyle.
            </p>
            <p className="text-gray-700 leading-relaxed mb-6">
              The average price for a 2 BHK flat in Vizag ranges from 50 to 70 lakhs depending on the locality, while 3 BHK apartments typically cost between 80 lakhs to 1.5 crores. New builder projects in areas like PM Palem and Madhurawada are attracting significant buyer interest due to their modern amenities and strategic locations near IT hubs and educational institutions.
            </p>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div className="bg-white p-6 rounded-xl shadow-md border border-gray-200">
                <h3 className="font-semibold text-lg text-gray-900 mb-2">2 BHK Flats</h3>
                <p className="text-gray-600 text-sm mb-3">Starting from 50 lakhs</p>
                <a href="/properties?location=Visakhapatnam&bhk=2&type=buy" className="text-primary-600 hover:text-primary-700 font-medium text-sm flex items-center gap-1">
                  View All <TrendingUp className="h-4 w-4" />
                </a>
              </div>
              <div className="bg-white p-6 rounded-xl shadow-md border border-gray-200">
                <h3 className="font-semibold text-lg text-gray-900 mb-2">3 BHK Flats</h3>
                <p className="text-gray-600 text-sm mb-3">Starting from 80 lakhs</p>
                <a href="/properties?location=Visakhapatnam&bhk=3&type=buy" className="text-primary-600 hover:text-primary-700 font-medium text-sm flex items-center gap-1">
                  View All <TrendingUp className="h-4 w-4" />
                </a>
              </div>
              <div className="bg-white p-6 rounded-xl shadow-md border border-gray-200">
                <h3 className="font-semibold text-lg text-gray-900 mb-2">4+ BHK Flats</h3>
                <p className="text-gray-600 text-sm mb-3">Premium Options</p>
                <a href="/properties?location=Visakhapatnam&bhk=4&type=buy" className="text-primary-600 hover:text-primary-700 font-medium text-sm flex items-center gap-1">
                  View All <TrendingUp className="h-4 w-4" />
                </a>
              </div>
            </div>
          </div>

          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-8 flex items-center gap-3">
            <Home className="h-8 w-8 text-primary-600" />
            Villas & Independent Houses in Vizag
          </h2>
          <div className="mb-12">
            <p className="text-gray-700 leading-relaxed mb-4">
              Independent houses and villas in Visakhapatnam are highly sought after by families looking for spacious living with privacy. Areas like Rushikonda, Yendada, and Madhurawada offer premium villa projects with modern architecture, landscaped gardens, and proximity to the beach. These properties typically range from 1.5 crores to 5 crores depending on plot size, construction quality, and location.
            </p>
            <p className="text-gray-700 leading-relaxed mb-6">
              Gated villa communities in Vizag provide enhanced security, clubhouse facilities, and well-maintained infrastructure. Many buyers prefer villas for the flexibility of customization and the potential for future expansion. The rental market for villas is also robust, with monthly rents ranging from 40,000 to 1.5 lakhs for premium properties near the beach or IT corridors.
            </p>
            <div className="bg-gradient-to-br from-primary-50 to-white p-8 rounded-2xl border border-primary-100 shadow-sm">
              <h3 className="text-xl font-semibold text-gray-900 mb-4">Popular Villa Localities</h3>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="flex items-start gap-3">
                  <CheckCircle className="h-5 w-5 text-primary-600 mt-1 flex-shrink-0" />
                  <div>
                    <p className="font-medium text-gray-900">Rushikonda Beach Road</p>
                    <p className="text-sm text-gray-600">Premium beachside villas with sea views</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle className="h-5 w-5 text-primary-600 mt-1 flex-shrink-0" />
                  <div>
                    <p className="font-medium text-gray-900">Yendada</p>
                    <p className="text-sm text-gray-600">Gated communities with modern amenities</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle className="h-5 w-5 text-primary-600 mt-1 flex-shrink-0" />
                  <div>
                    <p className="font-medium text-gray-900">Madhurawada</p>
                    <p className="text-sm text-gray-600">IT hub proximity with villa projects</p>
                  </div>
                </div>
                <div className="flex items-start gap-3">
                  <CheckCircle className="h-5 w-5 text-primary-600 mt-1 flex-shrink-0" />
                  <div>
                    <p className="font-medium text-gray-900">PM Palem</p>
                    <p className="text-sm text-gray-600">Affordable independent houses</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-8 flex items-center gap-3">
            <Landmark className="h-8 w-8 text-primary-600" />
            Plots & Land in Vizag
          </h2>
          <div className="mb-12">
            <p className="text-gray-700 leading-relaxed mb-4">
              Land and plot investments in Visakhapatnam have shown consistent appreciation over the years, making them attractive options for long-term investors and those planning to build custom homes. Residential plots are available across various localities including PM Palem, Gajuwaka, and the outskirts of Madhurawada. Plot prices vary significantly based on location, road connectivity, and development potential.
            </p>
            <p className="text-gray-700 leading-relaxed mb-6">
              VUDA-approved plots and DTCP-approved layouts ensure legal clarity and proper infrastructure development. Plot sizes typically range from 150 to 500 square yards, with prices starting from 5,000 per square yard in developing areas to 25,000 per square yard in prime locations. Areas near the proposed metro corridor and upcoming infrastructure projects are experiencing higher demand and price growth.
            </p>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div className="bg-white p-6 rounded-xl shadow-md border border-gray-200">
                <MapPin className="h-8 w-8 text-primary-600 mb-3" />
                <h3 className="font-semibold text-lg text-gray-900 mb-2">Residential Plots</h3>
                <p className="text-gray-600 text-sm mb-4">VUDA & DTCP approved layouts with clear titles</p>
                <a href="/properties?location=Visakhapatnam&category=land_plot&type=buy" className="text-primary-600 hover:text-primary-700 font-medium text-sm">
                  Explore Plots →
                </a>
              </div>
              <div className="bg-white p-6 rounded-xl shadow-md border border-gray-200">
                <Building2 className="h-8 w-8 text-primary-600 mb-3" />
                <h3 className="font-semibold text-lg text-gray-900 mb-2">Commercial Land</h3>
                <p className="text-gray-600 text-sm mb-4">Investment opportunities in prime locations</p>
                <a href="/properties?location=Visakhapatnam&type=commercial" className="text-primary-600 hover:text-primary-700 font-medium text-sm">
                  View Options →
                </a>
              </div>
            </div>
          </div>

          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-8 flex items-center gap-3">
            <DollarSign className="h-8 w-8 text-primary-600" />
            Vizag Property Prices & Trends
          </h2>
          <div className="mb-12">
            <p className="text-gray-700 leading-relaxed mb-6">
              Visakhapatnam's real estate market has demonstrated steady growth over the past decade, driven by IT sector expansion, infrastructure development, and the city's strategic importance as a port city. Property prices have appreciated by approximately 8-12% annually in prime localities, while emerging areas show even higher growth potential.
            </p>
            <div className="bg-white rounded-2xl shadow-lg border border-gray-200 overflow-hidden">
              <div className="overflow-x-auto">
                <table className="w-full">
                  <thead className="bg-primary-50">
                    <tr>
                      <th className="px-6 py-4 text-left text-sm font-semibold text-gray-900">Locality</th>
                      <th className="px-6 py-4 text-left text-sm font-semibold text-gray-900">Avg Price/Sq Ft</th>
                      <th className="px-6 py-4 text-left text-sm font-semibold text-gray-900">2 BHK Range</th>
                      <th className="px-6 py-4 text-left text-sm font-semibold text-gray-900">Growth Trend</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-200">
                    <tr>
                      <td className="px-6 py-4 text-sm text-gray-900 font-medium">Madhurawada</td>
                      <td className="px-6 py-4 text-sm text-gray-700">₹5,500 - ₹7,000</td>
                      <td className="px-6 py-4 text-sm text-gray-700">₹65L - ₹85L</td>
                      <td className="px-6 py-4 text-sm text-green-600 font-medium">High ↑</td>
                    </tr>
                    <tr>
                      <td className="px-6 py-4 text-sm text-gray-900 font-medium">MVP Colony</td>
                      <td className="px-6 py-4 text-sm text-gray-700">₹6,000 - ₹8,000</td>
                      <td className="px-6 py-4 text-sm text-gray-700">₹70L - ₹95L</td>
                      <td className="px-6 py-4 text-sm text-green-600 font-medium">Stable →</td>
                    </tr>
                    <tr>
                      <td className="px-6 py-4 text-sm text-gray-900 font-medium">Yendada</td>
                      <td className="px-6 py-4 text-sm text-gray-700">₹5,000 - ₹6,500</td>
                      <td className="px-6 py-4 text-sm text-gray-700">₹60L - ₹80L</td>
                      <td className="px-6 py-4 text-sm text-green-600 font-medium">High ↑</td>
                    </tr>
                    <tr>
                      <td className="px-6 py-4 text-sm text-gray-900 font-medium">PM Palem</td>
                      <td className="px-6 py-4 text-sm text-gray-700">₹4,500 - ₹6,000</td>
                      <td className="px-6 py-4 text-sm text-gray-700">₹55L - ₹75L</td>
                      <td className="px-6 py-4 text-sm text-green-600 font-medium">Growing ↑</td>
                    </tr>
                    <tr>
                      <td className="px-6 py-4 text-sm text-gray-900 font-medium">Gajuwaka</td>
                      <td className="px-6 py-4 text-sm text-gray-700">₹3,500 - ₹5,000</td>
                      <td className="px-6 py-4 text-sm text-gray-700">₹45L - ₹65L</td>
                      <td className="px-6 py-4 text-sm text-green-600 font-medium">Stable →</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-8 flex items-center gap-3">
            <TrendingUp className="h-8 w-8 text-primary-600" />
            Why Invest in Vizag Real Estate?
          </h2>
          <div className="mb-12">
            <p className="text-gray-700 leading-relaxed mb-6">
              Visakhapatnam presents compelling investment opportunities for both end-users and investors. The city's strategic position as a major port, growing IT sector, excellent educational institutions, and planned infrastructure projects make it one of the most promising real estate markets in South India.
            </p>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-xl border border-primary-100 shadow-sm">
                <CheckCircle className="h-8 w-8 text-primary-600 mb-3" />
                <h3 className="text-lg font-semibold text-gray-900 mb-2">IT Sector Growth</h3>
                <p className="text-gray-700 text-sm">
                  Expanding IT parks and Special Economic Zones attracting major companies, creating employment and housing demand in areas like Madhurawada and Rushikonda.
                </p>
              </div>
              <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-xl border border-primary-100 shadow-sm">
                <CheckCircle className="h-8 w-8 text-primary-600 mb-3" />
                <h3 className="text-lg font-semibold text-gray-900 mb-2">Infrastructure Development</h3>
                <p className="text-gray-700 text-sm">
                  Metro rail project, airport expansion, and coastal road development enhancing connectivity and property values across the city.
                </p>
              </div>
              <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-xl border border-primary-100 shadow-sm">
                <CheckCircle className="h-8 w-8 text-primary-600 mb-3" />
                <h3 className="text-lg font-semibold text-gray-900 mb-2">Educational Hub</h3>
                <p className="text-gray-700 text-sm">
                  Premier institutions like IIM, IIT, and medical colleges driving demand for student accommodation and family housing near campuses.
                </p>
              </div>
              <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-xl border border-primary-100 shadow-sm">
                <CheckCircle className="h-8 w-8 text-primary-600 mb-3" />
                <h3 className="text-lg font-semibold text-gray-900 mb-2">Coastal Living</h3>
                <p className="text-gray-700 text-sm">
                  Unique beachside lifestyle with clean beaches, pleasant climate, and lower pollution compared to metros, attracting quality homebuyers.
                </p>
              </div>
              <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-xl border border-primary-100 shadow-sm">
                <CheckCircle className="h-8 w-8 text-primary-600 mb-3" />
                <h3 className="text-lg font-semibold text-gray-900 mb-2">Affordable Pricing</h3>
                <p className="text-gray-700 text-sm">
                  Significantly lower property prices compared to metros like Bangalore and Hyderabad, offering better value for investment and living.
                </p>
              </div>
              <div className="bg-gradient-to-br from-primary-50 to-white p-6 rounded-xl border border-primary-100 shadow-sm">
                <CheckCircle className="h-8 w-8 text-primary-600 mb-3" />
                <h3 className="text-lg font-semibold text-gray-900 mb-2">Strategic Location</h3>
                <p className="text-gray-700 text-sm">
                  Major port city with excellent connectivity to other metros, industrial corridors, and international trade routes supporting economic growth.
                </p>
              </div>
            </div>
          </div>

          <div className="bg-gradient-to-br from-gray-50 to-white rounded-2xl p-8 border border-gray-200 shadow-md mb-12">
            <h2 className="text-2xl font-bold text-gray-900 mb-2 text-center">Explore Property by Location in Vizag</h2>
            <p className="text-gray-600 text-center mb-6">Browse properties in popular localities across Visakhapatnam</p>
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
              {localities.map((locality) => (
                <a
                  key={locality.name}
                  href={locality.link}
                  className="bg-white p-5 rounded-xl border border-gray-200 hover:border-primary-300 hover:shadow-lg transition-all group"
                >
                  <div className="flex items-start justify-between mb-2">
                    <h3 className="font-semibold text-gray-900 group-hover:text-primary-600 transition-colors">
                      {locality.name}
                    </h3>
                    <MapPin className="h-5 w-5 text-gray-400 group-hover:text-primary-600 transition-colors" />
                  </div>
                  <p className="text-sm text-gray-600">{locality.description}</p>
                  <div className="mt-3 text-primary-600 text-sm font-medium flex items-center gap-1">
                    View Properties <TrendingUp className="h-4 w-4" />
                  </div>
                </a>
              ))}
            </div>
          </div>

          {properties.length > 0 && (
            <>
              <h2 className="text-2xl md:text-3xl font-bold text-gray-900 mb-6">
                Latest Properties in Vizag
              </h2>
              {loading ? (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                  {[1, 2, 3].map((i) => (
                    <div key={i} className="bg-gray-200 h-80 rounded-2xl animate-pulse" />
                  ))}
                </div>
              ) : (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                  {properties.map((property) => (
                    <PropertyCard key={property.id} property={property} />
                  ))}
                </div>
              )}
              <div className="text-center mt-8">
                <a
                  href="/properties?location=Visakhapatnam"
                  className="inline-flex items-center gap-2 bg-primary-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-primary-700 transition-all"
                >
                  View All Vizag Properties
                  <TrendingUp className="h-5 w-5" />
                </a>
              </div>
            </>
          )}
        </div>
      </section>

      <WhatsAppButton />
    </div>
  )
}
