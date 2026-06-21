import { useEffect } from 'react'
import { Link } from 'react-router-dom'
import { TrendingUp, Building2, Users, ArrowRight, CheckCircle, Briefcase, GraduationCap, Home } from 'lucide-react'
import { SEOHead } from '../components/SEOHead'

export function PartnersPage() {
  useEffect(() => {
    window.scrollTo(0, 0)
  }, [])

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead 
        title="Partner With Vizag Property | Earn Commissions & Grow Your Network"
        description="Join VizagProperty.co.in as an Agent, Builder, or Referral Partner and earn commissions while growing your network across Visakhapatnam."
        url="https://vizagproperty.co.in/partners"
      />

      {/* Hero Section */}
      <div className="bg-gradient-to-br from-slate-900 via-primary-900 to-slate-900 text-white py-16 md:py-24 relative overflow-hidden">
        <div className="absolute top-0 right-0 w-96 h-96 bg-primary-500 rounded-full blur-[100px] opacity-20 -mr-20 -mt-20"></div>
        <div className="absolute bottom-0 left-0 w-96 h-96 bg-teal-500 rounded-full blur-[100px] opacity-20 -ml-20 -mb-20"></div>
        
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 text-center">
          <h1 className="text-4xl md:text-6xl font-extrabold mb-6 tracking-tight">
            Partner With <span className="text-transparent bg-clip-text bg-gradient-to-r from-teal-400 to-[#00BFA5]">VizagProperty.co.in</span>
          </h1>
          <p className="text-lg md:text-2xl text-gray-300 max-w-3xl mx-auto font-medium mb-10">
            Grow your income by helping buyers, sellers, tenants, landlords, and builders connect through VizagProperty.co.in.
          </p>
            <Link 
              to="/partner/apply" 
              className="inline-flex items-center justify-center px-8 py-4 bg-primary-600 hover:bg-primary-700 text-white rounded-xl font-bold text-lg shadow-lg hover:shadow-xl transition-all"
            >
              Become a Partner
            </Link>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-10 relative z-20">
        
        {/* Partner Categories Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-16">
          <div className="bg-white p-8 rounded-2xl shadow-xl border border-gray-100 hover:shadow-2xl transition-all group">
            <div className="w-16 h-16 bg-blue-100 text-blue-600 rounded-2xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
              <Users className="w-8 h-8" />
            </div>
            <h3 className="text-2xl font-bold text-gray-900 mb-4">1. Real Estate Agents</h3>
            <ul className="space-y-3 text-gray-600 mb-8">
              <li className="flex items-center gap-3"><CheckCircle className="w-5 h-5 text-blue-500" /> Post unlimited properties</li>
              <li className="flex items-center gap-3"><CheckCircle className="w-5 h-5 text-blue-500" /> Receive verified buyer enquiries</li>
              <li className="flex items-center gap-3"><CheckCircle className="w-5 h-5 text-blue-500" /> WhatsApp lead alerts</li>
              <li className="flex items-center gap-3"><CheckCircle className="w-5 h-5 text-blue-500" /> Dedicated agent profile</li>
            </ul>
          </div>

          <div className="bg-white p-8 rounded-2xl shadow-xl border border-gray-100 hover:shadow-2xl transition-all group">
            <div className="w-16 h-16 bg-orange-100 text-orange-600 rounded-2xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
              <Building2 className="w-8 h-8" />
            </div>
            <h3 className="text-2xl font-bold text-gray-900 mb-4">2. Builders & Developers</h3>
            <ul className="space-y-3 text-gray-600 mb-8">
              <li className="flex items-center gap-3"><CheckCircle className="w-5 h-5 text-orange-500" /> Project promotion</li>
              <li className="flex items-center gap-3"><CheckCircle className="w-5 h-5 text-orange-500" /> Featured project placement</li>
              <li className="flex items-center gap-3"><CheckCircle className="w-5 h-5 text-orange-500" /> Dedicated builder profile</li>
              <li className="flex items-center gap-3"><CheckCircle className="w-5 h-5 text-orange-500" /> Premium lead generation</li>
            </ul>
          </div>
        </div>

        {/* Deep Dive: Referral & Channel Partners */}
        <div className="bg-white rounded-3xl shadow-xl border border-gray-100 overflow-hidden mb-16">
          <div className="bg-gradient-to-r from-green-600 to-emerald-600 p-8 md:p-12 text-white">
            <div className="flex items-center gap-4 mb-6">
              <div className="w-16 h-16 bg-white/20 rounded-2xl flex items-center justify-center backdrop-blur-sm">
                <TrendingUp className="w-8 h-8 text-white" />
              </div>
              <h2 className="text-3xl md:text-4xl font-bold">3. Referral & Channel Partners</h2>
            </div>
            <p className="text-xl text-green-50 max-w-4xl leading-relaxed">
              Join VizagProperty.co.in and earn commissions by connecting property buyers, sellers, landlords, tenants, builders, and real estate agents. No prior real estate experience is required.
            </p>
          </div>

          <div className="p-8 md:p-12">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-12">
              
              {/* Benefits */}
              <div>
                <h3 className="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-2">
                  <TrendingUp className="w-6 h-6 text-green-600" /> Key Benefits
                </h3>
                <div className="space-y-4">
                  <div className="flex items-start gap-3">
                    <CheckCircle className="w-6 h-6 text-green-500 flex-shrink-0" />
                    <span className="text-gray-700 font-medium text-lg">Earn attractive referral commissions</span>
                  </div>
                  <div className="flex items-start gap-3">
                    <CheckCircle className="w-6 h-6 text-green-500 flex-shrink-0" />
                    <span className="text-gray-700 font-medium text-lg">Work from home or part-time</span>
                  </div>
                  <div className="flex items-start gap-3">
                    <CheckCircle className="w-6 h-6 text-green-500 flex-shrink-0" />
                    <span className="text-gray-700 font-medium text-lg">No real estate experience required</span>
                  </div>
                  <div className="flex items-start gap-3">
                    <CheckCircle className="w-6 h-6 text-green-500 flex-shrink-0" />
                    <span className="text-gray-700 font-medium text-lg">Flexible income opportunity</span>
                  </div>
                  <div className="flex items-start gap-3">
                    <CheckCircle className="w-6 h-6 text-green-500 flex-shrink-0" />
                    <span className="text-gray-700 font-medium text-lg">Free registration and training support</span>
                  </div>
                  <div className="flex items-start gap-3">
                    <CheckCircle className="w-6 h-6 text-green-500 flex-shrink-0" />
                    <span className="text-gray-700 font-medium text-lg">WhatsApp-based lead sharing</span>
                  </div>
                  <div className="flex items-start gap-3">
                    <CheckCircle className="w-6 h-6 text-green-500 flex-shrink-0" />
                    <span className="text-gray-700 font-medium text-lg">Unlimited earning potential</span>
                  </div>
                </div>
              </div>

              {/* Who Can Join */}
              <div className="bg-gray-50 p-8 rounded-2xl border border-gray-100">
                <h3 className="text-2xl font-bold text-gray-900 mb-6">Who Can Join?</h3>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div className="flex items-center gap-3 bg-white p-3 rounded-lg shadow-sm">
                    <Briefcase className="w-5 h-5 text-gray-400" />
                    <span className="text-gray-700 font-medium">Retired Employees</span>
                  </div>
                  <div className="flex items-center gap-3 bg-white p-3 rounded-lg shadow-sm">
                    <Users className="w-5 h-5 text-gray-400" />
                    <span className="text-gray-700 font-medium">Unemployed Individuals</span>
                  </div>
                  <div className="flex items-center gap-3 bg-white p-3 rounded-lg shadow-sm">
                    <GraduationCap className="w-5 h-5 text-gray-400" />
                    <span className="text-gray-700 font-medium">Students</span>
                  </div>
                  <div className="flex items-center gap-3 bg-white p-3 rounded-lg shadow-sm">
                    <Home className="w-5 h-5 text-gray-400" />
                    <span className="text-gray-700 font-medium">Homemakers</span>
                  </div>
                  <div className="flex items-center gap-3 bg-white p-3 rounded-lg shadow-sm">
                    <Briefcase className="w-5 h-5 text-gray-400" />
                    <span className="text-gray-700 font-medium">Working Professionals</span>
                  </div>
                  <div className="flex items-center gap-3 bg-white p-3 rounded-lg shadow-sm">
                    <Users className="w-5 h-5 text-gray-400" />
                    <span className="text-gray-700 font-medium">Freelancers</span>
                  </div>
                  <div className="flex items-center gap-3 bg-white p-3 rounded-lg shadow-sm">
                    <Users className="w-5 h-5 text-gray-400" />
                    <span className="text-gray-700 font-medium">Local Community Leaders</span>
                  </div>
                  <div className="flex items-center gap-3 bg-white p-3 rounded-lg shadow-sm">
                    <Building2 className="w-5 h-5 text-gray-400" />
                    <span className="text-gray-700 font-medium">Property Enthusiasts</span>
                  </div>
                </div>
              </div>
              
            </div>
          </div>
        </div>

        {/* Highlighted CTA Banner */}
        <div className="bg-gradient-to-r from-teal-900 via-emerald-900 to-teal-900 rounded-3xl p-8 md:p-12 text-center text-white relative overflow-hidden shadow-2xl">
          <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-full h-full bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-teal-500/20 via-transparent to-transparent"></div>
          
          <div className="relative z-10 max-w-4xl mx-auto flex flex-col items-center">
            <div className="w-20 h-20 bg-white/10 rounded-full flex items-center justify-center mb-8 backdrop-blur-md border border-white/20">
              <TrendingUp className="w-10 h-10 text-teal-300" />
            </div>
            <h2 className="text-3xl md:text-5xl font-extrabold mb-6 leading-tight">
              Turn Your Network Into Income
            </h2>
            <p className="text-lg md:text-xl text-teal-100 mb-10 max-w-3xl leading-relaxed">
              Know someone looking to buy, sell, rent, or invest in property? Refer them to VizagProperty.co.in and earn commissions on successful transactions.
            </p>
            <Link 
              to="/partner/apply" 
              className="inline-flex items-center justify-center px-10 py-5 bg-teal-400 hover:bg-teal-300 text-teal-950 font-extrabold text-xl rounded-full shadow-[0_0_30px_rgba(45,212,191,0.3)] hover:shadow-[0_0_40px_rgba(45,212,191,0.5)] hover:scale-105 transition-all"
            >
              Become a Referral Partner <ArrowRight className="ml-3 w-6 h-6" />
            </Link>
          </div>
        </div>

      </div>
    </div>
  )
}
