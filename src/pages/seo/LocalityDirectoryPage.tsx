import { Link } from 'react-router-dom';
import { SEOHead } from '../../components/SEOHead';
import { MapPin, ArrowRight } from 'lucide-react';

export function LocalityDirectoryPage() {
  const canonicalUrl = 'https://vizagproperty.co.in/localities';

  const localities = [
    { name: 'Madhurawada', slug: '/localities/madhurawada', type: 'IT & Residential Hub', price: '₹4,500 - ₹6,500/sq.ft', growth: '+15.4%' },
    { name: 'Yendada', slug: '/localities/yendada', type: 'Luxury Gated Communities', price: '₹5,800 - ₹8,200/sq.ft', growth: '+18.2%' },
    { name: 'Rushikonda', slug: '/localities/rushikonda', type: 'Sea View & IT SEZ', price: '₹6,500 - ₹9,500/sq.ft', growth: '+20.1%' },
    { name: 'PM Palem', slug: '/localities/pm-palem', type: 'Affordable Residential', price: '₹4,000 - ₹5,800/sq.ft', growth: '+14.1%' },
    { name: 'Gajuwaka', slug: '/localities/gajuwaka', type: 'Industrial & Commercial', price: '₹3,800 - ₹5,500/sq.ft', growth: '+11.8%' },
    { name: 'MVP Colony', slug: '/localities/mvp-colony', type: 'Prime Central Enclave', price: '₹7,000 - ₹10,500/sq.ft', growth: '+12.5%' },
    { name: 'Kommadi', slug: '/localities/kommadi', type: 'Affordable Layout Hub', price: '₹3,500 - ₹5,000/sq.ft', growth: '+16.7%' },
    { name: 'Bhogapuram', slug: '/plots/bhogapuram', type: 'Airport Growth Belt', price: '₹15,000 - ₹32,000/sq.yd', growth: '+24.6%' }
  ];

  return (
    <div className="min-h-screen bg-gray-50 pb-16">
      <SEOHead
        title="Vizag Localities Directory | Top Property Areas in Visakhapatnam"
        description="Explore top residential & commercial localities in Vizag. Compare property prices, infrastructure, and growth trends across Madhurawada, Yendada, MVP Colony, Gajuwaka."
        canonicalUrl={canonicalUrl}
        url={canonicalUrl}
        keywords="vizag localities, top areas in vizag, property in vizag localities, madhurawada, yendada, rushikonda"
      />

      <section className="bg-gradient-to-r from-slate-900 via-primary-900 to-indigo-950 text-white py-14 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center gap-2 text-accent-400 text-xs md:text-sm font-bold uppercase tracking-wider mb-2">
            <MapPin className="w-4 h-4" /> Locality Guide
          </div>
          <h1 className="text-3xl md:text-5xl font-extrabold tracking-tight mb-3">
            Visakhapatnam Localities Directory
          </h1>
          <p className="text-base md:text-lg text-gray-200 max-w-3xl leading-relaxed">
            Discover the best neighborhoods, IT corridors, coastal beach belts, and emerging growth areas in Visakhapatnam.
          </p>
        </div>
      </section>

      <main className="max-w-7xl mx-auto px-4 py-10">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {localities.map(loc => (
            <div key={loc.name} className="bg-white p-6 rounded-3xl border border-gray-200 shadow-sm hover:shadow-md transition-all flex flex-col justify-between">
              <div>
                <div className="flex items-center justify-between mb-3">
                  <span className="bg-primary-50 text-primary-700 text-xs font-extrabold px-3 py-1 rounded-full border border-primary-200">
                    {loc.type}
                  </span>
                  <span className="text-xs font-bold text-emerald-600 bg-emerald-50 px-2 py-0.5 rounded-md">
                    {loc.growth}
                  </span>
                </div>
                <h2 className="text-2xl font-extrabold text-gray-900 mb-2">{loc.name}</h2>
                <p className="text-xs text-gray-500 mb-4">
                  Avg Rate: <strong className="text-gray-900">{loc.price}</strong>
                </p>
              </div>

              <Link
                to={loc.slug}
                className="w-full mt-4 bg-gray-50 hover:bg-primary-600 hover:text-white text-gray-900 font-bold py-2.5 rounded-xl text-xs text-center border border-gray-200 transition-all flex items-center justify-center gap-1"
              >
                Explore {loc.name} <ArrowRight className="w-3.5 h-3.5" />
              </Link>
            </div>
          ))}
        </div>
      </main>
    </div>
  );
}
