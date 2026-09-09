import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Search, ShieldCheck, CheckCircle2, FileText, AlertTriangle, ExternalLink, MessageCircle, MapPin, Building, ArrowRight, Sparkles } from 'lucide-react';
import { searchVmrdaLayouts, ALL_VMRDA_MASTER_DATABASE, getLayoutSlug } from '../lib/vmrdaDataEngine';
import { VmrdaLayout } from '../types';
import { openWhatsApp } from '../lib/whatsapp';

export function VMRDALpSearchTool() {
  const [searchInput, setSearchInput] = useState('');
  const [results, setResults] = useState<VmrdaLayout[]>(ALL_VMRDA_MASTER_DATABASE.slice(0, 30));
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const handleSearch = async () => {
      setLoading(true);
      const res = await searchVmrdaLayouts(searchInput);
      setResults(res);
      setLoading(false);
    };

    const timer = setTimeout(handleSearch, 300);
    return () => clearTimeout(timer);
  }, [searchInput]);

  const handleWhatsappCheck = (lpNo: string, layoutName: string) => {
    const text = `Hello VizagProperty Legal Desk,\n\nI need verification assistance for VMRDA Layout:\n• LP Number: ${lpNo}\n• Layout: ${layoutName}\n\nPlease check official VMRDA records & Sub-Registrar Office EC status for this layout.`;
    openWhatsApp(text);
  };

  return (
    <div className="bg-white rounded-2xl border border-gray-200 shadow-md overflow-hidden my-4">
      {/* Header Banner */}
      <div className="bg-gradient-to-r from-emerald-900 via-primary-900 to-slate-900 text-white p-5 md:p-6">
        <div className="flex items-center gap-1.5 text-emerald-400 text-xs font-bold uppercase tracking-wider mb-1.5">
          <ShieldCheck className="w-4 h-4 text-emerald-400" />
          Official VMRDA Layout Permission (L.P.) Search Engine
        </div>
        <h2 className="text-xl md:text-2xl font-extrabold tracking-tight text-white mb-2">
          VMRDA LP Number & Layout Approval Search
        </h2>
        <p className="text-xs md:text-sm text-gray-200 max-w-3xl leading-relaxed">
          Verify Visakhapatnam Metropolitan Region Development Authority (VMRDA) layout permissions, file numbers, survey numbers, 15% mortgaged plots & official government PDF records.
        </p>

        {/* Search Bar Input */}
        <div className="mt-4 relative max-w-2xl">
          <div className="relative">
            <input
              type="text"
              value={searchInput}
              onChange={e => setSearchInput(e.target.value)}
              placeholder="Search LP No (e.g. 15/2024), Layout Name, Village, or Mandal..."
              className="w-full pl-10 pr-10 py-3 rounded-xl text-gray-900 font-medium text-xs md:text-sm focus:ring-2 focus:ring-emerald-400 focus:outline-none shadow-md"
            />
            <Search className="w-4 h-4 text-gray-400 absolute left-3.5 top-1/2 -translate-y-1/2" />
            {searchInput && (
              <button
                onClick={() => setSearchInput('')}
                className="absolute right-3.5 top-1/2 -translate-y-1/2 text-[11px] bg-gray-200 hover:bg-gray-300 text-gray-700 px-2 py-0.5 rounded-full"
              >
                Clear
              </button>
            )}
          </div>
          <div className="flex flex-wrap gap-1.5 mt-2.5 text-[11px] text-emerald-200">
            <span className="font-semibold text-white">Popular Searches:</span>
            <button onClick={() => setSearchInput('2024')} className="hover:underline bg-emerald-950/60 px-2 py-0.5 rounded border border-emerald-700/50">2024 Approved</button>
            <button onClick={() => setSearchInput('15/2024')} className="hover:underline bg-emerald-950/60 px-2 py-0.5 rounded border border-emerald-700/50">15/2024</button>
            <button onClick={() => setSearchInput('Madhurawada')} className="hover:underline bg-emerald-950/60 px-2 py-0.5 rounded border border-emerald-700/50">Madhurawada</button>
            <button onClick={() => setSearchInput('Bhogapuram')} className="hover:underline bg-emerald-950/60 px-2 py-0.5 rounded border border-emerald-700/50">Bhogapuram</button>
            <button onClick={() => setSearchInput('Anandapuram')} className="hover:underline bg-emerald-950/60 px-2 py-0.5 rounded border border-emerald-700/50">Anandapuram</button>
          </div>
        </div>
      </div>

      {/* Results Container */}
      <div className="p-4 md:p-6">
        <div className="flex items-center justify-between mb-4 pb-2 border-b border-gray-100">
          <span className="text-xs md:text-sm font-semibold text-gray-800 flex items-center gap-1.5">
            <Sparkles className="w-4 h-4 text-emerald-600" />
            Showing <strong className="text-primary-700 font-bold">{results.length}</strong> {searchInput ? 'Matching Records' : 'Latest Approved VMRDA Layout Records (2024–2022)'}
          </span>
          <span className="text-[11px] md:text-xs text-gray-500 flex items-center gap-1">
            <CheckCircle2 className="w-3.5 h-3.5 text-emerald-600" /> Source: vmrda.ap.gov.in
          </span>
        </div>

        {loading ? (
          <div className="py-8 text-center text-xs text-gray-500">
            <div className="w-6 h-6 border-3 border-primary-600 border-t-transparent rounded-full animate-spin mx-auto mb-2"></div>
            Searching VMRDA master database...
          </div>
        ) : results.length === 0 ? (
          <div className="py-8 px-5 bg-amber-50 rounded-xl border border-amber-200 text-center">
            <AlertTriangle className="w-8 h-8 text-amber-600 mx-auto mb-2" />
            <h4 className="text-sm font-bold text-amber-900 mb-1">
              No Direct Record Match Found for "{searchInput}"
            </h4>
            <p className="text-xs text-amber-800 max-w-xl mx-auto mb-3">
              Not seeing your LP number? It may be under recent APDPMS submission or secondary file records. Request instant free verification via our Legal Desk.
            </p>
            <button
              onClick={() => handleWhatsappCheck(searchInput, 'Unlisted Query Layout')}
              className="inline-flex items-center gap-1.5 bg-[#25D366] hover:bg-[#20ba5a] text-white font-bold px-4 py-2 rounded-lg text-xs transition-all shadow-sm"
            >
              <MessageCircle className="w-3.5 h-3.5" /> Verify LP "{searchInput}" via WhatsApp Legal Desk
            </button>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            {results.map(layout => (
              <div
                key={layout.id}
                className="bg-gray-50/70 hover:bg-white p-4 rounded-xl border border-gray-200 hover:border-emerald-500 hover:shadow-md transition-all flex flex-col justify-between"
              >
                <div>
                  {/* Status Badge */}
                  <div className="flex items-center justify-between mb-2">
                    <span className="inline-flex items-center gap-1 bg-emerald-100 text-emerald-800 text-[10px] font-extrabold px-2.5 py-0.5 rounded-full">
                      <ShieldCheck className="w-3 h-3 text-emerald-700" /> VERIFIED VMRDA RECORD
                    </span>
                    <span className="text-[11px] font-bold text-gray-500">
                      Score: <strong className="text-emerald-700">{layout.data_confidence_score}/100</strong>
                    </span>
                  </div>

                  {/* LP Number & Layout Title */}
                  <h3 className="text-sm md:text-base font-bold text-gray-900 mb-1 leading-snug">
                    {layout.layout_name}
                  </h3>
                  <div className="text-xs md:text-sm font-extrabold text-primary-700 mb-2.5 flex items-center gap-2">
                    <span>L.P. No. {layout.lp_number}</span>
                    {layout.approval_year && <span className="text-[11px] font-normal text-gray-500">({layout.approval_year})</span>}
                  </div>

                  {/* Details Grid */}
                  <div className="space-y-1 text-[11px] md:text-xs text-gray-600 mb-3 bg-white p-2.5 rounded-lg border border-gray-100">
                    <div className="flex items-center justify-between">
                      <span className="text-gray-500 flex items-center gap-1"><MapPin className="w-3 h-3 text-gray-400" /> Mandal / Village:</span>
                      <strong className="text-gray-800">{layout.mandal} / {layout.village}</strong>
                    </div>
                    {layout.file_number && (
                      <div className="flex items-center justify-between">
                        <span className="text-gray-500 flex items-center gap-1"><FileText className="w-3 h-3 text-gray-400" /> File Number:</span>
                        <strong className="text-gray-800">{layout.file_number}</strong>
                      </div>
                    )}
                    {layout.developer_name && (
                      <div className="flex items-center justify-between">
                        <span className="text-gray-500 flex items-center gap-1"><Building className="w-3 h-3 text-gray-400" /> Developer:</span>
                        <strong className="text-gray-800 truncate max-w-[180px]">{layout.developer_name}</strong>
                      </div>
                    )}
                    {layout.extent_acres && (
                      <div className="flex items-center justify-between">
                        <span className="text-gray-500">Total Layout Extent:</span>
                        <strong className="text-gray-800">{layout.extent_acres} Acres ({layout.total_plots || 'N/A'} Plots)</strong>
                      </div>
                    )}
                  </div>
                </div>

                {/* Actions Bar */}
                <div className="pt-2.5 border-t border-gray-200 flex flex-wrap items-center justify-between gap-2">
                  <div className="flex items-center gap-2">
                    <Link
                      to={`/vmrda/lp/${getLayoutSlug(layout)}`}
                      className="text-[11px] bg-slate-900 text-white font-bold px-2.5 py-1 rounded-md hover:bg-slate-800 transition inline-flex items-center gap-1"
                    >
                      View Report <ArrowRight className="w-3 h-3" />
                    </Link>
                    <a
                      href={layout.source_url}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-[11px] text-primary-600 hover:text-primary-800 font-bold flex items-center gap-1"
                    >
                      <ExternalLink className="w-3 h-3" /> vmrda.ap.gov.in
                    </a>
                  </div>
                  <button
                    onClick={() => handleWhatsappCheck(layout.lp_number, layout.layout_name)}
                    className="bg-[#25D366] hover:bg-[#20ba5a] text-white font-bold px-2.5 py-1 rounded-md text-[11px] flex items-center gap-1 shadow-sm transition-all"
                  >
                    <MessageCircle className="w-3 h-3" /> Legal Check
                  </button>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Official Government Disclaimer */}
      <div className="bg-gray-100 p-3 px-5 text-[11px] text-gray-600 border-t border-gray-200">
        <p className="leading-relaxed">
          <strong>Official Data Source & Disclaimer:</strong> All layout records and L.P. numbers displayed are compiled from public records released by the Visakhapatnam Metropolitan Region Development Authority (<a href="https://vmrda.ap.gov.in/citizen/approved-layouts" target="_blank" rel="noopener noreferrer" className="underline text-primary-600">vmrda.ap.gov.in</a>). VizagProperty.co.in is an independent digital information portal.
        </p>
      </div>
    </div>
  );
}
