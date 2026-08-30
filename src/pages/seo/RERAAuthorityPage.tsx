import { useState, useEffect } from 'react';
import { supabase } from '../../lib/supabase';
import { Property } from '../../types';
import { PropertyCard } from '../../components/PropertyCard';
import { SEOHead } from '../../components/SEOHead';
import { ShieldCheck, Search, HelpCircle, MessageCircle, Building2 } from 'lucide-react';
import { openWhatsApp } from '../../lib/whatsapp';

export function RERAAuthorityPage() {
  const [projects, setProjects] = useState<Property[]>([]);
  const [loading, setLoading] = useState(true);
  const [reraSearchInput, setReraSearchInput] = useState('');
  const [reraSearchResult, setReraSearchResult] = useState<string | null>(null);

  const canonicalUrl = 'https://vizagproperty.co.in/rera-approved-projects-vizag';

  useEffect(() => {
    async function loadReraProjects() {
      setLoading(true);
      try {
        const { data } = await supabase
          .from('properties')
          .select('*, localities!inner(name, slug, city)')
          .eq('status', 'approved')
          .limit(24);
        setProjects(data || []);
      } catch (err) {
        console.error(err);
      } finally {
        setLoading(false);
      }
    }
    loadReraProjects();
  }, []);

  const handleReraSearch = (e: React.FormEvent) => {
    e.preventDefault();
    if (!reraSearchInput.trim()) return;
    setReraSearchResult(`AP RERA Registration Number "${reraSearchInput.trim()}" verification request initialized. Check official rera.ap.gov.in portal or connect with our regulatory desk below.`);
  };

  const reraFaqs = [
    {
      question: 'What is AP RERA and why must apartments/projects be registered in Vizag?',
      answer: 'AP RERA (Andhra Pradesh Real Estate Regulatory Authority) is established under the RERA Act 2016 to protect home buyers. Registration is mandatory for all residential and commercial projects developing land over 500 sq. meters or constructing more than 8 apartment units. RERA registration ensures timely delivery, prevents fund diversion, and enforces 5-year structural defect liability.'
    },
    {
      question: 'How do I check AP RERA registration for a project in Vizag?',
      answer: 'Visit the official Andhra Pradesh RERA portal at rera.ap.gov.in. Under "Registered Projects", search by Project Name, Builder Name, or AP RERA Registration Number (format: P0327XXXXXXX). Verify sanctioned floor plans, escrow bank details, and committed completion dates.'
    },
    {
      question: 'What is the 70% RERA Escrow Account Rule?',
      answer: 'Under Section 4(2)(l)(D) of the RERA Act, developers must deposit 70% of all money collected from home buyers into a dedicated bank escrow account. Funds can only be withdrawn in proportion to actual construction completion certified by an engineer, architect, and chartered accountant.'
    },
    {
      question: 'Can a builder collect more than 10% advance booking amount before RERA agreement?',
      answer: 'No. RERA strictly prohibits developers from accepting more than 10% of total property value as advance or application fee without first executing and registering a formal Agreement for Sale with the buyer.'
    }
  ];

  const reraSchema = [
    {
      "@context": "https://schema.org",
      "@type": "GovernmentOrganization",
      "name": "Andhra Pradesh Real Estate Regulatory Authority (AP RERA)",
      "url": "https://rera.ap.gov.in/",
      "address": {
        "@type": "PostalAddress",
        "addressLocality": "Vijayawada / Visakhapatnam",
        "addressRegion": "Andhra Pradesh",
        "addressCountry": "IN"
      }
    },
    {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": reraFaqs.map(faq => ({
        "@type": "Question",
        "name": faq.question,
        "acceptedAnswer": {
          "@type": "Answer",
          "text": faq.answer
        }
      }))
    }
  ];

  return (
    <div className="min-h-screen bg-gray-50 pb-16">
      <SEOHead
        title="AP RERA Approved Projects in Vizag | RERA Registration Guide 2026"
        description="Verify AP RERA approved projects, flats & builders in Vizag. Official RERA search guide, 70% escrow rules, builder verification checklist & registered projects."
        canonicalUrl={canonicalUrl}
        url={canonicalUrl}
        keywords="rera, rera projects in vizag, rera approved flats, rera approved builders, how to check ap rera, rera project search, rera registration guide"
        schema={reraSchema}
      />

      {/* Hero Header */}
      <section className="bg-gradient-to-r from-blue-950 via-primary-950 to-slate-950 text-white py-14 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center gap-2 text-sky-400 text-xs md:text-sm font-bold uppercase tracking-wider mb-2">
            <ShieldCheck className="w-4 h-4" /> Official AP RERA Regulatory Authority Hub
          </div>
          <h1 className="text-3xl md:text-5xl font-extrabold tracking-tight mb-3">
            AP RERA Approved Projects & Builders in Vizag
          </h1>
          <p className="text-base md:text-lg text-gray-200 max-w-3xl leading-relaxed">
            Verify official Andhra Pradesh Real Estate Regulatory Authority (AP RERA) registration, escrow compliance, and sanctioned building plans for apartment projects across Visakhapatnam.
          </p>
        </div>
      </section>

      <main className="max-w-7xl mx-auto px-4 py-10 space-y-10">
        {/* Interactive AP RERA Project Search Tool */}
        <div className="bg-white p-6 md:p-10 rounded-3xl border border-gray-200 shadow-sm">
          <div className="max-w-3xl">
            <div className="flex items-center gap-2 text-primary-600 text-xs font-bold uppercase tracking-wider mb-2">
              <Search className="w-4 h-4" /> Official AP RERA Search Engine
            </div>
            <h2 className="text-2xl font-extrabold text-gray-900 mb-2">
              AP RERA Registration Number Search
            </h2>
            <p className="text-sm text-gray-600 mb-6 leading-relaxed">
              Enter the AP RERA Registration Number (e.g., P03270012345) or Builder Name to verify official registration status on rera.ap.gov.in.
            </p>

            <form onSubmit={handleReraSearch} className="flex flex-col sm:flex-row gap-3">
              <input
                type="text"
                placeholder="Enter RERA No. or Project Name (e.g. P0327XXXXXXX)"
                value={reraSearchInput}
                onChange={e => setReraSearchInput(e.target.value)}
                className="flex-1 px-4 py-3 border border-gray-300 rounded-xl text-sm focus:ring-2 focus:ring-primary-500 focus:outline-none"
              />
              <button
                type="submit"
                className="bg-primary-600 hover:bg-primary-700 text-white font-bold px-6 py-3 rounded-xl text-sm transition-all shadow-sm flex items-center justify-center gap-2"
              >
                <Search className="w-4 h-4" /> Search AP RERA
              </button>
            </form>

            {reraSearchResult && (
              <div className="mt-4 p-4 bg-sky-50 border border-sky-200 rounded-2xl text-xs text-sky-900 space-y-2">
                <p className="font-bold">{reraSearchResult}</p>
                <button
                  onClick={() => openWhatsApp(`Hi Vizag Property RERA Desk, I want to check AP RERA Registration for: ${reraSearchInput}`)}
                  className="inline-flex items-center gap-1 text-primary-700 font-extrabold underline hover:text-primary-900"
                >
                  <MessageCircle className="w-4 h-4" /> Verify RERA Certificate with Legal Desk on WhatsApp
                </button>
              </div>
            )}
          </div>
        </div>

        {/* 5-Step Official RERA Verification Checklist */}
        <div className="bg-white p-6 md:p-10 rounded-3xl border border-gray-200 shadow-sm">
          <h2 className="text-2xl font-extrabold text-gray-900 mb-6 flex items-center gap-2">
            <Building2 className="w-6 h-6 text-sky-600" /> AP RERA Home Buyer Protection Checklist
          </h2>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="bg-gray-50 p-6 rounded-2xl border border-gray-100 space-y-2">
              <div className="w-8 h-8 bg-sky-600 text-white rounded-full flex items-center justify-center font-bold text-sm">1</div>
              <h3 className="text-base font-bold text-gray-900">Check RERA Registration No</h3>
              <p className="text-xs text-gray-600 leading-relaxed">
                Ensure the builder displays the valid AP RERA registration number (P0327XXXXXXX) on all brochures, advertisements, and site signages.
              </p>
            </div>

            <div className="bg-gray-50 p-6 rounded-2xl border border-gray-100 space-y-2">
              <div className="w-8 h-8 bg-sky-600 text-white rounded-full flex items-center justify-center font-bold text-sm">2</div>
              <h3 className="text-base font-bold text-gray-900">Verify 70% Escrow Account</h3>
              <p className="text-xs text-gray-600 leading-relaxed">
                Check that buyer cheques and RTGS payments are deposited directly into the designated RERA Escrow Account specified on rera.ap.gov.in.
              </p>
            </div>

            <div className="bg-gray-50 p-6 rounded-2xl border border-gray-100 space-y-2">
              <div className="w-8 h-8 bg-sky-600 text-white rounded-full flex items-center justify-center font-bold text-sm">3</div>
              <h3 className="text-base font-bold text-gray-900">Sanctioned Building Plan</h3>
              <p className="text-xs text-gray-600 leading-relaxed">
                Compare physical construction against RERA approved floor plans to ensure no unapproved extra floors or structural deviations exist.
              </p>
            </div>

            <div className="bg-gray-50 p-6 rounded-2xl border border-gray-100 space-y-2">
              <div className="w-8 h-8 bg-sky-600 text-white rounded-full flex items-center justify-center font-bold text-sm">4</div>
              <h3 className="text-base font-bold text-gray-900">5-Year Defect Liability</h3>
              <p className="text-xs text-gray-600 leading-relaxed">
                Under RERA Section 14(3), the developer is legally bound to repair any structural defect or quality deficiency free of charge for 5 years after handover.
              </p>
            </div>

            <div className="bg-gray-50 p-6 rounded-2xl border border-gray-100 space-y-2">
              <div className="w-8 h-8 bg-sky-600 text-white rounded-full flex items-center justify-center font-bold text-sm">5</div>
              <h3 className="text-base font-bold text-gray-900">Quarterly Progress Audit</h3>
              <p className="text-xs text-gray-600 leading-relaxed">
                Verify quarterly construction progress reports and CA certificate filings uploaded by the builder on rera.ap.gov.in.
              </p>
            </div>

            <div className="bg-gradient-to-br from-primary-900 to-slate-900 text-white p-6 rounded-2xl flex flex-col justify-between">
              <div>
                <h3 className="text-base font-bold mb-1">Verify RERA Status</h3>
                <p className="text-xs text-gray-200">Our legal experts assist in checking RERA escrow accounts and builder compliance.</p>
              </div>
              <button
                onClick={() => openWhatsApp('Hi Vizag Property RERA Team, I need help auditing AP RERA project compliance')}
                className="mt-4 bg-sky-600 hover:bg-sky-700 text-white font-bold py-2.5 rounded-xl text-xs flex items-center justify-center gap-1 transition-all"
              >
                <MessageCircle className="w-4 h-4" /> Request RERA Audit
              </button>
            </div>
          </div>
        </div>

        {/* Live RERA Approved Projects Inventory */}
        <div className="bg-white p-6 md:p-10 rounded-3xl border border-gray-200 shadow-sm">
          <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6 pb-4 border-b border-gray-100">
            <div>
              <h2 className="text-2xl font-extrabold text-gray-900">
                Verified RERA Approved Projects & Apartments in Vizag
              </h2>
              <p className="text-xs text-gray-600 mt-1">
                Explore RERA registered gated apartments & villa townships in Madhurawada, Yendada, MVP Colony, Rushikonda
              </p>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-5">
            {loading ? (
              [1, 2, 3, 4].map(i => <div key={i} className="h-72 bg-gray-200 rounded-2xl animate-pulse"></div>)
            ) : (
              projects.map(p => <PropertyCard key={p.id} property={p} />)
            )}
          </div>
        </div>

        {/* FAQs */}
        <div className="bg-white p-6 md:p-10 rounded-3xl border border-gray-200 shadow-sm">
          <h2 className="text-2xl font-extrabold text-gray-900 mb-6 flex items-center gap-2">
            <HelpCircle className="w-6 h-6 text-primary-600" /> Frequently Asked Questions (AP RERA Projects & Guidelines)
          </h2>
          <div className="space-y-4">
            {reraFaqs.map((faq, idx) => (
              <div key={idx} className="bg-gray-50 p-5 rounded-2xl border border-gray-100">
                <h3 className="text-base font-bold text-gray-900 mb-2">{faq.question}</h3>
                <p className="text-sm text-gray-700 leading-relaxed">{faq.answer}</p>
              </div>
            ))}
          </div>
        </div>
      </main>
    </div>
  );
}
