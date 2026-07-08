import { useState } from 'react'
import { SEOHead } from '../components/SEOHead'
import { Landmark, CheckCircle2, Percent, Clock, IndianRupee, ShieldCheck } from 'lucide-react'
import { trackEvent } from '../lib/analytics'

const LOAN_PROVIDERS = [
  {
    id: 'sbi',
    name: 'State Bank of India',
    logo: 'https://images.unsplash.com/photo-1616803140344-6682afb13cda?auto=format&fit=crop&q=80&w=100&h=100', // Placeholder
    rate: '8.40%',
    processingFee: '0.35% (Max ₹10,000)',
    tenure: 'Up to 30 Years',
    features: ['Lowest Interest Rates', 'Zero Prepayment Charges', 'Women Concession Available'],
    recommended: true
  },
  {
    id: 'hdfc',
    name: 'HDFC Bank',
    logo: 'https://images.unsplash.com/photo-1565514020179-026b92b84bb6?auto=format&fit=crop&q=80&w=100&h=100',
    rate: '8.50%',
    processingFee: 'Up to 0.50%',
    tenure: 'Up to 30 Years',
    features: ['Fast Processing', 'Digital Sanction', 'Flexible Repayment'],
    recommended: true
  },
  {
    id: 'icici',
    name: 'ICICI Bank',
    logo: 'https://images.unsplash.com/photo-1501167783584-60c7f24f92bc?auto=format&fit=crop&q=80&w=100&h=100',
    rate: '8.75%',
    processingFee: '0.50% - 2.00%',
    tenure: 'Up to 30 Years',
    features: ['Instant Sanction', 'Overdraft Facility', 'Doorstep Service'],
    recommended: false
  },
  {
    id: 'axis',
    name: 'Axis Bank',
    logo: 'https://images.unsplash.com/photo-1542296332-2e4473faf563?auto=format&fit=crop&q=80&w=100&h=100',
    rate: '8.75%',
    processingFee: 'Up to 1%',
    tenure: 'Up to 30 Years',
    features: ['EMIs waiver scheme', 'Balance Transfer Facility', 'No Hidden Charges'],
    recommended: false
  }
]

export function HomeLoanPage() {
  const [formData, setFormData] = useState({
    name: '',
    phone: '',
    loanAmount: '',
    propertyLocation: '',
    employmentType: 'Salaried'
  })
  const [submitted, setSubmitted] = useState(false)

  const schema = {
    "@context": "https://schema.org",
    "@type": "WebPage",
    "name": "Compare Home Loan Interest Rates in Visakhapatnam | VizagProperty",
    "description": "Compare top home loan interest rates from SBI, HDFC, ICICI, and Axis Bank in Visakhapatnam. Apply online for fast processing and exclusive offers.",
    "url": "https://vizagproperty.co.in/home-loans"
  }

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    trackEvent({
      event: 'home_loan_lead_submitted',
      category: 'LeadGen',
      label: 'Home Loan Form'
    })
    setSubmitted(true)
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead 
        title="Compare Home Loan Interest Rates in Vizag | VizagProperty"
        description="Compare the lowest home loan interest rates in Visakhapatnam from top banks. Get expert assistance, fast approvals, and zero processing fee offers."
        schema={schema}
      />

      {/* Hero Section */}
      <div className="bg-primary-900 py-16 text-white relative">
        <div className="absolute inset-0 overflow-hidden">
          <div className="absolute -top-1/2 -right-1/4 w-96 h-96 bg-primary-600 rounded-full blur-3xl opacity-20"></div>
          <div className="absolute -bottom-1/2 -left-1/4 w-96 h-96 bg-accent-500 rounded-full blur-3xl opacity-20"></div>
        </div>
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 text-center">
          <h1 className="text-4xl md:text-5xl font-extrabold mb-6 leading-tight">
            Unlock the Best Home Loan Rates <br className="hidden md:block"/> in Visakhapatnam
          </h1>
          <p className="text-xl text-primary-100 max-w-2xl mx-auto mb-8">
            Compare offers from top banks, check your eligibility instantly, and let our experts handle the paperwork.
          </p>
          <div className="flex flex-wrap justify-center gap-4 text-sm font-semibold">
            <span className="flex items-center bg-primary-800/50 px-4 py-2 rounded-full border border-primary-700">
              <Percent className="h-4 w-4 mr-2 text-green-400" /> Rates from 8.40%
            </span>
            <span className="flex items-center bg-primary-800/50 px-4 py-2 rounded-full border border-primary-700">
              <Clock className="h-4 w-4 mr-2 text-blue-400" /> 48 Hr Approvals
            </span>
            <span className="flex items-center bg-primary-800/50 px-4 py-2 rounded-full border border-primary-700">
              <ShieldCheck className="h-4 w-4 mr-2 text-yellow-400" /> Unbiased Advice
            </span>
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-8 relative z-20">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          
          {/* Bank Comparison Column */}
          <div className="lg:col-span-2 space-y-6">
            <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-200">
              <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
                <Landmark className="h-6 w-6 mr-2 text-primary-600" />
                Top Partner Banks
              </h2>
              
              <div className="space-y-4">
                {LOAN_PROVIDERS.map((bank) => (
                  <div key={bank.id} className="border border-gray-100 rounded-xl p-5 hover:border-primary-300 hover:shadow-md transition-all relative overflow-hidden bg-gray-50/50">
                    {bank.recommended && (
                      <div className="absolute top-0 right-0 bg-green-500 text-white text-[10px] font-bold px-3 py-1 rounded-bl-lg uppercase tracking-wider">
                        Recommended
                      </div>
                    )}
                    <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                      <div className="flex items-center gap-4">
                        <div className="w-16 h-16 bg-white rounded-lg border border-gray-200 shadow-sm flex items-center justify-center p-2">
                          <Landmark className="h-8 w-8 text-gray-400" />
                        </div>
                        <div>
                          <h3 className="font-bold text-lg text-gray-900">{bank.name}</h3>
                          <div className="flex flex-wrap gap-x-4 gap-y-1 mt-1 text-sm text-gray-600">
                            <span className="flex items-center">
                              <span className="font-semibold text-gray-900 mr-1">Rate:</span> {bank.rate}
                            </span>
                            <span className="flex items-center">
                              <span className="font-semibold text-gray-900 mr-1">Fee:</span> {bank.processingFee}
                            </span>
                          </div>
                        </div>
                      </div>
                      
                      <div className="hidden sm:block text-right">
                        <button className="bg-primary-50 text-primary-700 font-semibold px-4 py-2 rounded-lg hover:bg-primary-100 transition-colors text-sm">
                          Check Eligibility
                        </button>
                      </div>
                    </div>
                    
                    <div className="mt-4 pt-4 border-t border-gray-100 flex flex-wrap gap-2">
                      {bank.features.map((feature, idx) => (
                        <span key={idx} className="inline-flex items-center text-xs font-medium bg-white border border-gray-200 px-2.5 py-1 rounded-md text-gray-600">
                          <CheckCircle2 className="h-3 w-3 mr-1 text-green-500" />
                          {feature}
                        </span>
                      ))}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>

          {/* Lead Generation Form */}
          <div className="lg:col-span-1">
            <div className="bg-white p-6 rounded-2xl shadow-xl border border-gray-100 sticky top-20">
              {submitted ? (
                <div className="text-center py-8">
                  <div className="w-16 h-16 bg-green-100 text-green-600 rounded-full flex items-center justify-center mx-auto mb-4">
                    <CheckCircle2 className="h-8 w-8" />
                  </div>
                  <h3 className="text-xl font-bold text-gray-900 mb-2">Request Received!</h3>
                  <p className="text-gray-600 mb-6">Our loan expert will contact you within 2 hours to discuss the best rates for your profile.</p>
                  <button 
                    onClick={() => setSubmitted(false)}
                    className="text-primary-600 font-semibold hover:text-primary-700"
                  >
                    Submit Another Request
                  </button>
                </div>
              ) : (
                <>
                  <h3 className="text-xl font-bold text-gray-900 mb-2">Get Free Expert Advice</h3>
                  <p className="text-sm text-gray-500 mb-6">Fill the form to get personalized home loan offers and processing assistance.</p>
                  
                  <form onSubmit={handleSubmit} className="space-y-4">
                    <div>
                      <label className="block text-sm font-semibold text-gray-700 mb-1">Full Name</label>
                      <input 
                        type="text" 
                        required
                        className="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all outline-none"
                        placeholder="John Doe"
                        value={formData.name}
                        onChange={(e) => setFormData({...formData, name: e.target.value})}
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-semibold text-gray-700 mb-1">Mobile Number</label>
                      <input 
                        type="tel" 
                        required
                        className="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all outline-none"
                        placeholder="+91 98765 43210"
                        value={formData.phone}
                        onChange={(e) => setFormData({...formData, phone: e.target.value})}
                      />
                    </div>
                    <div>
                      <label className="block text-sm font-semibold text-gray-700 mb-1">Required Loan Amount</label>
                      <div className="relative">
                        <IndianRupee className="absolute left-3 top-3 h-5 w-5 text-gray-400" />
                        <input 
                          type="number" 
                          required
                          className="w-full pl-10 pr-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg focus:bg-white focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all outline-none"
                          placeholder="50,00,000"
                          value={formData.loanAmount}
                          onChange={(e) => setFormData({...formData, loanAmount: e.target.value})}
                        />
                      </div>
                    </div>
                    <div>
                      <label className="block text-sm font-semibold text-gray-700 mb-2">Employment Type</label>
                      <div className="flex gap-4">
                        <label className="flex items-center">
                          <input 
                            type="radio" 
                            name="employment" 
                            checked={formData.employmentType === 'Salaried'}
                            onChange={() => setFormData({...formData, employmentType: 'Salaried'})}
                            className="text-primary-600 focus:ring-primary-500 mr-2"
                          />
                          <span className="text-sm font-medium">Salaried</span>
                        </label>
                        <label className="flex items-center">
                          <input 
                            type="radio" 
                            name="employment" 
                            checked={formData.employmentType === 'Self Employed'}
                            onChange={() => setFormData({...formData, employmentType: 'Self Employed'})}
                            className="text-primary-600 focus:ring-primary-500 mr-2"
                          />
                          <span className="text-sm font-medium">Self Employed</span>
                        </label>
                      </div>
                    </div>
                    
                    <button 
                      type="submit"
                      className="w-full bg-primary-600 text-white font-bold py-3 px-4 rounded-lg hover:bg-primary-700 transition-colors mt-2"
                    >
                      Request Callback
                    </button>
                    <p className="text-xs text-center text-gray-400 mt-3">
                      By submitting, you agree to our Terms and Privacy Policy.
                    </p>
                  </form>
                </>
              )}
            </div>
          </div>
          
        </div>
      </div>
    </div>
  )
}
