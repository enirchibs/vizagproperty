import { SEOHead } from '../../components/SEOHead';
import { VMRDA_MASTER_PLAN_ZONES, VMRDA_MASTER_PLAN_DISCLAIMER } from '../../lib/vmrdaMasterPlanEngine';
import { Layers, CheckCircle2, AlertTriangle, Sparkles } from 'lucide-react';
import { Link } from 'react-router-dom';

export function VMRDAMasterPlanLandUsePage() {
  const canonicalUrl = 'https://vizagproperty.co.in/vmrda/master-plan/land-use';
  const pageTitle = 'VMRDA Master Plan 2041 Land Use Zoning Categories & Rules | VizagProperty';
  const pageDescription = 'Complete statutory breakdown of VMRDA Master Plan 2041 land-use zoning categories: R1 Primary Residential, R2 High Density, C1 Commercial, I1 Industrial, Greenbelt, and Coastal CRZ rules.';

  return (
    <div className="min-h-screen bg-slate-50 pb-16">
      <SEOHead
        title={pageTitle}
        description={pageDescription}
        canonicalUrl={canonicalUrl}
      />

      {/* Top Breadcrumbs */}
      <div className="bg-white border-b border-slate-200 py-3 px-4">
        <div className="max-w-6xl mx-auto flex items-center gap-2 text-xs md:text-sm text-slate-500 overflow-x-auto whitespace-nowrap">
          <Link to="/" className="hover:text-emerald-600 transition">Home</Link>
          <span>/</span>
          <Link to="/vmrda/master-plan-2041" className="hover:text-emerald-600 transition">Master Plan 2041</Link>
          <span>/</span>
          <span className="text-slate-900 font-medium truncate">Land Use Zoning</span>
        </div>
      </div>

      {/* Hero Header */}
      <section className="bg-gradient-to-br from-slate-900 via-slate-800 to-emerald-950 text-white py-12 px-4">
        <div className="max-w-6xl mx-auto space-y-3">
          <span className="inline-flex items-center gap-1.5 px-3 py-1 bg-emerald-500/20 text-emerald-300 border border-emerald-500/30 rounded-full text-xs font-semibold uppercase tracking-wider">
            <Layers className="w-4 h-4 text-emerald-400" /> Statutory Zoning Regulations
          </span>
          <h1 className="text-3xl md:text-5xl font-black text-white">
            VMRDA Master Plan 2041 Land-Use Classifications
          </h1>
          <p className="text-slate-300 text-sm md:text-base max-w-3xl leading-relaxed">
            Understand permitted land uses, building height limits, FAR ratios, and restricted activities across all official VMRDA zoning designations in Visakhapatnam.
          </p>
        </div>
      </section>

      {/* Main Grid */}
      <main className="max-w-6xl mx-auto px-4 mt-8 space-y-8">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {VMRDA_MASTER_PLAN_ZONES.map((zone) => (
            <div key={zone.code} className="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 space-y-4">
              <div className="flex items-center justify-between border-b pb-3">
                <span className={`px-3 py-1 rounded-full text-xs font-bold ${zone.bg_color}`}>
                  {zone.code}
                </span>
                <span className="text-xs font-mono font-semibold text-slate-500">
                  FAR: {zone.fd_ratio}
                </span>
              </div>

              <h2 className="text-xl font-bold text-slate-900">{zone.name}</h2>
              <p className="text-xs text-slate-600 leading-relaxed">{zone.description}</p>

              <div className="space-y-2 pt-2 border-t border-slate-100 text-xs">
                <div>
                  <strong className="text-emerald-800 flex items-center gap-1 mb-1">
                    <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" /> Permitted Land Uses:
                  </strong>
                  <ul className="list-disc list-inside text-slate-700 space-y-1 pl-1">
                    {zone.permitted_uses.map((item, idx) => (
                      <li key={idx}>{item}</li>
                    ))}
                  </ul>
                </div>

                <div className="pt-2">
                  <strong className="text-rose-800 flex items-center gap-1 mb-1">
                    <AlertTriangle className="w-3.5 h-3.5 text-rose-600" /> Restricted Activities:
                  </strong>
                  <ul className="list-disc list-inside text-slate-700 space-y-1 pl-1">
                    {zone.restricted_uses.map((item, idx) => (
                      <li key={idx}>{item}</li>
                    ))}
                  </ul>
                </div>

                <div className="pt-2 flex justify-between items-center text-slate-800 font-medium">
                  <span>Max Building Height:</span>
                  <span className="font-bold text-slate-900">{zone.building_height_max}</span>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* Disclaimer */}
        <div className="bg-slate-900 text-white rounded-2xl p-6 space-y-2 text-xs">
          <div className="font-bold text-emerald-400 text-sm flex items-center gap-2">
            <Sparkles className="w-4 h-4" /> VMRDA Source Attribution Notice
          </div>
          <p className="text-slate-300 leading-relaxed">{VMRDA_MASTER_PLAN_DISCLAIMER}</p>
        </div>
      </main>
    </div>
  );
}
