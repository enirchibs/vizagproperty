import { useEffect, useState } from 'react'
import { Home, TrendingUp, MapPin, DollarSign, Building2, Landmark, CheckCircle, ArrowLeft, MessageCircle } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { Property } from '../types'
import { PropertyCard } from '../components/PropertyCard'
import { WhatsAppButton } from '../components/WhatsAppButton'
import { openWhatsApp, getWhatsAppLink } from '../lib/whatsapp'
import { buildStrictQuery, getLocalityContextBySlug } from '../lib/searchFilters'

export function MVPColonyPage() {
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    document.title = 'Property in MVP Colony Vizag | Established Flats, Villas & Plots for Sale'
    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Find quality flats, villas and plots for sale & rent in MVP Colony, Vizag. Established locality with complete amenities and family-friendly environment.')
    }

    loadMVPColonyProperties()
  }, [])

  const loadMVPColonyProperties = async () => {
    try {
      const localityContext = await getLocalityContextBySlug('mvp-colony')
      if (!localityContext) {
        console.error('MVP Colony locality not found')
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
    { name: 'Gajuwaka', distance: '5 km', link: '/vizag/gajuwaka' },
    { name: 'PM Palem', distance: '7 km', link: '/vizag/pm-palem' },
    { name: 'Madhurawada', distance: '10 km', link: '/vizag/madhurawada' },
  ]

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      <section className="bg-gradient-to-br from-orange-600 to-orange-800 text-white py-12 px-4">
        <div className="max-w-7xl mx-auto">
          <a
            href="/vizag"
            className="inline-flex items-center gap-2 text-orange-100 hover:text-white mb-6 transition-colors"
          >
            <ArrowLeft className="h-5 w-5" />
            Back to Vizag Properties
          </a>
          <div className="max-w-4xl">
            <div className="flex items-center gap-2 text-orange-100 mb-3">
              <MapPin className="h-5 w-5" />
              <span className="text-sm font-medium">Visakhapatnam</span>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold mb-4">
              Property in MVP Colony, Vizag
            </h1>
            <p className="text-xl text-orange-100 mb-6">
              Discover properties in MVP Colony - Vizag's well-established residential area with mature infrastructure and complete civic amenities
            </p>
            <div className="flex flex-wrap gap-3">
              <a
                href="/properties?location=MVP Colony&type=buy"
                className="bg-white text-orange-600 px-6 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-all"
              >
                Search Properties
              </a>
              <a
                href="/"
                className="bg-orange-700 text-white px-6 py-3 rounded-lg font-semibold hover:bg-orange-800 transition-all border-2 border-white/20"
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
                <Building2 className="h-8 w-8 text-orange-600" />
                Flats for Sale in MVP Colony
              </h2>
              <button
                onClick={() => openWhatsApp('Hi Vizag Property Experts, I am looking for property in MVP Colony, Vizag')}
                className="inline-flex items-center gap-2 bg-green-600 text-white px-5 py-2.5 rounded-lg font-medium hover:bg-green-700 transition-all mb-6"
              >
                <MessageCircle className="h-5 w-5" />
                Get Properties on WhatsApp
              </button>
              <p className="text-gray-700 leading-relaxed mb-4">
                MVP Colony stands as one of Visakhapatnam's oldest and most well-established residential localities, offering a unique blend of mature neighborhood character and modern living conveniences. The area features a mix of older apartment buildings and contemporary complexes, providing options across various budget ranges and age preferences. Established in the 1970s and 80s to house Visakhapatnam Steel Plant employees, the locality has evolved into a diverse residential community with excellent social infrastructure and strong community bonds.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Property prices in MVP Colony range from 55 lakhs for 2 BHK apartments in older buildings to 1.3 crores for spacious 3 BHK units in newer constructions with modern amenities. The locality's established nature means many properties are resale apartments with clear titles and immediate possession, attractive to buyers seeking ready-to-move options without construction delays. Recent apartment complexes offer amenities including elevators, covered parking, generators, and water supply, while older buildings provide lower maintenance costs and established living environments.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Living in MVP Colony provides residents with mature tree-lined streets, well-maintained roads, comprehensive drainage systems, and established public services rarely found in newer developments. The locality benefits from decades of infrastructure investment resulting in reliable utilities, established schools, multiple healthcare facilities, diverse shopping options, and vibrant community life. Property appreciation has been steady at 7-9% annually, offering stability rather than speculative gains, making it suitable for conservative investors and long-term residents seeking proven neighborhood quality.
              </p>

              <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-2xl border border-orange-100 shadow-sm mb-8">
                <h3 className="text-xl font-semibold text-gray-900 mb-4">Apartment Options in MVP Colony</h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">2 BHK Resale Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">900-1200 sq ft</p>
                    <p className="text-orange-600 font-bold">₹55L - ₹80L</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">3 BHK Resale Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">1300-1700 sq ft</p>
                    <p className="text-orange-600 font-bold">₹80L - ₹1.1Cr</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">2 BHK New Construction</p>
                    <p className="text-sm text-gray-600 mb-2">1000-1300 sq ft</p>
                    <p className="text-orange-600 font-bold">₹70L - ₹95L</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">3 BHK New Construction</p>
                    <p className="text-sm text-gray-600 mb-2">1500-2000 sq ft</p>
                    <p className="text-orange-600 font-bold">₹1Cr - ₹1.5Cr</p>
                  </div>
                </div>
              </div>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <Home className="h-8 w-8 text-orange-600" />
                Villas in MVP Colony
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Independent houses in MVP Colony represent classic residential properties built during the locality's developmental phase, offering spacious living arrangements on generous plot sizes with mature gardens and established neighborhoods. Many properties are original Steel Plant allotment houses now available for sale, featuring solid construction quality, large rooms, high ceilings, and substantial outdoor spaces. These houses appeal to families valuing traditional architecture, privacy, and the character that comes with established residential areas.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Prices for independent houses in MVP Colony typically range from 1 crore to 2.5 crores depending on plot size, construction condition, and specific location within the colony. Many properties offer renovation potential, allowing buyers to modernize interiors while retaining the structural advantages of older construction including thicker walls, better ventilation, and larger plot sizes. The area's established infrastructure means buyers inherit mature landscapes, established utility connections, and neighborhood amenities developed over decades.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Investment considerations for MVP Colony independent houses focus on land value rather than building depreciation, as many properties occupy plots worth significantly more than construction values. The locality's central location, established reputation, and proximity to major employment centers ensure sustained demand from buyers seeking ground-level living in proven neighborhoods. Rental potential is moderate but stable, with houses generating 25,000 to 45,000 monthly rents from families preferring independent living over apartment complexes.
              </p>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <Landmark className="h-8 w-8 text-orange-600" />
                Plots & Open Land in MVP Colony
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Residential plots in MVP Colony are relatively scarce due to the locality's mature development status, making available land parcels valuable commodities for buyers planning custom home construction. Most plots available for sale are from property owners choosing to subdivide larger holdings or demolish older structures for land sales. These plots typically range from 150 to 300 square yards with clear titles, established utility connections, and immediate development potential without infrastructure waiting periods common in emerging localities.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Current land rates in MVP Colony range from 15,000 to 22,000 per square yard reflecting the locality's established status, central location, and comprehensive infrastructure. While higher than peripheral areas, these rates represent value for buyers prioritizing proven neighborhoods over emerging localities with uncertain development trajectories. Plots in MVP Colony come with inherent advantages including functioning civic services, established drainage systems, mature tree cover, and neighborhood security from long-term resident communities.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Buyers of MVP Colony plots benefit from predictable construction experiences with established contractor networks, known building material suppliers, and clear regulatory frameworks developed over decades of neighborhood evolution. The absence of speculative price volatility common in newer areas provides stability for planned construction projects with multi-year timelines. Land appreciation in MVP Colony has been consistent at 8-10% annually, driven by scarcity rather than development speculation, appealing to conservative investors seeking stable asset appreciation.
              </p>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <DollarSign className="h-8 w-8 text-orange-600" />
                MVP Colony Property Prices
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                MVP Colony property prices reflect its status as an established, mid-range locality with mature infrastructure and proven residential character. Average apartment prices currently stand at 5,000 to 6,500 per square foot, positioning it between premium coastal localities and budget suburban areas. The resale market is particularly active with numerous transactions annually, providing price transparency and liquidity advantages often missing in less established neighborhoods. Buyers benefit from negotiation opportunities with motivated sellers and diverse inventory across price points and property conditions.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                The rental market in MVP Colony is characterized by stable demand from Steel Plant employees, government staff, and families seeking established neighborhoods with schools and amenities. A 2 BHK apartment generates monthly rents of 12,000 to 20,000, while 3 BHK units fetch 20,000 to 35,000 per month. Rental yields average 3.5-4.5% annually, providing steady income streams for investor landlords. Tenant retention tends to be high due to neighborhood stability, reducing vacancy periods and turnover costs compared to transient localities.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Market outlook for MVP Colony emphasizes stability over explosive growth, with appreciation driven by inflation, income growth, and scarcity rather than infrastructure development speculation. The locality's mature status means most infrastructure benefits are already realized, setting realistic expectations for buyers and investors. Properties purchased a decade ago have appreciated 80-100%, demonstrating solid returns without speculative volatility. Current prices offer fair value for buyers prioritizing proven neighborhoods, established communities, and predictable ownership experiences over potential high-growth emerging localities.
              </p>

              <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6 mb-8">
                <h3 className="text-xl font-semibold text-gray-900 mb-4">Current Price Trends</h3>
                <div className="space-y-4">
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Apartments (per sq ft)</p>
                      <p className="text-sm text-gray-600">Resale & new</p>
                    </div>
                    <p className="text-lg font-bold text-orange-600">₹5,000 - ₹6,500</p>
                  </div>
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Residential Plots (per sq yd)</p>
                      <p className="text-sm text-gray-600">Established area</p>
                    </div>
                    <p className="text-lg font-bold text-orange-600">₹15,000 - ₹22,000</p>
                  </div>
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Independent Houses</p>
                      <p className="text-sm text-gray-600">Classic villas</p>
                    </div>
                    <p className="text-lg font-bold text-orange-600">₹1Cr - ₹2.5Cr</p>
                  </div>
                  <div className="flex justify-between items-center">
                    <div>
                      <p className="font-medium text-gray-900">Annual Appreciation</p>
                      <p className="text-sm text-gray-600">5-year average</p>
                    </div>
                    <p className="text-lg font-bold text-green-600">7-9%</p>
                  </div>
                </div>
              </div>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <TrendingUp className="h-8 w-8 text-orange-600" />
                Why Buy Property in MVP Colony?
              </h2>
              <p className="text-gray-700 leading-relaxed mb-6">
                MVP Colony offers compelling advantages for homebuyers and investors valuing neighborhood maturity, proven track records, and comprehensive infrastructure over speculative emerging localities. The area's decades-long residential history provides assurance of sustained community character, established property values, and predictable living experiences. Investment in MVP Colony represents conservative real estate strategy prioritizing stability, liquidity, and known quantities over high-risk, high-reward emerging area speculation.
              </p>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-xl border border-orange-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-orange-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Established Infrastructure</h3>
                  <p className="text-gray-700 text-sm">
                    Mature neighborhood with decades-old infrastructure including paved roads, underground drainage, reliable utilities, street lighting, and maintained public spaces providing hassle-free living.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-xl border border-orange-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-orange-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Educational Excellence</h3>
                  <p className="text-gray-700 text-sm">
                    Surrounded by reputed schools including St. Joseph's, Little Flower, DAV, and engineering colleges, providing proven educational options with established reputations and convenient access.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-xl border border-orange-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-orange-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Central Location</h3>
                  <p className="text-gray-700 text-sm">
                    Strategic positioning providing access to all city areas including Steel Plant, port, railway station, airport, and commercial districts within 20-30 minutes via multiple route options.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-xl border border-orange-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-orange-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Complete Amenities</h3>
                  <p className="text-gray-700 text-sm">
                    Comprehensive civic amenities including hospitals, clinics, pharmacies, supermarkets, banks, ATMs, temples, community centers, parks, and commercial establishments within walking distance.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-xl border border-orange-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-orange-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Strong Community</h3>
                  <p className="text-gray-700 text-sm">
                    Established resident community with multi-generational families, active neighborhood associations, cultural activities, and social cohesion providing safe, familiar living environment.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-orange-50 to-white p-6 rounded-xl border border-orange-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-orange-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Stable Appreciation</h3>
                  <p className="text-gray-700 text-sm">
                    Consistent appreciation of 7-9% annually without speculative volatility, strong resale market with active transactions, proven neighborhood quality, and predictable long-term value growth.
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
                      <MapPin className="h-5 w-5 text-orange-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Location</p>
                        <p className="text-sm text-gray-600">Central Visakhapatnam</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <Building2 className="h-5 w-5 text-orange-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Property Types</p>
                        <p className="text-sm text-gray-600">Flats, Houses, Plots</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <DollarSign className="h-5 w-5 text-orange-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Price Range</p>
                        <p className="text-sm text-gray-600">₹55L - ₹2.5Cr</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <TrendingUp className="h-5 w-5 text-orange-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Growth Rate</p>
                        <p className="text-sm text-gray-600">7-9% annually</p>
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
                        className="flex items-center justify-between p-3 bg-white rounded-lg border border-gray-200 hover:border-orange-300 hover:shadow-md transition-all group"
                      >
                        <div className="flex items-center gap-2">
                          <MapPin className="h-4 w-4 text-gray-400 group-hover:text-orange-600" />
                          <span className="font-medium text-gray-900 group-hover:text-orange-600">
                            {area.name}
                          </span>
                        </div>
                        <span className="text-sm text-gray-500">{area.distance}</span>
                      </a>
                    ))}
                  </div>
                  <a
                    href="/vizag"
                    className="mt-4 block text-center text-orange-600 hover:text-orange-700 font-medium text-sm"
                  >
                    View All Vizag Areas →
                  </a>
                </div>

                <div className="bg-gradient-to-br from-orange-600 to-orange-700 rounded-2xl p-6 text-white">
                  <h3 className="text-xl font-semibold mb-3">Need Help?</h3>
                  <p className="text-orange-100 text-sm mb-4">
                    Get instant assistance via WhatsApp for property queries, site visits, and price negotiations.
                  </p>
                  <a
                    href={getWhatsAppLink("Hi, I'm interested in properties in MVP Colony, Vizag")}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="block w-full bg-white text-orange-600 px-4 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-all text-center"
                  >
                    Chat on WhatsApp
                  </a>
                </div>
              </div>
            </div>
          </div>

          <h2 className="text-2xl md:text-3xl font-bold text-gray-900 mb-6">
            Latest Properties in MVP Colony
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
                  href="/properties?location=MVP Colony"
                  className="inline-flex items-center gap-2 bg-orange-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-orange-700 transition-all"
                >
                  View All MVP Colony Properties
                  <TrendingUp className="h-5 w-5" />
                </a>
              </div>
            </>
          ) : (
            <div className="text-center py-12 bg-gray-50 rounded-2xl">
              <Home className="h-16 w-16 text-gray-400 mx-auto mb-4" />
              <h3 className="text-xl font-semibold text-gray-900 mb-2">No matching properties found in this area.</h3>
              <p className="text-gray-600 mb-6">We couldn't find any properties in MVP Colony matching your search</p>
              <button
                onClick={() => openWhatsApp('Hi Vizag Property Experts, I searched for property in MVP Colony but found no results. Please share matching options.')}
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
