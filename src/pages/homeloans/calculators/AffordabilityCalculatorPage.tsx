import { useState, useMemo } from 'react';
import { SEOHead } from '../../../components/SEOHead';
import { ArrowLeft, Home, IndianRupee } from 'lucide-react';
import { Link } from 'react-router-dom';

export function AffordabilityCalculatorPage() {
  const [monthlyIncome, setMonthlyIncome] = useState<number>(150000);
  const [monthlyExpenses, setMonthlyExpenses] = useState<number>(40000);
  const [existingEMI, setExistingEMI] = useState<number>(15000);
  const [savings, setSavings] = useState<number>(1000000); // For down payment
  
  const interestRate = 8.5;
  const tenureYears = 20;

  const budget = useMemo(() => {
    // Net available for EMI = Income - Expenses - Existing EMI
    // But usually banks restrict total EMI to 50% of income anyway.
    const bankAllowedEmi = (monthlyIncome * 0.5) - existingEMI;
    const practicalEmi = monthlyIncome - monthlyExpenses - existingEMI;
    
    const maxEmi = Math.min(bankAllowedEmi, practicalEmi);
    
    if (maxEmi <= 0) {
      return { homeBudget: 0, loanAmount: 0, downPayment: savings, emi: 0 };
    }

    const R = (interestRate / 12) / 100;
    const N = tenureYears * 12;

    const loanAmount = (maxEmi * (Math.pow(1 + R, N) - 1)) / (R * Math.pow(1 + R, N));
    
    // Total budget = Loan + Savings(Downpayment)
    const totalBudget = loanAmount + savings;

    return {
      homeBudget: Math.round(totalBudget),
      loanAmount: Math.round(loanAmount),
      downPayment: savings,
      emi: Math.round(maxEmi)
    };
  }, [monthlyIncome, monthlyExpenses, existingEMI, savings]);

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead title="Home Affordability Calculator | VizagProperty" description="Calculate how much house you can afford based on your income, expenses, and savings." />

      <div className="bg-slate-900 pt-8 pb-32">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <Link to="/home-loans" className="inline-flex items-center text-slate-400 hover:text-white mb-6 transition-colors font-semibold text-sm">
            <ArrowLeft className="w-4 h-4 mr-2" /> Back to Home Loans
          </Link>
          <h1 className="text-3xl md:text-5xl font-black text-white mb-4">Affordability Calculator</h1>
          <p className="text-slate-300">Know exactly what property budget you should target.</p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-20 relative z-10">
        <div className="bg-white rounded-3xl shadow-xl overflow-hidden border border-gray-100 flex flex-col lg:flex-row">
          
          {/* Controls */}
          <div className="lg:w-1/2 p-8 md:p-12 border-r border-gray-100 space-y-6">
            <div>
              <label className="block font-bold text-gray-700 mb-2">Monthly Net Income</label>
              <div className="relative">
                <IndianRupee className="absolute left-4 top-3.5 w-5 h-5 text-gray-400" />
                <input 
                  type="number" value={monthlyIncome} onChange={e => setMonthlyIncome(Number(e.target.value))}
                  className="w-full pl-12 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 font-bold text-lg"
                />
              </div>
            </div>

            <div>
              <label className="block font-bold text-gray-700 mb-2">Monthly Living Expenses</label>
              <div className="relative">
                <IndianRupee className="absolute left-4 top-3.5 w-5 h-5 text-gray-400" />
                <input 
                  type="number" value={monthlyExpenses} onChange={e => setMonthlyExpenses(Number(e.target.value))}
                  className="w-full pl-12 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 font-bold text-lg"
                />
              </div>
            </div>

            <div>
              <label className="block font-bold text-gray-700 mb-2">Existing EMIs</label>
              <div className="relative">
                <IndianRupee className="absolute left-4 top-3.5 w-5 h-5 text-gray-400" />
                <input 
                  type="number" value={existingEMI} onChange={e => setExistingEMI(Number(e.target.value))}
                  className="w-full pl-12 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 font-bold text-lg"
                />
              </div>
            </div>

            <div>
              <label className="block font-bold text-gray-700 mb-2">Total Savings (Down Payment)</label>
              <div className="relative">
                <IndianRupee className="absolute left-4 top-3.5 w-5 h-5 text-gray-400" />
                <input 
                  type="number" value={savings} onChange={e => setSavings(Number(e.target.value))}
                  className="w-full pl-12 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 font-bold text-lg"
                />
              </div>
            </div>
            
            <p className="text-xs text-gray-400 mt-4 text-center">Calculations assume a standard {interestRate}% interest rate over {tenureYears} years.</p>
          </div>

          {/* Results */}
          <div className="lg:w-1/2 bg-gradient-to-br from-primary-900 to-primary-800 p-8 md:p-12 text-white flex flex-col justify-center relative overflow-hidden">
            <div className="absolute top-0 right-0 -mr-10 -mt-10 w-40 h-40 bg-white opacity-5 rounded-full blur-2xl"></div>
            
            {budget.homeBudget <= 0 ? (
              <div className="text-center">
                <p className="text-xl font-bold">Your expenses and EMIs exceed your income limits for a new home loan.</p>
              </div>
            ) : (
              <>
                <div className="text-center mb-12">
                  <p className="text-primary-200 font-bold uppercase tracking-wider mb-3">You can afford a house worth</p>
                  <h2 className="text-5xl lg:text-6xl font-black text-white">₹ {Math.floor(budget.homeBudget / 100000)} Lakhs</h2>
                  <p className="text-primary-300 font-medium mt-3">Target Budget: ₹ {budget.homeBudget.toLocaleString('en-IN')}</p>
                </div>

                <div className="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20">
                  <div className="flex justify-between items-center mb-4 pb-4 border-b border-white/10">
                    <span className="font-semibold text-primary-100">Estimated Loan Amount</span>
                    <span className="font-bold text-xl">₹ {budget.loanAmount.toLocaleString('en-IN')}</span>
                  </div>
                  <div className="flex justify-between items-center mb-4 pb-4 border-b border-white/10">
                    <span className="font-semibold text-primary-100">Your Down Payment</span>
                    <span className="font-bold text-xl">₹ {budget.downPayment.toLocaleString('en-IN')}</span>
                  </div>
                  <div className="flex justify-between items-center">
                    <span className="font-semibold text-primary-100">Estimated Monthly EMI</span>
                    <span className="font-bold text-2xl text-accent-400">₹ {budget.emi.toLocaleString('en-IN')}</span>
                  </div>
                </div>
                
                <div className="mt-8 text-center">
                  <Link to={`/search?maxPrice=${budget.homeBudget}`} className="inline-flex items-center gap-2 bg-white text-primary-900 font-bold py-3 px-8 rounded-xl hover:bg-gray-50 transition-colors shadow-lg">
                    <Home className="w-5 h-5" /> Browse Homes in this Budget
                  </Link>
                </div>
              </>
            )}
          </div>

        </div>
      </div>
    </div>
  );
}
