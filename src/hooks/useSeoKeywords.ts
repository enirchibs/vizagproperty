import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';

export interface DBKeywordRule {
  keyword: string;
  target_url: string;
}

// Memory cache to prevent redundant database hits during a single SPA session
let memoryCache: DBKeywordRule[] | null = null;

export function useSeoKeywords() {
  const [keywords, setKeywords] = useState<DBKeywordRule[]>(memoryCache || []);
  const [loading, setLoading] = useState<boolean>(!memoryCache);

  useEffect(() => {
    async function fetchKeywords() {
      if (memoryCache) {
        setKeywords(memoryCache);
        setLoading(false);
        return;
      }

      try {
        const { data, error } = await supabase
          .from('seo_keywords')
          .select('keyword, target_url');

        if (error) {
          console.error('Error fetching SEO keywords:', error);
          return;
        }

        if (data) {
          memoryCache = data;
          setKeywords(data);
        }
      } catch (err) {
        console.error('Failed to fetch SEO keywords', err);
      } finally {
        setLoading(false);
      }
    }

    fetchKeywords();
  }, []);

  return { keywords, loading };
}
