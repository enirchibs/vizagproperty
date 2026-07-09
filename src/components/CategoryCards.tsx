import { Map, Building2, Home, Briefcase, Trees, Key, Users, Building } from 'lucide-react';
import { Link } from 'react-router-dom';

export function CategoryCards() {
  const categories = [
    { name: 'Plots', icon: Map, color: 'text-orange-600', bg: 'bg-orange-100', link: '/properties?category=land_plot' },
    { name: 'Flats', icon: Building2, color: 'text-blue-600', bg: 'bg-blue-100', link: '/properties?category=flat_apartment' },
    { name: 'Villa', icon: Home, color: 'text-green-600', bg: 'bg-green-100', link: '/properties?category=villa' },
    { name: 'Commercial', icon: Briefcase, color: 'text-purple-600', bg: 'bg-purple-100', link: '/properties?category=commercial' },
    { name: 'Independent House', icon: Home, color: 'text-teal-600', bg: 'bg-teal-100', link: '/properties?category=full_house' },
    { name: 'Farm Land', icon: Trees, color: 'text-emerald-600', bg: 'bg-emerald-100', link: '/properties?category=farm_land' },
    { name: 'Rental', icon: Key, color: 'text-rose-600', bg: 'bg-rose-100', link: '/properties?type=rent' },
    { name: 'PG / Hostel', icon: Users, color: 'text-indigo-600', bg: 'bg-indigo-100', link: '/properties?category=pg_hostel' },
    { name: 'Office Space', icon: Building, color: 'text-sky-600', bg: 'bg-sky-100', link: '/properties?category=commercial&subType=office' },
  ];

  return (
    <div className="w-full max-w-7xl mx-auto px-4 py-12">
      <div className="text-center mb-10">
        <h2 className="text-3xl md:text-4xl font-extrabold text-gray-900 mb-2">Browse Visakhapatnam Property by Category</h2>
        <p className="text-gray-600">Explore vizag real estate and vizag properties for sale based on your requirement</p>
      </div>
      
      <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4 md:gap-6">
        {categories.map((cat, index) => {
          const Icon = cat.icon;
          return (
            <Link 
              key={index} 
              to={cat.link}
              title={`${cat.name} in Vizag | Vizag Property for Sale`}
              className={`flex flex-col items-center justify-center p-6 rounded-2xl shadow-sm border border-transparent ${cat.bg} hover:shadow-md transition-all duration-300 hover:-translate-y-1 group`}
            >
              <div className="w-16 h-16 rounded-full bg-white/60 flex items-center justify-center mb-4 group-hover:scale-110 group-hover:bg-white transition-all duration-300 shadow-sm">
                <Icon className={`w-8 h-8 ${cat.color}`} />
              </div>
              <h3 className={`font-semibold text-gray-800 text-center text-sm md:text-base group-hover:${cat.color} transition-colors`}>
                {cat.name}
              </h3>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
