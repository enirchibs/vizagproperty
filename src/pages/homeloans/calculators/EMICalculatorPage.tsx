import { useState, useMemo } from 'react';
import { SEOHead } from '../../../components/SEOHead';
import { PieChart, Pie, Cell, ResponsiveContainer, Tooltip as RechartsTooltip, Legend } from 'recharts';
import { Printer, ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';

export function EMICalculatorPage() {
  const [principal, setPrincipal] = useState<number>(5000000);
  const [interestRate, setInterestRate] = useState<number>(8.5);
  const [tenureYears, setTenureYears] = useState<number>(20);

  // EMI Calculation Logic
  const emiDetails = useMemo(() => {
    const P = principal;
    const R = (interestRate / 12) / 100;
    const N = tenureYears * 12;

    let emi = 0;
    let totalAmount = 0;
    let totalInterest = 0;

    if (P > 0 && R > 0 && N > 0) {
      emi = (P * R * Math.pow(1 + R, N)) / (Math.pow(1 + R, N) - 1);
      totalAmount = emi * N;
      totalInterest = totalAmount - P;
    }

    return {
      emi: Math.round(emi),
      totalInterest: Math.round(totalInterest),
      totalAmount: Math.round(totalAmount),
      principal: P
    };
  }, [principal, interestRate, tenureYears]);

  const chartData = [
    { name: 'Principal Amount', value: emiDetails.principal },
    { name: 'Total Interest', value: emiDetails.totalInterest }
  ];

  const COLORS = ['#0F52BA', '#FF6B00'];

  const schema = {
    "@context": "https://schema.org",
    "@type": "WebApplication",
    "name": "Home Loan EMI Calculator",
    "applicationCategory": "CalculatorApplication"
  };

  const handlePrint = () => {
    window.print();
  };

  return (
    <div className="min-h-screen bg-gray-50 pb-20 print:bg-white print:pb-0">
      <SEOHead title="Home Loan EMI Calculator | Check Monthly Installment" description="Calculate your home loan EMI instantly. Adjust loan amount, interest rate, and tenure." schema={schema} />

      {/* Non-Printable Header */}
      <div className="bg-slate-900 pt-8 pb-32 print:hidden">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <Link to="/home-loans" className="inline-flex items-center text-slate-400 hover:text-white mb-6 transition-colors font-semibold text-sm">
            <ArrowLeft className="w-4 h-4 mr-2" /> Back to Home Loans
          </Link>
          <div className="flex justify-between items-end">
            <div>
              <h1 className="text-3xl md:text-5xl font-black text-white mb-4">EMI Calculator</h1>
              <p className="text-slate-300">Plan your home loan repayment with our advanced calculator.</p>
            </div>
            <button 
              onClick={handlePrint}
              className="bg-white/10 hover:bg-white/20 text-white px-4 py-2 rounded-lg flex items-center gap-2 transition-colors font-bold text-sm"
            >
              <Printer className="w-4 h-4" /> Download PDF / Print
            </button>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-20 relative z-10 print:mt-8">
        
        {/* Printable Header - Only shows when printing */}
        <div className="hidden print:block mb-8 text-center border-b-2 border-gray-200 pb-4">
          <h1 className="text-3xl font-black text-gray-900">VizagProperty Home Loan EMI Report</h1>
          <p className="text-gray-500">Generated on {new Date().toLocaleDateString()}</p>
        </div>

        <div className="bg-white rounded-3xl shadow-xl overflow-hidden border border-gray-100 flex flex-col lg:flex-row print:shadow-none print:border-none">
          
          {/* Controls Section */}
          <div className="lg:w-1/2 p-8 md:p-12 border-r border-gray-100">
            <div className="space-y-8">
              
              <div>
                <div className="flex justify-between mb-2">
                  <label className="font-bold text-gray-700">Loan Amount</label>
                  <span className="font-black text-primary-700 bg-primary-50 px-3 py-1 rounded-lg">₹ {principal.toLocaleString('en-IN')}</span>
                </div>
                <input 
                  type="range" 
                  min="100000" 
                  max="100000000" 
                  step="100000"
                  value={principal} 
                  onChange={(e) => setPrincipal(Number(e.target.value))}
                  className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-primary-600 print:hidden"
                />
                <div className="flex justify-between text-xs font-bold text-gray-400 mt-2 print:hidden">
                  <span>1 L</span>
                  <span>10 Cr</span>
                </div>
              </div>

              <div>
                <div className="flex justify-between mb-2">
                  <label className="font-bold text-gray-700">Interest Rate (% P.A.)</label>
                  <span className="font-black text-primary-700 bg-primary-50 px-3 py-1 rounded-lg">{interestRate}%</span>
                </div>
                <input 
                  type="range" 
                  min="5" 
                  max="15" 
                  step="0.1"
                  value={interestRate} 
                  onChange={(e) => setInterestRate(Number(e.target.value))}
                  className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-primary-600 print:hidden"
                />
                <div className="flex justify-between text-xs font-bold text-gray-400 mt-2 print:hidden">
                  <span>5%</span>
                  <span>15%</span>
                </div>
              </div>

              <div>
                <div className="flex justify-between mb-2">
                  <label className="font-bold text-gray-700">Loan Tenure (Years)</label>
                  <span className="font-black text-primary-700 bg-primary-50 px-3 py-1 rounded-lg">{tenureYears} Yrs</span>
                </div>
                <input 
                  type="range" 
                  min="1" 
                  max="30" 
                  step="1"
                  value={tenureYears} 
                  onChange={(e) => setTenureYears(Number(e.target.value))}
                  className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-primary-600 print:hidden"
                />
                <div className="flex justify-between text-xs font-bold text-gray-400 mt-2 print:hidden">
                  <span>1 Yr</span>
                  <span>30 Yrs</span>
                </div>
              </div>

            </div>
          </div>

          {/* Visualization Section */}
          <div className="lg:w-1/2 bg-gray-50 p-8 md:p-12 flex flex-col justify-center print:bg-white print:p-0 print:ml-8">
            <div className="text-center mb-8">
              <p className="text-gray-500 font-bold uppercase tracking-wider mb-2">Monthly EMI</p>
              <h2 className="text-5xl font-black text-gray-900">₹ {emiDetails.emi.toLocaleString('en-IN')}</h2>
            </div>
            
            <div className="h-64 w-full">
              <ResponsiveContainer width="100%" height="100%">
                <PieChart>
                  <Pie
                    data={chartData}
                    cx="50%"
                    cy="50%"
                    innerRadius={70}
                    outerRadius={100}
                    paddingAngle={2}
                    dataKey="value"
                  >
                    {chartData.map((_entry, index) => (
                      <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                    ))}
                  </Pie>
                  <RechartsTooltip formatter={(value: any) => `₹ ${value.toLocaleString('en-IN')}`} />
                  <Legend verticalAlign="bottom" height={36} />
                </PieChart>
              </ResponsiveContainer>
            </div>

            <div className="grid grid-cols-2 gap-4 mt-8">
              <div className="bg-white p-4 rounded-xl border border-gray-200 shadow-sm text-center">
                <p className="text-sm font-bold text-gray-500 mb-1">Total Principal</p>
                <p className="text-lg font-black text-[#0F52BA]">₹ {emiDetails.principal.toLocaleString('en-IN')}</p>
              </div>
              <div className="bg-white p-4 rounded-xl border border-gray-200 shadow-sm text-center">
                <p className="text-sm font-bold text-gray-500 mb-1">Total Interest</p>
                <p className="text-lg font-black text-[#FF6B00]">₹ {emiDetails.totalInterest.toLocaleString('en-IN')}</p>
              </div>
              <div className="col-span-2 bg-white p-4 rounded-xl border border-gray-200 shadow-sm text-center">
                <p className="text-sm font-bold text-gray-500 mb-1">Total Amount Payable</p>
                <p className="text-2xl font-black text-gray-900">₹ {emiDetails.totalAmount.toLocaleString('en-IN')}</p>
              </div>
            </div>
          </div>
          
        </div>
      </div>
    </div>
  );
}
