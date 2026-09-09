import https from 'https';

function fetchUrl(url) {
  return new Promise((resolve, reject) => {
    https.get(url, { headers: { 'User-Agent': 'Mozilla/5.0' } }, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => resolve(data));
    }).on('error', reject);
  });
}

async function run() {
  const html = await fetchUrl('https://vmrda.ap.gov.in/citizen/approved-layouts');
  console.log('--- HTML CONTENT ---');
  console.log(html.slice(0, 500));

  // Extract all script src attributes
  const scriptMatches = html.match(/src=["']([^"']+)["']/g) || [];
  console.log('\n--- SCRIPTS FOUND ---');
  console.log(scriptMatches);

  // Also test standard APDPMS or VMRDA API endpoints
  const apisToTest = [
    'https://vmrda.ap.gov.in/api/Layout/GetApprovedLayouts',
    'https://vmrda.ap.gov.in/api/Citizen/GetApprovedLayouts',
    'https://vmrda.ap.gov.in/api/Layouts/Approved',
    'https://apdpms.ap.gov.in/api/Layout/GetApprovedLayouts',
    'https://vmrda.ap.gov.in/assets/layouts.json'
  ];

  for (const api of apisToTest) {
    try {
      const data = await fetchUrl(api);
      console.log(`\n--- TESTING ${api} --- (Length: ${data.length})`);
      console.log(data.slice(0, 300));
    } catch (e) {
      console.log(`Failed ${api}: ${e.message}`);
    }
  }
}

run();
