import{r as o,j as s}from"./index-T6ayOJI4.js";import{g as B,a as E,w as F,M as N,V as z}from"./googleMaps-BYCgxrLQ.js";function R(e){return e>=1e7?`₹${(e/1e7).toFixed(2)} Cr`:e>=1e5?`₹${(e/1e5).toFixed(2)} L`:`₹${e.toLocaleString()}`}function $(e){var a;const c=((a=e.images)==null?void 0:a[0])||"/placeholder-property.jpg",p=e.location||e.city||"Visakhapatnam",w=e.bedrooms&&e.bedrooms>0?`${e.bedrooms} BHK`:"",v=e.area_sqft?`${e.area_sqft.toLocaleString()} sqft`:"",d=[w,v].filter(Boolean).join(" · ");return`
    <div style="
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      width: 280px;
      border-radius: 12px;
      overflow: hidden;
      background: #fff;
    ">
      <div style="position:relative;width:100%;height:150px;overflow:hidden;">
        <img
          src="${c}"
          alt="${e.title.replace(/"/g,"&quot;")}"
          style="width:100%;height:100%;object-fit:cover;"
          onerror="this.src='/placeholder-property.jpg'"
        />
        <div style="
          position:absolute;bottom:8px;left:8px;
          background:rgba(0,0,0,0.6);
          color:#fff;padding:3px 10px;border-radius:20px;
          font-size:13px;font-weight:600;
          backdrop-filter:blur(4px);
        ">
          ${R(e.price)}
        </div>
      </div>

      <div style="padding:12px 14px 14px;">
        <h3 style="
          margin:0 0 6px;font-size:15px;font-weight:700;
          color:#111827;line-height:1.3;
          display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;overflow:hidden;
        ">
          ${e.title}
        </h3>

        <div style="display:flex;align-items:center;gap:4px;margin-bottom:6px;">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#6B7280" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/>
            <circle cx="12" cy="10" r="3"/>
          </svg>
          <span style="font-size:13px;color:#6B7280;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;max-width:230px;">
            ${p}
          </span>
        </div>

        ${d?`
          <div style="font-size:12px;color:#9CA3AF;margin-bottom:10px;">
            ${d}
          </div>
        `:""}

        <a
          href="/property/${e.id}"
          style="
            display:inline-block;
            background:linear-gradient(135deg,#6366F1,#4F46E5);
            color:#fff;padding:7px 16px;border-radius:8px;
            font-size:13px;font-weight:600;text-decoration:none;
            transition:opacity 0.2s;
          "
          onmouseover="this.style.opacity='0.9'"
          onmouseout="this.style.opacity='1'"
        >
          View Details →
        </a>
      </div>
    </div>
  `}function S(e){const c=`
    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="40" viewBox="0 0 28 40">
      <path d="M14 0C6.268 0 0 6.268 0 14c0 10.5 14 26 14 26s14-15.5 14-26C28 6.268 21.732 0 14 0z" fill="${e}"/>
      <circle cx="14" cy="14" r="6" fill="#fff" opacity="0.9"/>
    </svg>`;return{url:"data:image/svg+xml;charset=UTF-8,"+encodeURIComponent(c.trim()),scaledSize:new google.maps.Size(28,40),anchor:new google.maps.Point(14,40)}}function U({properties:e,selectedPropertyId:c,onPropertySelect:p,onPropertyHover:w,className:v="",zoom:d,center:a}){const y=o.useRef(null),j=o.useRef(null),g=o.useRef(new Map),b=o.useRef(null),[x,L]=o.useState(!0),[m,A]=o.useState(null),k=o.useRef(p);k.current=p;const u=o.useRef(w);u.current=w,o.useEffect(()=>{let n=!1;async function i(){try{if(await F(),n||!y.current)return;const r=new google.maps.Map(y.current,{center:a??z,zoom:d??E,styles:N,mapTypeControl:!1,streetViewControl:!1,fullscreenControl:!0,zoomControl:!0,gestureHandling:"cooperative"});j.current=r,b.current=new google.maps.InfoWindow,L(!1)}catch{n||(A("Unable to load Google Maps. Please check your connection and refresh."),L(!1))}}return i(),()=>{n=!0}},[a==null?void 0:a.lat,a==null?void 0:a.lng,d]);const C=o.useCallback(()=>{const n=j.current;if(!n)return;g.current.forEach(t=>{google.maps.event.clearInstanceListeners(t),t.setMap(null)}),g.current.clear();const i=e.filter(t=>t.latitude!=null&&t.longitude!=null&&isFinite(t.latitude)&&isFinite(t.longitude));if(i.length===0)return;const r=new google.maps.LatLngBounds;if(i.forEach(t=>{const h={lat:t.latitude,lng:t.longitude};r.extend(h);const f=new google.maps.Marker({position:h,map:n,title:t.title,icon:S(B(t.property_type)),optimized:!0});f.addListener("click",()=>{var M;const l=b.current;l&&(l.setContent($(t)),l.open(n,f),n.panTo(h),(M=k.current)==null||M.call(k,t.id))}),f.addListener("mouseover",()=>{var l;(l=u.current)==null||l.call(u,t.id),f.setAnimation(google.maps.Animation.BOUNCE)}),f.addListener("mouseout",()=>{var l;(l=u.current)==null||l.call(u,null),f.setAnimation(null)}),g.current.set(t.id,f)}),i.length>1)n.fitBounds(r,{top:50,right:50,bottom:50,left:50});else{const t=r.getCenter();n.setCenter({lat:t.lat(),lng:t.lng()}),n.setZoom(d??E)}},[e,d]);return o.useEffect(()=>{!x&&!m&&C()},[x,m,C]),o.useEffect(()=>{if(!c||x||m)return;const n=g.current.get(c),i=j.current,r=b.current;if(!n||!i||!r)return;const t=e.find(h=>h.id===c);t&&(i.panTo(n.getPosition()),r.setContent($(t)),r.open(i,n))},[c,e,x,m]),o.useEffect(()=>()=>{var n;g.current.forEach(i=>{google.maps.event.clearInstanceListeners(i),i.setMap(null)}),g.current.clear(),(n=b.current)==null||n.close()},[]),m?s.jsxs("div",{className:`flex flex-col items-center justify-center bg-gray-50 rounded-xl border border-gray-200 p-8 text-center ${v}`,style:{minHeight:400},children:[s.jsx("svg",{className:"h-12 w-12 text-gray-400 mb-4",fill:"none",viewBox:"0 0 24 24",stroke:"currentColor",strokeWidth:1.5,children:s.jsx("path",{strokeLinecap:"round",strokeLinejoin:"round",d:"M9 20l-5.447-2.724A2 2 0 013 15.382V5.618a2 2 0 011.106-1.789L9 1m0 0l6 3m-6-3v18m6-15l5.447 2.724A2 2 0 0121 8.618v9.764a2 2 0 01-1.106 1.789L15 23m0-18v18"})}),s.jsx("p",{className:"text-gray-600 font-medium mb-1",children:"Map couldn't be loaded"}),s.jsx("p",{className:"text-gray-400 text-sm",children:m})]}):s.jsxs("div",{className:`relative ${v}`,children:[x&&s.jsx("div",{className:"absolute inset-0 z-10 flex items-center justify-center bg-gray-100 rounded-xl animate-pulse",style:{minHeight:400},children:s.jsxs("div",{className:"flex flex-col items-center gap-3",children:[s.jsx("svg",{className:"h-10 w-10 text-gray-300",fill:"none",viewBox:"0 0 24 24",stroke:"currentColor",strokeWidth:1.5,children:s.jsx("path",{strokeLinecap:"round",strokeLinejoin:"round",d:"M9 20l-5.447-2.724A2 2 0 013 15.382V5.618a2 2 0 011.106-1.789L9 1m0 0l6 3m-6-3v18m6-15l5.447 2.724A2 2 0 0121 8.618v9.764a2 2 0 01-1.106 1.789L15 23m0-18v18"})}),s.jsx("span",{className:"text-gray-400 text-sm font-medium",children:"Loading map…"})]})}),s.jsx("div",{ref:y,className:"w-full rounded-xl",style:{minHeight:400,height:"100%"}})]})}export{U as G};
