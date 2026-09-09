import { SEOHead } from '../../components/SEOHead';
import { VMRDAMasterPlanExplorer } from '../../components/VMRDAMasterPlanExplorer';
import { VMRDA_MASTER_PLAN_DISCLAIMER } from '../../lib/vmrdaMasterPlanEngine';
import { ShieldCheck, Layers, ExternalLink, ArrowRight, Sparkles, Navigation } from 'lucide-react';
import { Link } from 'react-router-dom';

export function VMRDAMasterPlanPage() {
  const canonicalUrl = 'https://vizagproperty.co.in/vmrda/master-plan-2041';
  const pageTitle = 'VMRDA Master Plan 2041 Maps, Zoning & Land Use Search | VizagProperty';
  const pageDescription = 'Explore official Visakhapatnam VMRDA Master Plan 2041 maps, land-use zoning (R1, R2, Commercial, Industrial, Greenbelt), road proposals, and 936 cadastral village maps across Vizag, Anakapalli & Vizianagaram.';

  const jsonLdSchema = {
    '@context': 'https://schema.org',
    '@type': 'GovernmentService',
    'name': 'VMRDA Master Plan 2041 Spatial Data Portal',
    'provider': {
      '@type': 'GovernmentOrganization',
      'name': 'Visakhapatnam Metropolitan Region Development Authority (VMRDA)',
      'url': 'https://vmrda.ap.gov.in/master-plan'
    },
    'areaServed': {
      '@type': 'AdministrativeArea',
      'name': 'Visakhapatnam Metropolitan Region (VMRDA)'
    },
    'url': canonicalUrl,
    'description': pageDescription
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
          <Link to="/vmrda-approved-layouts-vizag" className="hover:text-emerald-600 transition">VMRDA Portal</Link>
          <span>/</span>
          <span className="text-slate-900 font-medium truncate">Master Plan 2041</span>
        </div>
      </div>

      {/* Hero Banner */}
      <section className="bg-gradient-to-br from-slate-950 via-slate-900 to-emerald-950 text-white py-14 px-4">
        <div className="max-w-6xl mx-auto space-y-4">
          <div className="flex flex-wrap items-center gap-3">
            <span className="inline-flex items-center gap-1.5 px-3 py-1 bg-emerald-500/20 text-emerald-300 border border-emerald-500/30 rounded-full text-xs font-semibold uppercase tracking-wider">
              <ShieldCheck className="w-4 h-4 text-emerald-400" /> Official VMRDA Master Plan 2041 Data
            </span>
            <span className="bg-white/10 text-slate-200 px-3 py-1 rounded-full text-xs font-medium">
              37 Mandals • 899 Cadastral Village Maps
            </span>
          </div>

          <h1 className="text-3xl md:text-5xl font-black text-white tracking-tight leading-tight">
            Visakhapatnam VMRDA Master Plan 2041
          </h1>
          <p className="text-slate-300 text-base md:text-lg max-w-3xl leading-relaxed">
            Verify official land-use zoning, statutory FAR rules, proposed 200ft/100ft arterial roads, and 936 high-resolution cadastral maps directly attributed to <code className="text-emerald-400 font-mono">vmrda.ap.gov.in</code>.
          </p>

          <div className="flex flex-wrap items-center gap-3 pt-2">
            <Link
              to="/vmrda/master-plan/land-use"
              className="bg-emerald-600 hover:bg-emerald-500 text-white font-bold px-5 py-2.5 rounded-xl text-xs flex items-center gap-2 shadow transition"
            >
              <Layers className="w-4 h-4" /> Explore Land-Use Zones
            </Link>
            <Link
              to="/vmrda/master-plan/roads"
              className="bg-slate-800 hover:bg-slate-700 text-white font-bold px-5 py-2.5 rounded-xl text-xs flex items-center gap-2 border border-slate-700 transition"
            >
              <Navigation className="w-4 h-4 text-emerald-400" /> Proposed Road Corridors
            </Link>
            <a
              href="https://vmrda.ap.gov.in/master-plan"
              target="_blank"
              rel="noopener noreferrer"
              className="text-xs text-slate-300 hover:text-white font-medium inline-flex items-center gap-1 ml-auto"
            >
              Official VMRDA Master Plan Portal <ExternalLink className="w-3.5 h-3.5" />
            </a>
          </div>
        </div>
      </section>

      {/* Main Content Container */}
      <main className="max-w-6xl mx-auto px-4 mt-8 space-y-12">

        {/* GIS Map Explorer Component */}
        <VMRDAMasterPlanExplorer />

        {/* Master Plan 2041 Growth Corridors */}
        <div className="space-y-6">
          <div className="flex items-center justify-between">
            <div>
              <h2 className="text-2xl font-bold text-slate-900">Key VMRDA 2041 High-Growth Corridors</h2>
              <p className="text-sm text-slate-600">Strategic development sectors defined in the VMRDA Master Plan 2041 roadmap.</p>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm space-y-3">
              <span className="text-xs font-bold uppercase tracking-wider text-emerald-700 bg-emerald-50 px-2.5 py-1 rounded border border-emerald-200">
                Sector A • Airport Corridor
              </span>
              <h3 className="font-bold text-slate-900 text-lg">Bhogapuram - Tagarapuvalasa Corridor</h3>
              <p className="text-xs text-slate-600 leading-relaxed">
                6-lane airport expressway, luxury gated communities, MIG Smart Townships, and international hospitality zoning.
              </p>
              <Link to="/vmrda/master-plan/bhogapuram" className="text-xs text-emerald-600 font-bold hover:underline inline-flex items-center gap-1">
                View Corridor Maps <ArrowRight className="w-3.5 h-3.5" />
              </Link>
            </div>

            <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm space-y-3">
              <span className="text-xs font-bold uppercase tracking-wider text-purple-700 bg-purple-50 px-2.5 py-1 rounded border border-purple-200">
                Sector B • IT & Tech Hill
              </span>
              <h3 className="font-bold text-slate-900 text-lg">Madhurawada - Rushikonda IT Zone</h3>
              <p className="text-xs text-slate-600 leading-relaxed">
                R2 High-density mixed residential, software technology parks, 100ft arterial roads, and premium sea-view towers.
              </p>
              <Link to="/vmrda/master-plan/madhurawada" className="text-xs text-emerald-600 font-bold hover:underline inline-flex items-center gap-1">
                View Corridor Maps <ArrowRight className="w-3.5 h-3.5" />
              </Link>
            </div>

            <div className="bg-white p-6 rounded-2xl border border-slate-200 shadow-sm space-y-3">
              <span className="text-xs font-bold uppercase tracking-wider text-amber-700 bg-amber-50 px-2.5 py-1 rounded border border-amber-200">
                Sector C • Industrial Spine
              </span>
              <h3 className="font-bold text-slate-900 text-lg">Gajuwaka - Atchutapuram Industrial Node</h3>
              <p className="text-xs text-slate-600 leading-relaxed">
                APSEZ logistics parks, port connectivity roads, industrial warehousing, and employee housing colonies.
              </p>
              <Link to="/vmrda/master-plan/gajuwaka" className="text-xs text-emerald-600 font-bold hover:underline inline-flex items-center gap-1">
                View Corridor Maps <ArrowRight className="w-3.5 h-3.5" />
              </Link>
            </div>
          </div>
        </div>

        {/* Statutory Compliance Footer Disclaimer */}
        <div className="bg-slate-900 text-white rounded-2xl p-6 md:p-8 space-y-3">
          <h3 className="text-lg font-bold text-white flex items-center gap-2">
            <Sparkles className="w-5 h-5 text-emerald-400" />
            VMRDA Statutory Spatial Data Disclaimer
          </h3>
          <p className="text-xs text-slate-300 leading-relaxed">
            {VMRDA_MASTER_PLAN_DISCLAIMER}
          </p>
        </div>

      </main>
    </div>
  );
}
