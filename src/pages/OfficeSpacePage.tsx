// React is not needed
import { SEOHead } from '../components/SEOHead';
import { AdSenseStickySidebar } from '../components/AdSenseStickySidebar';
import { Briefcase } from 'lucide-react';

export function OfficeSpacePage() {
  const schema = {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
      { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://vizagproperty.co.in" },
      { "@type": "ListItem", "position": 2, "name": "Commercial", "item": "https://vizagproperty.co.in/commercial" },
      { "@type": "ListItem", "position": 3, "name": "Office Space", "item": "https://vizagproperty.co.in/commercial/office-space" }
    ]
  };

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead 
        title="Commercial Office Space for Sale & Rent in Vizag"
        description="Discover premium commercial office spaces and showrooms in Vizag's top IT corridors. High ROI properties for businesses and investors."
        schema={schema}
      />

      <section className="relative pt-24 pb-16 bg-gradient-to-br from-amber-900 to-amber-700 text-white">
        <div className="max-w-7xl mx-auto px-4 text-center">
          <h1 className="text-4xl font-extrabold mb-6">Commercial Office Spaces & Shops in Visakhapatnam</h1>
        </div>
      </section>

      <div className="max-w-7xl mx-auto px-4 mt-12 grid grid-cols-1 lg:grid-cols-4 gap-8">
        <div className="lg:col-span-3 space-y-6">
          <h2 className="text-2xl font-bold text-gray-900 flex items-center gap-2"><Briefcase className="text-amber-600" /> Premium Office Spaces</h2>
          {/* Placeholder for commercial listings */}
        </div>
        <div className="hidden lg:block space-y-6"><AdSenseStickySidebar /></div>
      </div>
    </div>
  );
}
