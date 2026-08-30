import { useEffect } from 'react';
import { generateBreadcrumbSchema } from '../lib/schemaUtils';

interface SEOHeadProps {
  title: string;
  description: string;
  schema?: Record<string, any>;
  ogImage?: string;
  url?: string;
  canonicalUrl?: string;
  keywords?: string;
  noindex?: boolean;
}

export function SEOHead({
  title,
  description,
  schema,
  ogImage = 'https://vizagproperty.co.in/og-image.jpg',
  url = 'https://vizagproperty.co.in',
  canonicalUrl,
  keywords,
  noindex = false
}: SEOHeadProps) {
  useEffect(() => {
    // 1. Update Document Title
    document.title = title;

    // 2. Helper for Meta Tags
    const setMetaTag = (selector: string, attrName: string, attrVal: string, content: string) => {
      let element = document.querySelector(selector);
      if (!element) {
        element = document.createElement('meta');
        element.setAttribute(attrName, attrVal);
        document.head.appendChild(element);
      }
      element.setAttribute('content', content);
    };

    // 3. Update Standard Meta Description & Keywords
    setMetaTag('meta[name="description"]', 'name', 'description', description);
    if (keywords) {
      setMetaTag('meta[name="keywords"]', 'name', 'keywords', keywords);
    }

    // 4. Update Robots Directives
    const robotsContent = noindex ? 'noindex, nofollow' : 'index, follow, max-image-preview:large';
    setMetaTag('meta[name="robots"]', 'name', 'robots', robotsContent);

    // 5. Update Canonical Link
    const targetCanonical = canonicalUrl || url;
    let canonicalLink = document.querySelector('link[rel="canonical"]');
    if (!canonicalLink) {
      canonicalLink = document.createElement('link');
      canonicalLink.setAttribute('rel', 'canonical');
      document.head.appendChild(canonicalLink);
    }
    canonicalLink.setAttribute('href', targetCanonical);

    // 6. Update Open Graph Meta Tags
    setMetaTag('meta[property="og:title"]', 'property', 'og:title', title);
    setMetaTag('meta[property="og:description"]', 'property', 'og:description', description);
    setMetaTag('meta[property="og:image"]', 'property', 'og:image', ogImage);
    setMetaTag('meta[property="og:url"]', 'property', 'og:url', targetCanonical);
    setMetaTag('meta[property="og:type"]', 'property', 'og:type', 'website');
    setMetaTag('meta[property="og:site_name"]', 'property', 'og:site_name', 'Vizag Property Experts');

    // 7. Update Twitter Card Meta Tags
    setMetaTag('meta[name="twitter:card"]', 'name', 'twitter:card', 'summary_large_image');
    setMetaTag('meta[name="twitter:title"]', 'name', 'twitter:title', title);
    setMetaTag('meta[name="twitter:description"]', 'name', 'twitter:description', description);
    setMetaTag('meta[name="twitter:image"]', 'name', 'twitter:image', ogImage);

    // 8. Update JSON-LD Schema
    const breadcrumbSchema = generateBreadcrumbSchema(targetCanonical);
    
    let finalSchema;
    if (schema) {
      if (Array.isArray(schema)) {
        const hasBreadcrumb = schema.some(s => s['@type'] === 'BreadcrumbList');
        finalSchema = hasBreadcrumb ? schema : [breadcrumbSchema, ...schema];
      } else if (schema['@graph']) {
         const hasBreadcrumb = schema['@graph'].some((s: any) => s['@type'] === 'BreadcrumbList');
         finalSchema = hasBreadcrumb ? schema : { ...schema, '@graph': [breadcrumbSchema, ...schema['@graph']] };
      } else {
        finalSchema = schema['@type'] === 'BreadcrumbList' ? schema : [breadcrumbSchema, schema];
      }
    } else {
      finalSchema = breadcrumbSchema;
    }

    let script = document.querySelector('#seo-schema-script') as HTMLScriptElement;
    if (!script) {
      script = document.createElement('script');
      script.id = 'seo-schema-script';
      script.type = 'application/ld+json';
      document.head.appendChild(script);
    }
    script.text = JSON.stringify(finalSchema);

    return () => {
      const script = document.querySelector('#seo-schema-script');
      if (script) {
        script.remove();
      }
    };
  }, [title, description, schema, ogImage, url, canonicalUrl, keywords, noindex]);

  return null;
}
