import React, { useState } from 'react';
import { Search, Mic, Sparkles, MessageCircle } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import { openWhatsApp } from '../lib/whatsapp';
import { useVoiceSearch } from '../hooks/useVoiceSearch';

export function HeroSearch() {
  const [query, setQuery] = useState('');
  const navigate = useNavigate();
  const { isListening, transcript, startListening, stopListening, isSupported } = useVoiceSearch();

  React.useEffect(() => {
    if (transcript) {
      setQuery(transcript);
    }
  }, [transcript]);

  const handleSearch = (e?: React.FormEvent) => {
    if (e) e.preventDefault();
    if (query.trim()) {
      navigate(`/properties?q=${encodeURIComponent(query)}`);
    }
  };

  const chips = [
    'VMRDA Plots', '2 BHK Flats', '3 BHK Flats', 'Luxury Villas',
    'Commercial Space', 'Properties for Rent', 'Sea View Homes', 'Under 50 Lakhs'
  ];

  const handleVoiceToggle = () => {
    if (isListening) {
      stopListening();
    } else {
      startListening();
    }
  };

  return (
    <div className="w-full max-w-4xl mx-auto flex flex-col items-center">
      <form 
        onSubmit={handleSearch}
        className="relative w-full bg-white/10 backdrop-blur-md border border-white/20 rounded-full shadow-[0_8px_32px_rgba(0,0,0,0.12)] hover:shadow-[0_8px_32px_rgba(15,82,186,0.3)] transition-all duration-300 overflow-hidden flex items-center p-1 md:p-2"
      >
        <div className="pl-4 pr-2 text-white/70">
          <Search className="w-6 h-6 md:w-8 md:h-8" />
        </div>
        
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search localities, builders, projects, or '3BHK near beach'..."
          className="flex-1 bg-transparent border-none outline-none text-white placeholder:text-white/60 text-lg md:text-2xl px-2 py-3 md:py-4 font-medium min-w-0"
        />

        <div className="flex items-center gap-1 md:gap-2 pr-2">
          {isSupported && (
            <button
              type="button"
              onClick={handleVoiceToggle}
              className={`p-2.5 md:p-3 rounded-full transition-colors ${
                isListening ? 'bg-red-500 text-white animate-pulse' : 'bg-white/10 text-white hover:bg-white/20'
              }`}
              title="Voice Search"
            >
              <Mic className="w-5 h-5 md:w-6 md:h-6" />
            </button>
          )}
          
          <button
            type="button"
            onClick={() => navigate('/properties?ai=true')}
            className="hidden md:flex p-2.5 md:p-3 rounded-full bg-gradient-to-r from-purple-500 to-indigo-500 text-white hover:opacity-90 transition-opacity items-center gap-2"
            title="AI Search"
          >
            <Sparkles className="w-5 h-5 md:w-6 md:h-6" />
            <span className="font-bold hidden lg:inline">AI Search</span>
          </button>

          <button
            type="button"
            onClick={() => openWhatsApp('Hi, I am looking for properties in Vizag. Can you help me search?')}
            className="p-2.5 md:p-3 rounded-full bg-green-500 text-white hover:bg-green-600 transition-colors"
            title="WhatsApp Search"
          >
            <MessageCircle className="w-5 h-5 md:w-6 md:h-6" />
          </button>
          
          <button
            type="submit"
            className="hidden sm:block ml-1 px-6 md:px-8 py-3 md:py-4 bg-primary-600 hover:bg-primary-500 text-white rounded-full font-bold text-lg transition-colors shadow-lg"
          >
            Search
          </button>
        </div>
      </form>

      {/* Popular Search Chips */}
      <div className="mt-6 md:mt-8 flex flex-wrap justify-center gap-2 md:gap-3 w-full max-w-3xl">
        {chips.map((chip) => (
          <button
            key={chip}
            onClick={() => {
              setQuery(chip);
              navigate(`/properties?q=${encodeURIComponent(chip)}`);
            }}
            className="px-4 py-1.5 md:px-5 md:py-2 bg-white/10 hover:bg-white/25 border border-white/20 text-white rounded-full text-sm md:text-base font-medium backdrop-blur-sm transition-all hover:scale-105"
          >
            {chip}
          </button>
        ))}
      </div>
    </div>
  );
}
