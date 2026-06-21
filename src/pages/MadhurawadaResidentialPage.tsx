import React from 'react';
import { SEOHead } from '../components/SEOHead';
import { AdSenseStickySidebar } from '../components/AdSenseStickySidebar';
import { AdSenseInFeedCard } from '../components/AdSenseInFeedCard';
import { Building2 } from 'lucide-react';

export function MadhurawadaResidentialPage() {
  const schema = {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "BreadcrumbList",
        "itemListElement": [
          { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://vizagproperty.co.in" },
          { "@type": "ListItem", "position": 2, "name": "Residential", "item": "https://vizagproperty.co.in/residential" },
          { "@type": "ListItem", "position": 3, "name": "Madhurawada", "item": "https://vizagproperty.co.in/residential/madhurawada" }
        ]
      }
    ]
  };

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead 
        title="Flats & Luxury Villas in Madhurawada, Vizag"
        description="Find 2 BHK, 3 BHK flats and luxury sea-view villas in Madhurawada, Vizag. Zero brokerage on premium residential properties. Book your site visit today."
        schema={schema}
        url="https://vizagproperty.co.in/residential/madhurawada"
      />

      <section className="relative pt-24 pb-16 bg-gradient-to-br from-blue-900 to-blue-700 text-white">
        <div className="max-w-7xl mx-auto px-4 text-center">
          <h1 className="text-4xl md:text-5xl font-extrabold mb-6">Residential Properties for Sale in Madhurawada</h1>
          <p className="text-xl max-w-3xl mx-auto mb-8 text-blue-100">Discover premium 2/3 BHK flats, gated communities, and luxury villas in Vizag's fastest-growing IT corridor.</p>
        </div>
      </section>

      <div className="max-w-7xl mx-auto px-4 mt-12 grid grid-cols-1 lg:grid-cols-4 gap-8">
        <div className="lg:col-span-3 space-y-6">
          <h2 className="text-2xl font-bold text-gray-900 flex items-center gap-2"><Building2 className="text-blue-600" /> Featured Properties</h2>
          {[1, 2, 3, 4].map((_, index) => (
            <React.Fragment key={index}>
              <div className="bg-white rounded-2xl shadow-sm border p-6 flex flex-col md:flex-row gap-6">
                <div className="w-full md:w-1/3 h-48 bg-gray-200 rounded-xl"></div>
                <div className="w-full md:w-2/3 flex flex-col justify-between">
                  <div>
                    <div className="text-blue-600 text-sm font-bold tracking-wide uppercase mb-1">Luxury Flat</div>
                    <h3 className="text-xl font-bold text-gray-900 mb-2">3 BHK Premium Apartment</h3>
                    <p className="text-gray-600 text-sm mb-4">Spacious sea-view apartment in Madhurawada IT SEZ area.</p>
                  </div>
                </div>
              </div>
              {index === 1 && <AdSenseInFeedCard />}
            </React.Fragment>
          ))}
        </div>
        <div className="hidden lg:block space-y-6"><AdSenseStickySidebar /></div>
      </div>
    </div>
  );
}
