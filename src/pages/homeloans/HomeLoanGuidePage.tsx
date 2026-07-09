import { SEOHead } from '../../components/SEOHead';
import { ArrowLeft, BookOpen, ChevronRight } from 'lucide-react';
import { Link } from 'react-router-dom';

const GUIDES = [
  {
    title: "Fixed vs Floating Interest Rates: Which is Better?",
    category: "Interest Rates",
    readTime: "5 min read",
    desc: "Understand the fundamental differences and decide which rate type suits your financial goals."
  },
  {
    title: "Home Loan Tax Benefits under Section 80C & 24(b)",
    category: "Tax Planning",
    readTime: "8 min read",
    desc: "Maximize your tax savings by properly structuring your home loan repayments."
  },
  {
    title: "How to Improve Your CIBIL Score Quickly",
    category: "Credit Score",
    readTime: "6 min read",
    desc: "Actionable tips to boost your credit score and secure the lowest interest rates."
  },
  {
    title: "The Ultimate Guide to Home Loan Balance Transfer",
    category: "Refinancing",
    readTime: "7 min read",
    desc: "When and how to switch your home loan to another bank for better rates."
  },
  {
    title: "Step-by-Step Home Loan Process Explained",
    category: "Beginner Guide",
    readTime: "10 min read",
    desc: "From application to disbursement, know exactly what happens at each stage."
  },
  {
    title: "Home Loan Guide for Government Employees",
    category: "Special Schemes",
    readTime: "4 min read",
    desc: "Special benefits, concessions, and interest rates available for public sector employees."
  }
];

export function HomeLoanGuidePage() {
  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead title="Home Loan Guides & Knowledge Center | VizagProperty" description="Expert articles on home loans, EMIs, tax benefits, CIBIL scores, and interest rates." />

      <div className="bg-slate-900 pt-8 pb-32">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <Link to="/home-loans" className="inline-flex items-center text-slate-400 hover:text-white mb-6 transition-colors font-semibold text-sm">
            <ArrowLeft className="w-4 h-4 mr-2" /> Back to Home Loans
          </Link>
          <div className="flex items-center gap-4 mb-4">
            <div className="w-12 h-12 bg-primary-600 rounded-xl flex items-center justify-center">
              <BookOpen className="w-6 h-6 text-white" />
            </div>
            <h1 className="text-3xl md:text-5xl font-black text-white">Knowledge Center</h1>
          </div>
          <p className="text-slate-300">Master the home loan process with our expert guides.</p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-20 relative z-10">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {GUIDES.map((guide, idx) => (
            <Link key={idx} to={`/blog`} className="bg-white rounded-3xl p-6 shadow-sm border border-gray-100 hover:shadow-xl hover:-translate-y-1 transition-all group flex flex-col h-full">
              <div className="flex items-center justify-between mb-4">
                <span className="text-xs font-bold text-primary-600 uppercase tracking-wider bg-primary-50 px-3 py-1 rounded-full">
                  {guide.category}
                </span>
                <span className="text-xs font-semibold text-gray-400">{guide.readTime}</span>
              </div>
              <h2 className="text-xl font-black text-gray-900 mb-3 group-hover:text-primary-600 transition-colors">
                {guide.title}
              </h2>
              <p className="text-gray-600 text-sm mb-6 flex-1">
                {guide.desc}
              </p>
              <div className="flex items-center text-primary-600 font-bold text-sm mt-auto">
                Read Article <ChevronRight className="w-4 h-4 ml-1 group-hover:translate-x-1 transition-transform" />
              </div>
            </Link>
          ))}
        </div>
        
        {/* Newsletter Promo */}
        <div className="mt-12 bg-gradient-to-r from-primary-900 to-primary-800 rounded-3xl p-8 md:p-12 text-center text-white relative overflow-hidden">
          <div className="absolute inset-0 bg-[url('https://www.transparenttextures.com/patterns/cubes.png')] opacity-10"></div>
          <div className="relative z-10">
            <h3 className="text-2xl md:text-3xl font-black mb-4">Never Miss an Update on Interest Rates</h3>
            <p className="text-primary-200 mb-8 max-w-2xl mx-auto">Subscribe to our newsletter to get alerts when banks drop their home loan rates, plus weekly real estate insights.</p>
            <form className="flex flex-col sm:flex-row gap-3 max-w-md mx-auto" onSubmit={e => e.preventDefault()}>
              <input type="email" placeholder="Your email address" className="flex-1 px-5 py-3 rounded-xl text-gray-900 font-medium outline-none" required />
              <button type="submit" className="bg-accent-500 hover:bg-accent-600 text-white font-bold px-6 py-3 rounded-xl transition-colors">
                Subscribe
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}
