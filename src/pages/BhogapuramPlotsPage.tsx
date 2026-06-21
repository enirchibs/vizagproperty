import React from 'react';
import { SEOHead } from '../components/SEOHead';
import AntigravityPlanner from '../components/planner/AntigravityPlanner';
import { AdSenseStickySidebar } from '../components/AdSenseStickySidebar';
import { AdSenseInFeedCard } from '../components/AdSenseInFeedCard';
import { MapPin, Search } from 'lucide-react';

export function BhogapuramPlotsPage() {
  const schema = {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "BreadcrumbList",
        "itemListElement": [
          { "@type": "ListItem", "position": 1, "name": "Home", "item": "https://vizagproperty.co.in" },
          { "@type": "ListItem", "position": 2, "name": "Plots", "item": "https://vizagproperty.co.in/plots" },
          { "@type": "ListItem", "position": 3, "name": "Bhogapuram", "item": "https://vizagproperty.co.in/plots/bhogapuram" }
        ]
      },
      {
        "@type": "RealEstateListing",
        "name": "Premium VUDA Plots near Bhogapuram International Airport",
        "description": "Invest in VUDA approved plots in Bhogapuram near the new Vizag International Airport.",
        "url": "https://vizagproperty.co.in/plots/bhogapuram"
      }
    ]
  };

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead 
        title="VUDA Plots in Bhogapuram | Near New Airport Vizag"
        description="Invest in VUDA approved plots in Bhogapuram near the new Vizag International Airport. Secure gated communities with clear titles. View 3D layouts now."
        schema={schema}
        url="https://vizagproperty.co.in/plots/bhogapuram"
      />

      {/* 1. TOP ANCHOR/LEADERBOARD AD ZONE */}
      {/* Placed above the main wrapper, restricted to a fixed height to prevent Cumulative Layout Shift (CLS) */}
      <div className="w-full bg-white border-b border-gray-200 py-2 flex justify-center items-center min-h-[90px] overflow-hidden">
        {/* Google AdSense Responsive Leaderboard */}
        <div className="text-[10px] uppercase tracking-wider text-gray-400 text-center">
          Advertisement • Responsive Top Leaderboard
        </div>
      </div>

      {/* Hero Section */}
      <section className="relative pt-24 pb-16 bg-gradient-to-br from-primary-900 to-primary-700 text-white overflow-hidden">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 text-center">
          <h1 className="text-4xl md:text-5xl font-extrabold mb-6 animate-fade-in">
            Premium VUDA Approved Plots in Bhogapuram, Vizag
          </h1>
          <p className="text-lg md:text-xl text-primary-100 max-w-3xl mx-auto mb-8">
            Secure your future with prime land near the upcoming Bhogapuram International Airport. High ROI guaranteed.
          </p>
          <div className="flex justify-center gap-4">
            <button className="bg-white text-primary-800 font-bold py-3 px-8 rounded-full shadow-lg hover:bg-gray-100 transition-colors flex items-center gap-2">
              <Search className="w-5 h-5" /> Browse Plots
            </button>
          </div>
        </div>
      </section>

      {/* Flagship Feature: 3D Planner */}
      <div className="mt-[-2rem] px-4 sm:px-6 lg:px-8 relative z-20">
        <AntigravityPlanner locality="Bhogapuram" />
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-12 grid grid-cols-1 lg:grid-cols-4 gap-8">
        {/* Main Content / Property Feed */}
        <div className="lg:col-span-3 space-y-6">
          <h2 className="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-2">
            <MapPin className="text-primary-600" />
            Top Plots in Bhogapuram
          </h2>
          
          {/* Dummy Property Cards */}
          {[1, 2, 3, 4, 5].map((_, index) => (
            <React.Fragment key={index}>
              <div className="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 flex flex-col md:flex-row gap-6 hover:shadow-md transition-shadow">
                <div className="w-full md:w-1/3 h-48 bg-gray-200 rounded-xl bg-cover bg-center" style={{ backgroundImage: 'url(https://images.unsplash.com/photo-1500382017468-9049fed747ef?auto=format&fit=crop&q=80&w=600)' }}></div>
                <div className="w-full md:w-2/3 flex flex-col justify-between">
                  <div>
                    <div className="text-primary-600 text-sm font-bold tracking-wide uppercase mb-1">VUDA Approved</div>
                    <h3 className="text-xl font-bold text-gray-900 mb-2">200 Sq Yd Premium Plot</h3>
                    <p className="text-gray-600 text-sm mb-4">East facing plot in a secure gated community just 5 minutes from Bhogapuram Airport. Ideal for future villa construction.</p>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="text-2xl font-extrabold text-gray-900">₹45 Lakhs</span>
                    <button className="bg-primary-600 text-white px-6 py-2 rounded-lg font-semibold hover:bg-primary-700 transition-colors">View Details</button>
                  </div>
                </div>
              </div>
              
              {/* Insert AdSense every 3 items */}
              {index === 2 && <AdSenseInFeedCard />}
            </React.Fragment>
          ))}
        </div>

        {/* Sidebar */}
        <div className="hidden lg:block space-y-6">
          <AdSenseStickySidebar />
        </div>
      </div>
    </div>
  );
}
