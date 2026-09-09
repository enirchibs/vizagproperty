import { SEOHead } from '../../components/SEOHead';
import { VMRDA_MASTER_PLAN_ROADS, VMRDA_MASTER_PLAN_DISCLAIMER } from '../../lib/vmrdaMasterPlanEngine';
import { Navigation, Sparkles } from 'lucide-react';
import { Link } from 'react-router-dom';

export function VMRDAMasterPlanRoadsPage() {
  const canonicalUrl = 'https://vizagproperty.co.in/vmrda/master-plan/roads';
  const pageTitle = 'VMRDA Master Plan 2041 Proposed Road Widening & Corridors | VizagProperty';
  const pageDescription = 'Official proposed road widening plans, 200ft expressways, 100ft arterial roads, and outer ring road corridors in VMRDA Master Plan 2041.';

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
          <span className="text-slate-900 font-medium truncate">Road Proposals</span>
        </div>
      </div>

      {/* Hero Header */}
      <section className="bg-gradient-to-br from-slate-900 via-slate-800 to-emerald-950 text-white py-12 px-4">
        <div className="max-w-6xl mx-auto space-y-3">
          <span className="inline-flex items-center gap-1.5 px-3 py-1 bg-emerald-500/20 text-emerald-300 border border-emerald-500/30 rounded-full text-xs font-semibold uppercase tracking-wider">
            <Navigation className="w-4 h-4 text-emerald-400" /> Infrastructure Master Plan
          </span>
          <h1 className="text-3xl md:text-5xl font-black text-white">
            VMRDA Master Plan 2041 Road Proposals & Expansion Corridors
          </h1>
          <p className="text-slate-300 text-sm md:text-base max-w-3xl leading-relaxed">
            Verified statutory road widening proposals including 200ft Bhogapuram Airport Expressway, NH-16 6-lane expansion, and 100ft arterial roads.
          </p>
        </div>
      </section>

      {/* Main Grid */}
      <main className="max-w-6xl mx-auto px-4 mt-8 space-y-8">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          {VMRDA_MASTER_PLAN_ROADS.map((road) => (
            <div key={road.id} className="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 space-y-4">
              <div className="flex items-center justify-between border-b pb-3">
                <span className="bg-emerald-100 text-emerald-900 font-bold text-xs px-3 py-1 rounded-full uppercase tracking-wider">
                  {road.proposed_width_ft} ft ({road.proposed_width_m} m) Wide
                </span>
                <span className="text-xs font-semibold text-slate-500 bg-slate-100 px-2.5 py-0.5 rounded">
                  {road.status}
                </span>
              </div>

              <h2 className="text-xl font-bold text-slate-900">{road.road_name}</h2>
              <p className="text-xs text-slate-600 font-medium">
                <strong>Corridor Route:</strong> {road.corridor}
              </p>
              <p className="text-xs text-slate-700 leading-relaxed bg-slate-50 p-3 rounded-xl border border-slate-100">
                {road.key_highlights}
              </p>

              <div className="pt-2 border-t border-slate-100 flex flex-wrap gap-1.5">
                <span className="text-xs text-slate-500 font-semibold mr-1">Connects:</span>
                {road.connecting_localities.map((loc, idx) => (
                  <span key={idx} className="bg-slate-100 text-slate-800 text-xs px-2 py-0.5 rounded">
                    {loc}
                  </span>
                ))}
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
