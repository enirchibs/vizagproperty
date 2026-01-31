import { useEffect, useState } from 'react'
import { Home, TrendingUp, MapPin, DollarSign, Building2, Landmark, CheckCircle, ArrowLeft, MessageCircle } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { Property } from '../types'
import { PropertyCard } from '../components/PropertyCard'
import { WhatsAppButton } from '../components/WhatsAppButton'
import { buildStrictQuery, getLocalityContextBySlug } from '../lib/searchFilters'
import { openWhatsApp, getWhatsAppLink } from '../lib/whatsapp'

export function PMPalemPage() {
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    document.title = 'Property in PM Palem Vizag | Affordable Flats, Villas & Plots for Sale'
    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Find affordable flats, villas and plots for sale & rent in PM Palem, Vizag. Well-connected locality with excellent value for money properties.')
    }

    loadPMPalemProperties()
  }, [])

  const loadPMPalemProperties = async () => {
    try {
      const localityContext = await getLocalityContextBySlug('pm-palem')
      if (!localityContext) {
        console.error('PM Palem locality not found')
        return
      }

      const query = buildStrictQuery(supabase, {}, {}, localityContext).limit(12)
      const { data, error } = await query

      if (error) throw error
      setProperties(data || [])
    } catch (error) {
      console.error('Error loading properties:', error)
    } finally {
      setLoading(false)
    }
  }

  const nearbyAreas = [
    { name: 'Madhurawada', distance: '3 km', link: '/vizag/madhurawada' },
    { name: 'Yendada', distance: '6 km', link: '/vizag/yendada' },
    { name: 'Gajuwaka', distance: '8 km', link: '/vizag/gajuwaka' },
  ]

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      <section className="bg-gradient-to-br from-green-600 to-green-800 text-white py-12 px-4">
        <div className="max-w-7xl mx-auto">
          <a
            href="/vizag"
            className="inline-flex items-center gap-2 text-green-100 hover:text-white mb-6 transition-colors"
          >
            <ArrowLeft className="h-5 w-5" />
            Back to Vizag Properties
          </a>
          <div className="max-w-4xl">
            <div className="flex items-center gap-2 text-green-100 mb-3">
              <MapPin className="h-5 w-5" />
              <span className="text-sm font-medium">Visakhapatnam</span>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold mb-4">
              Property in PM Palem, Vizag
            </h1>
            <p className="text-xl text-green-100 mb-6">
              Discover well-connected and affordable properties in PM Palem - Vizag's value-for-money residential hub with excellent amenities and infrastructure
            </p>
            <div className="flex flex-wrap gap-3">
              <a
                href="/properties?location=PM Palem&type=buy"
                className="bg-white text-green-600 px-6 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-all"
              >
                Search Properties
              </a>
              <a
                href="/"
                className="bg-green-700 text-white px-6 py-3 rounded-lg font-semibold hover:bg-green-800 transition-all border-2 border-white/20"
              >
                Use AI Search
              </a>
            </div>
          </div>
        </div>
      </section>

      <section className="py-16 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-12">
            <div className="lg:col-span-2">
              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4 flex items-center gap-3">
                <Building2 className="h-8 w-8 text-green-600" />
                Flats for Sale in PM Palem
              </h2>
              <button
                onClick={() => openWhatsApp('Hi Vizag Property Experts, I am looking for property in PM Palem, Vizag')}
                className="inline-flex items-center gap-2 bg-green-600 text-white px-5 py-2.5 rounded-lg font-medium hover:bg-green-700 transition-all mb-6"
              >
                <MessageCircle className="h-5 w-5" />
                Get Properties on WhatsApp
              </button>
              <p className="text-gray-700 leading-relaxed mb-4">
                PM Palem has established itself as one of Visakhapatnam's most sought-after mid-range residential localities, offering excellent value propositions for homebuyers seeking quality apartments without premium pricing. The area features numerous apartment complexes ranging from budget-friendly 2 BHK units to spacious 3 BHK homes, all equipped with essential modern amenities including covered parking, power backup, water supply, and security services. The locality's strategic positioning between IT hubs and the city center makes it particularly attractive to working professionals.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Property prices in PM Palem are significantly more affordable compared to premium localities, with 2 BHK apartments starting from 45 lakhs and 3 BHK units ranging from 70 lakhs to 1.2 crores. Builder projects from established developers offer ready-to-move and under-construction options with flexible payment plans and bank loan facilitation. Most apartments feature vitrified tile flooring, modular kitchens, branded bathroom fittings, and adequate ventilation with balconies. The area has witnessed steady appreciation of 8-10% annually, providing solid investment returns.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Living in PM Palem provides practical advantages including proximity to schools, colleges, hospitals, supermarkets, and public transport networks. The locality is well-served by government and private bus services, with auto-rickshaw and app-based cab availability ensuring convenient commuting. Recent infrastructure improvements including road widening, streetlight installations, and drainage systems have enhanced the living experience. The community atmosphere is family-friendly with parks, community halls, and religious establishments creating a cohesive neighborhood environment.
              </p>

              <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-2xl border border-green-100 shadow-sm mb-8">
                <h3 className="text-xl font-semibold text-gray-900 mb-4">Apartment Options in PM Palem</h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">2 BHK Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">850-1100 sq ft</p>
                    <p className="text-green-600 font-bold">₹45L - ₹70L</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">3 BHK Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">1200-1600 sq ft</p>
                    <p className="text-green-600 font-bold">₹70L - ₹1.2Cr</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">Budget 2 BHK</p>
                    <p className="text-sm text-gray-600 mb-2">750-900 sq ft</p>
                    <p className="text-green-600 font-bold">₹35L - ₹50L</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">Premium 3 BHK</p>
                    <p className="text-sm text-gray-600 mb-2">1600-2000 sq ft</p>
                    <p className="text-green-600 font-bold">₹1Cr - ₹1.5Cr</p>
                  </div>
                </div>
              </div>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <Home className="h-8 w-8 text-green-600" />
                Villas in PM Palem
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Independent houses and small villa projects in PM Palem cater to buyers seeking more living space and privacy at reasonable price points. The locality offers both standalone houses and gated villa communities with 2-3 BHK configurations, private gardens, car parking, and independent entrances. These properties are particularly popular among joint families and those who prefer ground-level living with the flexibility to modify interiors according to personal preferences without society restrictions.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Villa and independent house prices in PM Palem typically range from 80 lakhs to 2 crores depending on plot size, construction quality, and specific location within the neighborhood. Many properties are owner-built homes on 100-200 square yard plots, while organized villa projects offer standardized designs with common amenities. The area's relatively lower land costs compared to premium localities make villa ownership accessible to middle-income families seeking independent living arrangements with yards for children and pets.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                The investment perspective for PM Palem villas centers on steady appreciation potential driven by increasing demand from families preferring independent houses over apartments. Rental yields are attractive with 3 BHK independent houses generating 20,000 to 35,000 monthly rents. The locality's established infrastructure, proximity to educational institutions, and availability of daily necessities make these properties suitable for long-term residence with minimal commuting requirements for essential services and amenities.
              </p>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <Landmark className="h-8 w-8 text-green-600" />
                Plots & Open Land in PM Palem
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Residential plots in PM Palem present excellent opportunities for buyers planning custom home construction with budget constraints. VUDA-approved and DTCP-approved layouts are available throughout the locality, offering plot sizes ranging from 100 square yards to 300 square yards suitable for individual house construction. These plots come with basic infrastructure provisions including road access, electricity connections, and water supply pipelines, with clear title documentation and proper legal approvals for hassle-free transactions.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Current land rates in PM Palem are highly competitive, ranging from 8,000 to 15,000 per square yard based on specific location, road width, and proximity to main roads. Plots facing wider roads or located near educational institutions and commercial areas command slightly higher prices but offer better long-term appreciation prospects. The affordability factor makes PM Palem plots accessible to first-time land buyers and those planning phased construction as financial resources become available over time.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Plot buyers in PM Palem benefit from established neighborhood characteristics including functioning civic amenities, existing residential density providing security and community support, and proven track records of completed constructions demonstrating area viability. Construction costs are reasonable with ample availability of contractors, building material suppliers, and architectural services. The combination of affordable land prices and moderate construction costs enables middle-class families to realize homeownership dreams within budget constraints while building equity through property ownership.
              </p>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <DollarSign className="h-8 w-8 text-green-600" />
                PM Palem Property Prices
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                PM Palem offers some of Visakhapatnam's most competitive property prices while maintaining quality standards and essential amenities, making it an attractive destination for value-conscious homebuyers and investors. Average apartment prices currently range from 4,000 to 5,500 per square foot, significantly lower than premium localities while still providing modern living standards. This affordability factor has driven sustained demand from IT professionals, government employees, and middle-income families seeking quality homes within budget parameters.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                The rental market in PM Palem is robust with consistent demand from working professionals, students attending nearby colleges, and small families. A 2 BHK apartment generates monthly rents between 10,000 to 18,000, while 3 BHK units fetch 18,000 to 30,000 per month. Rental yields are attractive at 4-5% annually, higher than premium localities, making PM Palem properties suitable for buy-to-let investment strategies. Vacancy periods are minimal due to strong demand, ensuring regular income for property investors.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Market analysts predict continued steady appreciation in PM Palem driven by ongoing infrastructure development, increasing employment opportunities in nearby IT parks, and the locality's strategic position within Visakhapatnam's urban expansion trajectory. The area's transformation from a peripheral locality to an integrated residential hub has been remarkable, with properties purchased a decade ago showing 100-150% appreciation. Current prices represent attractive entry points for first-time homebuyers and long-term investors seeking stable returns without premium locality risks.
              </p>

              <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6 mb-8">
                <h3 className="text-xl font-semibold text-gray-900 mb-4">Current Price Trends</h3>
                <div className="space-y-4">
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Apartments (per sq ft)</p>
                      <p className="text-sm text-gray-600">Standard complexes</p>
                    </div>
                    <p className="text-lg font-bold text-green-600">₹4,000 - ₹5,500</p>
                  </div>
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Residential Plots (per sq yd)</p>
                      <p className="text-sm text-gray-600">Approved layouts</p>
                    </div>
                    <p className="text-lg font-bold text-green-600">₹8,000 - ₹15,000</p>
                  </div>
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Independent Houses</p>
                      <p className="text-sm text-gray-600">2-3 BHK villas</p>
                    </div>
                    <p className="text-lg font-bold text-green-600">₹80L - ₹2Cr</p>
                  </div>
                  <div className="flex justify-between items-center">
                    <div>
                      <p className="font-medium text-gray-900">Annual Appreciation</p>
                      <p className="text-sm text-gray-600">5-year average</p>
                    </div>
                    <p className="text-lg font-bold text-green-600">8-10%</p>
                  </div>
                </div>
              </div>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <TrendingUp className="h-8 w-8 text-green-600" />
                Why Buy Property in PM Palem?
              </h2>
              <p className="text-gray-700 leading-relaxed mb-6">
                PM Palem represents an ideal balance between affordability, connectivity, and quality of life, making it particularly attractive to first-time homebuyers, young professionals, and middle-income families seeking value-for-money properties. The locality's rapid development over the past decade has transformed it from a peripheral area into a well-integrated residential hub with all essential amenities and infrastructure. Investment in PM Palem offers solid appreciation potential while maintaining affordable entry price points.
              </p>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-xl border border-green-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-green-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Excellent Connectivity</h3>
                  <p className="text-gray-700 text-sm">
                    Strategic location with NH-16 access, regular bus services to all city areas, proximity to railway station, and easy commute to IT parks, making daily travel convenient and time-efficient.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-xl border border-green-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-green-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Affordable Pricing</h3>
                  <p className="text-gray-700 text-sm">
                    Property prices 30-40% lower than premium localities while offering comparable amenities and living standards, enabling homeownership for middle-income families without excessive financial burden.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-xl border border-green-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-green-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Educational Hub</h3>
                  <p className="text-gray-700 text-sm">
                    Surrounded by reputed schools including BHASHYAM, Narayana, Sri Chaitanya, and engineering colleges, providing quality education options within walking or short commuting distance for families with children.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-xl border border-green-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-green-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Complete Infrastructure</h3>
                  <p className="text-gray-700 text-sm">
                    Established neighborhood with supermarkets, banks, ATMs, medical shops, hospitals, temples, parks, and commercial establishments ensuring all daily needs are met within the locality itself.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-xl border border-green-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-green-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">IT Park Proximity</h3>
                  <p className="text-gray-700 text-sm">
                    Close to Madhurawada IT corridor with tech companies, ensuring strong rental demand from IT professionals and providing excellent commute convenience for software employees and tech workers.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-green-50 to-white p-6 rounded-xl border border-green-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-green-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Investment Potential</h3>
                  <p className="text-gray-700 text-sm">
                    Steady appreciation of 8-10% annually, strong rental yields of 4-5%, established residential character providing stability, and ongoing infrastructure improvements supporting long-term value growth.
                  </p>
                </div>
              </div>
            </div>

            <div className="lg:col-span-1">
              <div className="sticky top-24 space-y-6">
                <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6">
                  <h3 className="text-xl font-semibold text-gray-900 mb-4">Quick Facts</h3>
                  <div className="space-y-4">
                    <div className="flex items-start gap-3">
                      <MapPin className="h-5 w-5 text-green-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Location</p>
                        <p className="text-sm text-gray-600">North Visakhapatnam</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <Building2 className="h-5 w-5 text-green-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Property Types</p>
                        <p className="text-sm text-gray-600">Flats, Houses, Plots</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <DollarSign className="h-5 w-5 text-green-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Price Range</p>
                        <p className="text-sm text-gray-600">₹35L - ₹2Cr</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <TrendingUp className="h-5 w-5 text-green-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Growth Rate</p>
                        <p className="text-sm text-gray-600">8-10% annually</p>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="bg-gradient-to-br from-gray-50 to-white rounded-2xl border border-gray-200 p-6">
                  <h3 className="text-lg font-semibold text-gray-900 mb-4">Nearby Areas</h3>
                  <div className="space-y-3">
                    {nearbyAreas.map((area) => (
                      <a
                        key={area.name}
                        href={area.link}
                        className="flex items-center justify-between p-3 bg-white rounded-lg border border-gray-200 hover:border-green-300 hover:shadow-md transition-all group"
                      >
                        <div className="flex items-center gap-2">
                          <MapPin className="h-4 w-4 text-gray-400 group-hover:text-green-600" />
                          <span className="font-medium text-gray-900 group-hover:text-green-600">
                            {area.name}
                          </span>
                        </div>
                        <span className="text-sm text-gray-500">{area.distance}</span>
                      </a>
                    ))}
                  </div>
                  <a
                    href="/vizag"
                    className="mt-4 block text-center text-green-600 hover:text-green-700 font-medium text-sm"
                  >
                    View All Vizag Areas →
                  </a>
                </div>

                <div className="bg-gradient-to-br from-green-600 to-green-700 rounded-2xl p-6 text-white">
                  <h3 className="text-xl font-semibold mb-3">Need Help?</h3>
                  <p className="text-green-100 text-sm mb-4">
                    Get instant assistance via WhatsApp for property queries, site visits, and price negotiations.
                  </p>
                  <a
                    href={getWhatsAppLink("Hi, I'm interested in properties in PM Palem, Vizag")}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="block w-full bg-white text-green-600 px-4 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-all text-center"
                  >
                    Chat on WhatsApp
                  </a>
                </div>
              </div>
            </div>
          </div>

          <h2 className="text-2xl md:text-3xl font-bold text-gray-900 mb-6">
            Latest Properties in PM Palem
          </h2>
          {loading ? (
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {[1, 2, 3].map((i) => (
                <div key={i} className="bg-gray-200 h-80 rounded-2xl animate-pulse" />
              ))}
            </div>
          ) : properties.length > 0 ? (
            <>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {properties.map((property) => (
                  <PropertyCard key={property.id} property={property} />
                ))}
              </div>
              <div className="text-center mt-8">
                <a
                  href="/properties?location=PM Palem"
                  className="inline-flex items-center gap-2 bg-green-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-green-700 transition-all"
                >
                  View All PM Palem Properties
                  <TrendingUp className="h-5 w-5" />
                </a>
              </div>
            </>
          ) : (
            <div className="text-center py-12 bg-gray-50 rounded-2xl">
              <Home className="h-16 w-16 text-gray-400 mx-auto mb-4" />
              <h3 className="text-xl font-semibold text-gray-900 mb-2">No matching properties found in this area.</h3>
              <p className="text-gray-600 mb-6">We couldn't find any properties in PM Palem matching your search</p>
              <button
                onClick={() => openWhatsApp('Hi Vizag Property Experts, I searched for property in PM Palem but found no results. Please share matching options.')}
                className="inline-flex items-center gap-2 bg-green-600 text-white px-6 py-3 rounded-lg font-semibold hover:bg-green-700 transition-all"
              >
                <MessageCircle className="h-5 w-5" />
                Get properties on WhatsApp
              </button>
            </div>
          )}
        </div>
      </section>

      <WhatsAppButton />
    </div>
  )
}
