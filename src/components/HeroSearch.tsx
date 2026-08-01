import React, { useState, useRef, useEffect } from 'react';
import { Search, MapPin, Home, IndianRupee, X, ChevronDown, Check } from 'lucide-react';
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

interface BudgetOption {
  label: string;
  minPrice?: number;
  maxPrice?: number;
}

const BUDGET_OPTIONS: BudgetOption[] = [
  { label: 'Budget (All)' },
  { label: 'Under ₹20 Lakhs', maxPrice: 2000000 },
  { label: '₹20L - ₹50 Lakhs', minPrice: 2000000, maxPrice: 5000000 },
  { label: '₹50L - ₹1 Crore', minPrice: 5000000, maxPrice: 10000000 },
  { label: 'Above ₹1 Crore', minPrice: 10000000 },
];

const PROPERTY_TYPES = [
  { label: 'All Property Types', value: '' },
  { label: 'Flat / Apartment', value: 'flat' },
  { label: 'House / Villa', value: 'villa' },
  { label: 'Land / Plot', value: 'plot' },
  { label: 'PG / Hostel', value: 'pg' },
  { label: 'Commercial Space', value: 'commercial' },
];

export function HeroSearch({ onDropdownToggle }: { onDropdownToggle?: (open: boolean) => void } = {}) {
  const [activeTab, setActiveTab] = useState<TabType>('Buy');
  const [query, setQuery] = useState('');
  const [selectedLocations, setSelectedLocations] = useState<string[]>(['Vizag']);
  const [showLocationDropdown, setShowLocationDropdown] = useState(false);
  const [filteredLocalities, setFilteredLocalities] = useState<LocationSuggestion[]>([]);
  const [isLoading, setIsLoading] = useState(false);

  // Interactive Sub-filter state
  const [selectedPropertyType, setSelectedPropertyType] = useState<string>(''); // '', 'flat', 'villa', 'plot', 'pg', 'commercial'
  const [selectedBhk, setSelectedBhk] = useState<string>(''); // '', '1', '2', '3', '4'
  const [selectedStatus, setSelectedStatus] = useState<string>(''); // '', 'ready_to_move', 'under_construction'
  const [newBuilderProjects, setNewBuilderProjects] = useState<boolean>(false);
  const [selectedBudget, setSelectedBudget] = useState<BudgetOption>(BUDGET_OPTIONS[0]);

  // Dropdown open states
  const [openDropdown, setOpenDropdown] = useState<'type' | 'budget' | 'bhk' | 'status' | null>(null);

  const navigate = useNavigate();
  const wrapperRef = useRef<HTMLDivElement>(null);

  const tabs: TabType[] = ['Buy', 'Rent', 'New Projects', 'PG', 'Plot', 'Commercial'];

  const handleTabChange = (tab: TabType) => {
    setActiveTab(tab);
    setOpenDropdown(null);
    if (tab === 'Plot') {
      setSelectedPropertyType('plot');
    } else if (tab === 'PG') {
      setSelectedPropertyType('pg');
    } else if (tab === 'Commercial') {
      setSelectedPropertyType('commercial');
    } else {
      setSelectedPropertyType('');
    }
  };

  useEffect(() => {
    if (!query.trim()) {
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
        setShowLocationDropdown(false);
        setOpenDropdown(null);
        onDropdownToggle?.(false);
      }
    }
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [wrapperRef, onDropdownToggle]);

  const handleSearch = (e?: React.FormEvent) => {
    if (e) e.preventDefault();

    const params = new URLSearchParams();

    // 1. Listing Type
    if (activeTab === 'Rent' || activeTab === 'PG') {
      params.append('listingType', 'rent');
    } else {
      params.append('listingType', 'sale');
    }

    // 2. Property Type
    let finalPropType = selectedPropertyType;
    if (!finalPropType) {
      if (activeTab === 'Plot') finalPropType = 'plot';
      else if (activeTab === 'PG') finalPropType = 'pg';
      else if (activeTab === 'Commercial') finalPropType = 'commercial';
    }
    if (finalPropType) {
      params.append('propertyType', finalPropType);
    }

    // 3. Location / Search query
    const specificLocations = selectedLocations.filter(loc => loc.toLowerCase() !== 'vizag');
    if (specificLocations.length > 0) {
      params.append('locality', specificLocations.join(', '));
    }
    if (query.trim()) {
      params.append('q', query.trim());
    }

    // 4. BHK
    if (selectedBhk) {
      params.append('bhk', selectedBhk);
    }

    // 5. Budget
    if (selectedBudget.minPrice) {
      params.append('minPrice', selectedBudget.minPrice.toString());
    }
    if (selectedBudget.maxPrice) {
      params.append('maxPrice', selectedBudget.maxPrice.toString());
    }

    // 6. Property status / New builder projects
    if (selectedStatus) {
      params.append('status', selectedStatus);
    }
    if (newBuilderProjects || activeTab === 'New Projects') {
      params.append('status', 'new_projects');
    }

    navigate(`/properties?${params.toString()}`);
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
    setShowLocationDropdown(false);
    onDropdownToggle?.(false);
  };

  const removeLocation = (loc: string) => {
    setSelectedLocations(selectedLocations.filter(l => l !== loc));
  };

  const getPropTypeLabel = () => {
    const match = PROPERTY_TYPES.find(p => p.value === selectedPropertyType);
    return match ? match.label : 'Flat / Plot';
  };

  return (
    <div className="w-full max-w-5xl mx-auto mt-8 flex flex-col relative z-[200]" ref={wrapperRef}>
      
      {/* Folder Tabs (NoBroker Style) */}
      <div className="flex overflow-x-auto no-scrollbar items-end pl-0 md:pl-4">
        {tabs.map((tab) => (
          <button
            key={tab}
            onClick={() => handleTabChange(tab)}
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
                  setShowLocationDropdown(true);
                  setOpenDropdown(null);
                  onDropdownToggle?.(true);
                }}
                onFocus={() => {
                  setShowLocationDropdown(true);
                  setOpenDropdown(null);
                  onDropdownToggle?.(true);
                }}
                placeholder={selectedLocations.length === 0 ? "Search locality, area or landmark..." : "+ Add area"}
                className="flex-1 min-w-[120px] bg-transparent border-none outline-none text-gray-800 placeholder:text-gray-400 text-sm font-medium"
              />
            </div>

            {/* Autocomplete Dropdown */}
            {showLocationDropdown && (
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
                  }}
                >
                  <div style={{ background: 'linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%)' }} className="px-4 py-3 flex items-center justify-between">
                    <div className="flex items-center gap-2">
                      <MapPin className="w-4 h-4 text-red-400" />
                      <span className="text-white text-xs font-bold tracking-widest uppercase">Select Location</span>
                    </div>
                    {isLoading && (
                      <div className="flex items-center gap-1.5 text-gray-400 text-xs">
                        <span className="text-gray-300">Searching...</span>
                      </div>
                    )}
                  </div>

                  <div className="max-h-[360px] overflow-y-auto">
                    {!isLoading && filteredLocalities.length > 0 ? (
                      filteredLocalities.map((loc, idx) => (
                        <button
                          key={idx}
                          onMouseDown={(e) => {
                            e.preventDefault();
                            addLocation(loc.name);
                          }}
                          className="w-full text-left px-4 py-2.5 hover:bg-red-50 focus:bg-red-50 focus:outline-none transition-all flex items-center gap-3 group border-b border-gray-100 last:border-none"
                        >
                          <div className="w-7 h-7 rounded-lg bg-red-50 flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-transform">
                            <MapPin className="w-3.5 h-3.5 text-[#d92328]" />
                          </div>
                          <div className="flex-1 min-w-0">
                            <div className="text-sm font-semibold text-gray-900 leading-tight">{loc.name}</div>
                            <div className="text-xs text-gray-400 mt-0.5 truncate">{loc.subtitle}</div>
                          </div>
                        </button>
                      ))
                    ) : (
                      <div className="px-4 py-3 text-sm text-gray-500 text-center">No matching locations</div>
                    )}
                  </div>
                </div>
              </div>
            )}
          </div>

          {/* Property Type Dropdown (Interactive) */}
          <div className="relative hidden lg:block">
            <div 
              onClick={() => {
                setShowLocationDropdown(false);
                setOpenDropdown(openDropdown === 'type' ? null : 'type');
              }}
              className="flex items-center px-5 py-2 border border-gray-300 md:border-l-0 bg-white h-16 cursor-pointer hover:bg-gray-50 transition-colors min-w-[180px] group"
            >
              <Home className="w-5 h-5 text-[#d92328] mr-3" />
              <div className="flex flex-col justify-center">
                 <span className="text-gray-800 font-medium text-sm truncate max-w-[110px]">{getPropTypeLabel()}</span>
              </div>
              <ChevronDown className={`w-4 h-4 text-gray-400 ml-auto group-hover:text-gray-600 transition-transform ${openDropdown === 'type' ? 'rotate-180' : ''}`} />
            </div>

            {openDropdown === 'type' && (
              <div className="absolute top-full left-0 w-56 bg-white rounded-xl shadow-2xl border border-gray-200 py-2 z-[9999] mt-1">
                {PROPERTY_TYPES.map((pt) => (
                  <button
                    key={pt.value}
                    onClick={() => {
                      setSelectedPropertyType(pt.value);
                      setOpenDropdown(null);
                    }}
                    className={`w-full text-left px-4 py-2.5 text-sm font-medium flex items-center justify-between hover:bg-red-50 hover:text-[#d92328] transition-colors ${selectedPropertyType === pt.value ? 'bg-red-50 text-[#d92328] font-bold' : 'text-gray-700'}`}
                  >
                    <span>{pt.label}</span>
                    {selectedPropertyType === pt.value && <Check className="w-4 h-4 text-[#d92328]" />}
                  </button>
                ))}
              </div>
            )}
          </div>

          {/* Budget Dropdown (Interactive) */}
          <div className="relative hidden md:block">
            <div 
              onClick={() => {
                setShowLocationDropdown(false);
                setOpenDropdown(openDropdown === 'budget' ? null : 'budget');
              }}
              className="flex items-center px-5 py-2 border border-gray-300 md:border-l-0 bg-white h-16 cursor-pointer hover:bg-gray-50 transition-colors min-w-[160px] group"
            >
              <IndianRupee className="w-5 h-5 text-[#d92328] mr-3" />
              <div className="flex flex-col justify-center">
                 <span className="text-gray-800 font-medium text-sm truncate max-w-[100px]">{selectedBudget.label}</span>
              </div>
              <ChevronDown className={`w-4 h-4 text-gray-400 ml-auto group-hover:text-gray-600 transition-transform ${openDropdown === 'budget' ? 'rotate-180' : ''}`} />
            </div>

            {openDropdown === 'budget' && (
              <div className="absolute top-full left-0 w-60 bg-white rounded-xl shadow-2xl border border-gray-200 py-2 z-[9999] mt-1">
                {BUDGET_OPTIONS.map((opt) => (
                  <button
                    key={opt.label}
                    onClick={() => {
                      setSelectedBudget(opt);
                      setOpenDropdown(null);
                    }}
                    className={`w-full text-left px-4 py-2.5 text-sm font-medium flex items-center justify-between hover:bg-red-50 hover:text-[#d92328] transition-colors ${selectedBudget.label === opt.label ? 'bg-red-50 text-[#d92328] font-bold' : 'text-gray-700'}`}
                  >
                    <span>{opt.label}</span>
                    {selectedBudget.label === opt.label && <Check className="w-4 h-4 text-[#d92328]" />}
                  </button>
                ))}
              </div>
            )}
          </div>

          {/* Search Button */}
          <button
            onClick={handleSearch}
            className="w-full md:w-auto h-14 md:h-16 px-12 bg-[#d92328] hover:bg-red-700 text-white md:rounded-r-lg rounded-lg font-bold text-lg md:text-xl transition-colors flex items-center justify-center flex-shrink-0 ml-0 md:ml-[-1px] relative z-10"
          >
            <Search className="w-5 h-5 mr-2 font-bold" /> Search
          </button>
        </div>

        {/* Secondary Sub-filters (Interactive NoBroker Style) */}
        {activeTab === 'Buy' && (
          <div className="px-6 py-4 bg-gray-50 border-t border-gray-200 flex flex-wrap gap-x-8 gap-y-3 text-sm text-gray-700 font-semibold items-center rounded-b-xl">
             <button 
               type="button"
               onClick={() => setSelectedPropertyType(prev => prev === 'villa' ? '' : 'villa')}
               className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors focus:outline-none"
             >
               <div className={`w-4 h-4 rounded-full flex-shrink-0 transition-all ${selectedPropertyType === 'villa' ? 'border-4 border-[#d92328] bg-white' : 'border border-gray-400 bg-white'}`}></div> Full House
             </button>

             <button 
               type="button"
               onClick={() => setSelectedPropertyType(prev => prev === 'flat' ? '' : 'flat')}
               className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors focus:outline-none"
             >
               <div className={`w-4 h-4 rounded-full flex-shrink-0 transition-all ${selectedPropertyType === 'flat' ? 'border-4 border-[#d92328] bg-white' : 'border border-gray-400 bg-white'}`}></div> Flat / Apartment
             </button>

             <button 
               type="button"
               onClick={() => setSelectedPropertyType(prev => prev === 'plot' ? '' : 'plot')}
               className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors focus:outline-none"
             >
               <div className={`w-4 h-4 rounded-full flex-shrink-0 transition-all ${selectedPropertyType === 'plot' ? 'border-4 border-[#d92328] bg-white' : 'border border-gray-400 bg-white'}`}></div> Land/Plot
             </button>

             {/* BHK Dropdown */}
             <div className="relative hidden lg:block">
                <button
                   type="button"
                   onClick={() => setOpenDropdown(openDropdown === 'bhk' ? null : 'bhk')}
                   className="px-4 py-1.5 border border-gray-200 bg-white rounded flex items-center justify-between min-w-[120px] text-gray-700 font-normal hover:border-gray-300"
                >
                   <span>{selectedBhk ? `${selectedBhk} BHK` : 'BHK Type'}</span>
                   <ChevronDown className="w-4 h-4 ml-2 text-gray-400" />
                </button>
                {openDropdown === 'bhk' && (
                  <div className="absolute top-full left-0 w-36 bg-white rounded-lg shadow-xl border border-gray-200 py-1 z-[9999] mt-1">
                    {['', '1', '2', '3', '4'].map(bhk => (
                      <button
                        key={bhk}
                        onClick={() => { setSelectedBhk(bhk); setOpenDropdown(null); }}
                        className={`w-full text-left px-3 py-1.5 text-xs font-medium hover:bg-red-50 hover:text-[#d92328] ${selectedBhk === bhk ? 'bg-red-50 text-[#d92328] font-bold' : 'text-gray-700'}`}
                      >
                        {bhk ? `${bhk} BHK` : 'Any BHK'}
                      </button>
                    ))}
                  </div>
                )}
             </div>

             {/* Status Dropdown */}
             <div className="relative hidden lg:block">
                <button
                   type="button"
                   onClick={() => setOpenDropdown(openDropdown === 'status' ? null : 'status')}
                   className="px-4 py-1.5 border border-gray-200 bg-white rounded flex items-center justify-between min-w-[140px] text-gray-700 font-normal hover:border-gray-300"
                >
                   <span>{selectedStatus === 'ready_to_move' ? 'Ready to Move' : selectedStatus === 'under_construction' ? 'Under Construction' : 'Property Status'}</span>
                   <ChevronDown className="w-4 h-4 ml-2 text-gray-400" />
                </button>
                {openDropdown === 'status' && (
                  <div className="absolute top-full left-0 w-44 bg-white rounded-lg shadow-xl border border-gray-200 py-1 z-[9999] mt-1">
                    {[
                      { label: 'Any Status', value: '' },
                      { label: 'Ready to Move', value: 'ready_to_move' },
                      { label: 'Under Construction', value: 'under_construction' }
                    ].map(st => (
                      <button
                        key={st.value}
                        onClick={() => { setSelectedStatus(st.value); setOpenDropdown(null); }}
                        className={`w-full text-left px-3 py-1.5 text-xs font-medium hover:bg-red-50 hover:text-[#d92328] ${selectedStatus === st.value ? 'bg-red-50 text-[#d92328] font-bold' : 'text-gray-700'}`}
                      >
                        {st.label}
                      </button>
                    ))}
                  </div>
                )}
             </div>

             <button 
               type="button"
               onClick={() => setNewBuilderProjects(!newBuilderProjects)}
               className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors ml-auto lg:ml-4 focus:outline-none"
             >
               <div className={`w-4 h-4 border rounded flex items-center justify-center flex-shrink-0 transition-colors ${newBuilderProjects ? 'bg-[#d92328] border-[#d92328] text-white' : 'border-gray-400 bg-white'}`}>
                 {newBuilderProjects && <Check className="w-3 h-3" />}
               </div> New Builder Projects
             </button>
          </div>
        )}

        {activeTab === 'Rent' && (
          <div className="px-6 py-4 bg-gray-50 border-t border-gray-200 flex flex-wrap gap-x-8 gap-y-3 text-sm text-gray-700 font-semibold items-center rounded-b-xl">
             <button 
               type="button"
               onClick={() => setSelectedPropertyType(prev => prev === 'flat' ? '' : 'flat')}
               className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors focus:outline-none"
             >
               <div className={`w-4 h-4 rounded-full flex-shrink-0 transition-all ${selectedPropertyType === 'flat' ? 'border-4 border-[#d92328] bg-white' : 'border border-gray-400 bg-white'}`}></div> House / Flat
             </button>

             <button 
               type="button"
               onClick={() => setSelectedPropertyType(prev => prev === 'pg' ? '' : 'pg')}
               className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors focus:outline-none"
             >
               <div className={`w-4 h-4 rounded-full flex-shrink-0 transition-all ${selectedPropertyType === 'pg' ? 'border-4 border-[#d92328] bg-white' : 'border border-gray-400 bg-white'}`}></div> PG/Hostel
             </button>

             <button 
               type="button"
               onClick={() => setSelectedPropertyType(prev => prev === 'pg' ? '' : 'pg')}
               className="flex items-center gap-2 cursor-pointer hover:text-[#d92328] transition-colors focus:outline-none"
             >
               <div className={`w-4 h-4 rounded-full flex-shrink-0 transition-all ${selectedPropertyType === 'pg' ? 'border-4 border-[#d92328] bg-white' : 'border border-gray-400 bg-white'}`}></div> Flatmates
             </button>

             {/* BHK Dropdown */}
             <div className="relative hidden lg:block">
                <button
                   type="button"
                   onClick={() => setOpenDropdown(openDropdown === 'bhk' ? null : 'bhk')}
                   className="px-4 py-1.5 border border-gray-200 bg-white rounded flex items-center justify-between min-w-[120px] text-gray-700 font-normal hover:border-gray-300"
                >
                   <span>{selectedBhk ? `${selectedBhk} BHK` : 'BHK Type'}</span>
                   <ChevronDown className="w-4 h-4 ml-2 text-gray-400" />
                </button>
                {openDropdown === 'bhk' && (
                  <div className="absolute top-full left-0 w-36 bg-white rounded-lg shadow-xl border border-gray-200 py-1 z-[9999] mt-1">
                    {['', '1', '2', '3', '4'].map(bhk => (
                      <button
                        key={bhk}
                        onClick={() => { setSelectedBhk(bhk); setOpenDropdown(null); }}
                        className={`w-full text-left px-3 py-1.5 text-xs font-medium hover:bg-red-50 hover:text-[#d92328] ${selectedBhk === bhk ? 'bg-red-50 text-[#d92328] font-bold' : 'text-gray-700'}`}
                      >
                        {bhk ? `${bhk} BHK` : 'Any BHK'}
                      </button>
                    ))}
                  </div>
                )}
             </div>
          </div>
        )}

        {(activeTab === 'Plot' || activeTab === 'PG' || activeTab === 'Commercial' || activeTab === 'New Projects') && (
          <div className="px-6 py-4 bg-gray-50 border-t border-gray-200 flex flex-wrap gap-x-6 gap-y-3 text-sm text-gray-700 font-semibold items-center rounded-b-xl">
             <span className="text-gray-500 text-xs uppercase tracking-wider">Quick Search:</span>
             <button
               type="button"
               onClick={handleSearch}
               className="px-3 py-1 bg-white border border-gray-300 rounded-full text-xs font-semibold text-gray-800 hover:border-[#d92328] hover:text-[#d92328] transition-colors"
             >
               All {activeTab}
             </button>
          </div>
        )}
      </div>
      
      {/* Mobile Post Ad Link */}
      {!showLocationDropdown && (
        <div className="lg:hidden w-full mt-6 flex justify-center">
           <Link to="/add-property" className="text-lg font-bold text-red-600 bg-yellow-400 hover:bg-yellow-500 px-8 py-3.5 rounded-full shadow-[0_4px_20px_rgba(250,204,21,0.5)] transition-all animate-heartbeat">
              Post Free Property Ad
           </Link>
        </div>
      )}
    </div>
  );
}
