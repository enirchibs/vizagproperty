import { useEffect, useState } from 'react'
import { Home, TrendingUp, MapPin, DollarSign, Building2, Landmark, CheckCircle, ArrowLeft, MessageCircle } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { Property } from '../types'
import { PropertyCard } from '../components/PropertyCard'
import { WhatsAppButton } from '../components/WhatsAppButton'
import { buildStrictQuery, getLocalityContextBySlug } from '../lib/searchFilters'
import { openWhatsApp } from '../lib/whatsapp'

export function YendadaPage() {
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    document.title = 'Property in Yendada Vizag | Premium Flats, Villas & Plots for Sale'
    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Find premium flats, villas and plots for sale & rent in Yendada, Vizag. Beachside living with luxury apartments and excellent amenities.')
    }

    loadYendadaProperties()
  }, [])

  const loadYendadaProperties = async () => {
    try {
      const localityContext = await getLocalityContextBySlug('yendada')
      if (!localityContext) {
        console.error('Yendada locality not found')
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
    { name: 'Madhurawada', distance: '4 km', link: '/vizag/madhurawada' },
    { name: 'Rushikonda', distance: '2 km', link: '/properties?location=Rushikonda' },
    { name: 'PM Palem', distance: '6 km', link: '/vizag/pm-palem' },
  ]

  return (
    <div className="min-h-screen bg-gradient-to-b from-gray-50 to-white">
      <section className="bg-gradient-to-br from-blue-600 to-blue-800 text-white py-12 px-4">
        <div className="max-w-7xl mx-auto">
          <a
            href="/vizag"
            className="inline-flex items-center gap-2 text-blue-100 hover:text-white mb-6 transition-colors"
          >
            <ArrowLeft className="h-5 w-5" />
            Back to Vizag Properties
          </a>
          <div className="max-w-4xl">
            <div className="flex items-center gap-2 text-blue-100 mb-3">
              <MapPin className="h-5 w-5" />
              <span className="text-sm font-medium">Visakhapatnam</span>
            </div>
            <h1 className="text-4xl md:text-5xl font-bold mb-4">
              Property in Yendada, Vizag
            </h1>
            <p className="text-xl text-blue-100 mb-6">
              Discover premium beachside properties in Yendada - Vizag's upscale coastal neighborhood with luxury apartments and stunning sea views
            </p>
            <div className="flex flex-wrap gap-3">
              <a
                href="/properties?location=Yendada&type=buy"
                className="bg-white text-blue-600 px-6 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-all"
              >
                Search Properties
              </a>
              <a
                href="/"
                className="bg-blue-700 text-white px-6 py-3 rounded-lg font-semibold hover:bg-blue-800 transition-all border-2 border-white/20"
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
                <Building2 className="h-8 w-8 text-blue-600" />
                Flats for Sale in Yendada
              </h2>
              <button
                onClick={() => openWhatsApp('Hi Vizag Property Experts, I am looking for property in Yendada, Vizag')}
                className="inline-flex items-center gap-2 bg-green-600 text-white px-5 py-2.5 rounded-lg font-medium hover:bg-green-700 transition-all mb-6"
              >
                <MessageCircle className="h-5 w-5" />
                Get Properties on WhatsApp
              </button>
              <p className="text-gray-700 leading-relaxed mb-4">
                Yendada represents the epitome of luxury living in Visakhapatnam, offering premium beachfront and near-beach apartment complexes with world-class amenities. The locality attracts affluent buyers seeking high-end residential properties with spectacular Bay of Bengal views, infinity pools, private beach access, and concierge services. Apartments here feature contemporary architecture, smart home automation, Italian marble flooring, and designer modular kitchens with imported fittings.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Property prices in Yendada reflect its premium positioning, with 3 BHK apartments starting from 1.2 crores and extending up to 3.5 crores for penthouses with private terraces and panoramic ocean views. The area hosts several iconic residential towers developed by reputed national and international builders, offering amenities such as rooftop infinity pools, sky lounges, private theatres, spa facilities, and multi-tier security systems. Most projects are IGBC-certified green buildings with rainwater harvesting and solar power integration.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Living in Yendada provides unmatched lifestyle advantages including morning beach walks, water sports access, and proximity to premium restaurants, cafes, and boutique shopping centers. The locality enjoys excellent connectivity to the city center, IT parks, and international schools. Property appreciation in Yendada has consistently outperformed other Vizag localities, averaging 12-15% annually, driven by limited land availability and sustained demand from high-net-worth individuals and NRIs seeking vacation homes.
              </p>

              <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-2xl border border-blue-100 shadow-sm mb-8">
                <h3 className="text-xl font-semibold text-gray-900 mb-4">Premium Apartment Types in Yendada</h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">3 BHK Luxury Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">1800-2200 sq ft</p>
                    <p className="text-blue-600 font-bold">₹1.2Cr - ₹2Cr</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">4 BHK Sea View Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">2500-3200 sq ft</p>
                    <p className="text-blue-600 font-bold">₹2Cr - ₹3Cr</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">Penthouses</p>
                    <p className="text-sm text-gray-600 mb-2">3500-5000 sq ft</p>
                    <p className="text-blue-600 font-bold">₹2.5Cr - ₹5Cr</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">Duplex Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">4000+ sq ft</p>
                    <p className="text-blue-600 font-bold">₹3Cr+</p>
                  </div>
                </div>
              </div>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <Home className="h-8 w-8 text-blue-600" />
                Villas in Yendada
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Yendada's villa segment caters to ultra-luxury buyers with beachfront independent houses and gated villa communities offering uncompromising privacy and exclusivity. These properties feature Mediterranean, contemporary, and minimalist architectural styles with private swimming pools, landscaped gardens, rooftop entertainment areas, and dedicated staff quarters. Villa plots typically range from 400 to 1000 square yards with built-up areas exceeding 5000 square feet.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Prices for villas in Yendada start from 4 crores for standard properties and can exceed 10 crores for beachfront estates with private beach access. These homes come equipped with state-of-the-art home automation, multi-car basements, wine cellars, home gyms, and entertainment zones. The locality's villas are popular among business owners, celebrities, and expatriates seeking a permanent coastal residence with resort-style living amenities.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                The investment appeal of Yendada villas lies in their scarcity value and consistent high rental yields from corporate leases and vacation rentals. Many villa owners earn 3-5 lakhs monthly through short-term luxury vacation rentals during peak tourist seasons. The presence of international schools within 5 km radius, premium healthcare facilities, and helicopter connectivity to the airport make Yendada villas a practical choice for wealthy families despite the premium pricing.
              </p>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <Landmark className="h-8 w-8 text-blue-600" />
                Plots & Open Land in Yendada
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Residential plots in Yendada are extremely limited and highly coveted, representing some of the most expensive land parcels in Andhra Pradesh. Available plots are primarily in established gated communities with comprehensive infrastructure including underground utilities, landscaped boulevards, 24/7 security, and community clubhouses. Plot sizes range from 300 square yards to 800 square yards, with larger parcels occasionally available for custom estate development.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Current land rates in Yendada vary dramatically based on beach proximity, with beachfront plots commanding 40,000 to 60,000 per square yard, while inland plots range from 25,000 to 35,000 per square yard. All land sales undergo stringent verification with clear VUDA approvals, proper documentation, and no encumbrance certificates. Plots facing the beach or with elevated positions offering sea views attract significant premiums and are often pre-booked before public listing.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Buyers of Yendada plots typically engage renowned architects to design custom luxury homes maximizing views and utilizing vastu-compliant layouts. Construction regulations are stringent with height restrictions, setback requirements, and aesthetic guidelines to maintain the locality's premium character. The combination of limited supply, beachfront location, and infrastructure development has resulted in land appreciation of 15-20% annually, making Yendada plots excellent long-term investment vehicles for wealth preservation and generational property holdings.
              </p>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <DollarSign className="h-8 w-8 text-blue-600" />
                Yendada Property Prices
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Yendada commands Visakhapatnam's highest property prices, justified by its beachfront location, premium infrastructure, and exclusive community profile. Current apartment prices average 8,000 to 12,000 per square foot for luxury high-rises, significantly higher than the city average. Sea-facing apartments and penthouses with unobstructed ocean views command premiums of 20-30% over their inland counterparts within the same project, reflecting the immense value placed on coastal living experiences.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                The rental market in Yendada is robust and sophisticated, catering to corporate executives, expatriates, and affluent families. A 3 BHK luxury apartment generates monthly rents between 50,000 to 80,000, while 4 BHK penthouses fetch 1 to 1.5 lakhs per month. Furnished properties with modern amenities command additional premiums. Rental yields typically range from 3-4% annually, which while modest percentage-wise, represent substantial absolute returns given the high property values.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Market analysts predict continued appreciation in Yendada driven by Visakhapatnam's emergence as a major economic hub, increasing affluence levels, and limited coastal land availability. The proposed beach road extension, new convention center, and luxury hotel developments will further enhance the locality's appeal. Properties purchased five years ago have nearly doubled in value, and experts forecast another 60-70% appreciation over the next five years, making current prices attractive entry points for long-term investors.
              </p>

              <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6 mb-8">
                <h3 className="text-xl font-semibold text-gray-900 mb-4">Current Price Trends</h3>
                <div className="space-y-4">
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Luxury Apartments (per sq ft)</p>
                      <p className="text-sm text-gray-600">Premium towers</p>
                    </div>
                    <p className="text-lg font-bold text-blue-600">₹8,000 - ₹12,000</p>
                  </div>
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Residential Plots (per sq yd)</p>
                      <p className="text-sm text-gray-600">Gated communities</p>
                    </div>
                    <p className="text-lg font-bold text-blue-600">₹25,000 - ₹60,000</p>
                  </div>
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Luxury Villas</p>
                      <p className="text-sm text-gray-600">Independent houses</p>
                    </div>
                    <p className="text-lg font-bold text-blue-600">₹4Cr - ₹10Cr+</p>
                  </div>
                  <div className="flex justify-between items-center">
                    <div>
                      <p className="font-medium text-gray-900">Annual Appreciation</p>
                      <p className="text-sm text-gray-600">5-year average</p>
                    </div>
                    <p className="text-lg font-bold text-green-600">12-15%</p>
                  </div>
                </div>
              </div>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <TrendingUp className="h-8 w-8 text-blue-600" />
                Why Buy Property in Yendada?
              </h2>
              <p className="text-gray-700 leading-relaxed mb-6">
                Yendada represents the pinnacle of coastal luxury living in Visakhapatnam, offering a unique combination of natural beauty, modern infrastructure, and exclusive lifestyle amenities. The locality's transformation into an elite residential destination has been driven by meticulous urban planning, premium real estate developments, and a discerning community of residents who value quality of life over affordability. Investment in Yendada property offers not just financial returns but an aspirational lifestyle upgrade.
              </p>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border border-blue-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-blue-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Beachfront Location</h3>
                  <p className="text-gray-700 text-sm">
                    Direct beach access and stunning Bay of Bengal views, offering resort-style coastal living with water sports, beach clubs, and pristine shoreline within walking distance from home.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border border-blue-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-blue-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Premium Education</h3>
                  <p className="text-gray-700 text-sm">
                    Proximity to international schools including Visakha Valley School, Delhi Public School, and The Aga Khan Academy, providing world-class education options for children of residents.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border border-blue-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-blue-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Excellent Connectivity</h3>
                  <p className="text-gray-700 text-sm">
                    Well-connected to airport, railway station, and IT parks via National Highway-16, with the Beach Road providing scenic coastal drives to all major city destinations in 20-30 minutes.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border border-blue-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-blue-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Luxury Lifestyle</h3>
                  <p className="text-gray-700 text-sm">
                    Access to fine dining restaurants, beach shacks, premium shopping boutiques, wellness centers, yacht clubs, and entertainment venues creating a sophisticated urban beach lifestyle.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border border-blue-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-blue-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Healthcare Access</h3>
                  <p className="text-gray-700 text-sm">
                    Proximity to premier hospitals including Seven Hills Hospital, KIMS, and Apollo, ensuring immediate access to advanced medical care and emergency services round the clock.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border border-blue-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-blue-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Investment Returns</h3>
                  <p className="text-gray-700 text-sm">
                    Superior appreciation rates of 12-15% annually, strong rental demand from corporates and expatriates, limited supply driving long-term value, and status symbol appeal maintaining premium positioning.
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
                      <MapPin className="h-5 w-5 text-blue-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Location</p>
                        <p className="text-sm text-gray-600">Coastal North Vizag</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <Building2 className="h-5 w-5 text-blue-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Property Types</p>
                        <p className="text-sm text-gray-600">Luxury Flats, Villas, Plots</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <DollarSign className="h-5 w-5 text-blue-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Price Range</p>
                        <p className="text-sm text-gray-600">₹1.2Cr - ₹10Cr+</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <TrendingUp className="h-5 w-5 text-blue-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Growth Rate</p>
                        <p className="text-sm text-gray-600">12-15% annually</p>
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
                        className="flex items-center justify-between p-3 bg-white rounded-lg border border-gray-200 hover:border-blue-300 hover:shadow-md transition-all group"
                      >
                        <div className="flex items-center gap-2">
                          <MapPin className="h-4 w-4 text-gray-400 group-hover:text-blue-600" />
                          <span className="font-medium text-gray-900 group-hover:text-blue-600">
                            {area.name}
                          </span>
                        </div>
                        <span className="text-sm text-gray-500">{area.distance}</span>
                      </a>
                    ))}
                  </div>
                  <a
                    href="/vizag"
                    className="mt-4 block text-center text-blue-600 hover:text-blue-700 font-medium text-sm"
                  >
                    View All Vizag Areas →
                  </a>
                </div>

                <div className="bg-gradient-to-br from-blue-600 to-blue-700 rounded-2xl p-6 text-white">
                  <h3 className="text-xl font-semibold mb-3">Need Help?</h3>
                  <p className="text-blue-100 text-sm mb-4">
                    Get instant assistance via WhatsApp for property queries, site visits, and price negotiations.
                  </p>
                  <a
                    href="https://wa.me/919876543210?text=Hi, I'm interested in properties in Yendada, Vizag"
                    target="_blank"
                    rel="noopener noreferrer"
                    className="block w-full bg-white text-blue-600 px-4 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-all text-center"
                  >
                    Chat on WhatsApp
                  </a>
                </div>
              </div>
            </div>
          </div>

          <h2 className="text-2xl md:text-3xl font-bold text-gray-900 mb-6">
            Latest Properties in Yendada
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
                  href="/properties?location=Yendada"
                  className="inline-flex items-center gap-2 bg-blue-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-blue-700 transition-all"
                >
                  View All Yendada Properties
                  <TrendingUp className="h-5 w-5" />
                </a>
              </div>
            </>
          ) : (
            <div className="text-center py-12 bg-gray-50 rounded-2xl">
              <Home className="h-16 w-16 text-gray-400 mx-auto mb-4" />
              <h3 className="text-xl font-semibold text-gray-900 mb-2">No matching properties found in this area.</h3>
              <p className="text-gray-600 mb-6">We couldn't find any properties in Yendada matching your search</p>
              <button
                onClick={() => openWhatsApp('Hi Vizag Property Experts, I searched for property in Yendada but found no results. Please share matching options.')}
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
