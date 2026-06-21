// React is not needed

export function AdSenseStickySidebar() {
  return (
    <div className="sticky top-24 w-full min-h-[600px] bg-gray-50 rounded-xl overflow-hidden border border-gray-200">
      <div className="text-gray-400 text-xs text-center py-2 bg-gray-100 border-b border-gray-200 uppercase tracking-widest">Advertisement</div>
      <div className="p-4 flex justify-center items-center h-full">
        <ins className="adsbygoogle"
             style={{ display: 'inline-block', width: '300px', height: '600px' }}
             data-ad-client="ca-pub-XXXXXXXXXXXXXXXX"
             data-ad-slot="XXXXXXX"></ins>
        <script>
          {`(adsbygoogle = window.adsbygoogle || []).push({});`}
        </script>
      </div>
    </div>
  );
}
