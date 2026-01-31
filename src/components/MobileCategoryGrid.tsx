import { Building2, Home, TreePine, Key, Users } from 'lucide-react'

interface Category {
  title: string
  icon: React.ReactNode
  href: string
  description?: string
}

const categories: Category[] = [
  {
    title: 'VMRDA Approved Plots',
    icon: <Building2 className="h-6 w-6" />,
    href: '/vmrda-approved-plots-vizag',
    description: 'Legal & approved'
  },
  {
    title: 'Flats for Sale',
    icon: <Home className="h-6 w-6" />,
    href: '/flats-for-sale-in-vizag',
    description: '2,3 BHK options'
  },
  {
    title: 'Villas',
    icon: <TreePine className="h-6 w-6" />,
    href: '/villas-in-vizag',
    description: 'Luxury living'
  },
  {
    title: 'Flats for Rent',
    icon: <Key className="h-6 w-6" />,
    href: '/flats-for-rent-vizag',
    description: 'Ready to move'
  },
  {
    title: 'PG & Hostels',
    icon: <Users className="h-6 w-6" />,
    href: '/pg-hostels-in-vizag',
    description: 'Affordable stays'
  }
]

export function MobileCategoryGrid() {
  return (
    <div className="px-4 py-6">
      <h2 className="text-xl font-bold text-gray-900 mb-4">Property Categories</h2>

      <div className="grid grid-cols-2 gap-3 md:hidden">
        {categories.map((category) => (
          <a
            key={category.href}
            href={category.href}
            className="bg-white border-2 border-gray-200 rounded-2xl p-4 hover:border-primary-500 hover:shadow-md transition-all active:scale-[0.98] flex flex-col items-center text-center gap-3"
          >
            <div className="w-12 h-12 bg-primary-100 rounded-xl flex items-center justify-center text-primary-600">
              {category.icon}
            </div>
            <div>
              <h3 className="font-semibold text-sm text-gray-900 leading-tight">
                {category.title}
              </h3>
              {category.description && (
                <p className="text-xs text-gray-500 mt-1">
                  {category.description}
                </p>
              )}
            </div>
          </a>
        ))}
      </div>

      <div className="hidden md:flex flex-wrap gap-4 mt-6">
        {categories.map((category) => (
          <a
            key={category.href}
            href={category.href}
            className="bg-white border-2 border-gray-200 rounded-2xl p-6 hover:border-primary-500 hover:shadow-md transition-all flex items-center gap-4 flex-1 min-w-[280px]"
          >
            <div className="w-14 h-14 bg-primary-100 rounded-xl flex items-center justify-center text-primary-600 flex-shrink-0">
              {category.icon}
            </div>
            <div>
              <h3 className="font-semibold text-base text-gray-900">
                {category.title}
              </h3>
              {category.description && (
                <p className="text-sm text-gray-500 mt-1">
                  {category.description}
                </p>
              )}
            </div>
          </a>
        ))}
      </div>
    </div>
  )
}
