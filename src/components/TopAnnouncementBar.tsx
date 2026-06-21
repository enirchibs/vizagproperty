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

  // Duplicate items twice to ensure seamless infinite looping on wider displays
  const scrollItems = [...items, ...items];

  return (
    <div className="bg-[#E53935] text-white w-full h-9 flex items-center overflow-hidden border-b border-red-600 shadow-sm z-[999] relative">
      <a 
        href="tel:7207550499" 
        className="w-full h-full flex items-center whitespace-nowrap hover:bg-white/10 transition-colors duration-300"
      >
        <div className="flex items-center gap-2 px-3 bg-red-700 h-full font-extrabold text-xs md:text-sm uppercase tracking-wider shadow-md z-10 flex-shrink-0">
          <Phone className="h-4 w-4 animate-bounce text-white fill-white/20" />
          <span>Call:</span>
        </div>
        <div className="relative w-full overflow-hidden flex items-center h-full bg-red-600">
          <div className="flex gap-16 items-center animate-marquee whitespace-nowrap hover:[animation-play-state:paused] cursor-pointer">
            {scrollItems.map((item, idx) => (
              <div key={idx} className="flex items-center gap-2 text-xs md:text-sm font-bold tracking-wide">
                <span>{item.text}:</span>
                <span className="text-yellow-300 font-extrabold tracking-wider">7207550499</span>
                <span className="text-red-300 text-xs ml-4">•</span>
              </div>
            ))}
          </div>
        </div>
      </a>
    </div>
  );
}
