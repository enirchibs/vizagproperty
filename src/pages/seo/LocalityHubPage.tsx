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
    metaDesc: 'Explore property in Kommadi, Vizag. High-appreciation VMRDA approved plots, open layouts & modern gated apartments near Madhurawada Junction.',
    keywords: 'kommadi property, plots for sale in kommadi vizag, flats in kommadi, kommadi real estate',
    avgPriceSqFt: '₹3,500 - ₹5,000 / sq.ft.',
    topHighlights: ['Rapidly Developing Educational Hub', 'Direct NH16 Highway Access', 'Affordable Land & Layout Prices', 'Proximity to IT Expansion Zone'],
    description: 'Kommadi is one of Vizag’s fastest-growing affordable residential corridors located immediately north of Madhurawada. It is an investment hot-spot for open layout plots and upcoming gated apartment complexes.',
    priceTrends: '16.7% appreciation over 3 years driven by plot layout developments.'
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

        {/* Cross-Locality Navigation */}
        <div className="mt-16 bg-white p-8 rounded-3xl border border-gray-200 shadow-sm">
          <h3 className="text-xl font-bold text-gray-900 mb-4">
            Explore Nearby Neighborhoods in Vizag
          </h3>
          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-6 gap-3">
            {[
              { name: 'Madhurawada', slug: '/localities/madhurawada' },
              { name: 'Yendada', slug: '/localities/yendada' },
              { name: 'Rushikonda', slug: '/localities/rushikonda' },
              { name: 'PM Palem', slug: '/localities/pm-palem' },
              { name: 'Gajuwaka', slug: '/localities/gajuwaka' },
              { name: 'MVP Colony', slug: '/localities/mvp-colony' },
              { name: 'Kommadi', slug: '/localities/kommadi' }
            ].map(l => (
              <Link
                key={l.name}
                to={l.slug}
                className={`p-3 rounded-xl text-center text-xs font-bold border transition-all ${
                  l.slug.endsWith(slug)
                    ? 'bg-primary-600 text-white border-primary-600'
                    : 'bg-gray-50 text-gray-800 border-gray-200 hover:bg-gray-100'
                }`}
              >
                {l.name}
              </Link>
            ))}
          </div>
        </div>
      </main>
    </div>
  );
}
