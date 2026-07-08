import { useState, useEffect } from 'react'
import { Calculator } from 'lucide-react'

interface EMICalculatorProps {
  propertyPrice?: number
  className?: string
}

export function EMICalculator({ propertyPrice, className = '' }: EMICalculatorProps) {
  // Default values
  const defaultPrice = propertyPrice || 5000000
  const defaultDownPayment = Math.round(defaultPrice * 0.2) // 20% down payment

  const [principal, setPrincipal] = useState(defaultPrice - defaultDownPayment)
  const [interestRate, setInterestRate] = useState(8.5) // Default 8.5% p.a.
  const [tenureYears, setTenureYears] = useState(20) // Default 20 years
  
  const [emi, setEmi] = useState(0)
  const [totalInterest, setTotalInterest] = useState(0)
  const [totalPayment, setTotalPayment] = useState(0)

  useEffect(() => {
    // If propertyPrice changes from parent, update principal (assuming 20% down payment)
    if (propertyPrice) {
      setPrincipal(Math.round(propertyPrice * 0.8))
    }
  }, [propertyPrice])

  useEffect(() => {
    calculateEMI()
  }, [principal, interestRate, tenureYears])

  const calculateEMI = () => {
    const p = principal
    const r = interestRate / 12 / 100 // Monthly interest rate
    const n = tenureYears * 12 // Tenure in months

    if (p > 0 && r > 0 && n > 0) {
      const emiValue = p * r * Math.pow(1 + r, n) / (Math.pow(1 + r, n) - 1)
      const totalPay = emiValue * n
      const totalInt = totalPay - p
      
      setEmi(Math.round(emiValue))
      setTotalPayment(Math.round(totalPay))
      setTotalInterest(Math.round(totalInt))
    } else {
      setEmi(0)
      setTotalPayment(0)
      setTotalInterest(0)
    }
  }

  const formatCurrency = (amount: number) => {
    return new Intl.NumberFormat('en-IN', {
      style: 'currency',
      currency: 'INR',
      maximumFractionDigits: 0
    }).format(amount)
  }

  return (
    <div className={`bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden ${className}`}>
      <div className="bg-primary-900 px-6 py-4 flex items-center gap-3">
        <Calculator className="h-6 w-6 text-accent-500" />
        <h3 className="text-xl font-bold text-white">Home Loan EMI Calculator</h3>
      </div>
      
      <div className="p-6">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          
          {/* Input Section */}
          <div className="space-y-6">
            <div>
              <div className="flex justify-between items-center mb-2">
                <label className="text-sm font-semibold text-gray-700">Loan Amount</label>
                <span className="font-bold text-primary-700">{formatCurrency(principal)}</span>
              </div>
              <input
                type="range"
                min="100000"
                max="50000000"
                step="100000"
                value={principal}
                onChange={(e) => setPrincipal(Number(e.target.value))}
                className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-primary-600"
              />
              <div className="flex justify-between text-xs text-gray-500 mt-1">
                <span>₹1L</span>
                <span>₹5Cr</span>
              </div>
            </div>

            <div>
              <div className="flex justify-between items-center mb-2">
                <label className="text-sm font-semibold text-gray-700">Interest Rate (p.a.)</label>
                <span className="font-bold text-primary-700">{interestRate}%</span>
              </div>
              <input
                type="range"
                min="5"
                max="15"
                step="0.1"
                value={interestRate}
                onChange={(e) => setInterestRate(Number(e.target.value))}
                className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-primary-600"
              />
              <div className="flex justify-between text-xs text-gray-500 mt-1">
                <span>5%</span>
                <span>15%</span>
              </div>
            </div>

            <div>
              <div className="flex justify-between items-center mb-2">
                <label className="text-sm font-semibold text-gray-700">Loan Tenure</label>
                <span className="font-bold text-primary-700">{tenureYears} Years</span>
              </div>
              <input
                type="range"
                min="1"
                max="30"
                step="1"
                value={tenureYears}
                onChange={(e) => setTenureYears(Number(e.target.value))}
                className="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer accent-primary-600"
              />
              <div className="flex justify-between text-xs text-gray-500 mt-1">
                <span>1 Yr</span>
                <span>30 Yrs</span>
              </div>
            </div>
          </div>

          {/* Results Section */}
          <div className="bg-gray-50 rounded-xl p-6 border border-gray-100 flex flex-col justify-center relative">
            <div className="text-center mb-6">
              <p className="text-sm font-semibold text-gray-500 mb-1">Equated Monthly Installment</p>
              <div className="flex items-center justify-center text-4xl font-black text-primary-900">
                {formatCurrency(emi)}
              </div>
            </div>

            <div className="space-y-4">
              <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                <div className="flex items-center gap-2">
                  <div className="w-3 h-3 rounded-full bg-accent-500"></div>
                  <span className="text-sm text-gray-600">Principal Amount</span>
                </div>
                <span className="font-bold text-gray-900">{formatCurrency(principal)}</span>
              </div>
              
              <div className="flex justify-between items-center pb-3 border-b border-gray-200">
                <div className="flex items-center gap-2">
                  <div className="w-3 h-3 rounded-full bg-primary-400"></div>
                  <span className="text-sm text-gray-600">Total Interest</span>
                </div>
                <span className="font-bold text-gray-900">{formatCurrency(totalInterest)}</span>
              </div>
              
              <div className="flex justify-between items-center">
                <span className="text-sm font-bold text-gray-900">Total Amount Payable</span>
                <span className="font-bold text-primary-700">{formatCurrency(totalPayment)}</span>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  )
}
