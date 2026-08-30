import { Link } from 'react-router-dom';
import { Network } from 'lucide-react';

interface CategorySiloBarProps {
  categoryTitle: string;
}

export function CategorySiloBar({ categoryTitle }: CategorySiloBarProps) {
  const categorySilos = [
    { name: 'Plots in Vizag', link: '/plots-for-sale-vizag' },
    { name: 'VMRDA Plots', link: '/vmrda-approved-layouts-vizag' },
    { name: 'Madhurawada Plots', link: '/localities/madhurawada' },
    { name: 'Yendada Plots', link: '/localities/yendada' },
    { name: 'Rushikonda Plots', link: '/localities/rushikonda' },
    { name: 'Bheemili Plots', link: '/localities/bheemili' },
    { name: 'Plot Prices', link: '/plot-prices-vizag' },
    { name: 'Plot Buying Guide', link: '/guides' }
  ];

  return (
    <div className="bg-white p-6 md:p-8 rounded-3xl border border-gray-200 shadow-sm">
      <div className="flex items-center gap-2 text-primary-600 text-xs font-bold uppercase tracking-wider mb-2">
        <Network className="w-4 h-4" /> Category Silo Interlinking Graph
      </div>
      <h3 className="text-xl font-extrabold text-gray-900 mb-4">
        {categoryTitle} — Related Category Links & Localities
      </h3>

      <div className="grid grid-cols-2 sm:grid-cols-4 md:grid-cols-8 gap-2.5">
        {categorySilos.map((silo, idx) => (
          <Link
            key={idx}
            to={silo.link}
            className="bg-emerald-50/70 hover:bg-emerald-600 hover:text-white border border-emerald-200 p-2.5 rounded-xl text-center text-xs font-bold text-emerald-950 transition-all shadow-2xs"
          >
            {silo.name}
          </Link>
        ))}
      </div>
    </div>
  );
}
