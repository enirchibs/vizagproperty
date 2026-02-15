import { Building2, Home, TreePine, Key, Users } from 'lucide-react'

interface Category {
  title: string
  icon: React.ReactNode
  href: string
  description?: string
  gradient: string
  iconBg: string
}

const categories: Category[] = [
  {
    title: 'VMRDA Approved Plots',
    icon: <Building2 className="h-6 w-6" />,
    href: '/vmrda-approved-plots-vizag',
    description: 'Legal & approved',
    gradient: 'from-blue-500 to-cyan-500',
    iconBg: 'bg-blue-100 text-blue-700'
  },
  {
    title: 'Flats for Sale',
    icon: <Home className="h-6 w-6" />,
    href: '/flats-for-sale-in-vizag',
    description: '2,3 BHK options',
    gradient: 'from-emerald-500 to-teal-500',
    iconBg: 'bg-emerald-100 text-emerald-700'
  },
  {
    title: 'Villas',
    icon: <TreePine className="h-6 w-6" />,
    href: '/villas-in-vizag',
    description: 'Luxury living',
    gradient: 'from-amber-500 to-orange-500',
    iconBg: 'bg-amber-100 text-amber-700'
  },
  {
    title: 'Flats for Rent',
    icon: <Key className="h-6 w-6" />,
    href: '/flats-for-rent-vizag',
    description: 'Ready to move',
    gradient: 'from-rose-500 to-pink-500',
    iconBg: 'bg-rose-100 text-rose-700'
  },
  {
    title: 'PG & Hostels',
    icon: <Users className="h-6 w-6" />,
    href: '/pg-hostels-in-vizag',
    description: 'Affordable stays',
    gradient: 'from-violet-500 to-purple-500',
    iconBg: 'bg-violet-100 text-violet-700'
  }
]

export function MobileCategoryGrid() {
  return (
    <div className="px-4 py-6">
      <h2 className="text-lg font-bold text-gray-900 mb-4 md:hidden">Property Categories</h2>

      <div className="grid grid-cols-2 gap-3 md:hidden">
        {categories.slice(0, 4).map((category) => (
          <a
            key={category.href}
            href={category.href}
            className={`bg-gradient-to-br ${category.gradient} rounded-2xl p-5 hover:shadow-xl transition-all active:scale-[0.98] text-center group relative overflow-hidden`}
          >
            <div className="absolute inset-0 bg-white/10 backdrop-blur-sm"></div>
            <div className="relative">
              <div className={`w-12 h-12 ${category.iconBg} rounded-xl mx-auto mb-3 flex items-center justify-center shadow-lg`}>
                {category.icon}
              </div>
              <h3 className="font-bold text-sm text-white leading-tight drop-shadow-md">
                {category.title}
              </h3>
              {category.description && (
                <p className="text-xs text-white/90 mt-1">
                  {category.description}
                </p>
              )}
            </div>
          </a>
        ))}
        <a
          href={categories[4].href}
          className={`col-span-2 bg-gradient-to-br ${categories[4].gradient} rounded-2xl p-5 hover:shadow-xl transition-all active:scale-[0.98] text-center group relative overflow-hidden`}
        >
          <div className="absolute inset-0 bg-white/10 backdrop-blur-sm"></div>
          <div className="relative">
            <div className={`w-12 h-12 ${categories[4].iconBg} rounded-xl mx-auto mb-3 flex items-center justify-center shadow-lg`}>
              {categories[4].icon}
            </div>
            <h3 className="font-bold text-sm text-white leading-tight drop-shadow-md">
              {categories[4].title}
            </h3>
            {categories[4].description && (
              <p className="text-xs text-white/90 mt-1">
                {categories[4].description}
              </p>
            )}
          </div>
        </a>
      </div>

      <div className="hidden md:flex flex-wrap gap-4 mt-6">
        {categories.map((category) => (
          <a
            key={category.href}
            href={category.href}
            className={`bg-gradient-to-br ${category.gradient} rounded-2xl p-6 hover:shadow-2xl transition-all flex items-center gap-4 flex-1 min-w-[280px] relative overflow-hidden group`}
          >
            <div className="absolute inset-0 bg-white/10 backdrop-blur-sm"></div>
            <div className="relative flex items-center gap-4 w-full">
              <div className={`w-16 h-16 ${category.iconBg} rounded-xl flex items-center justify-center flex-shrink-0 shadow-lg group-hover:scale-110 transition-transform`}>
                {category.icon}
              </div>
              <div>
                <h3 className="font-bold text-base text-white drop-shadow-md">
                  {category.title}
                </h3>
                {category.description && (
                  <p className="text-sm text-white/90 mt-1">
                    {category.description}
                  </p>
                )}
              </div>
            </div>
          </a>
        ))}
      </div>
    </div>
  )
}
