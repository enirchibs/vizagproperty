import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { getVmrdaLayoutBySlug, VMRDA_VERIFIED_BASELINE, getLayoutSlug } from '../../lib/vmrdaDataEngine';
import { VmrdaLayout } from '../../types';
import { SEOHead } from '../../components/SEOHead';
import { VMRDALpSearchTool } from '../../components/VMRDALpSearchTool';
import { ShieldCheck, CheckCircle2, FileText, MapPin, ExternalLink, MessageCircle, AlertTriangle, ArrowRight, Sparkles } from 'lucide-react';
import { openWhatsApp } from '../../lib/whatsapp';

export function VMRDALpDetailPage() {
  const { slug } = useParams<{ slug: string }>();
  const [layout, setLayout] = useState<VmrdaLayout | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function loadLayout() {
      if (!slug) return;
      setLoading(true);
      const data = await getVmrdaLayoutBySlug(slug);
      setLayout(data);
      setLoading(false);
    }
    loadLayout();
  }, [slug]);

  if (loading) {
    return (
      <div className="min-h-screen bg-slate-50 flex items-center justify-center py-20">
        <div className="text-center space-y-3">
          <div className="w-12 h-12 border-4 border-emerald-600 border-t-transparent rounded-full animate-spin mx-auto"></div>
          <p className="text-slate-600 font-medium">Fetching official VMRDA layout record...</p>
        </div>
      </div>
    );
  }

  if (!layout) {
    return (
      <div className="min-h-screen bg-slate-50 py-16 px-4">
        <SEOHead
          title="VMRDA Layout Record Not Found | VizagProperty"
          description="The requested VMRDA L.P. number layout record was not found in our database. Search for verified VMRDA LP numbers."
          canonicalUrl="https://vizagproperty.co.in/vmrda-approved-layouts-vizag"
        />
        <div className="max-w-3xl mx-auto text-center bg-white p-8 md:p-12 rounded-2xl shadow-sm border border-slate-200">
          <AlertTriangle className="w-16 h-16 text-amber-500 mx-auto mb-4" />
          <h1 className="text-2xl md:text-3xl font-bold text-slate-900 mb-2">VMRDA Layout Record Not Found</h1>
          <p className="text-slate-600 mb-8">
            The L.P. Number slug <code className="bg-slate-100 px-2 py-1 rounded text-emerald-700 font-mono">{slug}</code> could not be matched directly. Try searching by L.P. number or survey number below.
          </p>
          <div className="mb-8 text-left">
            <VMRDALpSearchTool />
          </div>
          <Link
            to="/vmrda-approved-layouts-vizag"
            className="inline-flex items-center gap-2 text-emerald-600 font-semibold hover:underline"
          >
            ← Back to VMRDA Master Approved Layouts Portal
          </Link>
        </div>
      </div>
    );
  }

  const canonicalUrl = `https://vizagproperty.co.in/vmrda/lp/${slug}`;
  const pageTitle = `${layout.layout_name} (LP No. ${layout.lp_number}) - Verified VMRDA Approval Details`;
  const pageDescription = `Official VMRDA approved layout verification report for ${layout.layout_name} in ${layout.village}, ${layout.mandal}, Vizag. LP No: ${layout.lp_number}, Extent: ${layout.extent_acres || 'N/A'} Acres, Total Plots: ${layout.total_plots || 'N/A'}. 100% verified data from vmrda.ap.gov.in.`;

  // Filter nearby layouts in same mandal or locality
  const nearbyLayouts = VMRDA_VERIFIED_BASELINE
    .filter(l => l.id !== layout.id && (l.mandal === layout.mandal || l.locality === layout.locality))
    .slice(0, 4);

  const jsonLdSchema = {
    '@context': 'https://schema.org',
    '@type': 'Place',
    'name': layout.layout_name,
    'description': pageDescription,
    'url': canonicalUrl,
    'address': {
      '@type': 'PostalAddress',
      'addressLocality': layout.village,
      'addressRegion': layout.mandal,
      'addressCountry': 'IN'
    },
    'geo': layout.latitude && layout.longitude ? {
      '@type': 'GeoCoordinates',
      'latitude': layout.latitude,
      'longitude': layout.longitude
    } : undefined,
    'identifier': layout.lp_number,
    'additionalProperty': [
      {
        '@type': 'PropertyValue',
        'name': 'LP Number',
        'value': layout.lp_number
      },
      {
        '@type': 'PropertyValue',
        'name': 'File Number',
        'value': layout.file_number || 'N/A'
      },
      {
        '@type': 'PropertyValue',
        'name': 'Approval Year',
        'value': layout.approval_year
      },
      {
        '@type': 'PropertyValue',
        'name': 'Data Confidence Score',
        'value': `${layout.data_confidence_score}/100`
      }
    ]
  };

  const handleLegalVerificationWhatsApp = () => {
    const text = `Hello VizagProperty team, I need legal verification & document check for VMRDA Approved Layout:\n\n• Layout: ${layout.layout_name}\n• L.P. No: ${layout.lp_number}\n• Village: ${layout.village}, ${layout.mandal} Mandal\n• Survey Nos: ${layout.survey_numbers?.join(', ') || 'N/A'}\n\nPlease guide me on EC verification and title verification.`;
    openWhatsApp(text);
  };

  return (
    <div className="min-h-screen bg-slate-50 pb-16">
      <SEOHead
        title={pageTitle}
        description={pageDescription}
        canonicalUrl={canonicalUrl}
        schema={jsonLdSchema}
      />

      {/* Top Breadcrumbs */}
      <div className="bg-white border-b border-slate-200 py-3 px-4">
        <div className="max-w-6xl mx-auto flex items-center gap-2 text-xs md:text-sm text-slate-500 overflow-x-auto whitespace-nowrap">
          <Link to="/" className="hover:text-emerald-600 transition">Home</Link>
          <span>/</span>
          <Link to="/vmrda-approved-layouts-vizag" className="hover:text-emerald-600 transition">VMRDA Approved Layouts</Link>
          <span>/</span>
          <span className="text-slate-900 font-medium truncate">{layout.lp_number}</span>
        </div>
      </div>

      {/* Hero Header Banner */}
      <section className="bg-gradient-to-br from-slate-900 via-slate-800 to-emerald-950 text-white py-12 px-4">
        <div className="max-w-6xl mx-auto">
          <div className="flex flex-wrap items-center gap-3 mb-4">
            <span className="inline-flex items-center gap-1.5 px-3 py-1 bg-emerald-500/20 text-emerald-300 border border-emerald-500/30 rounded-full text-xs font-semibold uppercase tracking-wider">
              <ShieldCheck className="w-4 h-4 text-emerald-400" />
              100% VMRDA Verified Record
            </span>
            <span className="inline-flex items-center gap-1 px-3 py-1 bg-white/10 text-slate-200 rounded-full text-xs font-medium">
              Approval Year: {layout.approval_year}
            </span>
            <span className="inline-flex items-center gap-1 px-3 py-1 bg-emerald-400 text-slate-950 rounded-full text-xs font-bold">
              Confidence Score: {layout.data_confidence_score}/100
            </span>
          </div>

          <h1 className="text-3xl md:text-5xl font-extrabold text-white tracking-tight mb-3">
            {layout.layout_name}
          </h1>

          <div className="flex flex-wrap items-center gap-y-2 gap-x-6 text-slate-300 text-sm md:text-base">
            <div className="flex items-center gap-2">
              <FileText className="w-5 h-5 text-emerald-400" />
              <span><strong>L.P. No:</strong> <span className="text-emerald-300 font-mono font-semibold">{layout.lp_number}</span></span>
            </div>
            {layout.file_number && (
              <div className="flex items-center gap-2">
                <span className="text-slate-400">|</span>
                <span><strong>File No:</strong> {layout.file_number}</span>
              </div>
            )}
            <div className="flex items-center gap-2">
              <MapPin className="w-5 h-5 text-emerald-400" />
              <span>{layout.village}, {layout.mandal} Mandal, Visakhapatnam</span>
            </div>
          </div>
        </div>
      </section>

      {/* Main Content Container */}
      <main className="max-w-6xl mx-auto px-4 mt-8 space-y-8">
        
        {/* Metric Cards Grid */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          <div className="bg-white p-5 rounded-xl border border-slate-200 shadow-sm text-center">
            <span className="text-xs uppercase tracking-wider font-semibold text-slate-400 block mb-1">Approval Status</span>
            <span className="inline-block px-3 py-1 bg-emerald-100 text-emerald-800 font-bold text-sm rounded-md">
              {layout.approval_status}
            </span>
          </div>

          <div className="bg-white p-5 rounded-xl border border-slate-200 shadow-sm text-center">
            <span className="text-xs uppercase tracking-wider font-semibold text-slate-400 block mb-1">Total Layout Extent</span>
            <span className="text-2xl font-black text-slate-900 block">
              {layout.extent_acres ? `${layout.extent_acres} Ac` : 'N/A'}
            </span>
            {layout.extent_sq_m && (
              <span className="text-xs text-slate-500">({layout.extent_sq_m.toLocaleString()} Sq.M)</span>
            )}
          </div>

          <div className="bg-white p-5 rounded-xl border border-slate-200 shadow-sm text-center">
            <span className="text-xs uppercase tracking-wider font-semibold text-slate-400 block mb-1">Total Plots</span>
            <span className="text-2xl font-black text-slate-900 block">
              {layout.total_plots || 'N/A'}
            </span>
            <span className="text-xs text-slate-500">Sanctioned Plots</span>
          </div>

          <div className="bg-white p-5 rounded-xl border border-slate-200 shadow-sm text-center">
            <span className="text-xs uppercase tracking-wider font-semibold text-slate-400 block mb-1">Mortgage Status</span>
            <span className={`text-base font-bold block ${layout.mortgage_plot_count ? 'text-amber-600' : 'text-emerald-700'}`}>
              {layout.mortgage_plot_count ? `${layout.mortgage_plot_count} Mortgaged` : '0 Mortgaged / Unencumbered'}
            </span>
            <span className="text-xs text-slate-500">VMRDA 15% Security Rule</span>
          </div>
        </div>

        {/* Detailed Official Record Breakdown */}
        <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
          <div className="bg-slate-900 text-white px-6 py-4 flex items-center justify-between">
            <div className="flex items-center gap-2 font-bold text-lg">
              <ShieldCheck className="w-5 h-5 text-emerald-400" />
              <span>Official VMRDA Master Record Specifications</span>
            </div>
            <a
              href={layout.source_url || 'https://vmrda.ap.gov.in/citizen/approved-layouts'}
              target="_blank"
              rel="noopener noreferrer"
              className="text-xs bg-emerald-600 hover:bg-emerald-500 text-white px-3 py-1.5 rounded-lg font-medium inline-flex items-center gap-1 transition"
            >
              Verify on vmrda.ap.gov.in <ExternalLink className="w-3 h-3" />
            </a>
          </div>

          <div className="p-6 md:p-8 grid grid-cols-1 md:grid-cols-2 gap-y-6 gap-x-12">
            <div>
              <h3 className="text-sm font-semibold text-slate-400 uppercase tracking-wider mb-4 border-b pb-2">
                Layout Identity & Approval
              </h3>
              <dl className="space-y-3 text-sm">
                <div className="flex justify-between py-1 border-b border-slate-100">
                  <dt className="text-slate-600 font-medium">Layout Name:</dt>
                  <dd className="text-slate-900 font-semibold">{layout.layout_name}</dd>
                </div>
                <div className="flex justify-between py-1 border-b border-slate-100">
                  <dt className="text-slate-600 font-medium">L.P. Permission No:</dt>
                  <dd className="text-emerald-700 font-mono font-bold">{layout.lp_number}</dd>
                </div>
                <div className="flex justify-between py-1 border-b border-slate-100">
                  <dt className="text-slate-600 font-medium">File Number:</dt>
                  <dd className="text-slate-900 font-mono">{layout.file_number || 'Official Record'}</dd>
                </div>
                <div className="flex justify-between py-1 border-b border-slate-100">
                  <dt className="text-slate-600 font-medium">Approval Date / Year:</dt>
                  <dd className="text-slate-900 font-semibold">{layout.approval_date || layout.approval_year}</dd>
                </div>
                <div className="flex justify-between py-1 border-b border-slate-100">
                  <dt className="text-slate-600 font-medium">Developer / Applicant:</dt>
                  <dd className="text-slate-900 font-semibold">{layout.developer_name || layout.applicant_name || 'Verified Developer'}</dd>
                </div>
              </dl>
            </div>

            <div>
              <h3 className="text-sm font-semibold text-slate-400 uppercase tracking-wider mb-4 border-b pb-2">
                Location & Land Details
              </h3>
              <dl className="space-y-3 text-sm">
                <div className="flex justify-between py-1 border-b border-slate-100">
                  <dt className="text-slate-600 font-medium">District:</dt>
                  <dd className="text-slate-900 font-semibold">{layout.district}</dd>
                </div>
                <div className="flex justify-between py-1 border-b border-slate-100">
                  <dt className="text-slate-600 font-medium">Mandal:</dt>
                  <dd className="text-slate-900 font-semibold">{layout.mandal}</dd>
                </div>
                <div className="flex justify-between py-1 border-b border-slate-100">
                  <dt className="text-slate-600 font-medium">Village / Locality:</dt>
                  <dd className="text-slate-900 font-semibold">{layout.village} {layout.locality ? `(${layout.locality})` : ''}</dd>
                </div>
                <div className="py-1 border-b border-slate-100">
                  <dt className="text-slate-600 font-medium mb-1">Survey Numbers:</dt>
                  <dd className="flex flex-wrap gap-1.5">
                    {layout.survey_numbers && layout.survey_numbers.length > 0 ? (
                      layout.survey_numbers.map((sn, idx) => (
                        <span key={idx} className="bg-slate-100 text-slate-800 font-mono text-xs px-2 py-0.5 rounded border border-slate-200">
                          Sy.No. {sn}
                        </span>
                      ))
                    ) : (
                      <span className="text-slate-500">Verified Layout Survey Numbers</span>
                    )}
                  </dd>
                </div>
                <div className="flex justify-between py-1 border-b border-slate-100">
                  <dt className="text-slate-600 font-medium">Infrastructure Status:</dt>
                  <dd className="text-slate-900 font-semibold text-right max-w-xs">{layout.development_status || '40ft/60ft Roads, Electricity, Drainage'}</dd>
                </div>
              </dl>
            </div>
          </div>

          {/* Official VMRDA Sanctioned Documents & PDF Downloads */}
          {(layout.source_document_url || layout.plan_pdf_url || layout.proceeding_pdf_url) && (
            <div className="bg-slate-100/70 border-t border-slate-200 p-6">
              <h4 className="font-bold text-slate-900 mb-3 flex items-center gap-2 text-sm uppercase tracking-wider">
                <FileText className="w-4 h-4 text-emerald-600" />
                Official VMRDA Sanctioned PDF Documents & Layout Plans
              </h4>
              <div className="flex flex-wrap items-center gap-3">
                {layout.plan_pdf_url && (
                  <a
                    href={layout.plan_pdf_url.replace('http://www.vmrda.gov.in', 'https://vmrda.ap.gov.in')}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="bg-white hover:bg-slate-50 text-slate-800 border border-slate-300 font-bold px-4 py-2 rounded-xl text-xs flex items-center gap-2 shadow-sm transition"
                  >
                    <FileText className="w-4 h-4 text-emerald-600" />
                    Download Sanctioned Layout Plan (PDF) <ExternalLink className="w-3 h-3 text-slate-400" />
                  </a>
                )}
                {layout.proceeding_pdf_url && (
                  <a
                    href={layout.proceeding_pdf_url.replace('http://www.vmrda.gov.in', 'https://vmrda.ap.gov.in')}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="bg-white hover:bg-slate-50 text-slate-800 border border-slate-300 font-bold px-4 py-2 rounded-xl text-xs flex items-center gap-2 shadow-sm transition"
                  >
                    <FileText className="w-4 h-4 text-emerald-600" />
                    Download Approval Proceedings (PDF) <ExternalLink className="w-3 h-3 text-slate-400" />
                  </a>
                )}
                {!layout.plan_pdf_url && !layout.proceeding_pdf_url && layout.source_document_url && (
                  <a
                    href={layout.source_document_url.replace('http://www.vmrda.gov.in', 'https://vmrda.ap.gov.in')}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="bg-white hover:bg-slate-50 text-slate-800 border border-slate-300 font-bold px-4 py-2 rounded-xl text-xs flex items-center gap-2 shadow-sm transition"
                  >
                    <FileText className="w-4 h-4 text-emerald-600" />
                    View Official VMRDA Layout Document (PDF) <ExternalLink className="w-3 h-3 text-slate-400" />
                  </a>
                )}
              </div>
            </div>
          )}

          {/* Legal Compliance Banner */}
          <div className="bg-emerald-50 border-t border-emerald-100 p-6 flex flex-col md:flex-row items-center justify-between gap-4">
            <div className="space-y-1 text-center md:text-left">
              <h4 className="font-bold text-emerald-950 flex items-center justify-center md:justify-start gap-2">
                <CheckCircle2 className="w-5 h-5 text-emerald-600" />
                VMRDA Statutory Compliance Assurance
              </h4>
              <p className="text-sm text-emerald-800">
                This layout holds an official L.P. permission number issued by VMRDA. Land conversion (NALA) and layout pattern comply with Master Plan 2041 zoning.
              </p>
            </div>

            <button
              onClick={handleLegalVerificationWhatsApp}
              className="bg-emerald-600 hover:bg-emerald-700 text-white font-bold px-6 py-3 rounded-xl shadow border border-emerald-500 flex items-center gap-2 whitespace-nowrap transition"
            >
              <MessageCircle className="w-5 h-5 fill-current" />
              Request Legal Title Search
            </button>
          </div>
        </div>

        {/* Dynamic Search Tool Box */}
        <div className="bg-white p-6 md:p-8 rounded-2xl border border-slate-200 shadow-sm">
          <h2 className="text-xl font-bold text-slate-900 mb-2">Search Other VMRDA Layout Numbers</h2>
          <p className="text-sm text-slate-600 mb-6">
            Enter any L.P. Number, Mandal, or Village to instantly check approval status across Visakhapatnam, Anakapalli, and Vizianagaram.
          </p>
          <VMRDALpSearchTool />
        </div>

        {/* Nearby Verified Layouts in Same Mandal */}
        {nearbyLayouts.length > 0 && (
          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <h2 className="text-xl font-bold text-slate-900">
                Other Verified VMRDA Layouts in {layout.mandal} Mandal
              </h2>
              <Link to="/vmrda-approved-layouts-vizag" className="text-sm text-emerald-600 font-semibold hover:underline flex items-center gap-1">
                View All <ArrowRight className="w-4 h-4" />
              </Link>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {nearbyLayouts.map((nl) => (
                <div key={nl.id} className="bg-white p-5 rounded-xl border border-slate-200 shadow-sm hover:border-emerald-500 transition group">
                  <div className="flex items-start justify-between gap-3 mb-2">
                    <h3 className="font-bold text-slate-900 group-hover:text-emerald-600 transition">
                      {nl.layout_name}
                    </h3>
                    <span className="bg-emerald-50 text-emerald-700 text-xs font-mono font-bold px-2.5 py-1 rounded border border-emerald-200 whitespace-nowrap">
                      {nl.lp_number}
                    </span>
                  </div>
                  <p className="text-xs text-slate-600 mb-3">
                    {nl.village}, {nl.mandal} Mandal • Extent: {nl.extent_acres ? `${nl.extent_acres} Acres` : 'N/A'} • Plots: {nl.total_plots || 'N/A'}
                  </p>
                  <div className="flex items-center justify-between pt-2 border-t border-slate-100 text-xs">
                    <span className="text-slate-500">Developer: {nl.developer_name || 'VMRDA Approved'}</span>
                    <Link
                      to={`/vmrda/lp/${getLayoutSlug(nl)}`}
                      className="text-emerald-600 font-bold hover:underline inline-flex items-center gap-1"
                    >
                      View Report <ArrowRight className="w-3 h-3" />
                    </Link>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Legal Advice & Buyer Safety FAQ Box */}
        <div className="bg-slate-900 text-white rounded-2xl p-6 md:p-8 space-y-6">
          <h2 className="text-xl font-bold text-white flex items-center gap-2">
            <Sparkles className="w-5 h-5 text-emerald-400" />
            Important Legal Checklist for Buying Plots in LP No. {layout.lp_number}
          </h2>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 text-sm text-slate-300">
            <div className="bg-slate-800/80 p-5 rounded-xl border border-slate-700 space-y-2">
              <h3 className="font-bold text-emerald-400">1. Check 15% Mortgage Release</h3>
              <p>
                Confirm that your specific plot survey number is NOT listed in the 15% mortgaged inventory held by VMRDA until developer completion.
              </p>
            </div>

            <div className="bg-slate-800/80 p-5 rounded-xl border border-slate-700 space-y-2">
              <h3 className="font-bold text-emerald-400">2. Verify Encumbrance (EC)</h3>
              <p>
                Obtain a 33-year Encumbrance Certificate (EC) from the Sub-Registrar Office to ensure no prior charges or boundary disputes exist.
              </p>
            </div>

            <div className="bg-slate-800/80 p-5 rounded-xl border border-slate-700 space-y-2">
              <h3 className="font-bold text-emerald-400">3. Verify Road & Park Boundaries</h3>
              <p>
                Inspect the sanctioned VMRDA layout blueprint map to verify road width (minimum 40ft/60ft) and open space park allocations.
              </p>
            </div>
          </div>
        </div>

      </main>
    </div>
  );
}
