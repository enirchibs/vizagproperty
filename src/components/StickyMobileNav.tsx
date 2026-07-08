import { Phone, MessageCircle, Sparkles, PlusCircle } from 'lucide-react';
import { Link } from 'react-router-dom';
import { openWhatsApp } from '../lib/whatsapp';

export function StickyMobileNav() {
  return (
    <div className="md:hidden fixed bottom-0 left-0 right-0 bg-white/90 backdrop-blur-md border-t border-gray-200 z-50 px-2 py-2 pb-safe shadow-[0_-4px_20px_rgba(0,0,0,0.05)]">
      <div className="flex items-center justify-between max-w-md mx-auto">
        <a 
          href="tel:+918074900890" 
          className="flex flex-col items-center justify-center p-2 text-gray-600 hover:text-primary-600 w-1/4"
        >
          <Phone className="w-6 h-6 mb-1 text-blue-500" />
          <span className="text-[10px] font-semibold">Call</span>
        </a>
        
        <button 
          onClick={() => openWhatsApp('Hi VizagProperty, I need assistance.')}
          className="flex flex-col items-center justify-center p-2 text-gray-600 hover:text-green-600 w-1/4"
        >
          <MessageCircle className="w-6 h-6 mb-1 text-green-500" />
          <span className="text-[10px] font-semibold">WhatsApp</span>
        </button>

        <Link 
          to="/properties?ai=true" 
          className="flex flex-col items-center justify-center p-2 text-gray-600 hover:text-purple-600 w-1/4 relative"
        >
          <div className="absolute -top-3 bg-purple-500 rounded-full p-2 text-white shadow-lg shadow-purple-500/40">
            <Sparkles className="w-5 h-5" />
          </div>
          <span className="text-[10px] font-semibold mt-4">AI Chat</span>
        </Link>

        <Link 
          to="/add-property" 
          className="flex flex-col items-center justify-center p-2 text-gray-600 hover:text-orange-600 w-1/4"
        >
          <PlusCircle className="w-6 h-6 mb-1 text-orange-500" />
          <span className="text-[10px] font-semibold">Post</span>
        </Link>
      </div>
    </div>
  );
}
