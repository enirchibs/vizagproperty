/*
  # Add Locality Search Indexes

  1. Performance Indexes
    - `idx_locality_slug` - Fast lookups by slug for URL routing
    - `idx_locality_name_trgm` - Trigram GIN index for fuzzy text search on locality names

  2. Important Notes
    - The trigram index enables fast similarity searches like ILIKE '%query%'
    - Requires pg_trgm extension for fuzzy matching
    - These indexes improve search performance for location autocomplete features
*/

-- Enable pg_trgm extension for trigram matching (if not already enabled)
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Index for fast slug-based lookups (URL routing)
CREATE INDEX IF NOT EXISTS idx_locality_slug ON vizag_localities(locality_slug);

-- Trigram GIN index for fuzzy text search on locality names
CREATE INDEX IF NOT EXISTS idx_locality_name_trgm ON vizag_localities USING gin (locality_name gin_trgm_ops);
