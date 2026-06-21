import { useState, useEffect } from 'react'
import { Phone } from 'lucide-react'

export function TopAnnouncementBar() {
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
    const interval = setInterval(() => {
      setIsVisible(false);
      
      setTimeout(() => {
        setCurrentIndex((prev) => (prev + 1) % items.length);
        setIsVisible(true);
      }, 500); // 500ms for fade out transition
      
    }, 3500); // 3 seconds visible + 0.5s transition = 3.5s total interval

    return () => clearInterval(interval);
  }, [items.length]);

  return (
    <div className="bg-yellow-500 text-white w-full h-11 flex items-center justify-center border-b border-yellow-600 shadow-md z-[999] relative">
      <a 
        href="tel:7207550499" 
        className="w-full h-full flex items-center justify-center hover:bg-yellow-400 transition-colors duration-300"
      >
        <div 
          className={`flex items-center gap-3 px-4 font-bold text-sm md:text-base tracking-wider transition-all duration-500 transform ${
            isVisible ? 'opacity-100 scale-100 translate-y-0' : 'opacity-0 scale-95 translate-y-2'
          }`}
        >
          <div className="bg-white/20 p-1.5 rounded-full">
            <Phone className="h-4 w-4 animate-bounce text-white fill-white/20" />
          </div>
          <span className="uppercase">{items[currentIndex].text}:</span>
          <span className="font-extrabold tracking-wider text-white text-base md:text-lg drop-shadow-sm">7207550499</span>
        </div>
      </a>
    </div>
  );
}
