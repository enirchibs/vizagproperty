import fs from 'fs';

const content = fs.readFileSync('C:\\Users\\CNE\\.gemini\\antigravity\\brain\\326d4732-9cf9-4552-93fe-843e2bc45585\\.system_generated\\steps\\3288\\content.md', 'utf8');

// Match any quotes strings of length > 5
const matches = content.match(/["']([^"']{5,100})["']/g) || [];
const interesting = matches.filter(s => {
  const lower = s.toLowerCase();
  return lower.includes('api') || lower.includes('service') || lower.includes('layout') || lower.includes('citizen') || lower.includes('http') || lower.includes('get') || lower.includes('asp') || lower.includes('.php');
});

console.log(`Found ${interesting.length} interesting string literals:`);
console.log([...new Set(interesting)].slice(0, 50));
