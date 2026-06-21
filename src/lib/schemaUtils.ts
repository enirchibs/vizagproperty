export function generateBreadcrumbSchema(url: string) {
  // Parse the URL to get the path segments
  let pathname = '/';
  try {
    pathname = new URL(url).pathname;
  } catch (e) {
    // If url is just a path, use it directly
    pathname = url.startsWith('/') ? url : `/${url}`;
  }

  // Split path into segments and remove empty strings
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
    
    // Format the segment name (e.g., "vuda-approved" -> "Vuda Approved")
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
