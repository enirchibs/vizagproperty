import https from 'https';

const url = 'https://vmrda.ap.gov.in/api/approved-layouts';

https.get(url, { headers: { 'User-Agent': 'Mozilla/5.0' } }, (res) => {
  let data = '';
  res.on('data', chunk => data += chunk);
  res.on('end', () => {
    console.log('--- VMRDA API RESPONSE ---');
    console.log(data);
  });
});
