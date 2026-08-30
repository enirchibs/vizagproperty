import { SEOHead } from '../../components/SEOHead';
import { BookOpen, ArrowRight, Home, TrendingUp, Building2, Newspaper, MessageCircle } from 'lucide-react';
import { Link } from 'react-router-dom';
import { openWhatsApp } from '../../lib/whatsapp';

export function GuidesPage() {
  const canonicalUrl = 'https://vizagproperty.co.in/guides';

  const buyingGuides = [
    { title: 'How to Buy a Plot in Vizag', link: '/vmrda-approved-layouts-vizag', desc: 'Step-by-step guide to purchasing VMRDA approved plots, checking L.P. numbers, and verifying 15% mortgage release.' },
    { title: 'How to Buy a Flat in Vizag', link: '/rera-approved-projects-vizag', desc: 'Essential buyer checklist for 2 & 3 BHK apartments, AP RERA verification, 70% escrow accounts, and 5-year warranties.' },
    { title: 'Property Document Checklist', link: '/home-loans/document-checklist', desc: '33-year Encumbrance Certificate (EC), link deeds, approved building plans, and tax clearance documents.' },
    { title: 'Registration Charges & Stamp Duty', link: '/home-loans/stamp-duty-calculator', desc: 'Complete breakdown of 6% AP Stamp Duty, 1.5% Transfer Duty, and 0.5% Sub-Registrar registration fee.' },
    { title: 'Home Loans & EMI Calculator', link: '/home-loans/emi-calculator', desc: 'Compare home loan interest rates from SBI, HDFC, ICICI, and calculate monthly installments.' }
  ];

  const investmentGuides = [
    { title: 'Best Areas to Invest in Vizag 2026', link: '/property-investment-vizag', desc: 'High-ROI investment hubs including Madhurawada IT SEZ, Yendada, Rushikonda, and Bhogapuram highway.' },
    { title: 'Bhogapuram Airport Real Estate Impact', link: '/insights/bhogapuram-airport-impact', desc: 'Comprehensive appreciation report on land prices along the 6-lane beach highway and airport zone.' },
    { title: 'Vizag Locality Price Index 2026', link: '/property-prices-vizag', desc: 'Compare flat prices per sq.ft. and land rates per sq.yd. across P0 & P1 Visakhapatnam neighborhoods.' },
    { title: 'Rental Yield & ROI Analysis', link: '/vizag-real-estate-market', desc: 'Evaluate 4.8% to 5.5% rental returns for residential flats near IT hubs, universities, and hospitals.' }
  ];

  const projectGuides = [
    { title: 'New & Upcoming Projects in Vizag', link: '/projects', desc: 'Explore newly launched gated communities, luxury sea-facing apartments, and VMRDA plot townships.' },
    { title: 'RERA Approved Projects Directory', link: '/rera-approved-projects-vizag', desc: 'Search official AP RERA registered building projects with verified escrow bank accounts.' },
    { title: 'Top Builder Profiles & Reviews', link: '/top-builders-vizag', desc: 'Track records, construction quality standards, and delivered projects of leading Visakhapatnam developers.' }
  ];

  const newsGuides = [
    { title: 'Vizag Real Estate News & Market Reports', link: '/news', desc: 'Latest updates on property price movements, market trends, and commercial real estate announcements.' },
    { title: 'Metro Rail & Infrastructure Expansion', link: '/blog', desc: 'Government announcements regarding Vizag Metro Rail, 6-lane coastal highways, and IT SEZ corridors.' }
  ];

  const guidesSchema = [
    {
      "@context": "https://schema.org",
      "@type": "CollectionPage",
      "name": "Vizag Real Estate Topical Authority & Buyer Guides",
      "description": "Master educational knowledge hub for property buying, VMRDA plot rules, AP RERA verification, investment ROI, and news in Visakhapatnam.",
      "url": canonicalUrl
    }
  ];

  return (
    <div className="min-h-screen bg-gray-50 pb-16">
      <SEOHead
        title="Vizag Real Estate Topical Authority Hub | Buyer Guides, ROI & News"
        description="Master real estate knowledge hub for Vizag (Visakhapatnam). VMRDA plot buying guides, AP RERA verification, registration charges, home loan EMI calculators & investment ROI."
        canonicalUrl={canonicalUrl}
        url={canonicalUrl}
        keywords="how to buy a plot in vizag, how to buy a flat in vizag, property document checklist vizag, vizag registration charges, best areas to invest in vizag, vizag real estate news, rera projects vizag"
        schema={guidesSchema}
      />

      {/* Hero Header */}
      <section className="bg-gradient-to-r from-slate-900 via-primary-950 to-indigo-950 text-white py-14 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center gap-2 text-accent-400 text-xs md:text-sm font-bold uppercase tracking-wider mb-2">
            <BookOpen className="w-4 h-4" /> Master Knowledge Directory
          </div>
          <h1 className="text-3xl md:text-5xl font-extrabold tracking-tight mb-3">
            Vizag Real Estate Knowledge & Authority Hub
          </h1>
          <p className="text-base md:text-lg text-gray-200 max-w-3xl leading-relaxed">
            Empower your property investment decisions in Visakhapatnam with verified legal checklists, financial calculators, investment ROI analytics, and official market intelligence.
          </p>
        </div>
      </section>

      <main className="max-w-7xl mx-auto px-4 py-10 space-y-12">
        {/* Pillar 1: Buying Hub */}
        <div>
          <div className="flex items-center gap-2 text-emerald-600 font-extrabold text-xs uppercase tracking-wider mb-2">
            <Home className="w-4 h-4" /> Pillar 1
          </div>
          <h2 className="text-2xl font-extrabold text-gray-900 mb-6 pb-2 border-b border-gray-200">
            🏠 Buying & Property Legal Guide
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
            {buyingGuides.map((guide, idx) => (
              <div key={idx} className="bg-white p-6 rounded-3xl border border-gray-200 shadow-2xs hover:shadow-md transition-all flex flex-col justify-between">
                <div>
                  <h3 className="text-lg font-bold text-gray-900 mb-2">{guide.title}</h3>
                  <p className="text-xs text-gray-600 leading-relaxed mb-4">{guide.desc}</p>
                </div>
                <Link
                  to={guide.link}
                  className="inline-flex items-center gap-1 text-xs font-bold text-primary-600 hover:text-primary-800"
                >
                  Explore Guide <ArrowRight className="w-3.5 h-3.5" />
                </Link>
              </div>
            ))}
          </div>
        </div>

        {/* Pillar 2: Investment Hub */}
        <div>
          <div className="flex items-center gap-2 text-indigo-600 font-extrabold text-xs uppercase tracking-wider mb-2">
            <TrendingUp className="w-4 h-4" /> Pillar 2
          </div>
          <h2 className="text-2xl font-extrabold text-gray-900 mb-6 pb-2 border-b border-gray-200">
            📈 Investment & ROI Analytics
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-5">
            {investmentGuides.map((guide, idx) => (
              <div key={idx} className="bg-white p-6 rounded-3xl border border-gray-200 shadow-2xs hover:shadow-md transition-all flex flex-col justify-between">
                <div>
                  <h3 className="text-lg font-bold text-gray-900 mb-2">{guide.title}</h3>
                  <p className="text-xs text-gray-600 leading-relaxed mb-4">{guide.desc}</p>
                </div>
                <Link
                  to={guide.link}
                  className="inline-flex items-center gap-1 text-xs font-bold text-indigo-600 hover:text-indigo-800"
                >
                  Read Report <ArrowRight className="w-3.5 h-3.5" />
                </Link>
              </div>
            ))}
          </div>
        </div>

        {/* Pillar 3: Projects & Builders */}
        <div>
          <div className="flex items-center gap-2 text-sky-600 font-extrabold text-xs uppercase tracking-wider mb-2">
            <Building2 className="w-4 h-4" /> Pillar 3
          </div>
          <h2 className="text-2xl font-extrabold text-gray-900 mb-6 pb-2 border-b border-gray-200">
            🏗️ Projects & Builder Directory
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-5">
            {projectGuides.map((guide, idx) => (
              <div key={idx} className="bg-white p-6 rounded-3xl border border-gray-200 shadow-2xs hover:shadow-md transition-all flex flex-col justify-between">
                <div>
                  <h3 className="text-lg font-bold text-gray-900 mb-2">{guide.title}</h3>
                  <p className="text-xs text-gray-600 leading-relaxed mb-4">{guide.desc}</p>
                </div>
                <Link
                  to={guide.link}
                  className="inline-flex items-center gap-1 text-xs font-bold text-sky-600 hover:text-sky-800"
                >
                  View Directory <ArrowRight className="w-3.5 h-3.5" />
                </Link>
              </div>
            ))}
          </div>
        </div>

        {/* Pillar 4: News & Infrastructure */}
        <div>
          <div className="flex items-center gap-2 text-amber-600 font-extrabold text-xs uppercase tracking-wider mb-2">
            <Newspaper className="w-4 h-4" /> Pillar 4
          </div>
          <h2 className="text-2xl font-extrabold text-gray-900 mb-6 pb-2 border-b border-gray-200">
            📰 Market News & Infrastructure Updates
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
            {newsGuides.map((guide, idx) => (
              <div key={idx} className="bg-white p-6 rounded-3xl border border-gray-200 shadow-2xs hover:shadow-md transition-all flex flex-col justify-between">
                <div>
                  <h3 className="text-lg font-bold text-gray-900 mb-2">{guide.title}</h3>
                  <p className="text-xs text-gray-600 leading-relaxed mb-4">{guide.desc}</p>
                </div>
                <Link
                  to={guide.link}
                  className="inline-flex items-center gap-1 text-xs font-bold text-amber-600 hover:text-amber-800"
                >
                  Read News Updates <ArrowRight className="w-3.5 h-3.5" />
                </Link>
              </div>
            ))}
          </div>
        </div>

        {/* Advisory CTA Banner */}
        <div className="bg-gradient-to-r from-primary-900 via-slate-900 to-indigo-900 text-white p-8 md:p-10 rounded-3xl flex flex-col md:flex-row items-center justify-between gap-6 shadow-md">
          <div>
            <h3 className="text-2xl font-extrabold mb-2">Have Custom Legal or Property Questions?</h3>
            <p className="text-sm text-gray-200 max-w-xl leading-relaxed">
              Connect directly with our senior Visakhapatnam property advisors for personalized VMRDA layout checks, RERA registration reviews, and bank loan clearance.
            </p>
          </div>
          <button
            onClick={() => openWhatsApp('Hi Vizag Property Knowledge Team, I have a property query regarding buying in Vizag')}
            className="bg-emerald-600 hover:bg-emerald-700 text-white font-extrabold px-6 py-3.5 rounded-xl text-sm shadow-md transition-all whitespace-nowrap flex items-center gap-2"
          >
            <MessageCircle className="w-5 h-5" /> Speak to Legal Advisor
          </button>
        </div>
      </main>
    </div>
  );
}
