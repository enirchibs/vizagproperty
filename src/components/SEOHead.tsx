import { useEffect } from 'react';
import { generateBreadcrumbSchema } from '../lib/schemaUtils';

interface SEOHeadProps {
  title: string;
  description: string;
  schema?: Record<string, any>;
  ogImage?: string;
  url?: string;
}

export function SEOHead({ title, description, schema, ogImage = 'https://vizagproperty.co.in/og-image.jpg', url = 'https://vizagproperty.co.in' }: SEOHeadProps) {
  useEffect(() => {
    // Update Title
    document.title = title;

    // Update Meta Description
    let metaDescription = document.querySelector('meta[name="description"]');
    if (!metaDescription) {
      metaDescription = document.createElement('meta');
      metaDescription.setAttribute('name', 'description');
      document.head.appendChild(metaDescription);
    }
    metaDescription.setAttribute('content', description);

    // Update Open Graph tags
    let ogTitle = document.querySelector('meta[property="og:title"]');
    if (!ogTitle) {
      ogTitle = document.createElement('meta');
      ogTitle.setAttribute('property', 'og:title');
      document.head.appendChild(ogTitle);
    }
    ogTitle.setAttribute('content', title);

    let ogDesc = document.querySelector('meta[property="og:description"]');
    if (!ogDesc) {
      ogDesc = document.createElement('meta');
      ogDesc.setAttribute('property', 'og:description');
      document.head.appendChild(ogDesc);
    }
    ogDesc.setAttribute('content', description);

    let ogImg = document.querySelector('meta[property="og:image"]');
    if (!ogImg) {
      ogImg = document.createElement('meta');
      ogImg.setAttribute('property', 'og:image');
      document.head.appendChild(ogImg);
    }
    ogImg.setAttribute('content', ogImage);

    let ogUrl = document.querySelector('meta[property="og:url"]');
    if (!ogUrl) {
      ogUrl = document.createElement('meta');
      ogUrl.setAttribute('property', 'og:url');
      document.head.appendChild(ogUrl);
    }
    ogUrl.setAttribute('content', url);

    // Update JSON-LD Schema
    const breadcrumbSchema = generateBreadcrumbSchema(url);
    
    let finalSchema;
    if (schema) {
      // If user provided an array of schemas, push breadcrumb into it
      if (Array.isArray(schema)) {
        // Only add breadcrumb if one doesn't already exist in the array
        const hasBreadcrumb = schema.some(s => s['@type'] === 'BreadcrumbList');
        finalSchema = hasBreadcrumb ? schema : [breadcrumbSchema, ...schema];
      } else if (schema['@graph']) {
         // Handle @graph structure
         const hasBreadcrumb = schema['@graph'].some((s: any) => s['@type'] === 'BreadcrumbList');
         finalSchema = hasBreadcrumb ? schema : { ...schema, '@graph': [breadcrumbSchema, ...schema['@graph']] };
      } else {
        // If it's a single schema object, wrap both in an array
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
      // Cleanup dynamically injected schema on unmount to avoid duplication
      const script = document.querySelector('#seo-schema-script');
      if (script) {
        script.remove();
      }
    };
  }, [title, description, schema, ogImage, url]);

  return null;
}
