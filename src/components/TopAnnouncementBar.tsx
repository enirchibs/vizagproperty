import { useState, useEffect } from 'react'
import { Phone } from 'lucide-react'
import { useLocation } from 'react-router-dom'

export function TopAnnouncementBar() {
  const location = useLocation();
  const hideOnRoutes = ['/add-property', '/post-property'];

  const items = [
    { text: "Call Now", lang: "English" },
    { text: "ఇప్పుడే కాల్ చేయండి", lang: "Telugu" },
    { text: "अभी कॉल करें", lang: "Hindi" },
    { text: "ఇప్పుడే కాల్ చేయండి", lang: "Telugu" },
    { text: "ଏବେ କଲ୍ କରନ୍ତୁ", lang: "Odia" },
    { text: "এখনই কল করুন", lang: "Bengali" },
    { text: "ಈಗಲೇ ಕರೆ ಮಾಡಿ", lang: "Kannada" },
    { text: "ఇప్పుడే కాల్ చేయండి", lang: "Telugu" }
  ];

  const [currentIndex, setCurrentIndex] = useState(0);
  const [isVisible, setIsVisible] = useState(true);

  useEffect(() => {
    // Flash for 3 sec, 5 sec gap
    const interval = setInterval(() => {
      setIsVisible(false);
      
      setTimeout(() => {
        setCurrentIndex((prev) => (prev + 1) % items.length);
        setIsVisible(true);
      }, 5000); // 5s gap
      
    }, 8000); // 3s visible + 5s gap = 8s total

    return () => clearInterval(interval);
  }, [items.length]);

  if (hideOnRoutes.includes(location.pathname)) {
    return null;
  }

  return (
    <div className="w-full flex items-center justify-center z-40 relative bg-transparent py-0.5 md:py-1">
      <a 
        href="tel:7207550499" 
        className={`inline-flex items-center gap-1.5 md:gap-2 px-3 md:px-4 py-0.5 bg-[#e2ad10] hover:bg-[#d1a00e] text-white rounded-full font-bold text-[9px] md:text-xs tracking-wider transition-all duration-500 transform shadow-sm ${
          isVisible ? 'opacity-100 scale-100 translate-y-0' : 'opacity-0 scale-95 translate-y-2'
        }`}
      >
        <div className="bg-white/20 p-0.5 md:p-1 rounded-full">
          <Phone className="h-2.5 w-2.5 md:h-3 md:w-3 animate-bounce text-white fill-white/20" />
        </div>
        <span className="uppercase">{items[currentIndex].text}:</span>
        <span className="font-extrabold tracking-wider text-white text-[10px] md:text-sm drop-shadow-sm">7207550499</span>
      </a>
    </div>
  );
}
