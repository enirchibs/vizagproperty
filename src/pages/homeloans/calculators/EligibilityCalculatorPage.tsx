import { useState, useMemo } from 'react';
import { SEOHead } from '../../../components/SEOHead';
import { ArrowLeft, CheckCircle2 } from 'lucide-react';
import { Link, useLocation } from 'react-router-dom';
import { MOCK_BANKS } from '../../../data/mockBanks';

export function EligibilityCalculatorPage() {
  const location = useLocation();
  const initialState = location.state || {};

  const [monthlyIncome, setMonthlyIncome] = useState<number>(Number(initialState.income) || 100000);
  const [existingEMI, setExistingEMI] = useState<number>(0);
  const [tenureYears, setTenureYears] = useState<number>(20);
  const [interestRate, setInterestRate] = useState<number>(8.5);

  const eligibility = useMemo(() => {
    // Basic FOIR (Fixed Obligation to Income Ratio) calculation
    // Assume 50% of income can be used for total EMIs
    const maxEmiAllowed = (monthlyIncome * 0.50) - existingEMI;
    
    if (maxEmiAllowed <= 0) {
      return { eligibleLoan: 0, maxEmi: 0, status: 'rejected' };
    }

    const R = (interestRate / 12) / 100;
    const N = tenureYears * 12;

    // Inverse EMI formula to find Principal
    const eligibleLoan = (maxEmiAllowed * (Math.pow(1 + R, N) - 1)) / (R * Math.pow(1 + R, N));

    return {
      eligibleLoan: Math.round(eligibleLoan),
      maxEmi: Math.round(maxEmiAllowed),
      status: 'approved'
    };
  }, [monthlyIncome, existingEMI, tenureYears, interestRate]);

  const recommendedBanks = MOCK_BANKS.slice(0, 3); // Just pick top 3 for UI demo

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead title="Home Loan Eligibility Calculator | VizagProperty" description="Check your home loan eligibility instantly based on your income and existing EMIs." />

      <div className="bg-slate-900 pt-8 pb-32">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <Link to="/home-loans" className="inline-flex items-center text-slate-400 hover:text-white mb-6 transition-colors font-semibold text-sm">
            <ArrowLeft className="w-4 h-4 mr-2" /> Back to Home Loans
          </Link>
          <h1 className="text-3xl md:text-5xl font-black text-white mb-4">Eligibility Calculator</h1>
          <p className="text-slate-300">Find out how much loan you can get based on your income.</p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-20 relative z-10">
        <div className="bg-white rounded-3xl shadow-xl overflow-hidden border border-gray-100 flex flex-col lg:flex-row">
          
          {/* Controls */}
          <div className="lg:w-1/2 p-8 md:p-12 border-r border-gray-100 space-y-8">
            <div>
              <div className="flex justify-between mb-2">
                <label className="font-bold text-gray-700">Monthly Net Income</label>
                <span className="font-black text-primary-700 bg-primary-50 px-3 py-1 rounded-lg">₹ {monthlyIncome.toLocaleString('en-IN')}</span>
              </div>
              <input 
                type="range" min="20000" max="1000000" step="5000"
                value={monthlyIncome} onChange={e => setMonthlyIncome(Number(e.target.value))}
                className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-primary-600"
              />
            </div>

            <div>
              <div className="flex justify-between mb-2">
                <label className="font-bold text-gray-700">Existing EMIs (Monthly)</label>
                <span className="font-black text-primary-700 bg-primary-50 px-3 py-1 rounded-lg">₹ {existingEMI.toLocaleString('en-IN')}</span>
              </div>
              <input 
                type="range" min="0" max="500000" step="1000"
                value={existingEMI} onChange={e => setExistingEMI(Number(e.target.value))}
                className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-primary-600"
              />
            </div>

            <div>
              <div className="flex justify-between mb-2">
                <label className="font-bold text-gray-700">Interest Rate (% P.A.)</label>
                <span className="font-black text-primary-700 bg-primary-50 px-3 py-1 rounded-lg">{interestRate}%</span>
              </div>
              <input 
                type="range" min="6" max="15" step="0.1"
                value={interestRate} onChange={e => setInterestRate(Number(e.target.value))}
                className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-primary-600"
              />
            </div>

            <div>
              <div className="flex justify-between mb-2">
                <label className="font-bold text-gray-700">Tenure (Years)</label>
                <span className="font-black text-primary-700 bg-primary-50 px-3 py-1 rounded-lg">{tenureYears} Yrs</span>
              </div>
              <input 
                type="range" min="1" max="30" step="1"
                value={tenureYears} onChange={e => setTenureYears(Number(e.target.value))}
                className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-primary-600"
              />
            </div>
          </div>

          {/* Results */}
          <div className="lg:w-1/2 bg-gray-50 p-8 md:p-12">
            {eligibility.status === 'rejected' ? (
              <div className="h-full flex flex-col items-center justify-center text-center">
                <div className="w-20 h-20 bg-red-100 text-red-500 rounded-full flex items-center justify-center mb-6">
                  <span className="text-3xl font-black">!</span>
                </div>
                <h3 className="text-2xl font-black text-gray-900 mb-2">Not Eligible</h3>
                <p className="text-gray-600">Your existing EMIs exceed 50% of your monthly income. Consider clearing existing debts before applying for a new home loan.</p>
              </div>
            ) : (
              <div className="flex flex-col h-full">
                <div className="text-center mb-10">
                  <p className="text-gray-500 font-bold uppercase tracking-wider mb-2">You are eligible for a loan up to</p>
                  <h2 className="text-5xl lg:text-6xl font-black text-[#16A34A]">₹ {Math.floor(eligibility.eligibleLoan / 100000)} Lakhs</h2>
                  <p className="text-gray-400 font-semibold mt-2">(₹ {eligibility.eligibleLoan.toLocaleString('en-IN')})</p>
                </div>

                <div className="bg-white p-6 rounded-2xl border border-gray-200 shadow-sm flex justify-between items-center mb-10">
                  <div>
                    <p className="text-sm font-bold text-gray-500 mb-1">Max EMI you can afford</p>
                    <p className="text-2xl font-black text-gray-900">₹ {eligibility.maxEmi.toLocaleString('en-IN')} / mo</p>
                  </div>
                  <CheckCircle2 className="w-10 h-10 text-green-500" />
                </div>

                <div className="mt-auto">
                  <h4 className="font-bold text-gray-900 mb-4">Recommended Banks for You</h4>
                  <div className="space-y-3">
                    {recommendedBanks.map((bank: any) => (
                      <div key={bank.id} className="flex items-center justify-between bg-white p-3 rounded-xl border border-gray-100 shadow-sm">
                        <div className="flex items-center gap-3">
                          <img src={bank.logo} alt={bank.name} className="w-10 h-10 rounded-lg object-contain bg-gray-50 p-1 border border-gray-100" />
                          <div>
                            <p className="font-bold text-gray-900 text-sm">{bank.name}</p>
                            <p className="text-xs text-gray-500 font-semibold">{bank.interestRate.min}% p.a.</p>
                          </div>
                        </div>
                        <Link to={`/home-loans/banks/${bank.id}`} className="text-xs font-bold text-primary-600 hover:text-primary-800 bg-primary-50 px-3 py-1.5 rounded-lg transition-colors">
                          Apply
                        </Link>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            )}
          </div>

        </div>
      </div>
    </div>
  );
}
