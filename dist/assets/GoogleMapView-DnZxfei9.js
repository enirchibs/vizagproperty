import{c as E,b as _,r as l,j as t,i as B,l as z,P,f as S,h as q,G as R,s as $,o as V}from"./index-DS4bWKPZ.js";import{C as I}from"./check-circle-02uCHNiW.js";import{g as T,a as F,w as W,M as D,V as G}from"./googleMaps-BYCgxrLQ.js";/**
 * @license lucide-react v0.303.0 - ISC
 *
 * This source code is licensed under the ISC license.
 * See the LICENSE file in the root directory of this source tree.
 */const U=E("BedDouble",[["path",{d:"M2 20v-8a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v8",key:"1k78r4"}],["path",{d:"M4 10V6a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v4",key:"fb3tl2"}],["path",{d:"M12 4v6",key:"1dcgq2"}],["path",{d:"M2 18h20",key:"ajqnye"}]]);function J({property:e}){var x;const{user:o}=_(),[u,h]=l.useState(!1),[b,d]=l.useState(!1),r=((x=e.images)==null?void 0:x[0])||"/placeholder-property.jpg",w=i=>i>=1e7?`₹${(i/1e7).toFixed(2)} Cr`:i>=1e5?`₹${(i/1e5).toFixed(2)} L`:`₹${i.toLocaleString()}`,y=async i=>{if(i.preventDefault(),i.stopPropagation(),!o){window.location.href="/?login=true";return}d(!0);try{if(u){const{error:n}=await $.from("favorites").delete().eq("user_id",o.id).eq("property_id",e.id);if(n)throw n;h(!1)}else{const{error:n}=await $.from("favorites").insert({user_id:o.id,property_id:e.id});if(n)throw n;h(!0)}}catch{}finally{d(!1)}},m=i=>{i.preventDefault(),i.stopPropagation(),window.location.href=`tel:${e.agent_phone}`},j=i=>{i.preventDefault(),i.stopPropagation();const n=`Hi, I'm interested in your property: ${e.title} - ${w(e.price)}`,C=e.agent_whatsapp||e.agent_phone;V(n,C)};return t.jsxs("a",{href:`/property/${e.id}`,className:"group bg-white rounded-xl shadow-md hover:shadow-xl transition-all overflow-hidden border border-gray-200 hover:border-primary-500 flex flex-col",children:[t.jsxs("div",{className:"relative aspect-[4/3] overflow-hidden",children:[t.jsx("img",{src:r,alt:e.title,className:"w-full h-full object-cover group-hover:scale-110 transition-transform duration-300",loading:"lazy"}),t.jsxs("div",{className:"absolute top-3 left-3 flex flex-col gap-2",children:[e.featured&&t.jsxs("span",{className:"bg-gradient-to-r from-yellow-500 to-orange-500 text-white px-3 py-1 rounded-full text-xs font-bold flex items-center gap-1 shadow-lg",children:[t.jsx(B,{className:"h-3 w-3 fill-current"}),"Featured"]}),e.verified&&t.jsxs("span",{className:"bg-gradient-to-r from-green-500 to-emerald-500 text-white px-3 py-1 rounded-full text-xs font-bold flex items-center gap-1 shadow-lg",children:[t.jsx(I,{className:"h-3 w-3 fill-current"}),"Verified"]})]}),o&&t.jsx("button",{onClick:y,disabled:b,className:"absolute top-3 right-3 p-2 bg-white/90 backdrop-blur-sm rounded-full hover:bg-white transition-all shadow-lg","aria-label":u?"Remove from favorites":"Add to favorites",children:t.jsx(z,{className:`h-5 w-5 transition-all ${u?"fill-red-500 text-red-500":"text-gray-600"}`})}),t.jsxs("div",{className:"absolute bottom-3 left-3 right-3 flex gap-2",children:[t.jsxs("button",{onClick:m,className:"flex-1 bg-white/95 backdrop-blur-sm text-gray-900 px-3 py-2 rounded-lg font-semibold text-sm hover:bg-white transition-all shadow-lg flex items-center justify-center gap-1.5",children:[t.jsx(P,{className:"h-4 w-4"}),"Call"]}),t.jsxs("button",{onClick:j,className:"flex-1 bg-green-600 text-white px-3 py-2 rounded-lg font-semibold text-sm hover:bg-green-700 transition-all shadow-lg flex items-center justify-center gap-1.5",children:[t.jsx(S,{className:"h-4 w-4"}),"WhatsApp"]})]})]}),t.jsxs("div",{className:"p-4 flex flex-col flex-1",children:[t.jsx("div",{className:"flex items-start justify-between mb-2",children:t.jsx("h3",{className:"font-bold text-lg text-gray-900 line-clamp-2 flex-1",children:e.title})}),t.jsxs("div",{className:"flex items-center text-gray-600 text-sm mb-3",children:[t.jsx(q,{className:"h-4 w-4 mr-1 flex-shrink-0"}),t.jsx("span",{className:"line-clamp-1",children:e.location||"Visakhapatnam"})]}),t.jsxs("div",{className:"flex items-center gap-4 text-sm text-gray-600 mb-3",children:[e.bedrooms&&e.bedrooms>0&&t.jsxs("div",{className:"flex items-center gap-1",children:[t.jsx(U,{className:"h-4 w-4"}),t.jsxs("span",{children:[e.bedrooms," BHK"]})]}),e.area_sqft&&t.jsxs("div",{className:"flex items-center gap-1",children:[t.jsx(R,{className:"h-4 w-4"}),t.jsxs("span",{children:[e.area_sqft.toLocaleString()," sqft"]})]})]}),t.jsx("div",{className:"mt-auto pt-3 border-t border-gray-100",children:t.jsx("div",{className:"flex items-center justify-between",children:t.jsxs("div",{children:[t.jsx("div",{className:"text-2xl font-bold text-primary-600",children:w(e.price)}),t.jsx("div",{className:"text-xs text-gray-500 capitalize",children:e.listing_type})]})})}),t.jsx("div",{className:"mt-3 text-xs text-gray-500 border-t border-gray-100 pt-3",children:"* Prices and availability are subject to change. Please verify details with the agent."})]})]})}function H(e){return e>=1e7?`₹${(e/1e7).toFixed(2)} Cr`:e>=1e5?`₹${(e/1e5).toFixed(2)} L`:`₹${e.toLocaleString()}`}function A(e){var r;const o=((r=e.images)==null?void 0:r[0])||"/placeholder-property.jpg",u=e.location||e.city||"Visakhapatnam",h=e.bedrooms&&e.bedrooms>0?`${e.bedrooms} BHK`:"",b=e.area_sqft?`${e.area_sqft.toLocaleString()} sqft`:"",d=[h,b].filter(Boolean).join(" · ");return`
    <div style="
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      width: 280px;
      border-radius: 12px;
      overflow: hidden;
      background: #fff;
    ">
      <div style="position:relative;width:100%;height:150px;overflow:hidden;">
        <img
          src="${o}"
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
          ${H(e.price)}
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
            ${u}
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
  `}function O(e){const o=`
    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="40" viewBox="0 0 28 40">
      <path d="M14 0C6.268 0 0 6.268 0 14c0 10.5 14 26 14 26s14-15.5 14-26C28 6.268 21.732 0 14 0z" fill="${e}"/>
      <circle cx="14" cy="14" r="6" fill="#fff" opacity="0.9"/>
    </svg>`;return{url:"data:image/svg+xml;charset=UTF-8,"+encodeURIComponent(o.trim()),scaledSize:new google.maps.Size(28,40),anchor:new google.maps.Point(14,40)}}function Q({properties:e,selectedPropertyId:o,onPropertySelect:u,onPropertyHover:h,className:b="",zoom:d,center:r}){const w=l.useRef(null),y=l.useRef(null),m=l.useRef(new Map),j=l.useRef(null),[x,i]=l.useState(!0),[n,C]=l.useState(null),N=l.useRef(u);N.current=u;const p=l.useRef(h);p.current=h,l.useEffect(()=>{let a=!1;async function c(){try{if(await W(),a||!w.current)return;const f=new google.maps.Map(w.current,{center:r??G,zoom:d??F,styles:D,mapTypeControl:!1,streetViewControl:!1,fullscreenControl:!0,zoomControl:!0,gestureHandling:"cooperative"});y.current=f,j.current=new google.maps.InfoWindow,i(!1)}catch{a||(C("Unable to load Google Maps. Please check your connection and refresh."),i(!1))}}return c(),()=>{a=!0}},[r==null?void 0:r.lat,r==null?void 0:r.lng,d]);const M=l.useCallback(()=>{const a=y.current;if(!a)return;m.current.forEach(s=>{google.maps.event.clearInstanceListeners(s),s.setMap(null)}),m.current.clear();const c=e.filter(s=>s.latitude!=null&&s.longitude!=null&&isFinite(s.latitude)&&isFinite(s.longitude));if(c.length===0)return;const f=new google.maps.LatLngBounds;if(c.forEach(s=>{const k={lat:s.latitude,lng:s.longitude};f.extend(k);const v=new google.maps.Marker({position:k,map:a,title:s.title,icon:O(T(s.property_type)),optimized:!0});v.addListener("click",()=>{var L;const g=j.current;g&&(g.setContent(A(s)),g.open(a,v),a.panTo(k),(L=N.current)==null||L.call(N,s.id))}),v.addListener("mouseover",()=>{var g;(g=p.current)==null||g.call(p,s.id),v.setAnimation(google.maps.Animation.BOUNCE)}),v.addListener("mouseout",()=>{var g;(g=p.current)==null||g.call(p,null),v.setAnimation(null)}),m.current.set(s.id,v)}),c.length>1)a.fitBounds(f,{top:50,right:50,bottom:50,left:50});else{const s=f.getCenter();a.setCenter({lat:s.lat(),lng:s.lng()}),a.setZoom(d??F)}},[e,d]);return l.useEffect(()=>{!x&&!n&&M()},[x,n,M]),l.useEffect(()=>{if(!o||x||n)return;const a=m.current.get(o),c=y.current,f=j.current;if(!a||!c||!f)return;const s=e.find(k=>k.id===o);s&&(c.panTo(a.getPosition()),f.setContent(A(s)),f.open(c,a))},[o,e,x,n]),l.useEffect(()=>()=>{var a;m.current.forEach(c=>{google.maps.event.clearInstanceListeners(c),c.setMap(null)}),m.current.clear(),(a=j.current)==null||a.close()},[]),n?t.jsxs("div",{className:`flex flex-col items-center justify-center bg-gray-50 rounded-xl border border-gray-200 p-8 text-center ${b}`,style:{minHeight:400},children:[t.jsx("svg",{className:"h-12 w-12 text-gray-400 mb-4",fill:"none",viewBox:"0 0 24 24",stroke:"currentColor",strokeWidth:1.5,children:t.jsx("path",{strokeLinecap:"round",strokeLinejoin:"round",d:"M9 20l-5.447-2.724A2 2 0 013 15.382V5.618a2 2 0 011.106-1.789L9 1m0 0l6 3m-6-3v18m6-15l5.447 2.724A2 2 0 0121 8.618v9.764a2 2 0 01-1.106 1.789L15 23m0-18v18"})}),t.jsx("p",{className:"text-gray-600 font-medium mb-1",children:"Map couldn't be loaded"}),t.jsx("p",{className:"text-gray-400 text-sm",children:n})]}):t.jsxs("div",{className:`relative ${b}`,children:[x&&t.jsx("div",{className:"absolute inset-0 z-10 flex items-center justify-center bg-gray-100 rounded-xl animate-pulse",style:{minHeight:400},children:t.jsxs("div",{className:"flex flex-col items-center gap-3",children:[t.jsx("svg",{className:"h-10 w-10 text-gray-300",fill:"none",viewBox:"0 0 24 24",stroke:"currentColor",strokeWidth:1.5,children:t.jsx("path",{strokeLinecap:"round",strokeLinejoin:"round",d:"M9 20l-5.447-2.724A2 2 0 013 15.382V5.618a2 2 0 011.106-1.789L9 1m0 0l6 3m-6-3v18m6-15l5.447 2.724A2 2 0 0121 8.618v9.764a2 2 0 01-1.106 1.789L15 23m0-18v18"})}),t.jsx("span",{className:"text-gray-400 text-sm font-medium",children:"Loading map…"})]})}),t.jsx("div",{ref:w,className:"w-full rounded-xl",style:{minHeight:400,height:"100%"}})]})}export{Q as G,J as P};
