import { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { getLocalityZoning, VMRDA_MASTER_PLAN_DISCLAIMER } from '../../lib/vmrdaMasterPlanEngine';
import { SEOHead } from '../../components/SEOHead';
import { ShieldCheck, Eye, Sparkles } from 'lucide-react';

export function VMRDAMasterPlanLocalityPage() {
  const { locality } = useParams<{ locality: string }>();
  const [cleanLocality, setCleanLocality] = useState('');

  useEffect(() => {
    if (locality) {
      const formatted = locality.replace(/-/g, ' ').replace(/\b\w/g, l => l.toUpperCase());
      setCleanLocality(formatted);
    }
  }, [locality]);

  const zoning = getLocalityZoning(cleanLocality || 'Madhurawada');
  const canonicalUrl = `https://vizagproperty.co.in/vmrda/master-plan/${locality || 'madhurawada'}`;
  const pageTitle = `${cleanLocality || 'Vizag'} VMRDA Master Plan 2041 Map & Zoning | VizagProperty`;
  const pageDescription = `Official VMRDA Master Plan 2041 land-use zoning, cadastral village maps, and proposed road widening rules for ${cleanLocality || 'Visakhapatnam'}.`;

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
          <span className="text-slate-900 font-medium truncate">{cleanLocality}</span>
        </div>
      </div>

      {/* Hero Header */}
      <section className="bg-gradient-to-br from-slate-950 via-slate-900 to-emerald-950 text-white py-12 px-4">
        <div className="max-w-6xl mx-auto space-y-3">
          <div className="flex flex-wrap items-center gap-2">
            <span className="inline-flex items-center gap-1.5 px-3 py-1 bg-emerald-500/20 text-emerald-300 border border-emerald-500/30 rounded-full text-xs font-semibold uppercase tracking-wider">
              <ShieldCheck className="w-4 h-4 text-emerald-400" /> Official VMRDA Master Plan 2041
            </span>
            <span className="bg-white/10 text-slate-200 px-3 py-1 rounded-full text-xs font-medium">
              Locality Master Map
            </span>
          </div>

          <h1 className="text-3xl md:text-5xl font-black text-white">
            {cleanLocality} VMRDA Master Plan 2041 Maps & Zoning
          </h1>
          <p className="text-slate-300 text-sm md:text-base max-w-3xl leading-relaxed">
            Statutory land-use classification, building height limits, FAR guidelines, and high-resolution official village cadastral maps for {cleanLocality}.
          </p>
        </div>
      </section>

      {/* Main Content */}
      <main className="max-w-6xl mx-auto px-4 mt-8 space-y-8">
        
        {/* Zoning Specifications */}
        <div className="bg-white p-6 md:p-8 rounded-2xl border border-slate-200 shadow-sm space-y-4">
          <div className="flex flex-col md:flex-row md:items-center justify-between gap-3 border-b pb-4">
            <div>
              <span className={`px-3 py-1 rounded-full text-xs font-bold ${zoning.zone.bg_color}`}>
                {zoning.zone.code}
              </span>
              <h2 className="text-2xl font-bold text-slate-900 mt-2">
                Zoning Classification: {zoning.zone.name}
              </h2>
            </div>
            <span className="text-xs font-mono font-bold bg-slate-100 px-3 py-1.5 rounded-lg text-slate-800">
              Max Height: {zoning.zone.building_height_max}
            </span>
          </div>

          <p className="text-sm text-slate-700 leading-relaxed">
            {zoning.zone.description}
          </p>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-xs pt-2">
            <div className="bg-slate-50 p-4 rounded-xl space-y-1 border border-slate-100">
              <strong className="text-emerald-800 font-bold block mb-1">Permitted Land Uses in {cleanLocality}:</strong>
              <ul className="list-disc list-inside text-slate-700 space-y-1">
                {zoning.zone.permitted_uses.map((item, idx) => (
                  <li key={idx}>{item}</li>
                ))}
              </ul>
            </div>

            <div className="bg-slate-50 p-4 rounded-xl space-y-1 border border-slate-100">
              <strong className="text-slate-900 font-bold block mb-1">Arterial Road Proposals:</strong>
              {zoning.proposedRoads.length > 0 ? (
                <ul className="space-y-1.5 text-slate-700">
                  {zoning.proposedRoads.map((r) => (
                    <li key={r.id} className="flex justify-between items-center">
                      <span>{r.road_name}</span>
                      <span className="font-bold text-emerald-700">{r.proposed_width_ft} ft</span>
                    </li>
                  ))}
                </ul>
              ) : (
                <p className="text-slate-600">Standard 40ft & 60ft VMRDA Approved Internal Layout Sector Roads.</p>
              )}
            </div>
          </div>
        </div>

        {/* Locality Official Maps */}
        {zoning.maps.length > 0 && (
          <div className="space-y-4">
            <h2 className="text-xl font-bold text-slate-900">Official VMRDA Master Plan Cadastral Maps for {cleanLocality}</h2>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              {zoning.maps.map((mapItem) => (
                <div key={mapItem.id} className="bg-white p-5 rounded-2xl border border-slate-200 shadow-sm space-y-3">
                  <span className="text-[10px] font-extrabold uppercase bg-emerald-100 text-emerald-800 px-2 py-0.5 rounded">
                    {mapItem.map_type} MAP
                  </span>
                  <h3 className="font-bold text-slate-900">{mapItem.village_name || mapItem.mandal_name}</h3>
                  <a
                    href={mapItem.file_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-xs bg-slate-900 hover:bg-slate-800 text-white font-bold px-3 py-1.5 rounded-lg inline-flex items-center gap-1 transition"
                  >
                    <Eye className="w-3.5 h-3.5" /> View Map PDF/JPG
                  </a>
                </div>
              ))}
            </div>
          </div>
        )}

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
