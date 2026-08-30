import { SEOHead } from '../../components/SEOHead';
import { BookOpen, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';

export function GuidesPage() {
  const canonicalUrl = 'https://vizagproperty.co.in/guides';

  const guides = [
    { title: 'VMRDA Approved Plot Buying Verification Guide', link: '/legal-verification', desc: 'How to verify L.P. Numbers, layout permissions, EC (Encumbrance Certificate), and master plan land use in Visakhapatnam.' },
    { title: 'Home Loan Eligibility & Document Checklist in Vizag', link: '/home-loans/guide', desc: 'Complete guide for salaried and self-employed buyers on obtaining home loans with lowest interest rates from SBI, HDFC & ICICI.' },
    { title: 'Bhogapuram International Airport Real Estate Impact', link: '/insights/bhogapuram-airport-impact', desc: 'Analytical report on property appreciation trends along the 6-lane beach highway and Bhogapuram airport corridor.' },
    { title: 'AP RERA Registration Verification Checklist', link: '/legal-verification', desc: 'Step-by-step instructions on verifying RERA registration details, builder escrow accounts, and completion timelines.' }
  ];

  return (
    <div className="min-h-screen bg-gray-50 pb-16">
      <SEOHead
        title="Vizag Real Estate Buyer Guides & Educational Resources"
        description="Comprehensive real estate buying guides for Vizag & Visakhapatnam. VMRDA plot verification, home loan guides, AP RERA checklists & market reports."
        canonicalUrl={canonicalUrl}
        url={canonicalUrl}
        keywords="vizag real estate guides, vmrda verification guide, buying property in vizag guide, real estate advice visakhapatnam"
      />

      <section className="bg-gradient-to-r from-slate-900 via-primary-950 to-indigo-900 text-white py-14 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center gap-2 text-accent-400 text-xs md:text-sm font-bold uppercase tracking-wider mb-2">
            <BookOpen className="w-4 h-4" /> Educational Knowledge Hub
          </div>
          <h1 className="text-3xl md:text-5xl font-extrabold tracking-tight mb-3">
            Vizag Real Estate Buyer Guides
          </h1>
          <p className="text-base md:text-lg text-gray-200 max-w-3xl leading-relaxed">
            Empower your property buying decision with legal, financial, and market intelligence guides.
          </p>
        </div>
      </section>

      <main className="max-w-7xl mx-auto px-4 py-10">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {guides.map((guide, idx) => (
            <div key={idx} className="bg-white p-8 rounded-3xl border border-gray-200 shadow-sm flex flex-col justify-between hover:shadow-md transition-all">
              <div>
                <h2 className="text-2xl font-extrabold text-gray-900 mb-3">{guide.title}</h2>
                <p className="text-sm text-gray-600 leading-relaxed mb-6">{guide.desc}</p>
              </div>
              <Link
                to={guide.link}
                className="inline-flex items-center justify-center gap-2 bg-primary-600 hover:bg-primary-700 text-white font-bold py-3 px-6 rounded-xl text-sm transition-all"
              >
                Read Guide <ArrowRight className="w-4 h-4" />
              </Link>
            </div>
          ))}
        </div>
      </main>
    </div>
  );
}
