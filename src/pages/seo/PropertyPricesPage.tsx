import { useParams, Link } from 'react-router-dom';
import { SEOHead } from '../../components/SEOHead';
import { TrendingUp, ArrowRight } from 'lucide-react';
import { openWhatsApp } from '../../lib/whatsapp';

interface MarketPriceConfig {
  slug: string;
  title?: string;
  metaTitle: string;
  metaDesc: string;
  keywords: string;
  heading: string;
  subheading: string;
  priceData: { locality: string; flatRate: string; plotRate: string; rentalYield: string; trend: string }[];
}

const MARKET_CONFIGS: Record<string, MarketPriceConfig> = {
  'property-prices-vizag': {
    slug: 'property-prices-vizag',
    metaTitle: 'Property Prices in Vizag 2026 | Land Rates & Flat Prices Visakhapatnam',
    metaDesc: 'Check latest property prices in Vizag. Compare flat rates per sq.ft., land prices per sq.yd. & commercial rates across Madhurawada, Yendada, MVP Colony & Gajuwaka.',
    keywords: 'property prices in vizag, land rate in vizag per sq yard, flat price in vizag, vizag property valuation',
    heading: 'Vizag Property Prices & Rates 2026',
    subheading: 'Comprehensive price index for apartments, open plots, villas, and commercial real estate in Visakhapatnam.',
    priceData: [
      { locality: 'Madhurawada', flatRate: '₹4,500 - ₹6,500/sq.ft', plotRate: '₹35,000 - ₹65,000/sq.yd', rentalYield: '4.8%', trend: '+15.4%' },
      { locality: 'Yendada', flatRate: '₹5,800 - ₹8,200/sq.ft', plotRate: '₹50,000 - ₹85,000/sq.yd', rentalYield: '4.2%', trend: '+18.2%' },
      { locality: 'Rushikonda', flatRate: '₹6,500 - ₹9,500/sq.ft', plotRate: '₹60,000 - ₹1,10,000/sq.yd', rentalYield: '5.1%', trend: '+20.1%' },
      { locality: 'PM Palem', flatRate: '₹4,000 - ₹5,800/sq.ft', plotRate: '₹30,000 - ₹52,000/sq.yd', rentalYield: '4.5%', trend: '+14.1%' },
      { locality: 'MVP Colony', flatRate: '₹7,000 - ₹10,500/sq.ft', plotRate: '₹80,000 - ₹1,40,000/sq.yd', rentalYield: '3.9%', trend: '+12.5%' },
      { locality: 'Gajuwaka', flatRate: '₹3,800 - ₹5,500/sq.ft', plotRate: '₹25,000 - ₹48,000/sq.yd', rentalYield: '5.5%', trend: '+11.8%' },
      { locality: 'Bhogapuram', flatRate: '₹3,200 - ₹4,500/sq.ft', plotRate: '₹15,000 - ₹32,000/sq.yd', rentalYield: '3.5%', trend: '+24.6%' }
    ]
  },
  'plot-prices-vizag': {
    slug: 'plot-prices-vizag',
    metaTitle: 'Plot Prices in Vizag | Land Rates per Sq Yard Visakhapatnam',
    metaDesc: 'Explore open plot prices & VMRDA land rates per sq yard in Vizag. Compare land rates in Madhurawada, Bhogapuram, Anandapuram, Kothavalasa.',
    keywords: 'plot prices in vizag, land rates per sq yard in vizag, vmrda plot rate vizag, open land price visakhapatnam',
    heading: 'Vizag Plot Prices & Land Rates per Sq. Yard',
    subheading: 'Verified VMRDA & DTCP layout plot pricing index across key growth corridors of Visakhapatnam.',
    priceData: [
      { locality: 'Bhogapuram Highway Corridor', flatRate: 'N/A', plotRate: '₹15,000 - ₹32,000/sq.yd', rentalYield: 'N/A', trend: '+24.6%' },
      { locality: 'Madhurawada IT Corridor', flatRate: 'N/A', plotRate: '₹35,000 - ₹65,000/sq.yd', rentalYield: 'N/A', trend: '+15.4%' },
      { locality: 'Anandapuram Junction', flatRate: 'N/A', plotRate: '₹20,000 - ₹38,000/sq.yd', rentalYield: 'N/A', trend: '+19.2%' },
      { locality: 'Kothavalasa Corridor', flatRate: 'N/A', plotRate: '₹10,000 - ₹22,000/sq.yd', rentalYield: 'N/A', trend: '+17.0%' },
      { locality: 'Yendada Sea View Plots', flatRate: 'N/A', plotRate: '₹50,000 - ₹85,000/sq.yd', rentalYield: 'N/A', trend: '+18.2%' }
    ]
  },
  'flat-prices-vizag': {
    slug: 'flat-prices-vizag',
    metaTitle: 'Flat Prices in Vizag | 2 & 3 BHK Apartment Rates per Sq Ft',
    metaDesc: 'Compare flat prices per sq ft in Vizag. Explore 2 BHK & 3 BHK apartment rates in Madhurawada, Yendada, MVP Colony, Gajuwaka with budget filters.',
    keywords: 'flat prices in vizag, apartment rates per sq ft vizag, 2 bhk flat price vizag, 3 bhk flat price visakhapatnam',
    heading: 'Vizag Apartment & Flat Rates per Sq. Ft.',
    subheading: 'Price trends, builder rate comparisons, and affordability index for 2 & 3 BHK apartments in Vizag.',
    priceData: [
      { locality: 'Madhurawada', flatRate: '₹4,500 - ₹6,500/sq.ft', plotRate: 'N/A', rentalYield: '4.8%', trend: '+15.4%' },
      { locality: 'Yendada', flatRate: '₹5,800 - ₹8,200/sq.ft', plotRate: 'N/A', rentalYield: '4.2%', trend: '+18.2%' },
      { locality: 'MVP Colony', flatRate: '₹7,000 - ₹10,500/sq.ft', plotRate: 'N/A', rentalYield: '3.9%', trend: '+12.5%' },
      { locality: 'PM Palem', flatRate: '₹4,000 - ₹5,800/sq.ft', plotRate: 'N/A', rentalYield: '4.5%', trend: '+14.1%' },
      { locality: 'Gajuwaka', flatRate: '₹3,800 - ₹5,500/sq.ft', plotRate: 'N/A', rentalYield: '5.5%', trend: '+11.8%' }
    ]
  },
  'vizag-real-estate-market': {
    slug: 'vizag-real-estate-market',
    metaTitle: 'Vizag Real Estate Market Report 2026 | Growth & Price Analysis',
    metaDesc: 'Read the official Vizag real estate market report. Capital appreciation, infrastructure impact of Bhogapuram airport, metro rail & IT expansion.',
    keywords: 'vizag real estate market, visakhapatnam property market report, real estate growth vizag',
    heading: 'Vizag Real Estate Market & Growth Report',
    subheading: 'In-depth analysis of coastal infrastructure, commercial expansion, and investment trends in Visakhapatnam.',
    priceData: [
      { locality: 'IT Corridor (Madhurawada/Rushikonda)', flatRate: '₹5,500/sq.ft', plotRate: '₹50,000/sq.yd', rentalYield: '5.0%', trend: '+18.5%' },
      { locality: 'Airport Corridor (Bhogapuram)', flatRate: '₹3,800/sq.ft', plotRate: '₹22,000/sq.yd', rentalYield: '3.5%', trend: '+24.6%' },
      { locality: 'Industrial Corridor (Gajuwaka/Duvvada)', flatRate: '₹4,200/sq.ft', plotRate: '₹32,000/sq.yd', rentalYield: '5.5%', trend: '+11.8%' }
    ]
  },
  'property-investment-vizag': {
    slug: 'property-investment-vizag',
    title: 'Property Investment Vizag',
    metaTitle: 'Property Investment in Vizag | NRI & Investor Real Estate Guide',
    metaDesc: 'Comprehensive guide to property investment in Vizag. High ROI open plots, sea view apartments, NRI property services & capital growth areas.',
    keywords: 'property investment vizag, real estate investment visakhapatnam, nri property investment vizag',
    heading: 'Property Investment in Vizag',
    subheading: 'Maximize capital returns with high-growth land plots and rental properties in Andhra Pradesh’s top coastal city.',
    priceData: [
      { locality: 'Bhogapuram Airport Belt', flatRate: '₹3,500/sq.ft', plotRate: '₹20,000/sq.yd', rentalYield: '3.5%', trend: '+24.6%' },
      { locality: 'Madhurawada IT Hub', flatRate: '₹5,200/sq.ft', plotRate: '₹48,000/sq.yd', rentalYield: '4.8%', trend: '+15.4%' },
      { locality: 'Rushikonda Beach Road', flatRate: '₹8,000/sq.ft', plotRate: '₹85,000/sq.yd', rentalYield: '5.2%', trend: '+20.1%' }
    ]
  }
};

export function PropertyPricesPage() {
  const { pathSlug } = useParams<{ pathSlug?: string }>();
  const slug = pathSlug ? pathSlug.replace(/^\//, '') : 'property-prices-vizag';
  const config = MARKET_CONFIGS[slug] || MARKET_CONFIGS['property-prices-vizag'];
  const canonicalUrl = `https://vizagproperty.co.in/${config.slug}`;

  return (
    <div className="min-h-screen bg-gray-50 pb-16">
      <SEOHead
        title={config.metaTitle}
        description={config.metaDesc}
        canonicalUrl={canonicalUrl}
        url={canonicalUrl}
        keywords={config.keywords}
      />

      {/* Hero Header */}
      <section className="bg-gradient-to-r from-emerald-950 via-teal-900 to-slate-900 text-white py-14 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center gap-2 text-emerald-400 text-xs md:text-sm font-bold uppercase tracking-wider mb-2">
            <TrendingUp className="w-4 h-4" /> Market Intelligence & Pricing
          </div>
          <h1 className="text-3xl md:text-5xl font-extrabold tracking-tight mb-3">
            {config.heading}
          </h1>
          <p className="text-base md:text-lg text-gray-200 max-w-3xl leading-relaxed">
            {config.subheading}
          </p>

          <div className="mt-6 flex gap-3">
            <button
              onClick={() => openWhatsApp(`Hi Vizag Property Experts, I want a detailed market price report for ${config.heading}`)}
              className="inline-flex items-center gap-2 bg-emerald-600 hover:bg-emerald-700 text-white font-bold px-5 py-2.5 rounded-xl text-sm shadow-md transition-all"
            >
              Get Free Price Report on WhatsApp
            </button>
          </div>
        </div>
      </section>

      {/* Price Table Section */}
      <main className="max-w-7xl mx-auto px-4 py-10">
        <div className="bg-white p-6 md:p-10 rounded-3xl border border-gray-200 shadow-sm mb-10">
          <h2 className="text-2xl font-extrabold text-gray-900 mb-6">
            Locality Price Index Comparison
          </h2>
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse">
              <thead>
                <tr className="bg-gray-50 border-b border-gray-200 text-xs uppercase font-extrabold text-gray-600 tracking-wider">
                  <th className="py-4 px-4">Locality / Corridor</th>
                  <th className="py-4 px-4">Flat Rate (/sq.ft)</th>
                  <th className="py-4 px-4">Plot Rate (/sq.yd)</th>
                  <th className="py-4 px-4">Rental Yield</th>
                  <th className="py-4 px-4">3-Yr Growth</th>
                  <th className="py-4 px-4">Action</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100 text-sm font-medium text-gray-800">
                {config.priceData.map((row, idx) => (
                  <tr key={idx} className="hover:bg-gray-50/80 transition-colors">
                    <td className="py-4 px-4 font-bold text-gray-900">{row.locality}</td>
                    <td className="py-4 px-4">{row.flatRate}</td>
                    <td className="py-4 px-4 text-emerald-700 font-bold">{row.plotRate}</td>
                    <td className="py-4 px-4">{row.rentalYield}</td>
                    <td className="py-4 px-4 text-emerald-600 font-extrabold">{row.trend}</td>
                    <td className="py-4 px-4">
                      <Link
                        to="/properties"
                        className="text-xs font-bold text-primary-600 hover:text-primary-800 underline inline-flex items-center gap-1"
                      >
                        View Properties <ArrowRight className="w-3 h-3" />
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        {/* Investment Advice Banner */}
        <div className="bg-gradient-to-r from-primary-900 to-indigo-900 text-white p-8 rounded-3xl flex flex-col md:flex-row items-center justify-between gap-6 mb-10">
          <div>
            <h3 className="text-xl font-bold mb-2">Need Expert Investment Guidance in Vizag?</h3>
            <p className="text-sm text-gray-200 max-w-xl">
              Connect with our senior Visakhapatnam real estate advisors for customized plot evaluation, builder background checks, and high-yield portfolio guidance.
            </p>
          </div>
          <button
            onClick={() => openWhatsApp('Hi Vizag Property Experts, I am looking for property investment advice in Vizag')}
            className="bg-accent-500 hover:bg-accent-600 text-slate-900 font-extrabold px-6 py-3 rounded-xl text-sm shadow-md transition-all whitespace-nowrap"
          >
            Speak to Advisor
          </button>
        </div>

        {/* Tier 1 Money Pages Linking Silo Bar */}
        <div className="bg-white p-6 md:p-8 rounded-3xl border border-gray-200 shadow-sm">
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
                className="bg-emerald-50/60 hover:bg-emerald-100 border border-emerald-200 p-2.5 rounded-xl text-center text-xs font-extrabold text-emerald-900 transition-all"
              >
                {tier.name}
              </Link>
            ))}
          </div>
        </div>
      </main>
    </div>
  );
}
