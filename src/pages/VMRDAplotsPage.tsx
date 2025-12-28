import { useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Home, CheckCircle, TrendingUp, MapPin, Shield } from 'lucide-react';

export default function VMRDAplotsPage() {
  useEffect(() => {
    window.scrollTo(0, 0);

    document.title = 'Vizag Plots for Sale | VMRDA Approved Plots in Visakhapatnam';

    const metaDescription = document.querySelector('meta[name="description"]');
    if (metaDescription) {
      metaDescription.setAttribute('content', 'Buy vizag plots for sale with VMRDA approval. Find open plots in vizag, gated community plots, and residential plots in Madhurawada, PM Palem, Yendada. Check vizag real estate prices for plots.');
    } else {
      const meta = document.createElement('meta');
      meta.name = 'description';
      meta.content = 'Buy vizag plots for sale with VMRDA approval. Find open plots in vizag, gated community plots, and residential plots in Madhurawada, PM Palem, Yendada. Check vizag real estate prices for plots.';
      document.head.appendChild(meta);
    }

    const metaKeywords = document.querySelector('meta[name="keywords"]');
    if (metaKeywords) {
      metaKeywords.setAttribute('content', 'vizag plots for sale, vizag plots, open plots in vizag, vizag plots in gated community, VMRDA approved plots, residential plots in vizag, vizag real estate, vizag property');
    } else {
      const meta = document.createElement('meta');
      meta.name = 'keywords';
      meta.content = 'vizag plots for sale, vizag plots, open plots in vizag, vizag plots in gated community, VMRDA approved plots, residential plots in vizag, vizag real estate, vizag property';
      document.head.appendChild(meta);
    }

    const faqSchema = {
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
        {
          "@type": "Question",
          "name": "What is VMRDA approval and why is it important?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "VMRDA (Visakhapatnam Metropolitan Region Development Authority) approval ensures that plots comply with urban planning regulations, have clear title deeds, and proper infrastructure. It protects buyers from legal issues and ensures safe investment in Vizag real estate."
          }
        },
        {
          "@type": "Question",
          "name": "Which are the best areas to buy VMRDA approved plots in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "Popular areas for VMRDA approved plots in Vizag include Madhurawada, PM Palem, Yendada, and Kommadi. These areas offer good connectivity, infrastructure development, and high appreciation potential."
          }
        },
        {
          "@type": "Question",
          "name": "What is the price range of VMRDA plots in Vizag?",
          "acceptedAnswer": {
            "@type": "Answer",
            "text": "VMRDA approved plots in Vizag typically range from ₹25 lakhs to ₹1 crore depending on location, size, and amenities. Prime locations like Madhurawada command higher prices while emerging areas offer more affordable options."
          }
        }
      ]
    };

    const script = document.createElement('script');
    script.type = 'application/ld+json';
    script.text = JSON.stringify(faqSchema);
    document.head.appendChild(script);

    return () => {
      document.head.removeChild(script);
    };
  }, []);

  return (
    <div className="min-h-screen bg-gray-50">
      <main className="pt-24 pb-16">
        <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="bg-white rounded-lg shadow-sm p-8 md:p-12">
            <div className="flex items-center space-x-3 text-primary-600 mb-4">
              <Home className="w-6 h-6" />
              <span className="text-sm font-medium">Property Investment Guide</span>
            </div>

            <h1 className="text-4xl md:text-5xl font-bold text-gray-900 mb-6">
              Vizag Plots for Sale - VMRDA Approved Plots
            </h1>

            <div className="prose prose-lg max-w-none">
              <p className="text-xl text-gray-700 leading-relaxed mb-8">
                Looking for vizag plots for sale? Find the best VMRDA approved open plots in vizag with clear title deeds and legal compliance. Visakhapatnam Metropolitan Region Development Authority (VMRDA) ensures every plot meets urban planning standards and has verified documentation. Whether you're searching for vizag plots in gated community developments in Madhurawada, residential plots in PM Palem, or open plots in emerging areas, VMRDA certification provides security and long-term value. Explore vizag real estate opportunities with transparent pricing and verified listings.
              </p>

              <section className="mb-12">
                <h2 className="text-3xl font-bold text-gray-900 mb-6 flex items-center">
                  <CheckCircle className="w-8 h-8 text-primary-600 mr-3" />
                  Why Choose VMRDA Approved Plots in Vizag?
                </h2>
                <div className="bg-primary-50 rounded-lg p-6 mb-6">
                  <ul className="space-y-4">
                    <li className="flex items-start">
                      <Shield className="w-6 h-6 text-primary-600 mr-3 mt-1 flex-shrink-0" />
                      <div>
                        <strong className="text-gray-900">Legal Security:</strong>
                        <span className="text-gray-700"> VMRDA approval guarantees clear title, verified documentation, and compliance with all urban development regulations in Vizag.</span>
                      </div>
                    </li>
                    <li className="flex items-start">
                      <Shield className="w-6 h-6 text-primary-600 mr-3 mt-1 flex-shrink-0" />
                      <div>
                        <strong className="text-gray-900">Infrastructure Assurance:</strong>
                        <span className="text-gray-700"> All VMRDA plots come with planned infrastructure including roads, water supply, drainage, and electricity connections.</span>
                      </div>
                    </li>
                    <li className="flex items-start">
                      <Shield className="w-6 h-6 text-primary-600 mr-3 mt-1 flex-shrink-0" />
                      <div>
                        <strong className="text-gray-900">Easy Bank Loans:</strong>
                        <span className="text-gray-700"> Banks and financial institutions readily approve loans for VMRDA approved plots, making financing hassle-free.</span>
                      </div>
                    </li>
                    <li className="flex items-start">
                      <Shield className="w-6 h-6 text-primary-600 mr-3 mt-1 flex-shrink-0" />
                      <div>
                        <strong className="text-gray-900">Higher Resale Value:</strong>
                        <span className="text-gray-700"> VMRDA certification significantly increases property value and attracts serious buyers when you decide to sell.</span>
                      </div>
                    </li>
                  </ul>
                </div>
              </section>

              <section className="mb-12">
                <h2 className="text-3xl font-bold text-gray-900 mb-6 flex items-center">
                  <MapPin className="w-8 h-8 text-primary-600 mr-3" />
                  Popular Areas for VMRDA Plots
                </h2>
                <div className="grid md:grid-cols-2 gap-6">
                  <div className="bg-white border border-gray-200 rounded-lg p-6 hover:shadow-md transition-shadow">
                    <h3 className="text-xl font-semibold text-gray-900 mb-3">
                      <Link to="/vizag/madhurawada" className="text-primary-600 hover:text-primary-700">
                        Madhurawada
                      </Link>
                    </h3>
                    <p className="text-gray-700 mb-2">
                      Premium location with excellent connectivity and infrastructure. VMRDA plots in Madhurawada are highly sought after for both residential and investment purposes.
                    </p>
                    <p className="text-sm text-gray-600">Price Range: ₹40L - ₹1Cr</p>
                  </div>

                  <div className="bg-white border border-gray-200 rounded-lg p-6 hover:shadow-md transition-shadow">
                    <h3 className="text-xl font-semibold text-gray-900 mb-3">
                      <Link to="/vizag/pm-palem" className="text-primary-600 hover:text-primary-700">
                        PM Palem
                      </Link>
                    </h3>
                    <p className="text-gray-700 mb-2">
                      Fast-developing area with affordable VMRDA approved plots. Great for first-time buyers looking for Vizag plots for sale with appreciation potential.
                    </p>
                    <p className="text-sm text-gray-600">Price Range: ₹25L - ₹60L</p>
                  </div>

                  <div className="bg-white border border-gray-200 rounded-lg p-6 hover:shadow-md transition-shadow">
                    <h3 className="text-xl font-semibold text-gray-900 mb-3">
                      <Link to="/vizag/yendada" className="text-primary-600 hover:text-primary-700">
                        Yendada
                      </Link>
                    </h3>
                    <p className="text-gray-700 mb-2">
                      Established residential area with excellent amenities. VMRDA plots here offer immediate livability and strong community infrastructure.
                    </p>
                    <p className="text-sm text-gray-600">Price Range: ₹35L - ₹80L</p>
                  </div>

                  <div className="bg-white border border-gray-200 rounded-lg p-6 hover:shadow-md transition-shadow">
                    <h3 className="text-xl font-semibold text-gray-900 mb-3">Kommadi</h3>
                    <p className="text-gray-700 mb-2">
                      Emerging hotspot near the airport with high growth potential. Ideal for long-term investment in residential plots in Vizag.
                    </p>
                    <p className="text-sm text-gray-600">Price Range: ₹30L - ₹70L</p>
                  </div>
                </div>
              </section>

              <section className="mb-12">
                <h2 className="text-3xl font-bold text-gray-900 mb-6">
                  Price Range of VMRDA Plots in Vizag
                </h2>
                <div className="bg-gradient-to-br from-primary-50 to-primary-100 rounded-lg p-8">
                  <p className="text-gray-800 mb-6">
                    The cost of VMRDA approved plots in Vizag varies significantly based on location, size, and surrounding infrastructure. Here's a comprehensive breakdown:
                  </p>
                  <div className="grid md:grid-cols-3 gap-6">
                    <div className="bg-white rounded-lg p-6 text-center">
                      <h4 className="font-semibold text-gray-900 mb-2">Budget Range</h4>
                      <p className="text-3xl font-bold text-primary-600 mb-2">₹25L - ₹40L</p>
                      <p className="text-sm text-gray-600">Emerging areas, smaller plot sizes</p>
                    </div>
                    <div className="bg-white rounded-lg p-6 text-center">
                      <h4 className="font-semibold text-gray-900 mb-2">Mid Range</h4>
                      <p className="text-3xl font-bold text-primary-600 mb-2">₹40L - ₹70L</p>
                      <p className="text-sm text-gray-600">Developed localities, good connectivity</p>
                    </div>
                    <div className="bg-white rounded-lg p-6 text-center">
                      <h4 className="font-semibold text-gray-900 mb-2">Premium Range</h4>
                      <p className="text-3xl font-bold text-primary-600 mb-2">₹70L - ₹1Cr+</p>
                      <p className="text-sm text-gray-600">Prime locations, larger plots</p>
                    </div>
                  </div>
                </div>
              </section>

              <section className="mb-12">
                <h2 className="text-3xl font-bold text-gray-900 mb-6 flex items-center">
                  <TrendingUp className="w-8 h-8 text-primary-600 mr-3" />
                  Investment Benefits in Vizag Plots
                </h2>
                <div className="space-y-4">
                  <div className="border-l-4 border-primary-600 pl-6 py-2">
                    <h3 className="font-semibold text-gray-900 mb-2">High Appreciation Potential</h3>
                    <p className="text-gray-700">
                      Vizag's rapid infrastructure development, IT sector growth, and port expansion drive consistent property value appreciation. VMRDA plots have historically shown 12-15% annual growth.
                    </p>
                  </div>
                  <div className="border-l-4 border-primary-600 pl-6 py-2">
                    <h3 className="font-semibold text-gray-900 mb-2">Strategic Location</h3>
                    <p className="text-gray-700">
                      As a tier-2 city with tier-1 infrastructure, Vizag offers the perfect balance of affordability and growth. The new international airport and metro rail project further enhance investment prospects.
                    </p>
                  </div>
                  <div className="border-l-4 border-primary-600 pl-6 py-2">
                    <h3 className="font-semibold text-gray-900 mb-2">Rental Income Opportunity</h3>
                    <p className="text-gray-700">
                      Build your dream home on VMRDA approved residential plots or construct rental units to generate passive income. The growing IT and service sectors create strong rental demand.
                    </p>
                  </div>
                  <div className="border-l-4 border-primary-600 pl-6 py-2">
                    <h3 className="font-semibold text-gray-900 mb-2">Flexible Development Options</h3>
                    <p className="text-gray-700">
                      VMRDA plots allow you to design and build according to your preferences and timeline, unlike ready-to-move properties with fixed layouts.
                    </p>
                  </div>
                </div>
              </section>

              <section className="mb-12">
                <h2 className="text-3xl font-bold text-gray-900 mb-6">
                  Frequently Asked Questions
                </h2>
                <div className="space-y-6">
                  <div className="bg-gray-50 rounded-lg p-6">
                    <h3 className="font-semibold text-gray-900 mb-3">What is VMRDA approval and why is it important?</h3>
                    <p className="text-gray-700">
                      VMRDA (Visakhapatnam Metropolitan Region Development Authority) approval ensures that plots comply with urban planning regulations, have clear title deeds, and proper infrastructure. It protects buyers from legal issues and ensures safe investment in Vizag real estate.
                    </p>
                  </div>
                  <div className="bg-gray-50 rounded-lg p-6">
                    <h3 className="font-semibold text-gray-900 mb-3">Which are the best areas to buy VMRDA approved plots in Vizag?</h3>
                    <p className="text-gray-700">
                      Popular areas for VMRDA approved plots in Vizag include Madhurawada, PM Palem, Yendada, and Kommadi. These areas offer good connectivity, infrastructure development, and high appreciation potential.
                    </p>
                  </div>
                  <div className="bg-gray-50 rounded-lg p-6">
                    <h3 className="font-semibold text-gray-900 mb-3">What is the price range of VMRDA plots in Vizag?</h3>
                    <p className="text-gray-700">
                      VMRDA approved plots in Vizag typically range from ₹25 lakhs to ₹1 crore depending on location, size, and amenities. Prime locations like Madhurawada command higher prices while emerging areas offer more affordable options.
                    </p>
                  </div>
                </div>
              </section>

              <div className="bg-primary-600 rounded-lg p-8 text-center text-white">
                <h2 className="text-3xl font-bold mb-4">
                  Post Your VMRDA-Approved Plot for Free
                </h2>
                <p className="text-lg mb-6 text-primary-50">
                  List your VMRDA approved plot and reach thousands of verified buyers looking for Vizag plots for sale
                </p>
                <Link
                  to="/add-property"
                  className="inline-block bg-white text-primary-600 px-8 py-4 rounded-lg font-semibold hover:bg-primary-50 transition-colors"
                >
                  List Your Property Now
                </Link>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
