import { useEffect, useState } from 'react'
import { Home, TrendingUp, MapPin, DollarSign, Building2, Landmark, CheckCircle, ArrowLeft } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { Property } from '../types'
import { PropertyCard } from '../components/PropertyCard'
import { WhatsAppButton } from '../components/WhatsAppButton'
import { buildStrictQuery, getLocalityContext } from '../lib/searchFilters'

export function GajuwakaPage() {
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    document.title = 'Property in Gajuwaka Vizag | Budget-Friendly Flats, Villas & Plots for Sale'
    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Find budget-friendly flats, villas and plots for sale & rent in Gajuwaka, Vizag. Affordable properties with good connectivity and growing infrastructure.')
    }

    loadGajuwakaProperties()
  }, [])

  const loadGajuwakaProperties = async () => {
    try {
      // STRICT: Gajuwaka locality only
      const localityContext = getLocalityContext('gajuwaka')
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
    { name: 'MVP Colony', distance: '5 km', link: '/vizag/mvp-colony' },
    { name: 'PM Palem', distance: '8 km', link: '/vizag/pm-palem' },
    { name: 'Madhurawada', distance: '12 km', link: '/vizag/madhurawada' },
  ]

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      <section className="bg-gradient-to-br from-teal-600 to-teal-800 text-white py-12 px-4">
        <div className="max-w-7xl mx-auto">
          <a
            href="/vizag"
            className="inline-flex items-center gap-2 text-teal-100 hover:text-white mb-6 transition-colors"
          >
            <ArrowLeft className="h-5 w-5" />
            Back to Vizag Properties
          </a>
          <div className="max-w-4xl">
            <div className="flex items-center gap-2 text-teal-100 mb-3">
              <MapPin className="h-5 w-5" />
              <span className="text-sm font-medium">Visakhapatnam</span>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold mb-4">
              Property in Gajuwaka, Vizag
            </h1>
            <p className="text-xl text-teal-100 mb-6">
              Discover budget-friendly properties in Gajuwaka - Vizag's affordable residential and industrial hub with excellent growth potential
            </p>
            <div className="flex flex-wrap gap-3">
              <a
                href="/properties?location=Gajuwaka&type=buy"
                className="bg-white text-teal-600 px-6 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-all"
              >
                Search Properties
              </a>
              <a
                href="/"
                className="bg-teal-700 text-white px-6 py-3 rounded-lg font-semibold hover:bg-teal-800 transition-all border-2 border-white/20"
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
              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <Building2 className="h-8 w-8 text-teal-600" />
                Flats for Sale in Gajuwaka
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Gajuwaka represents one of Visakhapatnam's most affordable residential areas, offering budget-conscious homebuyers substantial value for money without compromising on basic living standards. The locality features numerous apartment complexes catering to lower and middle-income families, with property options ranging from compact 1 BHK units to spacious 3 BHK apartments. As a historically industrial area housing workers from Steel Plant and port industries, Gajuwaka has evolved into a diverse residential community with improving infrastructure and expanding commercial facilities.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Property prices in Gajuwaka are notably economical, with 2 BHK apartments starting from just 30 lakhs and 3 BHK units available between 50 lakhs to 80 lakhs, making homeownership accessible to first-time buyers and young families with limited budgets. Both ready-to-move resale properties and new construction projects offer flexible options for immediate occupation or future possession. While amenities may be more basic compared to premium localities, most complexes provide essential facilities including security guards, water supply systems, and parking arrangements suitable for practical family living.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Living in Gajuwaka provides significant cost savings on property purchase, maintenance charges, and overall living expenses compared to central or coastal localities. The area benefits from proximity to industrial employment centers including Steel Plant, HPCL refinery, and port operations, ensuring steady rental demand from industrial workers. Recent infrastructure improvements including road widening projects, improved bus connectivity, and ongoing metro rail planning are gradually enhancing the locality's appeal. Property appreciation of 6-8% annually offers modest but reliable returns for patient investors focusing on affordability rather than rapid gains.
              </p>

              <div className="bg-gradient-to-br from-teal-50 to-white p-6 rounded-2xl border border-teal-100 shadow-sm mb-8">
                <h3 className="text-xl font-semibold text-gray-900 mb-4">Affordable Apartment Options in Gajuwaka</h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">1 BHK Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">500-700 sq ft</p>
                    <p className="text-teal-600 font-bold">₹20L - ₹35L</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">2 BHK Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">800-1100 sq ft</p>
                    <p className="text-teal-600 font-bold">₹30L - ₹55L</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">3 BHK Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">1200-1500 sq ft</p>
                    <p className="text-teal-600 font-bold">₹50L - ₹80L</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">Premium 3 BHK</p>
                    <p className="text-sm text-gray-600 mb-2">1500-1800 sq ft</p>
                    <p className="text-teal-600 font-bold">₹75L - ₹1Cr</p>
                  </div>
                </div>
              </div>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <Home className="h-8 w-8 text-teal-600" />
                Villas in Gajuwaka
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Independent houses in Gajuwaka primarily consist of modest single and double-story residential structures built on compact plots, catering to families preferring ground-level living arrangements within tight budget constraints. These properties typically feature basic construction with 2-3 bedrooms, simple interiors, small courtyards or yards, and functional layouts prioritizing space efficiency over luxury. Many houses are owner-occupied worker residences from earlier decades now entering the resale market as original owners retire or relocate.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Prices for independent houses in Gajuwaka range from 40 lakhs for small 2 BHK structures to 1.2 crores for larger properties on better plots with renovation potential. The affordability factor makes independent house ownership accessible to blue-collar workers, small business owners, and families unwilling to commit to apartment society living and maintenance charges. Many properties offer rebuild potential where land value exceeds structure value, providing future development flexibility as neighborhood characteristics evolve over time.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Investment perspectives for Gajuwaka independent houses focus on ultra-affordable entry points with minimal risk exposure and potential upside from infrastructure development driving neighborhood transformation. Rental markets are modest with houses generating 8,000 to 20,000 monthly incomes from industrial workers, small families, and bachelor groups sharing accommodations. The locality's proximity to major employment centers ensures consistent demand from budget-conscious renters prioritizing proximity to workplaces over residential amenities and prestige.
              </p>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <Landmark className="h-8 w-8 text-teal-600" />
                Plots & Open Land in Gajuwaka
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Residential plots in Gajuwaka offer Visakhapatnam's most affordable land prices for buyers planning budget home construction or long-term land banking strategies. Available plots range from 80 square yards for compact house construction to 200 square yards for standard family homes, with VUDA-approved and DTCP-approved layouts providing legal development assurance. These plots come with basic infrastructure frameworks including road access and electricity supply, with water connections requiring individual arrangements through corporation or borewell installations.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Current land rates in Gajuwaka are exceptionally competitive at 5,000 to 10,000 per square yard, representing entry-level pricing for land ownership in Visakhapatnam's urban limits. This affordability enables first-generation property buyers to establish real estate footprints and build equity through phased construction as financial resources accumulate. While lacking the prestige and amenities of premium localities, Gajuwaka plots provide functional land ownership with development flexibility and protection against inflation through tangible asset ownership.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Plot buyers in Gajuwaka typically follow self-build models using local contractors and standard construction materials, with building costs remaining moderate due to competitive supplier markets and available skilled labor. The investment proposition centers on maximum affordability with baseline growth expectations, suitable for buyers prioritizing ownership over rental payments regardless of locality prestige. Land appreciation prospects depend heavily on infrastructure development including proposed metro connectivity and road network improvements, which could catalyze neighborhood transformation and significantly enhance property values over coming years.
              </p>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <DollarSign className="h-8 w-8 text-teal-600" />
                Gajuwaka Property Prices
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Gajuwaka maintains Visakhapatnam's lowest property price points while remaining within municipal corporation limits with urban infrastructure access. Average apartment prices currently range from 2,800 to 4,000 per square foot, enabling full ownership at costs comparable to down payments required for premium locality properties. This extreme affordability creates opportunities for budget buyers, investors seeking high rental yields, and those willing to accept longer-term appreciation timelines in exchange for minimal entry barriers and low financial risk exposure.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                The rental market in Gajuwaka serves primarily industrial workers, lower-income families, and student groups attending nearby colleges and technical institutes. A 2 BHK apartment generates monthly rents of 6,000 to 12,000, while 3 BHK units fetch 10,000 to 18,000 per month. Despite modest absolute rental values, yields are impressive at 5-6% annually due to low property prices, making Gajuwaka attractive for investors prioritizing income returns over capital appreciation. Tenant turnover can be higher compared to premium localities, requiring active property management and maintenance oversight.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Market outlook for Gajuwaka emphasizes transformation potential driven by infrastructure investments and industrial expansion rather than current amenity levels or social prestige. The proposed Visakhapatnam Metro Rail passing through Gajuwaka could significantly enhance connectivity and property values. Properties purchased at current depressed prices offer asymmetric risk-reward profiles with limited downside given extreme affordability and substantial upside potential if infrastructure development materializes. Current prices represent maximum accessibility for entry into Visakhapatnam property markets with genuine ownership aspirations rather than speculative trading interests.
              </p>

              <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6 mb-8">
                <h3 className="text-xl font-semibold text-gray-900 mb-4">Current Price Trends</h3>
                <div className="space-y-4">
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Apartments (per sq ft)</p>
                      <p className="text-sm text-gray-600">Budget housing</p>
                    </div>
                    <p className="text-lg font-bold text-teal-600">₹2,800 - ₹4,000</p>
                  </div>
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Residential Plots (per sq yd)</p>
                      <p className="text-sm text-gray-600">Approved layouts</p>
                    </div>
                    <p className="text-lg font-bold text-teal-600">₹5,000 - ₹10,000</p>
                  </div>
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Independent Houses</p>
                      <p className="text-sm text-gray-600">2-3 BHK basic</p>
                    </div>
                    <p className="text-lg font-bold text-teal-600">₹40L - ₹1.2Cr</p>
                  </div>
                  <div className="flex justify-between items-center">
                    <div>
                      <p className="font-medium text-gray-900">Annual Appreciation</p>
                      <p className="text-sm text-gray-600">5-year average</p>
                    </div>
                    <p className="text-lg font-bold text-green-600">6-8%</p>
                  </div>
                </div>
              </div>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <TrendingUp className="h-8 w-8 text-teal-600" />
                Why Buy Property in Gajuwaka?
              </h2>
              <p className="text-gray-700 leading-relaxed mb-6">
                Gajuwaka offers unmatched affordability for homebuyers prioritizing ownership over rental payments regardless of locality prestige or current amenity levels. The area's budget-friendly pricing enables property ownership for income groups typically excluded from urban real estate markets, creating pathways to wealth building through equity accumulation. Investment in Gajuwaka represents high-risk, high-reward positioning with potential significant upside from infrastructure development while maintaining extremely low entry barriers and minimal absolute loss exposure given depressed current valuations.
              </p>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="bg-gradient-to-br from-teal-50 to-white p-6 rounded-xl border border-teal-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-teal-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Maximum Affordability</h3>
                  <p className="text-gray-700 text-sm">
                    Visakhapatnam's lowest property prices enabling full ownership at costs comparable to premium locality down payments, making homeownership accessible to budget-conscious families and first-time buyers.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-teal-50 to-white p-6 rounded-xl border border-teal-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-teal-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Industrial Employment</h3>
                  <p className="text-gray-700 text-sm">
                    Proximity to Steel Plant, HPCL refinery, port operations, and manufacturing units ensuring steady employment base and consistent rental demand from industrial workforce population.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-teal-50 to-white p-6 rounded-xl border border-teal-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-teal-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Metro Connectivity</h3>
                  <p className="text-gray-700 text-sm">
                    Proposed Visakhapatnam Metro Rail corridor passing through Gajuwaka promising dramatically improved connectivity to all city areas and potential property value appreciation from infrastructure development.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-teal-50 to-white p-6 rounded-xl border border-teal-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-teal-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">High Rental Yields</h3>
                  <p className="text-gray-700 text-sm">
                    Impressive 5-6% annual rental yields due to low property prices and consistent tenant demand from industrial workers, making it attractive for income-focused real estate investors.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-teal-50 to-white p-6 rounded-xl border border-teal-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-teal-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Education Access</h3>
                  <p className="text-gray-700 text-sm">
                    Multiple schools, junior colleges, and technical training institutes serving working-class families with quality education options at affordable fee structures suitable for lower-income households.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-teal-50 to-white p-6 rounded-xl border border-teal-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-teal-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Transformation Potential</h3>
                  <p className="text-gray-700 text-sm">
                    Significant upside potential from ongoing infrastructure improvements, industrial expansion, and urban development initiatives that could transform neighborhood character and substantially increase property valuations.
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
                      <MapPin className="h-5 w-5 text-teal-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Location</p>
                        <p className="text-sm text-gray-600">West Visakhapatnam</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <Building2 className="h-5 w-5 text-teal-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Property Types</p>
                        <p className="text-sm text-gray-600">Budget Flats, Houses, Plots</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <DollarSign className="h-5 w-5 text-teal-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Price Range</p>
                        <p className="text-sm text-gray-600">₹20L - ₹1.2Cr</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <TrendingUp className="h-5 w-5 text-teal-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Growth Rate</p>
                        <p className="text-sm text-gray-600">6-8% annually</p>
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
                        className="flex items-center justify-between p-3 bg-white rounded-lg border border-gray-200 hover:border-teal-300 hover:shadow-md transition-all group"
                      >
                        <div className="flex items-center gap-2">
                          <MapPin className="h-4 w-4 text-gray-400 group-hover:text-teal-600" />
                          <span className="font-medium text-gray-900 group-hover:text-teal-600">
                            {area.name}
                          </span>
                        </div>
                        <span className="text-sm text-gray-500">{area.distance}</span>
                      </a>
                    ))}
                  </div>
                  <a
                    href="/vizag"
                    className="mt-4 block text-center text-teal-600 hover:text-teal-700 font-medium text-sm"
                  >
                    View All Vizag Areas →
                  </a>
                </div>

                <div className="bg-gradient-to-br from-teal-600 to-teal-700 rounded-2xl p-6 text-white">
                  <h3 className="text-xl font-semibold mb-3">Need Help?</h3>
                  <p className="text-teal-100 text-sm mb-4">
                    Get instant assistance via WhatsApp for property queries, site visits, and price negotiations.
                  </p>
                  <a
                    href="https://wa.me/919876543210?text=Hi, I'm interested in properties in Gajuwaka, Vizag"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="block w-full bg-white text-teal-600 px-4 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-all text-center"
                  >
                    Chat on WhatsApp
                  </a>
                </div>
              </div>
            </div>
          </div>

          {properties.length > 0 && (
            <>
              <h2 className="text-2xl md:text-3xl font-bold text-gray-900 mb-6">
                Latest Properties in Gajuwaka
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
                  href="/properties?location=Gajuwaka"
                  className="inline-flex items-center gap-2 bg-teal-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-teal-700 transition-all"
                >
                  View All Gajuwaka Properties
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
