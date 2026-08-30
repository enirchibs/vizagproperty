import { SEOHead } from '../../components/SEOHead';
import { Users, Phone, MessageCircle, ShieldCheck } from 'lucide-react';
import { openWhatsApp } from '../../lib/whatsapp';
import { VIZAG_PROPERTY_PHONE_WITH_CODE } from '../../config/contact';

export function AgentsPage() {
  const canonicalUrl = 'https://vizagproperty.co.in/agents';

  const agents = [
    { name: 'Vizag Property Verified Support Team', area: 'All Visakhapatnam & VMRDA Region', experience: '12+ Years', phone: VIZAG_PROPERTY_PHONE_WITH_CODE, specialty: 'VMRDA Plots, Gated Apartments & Villas' },
    { name: 'Madhurawada & IT SEZ Property Desk', area: 'Madhurawada, Yendada, Rushikonda', experience: '10+ Years', phone: VIZAG_PROPERTY_PHONE_WITH_CODE, specialty: 'IT Employee Rentals & Luxury Flats' },
    { name: 'Bhogapuram Airport Highway Land Desk', area: 'Bhogapuram, Anandapuram, Tagarapuvalasa', experience: '15+ Years', phone: VIZAG_PROPERTY_PHONE_WITH_CODE, specialty: 'Highway Commercial Land & Layouts' }
  ];

  return (
    <div className="min-h-screen bg-gray-50 pb-16">
      <SEOHead
        title="Real Estate Agents in Vizag | Verified Property Consultants Visakhapatnam"
        description="Connect with top verified real estate agents and property consultants in Vizag. Expert guidance for buying VMRDA plots, flats & villas across Visakhapatnam."
        canonicalUrl={canonicalUrl}
        url={canonicalUrl}
        keywords="real estate agents in vizag, vizag property consultants, property brokers visakhapatnam, real estate advisors vizag"
      />

      <section className="bg-gradient-to-r from-primary-950 via-primary-900 to-slate-900 text-white py-14 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center gap-2 text-accent-400 text-xs md:text-sm font-bold uppercase tracking-wider mb-2">
            <Users className="w-4 h-4" /> Property Consultants Directory
          </div>
          <h1 className="text-3xl md:text-5xl font-extrabold tracking-tight mb-3">
            Verified Real Estate Agents in Vizag
          </h1>
          <p className="text-base md:text-lg text-gray-200 max-w-3xl leading-relaxed">
            Get personalized assistance from verified real estate specialists across Visakhapatnam.
          </p>
        </div>
      </section>

      <main className="max-w-7xl mx-auto px-4 py-10">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {agents.map((agent, i) => (
            <div key={i} className="bg-white p-6 rounded-3xl border border-gray-200 shadow-sm flex flex-col justify-between">
              <div>
                <div className="flex items-center gap-2 text-emerald-600 text-xs font-extrabold uppercase mb-2">
                  <ShieldCheck className="w-4 h-4" /> Verified Consultant
                </div>
                <h2 className="text-xl font-extrabold text-gray-900 mb-2">{agent.name}</h2>
                <p className="text-xs text-gray-600 mb-1"><strong>Operating Area:</strong> {agent.area}</p>
                <p className="text-xs text-gray-600 mb-1"><strong>Specialty:</strong> {agent.specialty}</p>
                <p className="text-xs text-gray-600 mb-4"><strong>Experience:</strong> {agent.experience}</p>
              </div>

              <div className="flex gap-2">
                <button
                  onClick={() => openWhatsApp(`Hi, I am looking for property assistance in Vizag with ${agent.name}`)}
                  className="flex-1 bg-emerald-600 hover:bg-emerald-700 text-white font-bold py-2.5 rounded-xl text-xs flex items-center justify-center gap-1 transition-all"
                >
                  <MessageCircle className="w-4 h-4" /> WhatsApp
                </button>
                <a
                  href={`tel:${agent.phone}`}
                  className="flex-1 bg-primary-600 hover:bg-primary-700 text-white font-bold py-2.5 rounded-xl text-xs flex items-center justify-center gap-1 transition-all"
                >
                  <Phone className="w-4 h-4" /> Call
                </a>
              </div>
            </div>
          ))}
        </div>
      </main>
    </div>
  );
}
