// Vizag Property Experts - Central Contact Configuration
// Configurable via environment variables for easy updates
export const VIZAG_PROPERTY_PHONE = import.meta.env.VITE_PUBLIC_CONTACT_PHONE || "7207550499";
export const VIZAG_PROPERTY_PHONE_WITH_CODE = import.meta.env.VITE_WHATSAPP_BUSINESS_NUMBER || "917207550499";
export const VIZAG_PROPERTY_EMAIL = import.meta.env.VITE_PUBLIC_CONTACT_EMAIL || "admin@vizagproperty.co.in";

// Admin Accounts list with dashboard and property approval access
export const ADMIN_EMAILS = [
  "vsekharsqldba@gmail.com",
  "vsekharsql.dba@gmail.com",
  "vsekharsqldba",
  "sekhar",
  "vsekhar",
  "admin@vizagproperty.co.in",
  "7207550499"
];

export const isAdminEmail = (email?: string | null, name?: string | null, phone?: string | null): boolean => {
  const cleanEmail = (email || '').toLowerCase().replace(/[^a-z0-9]/g, '');
  const cleanName = (name || '').toLowerCase().replace(/[^a-z0-9]/g, '');
  const cleanPhone = (phone || '').replace(/[^0-9]/g, '');

  if (cleanPhone.includes('7207550499')) {
    return true;
  }

  if ((cleanEmail && (cleanEmail.includes('sekhar') || cleanEmail.includes('vsekharsql'))) ||
      (cleanName && (cleanName.includes('sekhar') || cleanName.includes('vsekharsql')))) {
    return true;
  }

  return ADMIN_EMAILS.some(adminEmail => {
    const target = adminEmail.toLowerCase().replace(/[^a-z0-9]/g, '');
    return (cleanEmail && cleanEmail.includes(target)) || 
           (cleanName && cleanName.includes(target)) || 
           (cleanPhone && cleanPhone.includes(target));
  });
};

