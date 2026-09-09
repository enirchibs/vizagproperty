import fs from 'fs';

const content = fs.readFileSync('C:\\Users\\CNE\\.gemini\\antigravity\\brain\\326d4732-9cf9-4552-93fe-843e2bc45585\\.system_generated\\steps\\3288\\content.md', 'utf8');

const jsFiles = [...new Set(content.match(/[a-zA-Z0-9_\-]+\-[A-Z0-9]{8}\.js/g) || [])];
console.log('--- FOUND JS CHUNK FILENAMES IN MAIN BUNDLE ---');
console.log(jsFiles);

const endpoints = [...new Set(content.match(/https?:\/\/[a-zA-Z0-9_\-\.\:]+\/?[a-zA-Z0-9_\-\/\.]*/g) || [])];
console.log('\n--- ALL HTTP URLS ---');
console.log(endpoints);
