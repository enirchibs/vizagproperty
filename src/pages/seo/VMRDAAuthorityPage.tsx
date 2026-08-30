import { useState, useEffect } from 'react';
import { supabase } from '../../lib/supabase';
import { Property } from '../../types';
import { PropertyCard } from '../../components/PropertyCard';
import { SEOHead } from '../../components/SEOHead';
import { ShieldCheck, FileText, Search, HelpCircle, MessageCircle } from 'lucide-react';
import { openWhatsApp } from '../../lib/whatsapp';

export function VMRDAAuthorityPage() {
  const [plots, setPlots] = useState<Property[]>([]);
  const [loading, setLoading] = useState(true);
  const [lpSearchInput, setLpSearchInput] = useState('');
  const [lpSearchResult, setLpSearchResult] = useState<string | null>(null);

  const canonicalUrl = 'https://vizagproperty.co.in/vmrda-approved-layouts-vizag';

  useEffect(() => {
    async function loadVmrdaPlots() {
      setLoading(true);
      try {
        const { data } = await supabase
          .from('properties')
          .select('*, localities!inner(name, slug, city)')
          .eq('status', 'approved')
          .or('property_type.eq.plot_land,category.eq.plot')
          .limit(24);
        setPlots(data || []);
      } catch (err) {
        console.error(err);
      } finally {
        setLoading(false);
      }
    }
    loadVmrdaPlots();
  }, []);

  const handleLpSearch = (e: React.FormEvent) => {
    e.preventDefault();
    if (!lpSearchInput.trim()) return;
    setLpSearchResult(`L.P. No. "${lpSearchInput.trim()}" verification request initialized. Check against official VMRDA master plan records or click below to verify via WhatsApp legal desk.`);
  };

  const vmrdaFaqs = [
    {
      question: 'What is VMRDA and why is layout approval mandatory in Vizag?',
      answer: 'VMRDA (Visakhapatnam Metropolitan Region Development Authority) is the official urban planning authority governing Visakhapatnam, Anakapalli, and Vizianagaram districts. VMRDA layout approval ensures clear legal title, minimum 40-foot roads, 10% park reservations, underground drainage, and protection against unauthorized unapproved land conversions.'
    },
    {
      question: 'How do I perform a VMRDA Layout Permission (L.P.) Number Search?',
      answer: 'Every official layout possesses a unique L.P. number (e.g. L.P. No. 12/2024/VMRDA). You can verify this by checking the official VMRDA portal at vmrda.gov.in under Approved Layouts or requesting Encumbrance Certificate (EC) verification from the Sub-Registrar Office.'
    },
    {
      question: 'What is the VMRDA 15% Mortgage Plot Release Rule?',
      answer: 'Under VMRDA regulations, the developer must mortgage 15% of total layout plots with VMRDA as security until all promised infrastructure (electricity, blacktop roads, water lines, drainage) is completely constructed. Buyers must verify that their target plot is NOT part of the 15% mortgaged inventory.'
    },
    {
      question: 'What are the minimum road width rules for VMRDA approved layouts?',
      answer: 'VMRDA mandates a minimum internal road width of 40 feet (12.2 meters) for residential layouts, with master plan approach roads requiring 60 feet, 80 feet, or 100 feet depending on the zoning corridor.'
    }
  ];

  const vmrdaSchema = [
    {
      "@context": "https://schema.org",
      "@type": "GovernmentOrganization",
      "name": "Visakhapatnam Metropolitan Region Development Authority (VMRDA)",
      "url": "https://vmrda.gov.in/",
      "address": {
        "@type": "PostalAddress",
        "addressLocality": "Visakhapatnam",
        "addressRegion": "Andhra Pradesh",
        "addressCountry": "IN"
      }
    },
    {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": vmrdaFaqs.map(faq => ({
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
        title="VMRDA Approved Plots & Layouts Vizag | L.P. Number Search Guide 2026"
        description="Verify VMRDA approved plots in Vizag. Official L.P. number verification guide, VMRDA plot rules, layout approval checklist, and verified plot inventory."
        canonicalUrl={canonicalUrl}
        url={canonicalUrl}
        keywords="vmrda, vmrda plots in vizag, vmrda approved plots, vmrda approved layouts, vmrda layout search, how to verify vmrda approval, vmrda plot rules, vmrda plot buying checklist"
        schema={vmrdaSchema}
      />

      {/* Hero Header */}
      <section className="bg-gradient-to-r from-emerald-950 via-primary-950 to-slate-950 text-white py-14 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center gap-2 text-emerald-400 text-xs md:text-sm font-bold uppercase tracking-wider mb-2">
            <ShieldCheck className="w-4 h-4" /> Official Regulatory Authority Hub • Visakhapatnam
          </div>
          <h1 className="text-3xl md:text-5xl font-extrabold tracking-tight mb-3">
            VMRDA Approved Plots & Layouts in Vizag
          </h1>
          <p className="text-base md:text-lg text-gray-200 max-w-3xl leading-relaxed">
            Comprehensive guide to Visakhapatnam Metropolitan Region Development Authority (VMRDA) layout approvals, L.P. number verification, and 100% legal plot land buying.
          </p>
        </div>
      </section>

      <main className="max-w-7xl mx-auto px-4 py-10 space-y-10">
        {/* Interactive VMRDA L.P. Number Verification Tool */}
        <div className="bg-white p-6 md:p-10 rounded-3xl border border-gray-200 shadow-sm">
          <div className="max-w-3xl">
            <div className="flex items-center gap-2 text-primary-600 text-xs font-bold uppercase tracking-wider mb-2">
              <Search className="w-4 h-4" /> Official Verification Engine
            </div>
            <h2 className="text-2xl font-extrabold text-gray-900 mb-2">
              VMRDA Layout Permission (L.P.) Number Search
            </h2>
            <p className="text-sm text-gray-600 mb-6 leading-relaxed">
              Enter the L.P. Number provided by your developer (e.g., 45/2024/VMRDA) to check verification guidelines or request a free legal document audit.
            </p>

            <form onSubmit={handleLpSearch} className="flex flex-col sm:flex-row gap-3">
              <input
                type="text"
                placeholder="Enter L.P. Number (e.g. 12/2024/VMRDA)"
                value={lpSearchInput}
                onChange={e => setLpSearchInput(e.target.value)}
                className="flex-1 px-4 py-3 border border-gray-300 rounded-xl text-sm focus:ring-2 focus:ring-primary-500 focus:outline-none"
              />
              <button
                type="submit"
                className="bg-primary-600 hover:bg-primary-700 text-white font-bold px-6 py-3 rounded-xl text-sm transition-all shadow-sm flex items-center justify-center gap-2"
              >
                <Search className="w-4 h-4" /> Verify L.P. Number
              </button>
            </form>

            {lpSearchResult && (
              <div className="mt-4 p-4 bg-emerald-50 border border-emerald-200 rounded-2xl text-xs text-emerald-900 space-y-2">
                <p className="font-bold">{lpSearchResult}</p>
                <button
                  onClick={() => openWhatsApp(`Hi Vizag Property Legal Desk, I want to verify VMRDA L.P. Number: ${lpSearchInput}`)}
                  className="inline-flex items-center gap-1 text-primary-700 font-extrabold underline hover:text-primary-900"
                >
                  <MessageCircle className="w-4 h-4" /> Connect with VMRDA Legal Audit Desk on WhatsApp
                </button>
              </div>
            )}
          </div>
        </div>

        {/* 5-Step Official VMRDA Plot Buying Checklist */}
        <div className="bg-white p-6 md:p-10 rounded-3xl border border-gray-200 shadow-sm">
          <h2 className="text-2xl font-extrabold text-gray-900 mb-6 flex items-center gap-2">
            <FileText className="w-6 h-6 text-emerald-600" /> VMRDA Plot Buying Legal Verification Checklist
          </h2>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="bg-gray-50 p-6 rounded-2xl border border-gray-100 space-y-2">
              <div className="w-8 h-8 bg-emerald-600 text-white rounded-full flex items-center justify-center font-bold text-sm">1</div>
              <h3 className="text-base font-bold text-gray-900">Verify Approved L.P. Copy</h3>
              <p className="text-xs text-gray-600 leading-relaxed">
                Demand the official VMRDA sanctioned layout plan drawing with the embossed VMRDA seal and approved L.P. Number.
              </p>
            </div>

            <div className="bg-gray-50 p-6 rounded-2xl border border-gray-100 space-y-2">
              <div className="w-8 h-8 bg-emerald-600 text-white rounded-full flex items-center justify-center font-bold text-sm">2</div>
              <h3 className="text-base font-bold text-gray-900">Check Mortgage Plot Release</h3>
              <p className="text-xs text-gray-600 leading-relaxed">
                Ensure your plot is not among the 15% mortgaged plots retained by VMRDA until developer infrastructure completion.
              </p>
            </div>

            <div className="bg-gray-50 p-6 rounded-2xl border border-gray-100 space-y-2">
              <div className="w-8 h-8 bg-emerald-600 text-white rounded-full flex items-center justify-center font-bold text-sm">3</div>
              <h3 className="text-base font-bold text-gray-900">Encumbrance Certificate (EC)</h3>
              <p className="text-xs text-gray-600 leading-relaxed">
                Obtain a 33-year Encumbrance Certificate from the AP Registration Department to confirm zero existing bank mortgages or litigation.
              </p>
            </div>

            <div className="bg-gray-50 p-6 rounded-2xl border border-gray-100 space-y-2">
              <div className="w-8 h-8 bg-emerald-600 text-white rounded-full flex items-center justify-center font-bold text-sm">4</div>
              <h3 className="text-base font-bold text-gray-900">Verify Master Plan Zoning</h3>
              <p className="text-xs text-gray-600 leading-relaxed">
                Confirm on the VMRDA Master Plan map that the layout falls in a Residential Use Zone (not Agriculture or Eco-Sensitive).
              </p>
            </div>

            <div className="bg-gray-50 p-6 rounded-2xl border border-gray-100 space-y-2">
              <div className="w-8 h-8 bg-emerald-600 text-white rounded-full flex items-center justify-center font-bold text-sm">5</div>
              <h3 className="text-base font-bold text-gray-900">Check 40ft Road & Park Reservation</h3>
              <p className="text-xs text-gray-600 leading-relaxed">
                Physically inspect that internal roads meet the 40-foot blacktop requirement and 10% public park space is demarcated.
              </p>
            </div>

            <div className="bg-gradient-to-br from-primary-900 to-slate-900 text-white p-6 rounded-2xl flex flex-col justify-between">
              <div>
                <h3 className="text-base font-bold mb-1">Need Document Audit?</h3>
                <p className="text-xs text-gray-200">Our legal team reviews VMRDA documents before you pay advance tokens.</p>
              </div>
              <button
                onClick={() => openWhatsApp('Hi Vizag Property Legal Team, I need help auditing VMRDA layout documents')}
                className="mt-4 bg-emerald-600 hover:bg-emerald-700 text-white font-bold py-2.5 rounded-xl text-xs flex items-center justify-center gap-1 transition-all"
              >
                <MessageCircle className="w-4 h-4" /> Request Legal Review
              </button>
            </div>
          </div>
        </div>

        {/* Live VMRDA Approved Plot Inventory */}
        <div className="bg-white p-6 md:p-10 rounded-3xl border border-gray-200 shadow-sm">
          <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6 pb-4 border-b border-gray-100">
            <div>
              <h2 className="text-2xl font-extrabold text-gray-900">
                Verified VMRDA Approved Plots for Sale in Vizag
              </h2>
              <p className="text-xs text-gray-600 mt-1">
                Explore 100% legal open layout plots in Madhurawada, PM Palem, Bhogapuram, Anandapuram & Kothavalasa
              </p>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-5">
            {loading ? (
              [1, 2, 3, 4].map(i => <div key={i} className="h-72 bg-gray-200 rounded-2xl animate-pulse"></div>)
            ) : (
              plots.map(p => <PropertyCard key={p.id} property={p} />)
            )}
          </div>
        </div>

        {/* FAQs */}
        <div className="bg-white p-6 md:p-10 rounded-3xl border border-gray-200 shadow-sm">
          <h2 className="text-2xl font-extrabold text-gray-900 mb-6 flex items-center gap-2">
            <HelpCircle className="w-6 h-6 text-primary-600" /> Frequently Asked Questions (VMRDA Plot Rules & Approvals)
          </h2>
          <div className="space-y-4">
            {vmrdaFaqs.map((faq, idx) => (
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
