export function generateBreadcrumbSchema(url: string) {
  let pathname = '/';
  try {
    pathname = new URL(url).pathname;
  } catch (e) {
    pathname = url.startsWith('/') ? url : `/${url}`;
  }

  const segments = pathname.split('/').filter(Boolean);

  const itemListElement = [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://vizagproperty.co.in"
    }
  ];

  let currentPath = "https://vizagproperty.co.in";

  segments.forEach((segment, index) => {
    currentPath += `/${segment}`;
    
    const formattedName = segment
      .split('-')
      .map(word => word.charAt(0).toUpperCase() + word.slice(1))
      .join(' ');

    itemListElement.push({
      "@type": "ListItem",
      "position": index + 2,
      "name": formattedName,
      "item": currentPath
    });
  });

  return {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": itemListElement
  };
}

export function generateRealEstateListingSchema(property: {
  id: string;
  title: string;
  description?: string;
  price?: number;
  location?: string;
  locality_name?: string;
  images?: string[];
  bedrooms?: number;
  bathrooms?: number;
  area_sqft?: number;
  property_type?: string;
  created_at?: string;
}) {
  const imageUrls = property.images && property.images.length > 0
    ? property.images
    : ['https://vizagproperty.co.in/og-image.jpg'];

  return {
    "@context": "https://schema.org",
    "@type": "RealEstateListing",
    "name": property.title,
    "description": property.description || property.title,
    "url": `https://vizagproperty.co.in/property/${property.id}`,
    "image": imageUrls,
    "datePosted": property.created_at || new Date().toISOString(),
    "offers": {
      "@type": "Offer",
      "price": property.price || 0,
      "priceCurrency": "INR",
      "availability": "https://schema.org/InStock",
      "validFrom": property.created_at || new Date().toISOString()
    },
    "place": {
      "@type": "Place",
      "name": property.location || property.locality_name || "Visakhapatnam",
      "address": {
        "@type": "PostalAddress",
        "addressLocality": property.locality_name || "Visakhapatnam",
        "addressRegion": "Andhra Pradesh",
        "addressCountry": "IN"
      }
    }
  };
}

export function generateFAQSchema(faqs: { question: string; answer: string }[]) {
  return {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": faqs.map(faq => ({
      "@type": "Question",
      "name": faq.question,
      "acceptedAnswer": {
        "@type": "Answer",
        "text": faq.answer
      }
    }))
  };
}

export function generateLocalityPlaceSchema(localityName: string, description: string, url: string) {
  return {
    "@context": "https://schema.org",
    "@type": "Place",
    "name": `${localityName}, Visakhapatnam`,
    "description": description,
    "url": url,
    "containedInPlace": {
      "@type": "City",
      "name": "Visakhapatnam",
      "containedInPlace": {
        "@type": "State",
        "name": "Andhra Pradesh"
      }
    }
  };
}
