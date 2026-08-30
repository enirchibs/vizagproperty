import { useState, useEffect } from 'react';
import { supabase } from '../../lib/supabase';
import { Property } from '../../types';
import { PropertyCard } from '../../components/PropertyCard';
import { SEOHead } from '../../components/SEOHead';
import { Building2 } from 'lucide-react';

export function NewProjectsPage() {
  const [projects, setProjects] = useState<Property[]>([]);
  const [loading, setLoading] = useState(true);
  const canonicalUrl = 'https://vizagproperty.co.in/projects';

  useEffect(() => {
    async function loadProjects() {
      setLoading(true);
      try {
        const { data } = await supabase
          .from('properties')
          .select('*, localities!inner(name, slug, city)')
          .eq('status', 'approved')
          .limit(24);
        setProjects(data || []);
      } catch (e) {
        console.error(e);
      } finally {
        setLoading(false);
      }
    }
    loadProjects();
  }, []);

  return (
    <div className="min-h-screen bg-gray-50 pb-16">
      <SEOHead
        title="New Projects in Vizag | Ongoing Builder Projects & Townships Visakhapatnam"
        description="Explore new launching projects in Vizag. Verified residential builder projects, apartment complexes, gated layouts & villa townships across Visakhapatnam."
        canonicalUrl={canonicalUrl}
        url={canonicalUrl}
        keywords="new projects in vizag, upcoming builder projects vizag, ongoing apartments visakhapatnam, new launch plots vizag"
      />

      <section className="bg-gradient-to-r from-slate-950 via-primary-900 to-indigo-950 text-white py-14 px-4">
        <div className="max-w-7xl mx-auto">
          <div className="flex items-center gap-2 text-accent-400 text-xs md:text-sm font-bold uppercase tracking-wider mb-2">
            <Building2 className="w-4 h-4" /> Builder Projects & Townships
          </div>
          <h1 className="text-3xl md:text-5xl font-extrabold tracking-tight mb-3">
            New Projects in Vizag
          </h1>
          <p className="text-base md:text-lg text-gray-200 max-w-3xl leading-relaxed">
            Discover ongoing apartment complexes, VMRDA approved gated layouts, and luxury villa projects in Visakhapatnam.
          </p>
        </div>
      </section>

      <main className="max-w-7xl mx-auto px-4 py-10">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-5">
          {loading ? (
            [1, 2, 3, 4].map(i => <div key={i} className="h-72 bg-gray-200 rounded-2xl animate-pulse"></div>)
          ) : (
            projects.map(p => <PropertyCard key={p.id} property={p} />)
          )}
        </div>
      </main>
    </div>
  );
}
