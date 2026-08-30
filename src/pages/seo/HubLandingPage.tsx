import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { supabase } from '../../lib/supabase';
import { Property } from '../../types';
import { PropertyCard } from '../../components/PropertyCard';
import { SEOHead } from '../../components/SEOHead';
import { sortPropertiesGlobalPreference } from '../../lib/searchFilters';
import { openWhatsApp } from '../../lib/whatsapp';
import { Building2, ArrowRight, MessageCircle, Phone } from 'lucide-react';
import { VIZAG_PROPERTY_PHONE_WITH_CODE } from '../../config/contact';

export interface HubPageConfig {
  slug: string;
  title: string;
  metaTitle: string;
  metaDesc: string;
  keywords: string;
  categoryFilter?: string;
  listingTypeFilter?: string;
  isVMRDA?: boolean;
  isRERA?: boolean;
  headline: string;
  subheadline: string;
  editorialText: string[];
  faqs: { question: string; answer: string }[];
}

const HUB_CONFIGS: Record<string, HubPageConfig> = {
  'property-in-vizag': {
    slug: 'property-in-vizag',
    title: 'Property in Vizag',
    metaTitle: 'Property in Vizag | Best Verified Real Estate & Land in Visakhapatnam',
    metaDesc: 'Explore top verified property in Vizag & Visakhapatnam. Buy flats, VMRDA approved plots, luxury villas, commercial spaces and houses across Madhurawada, Yendada, MVP Colony.',
    keywords: 'property in vizag, property in visakhapatnam, vizag real estate, buy property vizag, vizag properties for sale',
    headline: 'Explore Verified Property in Vizag',
    subheadline: 'Visakhapatnam’s #1 digital marketplace for buying, selling, and investing in premier coastal real estate.',
    editorialText: [
      'Visakhapatnam (Vizag) has emerged as one of South India’s premier real estate growth engines. Driven by IT expansion in Madhurawada and Rushikonda, major industrial corridors in Gajuwaka, and upcoming infrastructure like the Bhogapuram International Airport, Vizag property offers unmatched appreciation.',
      'Whether you are looking for ready-to-move 2 & 3 BHK apartments, high-yield VMRDA approved open plots, luxury seaside villas, or commercial spaces, VizagProperty provides 100% transparent listings directly from owners and reputed developers.'
    ],
    faqs: [
      {
        question: 'Why is investing in Vizag property considered lucrative?',
        answer: 'Vizag is Andhra Pradesh’s executive and commercial capital, benefiting from IT SEZ expansion, port connectivity, metro rail planning, and Bhogapuram Airport construction.'
      },
      {
        question: 'What are the top localities to buy property in Vizag?',
        answer: 'Madhurawada, Yendada, PM Palem, MVP Colony, Rushikonda, and Bhogapuram are the top growth corridors with excellent connectivity and high ROI.'
      }
    ]
  },
  'property-for-sale-vizag': {
    slug: 'property-for-sale-vizag',
    title: 'Property for Sale in Vizag',
    metaTitle: 'Property for Sale in Vizag | Verified Houses, Flats & Land Visakhapatnam',
    metaDesc: 'Find top property for sale in Vizag & Visakhapatnam. Direct owner listings for gated flats, open residential plots, villas & commercial properties.',
    keywords: 'property for sale in vizag, vizag property for sale, buy house in vizag, flats for sale in visakhapatnam',
    listingTypeFilter: 'sale',
    headline: 'Property for Sale in Vizag',
    subheadline: 'Browse verified residential plots, apartments, independent houses, and commercial property for sale.',
    editorialText: [
      'Finding the right property for sale in Vizag requires access to genuine listings, verified title deeds, and clear market pricing. VizagProperty brings you direct access to properties for sale across all major Visakhapatnam neighborhoods.',
      'From budget-friendly 2 BHK flats under 45 Lakhs in Madhurawada to premium VMRDA open plots near Bhogapuram highway, filter by budget, area, and configuration to connect with sellers instantly.'
    ],
    faqs: [
      {
        question: 'How do I verify a property for sale in Vizag before buying?',
        answer: 'Always verify VMRDA or DTCP layout approval numbers, AP RERA registration status, EC (Encumbrance Certificate), and title deed history before purchase.'
      }
    ]
  },
  'real-estate-vizag': {
    slug: 'real-estate-vizag',
    title: 'Real Estate Vizag',
    metaTitle: 'Real Estate Vizag | Visakhapatnam Property Market & Investment',
    metaDesc: 'Comprehensive guide to Vizag real estate. Discover property rates, price trends, top builders, VMRDA layouts, and prime residential localities in Visakhapatnam.',
    keywords: 'real estate vizag, visakhapatnam real estate, vizag real estate market, real estate developers in vizag',
    headline: 'Vizag Real Estate Market Overview',
    subheadline: 'Your definitive guide to property investment, market trends, and developer projects in Visakhapatnam.',
    editorialText: [
      'The real estate landscape in Visakhapatnam has witnessed consistent 12-18% annual capital appreciation across prime coastal and IT corridors. With major infrastructure developments underway, early-stage plot and apartment buyers enjoy high rental yields and long-term equity growth.',
      'Explore verified property listings, compare builder reputations, evaluate locality price trends, and calculate loan eligibility directly on VizagProperty.'
    ],
    faqs: [
      {
        question: 'What is the average real estate price growth in Vizag?',
        answer: 'Prime areas like Madhurawada and Yendada have experienced 15-20% appreciation over 3 years due to IT hub development and beach corridor demand.'
      }
    ]
  },
  'plots-for-sale-vizag': {
    slug: 'plots-for-sale-vizag',
    title: 'Plots for Sale in Vizag',
    metaTitle: 'Plots for Sale in Vizag | Open & VMRDA Approved Plots Visakhapatnam',
    metaDesc: 'Buy open plots for sale in Vizag & Visakhapatnam. Verified VMRDA, DTCP approved residential plots in Madhurawada, PM Palem, Bhogapuram, Kothavalasa.',
    keywords: 'plots for sale in vizag, vizag plots, open plots in vizag, vmrda plots in vizag, residential land for sale in visakhapatnam',
    categoryFilter: 'plot',
    listingTypeFilter: 'sale',
    headline: 'Plots for Sale in Vizag',
    subheadline: 'Invest in VMRDA approved residential layouts, open land, and gated community plots across Visakhapatnam.',
    editorialText: [
      'Land ownership in Vizag is one of the safest and highest-yielding asset classes in Andhra Pradesh. VMRDA approved layouts ensure proper road width, underground drainage, electricity infrastructure, and clear legal titles.',
      'Explore residential plots in Madhurawada, highway-facing plots in Bhogapuram, and prime investment land near Kothavalasa and Anandapuram.'
    ],
    faqs: [
      {
        question: 'What is the price of land per square yard in Vizag?',
        answer: 'Plot prices range from ₹15,000 to ₹35,000 per sq. yd. in developing corridors like Bhogapuram, and ₹40,000 to ₹80,000 per sq. yd. in Madhurawada and Yendada.'
      }
    ]
  },
  'flats-for-sale-vizag': {
    slug: 'flats-for-sale-vizag',
    title: 'Flats for Sale in Vizag',
    metaTitle: 'Flats for Sale in Vizag | 2 BHK & 3 BHK Apartments in Visakhapatnam',
    metaDesc: 'Explore 2 BHK & 3 BHK flats for sale in Vizag & Visakhapatnam. Find verified gated community apartments in Madhurawada, MVP Colony, PM Palem, Yendada with price details.',
    keywords: 'flats for sale in vizag, vizag flats, apartments in vizag, 2 bhk flats in vizag, 3 bhk flats in visakhapatnam, buy flat in vizag, ready to move flats vizag',
    categoryFilter: 'flat',
    listingTypeFilter: 'sale',
    headline: 'Flats for Sale in Vizag',
    subheadline: 'Discover 2 BHK & 3 BHK ready-to-move and under-construction gated community apartments across Visakhapatnam.',
    editorialText: [
      'Buying an apartment or flat in Vizag offers excellent living comfort combined with high rental demand from IT SEZ professionals and university faculty. Madhurawada, Yendada, and PM Palem are top choices for 2 & 3 BHK gated community flats.',
      'Explore verified apartment listings with elevators, 24/7 power backup, covered car parking, and clubhouse amenities directly on VizagProperty.'
    ],
    faqs: [
      {
        question: 'What is the average price of 2 BHK flat in Vizag?',
        answer: '2 BHK flat prices in Madhurawada range from ₹45 Lakhs to ₹65 Lakhs, while 2 BHKs in premium areas like Yendada and MVP Colony range from ₹70 Lakhs to ₹95 Lakhs.'
      }
    ]
  },
  'flats-for-sale-in-vizag': {
    slug: 'flats-for-sale-in-vizag',
    title: 'Flats for Sale in Vizag',
    metaTitle: 'Flats for Sale in Vizag | 2 BHK & 3 BHK Apartments in Visakhapatnam',
    metaDesc: 'Explore 2 BHK & 3 BHK flats for sale in Vizag & Visakhapatnam. Find verified gated community apartments in Madhurawada, MVP Colony, PM Palem, Yendada with price details.',
    keywords: 'flats for sale in vizag, vizag flats, apartments in vizag, 2 bhk flats in vizag, 3 bhk flats in visakhapatnam, buy flat in vizag, ready to move flats vizag',
    categoryFilter: 'flat',
    listingTypeFilter: 'sale',
    headline: 'Flats for Sale in Vizag',
    subheadline: 'Discover 2 BHK & 3 BHK ready-to-move and under-construction gated community apartments across Visakhapatnam.',
    editorialText: [
      'Buying an apartment or flat in Vizag offers excellent living comfort combined with high rental demand from IT SEZ professionals and university faculty. Madhurawada, Yendada, and PM Palem are top choices for 2 & 3 BHK gated community flats.',
      'Explore verified apartment listings with elevators, 24/7 power backup, covered car parking, and clubhouse amenities directly on VizagProperty.'
    ],
    faqs: [
      {
        question: 'What is the average price of 2 BHK flat in Vizag?',
        answer: '2 BHK flat prices in Madhurawada range from ₹45 Lakhs to ₹65 Lakhs, while 2 BHKs in premium areas like Yendada and MVP Colony range from ₹70 Lakhs to ₹95 Lakhs.'
      }
    ]
  },
  'villas-for-sale-vizag': {
    slug: 'villas-for-sale-vizag',
    title: 'Villas for Sale in Vizag',
    metaTitle: 'Villas for Sale in Vizag | Luxury Independent & Gated Villas Visakhapatnam',
    metaDesc: 'Discover luxury villas for sale in Vizag. Independent houses, 3 & 4 BHK gated community villas in Rushikonda, Yendada, Madhurawada with sea views.',
    keywords: 'villas for sale in vizag, luxury villas in vizag, gated community villas visakhapatnam, independent house for sale vizag',
    categoryFilter: 'villa',
    listingTypeFilter: 'sale',
    headline: 'Luxury Villas for Sale in Vizag',
    subheadline: 'Experience exclusive living with 3 & 4 BHK independent gated community villas in Visakhapatnam.',
    editorialText: [
      'For homebuyers seeking space, privacy, and premium amenities, gated villas in Vizag offer unmatched luxury. Located along scenic hilltops and coastal stretches like Rushikonda and Yendada, these villas feature private gardens, clubhouses, swimming pools, and 24/7 security.',
      'Explore ready-to-move and under-construction villa projects from top Visakhapatnam developers with transparent legal documentation.'
    ],
    faqs: [
      {
        question: 'What is the starting price for luxury villas in Vizag?',
        answer: 'Gated community villas in areas like Madhurawada and Yendada start from ₹1.2 Crores up to ₹3.5 Crores depending on plot size and amenities.'
      }
    ]
  },
  'houses-for-sale-vizag': {
    slug: 'houses-for-sale-vizag',
    title: 'Houses for Sale in Vizag',
    metaTitle: 'Houses for Sale in Vizag | Independent Houses & Duplexes Visakhapatnam',
    metaDesc: 'Find independent houses for sale in Vizag. Single floor houses, duplex homes & building portions for sale in MVP Colony, Seethammadhara, Gajuwaka.',
    keywords: 'houses for sale in vizag, independent house for sale in vizag, duplex house vizag, buy house in visakhapatnam',
    categoryFilter: 'villa',
    listingTypeFilter: 'sale',
    headline: 'Independent Houses for Sale in Vizag',
    subheadline: 'Find spacious independent duplexes, individual homes, and multi-storey house portions in Visakhapatnam.',
    editorialText: [
      'Independent houses offer plot ownership combined with complete structural freedom. Properties in established residential neighborhoods like MVP Colony, Seethammadhara, and PM Palem are highly sought after by multi-generational families.',
      'Filter through verified independent houses with dedicated parking, borewell facilities, and clear VUDA/VMRDA plan approvals.'
    ],
    faqs: [
      {
        question: 'Are independent houses in Vizag VMRDA approved?',
        answer: 'Most constructed houses in Visakhapatnam hold VUDA/VMRDA sanctioned building plans and municipal occupancy certificates.'
      }
    ]
  },
  'commercial-property-vizag': {
    slug: 'commercial-property-vizag',
    title: 'Commercial Property in Vizag',
    metaTitle: 'Commercial Property for Sale & Rent in Vizag | Office Spaces & Shops',
    metaDesc: 'Explore commercial property in Vizag. Buy & rent office spaces, retail shops, commercial plots & showrooms in Siripuram, MVP Colony, Gajuwaka.',
    keywords: 'commercial property in vizag, office space for rent in vizag, commercial shops for sale vizag, retail spaces visakhapatnam',
    categoryFilter: 'commercial',
    headline: 'Commercial Property in Vizag',
    subheadline: 'Prime office spaces, retail showrooms, commercial land, and IT park facilities in Visakhapatnam.',
    editorialText: [
      'Vizag’s economic growth as an industrial and IT hub makes commercial real estate a high-yielding investment option. Office spaces near Siripuram, Dwaraka Nagar, and Madhurawada IT SEZ generate steady 7-10% rental yields.',
      'Browse retail shops, plug-and-play IT offices, commercial building floors, and main-road commercial plots across Vizag.'
    ],
    faqs: [
      {
        question: 'What is the average commercial rental yield in Vizag?',
        answer: 'Commercial properties in prime Vizag business districts yield between 7% and 10% annually with multi-year lease agreements.'
      }
    ]
  },
  'property-for-rent-vizag': {
    slug: 'property-for-rent-vizag',
    title: 'Property for Rent in Vizag',
    metaTitle: 'Property for Rent in Vizag | 1, 2, 3 BHK Rental Flats & Houses',
    metaDesc: 'Find property for rent in Vizag. Explore 1 BHK, 2 BHK, 3 BHK rental apartments, furnished flats, independent house rentals in Madhurawada, MVP Colony.',
    keywords: 'property for rent in vizag, flats for rent in vizag, 2 bhk flat for rent vizag, house for rent in visakhapatnam',
    listingTypeFilter: 'rent',
    headline: 'Property for Rent in Vizag',
    subheadline: 'Discover budget-friendly and luxury rental apartments, houses, and PG accommodations in Visakhapatnam.',
    editorialText: [
      'Whether you are an IT professional working in Hill No. 3 Rushikonda, a university student, or a relocating family, Vizag offers wide rental choices from ₹8,000/month to ₹45,000/month.',
      'Connect directly with house owners to avoid brokerage and find family-friendly apartments with power backup, elevator, and security.'
    ],
    faqs: [
      {
        question: 'What is the average 2 BHK rent in Madhurawada Vizag?',
        answer: 'Unfurnished 2 BHK flats rent for ₹10,000 - ₹14,000/month, while semi-furnished or gated community 2 BHKs range from ₹15,000 to ₹20,000/month.'
      }
    ]
  },
  'vmrda-approved-layouts-vizag': {
    slug: 'vmrda-approved-layouts-vizag',
    title: 'VMRDA Approved Layouts in Vizag',
    metaTitle: 'VMRDA Approved Layouts in Vizag | LP Number Verified Plots',
    metaDesc: 'Search 100% legal VMRDA approved layouts in Vizag. Verified LP number plots, open layouts, gated plot communities in Madhurawada, PM Palem, Bhogapuram.',
    keywords: 'vmrda approved layouts in vizag, vmrda lp number plots, vuda approved plots vizag, legal plots visakhapatnam',
    isVMRDA: true,
    categoryFilter: 'plot',
    headline: 'VMRDA Approved Layouts & LP Number Plots',
    subheadline: 'Invest with 100% legal safety in Visakhapatnam Metropolitan Region Development Authority layouts.',
    editorialText: [
      'Buying a VMRDA (formerly VUDA) approved plot guarantees that your land parcel complies with statutory master plan zoning, 40-foot wide asphalt roads, open space reservations, public parks, and water supply infrastructure.',
      'Every VMRDA layout listed on VizagProperty is verified with layout approval (LP) numbers and clear title history.'
    ],
    faqs: [
      {
        question: 'How do I check if a plot layout in Vizag is VMRDA approved?',
        answer: 'Ask the developer for the VMRDA L.P. (Layout Permission) Number and verify it directly on the official VMRDA portal or layout master copy.'
      }
    ]
  },
  'rera-approved-projects-vizag': {
    slug: 'rera-approved-projects-vizag',
    title: 'RERA Approved Projects in Vizag',
    metaTitle: 'RERA Approved Projects in Vizag | AP RERA Registered Apartments & Plots',
    metaDesc: 'Explore AP RERA registered builder projects in Vizag. Verified apartment complexes, villa layouts & townships with RERA registration numbers.',
    keywords: 'rera approved projects in vizag, ap rera registered flats vizag, rera builders visakhapatnam, buyer safe projects vizag',
    isRERA: true,
    headline: 'AP RERA Registered Projects in Vizag',
    subheadline: 'Buyer-protected residential apartment complexes, villa townships, and layout developments.',
    editorialText: [
      'AP RERA registration ensures on-time project completion, escrow account financial transparency, and strict penalty protection for buyers against delay.',
      'Discover top RERA registered projects from certified builders across Madhurawada, Yendada, Gajuwaka, and MVP Colony.'
    ],
    faqs: [
      {
        question: 'Why should I buy a RERA registered property in Vizag?',
        answer: 'RERA mandates that 70% of buyer funds remain in dedicated project escrow accounts, preventing fund diversion and securing completion timelines.'
      }
    ]
  }
};

export function HubLandingPage() {
  const { hubSlug } = useParams<{ hubSlug?: string }>();
  const [properties, setProperties] = useState<Property[]>([]);
  const [loading, setLoading] = useState(true);

  // Derive configuration from URL route or fallback to default
  const matchedKey = hubSlug ? hubSlug.replace(/^\//, '') : 'property-in-vizag';
  const config = HUB_CONFIGS[matchedKey] || HUB_CONFIGS['property-in-vizag'];
  const canonicalUrl = `https://vizagproperty.co.in/${config.slug}`;

  useEffect(() => {
    async function loadHubData() {
      setLoading(true);
      try {
        let query = supabase
          .from('properties')
          .select('*, localities!inner(name, slug, city)')
          .eq('status', 'approved')
          .order('created_at', { ascending: false })
          .limit(40);

        if (config.categoryFilter === 'plot') {
          query = query.or('property_type.eq.plot_land,category.eq.plot');
        } else if (config.categoryFilter === 'flat') {
          query = query.or('property_type.eq.apartment,category.eq.flat');
        } else if (config.categoryFilter === 'villa') {
          query = query.or('property_type.eq.independent_house,category.eq.villa');
        } else if (config.categoryFilter === 'commercial') {
          query = query.or('property_type.eq.commercial,category.eq.commercial');
        }

        if (config.listingTypeFilter) {
          query = query.eq('listing_type', config.listingTypeFilter);
        }

        const { data, error } = await query;
        if (error) throw error;
        
        let fetchedProps = data || [];
        if (fetchedProps.length < 4) {
          const { data: fallbackData } = await supabase
            .from('properties')
            .select('*, localities!inner(name, slug, city)')
            .eq('status', 'approved')
            .limit(20);
          fetchedProps = fallbackData || [];
        }

        setProperties(sortPropertiesGlobalPreference(fetchedProps));
      } catch (err) {
        console.error('Hub load error:', err);
      } finally {
        setLoading(false);
      }
    }

    loadHubData();
  }, [config]);

  const schema = [
    {
      "@context": "https://schema.org",
      "@type": "WebPage",
      "name": config.metaTitle,
      "description": config.metaDesc,
      "url": canonicalUrl
    },
    {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": config.faqs.map(f => ({
        "@type": "Question",
        "name": f.question,
        "acceptedAnswer": {
          "@type": "Answer",
          "text": f.answer
        }
      }))
    }
  ];

  return (
    <div className="min-h-screen bg-gray-50 pb-16">
      <SEOHead
        title={config.metaTitle}
        description={config.metaDesc}
        canonicalUrl={canonicalUrl}
        url={canonicalUrl}
        keywords={config.keywords}
        schema={schema}
      />

      {/* Hero Header */}
      <section className="bg-gradient-to-r from-primary-900 via-primary-800 to-primary-950 text-white py-14 px-4 relative overflow-hidden">
        <div className="max-w-7xl mx-auto relative z-10">
          <div className="flex items-center gap-2 text-accent-400 text-xs md:text-sm font-bold uppercase tracking-wider mb-2">
            <Building2 className="w-4 h-4" /> Vizag Property Hub
          </div>
          <h1 className="text-3xl md:text-5xl font-extrabold tracking-tight mb-4 leading-tight">
            {config.headline}
          </h1>
          <p className="text-base md:text-xl text-gray-200 max-w-3xl leading-relaxed">
            {config.subheadline}
          </p>

          <div className="mt-6 flex flex-wrap gap-3">
            <button
              onClick={() => openWhatsApp(`Hi Vizag Property Experts, I am interested in ${config.title}`)}
              className="inline-flex items-center gap-2 bg-emerald-600 hover:bg-emerald-700 text-white font-bold px-5 py-2.5 rounded-xl text-sm shadow-md transition-all"
            >
              <MessageCircle className="w-4 h-4" /> Contact via WhatsApp
            </button>
            <a
              href={`tel:${VIZAG_PROPERTY_PHONE_WITH_CODE}`}
              className="inline-flex items-center gap-2 bg-white/10 hover:bg-white/20 text-white font-bold px-5 py-2.5 rounded-xl text-sm border border-white/20 transition-all"
            >
              <Phone className="w-4 h-4" /> Call Property Expert
            </a>
          </div>
        </div>
      </section>

      {/* Listings Section */}
      <main className="max-w-7xl mx-auto px-4 py-10">
        <div className="flex flex-col md:flex-row md:items-end justify-between mb-6 gap-2 border-b border-gray-200 pb-4">
          <div>
            <h2 className="text-2xl md:text-3xl font-extrabold text-gray-900">
              Latest Listings for {config.title}
            </h2>
            <p className="text-sm text-gray-600 mt-1">
              Showing verified properties matching search intent across Visakhapatnam
            </p>
          </div>
          <Link
            to="/properties"
            className="inline-flex items-center gap-1 text-primary-600 font-bold hover:text-primary-800 text-sm"
          >
            View All Properties <ArrowRight className="w-4 h-4" />
          </Link>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-5">
          {loading ? (
            [1, 2, 3, 4].map(i => <div key={i} className="h-72 bg-gray-200 rounded-2xl animate-pulse"></div>)
          ) : (
            properties.map(p => <PropertyCard key={p.id} property={p} />)
          )}
        </div>

        {/* Editorial Guide & Market Overview */}
        <section className="mt-16 bg-white p-6 md:p-10 rounded-3xl border border-gray-200 shadow-sm space-y-6">
          <h2 className="text-2xl md:text-3xl font-extrabold text-gray-900 border-b border-gray-100 pb-3">
            Market Insights & Guide: {config.title}
          </h2>
          {config.editorialText.map((p, idx) => (
            <p key={idx} className="text-gray-700 leading-relaxed text-base">
              {p}
            </p>
          ))}

          {/* Quick Locality Linking Grid */}
          <div className="pt-6 border-t border-gray-100">
            <h3 className="text-lg font-bold text-gray-900 mb-4">
              Explore Property by Top Localities in Vizag
            </h3>
            <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-6 gap-3">
              {[
                { name: 'Madhurawada', slug: '/localities/madhurawada' },
                { name: 'Yendada', slug: '/localities/yendada' },
                { name: 'Rushikonda', slug: '/localities/rushikonda' },
                { name: 'PM Palem', slug: '/localities/pm-palem' },
                { name: 'Gajuwaka', slug: '/localities/gajuwaka' },
                { name: 'MVP Colony', slug: '/localities/mvp-colony' }
              ].map(loc => (
                <Link
                  key={loc.name}
                  to={loc.slug}
                  className="bg-gray-50 hover:bg-primary-50 hover:border-primary-300 border border-gray-200 p-3 rounded-xl text-center text-xs font-bold text-gray-800 transition-all"
                >
                  {loc.name}
                </Link>
              ))}
            </div>
          </div>

          {/* Tier 1 Money Pages Linking Silo Bar */}
          <div className="pt-6 border-t border-gray-100 mt-6">
            <h3 className="text-lg font-bold text-gray-900 mb-4">
              Tier 1 Real Estate Money Pages in Vizag
            </h3>
            <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-5 gap-3">
              {[
                { name: 'Property in Vizag', slug: '/property-in-vizag' },
                { name: 'Real Estate Vizag', slug: '/real-estate-vizag' },
                { name: 'Property for Sale', slug: '/property-for-sale-vizag' },
                { name: 'Plots for Sale', slug: '/plots-for-sale-vizag' },
                { name: 'Flats for Sale', slug: '/flats-for-sale-vizag' },
                { name: 'Villas for Sale', slug: '/villas-for-sale-vizag' },
                { name: 'Property for Rent', slug: '/property-for-rent-vizag' },
                { name: 'Property Prices', slug: '/property-prices-vizag' },
                { name: 'Real Estate Market', slug: '/vizag-real-estate-market' },
                { name: 'Property Investment', slug: '/property-investment-vizag' }
              ].map(tier => (
                <Link
                  key={tier.name}
                  to={tier.slug}
                  className="bg-primary-50/60 hover:bg-primary-100 border border-primary-200 p-2.5 rounded-xl text-center text-xs font-extrabold text-primary-900 transition-all"
                >
                  {tier.name}
                </Link>
              ))}
            </div>
          </div>
        </section>

        {/* FAQs */}
        {config.faqs.length > 0 && (
          <section className="mt-10 bg-white p-6 md:p-10 rounded-3xl border border-gray-200 shadow-sm">
            <h2 className="text-2xl font-extrabold text-gray-900 mb-6">
              Frequently Asked Questions ({config.title})
            </h2>
            <div className="space-y-4">
              {config.faqs.map((faq, idx) => (
                <div key={idx} className="bg-gray-50 p-5 rounded-2xl border border-gray-100">
                  <h3 className="text-base font-bold text-gray-900 mb-2">{faq.question}</h3>
                  <p className="text-sm text-gray-700 leading-relaxed">{faq.answer}</p>
                </div>
              ))}
            </div>
          </section>
        )}
      </main>
    </div>
  );
}
