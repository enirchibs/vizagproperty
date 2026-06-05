import { Shield, Target, Users, Zap } from 'lucide-react';

export function AboutUsPage() {
  return (
    <div className="min-h-screen bg-gray-50 py-16 px-4 sm:px-6 lg:px-8">
      <div className="max-w-4xl mx-auto">
        <div className="text-center mb-16">
          <h1 className="text-4xl font-extrabold text-gray-900 sm:text-5xl mb-4">
            About Vizag Property Experts
          </h1>
          <p className="text-xl text-gray-600 max-w-2xl mx-auto">
            Simplifying real estate in Visakhapatnam through AI-driven insights, verified listings, and unparalleled transparency.
          </p>
        </div>

        <div className="bg-white rounded-3xl shadow-sm border border-gray-100 overflow-hidden mb-16">
          <div className="p-8 sm:p-12">
            <h2 className="text-2xl font-bold text-gray-900 mb-6">Our Mission</h2>
            <p className="text-gray-600 leading-relaxed text-lg mb-8">
              At Vizag Property Experts, our mission is to make finding, buying, or renting a property in Visakhapatnam as seamless and stress-free as possible. We understand that real estate decisions are monumental, which is why we've combined advanced AI technology with deep local expertise to bring you the best verified properties in the City of Destiny.
            </p>
            <p className="text-gray-600 leading-relaxed text-lg">
              Whether you are looking for a luxury villa in Rushikonda, a premium flat in Madhurawada, or a secure VMRDA-approved plot in PM Palem, our platform is designed to give you instant, accurate, and personalized recommendations.
            </p>
          </div>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-16">
          <div className="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 flex flex-col items-center text-center">
            <div className="w-16 h-16 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center mb-6">
              <Shield className="w-8 h-8" />
            </div>
            <h3 className="text-xl font-bold text-gray-900 mb-3">Verified Listings</h3>
            <p className="text-gray-600">
              We take trust seriously. Every property listed on our platform undergoes a verification process to ensure authenticity and safety for our buyers.
            </p>
          </div>
          
          <div className="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 flex flex-col items-center text-center">
            <div className="w-16 h-16 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center mb-6">
              <Zap className="w-8 h-8" />
            </div>
            <h3 className="text-xl font-bold text-gray-900 mb-3">AI-Powered Search</h3>
            <p className="text-gray-600">
              Our advanced AI technology understands natural language, helping you find exactly what you're looking for faster than traditional search engines.
            </p>
          </div>

          <div className="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 flex flex-col items-center text-center">
            <div className="w-16 h-16 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center mb-6">
              <Target className="w-8 h-8" />
            </div>
            <h3 className="text-xl font-bold text-gray-900 mb-3">Local Expertise</h3>
            <p className="text-gray-600">
              We know Vizag inside and out. From upcoming development zones to established luxury neighborhoods, our insights guide you to the best investments.
            </p>
          </div>

          <div className="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 flex flex-col items-center text-center">
            <div className="w-16 h-16 bg-primary-100 text-primary-600 rounded-full flex items-center justify-center mb-6">
              <Users className="w-8 h-8" />
            </div>
            <h3 className="text-xl font-bold text-gray-900 mb-3">Customer First</h3>
            <p className="text-gray-600">
              Your satisfaction is our priority. We provide seamless communication via WhatsApp and a dedicated support team to assist you at every step.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}
