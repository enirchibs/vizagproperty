import { useEffect, useState } from 'react'
import { Home, TrendingUp, MapPin, DollarSign, Building2, Landmark, CheckCircle, ArrowLeft, MessageCircle } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { Property } from '../types'
import { WhatsAppButton } from '../components/WhatsAppButton'
import { openWhatsApp, getWhatsAppLink } from '../lib/whatsapp'

export function MadhurawadaPage() {
  const [properties, setProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    document.title = 'Property in Madhurawada Vizag | Flats, Villas & Plots for Sale'
    const metaDescription = document.querySelector('meta[name="description"]')
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Find verified flats, villas and plots for sale & rent in Madhurawada, Vizag. AI-powered property search with transparent pricing.')
    }

    loadMadhurawadaProperties()
  }, [])

  const loadMadhurawadaProperties = async () => {
    try {
      const { data, error } = await supabase
        .from('properties')
        .select('*, localities!inner(name, slug, city)')
        .eq('localities.city', 'Visakhapatnam')
        .eq('status', 'approved')
        .order('created_at', { ascending: false })
        .limit(50)

      if (error) throw error
      setProperties(data || [])
    } catch (error) {
      console.error('Error loading properties:', error)
    } finally {
      setLoading(false)
    }
  }

  const nearbyAreas = [
    { name: 'Yendada', distance: '4 km' },
    { name: 'PM Palem', distance: '3 km' },
    { name: 'Rushikonda', distance: '5 km' },
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
              Property in Madhurawada, Vizag
            </h1>
            <p className="text-xl text-blue-100 mb-6">
              Discover premium flats, villas and plots in Madhurawada - Vizag's emerging IT hub with modern infrastructure and excellent connectivity
            </p>
            <div className="flex flex-wrap gap-3">
              <a
                href="/properties?location=Madhurawada&type=buy"
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
                Flats for Sale in Madhurawada
              </h2>
              <button
                onClick={() => openWhatsApp('Hi Vizag Property Experts, I am looking for property in Madhurawada, Vizag')}
                className="inline-flex items-center gap-2 bg-green-600 text-white px-5 py-2.5 rounded-lg font-medium hover:bg-green-700 transition-all mb-6"
              >
                <MessageCircle className="h-5 w-5" />
                Get Properties on WhatsApp
              </button>
              <p className="text-gray-700 leading-relaxed mb-4">
                Madhurawada has emerged as one of Visakhapatnam's most sought-after residential localities, offering a perfect blend of modern living and strategic location advantages. The area features numerous gated apartment communities with contemporary amenities including swimming pools, gymnasiums, children's play areas, and 24/7 security. Property seekers find Madhurawada attractive for its proximity to IT parks, educational institutions, and healthcare facilities.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Apartments in Madhurawada range from compact 2 BHK units starting at 65 lakhs to spacious 4 BHK penthouses priced up to 1.5 crores. The locality has witnessed consistent appreciation of 10-12% annually over the past five years, driven by excellent infrastructure development and growing employment opportunities in nearby IT corridors. Builder projects from reputed developers offer ready-to-move and under-construction options with modern specifications.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                The area's well-planned road network, regular public transport connectivity, and proximity to the proposed metro corridor make it an ideal choice for working professionals and families. Most apartments offer stunning views of the surrounding hills and are designed with modern architecture featuring premium fixtures, modular kitchens, and efficient space utilization. Residents enjoy easy access to supermarkets, restaurants, banks, and entertainment options within the locality.
              </p>

              <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-2xl border border-blue-100 shadow-sm mb-8">
                <h3 className="text-xl font-semibold text-gray-900 mb-4">Popular Apartment Types in Madhurawada</h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">2 BHK Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">900-1200 sq ft</p>
                    <p className="text-blue-600 font-bold">₹65L - ₹85L</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">3 BHK Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">1400-1800 sq ft</p>
                    <p className="text-blue-600 font-bold">₹90L - ₹1.3Cr</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">4 BHK Apartments</p>
                    <p className="text-sm text-gray-600 mb-2">2000-2500 sq ft</p>
                    <p className="text-blue-600 font-bold">₹1.2Cr - ₹1.8Cr</p>
                  </div>
                  <div className="bg-white p-4 rounded-xl border border-gray-200">
                    <p className="font-semibold text-gray-900 mb-1">Penthouses</p>
                    <p className="text-sm text-gray-600 mb-2">2500+ sq ft</p>
                    <p className="text-blue-600 font-bold">₹1.5Cr+</p>
                  </div>
                </div>
              </div>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <Home className="h-8 w-8 text-blue-600" />
                Villas in Madhurawada
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Independent houses and villa projects in Madhurawada cater to buyers seeking spacious living with privacy and exclusivity. The locality features several premium gated villa communities offering 3 BHK and 4 BHK independent houses with private gardens, car parking, and modern amenities. These properties are particularly popular among families who value the flexibility of independent living while enjoying community facilities like clubhouses, sports courts, and landscaped common areas.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Villa prices in Madhurawada typically range from 1.2 crores to 3 crores depending on plot size, built-up area, and specific location within the neighborhood. Many projects offer customization options allowing buyers to personalize interiors according to their preferences. The area's elevation provides natural drainage and pleasant weather conditions, making it suitable for villa construction with outdoor spaces and terraces.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Investment in villas here offers excellent appreciation potential given the locality's growth trajectory and limited availability of large land parcels for future villa development. Most villa communities in Madhurawada are strategically located near schools, hospitals, and shopping centers, ensuring convenience for daily needs. The peaceful environment combined with proximity to IT hubs makes these villas ideal for professionals seeking work-life balance.
              </p>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <Landmark className="h-8 w-8 text-blue-600" />
                Plots & Open Land in Madhurawada
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Residential plots in Madhurawada present excellent opportunities for those looking to build custom homes according to their specific requirements and design preferences. VUDA-approved and DTCP-approved layouts are available across various pockets of the locality, offering plot sizes ranging from 150 square yards to 500 square yards. These plots come with clear titles, proper documentation, and access to essential civic amenities including water supply, electricity, and drainage systems.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Land prices in Madhurawada have appreciated significantly, with current rates ranging from 12,000 to 20,000 per square yard depending on the specific sub-location, road width, and proximity to main roads. Plots facing wider roads or located near prominent landmarks command premium pricing. The area's designation for residential development by VUDA ensures long-term value appreciation and structured neighborhood growth with planned infrastructure.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Investors and home builders prefer Madhurawada plots due to favorable construction regulations, availability of skilled contractors, and the established reputation of the locality. Corner plots and those with east-facing or north-facing orientations are particularly sought after. The presence of multiple completed villa projects in the vicinity provides confidence to new buyers regarding the locality's residential viability and future development potential.
              </p>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <DollarSign className="h-8 w-8 text-blue-600" />
                Madhurawada Property Prices
              </h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                Property prices in Madhurawada have shown consistent growth over the past decade, establishing it as a prime investment destination in Visakhapatnam. The average property price currently stands at 5,500 to 7,000 per square foot for apartments and 12,000 to 20,000 per square yard for residential plots. These rates reflect the locality's superior infrastructure, connectivity advantages, and proximity to employment centers.
              </p>
              <p className="text-gray-700 leading-relaxed mb-4">
                Market trends indicate that properties in gated communities with modern amenities command 10-15% premium over standalone apartments. New builder projects offer attractive payment plans and early-bird discounts, making property purchases more accessible. The rental market is equally robust, with 2 BHK apartments fetching monthly rents of 15,000 to 25,000, while 3 BHK units generate 25,000 to 40,000 per month, ensuring good rental yields for investors.
              </p>
              <p className="text-gray-700 leading-relaxed mb-6">
                Analysts project continued appreciation in Madhurawada property values driven by upcoming infrastructure projects including the Visakhapatnam Metro Rail and further expansion of IT parks in the vicinity. Properties within 2 km radius of the IT corridor are experiencing higher demand and faster appreciation rates. The area's transition from an emerging locality to an established residential hub is reflected in steady price growth and increasing transaction volumes year over year.
              </p>

              <div className="bg-white rounded-2xl shadow-lg border border-gray-200 p-6 mb-8">
                <h3 className="text-xl font-semibold text-gray-900 mb-4">Current Price Trends</h3>
                <div className="space-y-4">
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Apartments (per sq ft)</p>
                      <p className="text-sm text-gray-600">Ready to move</p>
                    </div>
                    <p className="text-lg font-bold text-blue-600">₹5,500 - ₹7,000</p>
                  </div>
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Residential Plots (per sq yd)</p>
                      <p className="text-sm text-gray-600">VUDA approved</p>
                    </div>
                    <p className="text-lg font-bold text-blue-600">₹12,000 - ₹20,000</p>
                  </div>
                  <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                    <div>
                      <p className="font-medium text-gray-900">Villas</p>
                      <p className="text-sm text-gray-600">3-4 BHK independent</p>
                    </div>
                    <p className="text-lg font-bold text-blue-600">₹1.2Cr - ₹3Cr</p>
                  </div>
                  <div className="flex justify-between items-center">
                    <div>
                      <p className="font-medium text-gray-900">Annual Appreciation</p>
                      <p className="text-sm text-gray-600">5-year average</p>
                    </div>
                    <p className="text-lg font-bold text-green-600">10-12%</p>
                  </div>
                </div>
              </div>

              <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                <TrendingUp className="h-8 w-8 text-blue-600" />
                Why Buy Property in Madhurawada?
              </h2>
              <p className="text-gray-700 leading-relaxed mb-6">
                Madhurawada stands out as an exceptional investment destination for multiple compelling reasons. The locality's transformation into a major IT and residential hub has been remarkable, attracting both end-users and investors seeking quality properties with strong appreciation potential. Its strategic positioning between the established city center and developing IT corridors provides residents with the best of both worlds - urban convenience and modern infrastructure.
              </p>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border border-blue-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-blue-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">IT Hub Proximity</h3>
                  <p className="text-gray-700 text-sm">
                    Located near major IT parks and SEZ zones with companies like TCS, Tech Mahindra, and Cyient, offering easy commute for tech professionals and strong rental demand from IT workforce.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border border-blue-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-blue-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Superior Connectivity</h3>
                  <p className="text-gray-700 text-sm">
                    Well-connected to all parts of Vizag via NH-16, with the proposed metro rail corridor passing through the area, ensuring excellent accessibility to airport, railway station, and city center.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border border-blue-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-blue-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Educational Infrastructure</h3>
                  <p className="text-gray-700 text-sm">
                    Surrounded by reputed schools including Delhi Public School, Montessori schools, and international schools, plus proximity to engineering colleges making it ideal for families with children.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border border-blue-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-blue-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Healthcare Facilities</h3>
                  <p className="text-gray-700 text-sm">
                    Access to quality healthcare with multi-specialty hospitals, diagnostic centers, and 24/7 pharmacies within the locality, ensuring medical care is always available when needed.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border border-blue-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-blue-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">Modern Amenities</h3>
                  <p className="text-gray-700 text-sm">
                    Well-developed infrastructure with shopping malls, multiplexes, restaurants, banks, and retail outlets providing urban lifestyle amenities comparable to metro cities at affordable costs.
                  </p>
                </div>
                <div className="bg-gradient-to-br from-blue-50 to-white p-6 rounded-xl border border-blue-100 shadow-sm">
                  <CheckCircle className="h-8 w-8 text-blue-600 mb-3" />
                  <h3 className="text-lg font-semibold text-gray-900 mb-2">High Appreciation Potential</h3>
                  <p className="text-gray-700 text-sm">
                    Consistent property value growth of 10-12% annually, driven by ongoing infrastructure development, increasing employment opportunities, and limited land availability for future construction.
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
                        <p className="text-sm text-gray-600">North Visakhapatnam</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <Building2 className="h-5 w-5 text-blue-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Property Types</p>
                        <p className="text-sm text-gray-600">Flats, Villas, Plots</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <DollarSign className="h-5 w-5 text-blue-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Price Range</p>
                        <p className="text-sm text-gray-600">₹50L - ₹3Cr</p>
                      </div>
                    </div>
                    <div className="flex items-start gap-3">
                      <TrendingUp className="h-5 w-5 text-blue-600 mt-1 flex-shrink-0" />
                      <div>
                        <p className="font-medium text-gray-900 text-sm">Growth Rate</p>
                        <p className="text-sm text-gray-600">10-12% annually</p>
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
                        href={`/properties?location=${area.name}`}
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
                    href={getWhatsAppLink("Hi, I'm interested in properties in Madhurawada, Vizag")}
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
            Latest Properties in Madhurawada
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
                  <div key={property.id} className="bg-white rounded-lg shadow-md p-4 border border-gray-200">
                    <h3 className="font-bold text-lg mb-2">{property.title}</h3>
                    <p className="text-gray-600 text-sm mb-2">{property.description}</p>
                    <p className="text-primary-600 font-bold">₹{property.price?.toLocaleString()}</p>
                  </div>
                ))}
              </div>
              <div className="text-center mt-8">
                <a
                  href="/properties?location=Madhurawada"
                  className="inline-flex items-center gap-2 bg-blue-600 text-white px-8 py-3 rounded-lg font-semibold hover:bg-blue-700 transition-all"
                >
                  View All Madhurawada Properties
                  <TrendingUp className="h-5 w-5" />
                </a>
              </div>
            </>
          ) : (
            <div className="text-center py-12 bg-gray-50 rounded-2xl">
              <Home className="h-16 w-16 text-gray-400 mx-auto mb-4" />
              <h3 className="text-xl font-semibold text-gray-900 mb-2">No matching properties found in this area.</h3>
              <p className="text-gray-600 mb-6">We couldn't find any properties in Madhurawada matching your search</p>
              <button
                onClick={() => openWhatsApp('Hi Vizag Property Experts, I searched for property in Madhurawada but found no results. Please share matching options.')}
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
