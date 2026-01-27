/*
  # Cleanup Remaining Old Policies

  This migration removes old policies that were not caught in the previous cleanup
  to prevent conflicts with the new safe policies.

  ## Policies Removed
  - Old properties table policies (admin/owner variations)
  - Old property_details table policies
*/

-- Drop remaining old policies on properties table
DROP POLICY IF EXISTS "admin delete property" ON properties;
DROP POLICY IF EXISTS "admin edit property" ON properties;
DROP POLICY IF EXISTS "admin insert property" ON properties;
DROP POLICY IF EXISTS "admin select all properties" ON properties;
DROP POLICY IF EXISTS "admin update property" ON properties;
DROP POLICY IF EXISTS "owner delete own" ON properties;
DROP POLICY IF EXISTS "owner insert" ON properties;
DROP POLICY IF EXISTS "owner read own" ON properties;

-- Drop remaining old policies on property_details table
DROP POLICY IF EXISTS "admin manage property details" ON property_details;
DROP POLICY IF EXISTS "public read approved property details" ON property_details;
