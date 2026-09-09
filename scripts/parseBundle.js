import fs from 'fs';

const content = fs.readFileSync('C:\\Users\\CNE\\.gemini\\antigravity\\brain\\326d4732-9cf9-4552-93fe-843e2bc45585\\.system_generated\\steps\\3288\\content.md', 'utf8');

// Search for URLs in the JS bundle
const urlRegex = /(https?:\/\/[^\s'"\`<>]+)/g;
const urls = [...new Set(content.match(urlRegex) || [])];

console.log('--- FOUND URLS IN VMRDA JS BUNDLE ---');
urls.forEach(u => console.log(u));

// Search for API path strings like /api/ or citizen/
const apiPaths = [...new Set(content.match(/["'](\/[a-zA-Z0-9_\-\/]+)["']/g) || [])]
  .filter(p => p.includes('layout') || p.includes('citizen') || p.includes('approved') || p.includes('api') || p.includes('pdf'));

console.log('\n--- FOUND API PATHS IN VMRDA JS BUNDLE ---');
apiPaths.slice(0, 40).forEach(p => console.log(p));
