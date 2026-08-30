import { Link } from 'react-router-dom';
import { Network, Building2, MapPin, TrendingUp, ShieldCheck, ArrowRight } from 'lucide-react';

interface LocalitySiloBarProps {
  localityName: string;
  localitySlug: string;
}

export function LocalitySiloBar({ localityName, localitySlug }: LocalitySiloBarProps) {
  const silos = [
    { title: `${localityName} Hub`, link: `/localities/${localitySlug}`, icon: MapPin },
    { title: `Flats in ${localityName}`, link: `/flats-for-sale-vizag`, icon: Building2 },
    { title: `Plots in ${localityName}`, link: `/plots-for-sale-vizag`, icon: ShieldCheck },
    { title: `Projects in ${localityName}`, link: `/projects`, icon: Building2 },
    { title: `${localityName} Prices`, link: `/property-prices-vizag`, icon: TrendingUp },
    { title: `${localityName} Guide`, link: `/guides`, icon: Network },
    { title: `All ${localityName} Properties`, link: `/properties?search=${encodeURIComponent(localityName)}`, icon: ArrowRight }
  ];

  return (
    <div className="bg-gradient-to-r from-slate-900 via-primary-950 to-slate-900 text-white p-6 md:p-8 rounded-3xl border border-gray-800 shadow-md">
      <div className="flex items-center gap-2 text-emerald-400 text-xs font-bold uppercase tracking-wider mb-2">
        <Network className="w-4 h-4" /> Locality Internal Link Graph • {localityName}
      </div>
      <h3 className="text-xl font-extrabold mb-4 text-white">
        Explore {localityName} Real Estate Silo Graph
      </h3>

      <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-7 gap-3">
        {silos.map((silo, idx) => {
          const IconComp = silo.icon;
          return (
            <Link
              key={idx}
              to={silo.link}
              className="bg-white/10 hover:bg-emerald-600/90 border border-white/15 p-3 rounded-2xl flex flex-col items-center justify-center text-center transition-all group"
            >
              <IconComp className="w-4 h-4 mb-1 text-emerald-400 group-hover:text-white transition-colors" />
              <span className="text-xs font-bold leading-tight group-hover:text-white">{silo.title}</span>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
