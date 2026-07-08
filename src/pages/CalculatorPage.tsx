import { EMICalculator } from '../components/EMICalculator'
import { SEOHead } from '../components/SEOHead'

export function CalculatorPage() {
  const schema = {
    "@context": "https://schema.org",
    "@type": "WebPage",
    "name": "Home Loan EMI Calculator Vizag | VizagProperty",
    "description": "Calculate your home loan EMI instantly. Free EMI calculator for properties in Visakhapatnam. Check monthly installments, interest, and total payable amount.",
    "url": "https://vizagproperty.co.in/home-loan-emi-calculator",
    "publisher": {
      "@type": "Organization",
      "name": "VizagProperty"
    }
  }

  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <SEOHead 
        title="Home Loan EMI Calculator Vizag | VizagProperty"
        description="Calculate your home loan EMI instantly. Free EMI calculator for properties in Visakhapatnam. Check monthly installments, interest, and total payable amount."
        schema={schema}
      />
      <div className="max-w-4xl mx-auto px-4">
        <div className="text-center mb-8">
          <h1 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
            Home Loan EMI Calculator
          </h1>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Planning to buy a property in Vizag? Use our free EMI calculator to estimate your monthly home loan installments and plan your budget better.
          </p>
        </div>

        <EMICalculator />

        <div className="mt-12 bg-white rounded-xl shadow-sm p-8 border border-gray-100">
          <h2 className="text-2xl font-bold text-gray-900 mb-6">How is Home Loan EMI Calculated?</h2>
          <div className="space-y-6 text-gray-600">
            <p>
              EMI (Equated Monthly Installment) is a fixed payment amount made by a borrower to a lender at a specified date each calendar month. Equated monthly installments are used to pay off both interest and principal each month so that over a specified number of years, the loan is paid off in full.
            </p>
            <div>
              <h3 className="text-lg font-bold text-gray-800 mb-2">The EMI Formula:</h3>
              <p className="bg-gray-50 p-4 rounded-lg font-mono text-sm border border-gray-200">
                E = P x R x (1+R)^N / [(1+R)^N-1]
              </p>
              <ul className="list-disc pl-5 mt-3 space-y-1">
                <li><strong>E</strong> is EMI</li>
                <li><strong>P</strong> is Principal Loan Amount</li>
                <li><strong>R</strong> is rate of interest calculated on a monthly basis. (i.e., R = Annual rate of interest / 12 / 100).</li>
                <li><strong>N</strong> is loan term / tenure / duration in number of months</li>
              </ul>
            </div>
            
            <div>
              <h3 className="text-lg font-bold text-gray-800 mb-2">Tips for Home Buyers in Vizag:</h3>
              <ul className="list-disc pl-5 space-y-2">
                <li>Aim for a down payment of at least 20% to reduce your EMI burden.</li>
                <li>Choose a shorter tenure if you want to pay less total interest, or a longer tenure for lower monthly payments.</li>
                <li>Compare interest rates across different banks before finalizing your home loan.</li>
                <li>Factor in additional costs like registration, stamp duty, and maintenance when calculating your overall property budget.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
