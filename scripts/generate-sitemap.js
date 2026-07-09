import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const BASE_URL = 'https://vizagproperty.co.in';

const PROPERTY_TYPES = [
  'flats-for-sale',
  '2-bhk-flats',
  '3-bhk-flats',
  'independent-houses',
  'villas',
  'vmrda-approved-plots',
  'gated-community-plots',
  'commercial-shops',
  'office-spaces'
];

const LOCATIONS = [
  'madhurawada',
  'yendada',
  'mvp-colony',
  'gajuwaka',
  'bhogapuram',
  'seethammadhara',
  'rushikonda',
  'bheemili',
  'pendurthi',
  'kurmannapalem',
  'sujatha-nagar',
  'nad-junction',
  'murali-nagar',
  'lawsons-bay-colony',
  'kpmg'
];

// Base static routes
const staticRoutes = [
  '/',
  '/search',
  '/home-loans',
  '/home-loans/compare',
  '/home-loans/emi-calculator',
  '/home-loans/eligibility',
  '/home-loans/affordability',
  '/home-loans/stamp-duty',
  '/home-loans/guide',
  '/home-loans/documents',
  '/about',
  '/contact',
  '/blog'
];

let sitemapXML = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
`;

const addUrl = (route, priority = '0.8', changefreq = 'weekly') => {
  sitemapXML += `  <url>
    <loc>${BASE_URL}${route}</loc>
    <lastmod>${new Date().toISOString().split('T')[0]}</lastmod>
    <changefreq>${changefreq}</changefreq>
    <priority>${priority}</priority>
  </url>\n`;
};

// Add static routes
staticRoutes.forEach(route => {
  addUrl(route, route === '/' ? '1.0' : '0.9');
});

// Add Programmatic SEO routes
let count = 0;
PROPERTY_TYPES.forEach(type => {
  LOCATIONS.forEach(location => {
    addUrl(`/explore/${type}/in/${location}`, '0.7', 'daily');
    count++;
  });
});

sitemapXML += `</urlset>`;

const outPath = path.join(__dirname, '..', 'public', 'sitemap.xml');
fs.writeFileSync(outPath, sitemapXML);

console.log(`Successfully generated sitemap.xml at ${outPath}`);
console.log(`Total URLs generated: ${staticRoutes.length + count}`);
