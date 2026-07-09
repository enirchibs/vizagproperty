import { useState } from 'react';
import { X, CheckCircle2, IndianRupee } from 'lucide-react';
import { trackEvent } from '../../lib/analytics';
import { openWhatsApp } from '../../lib/whatsapp';

interface LoanLeadModalProps {
  isOpen: boolean;
  onClose: () => void;
  selectedBankName?: string;
}

export function LoanLeadModal({ isOpen, onClose, selectedBankName }: LoanLeadModalProps) {
  const [formData, setFormData] = useState({
    name: '',
    phone: '',
    loanAmount: '',
    employmentType: 'Salaried'
  });
  const [submitted, setSubmitted] = useState(false);

  if (!isOpen) return null;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    trackEvent({
      event: 'home_loan_lead_submitted',
      category: 'LeadGen',
      label: selectedBankName ? `Applied to ${selectedBankName}` : 'General Inquiry'
    });
    
    // Send to WhatsApp
    const message = `Hi Vizag Property,\nI would like to apply for a Home Loan.\n\n*Name:* ${formData.name}\n*Phone:* ${formData.phone}\n*Loan Amount:* ₹${formData.loanAmount}\n*Employment:* ${formData.employmentType}\n*Bank:* ${selectedBankName || 'Any Bank'}`;
    openWhatsApp(message, '7207550499');

    setSubmitted(true);
    setTimeout(() => {
      onClose();
      setSubmitted(false);
      setFormData({ name: '', phone: '', loanAmount: '', employmentType: 'Salaried' });
    }, 3000);
  };

  return (
    <div className="fixed inset-0 z-[100] flex items-center justify-center p-4">
      <div className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm" onClick={onClose}></div>
      <div className="relative bg-white rounded-3xl shadow-2xl max-w-md w-full max-h-[90vh] overflow-y-auto animate-slide-up">
        <button 
          onClick={onClose}
          className="absolute top-4 right-4 bg-gray-100 hover:bg-gray-200 text-gray-500 p-2 rounded-full transition-colors z-10"
        >
          <X className="w-5 h-5" />
        </button>

        <div className="bg-gradient-to-br from-primary-900 to-primary-800 p-8 text-white text-center">
          <h2 className="text-2xl font-black mb-2">
            {selectedBankName ? `Apply for ${selectedBankName}` : 'Check Your Eligibility'}
          </h2>
          <p className="text-primary-100 text-sm">
            Fill out this quick form and our loan experts will get back to you with the best offers.
          </p>
        </div>

        <div className="p-8">
          {submitted ? (
            <div className="text-center py-8">
              <div className="w-20 h-20 bg-green-100 text-green-600 rounded-full flex items-center justify-center mx-auto mb-6">
                <CheckCircle2 className="w-10 h-10" />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-2">Request Received!</h3>
              <p className="text-gray-600">Our loan expert will contact you within 2 hours.</p>
            </div>
          ) : (
            <form onSubmit={handleSubmit} className="space-y-5">
              <div>
                <label className="block text-sm font-bold text-gray-700 mb-1.5">Full Name</label>
                <input 
                  type="text" 
                  required
                  value={formData.name}
                  onChange={e => setFormData({...formData, name: e.target.value})}
                  className="w-full px-5 py-3.5 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all outline-none font-medium"
                  placeholder="John Doe"
                />
              </div>
              
              <div>
                <label className="block text-sm font-bold text-gray-700 mb-1.5">Mobile Number</label>
                <div className="flex gap-2">
                  <span className="flex-shrink-0 flex items-center justify-center px-4 bg-gray-100 border border-gray-200 rounded-xl text-gray-500 font-bold">
                    +91
                  </span>
                  <input 
                    type="tel" 
                    required
                    pattern="[0-9]{10}"
                    value={formData.phone}
                    onChange={e => setFormData({...formData, phone: e.target.value})}
                    className="w-full px-5 py-3.5 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all outline-none font-medium"
                    placeholder="98765 43210"
                  />
                </div>
              </div>

              <div>
                <label className="block text-sm font-bold text-gray-700 mb-1.5">Required Loan Amount</label>
                <div className="relative">
                  <IndianRupee className="absolute left-4 top-3.5 w-5 h-5 text-gray-400" />
                  <input 
                    type="number" 
                    required
                    value={formData.loanAmount}
                    onChange={e => setFormData({...formData, loanAmount: e.target.value})}
                    className="w-full pl-12 pr-5 py-3.5 bg-gray-50 border border-gray-200 rounded-xl focus:bg-white focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all outline-none font-medium"
                    placeholder="5000000"
                  />
                </div>
              </div>

              <div>
                <label className="block text-sm font-bold text-gray-700 mb-2.5">Employment Type</label>
                <div className="flex gap-3">
                  <label className="flex-1 cursor-pointer">
                    <input 
                      type="radio" 
                      name="employment" 
                      className="peer sr-only"
                      checked={formData.employmentType === 'Salaried'}
                      onChange={() => setFormData({...formData, employmentType: 'Salaried'})}
                    />
                    <div className="text-center px-4 py-3 border-2 border-gray-200 rounded-xl font-bold text-gray-600 peer-checked:border-primary-600 peer-checked:bg-primary-50 peer-checked:text-primary-700 transition-all">
                      Salaried
                    </div>
                  </label>
                  <label className="flex-1 cursor-pointer">
                    <input 
                      type="radio" 
                      name="employment" 
                      className="peer sr-only"
                      checked={formData.employmentType === 'Self Employed'}
                      onChange={() => setFormData({...formData, employmentType: 'Self Employed'})}
                    />
                    <div className="text-center px-4 py-3 border-2 border-gray-200 rounded-xl font-bold text-gray-600 peer-checked:border-primary-600 peer-checked:bg-primary-50 peer-checked:text-primary-700 transition-all">
                      Business
                    </div>
                  </label>
                </div>
              </div>

              <button 
                type="submit"
                className="w-full bg-gradient-to-r from-accent-500 to-accent-600 hover:from-accent-600 hover:to-accent-700 text-white font-black py-4 rounded-xl shadow-xl shadow-accent-500/30 transition-all mt-4 text-lg"
              >
                Request Callback
              </button>
              
              <p className="text-xs text-center text-gray-400 mt-4 px-4">
                By clicking, you agree to our Terms & Conditions and Privacy Policy.
              </p>
            </form>
          )}
        </div>
      </div>
    </div>
  );
}
