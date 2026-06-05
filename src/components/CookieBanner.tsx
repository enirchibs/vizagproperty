import { useState, useEffect } from 'react';
import { X } from 'lucide-react';
import { Link } from 'react-router-dom';

export function CookieBanner() {
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    const consent = localStorage.getItem('cookieConsent');
    if (!consent) {
      setIsVisible(true);
    }
  }, []);

  const handleAccept = () => {
    localStorage.setItem('cookieConsent', 'true');
    setIsVisible(false);
  };

  if (!isVisible) return null;

  return (
    <div className="fixed bottom-0 left-0 right-0 bg-gray-900 text-white p-4 sm:p-6 shadow-2xl z-50 animate-slide-up border-t border-gray-800">
      <div className="max-w-7xl mx-auto flex flex-col sm:flex-row items-center justify-between gap-4">
        <div className="flex-1 text-sm sm:text-base text-gray-300">
          We use cookies, including third-party cookies from Google, to personalize content, serve targeted advertisements, and analyze our traffic. By clicking "Accept", you consent to our use of cookies as described in our{' '}
          <Link to="/privacy-policy" className="text-primary-400 hover:text-primary-300 underline underline-offset-2">
            Privacy Policy
          </Link>.
        </div>
        <div className="flex items-center gap-4 w-full sm:w-auto">
          <button
            onClick={handleAccept}
            className="flex-1 sm:flex-none whitespace-nowrap bg-primary-600 hover:bg-primary-700 text-white font-bold py-2 px-8 rounded-full transition-colors"
          >
            Accept
          </button>
          <button
            onClick={() => setIsVisible(false)}
            className="p-2 text-gray-400 hover:text-white transition-colors"
            aria-label="Close"
          >
            <X className="h-6 w-6" />
          </button>
        </div>
      </div>
    </div>
  );
}
