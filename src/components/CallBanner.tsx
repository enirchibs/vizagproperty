import { useState, useEffect } from 'react';
import { Phone, X } from 'lucide-react';
import { VIZAG_PROPERTY_PHONE } from '../config/contact';

export function CallBanner() {
  const [isVisible, setIsVisible] = useState(false);
  const [isDismissed, setIsDismissed] = useState(false);

  useEffect(() => {
    if (isDismissed) return;

    let timeoutId: ReturnType<typeof setTimeout>;

    const cycle = () => {
      setIsVisible(false);
      timeoutId = setTimeout(() => {
        if (!isDismissed) {
          setIsVisible(true);
          timeoutId = setTimeout(cycle, 5000); // Show for 5 seconds
        }
      }, 3000); // Hide for 3 seconds
    };

    // Initial 3 second delay
    timeoutId = setTimeout(() => {
      if (!isDismissed) {
        setIsVisible(true);
        timeoutId = setTimeout(cycle, 5000); // Show for 5 seconds
      }
    }, 3000);

    return () => clearTimeout(timeoutId);
  }, [isDismissed]);

  if (!isVisible) return null;

  return (
    <div className="fixed bottom-0 left-0 w-full md:w-auto md:left-1/2 md:-translate-x-1/2 md:bottom-6 z-40 p-4 md:p-0 pointer-events-none mb-16 md:mb-0">
      <div className="bg-blue-900 text-white rounded-xl shadow-[0_10px_40px_rgba(0,0,0,0.5)] overflow-hidden flex flex-col md:flex-row items-center justify-between p-4 pointer-events-auto border-t-4 border-t-yellow-400 relative">
        <button 
          onClick={() => {
            setIsVisible(false);
            setIsDismissed(true);
          }}
          className="absolute top-2 right-2 text-white/70 hover:text-white"
        >
          <X className="w-5 h-5" />
        </button>
        <div className="flex items-center space-x-3 mb-3 md:mb-0 md:mr-6 w-full pr-6">
          <div className="bg-green-500 p-2.5 rounded-full animate-pulse shadow-lg flex-shrink-0">
            <Phone className="w-5 h-5 md:w-6 md:h-6 text-white" />
          </div>
          <div className="flex-1">
            <h3 className="font-bold text-base md:text-lg leading-tight">Looking for Property?</h3>
            <p className="text-blue-200 text-xs md:text-sm">Talk to our experts for free guidance</p>
          </div>
        </div>
        <a 
          href={`tel:${VIZAG_PROPERTY_PHONE}`}
          className="w-full md:w-auto bg-yellow-400 hover:bg-yellow-500 text-red-600 font-bold text-lg md:text-xl px-6 py-2.5 md:py-3 rounded-lg transition-all shadow-lg text-center flex items-center justify-center gap-2 whitespace-nowrap animate-heartbeat"
        >
          <Phone className="w-5 h-5 animate-bounce" />
          Call Now {VIZAG_PROPERTY_PHONE}
        </a>
      </div>
    </div>
  );
}
