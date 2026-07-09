import { ShieldCheck, Percent, Clock, IndianRupee, CheckCircle2, ChevronRight } from 'lucide-react';
import { BankOffer } from '../../data/mockBanks';

interface BankCardProps {
  bank: BankOffer;
  onApply: (bankId: string) => void;
  onCompareToggle?: (bankId: string, isChecked: boolean) => void;
  isCompared?: boolean;
}

export function BankCard({ bank, onApply, onCompareToggle, isCompared = false }: BankCardProps) {
  return (
    <div className="bg-white rounded-3xl p-6 border border-gray-100 shadow-[0_4px_20px_-4px_rgba(0,0,0,0.05)] hover:shadow-[0_8px_30px_-4px_rgba(15,82,186,0.15)] transition-all duration-300 relative overflow-hidden group">
      {bank.isRecommended && (
        <div className="absolute top-0 right-0 bg-gradient-to-r from-green-500 to-emerald-600 text-white text-[10px] font-bold px-4 py-1.5 rounded-bl-2xl uppercase tracking-wider shadow-md">
          Recommended
        </div>
      )}
      
      <div className="flex flex-col md:flex-row gap-6 items-start md:items-center justify-between">
        
        {/* Bank Info */}
        <div className="flex items-center gap-4 w-full md:w-1/3">
          <div className="w-16 h-16 rounded-2xl bg-gray-50 border border-gray-100 p-2 flex items-center justify-center flex-shrink-0 group-hover:scale-105 transition-transform">
            {/* Real logos would go here, using a generic building icon for mock if image fails */}
            <img src={bank.logo} alt={bank.name} className="w-full h-full object-contain rounded-xl" />
          </div>
          <div>
            <h3 className="text-xl font-bold text-gray-900 leading-tight mb-1">{bank.name}</h3>
            <div className="flex items-center gap-1 bg-yellow-50 text-yellow-700 px-2 py-0.5 rounded-full text-xs font-bold w-fit">
              ⭐ {bank.rating} / 5.0
            </div>
          </div>
        </div>

        {/* Stats */}
        <div className="grid grid-cols-2 gap-y-4 gap-x-8 w-full md:w-auto flex-1">
          <div>
            <p className="text-sm font-semibold text-gray-500 mb-1 flex items-center gap-1">
              <Percent className="w-4 h-4 text-primary-500" /> Interest Rate
            </p>
            <p className="text-lg font-black text-gray-900">{bank.interestRate.min}% - {bank.interestRate.max}%</p>
            <p className="text-xs text-gray-500">{bank.interestRate.type}</p>
          </div>
          
          <div>
            <p className="text-sm font-semibold text-gray-500 mb-1 flex items-center gap-1">
              <ShieldCheck className="w-4 h-4 text-primary-500" /> Processing Fee
            </p>
            <p className="text-lg font-black text-gray-900">{bank.processingFee.split('(')[0]}</p>
            {bank.processingFee.includes('(') && (
              <p className="text-xs text-gray-500">({bank.processingFee.split('(')[1]}</p>
            )}
          </div>
          
          <div className="hidden lg:block">
            <p className="text-sm font-semibold text-gray-500 mb-1 flex items-center gap-1">
              <IndianRupee className="w-4 h-4 text-primary-500" /> Max Loan
            </p>
            <p className="text-base font-bold text-gray-900">{bank.maxLoanAmount}</p>
          </div>
          
          <div className="hidden lg:block">
            <p className="text-sm font-semibold text-gray-500 mb-1 flex items-center gap-1">
              <Clock className="w-4 h-4 text-primary-500" /> Max Tenure
            </p>
            <p className="text-base font-bold text-gray-900">{bank.maxTenureYears} Years</p>
          </div>
        </div>

        {/* Actions */}
        <div className="flex flex-col sm:flex-row md:flex-col gap-3 w-full md:w-auto">
          <button 
            onClick={() => onApply(bank.id)}
            className="bg-primary-600 hover:bg-primary-700 text-white font-bold py-3 px-8 rounded-xl shadow-lg shadow-primary-600/30 transition-all flex items-center justify-center gap-2 group/btn whitespace-nowrap"
          >
            Apply Now
            <ChevronRight className="w-4 h-4 group-hover/btn:translate-x-1 transition-transform" />
          </button>
          
          {onCompareToggle && (
            <label className="flex items-center justify-center gap-2 cursor-pointer border border-gray-200 rounded-xl py-3 px-4 hover:bg-gray-50 transition-colors">
              <input 
                type="checkbox" 
                checked={isCompared}
                onChange={(e) => onCompareToggle(bank.id, e.target.checked)}
                className="w-4 h-4 text-primary-600 border-gray-300 rounded focus:ring-primary-500"
              />
              <span className="text-sm font-bold text-gray-700">Add to Compare</span>
            </label>
          )}
        </div>
      </div>
      
      {/* Features Footer */}
      <div className="mt-6 pt-4 border-t border-gray-100 flex flex-wrap gap-2">
        {bank.features.map((feature, idx) => (
          <span key={idx} className="inline-flex items-center text-xs font-semibold bg-gray-50 text-gray-600 px-3 py-1.5 rounded-lg border border-gray-100">
            <CheckCircle2 className="w-3 h-3 mr-1.5 text-green-500" />
            {feature}
          </span>
        ))}
      </div>
    </div>
  );
}
