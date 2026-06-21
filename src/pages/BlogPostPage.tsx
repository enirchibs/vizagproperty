import { useEffect, useState } from 'react';
import { useParams, Link, useNavigate } from 'react-router-dom';
import { supabase } from '../lib/supabase';
import ReactMarkdown from 'react-markdown';
import { Calendar, Clock, ArrowLeft, User, Tag } from 'lucide-react';
import { SEOHead } from '../components/SEOHead';
import { AdSenseInArticle } from '../components/AdSenseInArticle';
import { injectInternalLinks } from '../utils/seo/autoLinker';

interface BlogPost {
  id: string;
  title: string;
  slug: string;
  content: string;
  category: string;
  tags: string[];
  og_image: string;
  author_name: string;
  reading_time_min: number;
  published_at: string;
  meta_title: string;
  meta_description: string;
}

export function BlogPostPage() {
  const { slug } = useParams<{ slug: string }>();
  const navigate = useNavigate();
  const [blog, setBlog] = useState<BlogPost | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    async function fetchBlog() {
      if (!slug) return;
      
      try {
        const { data, error } = await supabase
          .from('blog_posts')
          .select('*')
          .eq('slug', slug)
          .eq('published', true)
          .single();

        if (error) throw error;
        
        if (data) {
          setBlog(data);
        } else {
          setError('Blog not found');
        }
      } catch (err: any) {
        setError(err.message || 'Blog not found');
      } finally {
        setLoading(false);
      }
    }

    fetchBlog();
  }, [slug]);

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"></div>
      </div>
    );
  }

  if (error || !blog) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center px-4">
        <div className="text-center">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">{error || 'Blog not found'}</h2>
          <button
            onClick={() => navigate('/blog')}
            className="inline-flex items-center text-primary-600 hover:text-primary-700 font-medium"
          >
            <ArrowLeft className="mr-2 h-4 w-4" />
            Back to VizagInformation
          </button>
        </div>
      </div>
    );
  }

  return (
    <article className="min-h-screen bg-white">
      <SEOHead 
        title={blog.meta_title || `${blog.title} | VizagProperty`}
        description={blog.meta_description}
        ogImage={blog.og_image || "https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-4.0.3&auto=format&fit=crop&w=2000&q=80"}
        url={window.location.href}
        schema={{
          "@context": "https://schema.org",
          "@type": "Article",
          "headline": blog.title,
          "description": blog.meta_description,
          "image": blog.og_image,
          "author": {
            "@type": "Person",
            "name": blog.author_name
          },
          "datePublished": new Date(blog.published_at).toISOString(),
          "publisher": {
            "@type": "Organization",
            "name": "VizagProperty",
            "logo": {
              "@type": "ImageObject",
              "url": "https://vizagproperty.co.in/logo.png"
            }
          }
        }}
      />
      
      {/* Hero Section */}
      <div className="relative w-full h-[40vh] min-h-[300px] lg:h-[50vh] bg-gray-900">
        <img
          src={blog.og_image || "https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-4.0.3&auto=format&fit=crop&w=2000&q=80"}
          alt={blog.title}
          className="absolute inset-0 w-full h-full object-cover opacity-60"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-gray-900/80 to-transparent" />
        
        <div className="absolute inset-0 flex items-center">
          <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 w-full text-center">
            <span className="inline-block px-4 py-1.5 rounded-full bg-primary-600 text-white text-sm font-semibold tracking-wider mb-6">
              {blog.category.replace('-', ' ').toUpperCase()}
            </span>
            <h1 className="text-3xl sm:text-4xl lg:text-5xl font-extrabold text-white leading-tight mb-6">
              {blog.title}
            </h1>
            <div className="flex flex-wrap items-center justify-center text-gray-200 text-sm gap-6">
              <div className="flex items-center">
                <User className="mr-2 h-4 w-4" />
                {blog.author_name}
              </div>
              <div className="flex items-center">
                <Calendar className="mr-2 h-4 w-4" />
                {new Date(blog.published_at).toLocaleDateString('en-US', {
                  month: 'long',
                  day: 'numeric',
                  year: 'numeric'
                })}
              </div>
              <div className="flex items-center">
                <Clock className="mr-2 h-4 w-4" />
                {blog.reading_time_min} min read
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Content Section */}
      <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-12 lg:py-16">
        <Link 
          to="/blog"
          className="inline-flex items-center text-sm text-gray-500 hover:text-primary-600 transition-colors mb-10 group"
        >
          <ArrowLeft className="mr-2 h-4 w-4 group-hover:-translate-x-1 transition-transform" />
          Back to VizagInformation
        </Link>

        <div className="prose prose-lg prose-primary max-w-none prose-headings:font-bold prose-a:text-primary-600 hover:prose-a:text-primary-700">
          <ReactMarkdown
            components={{
              p: ({ node, children, ...props }) => {
                const content = Array.isArray(children) ? children.join('') : String(children);
                if (content.includes('[AdSense Native In-Article Ad Placeholder]') || content.includes('[AdSense Content Link Ad Placeholder]') || content.includes('[AdSense Matched Content Unit Placeholder]')) {
                  return <AdSenseInArticle />;
                }
                return <p {...props}>{children}</p>;
              },
              blockquote: ({ node, children, ...props }) => {
                // If the blockquote only contains the AdSense component, we can unwrap it to prevent layout padding issues
                const isAdSense = String(children).includes('[object Object]'); // Rough heuristic for React Node insertion inside blockquote
                if (isAdSense) return <div className="my-8">{children}</div>;
                return <blockquote {...props}>{children}</blockquote>;
              }
            }}
          >
            {injectInternalLinks(blog.content)}
          </ReactMarkdown>
        </div>

        {/* Tags */}
        {blog.tags && blog.tags.length > 0 && (
          <div className="mt-12 pt-8 border-t border-gray-100">
            <h3 className="text-sm font-medium text-gray-900 mb-4 flex items-center">
              <Tag className="h-4 w-4 mr-2" />
              Tags
            </h3>
            <div className="flex flex-wrap gap-2">
              {blog.tags.map((tag) => (
                <span
                  key={tag}
                  className="inline-flex items-center px-3 py-1 rounded-full text-sm bg-gray-100 text-gray-700"
                >
                  {tag}
                </span>
              ))}
            </div>
          </div>
        )}

        {/* CTA Section */}
        <div className="mt-16 bg-gradient-to-br from-primary-50 to-primary-100 rounded-3xl p-8 sm:p-10 text-center border border-primary-200">
          <h2 className="text-2xl font-bold text-gray-900 mb-4">
            Ready to find your dream property in Vizag?
          </h2>
          <p className="text-primary-800 mb-8 max-w-2xl mx-auto">
            Explore our curated list of verified flats, villas, and plots in the best neighborhoods. Our AI assistant can help you find exactly what you're looking for.
          </p>
          <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
            <Link
              to="/properties"
              className="w-full sm:w-auto px-8 py-3 bg-primary-600 text-white rounded-full font-semibold hover:bg-primary-700 transition-colors shadow-md hover:shadow-lg flex items-center justify-center gap-2"
            >
              Explore Properties
              <ArrowLeft className="h-4 w-4 rotate-180" />
            </Link>
            <Link
              to="/"
              className="w-full sm:w-auto px-8 py-3 bg-white text-primary-600 border-2 border-primary-200 rounded-full font-semibold hover:bg-primary-50 transition-colors flex items-center justify-center"
            >
              Go to Homepage
            </Link>
          </div>
        </div>
      </div>
    </article>
  );
}
