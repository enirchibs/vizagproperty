import { Link } from 'react-router-dom'
import { SEOHead } from '../components/SEOHead'
import { Newspaper, Clock, TrendingUp, ArrowRight, Share2, Search } from 'lucide-react'

const NEWS_ARTICLES = [
  {
    id: 1,
    title: "Bhogapuram Airport Construction Accelerates, First Flight Expected by 2026",
    category: "Infrastructure",
    date: "July 8, 2026",
    readTime: "4 min read",
    image: "https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&q=80&w=800",
    excerpt: "GMR Group has accelerated the construction of the greenfield international airport at Bhogapuram. Surrounding plot values have seen a 25% spike in the last quarter alone.",
    featured: true
  },
  {
    id: 2,
    title: "VMRDA Announces 3 New Master Plan Roads in Northern Corridor",
    category: "Government Policy",
    date: "July 7, 2026",
    readTime: "3 min read",
    image: "https://images.unsplash.com/photo-1541881454523-c52db9a365bb?auto=format&fit=crop&q=80&w=800",
    excerpt: "To ease traffic congestion towards the new IT zones, VMRDA has approved three massive 100-ft master plan roads connecting Madhurawada and Anandapuram.",
    featured: false
  },
  {
    id: 3,
    title: "Vizag IT Exports Cross ₹10,000 Crore Mark, Boosting Rental Demand",
    category: "Market Trends",
    date: "July 5, 2026",
    readTime: "5 min read",
    image: "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&q=80&w=800",
    excerpt: "With major tech giants expanding their footprint in Rushikonda IT Hill, premium rental apartments in MVP Colony and Yendada are experiencing near 100% occupancy.",
    featured: false
  },
  {
    id: 4,
    title: "RERA Crackdown: 15 Unauthorized Layouts Seized Near Bheemili",
    category: "Legal & Regulatory",
    date: "July 3, 2026",
    readTime: "2 min read",
    image: "https://images.unsplash.com/photo-1574362848149-11496d93a7c7?auto=format&fit=crop&q=80&w=800",
    excerpt: "AP RERA authorities have intensified their crackdown on unauthorized Panchayat layouts, urging buyers to strictly verify VMRDA LP numbers before investing.",
    featured: false
  },
  {
    id: 5,
    title: "Executive Capital Transition: What it Means for Vizag Real Estate in 2026",
    category: "Analysis",
    date: "July 1, 2026",
    readTime: "7 min read",
    image: "https://images.unsplash.com/photo-1449844908441-8829872d2607?auto=format&fit=crop&q=80&w=800",
    excerpt: "An in-depth analysis of how the administrative shift is reshaping property micro-markets in Visakhapatnam, creating high-yield zones for early investors.",
    featured: true
  }
]

export function RealEstateNewsPage() {
  const schema = {
    "@context": "https://schema.org",
    "@type": "Blog",
    "name": "Daily Vizag Real Estate News & Updates | VizagProperty",
    "description": "Stay updated with the latest real estate news in Visakhapatnam. Get daily updates on VMRDA policies, Bhogapuram airport, IT developments, and property market trends.",
    "url": "https://vizagproperty.co.in/news"
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead 
        title="Daily Vizag Real Estate News & Market Updates | VizagProperty"
        description="Latest Visakhapatnam real estate news. Daily updates on VMRDA layouts, Bhogapuram Airport impact, property price trends, and government policies."
        schema={schema}
      />
      
      {/* Header */}
      <div className="bg-white border-b border-gray-200 sticky top-14 z-30 shadow-sm">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
          <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
            <div className="flex items-center">
              <Newspaper className="h-8 w-8 text-primary-600 mr-3" />
              <div>
                <h1 className="text-2xl md:text-3xl font-extrabold text-gray-900 leading-tight">Vizag Property News</h1>
                <p className="text-sm text-gray-500 font-medium mt-1">Daily Insights & Market Intelligence</p>
              </div>
            </div>
            
            <div className="relative max-w-md w-full md:w-72">
              <input 
                type="text"
                placeholder="Search news..."
                className="w-full pl-10 pr-4 py-2 bg-gray-100 border-transparent rounded-full focus:bg-white focus:ring-2 focus:ring-primary-500 focus:border-transparent transition-all"
              />
              <Search className="absolute left-3 top-2.5 h-5 w-5 text-gray-400" />
            </div>
          </div>
          
          {/* Categories */}
          <div className="flex overflow-x-auto scrollbar-hide space-x-2 mt-6 pb-2">
            {['All News', 'Infrastructure', 'Market Trends', 'Government Policy', 'Legal & Regulatory', 'Analysis'].map((cat, idx) => (
              <button 
                key={idx}
                className={`px-4 py-1.5 rounded-full text-sm font-semibold whitespace-nowrap transition-colors ${idx === 0 ? 'bg-primary-900 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'}`}
              >
                {cat}
              </button>
            ))}
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
        
        {/* Featured News Grid */}
        <div className="mb-16">
          <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <TrendingUp className="h-5 w-5 mr-2 text-red-500" />
            Trending Today
          </h2>
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
            {NEWS_ARTICLES.filter(a => a.featured).map(article => (
              <Link to={`/blog`} key={article.id} className="group flex flex-col bg-white rounded-2xl overflow-hidden shadow-md hover:shadow-xl transition-shadow border border-gray-100 relative">
                <div className="h-64 overflow-hidden relative">
                  <div className="absolute top-4 left-4 z-10">
                    <span className="bg-red-500 text-white text-xs font-bold px-3 py-1 rounded-full shadow-lg">HOT</span>
                  </div>
                  <img 
                    src={article.image} 
                    alt={article.title} 
                    className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-700"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-gray-900/80 to-transparent"></div>
                  <div className="absolute bottom-4 left-4 right-4 text-white">
                    <span className="text-xs font-semibold uppercase tracking-wider text-primary-200 mb-2 block">{article.category}</span>
                    <h3 className="text-2xl font-bold leading-tight group-hover:text-primary-300 transition-colors">{article.title}</h3>
                  </div>
                </div>
                <div className="p-6 flex-1 flex flex-col justify-between">
                  <p className="text-gray-600 mb-4 line-clamp-2">{article.excerpt}</p>
                  <div className="flex items-center justify-between text-xs text-gray-500 font-medium">
                    <div className="flex items-center">
                      <Clock className="h-4 w-4 mr-1" />
                      {article.date} &middot; {article.readTime}
                    </div>
                    <Share2 className="h-4 w-4 hover:text-primary-600 transition-colors" />
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>

        {/* Latest News Feed */}
        <div>
          <h2 className="text-xl font-bold text-gray-900 mb-6 flex items-center">
            <Clock className="h-5 w-5 mr-2 text-primary-600" />
            Latest Updates
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {NEWS_ARTICLES.filter(a => !a.featured).map(article => (
              <Link to={`/blog`} key={article.id} className="group bg-white rounded-xl overflow-hidden border border-gray-200 hover:border-primary-300 hover:shadow-lg transition-all flex flex-col">
                <div className="h-48 overflow-hidden">
                  <img 
                    src={article.image} 
                    alt={article.title} 
                    className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                  />
                </div>
                <div className="p-5 flex-1 flex flex-col">
                  <span className="text-xs font-bold text-primary-600 uppercase tracking-wider mb-2">{article.category}</span>
                  <h3 className="text-lg font-bold text-gray-900 mb-3 group-hover:text-primary-600 transition-colors line-clamp-2">{article.title}</h3>
                  <p className="text-sm text-gray-600 mb-4 line-clamp-3 flex-1">{article.excerpt}</p>
                  
                  <div className="flex items-center justify-between pt-4 border-t border-gray-100">
                    <span className="text-xs font-medium text-gray-500">{article.date}</span>
                    <span className="text-sm font-bold text-primary-600 flex items-center group-hover:translate-x-1 transition-transform">
                      Read More <ArrowRight className="h-4 w-4 ml-1" />
                    </span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>

        {/* Newsletter CTA */}
        <div className="mt-16 bg-primary-900 rounded-3xl p-8 md:p-12 text-center relative overflow-hidden shadow-2xl">
          <div className="absolute inset-0 opacity-10">
            <svg className="w-full h-full" xmlns="http://www.w3.org/2000/svg">
              <defs>
                <pattern id="grid-pattern-news" width="40" height="40" patternUnits="userSpaceOnUse">
                  <path d="M 40 0 L 0 0 0 40" fill="none" stroke="currentColor" strokeWidth="1"/>
                </pattern>
              </defs>
              <rect width="100%" height="100%" fill="url(#grid-pattern-news)" />
            </svg>
          </div>
          <div className="relative z-10 max-w-2xl mx-auto">
            <Newspaper className="h-12 w-12 text-primary-400 mx-auto mb-4" />
            <h3 className="text-3xl font-bold text-white mb-4">Never Miss a Market Shift</h3>
            <p className="text-primary-200 mb-8">
              Get the most critical Visakhapatnam real estate news, policy changes, and investment alerts delivered straight to your inbox weekly.
            </p>
            <form className="flex flex-col sm:flex-row gap-3 max-w-md mx-auto">
              <input 
                type="email" 
                placeholder="Enter your email address" 
                className="flex-1 px-4 py-3 rounded-xl border-none focus:ring-4 focus:ring-primary-500/50 outline-none font-medium"
                required
              />
              <button 
                type="button" 
                className="bg-accent-500 text-white font-bold px-6 py-3 rounded-xl hover:bg-accent-600 transition-colors shadow-lg whitespace-nowrap"
              >
                Subscribe Free
              </button>
            </form>
          </div>
        </div>
        
      </div>
    </div>
  )
}
