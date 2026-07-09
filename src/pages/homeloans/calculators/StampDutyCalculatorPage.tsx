import { useState, useMemo } from 'react';
import { SEOHead } from '../../../components/SEOHead';
import { ArrowLeft, Landmark, IndianRupee } from 'lucide-react';
import { Link } from 'react-router-dom';

const STATE_RATES = {
  'Andhra Pradesh': { male: 5, female: 5, joint: 5, regFee: 1 },
  'Telangana': { male: 4, female: 4, joint: 4, regFee: 0.5 },
  'Maharashtra': { male: 6, female: 5, joint: 5.5, regFee: 1 },
  'Karnataka': { male: 5.1, female: 5.1, joint: 5.1, regFee: 1 },
  'Tamil Nadu': { male: 7, female: 7, joint: 7, regFee: 4 },
  'Delhi': { male: 6, female: 4, joint: 5, regFee: 1 }
};

export function StampDutyCalculatorPage() {
  const [propertyValue, setPropertyValue] = useState<number>(5000000);
  const [state, setState] = useState<keyof typeof STATE_RATES>('Andhra Pradesh');
  const [gender, setGender] = useState<'male' | 'female' | 'joint'>('male');

  const calculation = useMemo(() => {
    const rates = STATE_RATES[state];
    const stampDutyRate = rates[gender];
    const regFeeRate = rates.regFee;

    const stampDutyAmount = (propertyValue * stampDutyRate) / 100;
    const regFeeAmount = (propertyValue * regFeeRate) / 100;

    return {
      stampDutyRate,
      regFeeRate,
      stampDutyAmount,
      regFeeAmount,
      total: stampDutyAmount + regFeeAmount
    };
  }, [propertyValue, state, gender]);

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead title="Stamp Duty & Registration Calculator | VizagProperty" description="Calculate stamp duty and property registration charges across major Indian states." />

      <div className="bg-slate-900 pt-8 pb-32">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <Link to="/home-loans" className="inline-flex items-center text-slate-400 hover:text-white mb-6 transition-colors font-semibold text-sm">
            <ArrowLeft className="w-4 h-4 mr-2" /> Back to Home Loans
          </Link>
          <h1 className="text-3xl md:text-5xl font-black text-white mb-4">Stamp Duty Calculator</h1>
          <p className="text-slate-300">Plan your property registration expenses accurately.</p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-20 relative z-10">
        <div className="bg-white rounded-3xl shadow-xl overflow-hidden border border-gray-100 flex flex-col lg:flex-row">
          
          {/* Controls */}
          <div className="lg:w-1/2 p-8 md:p-12 border-r border-gray-100 space-y-8">
            
            <div>
              <label className="block font-bold text-gray-700 mb-2">Select State</label>
              <select 
                value={state} onChange={(e) => setState(e.target.value as keyof typeof STATE_RATES)}
                className="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 font-bold text-gray-900 appearance-none outline-none"
              >
                {Object.keys(STATE_RATES).map(s => <option key={s} value={s}>{s}</option>)}
              </select>
            </div>

            <div>
              <label className="block font-bold text-gray-700 mb-2">Property Value</label>
              <div className="relative">
                <IndianRupee className="absolute left-4 top-3.5 w-5 h-5 text-gray-400" />
                <input 
                  type="number" value={propertyValue} onChange={e => setPropertyValue(Number(e.target.value))}
                  className="w-full pl-12 pr-4 py-3 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 font-bold text-lg"
                />
              </div>
            </div>

            <div>
              <label className="block font-bold text-gray-700 mb-2">Buyer Profile</label>
              <div className="grid grid-cols-3 gap-3">
                {(['male', 'female', 'joint'] as const).map((g) => (
                  <label key={g} className="cursor-pointer">
                    <input type="radio" name="gender" className="peer sr-only" checked={gender === g} onChange={() => setGender(g)} />
                    <div className="text-center px-2 py-3 border-2 border-gray-200 rounded-xl font-bold text-gray-600 peer-checked:border-primary-600 peer-checked:bg-primary-50 peer-checked:text-primary-700 transition-all capitalize text-sm">
                      {g}
                    </div>
                  </label>
                ))}
              </div>
              {state === 'Maharashtra' || state === 'Delhi' ? (
                <p className="text-xs text-green-600 font-semibold mt-2">✨ Women buyers get discounted rates in {state}!</p>
              ) : null}
            </div>
            
          </div>

          {/* Results */}
          <div className="lg:w-1/2 bg-gray-50 p-8 md:p-12 flex flex-col justify-center">
            <div className="text-center mb-10">
              <div className="w-16 h-16 bg-white shadow-sm border border-gray-100 rounded-2xl flex items-center justify-center mx-auto mb-4">
                <Landmark className="w-8 h-8 text-primary-600" />
              </div>
              <p className="text-gray-500 font-bold uppercase tracking-wider mb-2">Total Registration Cost</p>
              <h2 className="text-5xl font-black text-gray-900">₹ {calculation.total.toLocaleString('en-IN')}</h2>
            </div>

            <div className="space-y-4">
              <div className="bg-white p-5 rounded-2xl border border-gray-200 shadow-sm flex justify-between items-center">
                <div>
                  <p className="text-sm font-bold text-gray-500">Stamp Duty ({calculation.stampDutyRate}%)</p>
                  <p className="text-xl font-black text-[#0F52BA]">₹ {calculation.stampDutyAmount.toLocaleString('en-IN')}</p>
                </div>
              </div>
              
              <div className="bg-white p-5 rounded-2xl border border-gray-200 shadow-sm flex justify-between items-center">
                <div>
                  <p className="text-sm font-bold text-gray-500">Registration Fee ({calculation.regFeeRate}%)</p>
                  <p className="text-xl font-black text-[#1E88E5]">₹ {calculation.regFeeAmount.toLocaleString('en-IN')}</p>
                </div>
              </div>
            </div>

            <p className="text-xs text-gray-400 mt-6 text-center">
              * Note: Exact rates may vary based on municipal limits, property type, and sub-registrar office rules. Legal/documentation charges are extra.
            </p>
          </div>

        </div>
      </div>
    </div>
  );
}
