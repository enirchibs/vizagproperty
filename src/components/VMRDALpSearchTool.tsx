import { useState, useEffect } from 'react';
import { Search, ShieldCheck, CheckCircle2, FileText, AlertTriangle, ExternalLink, MessageCircle, MapPin, Building } from 'lucide-react';
import { searchVmrdaLayouts, VMRDA_VERIFIED_BASELINE } from '../lib/vmrdaDataEngine';
import { VmrdaLayout } from '../types';
import { openWhatsApp } from '../lib/whatsapp';

export function VMRDALpSearchTool() {
  const [searchInput, setSearchInput] = useState('');
  const [results, setResults] = useState<VmrdaLayout[]>(VMRDA_VERIFIED_BASELINE);
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
    <div className="bg-white rounded-3xl border border-gray-200 shadow-xl overflow-hidden my-8">
      {/* Header Banner */}
      <div className="bg-gradient-to-r from-emerald-900 via-primary-900 to-slate-900 text-white p-6 md:p-8">
        <div className="flex items-center gap-2 text-emerald-400 text-xs md:text-sm font-bold uppercase tracking-wider mb-2">
          <ShieldCheck className="w-5 h-5 text-emerald-400" />
          Official VMRDA Layout Permission (L.P.) Search Engine
        </div>
        <h2 className="text-2xl md:text-4xl font-extrabold tracking-tight text-white mb-3">
          VMRDA LP Number & Layout Approval Search
        </h2>
        <p className="text-sm md:text-base text-gray-200 max-w-3xl leading-relaxed">
          Verify Visakhapatnam Metropolitan Region Development Authority (VMRDA) layout permissions, file numbers, survey numbers, 15% mortgaged plots & official government PDF records.
        </p>

        {/* Search Bar Input */}
        <div className="mt-6 relative max-w-2xl">
          <div className="relative">
            <input
              type="text"
              value={searchInput}
              onChange={e => setSearchInput(e.target.value)}
              placeholder="Search LP No (e.g. 15/2024), Layout Name, Village, or Mandal..."
              className="w-full pl-12 pr-10 py-4 rounded-2xl text-gray-900 font-medium text-sm md:text-base focus:ring-4 focus:ring-emerald-400 focus:outline-none shadow-lg"
            />
            <Search className="w-5 h-5 text-gray-400 absolute left-4 top-1/2 -translate-y-1/2" />
            {searchInput && (
              <button
                onClick={() => setSearchInput('')}
                className="absolute right-4 top-1/2 -translate-y-1/2 text-xs bg-gray-200 hover:bg-gray-300 text-gray-700 px-2 py-1 rounded-full"
              >
                Clear
              </button>
            )}
          </div>
          <div className="flex flex-wrap gap-2 mt-3 text-xs text-emerald-200">
            <span className="font-semibold text-white">Popular Searches:</span>
            <button onClick={() => setSearchInput('15/2024')} className="hover:underline bg-emerald-950/60 px-2 py-0.5 rounded border border-emerald-700/50">15/2024</button>
            <button onClick={() => setSearchInput('Madhurawada')} className="hover:underline bg-emerald-950/60 px-2 py-0.5 rounded border border-emerald-700/50">Madhurawada</button>
            <button onClick={() => setSearchInput('Bhogapuram')} className="hover:underline bg-emerald-950/60 px-2 py-0.5 rounded border border-emerald-700/50">Bhogapuram</button>
            <button onClick={() => setSearchInput('Anandapuram')} className="hover:underline bg-emerald-950/60 px-2 py-0.5 rounded border border-emerald-700/50">Anandapuram</button>
          </div>
        </div>
      </div>

      {/* Results Container */}
      <div className="p-6 md:p-8">
        <div className="flex items-center justify-between mb-4 pb-2 border-b border-gray-100">
          <span className="text-sm font-semibold text-gray-700">
            Showing <strong className="text-primary-600">{results.length}</strong> Verified VMRDA Layout Records
          </span>
          <span className="text-xs text-gray-500 flex items-center gap-1">
            <CheckCircle2 className="w-4 h-4 text-emerald-600" /> Source: Official VMRDA Records
          </span>
        </div>

        {loading ? (
          <div className="py-12 text-center text-gray-500">
            <div className="w-8 h-8 border-4 border-primary-600 border-t-transparent rounded-full animate-spin mx-auto mb-3"></div>
            Searching VMRDA master database...
          </div>
        ) : results.length === 0 ? (
          <div className="py-10 px-6 bg-amber-50 rounded-2xl border border-amber-200 text-center">
            <AlertTriangle className="w-10 h-10 text-amber-600 mx-auto mb-3" />
            <h4 className="text-base font-bold text-amber-900 mb-1">
              No Direct Record Match Found for "{searchInput}"
            </h4>
            <p className="text-xs md:text-sm text-amber-800 max-w-xl mx-auto mb-4">
              Not seeing your LP number? It may be under recent APDPMS submission or secondary file records. Request instant free verification via our Legal Desk.
            </p>
            <button
              onClick={() => handleWhatsappCheck(searchInput, 'Unlisted Query Layout')}
              className="inline-flex items-center gap-2 bg-[#25D366] hover:bg-[#20ba5a] text-white font-bold px-6 py-2.5 rounded-xl text-sm transition-all shadow"
            >
              <MessageCircle className="w-4 h-4" /> Verify LP "{searchInput}" via WhatsApp Legal Desk
            </button>
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {results.map(layout => (
              <div
                key={layout.id}
                className="bg-gray-50 hover:bg-white p-6 rounded-2xl border border-gray-200 hover:border-emerald-500 hover:shadow-lg transition-all flex flex-col justify-between"
              >
                <div>
                  {/* Status Badge */}
                  <div className="flex items-center justify-between mb-3">
                    <span className="inline-flex items-center gap-1 bg-emerald-100 text-emerald-800 text-xs font-extrabold px-3 py-1 rounded-full">
                      <ShieldCheck className="w-3.5 h-3.5" /> LISTED IN VMRDA RECORDS
                    </span>
                    <span className="text-xs font-bold text-gray-500">
                      Score: <strong className="text-emerald-700">{layout.data_confidence_score}/100</strong>
                    </span>
                  </div>

                  {/* LP Number & Layout Title */}
                  <h3 className="text-lg font-bold text-gray-900 mb-1 leading-snug">
                    {layout.layout_name}
                  </h3>
                  <div className="text-sm font-extrabold text-primary-700 mb-3 flex items-center gap-2">
                    <span>L.P. No. {layout.lp_number}</span>
                    {layout.approval_year && <span className="text-xs font-normal text-gray-500">({layout.approval_year})</span>}
                  </div>

                  {/* Details Grid */}
                  <div className="space-y-1.5 text-xs text-gray-600 mb-4 bg-white p-3 rounded-xl border border-gray-100">
                    <div className="flex items-center justify-between">
                      <span className="text-gray-500 flex items-center gap-1"><MapPin className="w-3.5 h-3.5 text-gray-400" /> Mandal / Village:</span>
                      <strong className="text-gray-800">{layout.mandal} / {layout.village}</strong>
                    </div>
                    {layout.file_number && (
                      <div className="flex items-center justify-between">
                        <span className="text-gray-500 flex items-center gap-1"><FileText className="w-3.5 h-3.5 text-gray-400" /> File Number:</span>
                        <strong className="text-gray-800">{layout.file_number}</strong>
                      </div>
                    )}
                    {layout.developer_name && (
                      <div className="flex items-center justify-between">
                        <span className="text-gray-500 flex items-center gap-1"><Building className="w-3.5 h-3.5 text-gray-400" /> Developer:</span>
                        <strong className="text-gray-800">{layout.developer_name}</strong>
                      </div>
                    )}
                    {layout.survey_numbers && (
                      <div className="flex items-start justify-between">
                        <span className="text-gray-500">Survey Nos:</span>
                        <strong className="text-gray-800 text-right">{layout.survey_numbers.join(', ')}</strong>
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
                <div className="pt-3 border-t border-gray-200 flex flex-wrap items-center justify-between gap-2">
                  <a
                    href={layout.source_url}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-xs text-primary-600 hover:text-primary-800 font-bold flex items-center gap-1"
                  >
                    <ExternalLink className="w-3.5 h-3.5" /> Official VMRDA Portal
                  </a>
                  <button
                    onClick={() => handleWhatsappCheck(layout.lp_number, layout.layout_name)}
                    className="bg-[#25D366] hover:bg-[#20ba5a] text-white font-bold px-4 py-2 rounded-xl text-xs flex items-center gap-1.5 shadow-sm transition-all"
                  >
                    <MessageCircle className="w-3.5 h-3.5" /> Legal Verification Check
                  </button>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Official Government Disclaimer */}
      <div className="bg-gray-100 p-4 px-6 text-xs text-gray-600 border-t border-gray-200">
        <p className="leading-relaxed">
          <strong>Official Data Source & Disclaimer:</strong> All layout records and L.P. numbers displayed are compiled from public records released by the Visakhapatnam Metropolitan Region Development Authority (<a href="https://www.vmrda.gov.in/" target="_blank" rel="noopener noreferrer" className="underline text-primary-600">vmrda.gov.in</a>). VizagProperty.co.in is an independent digital information portal and does not grant legal approvals. Buyers are advised to obtain an Encumbrance Certificate (EC) from the Sub-Registrar Office before completing purchases.
        </p>
      </div>
    </div>
  );
}
