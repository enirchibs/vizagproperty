import Fuse from 'fuse.js';
import { supabase } from './supabase';

export interface Locality {
  id: string;
  name: string;
  slug: string;
}

let cachedLocalities: Locality[] | null = null;
let fuseInstance: Fuse<Locality> | null = null;

export async function initFuzzySearch() {
  if (cachedLocalities && fuseInstance) return fuseInstance;
  
  const { data } = await supabase
    .from('localities')
    .select('id, name, slug')
    .eq('city', 'Visakhapatnam');
    
  if (data) {
    cachedLocalities = data;
    fuseInstance = new Fuse(cachedLocalities, {
      keys: ['name', 'slug'],
      threshold: 0.4, // Allows for typos like "Madurwada" -> "Madhurawada"
      distance: 100,
      ignoreLocation: true,
    });
  }
  return fuseInstance;
}

export async function fuzzySearchLocalities(query: string, limit: number = 10): Promise<Locality[]> {
  if (query.trim() === '') return [];
  
  const fuse = await initFuzzySearch();
  if (!fuse) return [];
  
  const results = fuse.search(query);
  return results.slice(0, limit).map(result => result.item);
}
