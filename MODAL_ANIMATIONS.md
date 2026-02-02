# Modal Slide-Up Animation

## Overview

All modals now feature a premium mobile-first UX with slide-up animations on mobile devices and centered fade-in animations on desktop.

## Implementation

### CSS Animation

Added in `src/index.css`:

```css
@keyframes slideUpMobile {
  from {
    transform: translateY(100%);
  }
  to {
    transform: translateY(0);
  }
}

.animate-slideUpMobile {
  animation: slideUpMobile 0.3s ease-out;
}
```

### Modal Structure

All modals follow this responsive pattern:

```tsx
<div className="fixed inset-0 bg-black/50 flex items-end md:items-center justify-center z-50 md:p-4 animate-fadeIn">
  <div className="bg-white rounded-t-2xl md:rounded-2xl max-w-md w-full p-6 animate-slideUpMobile md:animate-slide-up max-h-[95vh] overflow-y-auto">
    {/* Modal content */}
  </div>
</div>
```

### Key Features

1. **Mobile (< 768px)**:
   - Modal slides up from bottom (`items-end`)
   - Rounded top corners only (`rounded-t-2xl`)
   - Full width (`w-full`)
   - No padding on container (edge-to-edge)
   - Slide-up animation (`animate-slideUpMobile`)
   - Max height 95vh with scroll

2. **Desktop (≥ 768px)**:
   - Modal appears centered (`md:items-center`)
   - Fully rounded corners (`md:rounded-2xl`)
   - Max width constraint
   - Container padding (`md:p-4`)
   - Subtle slide-up animation (`md:animate-slide-up`)
   - Max height 90vh with scroll

3. **Background**:
   - Fade-in animation (`animate-fadeIn`)
   - Semi-transparent overlay (`bg-black/50`)

## Updated Modals

The following modals have been updated with the slide-up animation and backdrop close:

1. **AuthModal** - Login/signup modal with phone/email/Google auth
2. **PostPropertyModal** - Property listing form
3. **UsernameModal** - Username selection prompt
4. **WhatsAppZeroResultsModal** - Zero results WhatsApp prompt
5. **MyListingsPage** - Delete confirmation modal
6. **AdminPropertiesPage** - Approve/Reject property modal

## Backdrop Close

All modals support backdrop close - clicking outside the modal will close it. This is implemented using:

```tsx
// Backdrop div handles clicks to close
<div onClick={onClose} className="...backdrop...">
  {/* Modal content stops propagation to prevent closing when clicking inside */}
  <div onClick={(e) => e.stopPropagation()} className="...modal...">
    {/* Content */}
  </div>
</div>
```

This provides the expected mobile behavior where users can dismiss modals by tapping outside.

## Usage

When creating new modals, use this pattern:

```tsx
export function MyModal({ onClose }: { onClose: () => void }) {
  return (
    <div
      onClick={onClose}
      className="fixed inset-0 bg-black/50 flex items-end md:items-center justify-center z-50 md:p-4 animate-fadeIn"
    >
      <div
        onClick={(e) => e.stopPropagation()}
        className="bg-white rounded-t-2xl md:rounded-2xl max-w-md w-full p-6 animate-slideUpMobile md:animate-slide-up max-h-[95vh] overflow-y-auto"
      >
        {/* Your content here */}
      </div>
    </div>
  )
}
```

## Benefits

- Modern, app-like feel on mobile devices
- Better reachability on mobile (bottom-aligned)
- Smooth, professional animations
- Consistent UX across all modals
- Responsive and accessible
- Prevents content overflow with scroll
- Backdrop close for easy dismissal
- Expected mobile behavior (tap outside to close)
