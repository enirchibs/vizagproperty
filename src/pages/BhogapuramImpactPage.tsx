// React is not needed
import { SEOHead } from '../components/SEOHead';
import { AdSenseStickySidebar } from '../components/AdSenseStickySidebar';
import { AdSenseInFeedCard } from '../components/AdSenseInFeedCard';
import { Plane, TrendingUp } from 'lucide-react';

export function BhogapuramImpactPage() {
  const schema = {
    "@context": "https://schema.org",
    "@type": "Article",
    "headline": "How Bhogapuram Airport is Transforming Vizag Real Estate",
    "description": "Analyze how the new Bhogapuram International Airport will skyrocket Vizag plot prices. Read our 2026 investment forecast.",
    "author": { "@type": "Organization", "name": "Vizag Property Insights" }
  };

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead 
        title="Bhogapuram Airport Impact on Vizag Real Estate"
        description="Analyze how the new Bhogapuram International Airport will skyrocket Vizag plot prices. Read our 2026 investment forecast and Master Plan 2041 insights."
        schema={schema}
      />

      <section className="relative pt-24 pb-16 bg-gradient-to-br from-indigo-900 to-indigo-700 text-white">
        <div className="max-w-4xl mx-auto px-4 text-center">
          <Plane className="w-12 h-12 mx-auto mb-4 text-indigo-300" />
          <h1 className="text-4xl md:text-5xl font-extrabold mb-6">How Bhogapuram Airport is Transforming Vizag Real Estate</h1>
          <p className="text-xl text-indigo-100">An in-depth analysis of the Master Plan 2041 and 2026 Investment Forecast.</p>
        </div>
      </section>

      <div className="max-w-7xl mx-auto px-4 mt-12 grid grid-cols-1 lg:grid-cols-4 gap-8">
        <div className="lg:col-span-3 prose max-w-none bg-white p-8 rounded-2xl shadow-sm border border-gray-100">
          <h2 className="flex items-center gap-2"><TrendingUp className="text-indigo-600" /> 2026 Investment Forecast</h2>
          <p>The construction of the Bhogapuram International Airport is serving as a massive catalyst for real estate growth along the Vizag-Bheemili corridor...</p>
          
          <AdSenseInFeedCard />
          
          <h3>Impact on Plot Prices</h3>
          <p>We anticipate a 40-60% surge in land values over the next 3 years...</p>
        </div>
        <div className="hidden lg:block space-y-6"><AdSenseStickySidebar /></div>
      </div>
    </div>
  );
}
