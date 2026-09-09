import { useState, useMemo } from 'react';
import { 
  VMRDA_MASTER_PLAN_MAPS, 
  VMRDA_MASTER_PLAN_ZONES, 
  VMRDA_MASTER_PLAN_DISCLAIMER,
  searchMasterPlanMaps 
} from '../lib/vmrdaMasterPlanEngine';
import { VmrdaMasterPlanMap } from '../types';
import { Search, MapPin, ExternalLink, ShieldCheck, Eye, X, Download, Compass } from 'lucide-react';

export function VMRDAMasterPlanExplorer() {
  const [searchInput, setSearchInput] = useState('');
  const [selectedFilter, setSelectedFilter] = useState<'ALL' | 'MANDAL' | 'VILLAGE' | 'ZONING'>('ALL');
  const [selectedMandal, setSelectedMandal] = useState<string>('All');
  const [activeMapModal, setActiveMapModal] = useState<VmrdaMasterPlanMap | null>(null);

  const quickMandals = ['All', 'Anandapuram', 'Bheemunipatnam', 'Anakapalli', 'Gajuwaka', 'Pendurthi', 'Bhogapuram', 'Visakhapatnam Urban', 'Padmanabham'];

  const filteredMaps = useMemo(() => {
    let maps = VMRDA_MASTER_PLAN_MAPS;

    if (searchInput.trim()) {
      maps = searchMasterPlanMaps(searchInput);
    }

    if (selectedMandal !== 'All') {
      maps = maps.filter(m => m.mandal_name?.toLowerCase().includes(selectedMandal.toLowerCase()));
    }

    if (selectedFilter === 'MANDAL') {
      maps = maps.filter(m => m.map_type === 'MANDAL');
    } else if (selectedFilter === 'VILLAGE') {
      maps = maps.filter(m => m.map_type === 'VILLAGE');
    }

    return maps.slice(0, 36);
  }, [searchInput, selectedFilter, selectedMandal]);

  return (
    <div className="space-y-6">
      {/* Search Header Bar */}
      <div className="bg-slate-900 text-white p-6 md:p-8 rounded-2xl shadow-lg border border-slate-800 space-y-6">
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
          <div>
            <span className="inline-flex items-center gap-1.5 px-3 py-1 bg-emerald-500/20 text-emerald-300 border border-emerald-500/30 rounded-full text-xs font-semibold uppercase tracking-wider mb-2">
              <Compass className="w-3.5 h-3.5 text-emerald-400" /> Official VMRDA GIS Layer
            </span>
            <h2 className="text-2xl md:text-3xl font-extrabold text-white">
              VMRDA Master Plan 2041 Map Explorer
            </h2>
            <p className="text-sm text-slate-300 mt-1">
              Search high-resolution official Master Plan maps across 936 villages & 37 mandals in Visakhapatnam, Anakapalli, and Vizianagaram.
            </p>
          </div>

          <div className="flex items-center gap-2 bg-slate-800 p-1.5 rounded-xl border border-slate-700 text-xs">
            <span className="px-3 py-1 bg-emerald-600 text-white font-bold rounded-lg">936 Maps Ingested</span>
            <span className="px-3 py-1 text-slate-300">2041 Master Plan</span>
          </div>
        </div>

        {/* Input Bar */}
        <div className="relative max-w-3xl">
          <Search className="w-5 h-5 text-slate-400 absolute left-4 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            value={searchInput}
            onChange={(e) => setSearchInput(e.target.value)}
            placeholder="Search by Mandal (e.g. Anandapuram), Village (e.g. Gidijala), or Locality..."
            className="w-full pl-12 pr-4 py-3.5 bg-slate-800 text-white placeholder-slate-400 rounded-xl border border-slate-700 focus:outline-none focus:border-emerald-500 font-medium text-sm transition"
          />
          {searchInput && (
            <button
              onClick={() => setSearchInput('')}
              className="absolute right-4 top-1/2 -translate-y-1/2 text-slate-400 hover:text-white"
            >
              <X className="w-4 h-4" />
            </button>
          )}
        </div>

        {/* Filter Pills */}
        <div className="flex flex-wrap items-center gap-2 pt-2 border-t border-slate-800">
          <span className="text-xs font-semibold text-slate-400 uppercase tracking-wider mr-2">Quick Mandal:</span>
          {quickMandals.map((mandal) => (
            <button
              key={mandal}
              onClick={() => setSelectedMandal(mandal)}
              className={`px-3 py-1 rounded-lg text-xs font-semibold transition ${
                selectedMandal === mandal
                  ? 'bg-emerald-500 text-slate-950 font-bold'
                  : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
              }`}
            >
              {mandal}
            </button>
          ))}
        </div>
      </div>

      {/* Navigation Filter Tabs */}
      <div className="flex items-center gap-2 border-b border-slate-200 overflow-x-auto pb-1">
        <button
          onClick={() => setSelectedFilter('ALL')}
          className={`px-4 py-2 text-sm font-bold border-b-2 transition whitespace-nowrap ${
            selectedFilter === 'ALL'
              ? 'border-emerald-600 text-emerald-700'
              : 'border-transparent text-slate-600 hover:text-slate-900'
          }`}
        >
          All Cadastral Maps ({filteredMaps.length})
        </button>
        <button
          onClick={() => setSelectedFilter('MANDAL')}
          className={`px-4 py-2 text-sm font-bold border-b-2 transition whitespace-nowrap ${
            selectedFilter === 'MANDAL'
              ? 'border-emerald-600 text-emerald-700'
              : 'border-transparent text-slate-600 hover:text-slate-900'
          }`}
        >
          Mandal Master Maps (37)
        </button>
        <button
          onClick={() => setSelectedFilter('VILLAGE')}
          className={`px-4 py-2 text-sm font-bold border-b-2 transition whitespace-nowrap ${
            selectedFilter === 'VILLAGE'
              ? 'border-emerald-600 text-emerald-700'
              : 'border-transparent text-slate-600 hover:text-slate-900'
          }`}
        >
          Village Master Maps (899)
        </button>
        <button
          onClick={() => setSelectedFilter('ZONING')}
          className={`px-4 py-2 text-sm font-bold border-b-2 transition whitespace-nowrap ${
            selectedFilter === 'ZONING'
              ? 'border-emerald-600 text-emerald-700'
              : 'border-transparent text-slate-600 hover:text-slate-900'
          }`}
        >
          Statutory Zoning Legend
        </button>
      </div>

      {/* Zoning Legend Section */}
      {selectedFilter === 'ZONING' ? (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          {VMRDA_MASTER_PLAN_ZONES.map((zone) => (
            <div key={zone.code} className="bg-white p-5 rounded-2xl border border-slate-200 shadow-sm space-y-3">
              <div className="flex items-center justify-between">
                <span className={`px-3 py-1 rounded-full text-xs font-bold ${zone.bg_color}`}>
                  {zone.code}
                </span>
                <span className="text-xs font-mono text-slate-500">FAR: {zone.fd_ratio}</span>
              </div>
              <h3 className="font-bold text-slate-900 text-base">{zone.name}</h3>
              <p className="text-xs text-slate-600">{zone.description}</p>
              <div className="pt-2 border-t border-slate-100 text-xs">
                <span className="font-semibold text-slate-700 block mb-1">Permitted Uses:</span>
                <ul className="list-disc list-inside text-slate-600 space-y-0.5">
                  {zone.permitted_uses.slice(0, 3).map((use, idx) => (
                    <li key={idx}>{use}</li>
                  ))}
                </ul>
              </div>
            </div>
          ))}
        </div>
      ) : (
        /* Maps Grid */
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
          {filteredMaps.length > 0 ? (
            filteredMaps.map((mapItem) => (
              <div
                key={mapItem.id}
                className="bg-white rounded-2xl border border-slate-200 shadow-sm hover:border-emerald-500 transition-all overflow-hidden flex flex-col justify-between group"
              >
                <div className="p-5 space-y-3">
                  <div className="flex items-center justify-between">
                    <span className={`px-2.5 py-0.5 rounded text-[10px] font-extrabold uppercase tracking-wider ${
                      mapItem.map_type === 'MANDAL' ? 'bg-purple-100 text-purple-800' : 'bg-emerald-100 text-emerald-800'
                    }`}>
                      {mapItem.map_type} MAP
                    </span>
                    <span className="text-xs text-slate-500 font-medium">
                      {mapItem.district_name}
                    </span>
                  </div>

                  <h3 className="font-bold text-slate-900 text-base group-hover:text-emerald-600 transition leading-snug">
                    {mapItem.village_name || `${mapItem.mandal_name} Mandal Master Map`}
                  </h3>

                  <div className="flex items-center gap-1.5 text-xs text-slate-600">
                    <MapPin className="w-3.5 h-3.5 text-slate-400" />
                    <span>Mandal: <strong className="text-slate-800">{mapItem.mandal_name}</strong></span>
                  </div>
                </div>

                {/* Card Action Footer */}
                <div className="bg-slate-50 px-5 py-3 border-t border-slate-100 flex items-center justify-between">
                  <button
                    onClick={() => setActiveMapModal(mapItem)}
                    className="text-xs bg-slate-900 hover:bg-slate-800 text-white font-bold px-3.5 py-1.5 rounded-lg transition inline-flex items-center gap-1.5"
                  >
                    <Eye className="w-3.5 h-3.5" /> Inspect Map
                  </button>

                  <a
                    href={mapItem.file_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-xs text-emerald-600 hover:text-emerald-700 font-bold inline-flex items-center gap-1"
                  >
                    vmrda.ap.gov.in <ExternalLink className="w-3 h-3" />
                  </a>
                </div>
              </div>
            ))
          ) : (
            <div className="col-span-full py-12 text-center bg-white rounded-2xl border border-slate-200 p-8 space-y-3">
              <Search className="w-10 h-10 text-slate-400 mx-auto" />
              <h3 className="font-bold text-slate-900 text-lg">No Master Plan maps found for "{searchInput}"</h3>
              <p className="text-xs text-slate-600 max-w-md mx-auto">
                Try searching for major growth corridors like Anandapuram, Tagarapuvalasa, Bheemunipatnam, Gajuwaka, or Pendurthi.
              </p>
            </div>
          )}
        </div>
      )}

      {/* Mandatory Statutory Legal Compliance Disclaimer */}
      <div className="bg-amber-50/80 border border-amber-200 p-5 rounded-2xl space-y-2 text-xs text-amber-900">
        <div className="flex items-center gap-2 font-bold text-amber-950 text-sm">
          <ShieldCheck className="w-4 h-4 text-amber-600" />
          Statutory VMRDA Master Plan Source Attribution Notice
        </div>
        <p className="leading-relaxed">
          {VMRDA_MASTER_PLAN_DISCLAIMER}
        </p>
      </div>

      {/* High-Resolution Map Inspection Modal */}
      {activeMapModal && (
        <div className="fixed inset-0 z-50 bg-slate-950/80 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl max-w-5xl w-full max-h-[90vh] overflow-hidden flex flex-col shadow-2xl border border-slate-200">
            {/* Modal Header */}
            <div className="bg-slate-900 text-white px-6 py-4 flex items-center justify-between">
              <div>
                <h3 className="font-bold text-lg text-white">
                  {activeMapModal.village_name || `${activeMapModal.mandal_name} Mandal Master Map`}
                </h3>
                <p className="text-xs text-slate-300">
                  VMRDA Master Plan 2041 • {activeMapModal.mandal_name} Mandal • {activeMapModal.district_name}
                </p>
              </div>
              <button
                onClick={() => setActiveMapModal(null)}
                className="text-slate-400 hover:text-white bg-slate-800 p-1.5 rounded-lg transition"
              >
                <X className="w-5 h-5" />
              </button>
            </div>

            {/* Modal Image Body */}
            <div className="flex-1 bg-slate-950 overflow-auto p-4 flex items-center justify-center relative min-h-[400px]">
              <img
                src={activeMapModal.file_url}
                alt={activeMapModal.village_name || activeMapModal.mandal_name}
                className="max-w-full max-h-[70vh] object-contain rounded shadow"
                onError={(e) => {
                  (e.target as HTMLElement).style.display = 'none';
                }}
              />
            </div>

            {/* Modal Footer */}
            <div className="bg-slate-50 px-6 py-4 border-t border-slate-200 flex flex-wrap items-center justify-between gap-3">
              <div className="text-xs text-slate-600 font-medium">
                Official Government Source: <strong className="text-slate-900">vmrda.ap.gov.in</strong>
              </div>
              <div className="flex items-center gap-3">
                <a
                  href={activeMapModal.file_url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="bg-emerald-600 hover:bg-emerald-700 text-white font-bold px-4 py-2 rounded-xl text-xs flex items-center gap-1.5 transition"
                >
                  <Download className="w-3.5 h-3.5" /> Download Original High-Res Map
                </a>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
