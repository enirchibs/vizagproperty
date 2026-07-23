-- ==============================================================================
-- 01. EXTENSIONS, SCHEMAS & ROLES
-- ==============================================================================

-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS postgis;           -- GeoSpatial
CREATE EXTENSION IF NOT EXISTS pg_trgm;           -- Trigram search (fuzzy text)
CREATE EXTENSION IF NOT EXISTS vector;            -- pgvector for AI semantic search
CREATE EXTENSION IF NOT EXISTS unaccent;          -- Remove accents for text search
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;     -- Soundex, Levenshtein
CREATE EXTENSION IF NOT EXISTS btree_gin;         -- GIN indexing for common types
CREATE EXTENSION IF NOT EXISTS btree_gist;        -- GiST indexing for common types
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";       -- UUID generation
CREATE EXTENSION IF NOT EXISTS pgcrypto;          -- Cryptographic functions
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;-- Performance monitoring

-- Create required schemas
CREATE SCHEMA IF NOT EXISTS core;         -- Core application tables
CREATE SCHEMA IF NOT EXISTS geo;          -- Location and spatial hierarchy
CREATE SCHEMA IF NOT EXISTS property;     -- Property listings and details
CREATE SCHEMA IF NOT EXISTS builder;      -- Builder/Developer profiles & projects
CREATE SCHEMA IF NOT EXISTS agent;        -- Agent/Broker profiles
CREATE SCHEMA IF NOT EXISTS crm;          -- Leads, interactions
CREATE SCHEMA IF NOT EXISTS finance;      -- Pricing, history, loans
CREATE SCHEMA IF NOT EXISTS analytics;    -- Page views, statistics, partitioned
CREATE SCHEMA IF NOT EXISTS search;       -- Optimized search tables, cache
CREATE SCHEMA IF NOT EXISTS audit;        -- Trigger-based audit logs
CREATE SCHEMA IF NOT EXISTS notification; -- Alerts, emails, push
CREATE SCHEMA IF NOT EXISTS seo;          -- URL slugs, schema mapping
CREATE SCHEMA IF NOT EXISTS ai;           -- Vector embeddings, ML tags

-- Set default search path
ALTER DATABASE postgres SET search_path TO public, core, geo, property, search, ai, postgis;

-- Define a function to automatically set updated_at
CREATE OR REPLACE FUNCTION core.set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
