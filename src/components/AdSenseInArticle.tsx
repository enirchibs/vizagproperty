import React, { useEffect } from 'react';

interface AdSenseInArticleProps {
  className?: string;
}

export function AdSenseInArticle({ className = '' }: AdSenseInArticleProps) {
  useEffect(() => {
    try {
      // @ts-ignore
      (window.adsbygoogle = window.adsbygoogle || []).push({});
    } catch (err) {
      console.error('AdSense error:', err);
    }
  }, []);

  return (
    <div className={`w-full bg-slate-50 border border-slate-200 rounded-xl my-8 p-4 min-h-[250px] flex flex-col justify-center items-center ${className}`}>
      <div className="text-[10px] uppercase tracking-wider text-slate-400 mb-2 w-full text-center border-b border-slate-200 pb-2">
        Advertisement
      </div>
      
      {/* 
        This is the programmatic placeholder for the actual Google AdSense tag.
        Replace data-ad-client and data-ad-slot with actual IDs when moving to production.
      */}
      <ins className="adsbygoogle w-full"
           style={{ display: 'block', textAlign: 'center' }}
           data-ad-layout="in-article"
           data-ad-format="fluid"
           data-ad-client="ca-pub-XXXXXXXXXXXXXXXX"
           data-ad-slot="2222222222"></ins>
      
      {/* Fallback visual for local development */}
      <div className="w-full h-32 bg-slate-100 rounded animate-pulse flex flex-col items-center justify-center text-xs text-slate-400 mt-2">
        <span>Native In-Article Ad Placement</span>
        <span className="text-[10px] mt-1 text-slate-300">(Optimized for Text Density)</span>
      </div>
    </div>
  );
}
