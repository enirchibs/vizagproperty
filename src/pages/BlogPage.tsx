import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import { Calendar, Clock, ArrowRight } from 'lucide-react';

interface BlogPost {
  id: string;
  title: string;
  slug: string;
  excerpt: string;
  category: string;
  og_image: string;
  author_name: string;
  reading_time_min: number;
  published_at: string;
}

export function BlogPage() {
  const [blogs, setBlogs] = useState<BlogPost[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    async function fetchBlogs() {
      try {
        const { data, error } = await supabase
          .from('blog_posts')
          .select('id, title, slug, excerpt, category, og_image, author_name, reading_time_min, published_at')
          .eq('published', true)
          .order('published_at', { ascending: false });

        if (error) throw error;
        setBlogs(data || []);
      } catch (err: any) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    }

    fetchBlogs();
  }, []);

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"></div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-12">
          <h1 className="text-4xl font-extrabold text-gray-900 sm:text-5xl">
            Real Estate Insights & News
          </h1>
          <p className="mt-4 text-xl text-gray-500 max-w-2xl mx-auto">
            Stay updated with the latest trends, investment tips, and market analysis in Vizag's real estate.
          </p>
        </div>

        {error && (
          <div className="bg-red-50 border-l-4 border-red-400 p-4 mb-8">
            <div className="flex">
              <div className="ml-3">
                <p className="text-sm text-red-700">{error}</p>
              </div>
            </div>
          </div>
        )}

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {blogs.map((blog) => (
            <Link
              key={blog.id}
              to={`/blog/${blog.slug}`}
              className="flex flex-col bg-white rounded-2xl shadow-sm hover:shadow-md transition-shadow overflow-hidden group"
            >
              <div className="relative h-48 w-full overflow-hidden">
                <img
                  src={blog.og_image || "https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80"}
                  alt={blog.title}
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                />
                <div className="absolute top-4 left-4">
                  <span className="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-white/90 text-primary-700 backdrop-blur-sm">
                    {blog.category.replace('-', ' ').toUpperCase()}
                  </span>
                </div>
              </div>
              <div className="flex flex-1 flex-col justify-between p-6">
                <div className="flex-1">
                  <div className="flex items-center text-sm text-gray-500 mb-3 space-x-4">
                    <div className="flex items-center">
                      <Calendar className="h-4 w-4 mr-1" />
                      {new Date(blog.published_at).toLocaleDateString('en-US', {
                        month: 'short',
                        day: 'numeric',
                        year: 'numeric'
                      })}
                    </div>
                    <div className="flex items-center">
                      <Clock className="h-4 w-4 mr-1" />
                      {blog.reading_time_min} min read
                    </div>
                  </div>
                  <h3 className="text-xl font-semibold text-gray-900 group-hover:text-primary-600 transition-colors line-clamp-2">
                    {blog.title}
                  </h3>
                  <p className="mt-3 text-base text-gray-500 line-clamp-3">
                    {blog.excerpt}
                  </p>
                </div>
                <div className="mt-6 flex items-center text-primary-600 font-medium text-sm">
                  Read Article
                  <ArrowRight className="ml-2 h-4 w-4 group-hover:translate-x-1 transition-transform" />
                </div>
              </div>
            </Link>
          ))}

          {blogs.length === 0 && !loading && !error && (
            <div className="col-span-full text-center py-12 text-gray-500">
              No blog posts available yet. Check back soon!
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
