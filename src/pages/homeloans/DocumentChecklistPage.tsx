import { useState } from 'react';
import { SEOHead } from '../../components/SEOHead';
import { ArrowLeft, CheckCircle2, Download } from 'lucide-react';
import { Link } from 'react-router-dom';

const CHECKLISTS = {
  salaried: [
    "Duly filled and signed Home Loan Application Form",
    "Passport size photographs",
    "Identity Proof: PAN Card / Passport / Voter ID / Driving License",
    "Address Proof: Aadhaar / Passport / Utility Bills",
    "Last 3 months salary slips",
    "Last 6 months bank statements (Salary account)",
    "Form 16 or Income Tax Returns (ITR) for the last 2 years",
    "Processing fee cheque"
  ],
  business: [
    "Duly filled and signed Home Loan Application Form",
    "Passport size photographs",
    "Identity & Address Proof (PAN, Aadhaar, Passport)",
    "Business Proof: GST Registration / Trade License / Partnership Deed",
    "ITR for the last 3 years with computation of income",
    "CA Certified Balance Sheet and P&L account for the last 3 years",
    "Last 1 year bank statements (Current and Savings)",
    "Processing fee cheque"
  ],
  nri: [
    "Duly filled application with signatures",
    "Passport and Visa copies",
    "Identity Proof (PAN / Passport)",
    "Address Proof (Overseas and Indian address)",
    "Employment Contract / Appointment Letter / Work Permit",
    "Last 6 months salary slips",
    "Last 6 months bank statements (NRE/NRO and overseas account)",
    "POA (Power of Attorney) if not physically present in India"
  ],
  property: [
    "Copy of Allotment Letter / Buyer Agreement",
    "Receipt(s) of payment(s) made to the developer",
    "Agreement to Sell (if applicable)",
    "Title Deeds including the previous chain of property documents",
    "Approved Plan copy & Registered Development Agreement",
    "Latest Property Tax receipt"
  ]
};

export function DocumentChecklistPage() {
  const [activeTab, setActiveTab] = useState<keyof typeof CHECKLISTS>('salaried');

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead title="Home Loan Document Checklist | VizagProperty" description="Complete list of documents required for home loans for salaried, self-employed, and NRIs." />

      <div className="bg-slate-900 pt-8 pb-32">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <Link to="/home-loans" className="inline-flex items-center text-slate-400 hover:text-white mb-6 transition-colors font-semibold text-sm">
            <ArrowLeft className="w-4 h-4 mr-2" /> Back to Home Loans
          </Link>
          <div className="flex justify-between items-end">
            <div>
              <h1 className="text-3xl md:text-5xl font-black text-white mb-4">Document Checklist</h1>
              <p className="text-slate-300">Keep these ready for faster loan approval.</p>
            </div>
            <button 
              onClick={() => window.print()}
              className="bg-primary-600 hover:bg-primary-700 text-white px-4 py-2 rounded-lg flex items-center gap-2 transition-colors font-bold text-sm hidden md:flex"
            >
              <Download className="w-4 h-4" /> Download PDF
            </button>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-20 relative z-10">
        <div className="bg-white rounded-3xl shadow-xl overflow-hidden border border-gray-100 print:shadow-none print:border-none">
          
          <div className="flex overflow-x-auto border-b border-gray-100 hide-scrollbar print:hidden">
            <button 
              onClick={() => setActiveTab('salaried')}
              className={`px-8 py-5 font-bold whitespace-nowrap transition-colors ${activeTab === 'salaried' ? 'text-primary-600 border-b-2 border-primary-600 bg-primary-50/50' : 'text-gray-500 hover:bg-gray-50'}`}
            >
              Salaried Employees
            </button>
            <button 
              onClick={() => setActiveTab('business')}
              className={`px-8 py-5 font-bold whitespace-nowrap transition-colors ${activeTab === 'business' ? 'text-primary-600 border-b-2 border-primary-600 bg-primary-50/50' : 'text-gray-500 hover:bg-gray-50'}`}
            >
              Self-Employed / Business
            </button>
            <button 
              onClick={() => setActiveTab('nri')}
              className={`px-8 py-5 font-bold whitespace-nowrap transition-colors ${activeTab === 'nri' ? 'text-primary-600 border-b-2 border-primary-600 bg-primary-50/50' : 'text-gray-500 hover:bg-gray-50'}`}
            >
              NRI Applicants
            </button>
          </div>

          <div className="p-8 md:p-12">
            
            <div className="mb-12">
              <h2 className="text-2xl font-black text-gray-900 mb-6 flex items-center gap-2">
                Personal & Financial Documents
                <span className="text-sm font-semibold bg-blue-100 text-blue-700 px-3 py-1 rounded-full uppercase tracking-wider">{activeTab}</span>
              </h2>
              <div className="grid md:grid-cols-2 gap-4">
                {CHECKLISTS[activeTab].map((doc, i) => (
                  <div key={i} className="flex items-start gap-3 p-4 bg-gray-50 rounded-xl border border-gray-100">
                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                    <span className="font-semibold text-gray-700">{doc}</span>
                  </div>
                ))}
              </div>
            </div>

            <hr className="border-gray-100 mb-12" />

            <div>
              <h2 className="text-2xl font-black text-gray-900 mb-6">Property Documents (Common for all)</h2>
              <div className="grid md:grid-cols-2 gap-4">
                {CHECKLISTS.property.map((doc, i) => (
                  <div key={i} className="flex items-start gap-3 p-4 bg-gray-50 rounded-xl border border-gray-100">
                    <CheckCircle2 className="w-5 h-5 text-green-500 flex-shrink-0 mt-0.5" />
                    <span className="font-semibold text-gray-700">{doc}</span>
                  </div>
                ))}
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  );
}
