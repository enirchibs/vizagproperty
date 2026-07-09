import { useState } from 'react';
import { Calculator, ChevronRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { MOCK_BANKS } from '../../data/mockBanks';
import { LoanLeadModal } from './LoanLeadModal';

interface PropertyLoanWidgetProps {
  propertyPrice: number;
}

export function PropertyLoanWidget({ propertyPrice }: PropertyLoanWidgetProps) {
  const [showModal, setShowModal] = useState(false);
  const [selectedBankName, setSelectedBankName] = useState<string | undefined>();
  
  // Down payment 20%, Loan 80%, Standard 20 years, Lowest available rate
  const loanAmount = propertyPrice * 0.8;
  const bestBank = MOCK_BANKS.reduce((prev, curr) => (prev.interestRate.min < curr.interestRate.min) ? prev : curr);
  const R = (bestBank.interestRate.min / 12) / 100;
  const N = 20 * 12;
  const emi = Math.round((loanAmount * R * Math.pow(1 + R, N)) / (Math.pow(1 + R, N) - 1));

  const handleApply = () => {
    setSelectedBankName(bestBank.name);
    setShowModal(true);
  };

  return (
    <div className="bg-gradient-to-br from-[#0F52BA] to-[#1E88E5] rounded-3xl p-6 text-white shadow-xl relative overflow-hidden my-8">
      {/* Background Decor */}
      <div className="absolute top-0 right-0 -mr-10 -mt-10 w-40 h-40 bg-white opacity-10 rounded-full blur-2xl"></div>
      
      <div className="flex items-center gap-3 mb-6 relative z-10">
        <div className="w-10 h-10 bg-white/20 rounded-xl flex items-center justify-center backdrop-blur-sm border border-white/10">
          <Calculator className="w-5 h-5 text-white" />
        </div>
        <div>
          <h3 className="font-black text-lg">Need a Home Loan?</h3>
          <p className="text-blue-100 text-xs font-medium">Estimated EMI for this property</p>
        </div>
      </div>

      <div className="bg-white/10 backdrop-blur-md border border-white/20 rounded-2xl p-5 mb-6 relative z-10">
        <div className="flex justify-between items-end mb-4 border-b border-white/10 pb-4">
          <div>
            <p className="text-blue-200 text-xs font-bold uppercase tracking-wider mb-1">Monthly EMI</p>
            <p className="text-3xl font-black">₹ {emi.toLocaleString('en-IN')}</p>
          </div>
          <div className="text-right">
            <p className="text-blue-200 text-xs font-bold uppercase tracking-wider mb-1">Interest</p>
            <p className="text-xl font-bold">{bestBank.interestRate.min}%</p>
          </div>
        </div>
        <div className="flex justify-between items-center text-sm font-medium">
          <span className="text-blue-100">Down Payment (20%)</span>
          <span>₹ {(propertyPrice * 0.2).toLocaleString('en-IN')}</span>
        </div>
      </div>

      <div className="flex flex-col gap-3 relative z-10">
        <button 
          onClick={handleApply}
          className="w-full bg-accent-500 hover:bg-accent-600 text-white font-bold py-3.5 rounded-xl shadow-lg transition-colors flex items-center justify-center gap-2"
        >
          Get Pre-Approved <ChevronRight className="w-4 h-4" />
        </button>
        <Link 
          to={`/home-loans/compare`} 
          className="w-full bg-white/10 hover:bg-white/20 text-white font-bold py-3.5 rounded-xl transition-colors text-center text-sm"
        >
          Compare All Banks
        </Link>
      </div>

      <LoanLeadModal isOpen={showModal} onClose={() => setShowModal(false)} selectedBankName={selectedBankName} />
    </div>
  );
}
