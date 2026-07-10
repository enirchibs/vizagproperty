import { useState, useEffect } from 'react';
import { Phone, X } from 'lucide-react';
import { useLocation } from 'react-router-dom';
import { VIZAG_PROPERTY_PHONE } from '../config/contact';

export function CallBanner() {
  const [isVisible, setIsVisible] = useState(false);
  const [isDismissed, setIsDismissed] = useState(false);
  const location = useLocation();

  // Only show on home page to avoid disturbing search/upload
  const isHomePage = location.pathname === '/';

  useEffect(() => {
    if (isDismissed || !isHomePage) {
      setIsVisible(false);
      return;
    }

    let timeoutId: ReturnType<typeof setTimeout>;

    const cycle = () => {
      setIsVisible(false);
      timeoutId = setTimeout(() => {
        if (!isDismissed) {
          setIsVisible(true);
          // Show for 15 seconds, then hide for 10 seconds
          timeoutId = setTimeout(cycle, 15000); 
        }
      }, 10000); // Wait 10 seconds to appear
    };

    // Initial 10 second delay
    timeoutId = setTimeout(() => {
      if (!isDismissed) {
        setIsVisible(true);
        timeoutId = setTimeout(cycle, 15000);
      }
    }, 10000);

    return () => clearTimeout(timeoutId);
  }, [isDismissed, isHomePage]);

  if (!isVisible || !isHomePage) return null;

  return (
    <div className="fixed right-0 top-1/2 -translate-y-1/2 z-50 transition-opacity duration-500 pr-0">
      <div className="bg-white rounded-l-xl shadow-[0_4px_25px_rgba(0,0,0,0.2)] border border-gray-200 border-r-0 flex items-center pr-3 pl-2 py-1.5 relative">
        
        {/* Dismiss Button */}
        <button 
          onClick={() => {
            setIsVisible(false);
            setIsDismissed(true);
          }}
          className="absolute -top-2.5 -left-2.5 bg-white rounded-full border border-gray-200 text-gray-400 hover:text-gray-600 shadow-sm p-1 z-10"
        >
          <X className="w-3.5 h-3.5" />
        </button>

        <a 
          href={`tel:${VIZAG_PROPERTY_PHONE}`}
          className="flex items-center gap-3 hover:opacity-90 transition-opacity pl-1"
        >
          <div className="bg-green-500 p-2.5 rounded-full animate-pulse shadow-md">
            <Phone className="w-4 h-4 text-white" />
          </div>
          <div className="flex flex-col">
             <span className="text-[11px] text-gray-500 font-semibold uppercase tracking-wider leading-none mb-1">Need Help?</span>
             <span className="text-[#d92328] font-bold text-[15px] leading-none whitespace-nowrap">Call {VIZAG_PROPERTY_PHONE}</span>
          </div>
        </a>
      </div>
    </div>
  );
}
