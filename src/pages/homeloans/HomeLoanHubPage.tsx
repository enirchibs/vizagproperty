import { useState } from 'react';
import { SEOHead } from '../../components/SEOHead';
import { MOCK_BANKS } from '../../data/mockBanks';
import { BankCard } from '../../components/homeloans/BankCard';
import { LoanLeadModal } from '../../components/homeloans/LoanLeadModal';
import { Calculator, ArrowRight, TrendingUp, CheckCircle2, Search, IndianRupee } from 'lucide-react';
import { Link, useNavigate } from 'react-router-dom';

export function HomeLoanHubPage() {
  const navigate = useNavigate();
  const [showModal, setShowModal] = useState(false);
  const [selectedBankName, setSelectedBankName] = useState<string | undefined>();
  const [comparedBanks, setComparedBanks] = useState<string[]>([]);
  
  const [searchParams, setSearchParams] = useState({
    loanAmount: '',
    income: '',
    propertyValue: '',
    employment: 'salaried'
  });

  const schema = {
    "@context": "https://schema.org",
    "@type": "WebPage",
    "name": "Compare Home Loans from India's Top Banks | VizagProperty",
    "description": "Compare lowest home loan interest rates from SBI, HDFC, ICICI, Axis and 10+ more banks. Instant eligibility check, zero processing fee offers.",
    "url": "https://vizagproperty.co.in/home-loans"
  };

  const handleApply = (bankId: string) => {
    const bank = MOCK_BANKS.find(b => b.id === bankId);
    setSelectedBankName(bank?.name);
    setShowModal(true);
  };

  const handleCompareToggle = (bankId: string, isChecked: boolean) => {
    if (isChecked) {
      if (comparedBanks.length >= 4) {
        alert("You can compare up to 4 banks at a time.");
        return;
      }
      setComparedBanks([...comparedBanks, bankId]);
    } else {
      setComparedBanks(comparedBanks.filter(id => id !== bankId));
    }
  };

  const handleSearchSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    navigate('/home-loans/eligibility', { state: searchParams });
  };

  return (
    <div className="min-h-screen bg-[#F8FAFC]">
      <SEOHead 
        title="Compare Home Loans | Lowest Interest Rates | VizagProperty"
        description="Compare home loan interest rates from India's top 15+ banks. Check your eligibility instantly, use our advanced EMI calculator, and apply 100% online."
        schema={schema}
      />

      {/* Premium Hero Section */}
      <div className="relative bg-gradient-to-br from-[#0F52BA] via-[#0F52BA] to-[#1E88E5] pt-20 pb-40 overflow-hidden">
        {/* Abstract Background Shapes */}
        <div className="absolute top-0 right-0 -mt-20 -mr-20 w-96 h-96 bg-white opacity-5 rounded-full blur-3xl"></div>
        <div className="absolute bottom-0 left-10 -mb-20 w-80 h-80 bg-accent-500 opacity-10 rounded-full blur-3xl"></div>
        
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 text-center">
          <span className="inline-block px-4 py-1.5 bg-white/10 backdrop-blur-md border border-white/20 text-white rounded-full text-sm font-bold uppercase tracking-wider mb-6">
            India's Most Trusted Home Loan Marketplace
          </span>
          <h1 className="text-4xl md:text-6xl font-black text-white mb-6 leading-tight">
            Compare Home Loans from <br className="hidden md:block" />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-accent-400 to-yellow-400">
              India's Top Banks
            </span>
          </h1>
          <p className="text-xl text-blue-100 max-w-2xl mx-auto mb-12 font-medium">
            Lowest Interest Rates • Instant Eligibility Check • Fast Approval • 100% Online Process
          </p>

          {/* Large Search Box */}
          <div className="bg-white rounded-3xl p-4 md:p-6 shadow-2xl max-w-5xl mx-auto text-left transform translate-y-12">
            <form onSubmit={handleSearchSubmit} className="grid grid-cols-1 md:grid-cols-4 lg:grid-cols-5 gap-4">
              <div className="lg:col-span-1">
                <label className="block text-xs font-bold text-gray-500 uppercase tracking-wide mb-1.5">Loan Amount</label>
                <div className="relative">
                  <IndianRupee className="absolute left-3 top-3 w-5 h-5 text-gray-400" />
                  <input 
                    type="number"
                    required
                    value={searchParams.loanAmount}
                    onChange={e => setSearchParams({...searchParams, loanAmount: e.target.value})}
                    className="w-full pl-10 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 outline-none font-bold text-gray-900"
                    placeholder="50,00,000"
                  />
                </div>
              </div>
              <div className="lg:col-span-1">
                <label className="block text-xs font-bold text-gray-500 uppercase tracking-wide mb-1.5">Monthly Income</label>
                <div className="relative">
                  <IndianRupee className="absolute left-3 top-3 w-5 h-5 text-gray-400" />
                  <input 
                    type="number"
                    required
                    value={searchParams.income}
                    onChange={e => setSearchParams({...searchParams, income: e.target.value})}
                    className="w-full pl-10 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 outline-none font-bold text-gray-900"
                    placeholder="1,00,000"
                  />
                </div>
              </div>
              <div className="lg:col-span-1">
                <label className="block text-xs font-bold text-gray-500 uppercase tracking-wide mb-1.5">Property Value</label>
                <div className="relative">
                  <IndianRupee className="absolute left-3 top-3 w-5 h-5 text-gray-400" />
                  <input 
                    type="number"
                    value={searchParams.propertyValue}
                    onChange={e => setSearchParams({...searchParams, propertyValue: e.target.value})}
                    className="w-full pl-10 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 outline-none font-bold text-gray-900"
                    placeholder="65,00,000"
                  />
                </div>
              </div>
              <div className="lg:col-span-1">
                <label className="block text-xs font-bold text-gray-500 uppercase tracking-wide mb-1.5">Employment</label>
                <select 
                  value={searchParams.employment}
                  onChange={e => setSearchParams({...searchParams, employment: e.target.value})}
                  className="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 outline-none font-bold text-gray-900 appearance-none"
                >
                  <option value="salaried">Salaried</option>
                  <option value="self_employed">Self Employed</option>
                  <option value="business">Business Owner</option>
                </select>
              </div>
              <div className="lg:col-span-1 flex items-end">
                <button type="submit" className="w-full h-[50px] bg-accent-500 hover:bg-accent-600 text-white font-bold rounded-xl shadow-lg transition-colors flex items-center justify-center gap-2">
                  <Search className="w-5 h-5" />
                  Calculate
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>

      {/* Main Content Area */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-8 pt-20 pb-20 relative z-20">
        
        {/* Quick Tools Navigation */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-16">
          <Link to="/home-loans/emi-calculator" className="bg-white p-6 rounded-3xl shadow-sm border border-gray-100 hover:shadow-md hover:border-primary-200 transition-all group flex flex-col items-center text-center">
            <div className="w-12 h-12 bg-blue-50 text-primary-600 rounded-full flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
              <Calculator className="w-6 h-6" />
            </div>
            <h3 className="font-bold text-gray-900">EMI Calculator</h3>
            <p className="text-xs text-gray-500 mt-1">Calculate monthly payments</p>
          </Link>
          <Link to="/home-loans/eligibility" className="bg-white p-6 rounded-3xl shadow-sm border border-gray-100 hover:shadow-md hover:border-primary-200 transition-all group flex flex-col items-center text-center">
            <div className="w-12 h-12 bg-green-50 text-green-600 rounded-full flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
              <CheckCircle2 className="w-6 h-6" />
            </div>
            <h3 className="font-bold text-gray-900">Check Eligibility</h3>
            <p className="text-xs text-gray-500 mt-1">Find your max loan amount</p>
          </Link>
          <Link to="/home-loans/affordability" className="bg-white p-6 rounded-3xl shadow-sm border border-gray-100 hover:shadow-md hover:border-primary-200 transition-all group flex flex-col items-center text-center">
            <div className="w-12 h-12 bg-purple-50 text-purple-600 rounded-full flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
              <TrendingUp className="w-6 h-6" />
            </div>
            <h3 className="font-bold text-gray-900">Affordability</h3>
            <p className="text-xs text-gray-500 mt-1">Know your budget</p>
          </Link>
          <Link to="/home-loans/stamp-duty" className="bg-white p-6 rounded-3xl shadow-sm border border-gray-100 hover:shadow-md hover:border-primary-200 transition-all group flex flex-col items-center text-center">
            <div className="w-12 h-12 bg-orange-50 text-orange-600 rounded-full flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
              <IndianRupee className="w-6 h-6" />
            </div>
            <h3 className="font-bold text-gray-900">Stamp Duty</h3>
            <p className="text-xs text-gray-500 mt-1">State-wise tax calculator</p>
          </Link>
        </div>

        {/* Floating Compare Action Bar */}
        {comparedBanks.length > 0 && (
          <div className="fixed bottom-6 left-1/2 -translate-x-1/2 z-50 bg-slate-900 text-white px-6 py-4 rounded-full shadow-2xl flex items-center gap-6 animate-slide-up">
            <div className="flex items-center gap-3">
              <span className="bg-primary-600 text-white w-8 h-8 rounded-full flex items-center justify-center font-bold">
                {comparedBanks.length}
              </span>
              <span className="font-semibold">Banks Selected</span>
            </div>
            <Link 
              to={`/home-loans/compare?banks=${comparedBanks.join(',')}`}
              className="bg-accent-500 hover:bg-accent-600 text-white font-bold py-2 px-6 rounded-full transition-colors flex items-center gap-2"
            >
              Compare Now <ArrowRight className="w-4 h-4" />
            </Link>
          </div>
        )}

        <div className="flex flex-col lg:flex-row gap-8">
          {/* Main Bank List */}
          <div className="lg:w-3/4 space-y-6">
            <div className="flex items-center justify-between mb-8">
              <h2 className="text-2xl font-black text-gray-900">Top Home Loan Offers</h2>
              <span className="text-sm font-semibold text-gray-500">{MOCK_BANKS.length} Banks Available</span>
            </div>
            
            <div className="space-y-6">
              {MOCK_BANKS.map((bank) => (
                <BankCard 
                  key={bank.id}
                  bank={bank}
                  onApply={handleApply}
                  onCompareToggle={handleCompareToggle}
                  isCompared={comparedBanks.includes(bank.id)}
                />
              ))}
            </div>
          </div>

          {/* Sidebar */}
          <div className="lg:w-1/4 space-y-6">
            {/* Guide Promo */}
            <div className="bg-gradient-to-br from-slate-900 to-slate-800 rounded-3xl p-6 text-white shadow-xl relative overflow-hidden">
              <div className="absolute top-0 right-0 w-32 h-32 bg-primary-500 opacity-20 rounded-full blur-2xl -mr-10 -mt-10"></div>
              <h3 className="text-xl font-bold mb-3">Need Expert Help?</h3>
              <p className="text-slate-300 text-sm mb-6">Read our comprehensive guides on home loans, EMIs, and tax benefits.</p>
              <Link to="/home-loans/guide" className="inline-flex items-center gap-2 text-accent-400 font-bold hover:text-accent-300 transition-colors">
                Read Guides <ArrowRight className="w-4 h-4" />
              </Link>
            </div>

            {/* Documents Promo */}
            <div className="bg-white rounded-3xl p-6 border border-gray-100 shadow-sm">
              <h3 className="font-bold text-gray-900 mb-2">Required Documents</h3>
              <p className="text-sm text-gray-600 mb-4">Be prepared. See the full checklist for Salaried, NRI, and Self-Employed.</p>
              <Link to="/home-loans/documents" className="inline-flex items-center gap-2 text-primary-600 font-bold hover:text-primary-700 transition-colors text-sm">
                View Checklist <ArrowRight className="w-4 h-4" />
              </Link>
            </div>
            
            {/* Ad Space */}
            <div className="bg-gray-100 rounded-3xl h-[400px] flex items-center justify-center border-2 border-dashed border-gray-200">
              <span className="text-gray-400 font-semibold text-sm">Advertisement Space</span>
            </div>
          </div>
        </div>
      </div>

      <LoanLeadModal 
        isOpen={showModal} 
        onClose={() => setShowModal(false)} 
        selectedBankName={selectedBankName}
      />
    </div>
  );
}
