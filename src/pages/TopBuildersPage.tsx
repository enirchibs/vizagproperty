import { Link } from 'react-router-dom'
import { SEOHead } from '../components/SEOHead'
import { Building2, Star, ShieldCheck, ArrowRight, MapPin, CheckCircle2 } from 'lucide-react'

// Mock Data for Builders
const TOP_BUILDERS = [
  {
    id: 'mvv-builders',
    name: 'MVV Builders',
    logo: 'https://images.unsplash.com/photo-1560518883-ce09059eeffa?auto=format&fit=crop&q=80&w=200&h=200', // Placeholder
    description: 'One of the most trusted and prolific real estate developers in Visakhapatnam, known for timely delivery and premium quality in residential segments.',
    founded: '1998',
    totalProjects: 45,
    rating: 4.9,
    specialty: 'Premium Apartments & Gated Communities',
    ongoingProjects: [
      { name: 'MVV Green Gardens', location: 'Madhurawada', type: 'Luxury Apartments' },
      { name: 'MVV City', location: 'PM Palem', type: 'Integrated Township' }
    ]
  },
  {
    id: 'lansum-properties',
    name: 'Lansum Properties',
    logo: 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?auto=format&fit=crop&q=80&w=200&h=200', // Placeholder
    description: 'Creators of iconic skylines in Vizag, offering ultra-luxury high-rise residential towers with world-class amenities.',
    founded: '2004',
    totalProjects: 12,
    rating: 4.8,
    specialty: 'Ultra-Luxury High-Rises',
    ongoingProjects: [
      { name: 'Lansum Oxygen Towers', location: 'Seethammadhara', type: 'High-Rise Luxury' },
      { name: 'Lansum Elena', location: 'Yendada', type: 'Premium Residences' }
    ]
  },
  {
    id: 'shriram-properties',
    name: 'Shriram Properties',
    logo: 'https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&q=80&w=200&h=200', // Placeholder
    description: 'A national brand bringing massive IT SEZ townships and affordable premium living to the fast-growing corridors of Visakhapatnam.',
    founded: '1995',
    totalProjects: 30,
    rating: 4.7,
    specialty: 'Integrated Townships & IT SEZs',
    ongoingProjects: [
      { name: 'Shriram Panorama Hills', location: 'Madhurawada', type: 'Villas & Apartments' }
    ]
  },
  {
    id: 'mk-builders',
    name: 'MK Builders',
    logo: 'https://images.unsplash.com/photo-1541881454523-c52db9a365bb?auto=format&fit=crop&q=80&w=200&h=200', // Placeholder
    description: 'A legacy of excellence in Vizag real estate, focusing on VMRDA approved layouts, commercial spaces, and mid-segment housing.',
    founded: '2001',
    totalProjects: 25,
    rating: 4.6,
    specialty: 'Commercial & Mid-Segment Residential',
    ongoingProjects: [
      { name: 'MK One', location: 'Yendada', type: 'Commercial / Retail' },
      { name: 'MK Gold Coast', location: 'Bheemili', type: 'Sea-View Apartments' }
    ]
  }
]

export function TopBuildersPage() {
  const schema = {
    "@context": "https://schema.org",
    "@type": "WebPage",
    "name": "Top Real Estate Builders & Developers in Visakhapatnam | VizagProperty",
    "description": "Discover the most trusted Grade-A real estate builders in Vizag including MVV Builders, Lansum, and Shriram Properties. View their latest projects.",
    "url": "https://vizagproperty.co.in/builders"
  }

  return (
    <div className="min-h-screen bg-gray-50 pb-20">
      <SEOHead 
        title="Top Real Estate Builders & Developers in Vizag | VizagProperty"
        description="Discover the most trusted Grade-A real estate builders in Visakhapatnam. View latest projects from MVV Builders, Lansum, Shriram, and MK Builders."
        schema={schema}
      />

      {/* Hero Section */}
      <div className="bg-primary-900 py-20 text-white relative overflow-hidden">
        <div className="absolute inset-0 opacity-20">
          <img 
            src="https://images.unsplash.com/photo-1449844908441-8829872d2607?auto=format&fit=crop&q=80&w=2000" 
            alt="City Skyline Background" 
            className="w-full h-full object-cover"
          />
          <div className="absolute inset-0 bg-gradient-to-t from-primary-900 to-transparent"></div>
        </div>
        
        <div className="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <span className="inline-flex items-center px-4 py-1.5 rounded-full bg-primary-700/50 border border-primary-500 text-sm font-semibold tracking-wider mb-6 text-primary-100">
            <ShieldCheck className="h-4 w-4 mr-2 text-green-400" />
            VERIFIED DEVELOPERS
          </span>
          <h1 className="text-4xl md:text-5xl lg:text-6xl font-extrabold mb-6 leading-tight">
            Top Grade-A Builders <br className="hidden md:block"/> in Visakhapatnam
          </h1>
          <p className="text-lg md:text-xl text-primary-100 max-w-2xl mx-auto mb-10">
            Invest with confidence. Explore RERA-approved ongoing and completed projects from Vizag's most reputed real estate developers.
          </p>
        </div>
      </div>

      {/* Directory Grid */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-10 relative z-20">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {TOP_BUILDERS.map((builder) => (
            <div key={builder.id} className="bg-white rounded-2xl shadow-lg border border-gray-100 overflow-hidden hover:shadow-xl transition-shadow group">
              <div className="p-8">
                <div className="flex items-start justify-between mb-6">
                  <div className="flex items-center space-x-4">
                    <img 
                      src={builder.logo} 
                      alt={`${builder.name} Logo`} 
                      className="w-16 h-16 rounded-xl object-cover border border-gray-100 shadow-sm"
                    />
                    <div>
                      <h2 className="text-2xl font-bold text-gray-900 flex items-center">
                        {builder.name}
                        <CheckCircle2 className="h-5 w-5 text-blue-500 ml-2" />
                      </h2>
                      <p className="text-sm text-gray-500 font-medium">{builder.specialty}</p>
                    </div>
                  </div>
                  <div className="flex flex-col items-end">
                    <div className="flex items-center text-yellow-500 mb-1">
                      <Star className="h-5 w-5 fill-current" />
                      <span className="ml-1 font-bold text-gray-900">{builder.rating}</span>
                    </div>
                    <span className="text-xs text-gray-500 font-medium">Rating</span>
                  </div>
                </div>

                <p className="text-gray-600 mb-6 line-clamp-3">
                  {builder.description}
                </p>

                <div className="grid grid-cols-2 gap-4 mb-8">
                  <div className="bg-gray-50 p-4 rounded-xl border border-gray-100 text-center">
                    <div className="text-2xl font-bold text-primary-700">{builder.totalProjects}+</div>
                    <div className="text-xs text-gray-500 font-semibold uppercase tracking-wider mt-1">Projects Delivered</div>
                  </div>
                  <div className="bg-gray-50 p-4 rounded-xl border border-gray-100 text-center">
                    <div className="text-2xl font-bold text-primary-700">{builder.founded}</div>
                    <div className="text-xs text-gray-500 font-semibold uppercase tracking-wider mt-1">Established</div>
                  </div>
                </div>

                <div className="border-t border-gray-100 pt-6">
                  <h3 className="text-sm font-bold text-gray-900 uppercase tracking-wider mb-4 flex items-center">
                    <Building2 className="h-4 w-4 mr-2 text-gray-400" />
                    Featured Ongoing Projects
                  </h3>
                  <ul className="space-y-3">
                    {builder.ongoingProjects.map((project, idx) => (
                      <li key={idx} className="flex items-center justify-between group/project cursor-pointer">
                        <div className="flex items-center">
                          <MapPin className="h-4 w-4 text-gray-400 mr-2 group-hover/project:text-primary-600 transition-colors" />
                          <span className="text-gray-900 font-medium group-hover/project:text-primary-600 transition-colors">{project.name}</span>
                        </div>
                        <span className="text-xs font-semibold text-primary-700 bg-primary-50 px-2.5 py-1 rounded-full">
                          {project.location}
                        </span>
                      </li>
                    ))}
                  </ul>
                </div>
              </div>
              
              <div className="bg-gray-50 px-8 py-4 border-t border-gray-100">
                <Link to={`/properties?search=${builder.name}`} className="flex items-center justify-center w-full text-primary-600 font-bold hover:text-primary-700 transition-colors">
                  View All Properties by {builder.name}
                  <ArrowRight className="h-4 w-4 ml-2 group-hover:translate-x-1 transition-transform" />
                </Link>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* CTA Section */}
      <div className="max-w-4xl mx-auto px-4 mt-20 text-center">
        <h2 className="text-3xl font-bold text-gray-900 mb-4">Are you a Builder in Visakhapatnam?</h2>
        <p className="text-lg text-gray-600 mb-8">
          Join our verified partner network to list your projects directly to high-intent buyers and NRI investors.
        </p>
        <Link 
          to="/partner-apply"
          className="inline-flex justify-center items-center px-8 py-4 bg-primary-600 text-white rounded-xl font-bold hover:bg-primary-700 transition-colors shadow-lg"
        >
          Apply for Verified Partner Status
          <ArrowRight className="ml-2 h-5 w-5" />
        </Link>
      </div>

    </div>
  )
}
