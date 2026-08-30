import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { supabase } from '../../lib/supabase';
import { Property } from '../../types';
import { PropertyCard } from '../../components/PropertyCard';
import { SEOHead } from '../../components/SEOHead';
import { sortPropertiesGlobalPreference } from '../../lib/searchFilters';
import { openWhatsApp } from '../../lib/whatsapp';
import { MapPin, CheckCircle, MessageCircle, Compass } from 'lucide-react';

interface LocalityDetails {
  name: string;
  metaTitle: string;
  metaDesc: string;
  keywords: string;
  avgPriceSqFt: string;
  topHighlights: string[];
  description: string;
  priceTrends: string;
}

const LOCALITY_DATA: Record<string, LocalityDetails> = {
  'madhurawada': {
    name: 'Madhurawada',
    metaTitle: 'Property in Madhurawada Vizag | Flats, Villas & VMRDA Plots for Sale',
    metaDesc: 'Explore verified property in Madhurawada, Vizag. 2 & 3 BHK flats for sale, gated villas, VMRDA approved plots near IT SEZ with price trends & reviews.',
    keywords: 'madhurawada property, flats for sale in madhurawada vizag, plots for sale in madhurawada, madhurawada real estate',
    avgPriceSqFt: '₹4,500 - ₹6,500 / sq.ft.',
    topHighlights: ['Hill No. 3 IT SEZ & Tech Parks', 'ACA-VDCA Cricket Stadium', 'CBIT & Engineering Colleges', 'Direct Beach Road Connectivity'],
    description: 'Madhurawada is Visakhapatnam’s primary IT and residential growth hub. Known for its elevated topography, lush green surrounding hills, and high concentration of tech professionals, Madhurawada offers exceptional capital appreciation.',
    priceTrends: '15.4% appreciation over the last 3 years due to IT expansion and coastal corridor demand.'
  },
  'yendada': {
    name: 'Yendada',
    metaTitle: 'Property in Yendada Vizag | Luxury Flats, Villas & Plots Visakhapatnam',
    metaDesc: 'Buy premium property in Yendada, Vizag. Gated community apartments, independent villas & VMRDA plots near GITAM & Law University with sea view options.',
    keywords: 'yendada property, flats in yendada vizag, villas in yendada, yendada real estate',
    avgPriceSqFt: '₹5,800 - ₹8,200 / sq.ft.',
    topHighlights: ['Proximity to GITAM University', 'DSNLU Law University', '5 Minutes to Rushikonda Beach', 'High-End Luxury Townships'],
    description: 'Yendada stands out as one of Vizag’s premier high-end residential corridors. Nestled between Madhurawada and MVP Colony, Yendada is famous for luxury sea-view apartments, gated villas, and elite educational institutions.',
    priceTrends: '18.2% appreciation over the last 3 years driven by luxury gated community developments.'
  },
  'rushikonda': {
    name: 'Rushikonda',
    metaTitle: 'Property in Rushikonda Vizag | Beachfront Villas & Sea View Flats',
    metaDesc: 'Explore property in Rushikonda Vizag. Premium beachfront villas, sea view apartments, and IT SEZ plots near Blue Flag Rushikonda Beach.',
    keywords: 'rushikonda property, beach villas rushikonda, flats in rushikonda vizag, rushikonda real estate',
    avgPriceSqFt: '₹6,500 - ₹9,500 / sq.ft.',
    topHighlights: ['Blue Flag Rushikonda Beach', 'IT SEZ Hill No. 1, 2 & 3', 'Luxury Resort Corridors', 'Panoramic Ocean Views'],
    description: 'Rushikonda is Vizag’s flagship coastal & technology hub. Known globally for its pristine Blue Flag beach and IT SEZ hilltops, property in Rushikonda commands premium rental yields from tech executives and tourism operators.',
    priceTrends: '20.1% appreciation over the last 3 years with ultra-strong demand for sea-facing units.'
  },
  'pm-palem': {
    name: 'PM Palem',
    metaTitle: 'Property in PM Palem Vizag | Budget Flats, VMRDA Plots & Houses',
    metaDesc: 'Find top property in PM Palem, Vizag. 2 & 3 BHK apartments for sale, VMRDA approved plots, rental houses near International Cricket Stadium.',
    keywords: 'pm palem property, flats for sale in pm palem vizag, pm palem plots, real estate pm palem',
    avgPriceSqFt: '₹4,000 - ₹5,800 / sq.ft.',
    topHighlights: ['Adjacent to International Cricket Stadium', 'Sanketika Engineering College', 'Excellent Bus & Highway Connectivity', 'Peaceful Residential Enclaves'],
    description: 'PM Palem (Pothinamallayya Palem) is a highly desirable residential hub offering affordable to mid-segment housing. Its proximity to National Highway 16 and Madhurawada makes it ideal for families and working professionals.',
    priceTrends: '14.1% appreciation with steady rental demand from college students and IT staff.'
  },
  'gajuwaka': {
    name: 'Gajuwaka',
    metaTitle: 'Property in Gajuwaka Vizag | Commercial Shops, Houses & Flats',
    metaDesc: 'Explore property in Gajuwaka, Vizag. Industrial & commercial properties, independent houses, 2 & 3 BHK flats near Vizag Steel Plant & Autonagar.',
    keywords: 'gajuwaka property, houses for sale in gajuwaka vizag, flats in gajuwaka, commercial property gajuwaka',
    avgPriceSqFt: '₹3,800 - ₹5,500 / sq.ft.',
    topHighlights: ['Vizag Steel Plant (RINL) Corridor', 'Autonagar Industrial Hub', 'Duvvada Railway Station Proximity', 'Bustling Commercial Marketplaces'],
    description: 'Gajuwaka is South India’s largest industrial hub, home to major manufacturing plants, steel industries, and commercial centers. Property in Gajuwaka enjoys continuous rental demand from industrial workforce personnel.',
    priceTrends: '11.8% consistent annual capital growth with high commercial rental yields.'
  },
  'mvp-colony': {
    name: 'MVP Colony',
    metaTitle: 'Property in MVP Colony Vizag | Prime Residential Flats & Houses',
    metaDesc: 'Find premium property in MVP Colony, Vizag. Asia’s largest planned colony featuring luxury flats, commercial showrooms, and independent houses.',
    keywords: 'mvp colony property, flats for sale in mvp colony vizag, house in mvp colony, mvp colony real estate',
    avgPriceSqFt: '₹7,000 - ₹10,500 / sq.ft.',
    topHighlights: ['Asia’s Largest Planned Residential Colony', 'Tenneti Park & Beach Road', 'Top Hospitals & Shopping Malls', 'Established Civic Infrastructure'],
    description: 'MVP Colony is Visakhapatnam’s most prestigious and established residential enclave. With tree-lined avenues, top healthcare facilities, premium schools, and beach road proximity, property in MVP Colony retains elite market value.',
    priceTrends: '12.5% steady value appreciation with premium resale liquidity.'
  },
  'kommadi': {
    name: 'Kommadi',
    metaTitle: 'Property in Kommadi Vizag | VMRDA Approved Plots & Apartments',
    metaDesc: 'Explore property in Kommadi, Vizag. High-appreciation VMRDA approved plots, open layouts & modern 2/3 BHK flats near Madhurawada Junction.',
    keywords: 'kommadi property, plots for sale in kommadi vizag, flats in kommadi, kommadi real estate',
    avgPriceSqFt: '₹3,500 - ₹5,000 / sq.ft.',
    topHighlights: ['Rapidly Developing Educational Hub', 'Direct NH16 Highway Access', 'Affordable Land & Layout Prices', 'Proximity to IT Expansion Zone'],
    description: 'Kommadi is one of Vizag’s fastest-growing affordable residential corridors located immediately north of Madhurawada. It is an investment hot-spot for open layout plots and upcoming gated apartment complexes.',
    priceTrends: '16.7% appreciation over 3 years driven by plot layout developments.'
  },
  'seethammadhara': {
    name: 'Seethammadhara',
    metaTitle: 'Property in Seethammadhara Vizag | Premium Flats, Houses & Plots',
    metaDesc: 'Find verified property in Seethammadhara, Vizag. Luxury 2 & 3 BHK flats for sale, independent houses & commercial spaces near HB Colony.',
    keywords: 'seethammadhara property, flats in seethammadhara vizag, house for sale in seethammadhara',
    avgPriceSqFt: '₹6,200 - ₹8,800 / sq.ft.',
    topHighlights: ['Prime Central Vizag Location', 'Top Schools & Specialty Hospitals', 'HB Colony & Maddilapalem Proximity', 'High Resale & Rental Liquidity'],
    description: 'Seethammadhara is a highly coveted central residential neighborhood in Visakhapatnam. Offering quiet green residential streets alongside top commercial centers, property here commands premium appreciation.',
    priceTrends: '13.2% annual growth with strong demand for 3 BHK luxury apartments.'
  },
  'bheemili': {
    name: 'Bheemili',
    metaTitle: 'Property in Bheemili Vizag | Beachfront Plots, Villas & Land for Sale',
    metaDesc: 'Explore property in Bheemili (Bheemunipatnam), Vizag. Beach Road open plots, VMRDA approved layouts & sea view villas along the coastal corridor.',
    keywords: 'bheemili property, plots for sale in bheemili vizag, bheemunipatnam property, beach land bheemili',
    avgPriceSqFt: '₹3,200 - ₹5,500 / sq.ft.',
    topHighlights: ['Historic Beachfront Heritage Town', 'Scenic Vizag-Bheemili Beach Road', 'Bhogapuram Airport Corridor Access', 'Rapid Coastal Tourism Growth'],
    description: 'Bheemili (Bheemunipatnam) is a historic coastal enclave undergoing dramatic infrastructure expansion. Located along the world-famous Vizag Beach Road, Bheemili land and plot developments offer huge long-term upside.',
    priceTrends: '22.4% appreciation over 3 years due to Beach Road widening and airport proximity.'
  },
  'bheemunipatnam': {
    name: 'Bheemunipatnam',
    metaTitle: 'Property in Bheemunipatnam Vizag | Beach Layout Plots & Houses',
    metaDesc: 'Buy land & flats in Bheemunipatnam, Vizag. Verified VMRDA open plots, beach view land & independent houses along the Bheemili coastal highway.',
    keywords: 'bheemunipatnam property, plots in bheemunipatnam vizag, bheemili real estate',
    avgPriceSqFt: '₹3,200 - ₹5,500 / sq.ft.',
    topHighlights: ['Beach Highway Corridor', 'High Plot Capital Growth', 'VMRDA Approved Layout Townships', 'Serene Coastal Living'],
    description: 'Bheemunipatnam offers prime coastal real estate opportunities for open plot investors and holiday villa buyers looking for long-term appreciation in the VMRDA master plan region.',
    priceTrends: '22.4% capital growth rate along the coastal highway corridor.'
  },
  'pendurthi': {
    name: 'Pendurthi',
    metaTitle: 'Property in Pendurthi Vizag | Budget Plots, Flats & Houses for Sale',
    metaDesc: 'Find top property in Pendurthi, Vizag. Affordable 2 BHK flats, VMRDA approved residential plots, independent houses near Pendurthi Railway Station.',
    keywords: 'pendurthi property, plots for sale in pendurthi vizag, flats in pendurthi, pendurthi real estate',
    avgPriceSqFt: '₹3,200 - ₹4,800 / sq.ft.',
    topHighlights: ['Pendurthi Junction & Railway Station', 'BRTS Road Corridor Connectivity', 'Affordable Mid-Segment Housing', 'Fast-Growing Residential Belt'],
    description: 'Pendurthi is a major residential and transit junction in western Visakhapatnam. With excellent BRTS bus corridor connectivity, Pendurthi offers affordable apartments and plot layouts for budget-conscious buyers.',
    priceTrends: '13.8% steady capital growth driven by transit connectivity upgrades.'
  },
  'tagarapuvalasa': {
    name: 'Tagarapuvalasa',
    metaTitle: 'Property in Tagarapuvalasa Vizag | VMRDA Plots & Highway Property',
    metaDesc: 'Explore property in Tagarapuvalasa, Vizag. Highway plots for sale, VMRDA approved layouts & affordable housing near Anandapuram & Bhogapuram highway.',
    keywords: 'tagarapuvalasa property, plots in tagarapuvalasa vizag, tagarapuvalasa real estate',
    avgPriceSqFt: '₹2,800 - ₹4,200 / sq.ft.',
    topHighlights: ['NH16 Kolkata Highway Frontage', 'Anandapuram Junction Proximity', 'Bhogapuram Airport Access Corridor', 'High Land Appreciation Yield'],
    description: 'Tagarapuvalasa is a strategic northern entrance corridor to Visakhapatnam along NH16. Popular for VMRDA approved open plots and gated residential layouts, Tagarapuvalasa offers exceptional multi-year ROI.',
    priceTrends: '19.5% capital growth driven by airport corridor land acquisitions.'
  },
  'duvvada': {
    name: 'Duvvada',
    metaTitle: 'Property in Duvvada Vizag | Flats & Houses near Duvvada Railway Station',
    metaDesc: 'Buy property in Duvvada, Vizag. Affordable 2 & 3 BHK flats for sale, independent houses & plots near Duvvada Railway Station & VSEZ.',
    keywords: 'duvvada property, flats in duvvada vizag, house for sale in duvvada, vsez duvvada real estate',
    avgPriceSqFt: '₹3,400 - ₹4,800 / sq.ft.',
    topHighlights: ['Duvvada Express Railway Station', 'Visakhapatnam Special Economic Zone (VSEZ)', 'Vignan Engineering University', 'Gajuwaka Industrial Proximity'],
    description: 'Duvvada is a thriving residential and transit hub anchored by Duvvada Railway Station and VSEZ IT/manufacturing zone. It provides high rental yields from railway, IT, and industrial employees.',
    priceTrends: '12.9% consistent annual rental and capital growth.'
  },
  'visalakshi-nagar': {
    name: 'Visalakshi Nagar',
    metaTitle: 'Property in Visalakshi Nagar Vizag | Luxury Sea View Flats & Houses',
    metaDesc: 'Explore property in Visalakshi Nagar, Vizag. Premium 3 BHK sea view apartments, independent houses & plots near Kailasagiri & Health City.',
    keywords: 'visalakshi nagar property, flats in visalakshi nagar vizag, sea view flats vizag',
    avgPriceSqFt: '₹6,000 - ₹8,500 / sq.ft.',
    topHighlights: ['Kailasagiri Hilltop Ocean View', 'Health City Arilova Proximity', '5 Mins to Beach Road & Tenneti Park', 'Exclusive Upscale Residential Hillside'],
    description: 'Visalakshi Nagar is an upscale hilltop residential neighborhood overlooking the Bay of Bengal and Kailasagiri. Renowned for luxury sea-facing apartments and peaceful surroundings near Health City.',
    priceTrends: '16.2% annual value growth with high luxury demand.'
  },
  'bhogapuram': {
    name: 'Property in Bhogapuram',
    metaTitle: 'Plots for Sale in Bhogapuram Vizag | Airport Highway VMRDA Layouts',
    metaDesc: 'Buy open plots for sale in Bhogapuram, Vizag. Verified VMRDA & DTCP layouts near Bhogapuram International Airport & 6-lane beach expressway.',
    keywords: 'bhogapuram plots, property in bhogapuram vizag, land in bhogapuram, vmrda plots bhogapuram',
    avgPriceSqFt: '₹2,500 - ₹4,200 / sq.ft.',
    topHighlights: ['Upcoming Bhogapuram International Airport', '6-Lane Beach Expressway', 'VMRDA Master Plan Megacity Zone', '25%+ Annual Land Appreciation'],
    description: 'Bhogapuram is Andhra Pradesh’s top real estate investment corridor. Anchored by the greenfield Bhogapuram International Airport construction, land plots here offer explosive capital growth.',
    priceTrends: '24.6% rapid appreciation year-over-year.'
  }
};

export function LocalityHubPage() {
  const { localitySlug } = useParams<{ localitySlug?: string }>();
  const [properties, setProperties] = useState<Property[]>([]);
  const [loading, setLoading] = useState(true);

  const slug = localitySlug ? localitySlug.toLowerCase() : 'madhurawada';
  const info = LOCALITY_DATA[slug] || {
    name: slug.charAt(0).toUpperCase() + slug.slice(1).replace(/-/g, ' '),
    metaTitle: `Property in ${slug.charAt(0).toUpperCase() + slug.slice(1)} Vizag | Verified Listings`,
    metaDesc: `Find top verified real estate, flats, villas and plots for sale in ${slug.charAt(0).toUpperCase() + slug.slice(1)}, Visakhapatnam with price details and amenities.`,
    keywords: `${slug} property, flats in ${slug} vizag, plots in ${slug}, ${slug} real estate`,
    avgPriceSqFt: '₹3,500 - ₹6,500 / sq.ft.',
    topHighlights: ['Good Road Connectivity', 'Access to Schools & Hospitals', 'High Capital Growth Potential'],
    description: `${slug.charAt(0).toUpperCase() + slug.slice(1)} is a key growth neighborhood in Visakhapatnam offering strong potential for home buyers and real estate investors.`,
    priceTrends: 'Steady annual capital appreciation with strong localized demand.'
  };

  const canonicalUrl = `https://vizagproperty.co.in/localities/${slug}`;

  useEffect(() => {
    async function loadLocalityProperties() {
      setLoading(true);
      try {
        const { data, error } = await supabase
          .from('properties')
          .select('*, localities!inner(name, slug, city)')
          .ilike('localities.name', `%${info.name}%`)
          .eq('status', 'approved')
          .limit(30);

        if (error) throw error;
        
        let fetchedProps = data || [];
        if (fetchedProps.length < 3) {
          const { data: fallbackData } = await supabase
            .from('properties')
            .select('*, localities!inner(name, slug, city)')
            .eq('status', 'approved')
            .limit(20);
          fetchedProps = fallbackData || [];
        }

        setProperties(sortPropertiesGlobalPreference(fetchedProps, undefined, info.name));
      } catch (err) {
        console.error('Locality load error:', err);
      } finally {
        setLoading(false);
      }
    }

    loadLocalityProperties();
  }, [info.name, slug]);

  const schema = [
    {
      "@context": "https://schema.org",
      "@type": "Place",
      "name": `${info.name}, Visakhapatnam`,
      "description": info.description,
      "url": canonicalUrl,
      "address": {
        "@type": "PostalAddress",
        "addressLocality": info.name,
        "addressRegion": "Andhra Pradesh",
        "addressCountry": "IN"
      }
    }
  ];

  return (
    <div className="min-h-screen bg-gray-50 pb-16">
      <SEOHead
        title={info.metaTitle}
        description={info.metaDesc}
        canonicalUrl={canonicalUrl}
        url={canonicalUrl}
        keywords={info.keywords}
        schema={schema}
      />

      {/* Hero Banner */}
      <section className="bg-gradient-to-r from-blue-900 via-indigo-900 to-slate-900 text-white py-14 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center gap-2 text-sky-400 text-xs md:text-sm font-bold uppercase tracking-wider mb-2">
            <MapPin className="w-4 h-4" /> Locality Guide • Visakhapatnam
          </div>
          <h1 className="text-3xl md:text-5xl font-extrabold tracking-tight mb-3">
            Property in {info.name}, Vizag
          </h1>
          <p className="text-base md:text-lg text-gray-200 max-w-3xl leading-relaxed">
            {info.description}
          </p>

          <div className="mt-6 flex flex-wrap gap-4 text-xs md:text-sm">
            <div className="bg-white/10 backdrop-blur-md px-4 py-2 rounded-xl border border-white/20">
              <span className="text-gray-300">Avg Property Rate:</span> <strong className="text-yellow-300">{info.avgPriceSqFt}</strong>
            </div>
            <div className="bg-white/10 backdrop-blur-md px-4 py-2 rounded-xl border border-white/20">
              <span className="text-gray-300">3-Yr Trend:</span> <strong className="text-emerald-300">{info.priceTrends}</strong>
            </div>
          </div>
        </div>
      </section>

      {/* Content Body */}
      <main className="max-w-7xl mx-auto px-4 py-10">
        {/* Locality Highlights Cards */}
        <div className="mb-10 bg-white p-6 md:p-8 rounded-3xl border border-gray-200 shadow-sm">
          <h2 className="text-xl font-bold text-gray-900 mb-4 flex items-center gap-2">
            <Compass className="w-5 h-5 text-primary-600" /> Top Connectivity & Infrastructure Highlights
          </h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4">
            {info.topHighlights.map((hl, i) => (
              <div key={i} className="bg-gray-50 p-4 rounded-2xl border border-gray-100 flex items-start gap-3">
                <CheckCircle className="w-5 h-5 text-emerald-600 flex-shrink-0 mt-0.5" />
                <span className="text-sm font-medium text-gray-800">{hl}</span>
              </div>
            ))}
          </div>
        </div>

        {/* Listings Grid */}
        <div className="flex flex-col md:flex-row md:items-end justify-between mb-6 gap-2 border-b border-gray-200 pb-4">
          <div>
            <h2 className="text-2xl md:text-3xl font-extrabold text-gray-900">
              Properties Listed in {info.name}
            </h2>
            <p className="text-sm text-gray-600 mt-1">
              Explore verified flats, open plots & villas for sale in {info.name}
            </p>
          </div>
          <button
            onClick={() => openWhatsApp(`Hi, I want properties in ${info.name}, Vizag`)}
            className="inline-flex items-center gap-2 bg-emerald-600 hover:bg-emerald-700 text-white font-bold px-4 py-2 rounded-xl text-xs shadow-sm transition-all"
          >
            <MessageCircle className="w-4 h-4" /> WhatsApp Agent
          </button>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-5">
          {loading ? (
            [1, 2, 3, 4].map(i => <div key={i} className="h-72 bg-gray-200 rounded-2xl animate-pulse"></div>)
          ) : (
            properties.map(p => <PropertyCard key={p.id} property={p} />)
          )}
        </div>

        {/* Locality Market Guide & Search Intent Section */}
        <section className="mt-14 bg-white p-6 md:p-10 rounded-3xl border border-gray-200 shadow-sm space-y-8">
          <h2 className="text-2xl md:text-3xl font-extrabold text-gray-900 border-b border-gray-100 pb-4">
            Complete Real Estate & Property Guide for {info.name}, Vizag
          </h2>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div className="space-y-3">
              <h3 className="text-xl font-bold text-gray-900 flex items-center gap-2">
                🏢 Apartments & Flats in {info.name}
              </h3>
              <p className="text-sm text-gray-700 leading-relaxed">
                Looking for <strong>flats for sale in {info.name}</strong>? Home buyers can explore a wide variety of <strong>2 BHK flats in {info.name}</strong> (950 - 1,250 sq.ft.) and spacious <strong>3 BHK flats in {info.name}</strong> (1,450 - 2,100 sq.ft.). Modern gated communities in {info.name} come equipped with 24/7 security, elevators, power backup, covered car parking, and clubhouse facilities.
              </p>
            </div>

            <div className="space-y-3">
              <h3 className="text-xl font-bold text-gray-900 flex items-center gap-2">
                🏞️ Open Plots & VMRDA Layouts in {info.name}
              </h3>
              <p className="text-sm text-gray-700 leading-relaxed">
                Searching for <strong>plots for sale in {info.name}</strong>? Land investment in <strong>{info.name} plots</strong> offers strong long-term capital growth. Most residential layouts are <strong>VMRDA approved</strong> with 40-foot blacktop roads, underground drainage, electricity, and clear title deeds for safe legal ownership.
              </p>
            </div>

            <div className="space-y-3">
              <h3 className="text-xl font-bold text-gray-900 flex items-center gap-2">
                🏡 Villas & Independent Houses in {info.name}
              </h3>
              <p className="text-sm text-gray-700 leading-relaxed">
                For buyers seeking luxury living and private open spaces, <strong>villas in {info.name}</strong> provide high-end multi-storey independent duplexes and gated villa communities featuring private gardens and premium fittings.
              </p>
            </div>

            <div className="space-y-3">
              <h3 className="text-xl font-bold text-gray-900 flex items-center gap-2">
                💰 Property Prices & Rental Market in {info.name}
              </h3>
              <p className="text-sm text-gray-700 leading-relaxed">
                Current <strong>property prices in {info.name}</strong> average <strong>{info.avgPriceSqFt}</strong>, with 3-year historical capital appreciation standing at <strong>{info.priceTrends}</strong>. High demand from IT employees and university faculty also makes <strong>property for rent in {info.name}</strong> a steady monthly cash-flow generator for landlords.
              </p>
            </div>
          </div>
        </section>

        {/* P0 & P1 Cross-Locality Navigation */}
        <div className="mt-10 bg-white p-8 rounded-3xl border border-gray-200 shadow-sm">
          <h3 className="text-xl font-bold text-gray-900 mb-4">
            Explore All Top Localities & Neighborhoods in Visakhapatnam
          </h3>

          <div className="mb-4">
            <span className="text-xs font-extrabold uppercase tracking-wider text-primary-700 bg-primary-50 px-2.5 py-1 rounded-md border border-primary-200">
              P0 Primary Growth Corridors
            </span>
            <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-6 gap-3 mt-3">
              {[
                { name: 'Madhurawada', slug: '/localities/madhurawada' },
                { name: 'Yendada', slug: '/localities/yendada' },
                { name: 'Rushikonda', slug: '/localities/rushikonda' },
                { name: 'PM Palem', slug: '/localities/pm-palem' },
                { name: 'Gajuwaka', slug: '/localities/gajuwaka' },
                { name: 'MVP Colony', slug: '/localities/mvp-colony' }
              ].map(l => (
                <Link
                  key={l.name}
                  to={l.slug}
                  className={`p-3 rounded-xl text-center text-xs font-bold border transition-all ${
                    l.slug.endsWith(slug)
                      ? 'bg-primary-600 text-white border-primary-600 shadow-sm'
                      : 'bg-gray-50 text-gray-800 border-gray-200 hover:bg-gray-100'
                  }`}
                >
                  {l.name}
                </Link>
              ))}
            </div>
          </div>

          <div>
            <span className="text-xs font-extrabold uppercase tracking-wider text-emerald-700 bg-emerald-50 px-2.5 py-1 rounded-md border border-emerald-200">
              P1 High Growth Localities
            </span>
            <div className="grid grid-cols-2 sm:grid-cols-4 md:grid-cols-8 gap-2.5 mt-3">
              {[
                { name: 'Seethammadhara', slug: '/localities/seethammadhara' },
                { name: 'Kommadi', slug: '/localities/kommadi' },
                { name: 'Bheemili', slug: '/localities/bheemili' },
                { name: 'Bheemunipatnam', slug: '/localities/bheemunipatnam' },
                { name: 'Pendurthi', slug: '/localities/pendurthi' },
                { name: 'Tagarapuvalasa', slug: '/localities/tagarapuvalasa' },
                { name: 'Duvvada', slug: '/localities/duvvada' },
                { name: 'Visalakshi Nagar', slug: '/localities/visalakshi-nagar' }
              ].map(l => (
                <Link
                  key={l.name}
                  to={l.slug}
                  className={`p-2.5 rounded-xl text-center text-xs font-bold border transition-all ${
                    l.slug.endsWith(slug)
                      ? 'bg-emerald-600 text-white border-emerald-600 shadow-sm'
                      : 'bg-gray-50 text-gray-800 border-gray-200 hover:bg-gray-100'
                  }`}
                >
                  {l.name}
                </Link>
              ))}
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
