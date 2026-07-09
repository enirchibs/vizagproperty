import { useState } from 'react';
import { useParams, Link, Navigate } from 'react-router-dom';
import { SEOHead } from '../../components/SEOHead';
import { MOCK_BANKS } from '../../data/mockBanks';
import { ArrowLeft, CheckCircle2, ShieldCheck, Clock, Percent, IndianRupee } from 'lucide-react';
import { LoanLeadModal } from '../../components/homeloans/LoanLeadModal';

export function BankDetailsPage() {
  const { bankId } = useParams<{ bankId: string }>();
  const [showModal, setShowModal] = useState(false);
  
  const bank = MOCK_BANKS.find(b => b.id === bankId);
  
  if (!bank) {
    return <Navigate to="/home-loans" />;
  }

  const schema = {
    "@context": "https://schema.org",
    "@type": "FinancialProduct",
    "name": `${bank.name} Home Loan`,
    "brand": {
      "@type": "Brand",
      "name": bank.name
    },
    "offers": {
      "@type": "Offer",
      "price": "0",
      "priceCurrency": "INR"
    }
  };

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead 
        title={`${bank.name} Home Loan Interest Rates, Processing Fees & Eligibility | VizagProperty`} 
        description={`Get the latest home loan interest rates from ${bank.name}. Starting at ${bank.interestRate.min}%. Check eligibility, processing fees, and apply online.`} 
        schema={schema} 
      />

      {/* Hero Section */}
      <div className="bg-slate-900 pt-8 pb-32">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <Link to="/home-loans" className="inline-flex items-center text-slate-400 hover:text-white mb-8 transition-colors font-semibold text-sm">
            <ArrowLeft className="w-4 h-4 mr-2" /> Back to Home Loans
          </Link>
          
          <div className="flex flex-col md:flex-row items-center md:items-end gap-6 mb-8">
            <div className="w-32 h-32 bg-white rounded-3xl p-4 shadow-xl flex items-center justify-center flex-shrink-0">
              <img src={bank.logo} alt={bank.name} className="max-w-full max-h-full rounded-xl" />
            </div>
            <div className="text-center md:text-left text-white">
              <h1 className="text-4xl md:text-5xl font-black mb-2">{bank.name} Home Loan</h1>
              <p className="text-slate-300 text-lg">Trusted by millions of Indians for their dream homes.</p>
            </div>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-20 relative z-10">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          
          {/* Main Content */}
          <div className="lg:col-span-2 space-y-8">
            
            {/* Quick Stats Grid */}
            <div className="bg-white rounded-3xl p-8 shadow-xl border border-gray-100 grid grid-cols-2 md:grid-cols-4 gap-6">
              <div>
                <p className="text-sm font-semibold text-gray-500 mb-2 flex items-center gap-1.5"><Percent className="w-4 h-4 text-primary-500" /> Interest Rate</p>
                <p className="text-xl font-black text-gray-900">{bank.interestRate.min}% onwards</p>
                <p className="text-xs text-gray-400 mt-1">{bank.interestRate.type}</p>
              </div>
              <div>
                <p className="text-sm font-semibold text-gray-500 mb-2 flex items-center gap-1.5"><ShieldCheck className="w-4 h-4 text-primary-500" /> Processing Fee</p>
                <p className="text-xl font-black text-gray-900">{bank.processingFee.split('(')[0]}</p>
              </div>
              <div>
                <p className="text-sm font-semibold text-gray-500 mb-2 flex items-center gap-1.5"><IndianRupee className="w-4 h-4 text-primary-500" /> Max Loan</p>
                <p className="text-xl font-black text-gray-900">{bank.maxLoanAmount}</p>
              </div>
              <div>
                <p className="text-sm font-semibold text-gray-500 mb-2 flex items-center gap-1.5"><Clock className="w-4 h-4 text-primary-500" /> Max Tenure</p>
                <p className="text-xl font-black text-gray-900">{bank.maxTenureYears} Years</p>
              </div>
            </div>

            {/* Overview & Features */}
            <div className="bg-white rounded-3xl p-8 shadow-sm border border-gray-100">
              <h2 className="text-2xl font-black text-gray-900 mb-6">Overview & Key Features</h2>
              <div className="prose max-w-none text-gray-600 mb-8">
                <p>
                  {bank.name} offers highly competitive home loan interest rates starting from just {bank.interestRate.min}%. 
                  Whether you are purchasing a new apartment, buying a plot, or constructing a house, {bank.name} provides flexible 
                  repayment options and maximum tenure up to {bank.maxTenureYears} years to ensure your EMI stays affordable.
                </p>
              </div>
              
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {bank.features.map((feature, idx) => (
                  <div key={idx} className="flex items-start gap-3">
                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                    <span className="font-semibold text-gray-700">{feature}</span>
                  </div>
                ))}
              </div>
            </div>

            {/* Eligibility & Documents */}
            <div className="bg-white rounded-3xl p-8 shadow-sm border border-gray-100">
              <h2 className="text-2xl font-black text-gray-900 mb-6">Eligibility & Documents Required</h2>
              <div className="grid md:grid-cols-2 gap-8">
                <div>
                  <h3 className="font-bold text-gray-900 mb-4 bg-gray-50 p-3 rounded-lg">Eligibility Criteria</h3>
                  <ul className="space-y-3 text-sm text-gray-600">
                    <li className="flex items-center gap-2"><span className="w-1.5 h-1.5 bg-primary-500 rounded-full"></span> Age: 21 to 65 years</li>
                    <li className="flex items-center gap-2"><span className="w-1.5 h-1.5 bg-primary-500 rounded-full"></span> Employment: Salaried or Self-Employed</li>
                    <li className="flex items-center gap-2"><span className="w-1.5 h-1.5 bg-primary-500 rounded-full"></span> CIBIL Score: 700+ Recommended</li>
                    <li className="flex items-center gap-2"><span className="w-1.5 h-1.5 bg-primary-500 rounded-full"></span> Minimum Income: ₹25,000 / month</li>
                  </ul>
                </div>
                <div>
                  <h3 className="font-bold text-gray-900 mb-4 bg-gray-50 p-3 rounded-lg">Mandatory Documents</h3>
                  <ul className="space-y-3 text-sm text-gray-600">
                    <li className="flex items-center gap-2"><span className="w-1.5 h-1.5 bg-primary-500 rounded-full"></span> PAN Card & Aadhaar Card</li>
                    <li className="flex items-center gap-2"><span className="w-1.5 h-1.5 bg-primary-500 rounded-full"></span> Last 6 months bank statements</li>
                    <li className="flex items-center gap-2"><span className="w-1.5 h-1.5 bg-primary-500 rounded-full"></span> Last 3 months Salary Slips (Salaried)</li>
                    <li className="flex items-center gap-2"><span className="w-1.5 h-1.5 bg-primary-500 rounded-full"></span> ITR for last 2 years (Self Employed)</li>
                  </ul>
                </div>
              </div>
            </div>
            
          </div>

          {/* Sticky Sidebar */}
          <div className="lg:col-span-1">
            <div className="sticky top-24 bg-white rounded-3xl p-6 shadow-xl border border-primary-100">
              <h3 className="text-xl font-black text-gray-900 mb-4">Interested in {bank.name}?</h3>
              <p className="text-gray-600 text-sm mb-6">
                Apply now through VizagProperty to get exclusive processing fee waivers and priority processing.
              </p>
              
              <div className="bg-primary-50 p-4 rounded-xl mb-6">
                <div className="flex items-center justify-between mb-2">
                  <span className="text-sm font-semibold text-gray-600">Current Rate:</span>
                  <span className="font-black text-primary-700">{bank.interestRate.min}%</span>
                </div>
                <div className="flex items-center justify-between">
                  <span className="text-sm font-semibold text-gray-600">Our Rating:</span>
                  <span className="font-bold text-yellow-600">⭐ {bank.rating} / 5</span>
                </div>
              </div>

              <button 
                onClick={() => setShowModal(true)}
                className="w-full bg-gradient-to-r from-primary-600 to-primary-700 hover:from-primary-700 hover:to-primary-800 text-white font-black py-4 rounded-xl shadow-lg transition-all text-lg"
              >
                Apply Online Now
              </button>
              
              <p className="text-xs text-center text-gray-400 mt-4">
                100% secure. No hidden charges.
              </p>
            </div>
          </div>
          
        </div>
      </div>

      <LoanLeadModal isOpen={showModal} onClose={() => setShowModal(false)} selectedBankName={bank.name} />
    </div>
  );
}
