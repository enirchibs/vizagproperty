import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://fqjzjngseryyzfsmiulb.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZxanpqbmdzZXJ5eXpmc21pdWxiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc0Mjk1MjksImV4cCI6MjA4MzAwNTUyOX0.YFhpBuEraYDDyKxmEUIyEknsukK3nkiSX33xIlflQ0Q';
const supabase = createClient(supabaseUrl, supabaseKey);

async function run() {
  // Test 1: RPC directly
  console.log('=== Direct RPC test ===');
  const r1 = await supabase.rpc('search_locations', { search_query: 'kom', limit_count: 10 });
  console.log('RPC "kom" results:', r1.data?.map(d => `[${d.entity_type}] ${d.display_name}`));
  console.log('RPC error:', r1.error);

  // Test 2: Edge function
  console.log('\n=== Edge Function test ===');
  const r2 = await supabase.functions.invoke('location-autocomplete', {
    body: { query: 'kom', limit: 10 }
  });
  console.log('Edge fn "kom" data:', r2.data);
  console.log('Edge fn "kom" error:', r2.error);

  // Test 3: Edge function with Madhurawada
  const r3 = await supabase.functions.invoke('location-autocomplete', {
    body: { query: 'madhurawada', limit: 15 }
  });
  console.log('\nEdge fn "madhurawada" results:', r3.data?.map(d => `[${d.entity_type}] ${d.display_name}`));
}

run();
