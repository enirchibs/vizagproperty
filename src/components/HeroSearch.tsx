import React, { useState, useRef, useEffect } from 'react';
import { Search, MapPin, Home, IndianRupee, X, ChevronDown } from 'lucide-react';
import { useNavigate, Link } from 'react-router-dom';

const VIZAG_LOCALITIES = [
  'Madhurawada', 'Yendada', 'MVP Colony', 'Gajuwaka', 'Rushikonda', 
  'Seethammadhara', 'PM Palem', 'Lawsons Bay Colony', 'Akkayyapalem', 
  'Kancharapalem', 'Bheemili', 'Pendurthi', 'Bhogapuram', 'Kurmannapalem',
  'Sujatha Nagar', 'NAD Junction', 'Murali Nagar'
];

type TabType = 'Buy' | 'Rent' | 'New Projects' | 'PG' | 'Plot' | 'Commercial';

export function HeroSearch() {
  const [activeTab, setActiveTab] = useState<TabType>('Buy');
  const [query, setQuery] = useState('');
  const [selectedLocations, setSelectedLocations] = useState<string[]>(['Vizag']);
  const [showDropdown, setShowDropdown] = useState(false);
  const [filteredLocalities, setFilteredLocalities] = useState<string[]>([]);
  const navigate = useNavigate();
  const wrapperRef = useRef<HTMLDivElement>(null);

  const tabs: TabType[] = ['Buy', 'Rent', 'New Projects', 'PG', 'Plot', 'Commercial'];

  useEffect(() => {
    if (query) {
      setFilteredLocalities(
        VIZAG_LOCALITIES.filter(loc => loc.toLowerCase().includes(query.toLowerCase()) && !selectedLocations.includes(loc))
      );
      setShowDropdown(true);
    } else {
      setFilteredLocalities(VIZAG_LOCALITIES.filter(loc => !selectedLocations.includes(loc)).slice(0, 5));
    }
  }, [query, selectedLocations]);

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (wrapperRef.current && !wrapperRef.current.contains(event.target as Node)) {
        setShowDropdown(false);
      }
    }
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, [wrapperRef]);

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
  };

  const removeLocation = (loc: string) => {
    setSelectedLocations(selectedLocations.filter(l => l !== loc));
  };

  return (
    <div className="w-full max-w-5xl mx-auto mt-8 flex flex-col relative z-20" ref={wrapperRef}>
      
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
          <Link to="/add-property" className="text-lg font-bold text-red-600 bg-yellow-400 hover:bg-yellow-500 px-6 py-2.5 rounded-lg transition-colors shadow-lg">
            Post Free Property Ad
          </Link>
        </div>
      </div>

      <div className="w-full bg-white rounded-xl md:rounded-tl-none shadow-2xl overflow-hidden border border-gray-200 relative z-0">
        
        {/* Main Search Inputs */}
        <div className="p-3 md:p-4 flex flex-col md:flex-row items-center relative gap-3 md:gap-0">
          
          {/* Location Section */}
          <div className="flex-1 flex items-center px-4 py-2 min-w-0 w-full relative border md:border-r-0 border-gray-300 rounded-lg md:rounded-r-none md:rounded-l-lg bg-white h-14 md:h-16">
            <MapPin className="w-5 h-5 text-[#d92328] flex-shrink-0 mr-2" />
            
            <div className="flex flex-wrap items-center gap-2 flex-1 min-w-0 overflow-x-auto no-scrollbar">
              {selectedLocations.map(loc => (
                <span key={loc} className="flex items-center gap-1 bg-red-50 text-[#d92328] px-3 py-1.5 rounded-md text-sm font-semibold whitespace-nowrap border border-red-100">
                  {loc}
                  <button onClick={() => removeLocation(loc)} className="hover:bg-red-200 rounded p-0.5 transition-colors ml-1">
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
                }}
                onFocus={() => setShowDropdown(true)}
                placeholder={selectedLocations.length === 0 ? "Search upto 3 localities or landmarks..." : "Add more..."}
                className="flex-1 min-w-[200px] bg-transparent border-none outline-none text-gray-800 placeholder:text-gray-400 text-base font-medium"
              />
            </div>

            {/* Autocomplete Dropdown */}
            {showDropdown && (
              <div className="absolute top-[100%] left-0 mt-2 w-full md:w-[450px] bg-white rounded-lg shadow-xl border border-gray-200 py-2 z-50 max-h-[300px] overflow-y-auto">
                <div className="px-5 py-2 text-xs font-bold text-gray-500 uppercase tracking-wider">Location</div>
                {filteredLocalities.length > 0 ? (
                  filteredLocalities.map((loc, idx) => {
                     const matchIndex = loc.toLowerCase().indexOf(query.toLowerCase());
                     let displayText = loc;
                     if (query && matchIndex !== -1) {
                        const before = loc.substring(0, matchIndex);
                        const match = loc.substring(matchIndex, matchIndex + query.length);
                        const after = loc.substring(matchIndex + query.length);
                        displayText = <>{before}<span className="text-[#d92328] font-bold">{match}</span>{after}</> as any;
                     }

                     return (
                      <button
                        key={idx}
                        onClick={() => addLocation(loc)}
                        className="w-full text-left px-5 py-3.5 hover:bg-red-50 text-gray-700 focus:bg-red-50 focus:outline-none transition-colors border-b border-gray-50 last:border-0"
                      >
                        {displayText}<span className="text-gray-500 text-sm">, Visakhapatnam</span>
                      </button>
                    );
                  })
                ) : (
                  <div className="px-5 py-4 text-gray-500 text-sm text-center font-medium">No localities found matching "{query}"</div>
                )}
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
          <div className="px-6 py-4 bg-gray-50 border-t border-gray-200 flex flex-wrap gap-x-8 gap-y-3 text-sm text-gray-700 font-semibold items-center">
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
          <div className="px-6 py-4 bg-gray-50 border-t border-gray-200 flex flex-wrap gap-x-8 gap-y-3 text-sm text-gray-700 font-semibold items-center">
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
         <Link to="/add-property" className="text-lg font-bold text-red-600 bg-yellow-400 hover:bg-yellow-500 px-8 py-3.5 rounded-full shadow-[0_4px_20px_rgba(250,204,21,0.5)] transition-all">
            Post Free Property Ad
         </Link>
      </div>
    </div>
  );
}
