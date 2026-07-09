import { useSearchParams, Link, Navigate } from 'react-router-dom';
import { SEOHead } from '../../components/SEOHead';
import { MOCK_BANKS } from '../../data/mockBanks';
import { ArrowLeft, CheckCircle2, XCircle } from 'lucide-react';

export function CompareBanksPage() {
  const [searchParams] = useSearchParams();
  const bankIds = searchParams.get('banks')?.split(',') || [];
  
  if (bankIds.length === 0) {
    return <Navigate to="/home-loans" />;
  }

  const banksToCompare = MOCK_BANKS.filter(b => bankIds.includes(b.id));

  const schema = {
    "@context": "https://schema.org",
    "@type": "WebPage",
    "name": "Compare Home Loans",
    "description": "Compare top home loans side by side."
  };

  const renderCheck = (condition: boolean) => 
    condition ? <CheckCircle2 className="w-5 h-5 text-green-500 mx-auto" /> : <XCircle className="w-5 h-5 text-gray-300 mx-auto" />;

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead title="Compare Home Loans | VizagProperty" description="Compare home loans side by side." schema={schema} />

      <div className="bg-slate-900 pt-8 pb-32">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <Link to="/home-loans" className="inline-flex items-center text-slate-400 hover:text-white mb-6 transition-colors font-semibold text-sm">
            <ArrowLeft className="w-4 h-4 mr-2" /> Back to Home Loans
          </Link>
          <h1 className="text-3xl md:text-5xl font-black text-white mb-4">Compare Home Loans</h1>
          <p className="text-slate-300">Detailed side-by-side comparison of your selected banks.</p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-20">
        <div className="bg-white rounded-3xl shadow-xl overflow-hidden border border-gray-200">
          <div className="overflow-x-auto">
            <table className="w-full text-left border-collapse min-w-[800px]">
              <thead>
                <tr>
                  <th className="p-6 bg-gray-50 border-b border-r border-gray-200 w-64 sticky left-0 z-20 shadow-[2px_0_5px_-2px_rgba(0,0,0,0.1)]">
                    <span className="text-sm font-bold text-gray-500 uppercase tracking-wider">Features</span>
                  </th>
                  {banksToCompare.map((bank) => (
                    <th key={bank.id} className="p-6 bg-white border-b border-gray-200 text-center min-w-[250px] align-top">
                      <div className="w-16 h-16 mx-auto bg-gray-50 rounded-xl p-2 mb-3 border border-gray-100 flex items-center justify-center">
                        <img src={bank.logo} alt={bank.name} className="max-w-full max-h-full rounded-lg" />
                      </div>
                      <h3 className="font-black text-gray-900 text-lg mb-4">{bank.name}</h3>
                      <button className="w-full bg-primary-600 hover:bg-primary-700 text-white font-bold py-2.5 rounded-xl transition-colors">
                        Apply Now
                      </button>
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-100">
                {/* Core Details */}
                <tr>
                  <td className="p-5 bg-gray-50 font-bold text-gray-700 border-r border-gray-200 sticky left-0 z-10">Interest Rate</td>
                  {banksToCompare.map((bank) => (
                    <td key={bank.id} className="p-5 text-center font-black text-gray-900 text-lg">
                      {bank.interestRate.min}% - {bank.interestRate.max}%
                    </td>
                  ))}
                </tr>
                <tr>
                  <td className="p-5 bg-gray-50 font-bold text-gray-700 border-r border-gray-200 sticky left-0 z-10">Rate Type</td>
                  {banksToCompare.map((bank) => (
                    <td key={bank.id} className="p-5 text-center font-semibold text-gray-600">
                      {bank.interestRate.type}
                    </td>
                  ))}
                </tr>
                <tr>
                  <td className="p-5 bg-gray-50 font-bold text-gray-700 border-r border-gray-200 sticky left-0 z-10">Processing Fee</td>
                  {banksToCompare.map((bank) => (
                    <td key={bank.id} className="p-5 text-center font-semibold text-gray-600">
                      {bank.processingFee}
                    </td>
                  ))}
                </tr>
                <tr>
                  <td className="p-5 bg-gray-50 font-bold text-gray-700 border-r border-gray-200 sticky left-0 z-10">Max Loan Amount</td>
                  {banksToCompare.map((bank) => (
                    <td key={bank.id} className="p-5 text-center font-semibold text-gray-600">
                      {bank.maxLoanAmount}
                    </td>
                  ))}
                </tr>
                <tr>
                  <td className="p-5 bg-gray-50 font-bold text-gray-700 border-r border-gray-200 sticky left-0 z-10">Max Tenure</td>
                  {banksToCompare.map((bank) => (
                    <td key={bank.id} className="p-5 text-center font-semibold text-gray-600">
                      {bank.maxTenureYears} Years
                    </td>
                  ))}
                </tr>
                
                {/* Boolean Checks (Simulated based on mock features string) */}
                <tr className="bg-gray-50/50">
                  <td className="p-5 font-bold text-gray-700 border-r border-gray-200 sticky left-0 z-10 bg-gray-50">Women Concession</td>
                  {banksToCompare.map((bank) => (
                    <td key={bank.id} className="p-5 text-center">
                      {renderCheck(bank.features.some(f => f.toLowerCase().includes('women')))}
                    </td>
                  ))}
                </tr>
                <tr className="bg-gray-50/50">
                  <td className="p-5 font-bold text-gray-700 border-r border-gray-200 sticky left-0 z-10 bg-gray-50">Balance Transfer</td>
                  {banksToCompare.map((bank) => (
                    <td key={bank.id} className="p-5 text-center">
                      {renderCheck(bank.features.some(f => f.toLowerCase().includes('balance')))}
                    </td>
                  ))}
                </tr>
                <tr className="bg-gray-50/50">
                  <td className="p-5 font-bold text-gray-700 border-r border-gray-200 sticky left-0 z-10 bg-gray-50">Zero Prepayment Charges</td>
                  {banksToCompare.map((bank) => (
                    <td key={bank.id} className="p-5 text-center">
                      {renderCheck(!bank.features.some(f => f.toLowerCase().includes('penalty')))}
                    </td>
                  ))}
                </tr>
                <tr className="bg-gray-50/50">
                  <td className="p-5 font-bold text-gray-700 border-r border-gray-200 sticky left-0 z-10 bg-gray-50">Digital Sanction</td>
                  {banksToCompare.map((bank) => (
                    <td key={bank.id} className="p-5 text-center">
                      {renderCheck(bank.features.some(f => f.toLowerCase().includes('digital') || f.toLowerCase().includes('instant') || f.toLowerCase().includes('fast')))}
                    </td>
                  ))}
                </tr>

                <tr>
                  <td className="p-5 bg-gray-50 font-bold text-gray-700 border-r border-gray-200 sticky left-0 z-10">Customer Rating</td>
                  {banksToCompare.map((bank) => (
                    <td key={bank.id} className="p-5 text-center">
                      <span className="inline-block bg-yellow-50 text-yellow-700 px-3 py-1 rounded-full text-sm font-bold">
                        ⭐ {bank.rating} / 5.0
                      </span>
                    </td>
                  ))}
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
}
