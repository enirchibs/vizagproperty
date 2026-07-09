export interface BankOffer {
  id: string;
  name: string;
  logo: string;
  interestRate: {
    min: number;
    max: number;
    type: 'Floating' | 'Fixed' | 'Both';
  };
  processingFee: string;
  maxLoanAmount: string;
  maxTenureYears: number;
  rating: number;
  features: string[];
  isRecommended?: boolean;
}

export const MOCK_BANKS: BankOffer[] = [
  {
    id: 'sbi',
    name: 'State Bank of India',
    logo: 'https://images.unsplash.com/photo-1616803140344-6682afb13cda?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.40, max: 9.65, type: 'Floating' },
    processingFee: '0.35% (Max ₹10,000)',
    maxLoanAmount: 'No Limit',
    maxTenureYears: 30,
    rating: 4.8,
    features: ['Women Concession', 'No Prepayment Charges', 'Overdraft Facility Available'],
    isRecommended: true
  },
  {
    id: 'hdfc',
    name: 'HDFC Bank',
    logo: 'https://images.unsplash.com/photo-1565514020179-026b92b84bb6?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.50, max: 9.80, type: 'Both' },
    processingFee: 'Up to 0.50% (Max ₹3000)',
    maxLoanAmount: 'No Limit',
    maxTenureYears: 30,
    rating: 4.7,
    features: ['Fast Digital Sanction', 'Flexible Repayment', 'Balance Transfer Options'],
    isRecommended: true
  },
  {
    id: 'icici',
    name: 'ICICI Bank',
    logo: 'https://images.unsplash.com/photo-1501167783584-60c7f24f92bc?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.75, max: 9.90, type: 'Floating' },
    processingFee: '0.50% - 2.00%',
    maxLoanAmount: '₹5 Crores',
    maxTenureYears: 30,
    rating: 4.6,
    features: ['Instant Sanction', 'Step-up Repayment Facility', 'Doorstep Service'],
    isRecommended: true
  },
  {
    id: 'axis',
    name: 'Axis Bank',
    logo: 'https://images.unsplash.com/photo-1542296332-2e4473faf563?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.75, max: 10.05, type: 'Floating' },
    processingFee: 'Up to 1%',
    maxLoanAmount: '₹5 Crores',
    maxTenureYears: 30,
    rating: 4.5,
    features: ['EMIs waiver scheme', 'Balance Transfer Facility', 'No Hidden Charges']
  },
  {
    id: 'canara',
    name: 'Canara Bank',
    logo: 'https://images.unsplash.com/photo-1616803140344-6682afb13cda?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.40, max: 9.85, type: 'Floating' },
    processingFee: '0.50% (Max ₹10,000)',
    maxLoanAmount: 'No Limit',
    maxTenureYears: 30,
    rating: 4.4,
    features: ['Low Processing Fee', 'Special schemes for NRI', 'Women Borrower Concession']
  },
  {
    id: 'bob',
    name: 'Bank of Baroda',
    logo: 'https://images.unsplash.com/photo-1565514020179-026b92b84bb6?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.40, max: 10.60, type: 'Floating' },
    processingFee: 'Nil (During Offers)',
    maxLoanAmount: '₹20 Crores',
    maxTenureYears: 30,
    rating: 4.5,
    features: ['Zero Processing Fee Offers', 'High Loan Amount', 'Credit Card Linked Benefits']
  },
  {
    id: 'pnb',
    name: 'Punjab National Bank',
    logo: 'https://images.unsplash.com/photo-1501167783584-60c7f24f92bc?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.45, max: 10.25, type: 'Floating' },
    processingFee: '0.35%',
    maxLoanAmount: 'No Limit',
    maxTenureYears: 30,
    rating: 4.3,
    features: ['Govt Employee Special Rates', 'Minimal Documentation', 'Easy Balance Transfer']
  },
  {
    id: 'union',
    name: 'Union Bank of India',
    logo: 'https://images.unsplash.com/photo-1542296332-2e4473faf563?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.35, max: 10.15, type: 'Floating' },
    processingFee: '0.50%',
    maxLoanAmount: 'No Limit',
    maxTenureYears: 30,
    rating: 4.2,
    features: ['One of the lowest starting rates', 'Fast Processing', 'No Prepayment Penalty']
  },
  {
    id: 'indian-bank',
    name: 'Indian Bank',
    logo: 'https://images.unsplash.com/photo-1616803140344-6682afb13cda?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.50, max: 9.90, type: 'Floating' },
    processingFee: '0.23% (Max ₹20,000)',
    maxLoanAmount: 'No Limit',
    maxTenureYears: 30,
    rating: 4.1,
    features: ['Affordable Processing Fees', 'Special plot loans', 'High Tenure']
  },
  {
    id: 'boi',
    name: 'Bank of India',
    logo: 'https://images.unsplash.com/photo-1565514020179-026b92b84bb6?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.30, max: 10.50, type: 'Floating' },
    processingFee: 'Nil (During Offers)',
    maxLoanAmount: '₹5 Crores',
    maxTenureYears: 30,
    rating: 4.2,
    features: ['Star Home Loan schemes', 'Overdraft Facility', 'Furnishing loan included']
  },
  {
    id: 'lichfl',
    name: 'LIC Housing Finance',
    logo: 'https://images.unsplash.com/photo-1501167783584-60c7f24f92bc?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.50, max: 10.35, type: 'Floating' },
    processingFee: '0.25% - 0.50%',
    maxLoanAmount: '₹15 Crores',
    maxTenureYears: 30,
    rating: 4.5,
    features: ['Low CIBIL Accepted', 'Pensioner friendly', 'High LTV Ratio']
  },
  {
    id: 'pnbhfl',
    name: 'PNB Housing Finance',
    logo: 'https://images.unsplash.com/photo-1542296332-2e4473faf563?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.50, max: 11.25, type: 'Floating' },
    processingFee: 'Up to 1%',
    maxLoanAmount: 'No Limit',
    maxTenureYears: 30,
    rating: 4.3,
    features: ['Customized Eligibility', 'Fast approvals', 'Doorstep services']
  },
  {
    id: 'tata',
    name: 'Tata Capital',
    logo: 'https://images.unsplash.com/photo-1616803140344-6682afb13cda?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.70, max: 12.00, type: 'Floating' },
    processingFee: 'Up to 2%',
    maxLoanAmount: '₹5 Crores',
    maxTenureYears: 30,
    rating: 4.4,
    features: ['Digital Journey', 'Quick Sanction', 'Flexible EMIs']
  },
  {
    id: 'bajaj',
    name: 'Bajaj Housing Finance',
    logo: 'https://images.unsplash.com/photo-1565514020179-026b92b84bb6?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 8.50, max: 13.50, type: 'Floating' },
    processingFee: 'Up to 2%',
    maxLoanAmount: '₹5 Crores',
    maxTenureYears: 30,
    rating: 4.6,
    features: ['External Benchmark Linked Rates', 'Online Account Management', 'Top-up loans easily available']
  },
  {
    id: 'aavas',
    name: 'Aavas Finance',
    logo: 'https://images.unsplash.com/photo-1501167783584-60c7f24f92bc?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 9.00, max: 14.00, type: 'Fixed' },
    processingFee: 'Up to 2.5%',
    maxLoanAmount: '₹50 Lakhs',
    maxTenureYears: 30,
    rating: 4.0,
    features: ['Focus on low-income groups', 'Minimal documentation', 'Fast processing for self-employed']
  },
  {
    id: 'shriram',
    name: 'Shriram Housing Finance',
    logo: 'https://images.unsplash.com/photo-1542296332-2e4473faf563?auto=format&fit=crop&q=80&w=100&h=100',
    interestRate: { min: 9.50, max: 15.00, type: 'Floating' },
    processingFee: 'Up to 2%',
    maxLoanAmount: '₹10 Crores',
    maxTenureYears: 25,
    rating: 4.1,
    features: ['No Income Proof Loans', 'Customized solutions', 'Wider geographical reach']
  }
]
