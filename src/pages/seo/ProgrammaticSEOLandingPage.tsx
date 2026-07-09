import { useParams, Link } from 'react-router-dom';
import { useEffect, useState } from 'react';
import { supabase } from '../../lib/supabase';
import { Property } from '../../types';
import { PropertyCard } from '../../components/PropertyCard';
import { SEOHead } from '../../components/SEOHead';
import { MapPin, Search, ArrowRight } from 'lucide-react';

export function ProgrammaticSEOLandingPage() {
  const { propertyType, location } = useParams();
  const [properties, setProperties] = useState<Property[]>([]);
  const [loading, setLoading] = useState(true);

  // Normalize URL params for display
  const rawType = propertyType?.replace(/-/g, ' ') || 'Properties';
  const displayType = rawType.charAt(0).toUpperCase() + rawType.slice(1);
  
  const rawLoc = location?.replace(/-/g, ' ') || 'Vizag';
  const displayLocation = rawLoc.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ');

  const title = `${displayType} in ${displayLocation} | VizagProperty`;
  const description = `Looking for ${displayType.toLowerCase()} in ${displayLocation}? Explore the best verified real estate listings with price trends and amenities on VizagProperty.`;

  useEffect(() => {
    async function fetchProperties() {
      setLoading(true);
      try {
        let query = supabase.from('properties').select('*, localities(*)').eq('status', 'available').order('created_at', { ascending: false }).limit(12);

        // Very basic matching for demo purposes
        if (displayLocation.toLowerCase() !== 'vizag') {
          query = query.ilike('location', `%${displayLocation}%`);
        }
        
        if (displayType.toLowerCase().includes('flat') || displayType.toLowerCase().includes('apartment')) {
           query = query.eq('property_type', 'apartment');
        } else if (displayType.toLowerCase().includes('villa') || displayType.toLowerCase().includes('house')) {
           query = query.eq('property_type', 'independent_house');
        } else if (displayType.toLowerCase().includes('plot') || displayType.toLowerCase().includes('land')) {
           query = query.eq('property_type', 'plot_land');
        }

        const { data, error } = await query;
        if (error) throw error;
        setProperties(data || []);
      } catch (err) {
        console.error("Error fetching pSEO properties", err);
      } finally {
        setLoading(false);
      }
    }
    fetchProperties();
  }, [displayType, displayLocation]);

  const faqs = [
    {
      question: `What is the average price of ${displayType.toLowerCase()} in ${displayLocation}?`,
      answer: `The average price varies based on amenities and exact location within ${displayLocation}. However, recent trends show competitive pricing. Contact our agents for an exact market report.`
    },
    {
      question: `Are there any VMRDA approved ${displayType.toLowerCase()} in ${displayLocation}?`,
      answer: `Yes, VizagProperty strictly lists verified properties. You can filter for VMRDA/RERA approved options in our main search portal.`
    },
    {
      question: `Is ${displayLocation} a good place to invest in real estate?`,
      answer: `${displayLocation} is experiencing significant infrastructural growth, making it a prime hotspot for real estate investment in Vizag.`
    }
  ];

  const faqSchema = {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": faqs.map(faq => ({
      "@type": "Question",
      "name": faq.question,
      "acceptedAnswer": {
        "@type": "Answer",
        "text": faq.answer
      }
    }))
  };

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead title={title} description={description} schema={faqSchema} url={window.location.href} />

      {/* Hero Section */}
      <div className="bg-slate-900 pt-16 pb-32">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <h1 className="text-4xl md:text-6xl font-black text-white mb-6 leading-tight">
            Explore <span className="text-primary-400">{displayType}</span> <br/> in <span className="text-accent-400">{displayLocation}</span>
          </h1>
          <p className="text-xl text-slate-300 max-w-2xl mx-auto mb-10">
            {description}
          </p>
          <div className="flex justify-center">
            <Link to={`/search?location=${displayLocation}`} className="bg-primary-600 hover:bg-primary-700 text-white px-8 py-4 rounded-xl font-bold text-lg flex items-center transition-colors shadow-lg shadow-primary-600/30">
              <Search className="w-5 h-5 mr-2" /> View All Listings
            </Link>
          </div>
        </div>
      </div>

      {/* Grid */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-16 relative z-10 mb-20">
        <div className="flex items-center justify-between mb-8 bg-white p-4 rounded-2xl shadow-sm border border-gray-100">
           <h2 className="text-xl font-bold text-gray-900 flex items-center">
             <MapPin className="w-5 h-5 mr-2 text-primary-600" /> Top Matches in {displayLocation}
           </h2>
           <span className="text-sm font-semibold text-gray-500">{properties.length} results found</span>
        </div>

        {loading ? (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {[1, 2, 3, 4, 5, 6].map(i => (
               <div key={i} className="h-96 bg-gray-200 animate-pulse rounded-2xl"></div>
            ))}
          </div>
        ) : properties.length > 0 ? (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {properties.map(property => (
              <PropertyCard key={property.id} property={property} />
            ))}
          </div>
        ) : (
          <div className="bg-white rounded-2xl p-12 text-center border border-gray-100 shadow-sm">
            <h3 className="text-2xl font-bold text-gray-900 mb-2">No exact matches right now</h3>
            <p className="text-gray-500 mb-6">We couldn't find any {displayType.toLowerCase()} currently available in {displayLocation}.</p>
            <Link to="/search" className="inline-flex items-center text-primary-600 font-bold hover:text-primary-700">
              Browse all properties in Vizag <ArrowRight className="w-4 h-4 ml-2" />
            </Link>
          </div>
        )}
      </div>

      {/* FAQ Section */}
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 className="text-3xl font-black text-gray-900 mb-8 text-center">Frequently Asked Questions</h2>
        <div className="space-y-4">
          {faqs.map((faq, index) => (
            <div key={index} className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
              <h3 className="text-lg font-bold text-gray-900 mb-2">{faq.question}</h3>
              <p className="text-gray-600">{faq.answer}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
