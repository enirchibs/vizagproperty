import React, { useState, useRef, useEffect } from 'react';
import { Search, MapPin, Home, IndianRupee, X, ChevronDown } from 'lucide-react';
import { useNavigate, Link } from 'react-router-dom';
import { supabase } from '../lib/supabase';

const VIZAG_LOCALITIES = [
  'Madhurawada', 'Yendada', 'MVP Colony', 'Gajuwaka', 'Rushikonda', 
  'Seethammadhara', 'PM Palem', 'Lawsons Bay Colony', 'Akkayyapalem', 
  'Kancharapalem', 'Bheemili', 'Pendurthi', 'Bhogapuram', 'Kurmannapalem',
  'Sujatha Nagar', 'NAD Junction', 'Murali Nagar'
];

type TabType = 'Buy' | 'Rent' | 'New Projects' | 'PG' | 'Plot' | 'Commercial';

interface LocationSuggestion {
  name: string;
  subtitle: string;
  entityType: string;
}

export function HeroSearch({ onDropdownToggle }: { onDropdownToggle?: (open: boolean) => void } = {}) {
  const [activeTab, setActiveTab] = useState<TabType>('Buy');
  const [query, setQuery] = useState('');
  const [selectedLocations, setSelectedLocations] = useState<string[]>(['Vizag']);
  const [showDropdown, setShowDropdown] = useState(false);
  const [filteredLocalities, setFilteredLocalities] = useState<LocationSuggestion[]>([]);
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();
  const wrapperRef = useRef<HTMLDivElement>(null);

  const tabs: TabType[] = ['Buy', 'Rent', 'New Projects', 'PG', 'Plot', 'Commercial'];

  useEffect(() => {
    if (!query.trim()) {
      // Show top popular localities when input is focused but empty
      setFilteredLocalities(VIZAG_LOCALITIES
        .filter(loc => !selectedLocations.includes(loc))
        .slice(0, 8)
        .map(loc => ({ name: loc, subtitle: 'Visakhapatnam', entityType: 'locality' }))
      );
      return;
    }

    if (query.trim().length < 2) {
      setFilteredLocalities([]);
      return;
    }

    const searchLocations = async () => {
      setIsLoading(true);
      try {
        const { data, error } = await supabase.functions.invoke('location-autocomplete', {
          body: { query: query.trim(), limit: 15 }
        });
        if (error) throw error;

        const suggestions: LocationSuggestion[] = (data || [])
          .map((item: any) => {
            const parts = item.display_name.split(',').map((p: string) => p.trim());
            const name = parts[0];
            const subtitle = parts.slice(1).join(', ') || 'Visakhapatnam';
            return { name, subtitle, entityType: item.entity_type || 'locality' };
          })
          .filter((s: LocationSuggestion) => !selectedLocations.includes(s.name));

        setFilteredLocalities(suggestions);
      } catch (err) {
        console.error('Error fetching autocomplete locations:', err);
        setFilteredLocalities([]);
      } finally {
        setIsLoading(false);
      }
    };

    const debounce = setTimeout(searchLocations, 200);
    return () => clearTimeout(debounce);
  }, [query, selectedLocations]);

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (wrapperRef.current && !wrapperRef.current.contains(event.target as Node)) {
        setShowDropdown(false);
        onDropdownToggle?.(false);
      }
    }
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [wrapperRef, onDropdownToggle]);

  const handleSearch = (e?: React.FormEvent) => {
    if (e) e.preventDefault();
    const searchString = [...selectedLocations, query].filter(Boolean).join(' ');
    if (searchString) {
      navigate(`/properties?q=${encodeURIComponent(searchString)}&type=${activeTab.toLowerCase()}`);
    } else {
      navigate(`/properties?type=${activeTab.toLowerCase()}`);
    }
  };

  const addLocation = (loc: string) => {
    if (!selectedLocations.includes(loc)) {
      if (selectedLocations.includes('Vizag')) {
         setSelectedLocations([loc]);
      } else {
         setSelectedLocations([...selectedLocations, loc]);
      }
    }
    setQuery('');
    setShowDropdown(false);
    onDropdownToggle?.(false);
  };

  const removeLocation = (loc: string) => {
    setSelectedLocations(selectedLocations.filter(l => l !== loc));
  };

  return (
    <div className="w-full max-w-5xl mx-auto mt-8 flex flex-col relative z-[200]" ref={wrapperRef}>
      
      {/* Folder Tabs (NoBroker Style) */}
      <div className="flex overflow-x-auto no-scrollbar items-end pl-0 md:pl-4">
        {tabs.map((tab) => (
          <button
            key={tab}
            onClick={() => setActiveTab(tab)}
            className={`px-6 py-3.5 text-sm md:text-base font-bold whitespace-nowrap transition-all rounded-t-xl border border-b-0 -mb-[1px] relative z-10 ${
              activeTab === tab 
                ? 'bg-white text-[#d92328] border-gray-200 border-t-4 border-t-[#d92328]' 
                : 'bg-white/90 text-gray-600 border-transparent hover:bg-white/100 hover:text-gray-900'
            }`}
          >
            {tab}
          </button>
        ))}
        {/* Post free ad link */}
        <div className="ml-auto hidden lg:block pb-2 pr-4">
          <Link to="/add-property" className="text-lg font-bold text-red-600 bg-yellow-400 hover:bg-yellow-500 px-6 py-2.5 rounded-lg transition-colors shadow-lg animate-heartbeat inline-block">
            Post Free Property Ad
          </Link>
        </div>
      </div>

      <div className="w-full bg-white rounded-xl md:rounded-tl-none shadow-2xl border border-gray-200 relative z-0">
        
        {/* Main Search Inputs */}
        <div className="p-3 md:p-4 flex flex-col md:flex-row items-center relative gap-3 md:gap-0">
          
          {/* Location Section */}
          <div className="flex-1 flex items-center px-3 py-1.5 min-w-0 w-full relative border md:border-r-0 border-gray-300 rounded-lg md:rounded-r-none md:rounded-l-lg bg-white h-14 md:h-16 gap-2">
            <MapPin className="w-4 h-4 text-[#d92328] flex-shrink-0" />
            
            <div className="flex flex-wrap items-center gap-1.5 flex-1 min-w-0 overflow-x-auto no-scrollbar">
              {selectedLocations.map(loc => (
                <span key={loc} className="flex items-center gap-1 bg-gray-900 text-white px-2.5 py-1 rounded-md text-xs font-semibold whitespace-nowrap">
                  {loc}
                  <button onClick={() => removeLocation(loc)} className="hover:text-red-300 rounded p-0.5 transition-colors ml-0.5">
                    <X className="w-3 h-3" />
                  </button>
                </span>
              ))}
              <input
                type="text"
                value={query}
                onChange={(e) => {
                  setQuery(e.target.value);
                  setShowDropdown(true);
                  onDropdownToggle?.(true);
                }}
                onFocus={() => {
                  setShowDropdown(true);
                  onDropdownToggle?.(true);
                }}
                placeholder={selectedLocations.length === 0 ? "Search locality, area or landmark..." : "+ Add area"}
                className="flex-1 min-w-[120px] bg-transparent border-none outline-none text-gray-800 placeholder:text-gray-400 text-sm font-medium"
              />
            </div>

            {/* Autocomplete Dropdown — always on top using high z-index */}
            {showDropdown && (
              <div
                className="absolute left-0 w-full md:w-[520px]"
                style={{ top: 'calc(100% + 8px)', zIndex: 99999 }}
              >
                <div
                  className="rounded-2xl overflow-hidden"
                  style={{
                    background: '#fff',
                    boxShadow: '0 25px 60px rgba(0,0,0,0.35), 0 4px 16px rgba(0,0,0,0.15)',
                    border: '1px solid rgba(255,255,255,0.3)',
                    animation: 'slideDown 0.18s ease-out'
                  }}
                >
                  {/* Dark gradient header */}
                  <div style={{ background: 'linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%)' }} className="px-4 py-3 flex items-center justify-between">
                    <div className="flex items-center gap-2">
                      <svg className="w-4 h-4 text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" /><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" /></svg>
                      <span className="text-white text-xs font-bold tracking-widest uppercase">Select Location</span>
                    </div>
                    {isLoading && (
                      <div className="flex items-center gap-1.5 text-gray-400 text-xs">
                        <svg className="animate-spin w-3.5 h-3.5 text-red-400" fill="none" viewBox="0 0 24 24"><circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"/><path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"/></svg>
                        <span className="text-gray-300">Searching...</span>
                      </div>
                    )}
                  </div>

                  {/* Results list */}
                  <div className="max-h-[360px] overflow-y-auto" style={{ scrollbarWidth: 'thin', scrollbarColor: '#d92328 #f5f5f5' }}>
                    {!isLoading && filteredLocalities.length > 0 ? (
                      filteredLocalities.map((loc, idx) => {
                        const name = loc.name;
                        const isSubLocality = loc.entityType === 'sub_locality';
                        const matchIndex = name.toLowerCase().indexOf(query.toLowerCase());
                        let displayText: React.ReactNode = name;
                        if (query && matchIndex !== -1) {
                          displayText = (
                            <>
                              <span className="text-[#d92328] font-bold">{name.substring(0, matchIndex + query.length)}</span>
                              <span className="text-gray-900">{name.substring(matchIndex + query.length)}</span>
                            </>
                          );
                        }
                        return (
                          <button
                            key={idx}
                            onMouseDown={(e) => {
                              e.preventDefault();
                              addLocation(name);
                            }}
                            className="w-full text-left px-4 py-2.5 hover:bg-red-50 focus:bg-red-50 focus:outline-none transition-all duration-150 flex items-center gap-3 group"
                            style={{ borderBottom: idx < filteredLocalities.length - 1 ? '1px solid #f3f4f6' : 'none' }}
                          >
                            {/* Left accent bar for sub-locality */}
                            <div className={`w-0.5 h-8 rounded-full flex-shrink-0 ${isSubLocality ? 'bg-orange-400' : 'bg-[#d92328]'}`} />
                            {/* Icon */}
                            <div className={`w-7 h-7 rounded-lg flex items-center justify-center flex-shrink-0 ${isSubLocality ? 'bg-orange-50' : 'bg-red-50'} group-hover:scale-110 transition-transform`}>
                              <svg className={`w-3.5 h-3.5 ${isSubLocality ? 'text-orange-500' : 'text-[#d92328]'}`} fill="none" viewBox="0 0 24 24" stroke="currentColor"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" /><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" /></svg>
                            </div>
                            {/* Text */}
                            <div className="flex-1 min-w-0">
                              <div className="text-sm font-semibold text-gray-900 leading-tight">{displayText}</div>
                              <div className="text-xs text-gray-400 mt-0.5 truncate">{loc.subtitle}</div>
                            </div>
                            {/* Badge */}
                            {isSubLocality && (
                              <span className="text-[10px] font-bold text-orange-500 bg-orange-50 border border-orange-200 px-1.5 py-0.5 rounded-full whitespace-nowrap flex-shrink-0">Area</span>
                            )}
                          </button>
                        );
                      })
                    ) : !isLoading && query.trim().length >= 2 ? (
                      <div className="px-5 py-8 text-center">
                        <div className="text-3xl mb-2">🔍</div>
                        <div className="text-gray-600 font-medium text-sm">No results for "{query}"</div>
                        <div className="text-gray-400 text-xs mt-1">Try a different locality name</div>
                      </div>
                    ) : !isLoading ? (
                      <div className="px-4 py-2">
                        <div className="text-xs text-gray-400 uppercase font-bold tracking-wider px-1 pb-1">Popular Areas</div>
                      </div>
                    ) : null}
                  </div>

                  {/* Footer hint */}
                  {!isLoading && filteredLocalities.length > 0 && (
                    <div className="px-4 py-2 border-t border-gray-100 bg-gray-50 flex items-center gap-1.5">
                      <svg className="w-3 h-3 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
                      <span className="text-[11px] text-gray-400">{filteredLocalities.length} locations found · Click to select</span>
                    </div>
                  )}
                </div>
              </div>
            )}
          </div>

          {/* Dropdowns (Desktop Only) */}
          <div className="hidden lg:flex items-center px-5 py-2 border border-gray-300 md:border-l-0 bg-white h-16 cursor-pointer hover:bg-gray-50 transition-colors min-w-[180px] group">
            <Home className="w-5 h-5 text-[#d92328] mr-3" />
            <div className="flex flex-col justify-center">
               <span className="text-gray-800 font-medium text-base">Flat +1</span>
            </div>
            <ChevronDown className="w-4 h-4 text-gray-400 ml-auto group-hover:text-gray-600" />
          </div>

          <div className="hidden md:flex items-center px-5 py-2 border border-gray-300 md:border-l-0 bg-white h-16 cursor-pointer hover:bg-gray-50 transition-colors min-w-[160px] group">
            <IndianRupee className="w-5 h-5 text-[#d92328] mr-3" />
            <div className="flex flex-col justify-center">
               <span className="text-gray-800 font-medium text-base">Budget</span>
            </div>
            <ChevronDown className="w-4 h-4 text-gray-400 ml-auto group-hover:text-gray-600" />
          </div>

          {/* Search Button */}
          <button
            onClick={handleSearch}
            className="w-full md:w-auto h-14 md:h-16 px-12 bg-[#d92328] hover:bg-red-700 text-white md:rounded-r-lg rounded-lg font-bold text-lg md:text-xl transition-colors flex items-center justify-center flex-shrink-0 ml-0 md:ml-[-1px] relative z-10"
          >
            <Search className="w-5 h-5 mr-2 font-bold" /> Search
          </button>
        </div>

        {/* Secondary Sub-filters (NoBroker Style) */}
        {activeTab === 'Buy' && (
          <div className="px-6 py-4 bg-gray-50 border-t border-gray-200 flex flex-wrap gap-x-8 gap-y-3 text-sm text-gray-700 font-semibold items-center rounded-b-xl">
             <label className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors">
               <div className="w-4 h-4 rounded-full border-4 border-[#d92328] bg-white flex-shrink-0"></div> Full House
             </label>
             <label className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors">
               <div className="w-4 h-4 rounded-full border border-gray-400 bg-white flex-shrink-0"></div> Land/Plot
             </label>
             <div className="hidden lg:flex items-center gap-4 ml-4">
                <div className="px-4 py-1.5 border border-gray-200 bg-white rounded flex items-center justify-between min-w-[120px] text-gray-500 font-normal">
                   BHK Type <ChevronDown className="w-4 h-4" />
                </div>
                <div className="px-4 py-1.5 border border-gray-200 bg-white rounded flex items-center justify-between min-w-[140px] text-gray-500 font-normal">
                   Property Status <ChevronDown className="w-4 h-4" />
                </div>
             </div>
             <label className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors ml-auto lg:ml-4">
               <div className="w-4 h-4 border border-gray-400 rounded bg-white flex-shrink-0"></div> New Builder Projects
             </label>
          </div>
        )}
        {activeTab === 'Rent' && (
          <div className="px-6 py-4 bg-gray-50 border-t border-gray-200 flex flex-wrap gap-x-8 gap-y-3 text-sm text-gray-700 font-semibold items-center rounded-b-xl">
             <label className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors">
               <div className="w-4 h-4 rounded-full border-4 border-[#d92328] bg-white flex-shrink-0"></div> Full House
             </label>
             <label className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors">
               <div className="w-4 h-4 rounded-full border border-gray-400 bg-white flex-shrink-0"></div> PG/Hostel
             </label>
             <label className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors">
               <div className="w-4 h-4 rounded-full border border-gray-400 bg-white flex-shrink-0"></div> Flatmates
             </label>
             <div className="hidden lg:flex items-center gap-4 ml-4">
                <div className="px-4 py-1.5 border border-gray-200 bg-white rounded flex items-center justify-between min-w-[120px] text-gray-500 font-normal">
                   BHK Type <ChevronDown className="w-4 h-4" />
                </div>
             </div>
          </div>
        )}
      </div>
      
      {/* Mobile Post Ad Link */}
      <div className="lg:hidden w-full mt-6 flex justify-center">
         <Link to="/add-property" className="text-lg font-bold text-red-600 bg-yellow-400 hover:bg-yellow-500 px-8 py-3.5 rounded-full shadow-[0_4px_20px_rgba(250,204,21,0.5)] transition-all animate-heartbeat">
            Post Free Property Ad
         </Link>
      </div>
    </div>
  );
}
