/*
  # Add Public Read Access for Active Vizag Properties

  1. Security Changes
    - Add RLS policy for public read access to properties in active Vizag localities
    - Only properties with locality_slug matching active vizag_localities are readable
    - Read-only access (SELECT only)

  2. Important Notes
    - Policy filters properties by active localities only (is_active = true)
    - No authentication required for read access
    - Write operations still require separate policies/authentication
*/

-- Create policy for public read access to properties in active Vizag localities
CREATE POLICY "public_read_vizag_properties"
  ON properties 
  FOR SELECT
  USING (
    locality_slug IN (
      SELECT locality_slug 
      FROM vizag_localities 
      WHERE is_active = true
    )
  );
