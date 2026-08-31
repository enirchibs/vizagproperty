import { useState, useEffect } from 'react'
import { Link } from 'react-router-dom'
import { Shield, Building2, TrendingUp, Search, MessageCircle, Star, Quote, Phone } from 'lucide-react'
import { supabase } from '../lib/supabase'
import { Property } from '../types'
import { HeroSearch } from '../components/HeroSearch'
import { CategoryCards } from '../components/CategoryCards'
import { StickyMobileNav } from '../components/StickyMobileNav'
import { AuthModal } from '../components/AuthModal'
import { HomeBlogSection } from '../components/HomeBlogSection'
import { SEOHead } from '../components/SEOHead'
import { HeatMap } from '../components/HeatMap'
import { SponsoredBanners } from '../components/SponsoredBanners'
import { SeoKeywordsSection } from '../components/SeoKeywordsSection'

import { PropertyCard } from '../components/PropertyCard'
import { sortPropertiesGlobalPreference } from '../lib/searchFilters'

export function HomePage() {
  const [latestProperties, setLatestProperties] = useState<Property[]>([])
  const [loading, setLoading] = useState(true)
  const [showAuthModal, setShowAuthModal] = useState(false)

  useEffect(() => {
    loadLatestProperties()
  }, [])



  const loadLatestProperties = async () => {
    setLoading(true)
    try {
      const { data, error } = await supabase
        .from('properties')
        .select('*, localities!inner(name, slug, city)')
        .eq('status', 'approved')
        .order('created_at', { ascending: false })
        .limit(20)

      if (error) throw error
      setLatestProperties(sortPropertiesGlobalPreference(data || [], undefined, 'visakhapatnam'))
    } catch (err) {
      console.error('Error loading latest properties:', err)
    } finally {
      setLoading(false)
    }
  }

  const homeSchema = [
    {
      "@context": "https://schema.org",
      "@type": "RealEstateAgent",
      "name": "Vizag Property Experts",
      "image": "https://vizagproperty.co.in/og-image.jpg",
      "url": "https://vizagproperty.co.in",
      "telephone": "+91 7207550499",
      "priceRange": "₹₹ - ₹₹₹₹",
      "address": {
        "@type": "PostalAddress",
        "addressLocality": "Visakhapatnam",
        "addressRegion": "Andhra Pradesh",
        "addressCountry": "IN"
      },
      "geo": {
        "@type": "GeoCoordinates",
        "latitude": 17.7231,
        "longitude": 83.3012
      },
      "description": "Leading AI-powered real estate portal in Visakhapatnam for verified flats, VMRDA plots, independent villas, and commercial property."
    }
  ];

  return (
    <div className="min-h-screen bg-gray-50 pb-16">
      <SEOHead
        title="Vizag Property | Visakhapatnam Real Estate, Plots & Flats for Sale"
        description="Find your dream property in Vizag. Explore the best Vizag real estate, verified properties for sale, VMRDA plots, and flats."
        canonicalUrl="https://vizagproperty.co.in/"
        url="https://vizagproperty.co.in/"
        keywords="vizag real estate, visakhapatnam property, property in vizag, plots for sale in vizag, flats for sale in vizag, villas in vizag, VMRDA plots vizag, vizag property"
        schema={homeSchema}
      />
      
      {/* 1. Hero Section */}
      <div 
        className="relative flex flex-col justify-center items-center text-white px-4 pt-8 md:pt-12 pb-10 md:pb-14 bg-cover bg-center overflow-hidden"
        style={{ backgroundImage: `url('/vizag_beach_kailasagiri.png')` }}
      >
        <div className="absolute inset-0 bg-slate-950/75 z-0 backdrop-blur-[2px]"></div>

        {/* Animated ambient glow spheres */}
        <div className="absolute -top-20 -left-20 w-80 h-80 bg-sky-500/20 rounded-full blur-3xl animate-pulse pointer-events-none"></div>
        <div className="absolute -bottom-20 -right-20 w-80 h-80 bg-amber-500/20 rounded-full blur-3xl animate-pulse pointer-events-none" style={{ animationDelay: '1.5s' }}></div>

        <div className="relative z-10 w-full max-w-6xl mx-auto flex flex-col items-center text-center space-y-3">
          
          {/* Pulsing Call Badge for 7207550499 */}
          <a
            href="tel:7207550499"
            className="inline-flex items-center gap-2 bg-gradient-to-r from-emerald-600 via-teal-600 to-emerald-600 text-white font-extrabold px-4 py-1.5 rounded-full shadow-lg border border-emerald-400/40 text-xs md:text-sm animate-bounce hover:scale-105 transition-all group"
          >
            <span className="relative flex h-2.5 w-2.5">
              <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-amber-400 opacity-75"></span>
              <span className="relative inline-flex rounded-full h-2.5 w-2.5 bg-amber-400"></span>
            </span>
            <Phone className="w-3.5 h-3.5 text-amber-300 group-hover:rotate-12 transition-transform" />
            <span>Call Now:</span>
            <span className="tracking-wider font-black text-yellow-300 underline">7207550499</span>
          </a>

          <h1 className="text-3xl md:text-5xl lg:text-6xl font-extrabold text-white leading-tight tracking-tight drop-shadow-xl">
            Find Your <span className="text-yellow-400 drop-shadow-md">Dream Property</span> <br className="md:hidden" />
            <span className="text-teal-400 drop-shadow-md">in Vizag</span>
          </h1>

          <p className="text-sm md:text-lg text-gray-200 font-semibold max-w-3xl flex flex-wrap justify-center gap-x-4 gap-y-1">
            <span>Visakhapatnam Real Estate • Top Verified Properties for Sale</span>
          </p>

          <div className="flex flex-wrap justify-center items-center gap-2.5 text-xs md:text-sm text-gray-200 font-medium pt-1">
            <span className="flex items-center gap-1.5 bg-white/10 backdrop-blur-md px-3 py-1 rounded-full border border-white/20 shadow-sm">
              <Search className="w-3.5 h-3.5 text-amber-400 animate-pulse" /> AI Powered Search
            </span>
            <span className="flex items-center gap-1.5 bg-white/10 backdrop-blur-md px-3 py-1 rounded-full border border-white/20 shadow-sm">
              <Shield className="w-3.5 h-3.5 text-emerald-400" /> Verified Listings
            </span>
            <a 
              href="tel:7207550499" 
              className="flex items-center gap-1.5 bg-amber-500 hover:bg-amber-600 text-gray-900 font-extrabold px-3.5 py-1 rounded-full shadow-md transition-all hover:scale-105 border border-amber-300"
            >
              <Phone className="w-3.5 h-3.5 text-gray-900 fill-current" /> Call 7207550499
            </a>
          </div>

          {/* Search Component */}
          <div className="w-full pt-2">
            <HeroSearch />
          </div>
        </div>
      </div>

      {/* 2. All Properties Listed in the Website (Instant Display below Hero) */}
      <section className="py-6 md:py-10 bg-gray-50 border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-4">
          <div className="flex flex-col md:flex-row md:items-end justify-between mb-4 gap-2">
            <div>
              <div className="flex items-center gap-2 mb-1">
                <span className="w-2.5 h-2.5 rounded-full bg-emerald-500 animate-pulse"></span>
                <span className="text-[11px] font-bold uppercase tracking-wider text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded-full border border-emerald-200">
                  Latest Verified Listings
                </span>
              </div>
              <h2 className="text-2xl md:text-3xl font-extrabold text-gray-900">
                Properties Listed in Visakhapatnam
              </h2>
              <p className="text-xs md:text-sm text-gray-600 mt-0.5">
                Explore real estate directly in Visakhapatnam — instant call or WhatsApp owners & builders with 1 tap.
              </p>
            </div>
            <Link to="/properties" className="inline-flex items-center gap-1.5 text-primary-600 font-bold hover:text-primary-800 transition-colors text-sm bg-white px-4 py-2 rounded-lg border border-gray-200 shadow-sm hover:shadow-md self-start md:self-auto">
              View All Properties <TrendingUp className="w-4 h-4" />
            </Link>
          </div>

          {/* Properties Grid */}
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4 md:gap-5">
            {loading ? (
              [1, 2, 3, 4].map(i => <div key={i} className="h-72 bg-gray-200 rounded-xl animate-pulse"></div>)
            ) : (
              latestProperties.map(property => (
                <PropertyCard key={property.id} property={property} />
              ))
            )}
          </div>

          <div className="mt-6 text-center">
            <Link
              to="/properties"
              className="inline-flex items-center gap-2 bg-primary-600 hover:bg-primary-700 text-white font-extrabold px-6 py-3 rounded-xl text-sm shadow-md hover:shadow-xl transition-all duration-300 transform hover:-translate-y-0.5"
            >
              Browse All Properties in Visakhapatnam ({latestProperties.length}+ Available) →
            </Link>
          </div>
        </div>
      </section>

      {/* 3. Browse Visakhapatnam Property by Category (Image 2 Section) */}
      <CategoryCards />

      {/* Premium Partners / Sponsored Banners */}
      <SponsoredBanners />



      {/* 5. Interactive Map Placeholder */}
      <section className="py-20 px-4 bg-white">
        <div className="max-w-7xl mx-auto text-center">
          <h2 className="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4">Explore Vizag on Map</h2>
          <p className="text-gray-600 mb-10 max-w-2xl mx-auto">Click on localities to see average prices, price trends, and rental yields across Visakhapatnam.</p>
          <div className="w-full mt-10">
            <HeatMap />
          </div>
        </div>
      </section>

      {/* 6. Why Choose VizagProperty */}
      <section className="py-20 bg-primary-900 text-white relative overflow-hidden">
        <div className="absolute top-0 right-0 w-96 h-96 bg-primary-500 rounded-full blur-3xl opacity-20 -mr-20 -mt-20"></div>
        <div className="max-w-7xl mx-auto px-4 relative z-10">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-extrabold mb-4">Why Choose VizagProperty.co.in</h2>
            <p className="text-primary-100 max-w-2xl mx-auto">The most trusted and technologically advanced real estate platform in Andhra Pradesh.</p>
          </div>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            {[
              { icon: Shield, title: 'Verified Listings', desc: 'Properties are reviewed against our verification checklist, including available ownership, project and listing information. Buyers should independently verify legal documents before purchase.' },
              { icon: Search, title: 'AI Search', desc: 'Find properties using natural language, exactly like you talk.' },
              { icon: MessageCircle, title: 'WhatsApp Integration', desc: 'Get instant alerts, details, and connect with owners via WhatsApp.' },
              { icon: Building2, title: 'No Brokerage', desc: 'Connect directly with owners and builders to save on commission.' }
            ].map((feature, i) => (
              <div key={i} className="bg-white/5 backdrop-blur-lg border border-white/10 p-8 rounded-3xl hover:bg-white/10 transition-colors">
                <feature.icon className="w-12 h-12 text-accent-400 mb-6" />
                <h3 className="text-xl font-bold mb-3">{feature.title}</h3>
                <p className="text-primary-100 leading-relaxed">{feature.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* 7. Testimonials */}
      <section className="py-20 px-4 bg-gray-50">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4">What Our Customers Say</h2>
            <p className="text-gray-600">Real stories from real buyers in Visakhapatnam.</p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {[
              { name: "Rahul S.", location: "Madhurawada", text: "Found a VMRDA plot within 3 days. The AI search understood exactly what I wanted. Saved me weeks of hunting!" },
              { name: "Priya M.", location: "Yendada", text: "The WhatsApp integration is genius. I got property details straight to my phone and connected with the builder directly." },
              { name: "Kiran Kumar", location: "MVP Colony", text: "Best real estate platform in Vizag. No fake listings, everything is verified. Highly recommend to anyone buying property." }
            ].map((t, i) => (
              <div key={i} className="bg-white p-8 rounded-3xl shadow-sm border border-gray-100 relative">
                <Quote className="absolute top-6 right-6 w-12 h-12 text-gray-100" />
                <div className="flex gap-1 mb-6">
                  {[1, 2, 3, 4, 5].map(star => <Star key={star} className="w-5 h-5 fill-accent-400 text-accent-400" />)}
                </div>
                <p className="text-gray-700 italic mb-6 relative z-10 leading-relaxed">"{t.text}"</p>
                <div>
                  <h4 className="font-bold text-gray-900">{t.name}</h4>
                  <p className="text-sm text-gray-500">Bought in {t.location}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* SEO Rich Text Content */}
      <section className="py-12 px-4 bg-white border-t border-gray-100">
        <div className="max-w-7xl mx-auto">
          <div className="prose prose-lg text-gray-600 max-w-none text-center">
            <p>
              Looking for a <strong>property in Vizag</strong>? VizagProperty.co.in is the leading destination for <strong>vizag real estate</strong> and verified <strong>vizag properties</strong>. Whether you are searching for a premium <strong>vizag property for sale</strong>, exploring VMRDA approved plots, or looking for flats and villas, we connect you directly with top builders and owners. Experience a seamless search for any <strong>visakhapatnam property</strong> and invest in the future with the most trusted <strong>property in visakhapatnam</strong>.
            </p>
          </div>
        </div>
      </section>

      {/* SEO Keywords Section - Magicbricks style */}
      <SeoKeywordsSection />

      {/* 8. Latest Blogs */}
      <div className="border-t border-gray-200">
        <HomeBlogSection />
      </div>

      {showAuthModal && <AuthModal onClose={() => setShowAuthModal(false)} />}
      
      {/* 9. Sticky Bottom Mobile CTA */}
      <StickyMobileNav />
    </div>
  )
}
