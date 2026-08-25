import { Phone, MessageCircle, Sparkles, PlusCircle } from 'lucide-react';
import { Link } from 'react-router-dom';
import { openWhatsApp } from '../lib/whatsapp';
import { VIZAG_PROPERTY_PHONE } from '../config/contact';

export function StickyMobileNav() {
  return (
    <div className="md:hidden fixed bottom-0 left-0 right-0 bg-white/95 backdrop-blur-lg border-t border-gray-200/80 z-50 px-2 py-1 pb-safe shadow-[0_-4px_25px_rgba(0,0,0,0.08)]">
      <div className="flex items-center justify-between max-w-md mx-auto">
        <a 
          href={`tel:+91${VIZAG_PROPERTY_PHONE}`} 
          className="flex flex-col items-center justify-center py-1 px-2 text-gray-700 hover:text-blue-600 active:scale-95 transition-all duration-200 w-1/4 group"
        >
          <div className="p-1.5 rounded-full bg-blue-50 group-hover:bg-blue-100 group-active:scale-90 transition-transform shadow-sm">
            <Phone className="w-4 h-4 text-blue-600 animate-pulse" />
          </div>
          <span className="text-[10px] font-extrabold tracking-tight mt-0.5 text-gray-800">Call</span>
        </a>
        
        <button 
          onClick={() => openWhatsApp('Hi VizagProperty, I need assistance with property.')}
          className="flex flex-col items-center justify-center py-1 px-2 text-gray-700 hover:text-green-600 active:scale-95 transition-all duration-200 w-1/4 group"
        >
          <div className="p-1.5 rounded-full bg-green-50 group-hover:bg-green-100 group-active:scale-90 transition-transform shadow-sm">
            <MessageCircle className="w-4 h-4 text-green-600" />
          </div>
          <span className="text-[10px] font-extrabold tracking-tight mt-0.5 text-gray-800">WhatsApp</span>
        </button>

        <Link 
          to="/properties?ai=true" 
          className="flex flex-col items-center justify-center py-1 px-2 text-purple-700 hover:text-purple-900 active:scale-95 transition-all duration-200 w-1/4 relative group"
        >
          <div className="absolute -top-2 bg-gradient-to-r from-purple-600 to-indigo-600 rounded-full p-2 text-white shadow-md shadow-purple-500/40 group-hover:scale-110 group-active:scale-90 transition-transform animate-bounce">
            <Sparkles className="w-4 h-4" />
          </div>
          <span className="text-[10px] font-extrabold tracking-tight mt-3 text-purple-700">AI Chat</span>
        </Link>

        <Link 
          to="/add-property" 
          className="flex flex-col items-center justify-center py-1 px-2 text-gray-700 hover:text-orange-600 active:scale-95 transition-all duration-200 w-1/4 group"
        >
          <div className="p-1.5 rounded-full bg-orange-50 group-hover:bg-orange-100 group-active:scale-90 transition-transform shadow-sm">
            <PlusCircle className="w-4 h-4 text-orange-600" />
          </div>
          <span className="text-[10px] font-extrabold tracking-tight mt-0.5 text-gray-800">Post</span>
        </Link>
      </div>
    </div>
  );
}
