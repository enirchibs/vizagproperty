import { Link } from 'react-router-dom';
import { Star, Award, Crown, ArrowRight } from 'lucide-react';

export function SponsoredBanners() {
  const sponsors = [
    {
      title: "Top Builders in Vizag",
      desc: "Premium builders offering luxury and quality constructions.",
      icon: Crown,
      color: "from-amber-500 to-orange-600",
      link: "/builders",
      tag: "Premium"
    },
    {
      title: "Top Real Estate Agents",
      desc: "Trusted professionals to guide your property journey.",
      icon: Award,
      color: "from-blue-600 to-indigo-700",
      link: "/partners",
      tag: "Verified"
    },
    {
      title: "Top Ventures in Vizag",
      desc: "High-return investment opportunities & new projects.",
      icon: Star,
      color: "from-emerald-500 to-teal-700",
      link: "/properties?q=new",
      tag: "Exclusive"
    }
  ];

  return (
    <section className="py-12 bg-gray-50 border-y border-gray-200 px-4">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-8">
          <h2 className="text-3xl font-extrabold text-gray-900 mb-2">Premium Partners</h2>
          <p className="text-gray-600">Connect with Vizag's most trusted real estate professionals</p>
        </div>
        <div className="flex flex-col lg:flex-row gap-6">
          {sponsors.map((s, i) => (
            <Link 
              key={i} 
              to={s.link}
              className={`flex-1 relative overflow-hidden rounded-3xl p-6 md:p-8 text-white shadow-md hover:shadow-2xl hover:-translate-y-1 transition-all duration-300 group`}
            >
              <div className={`absolute inset-0 bg-gradient-to-br ${s.color} opacity-95 group-hover:opacity-100 transition-opacity`}></div>
              
              {/* Background Icon */}
              <div className="absolute -right-6 -bottom-6 opacity-10 group-hover:scale-110 group-hover:rotate-12 transition-transform duration-700 pointer-events-none">
                <s.icon className="w-48 h-48" />
              </div>

              <div className="relative z-10 flex flex-col h-full justify-between">
                <div>
                  <div className="flex justify-between items-start mb-6">
                    <div className="bg-white/20 backdrop-blur-md w-14 h-14 rounded-2xl flex items-center justify-center shadow-inner">
                      <s.icon className="w-7 h-7 text-white" />
                    </div>
                    <div className="bg-white/20 backdrop-blur-md text-xs font-black tracking-widest uppercase px-3 py-1.5 rounded-full border border-white/20 shadow-sm">
                      {s.tag}
                    </div>
                  </div>
                  
                  <h3 className="text-2xl md:text-3xl font-black mb-3 leading-tight drop-shadow-sm">{s.title}</h3>
                  <p className="text-white/90 text-sm md:text-base font-medium mb-8 line-clamp-2 max-w-[85%]">
                    {s.desc}
                  </p>
                </div>
                
                <div className="flex items-center text-sm font-bold bg-white/20 w-max px-5 py-2.5 rounded-full backdrop-blur-md border border-white/30 group-hover:bg-white group-hover:text-gray-900 group-hover:shadow-lg transition-all duration-300">
                  Explore Now <ArrowRight className="w-4 h-4 ml-2 group-hover:translate-x-1 transition-transform" />
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  )
}
