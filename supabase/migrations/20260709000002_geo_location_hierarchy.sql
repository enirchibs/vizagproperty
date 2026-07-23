-- ==============================================================================
-- 02. GEO & LOCATION HIERARCHY
-- ==============================================================================

-- A shared domain for location type to enforce constraints
CREATE TYPE geo.location_level AS ENUM (
  'country', 'state', 'district', 'revenue_division', 'mandal', 'municipality',
  'city', 'town', 'village', 'zone', 'locality', 'sub_locality', 'colony',
  'layout', 'apartment', 'project', 'road', 'street', 'landmark', 'poi'
);

-- -----------------------------------------------------------------------------
-- BASE LOCATION TABLE (Inheritance/Polymorphism approach alternative)
-- We will use a highly normalized hierarchy instead, as requested.
-- -----------------------------------------------------------------------------

CREATE TABLE geo.countries (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    iso2 CHAR(2) UNIQUE NOT NULL,
    translations JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE geo.states (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    country_id UUID NOT NULL REFERENCES geo.countries(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(10) UNIQUE,
    boundaries GEOMETRY(MultiPolygon, 4326),
    translations JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE geo.districts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    state_id UUID NOT NULL REFERENCES geo.states(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    boundaries GEOMETRY(MultiPolygon, 4326),
    translations JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Standardizing Mandals / Revenue Divisions
CREATE TABLE geo.mandals (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    district_id UUID NOT NULL REFERENCES geo.districts(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    boundaries GEOMETRY(MultiPolygon, 4326),
    translations JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE geo.cities (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    district_id UUID NOT NULL REFERENCES geo.districts(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    is_metro BOOLEAN DEFAULT FALSE,
    center_point GEOMETRY(Point, 4326),
    boundaries GEOMETRY(MultiPolygon, 4326),
    translations JSONB DEFAULT '{}'::jsonb,
    aliases TEXT[], -- Array for search keywords
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE geo.zones (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_id UUID NOT NULL REFERENCES geo.cities(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    center_point GEOMETRY(Point, 4326),
    boundaries GEOMETRY(MultiPolygon, 4326),
    translations JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE geo.localities (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_id UUID NOT NULL REFERENCES geo.cities(id) ON DELETE CASCADE,
    zone_id UUID REFERENCES geo.zones(id) ON DELETE SET NULL,
    mandal_id UUID REFERENCES geo.mandals(id) ON DELETE SET NULL,
    name VARCHAR(150) NOT NULL,
    pincode VARCHAR(20),
    center_point GEOMETRY(Point, 4326) NOT NULL,
    boundaries GEOMETRY(MultiPolygon, 4326),
    translations JSONB DEFAULT '{}'::jsonb,
    aliases TEXT[],
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE geo.sub_localities (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    locality_id UUID NOT NULL REFERENCES geo.localities(id) ON DELETE CASCADE,
    name VARCHAR(150) NOT NULL,
    center_point GEOMETRY(Point, 4326),
    boundaries GEOMETRY(Polygon, 4326),
    translations JSONB DEFAULT '{}'::jsonb,
    aliases TEXT[],
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE geo.layouts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    locality_id UUID NOT NULL REFERENCES geo.localities(id) ON DELETE CASCADE,
    sub_locality_id UUID REFERENCES geo.sub_localities(id) ON DELETE CASCADE,
    name VARCHAR(150) NOT NULL,
    approved_by VARCHAR(50), -- VMRDA, VUDA, etc.
    lp_number VARCHAR(100),
    center_point GEOMETRY(Point, 4326),
    boundaries GEOMETRY(Polygon, 4326),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE geo.poi (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    locality_id UUID NOT NULL REFERENCES geo.localities(id) ON DELETE CASCADE,
    name VARCHAR(200) NOT NULL,
    poi_type VARCHAR(50) NOT NULL, -- 'Hospital', 'School', 'Metro Station'
    center_point GEOMETRY(Point, 4326) NOT NULL,
    translations JSONB DEFAULT '{}'::jsonb,
    aliases TEXT[],
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- -----------------------------------------------------------------------------
-- SPATIAL AND SEARCH INDEXES
-- -----------------------------------------------------------------------------

-- GiST Indexes for PostGIS Spatial Searching
CREATE INDEX idx_cities_geom ON geo.cities USING GIST (center_point);
CREATE INDEX idx_cities_boundaries ON geo.cities USING GIST (boundaries);
CREATE INDEX idx_localities_geom ON geo.localities USING GIST (center_point);
CREATE INDEX idx_localities_boundaries ON geo.localities USING GIST (boundaries);
CREATE INDEX idx_sub_localities_geom ON geo.sub_localities USING GIST (center_point);
CREATE INDEX idx_poi_geom ON geo.poi USING GIST (center_point);

-- Trigram Indexes for Fast Text/Typo Searches on Names and Aliases
CREATE INDEX idx_cities_name_trgm ON geo.cities USING GIN (name gin_trgm_ops);
CREATE INDEX idx_cities_aliases ON geo.cities USING GIN (aliases);
CREATE INDEX idx_localities_name_trgm ON geo.localities USING GIN (name gin_trgm_ops);
CREATE INDEX idx_localities_aliases ON geo.localities USING GIN (aliases);
CREATE INDEX idx_sub_localities_name_trgm ON geo.sub_localities USING GIN (name gin_trgm_ops);
CREATE INDEX idx_poi_name_trgm ON geo.poi USING GIN (name gin_trgm_ops);

-- Triggers for updated_at
CREATE TRIGGER set_updated_at_localities BEFORE UPDATE ON geo.localities FOR EACH ROW EXECUTE FUNCTION core.set_updated_at();
CREATE TRIGGER set_updated_at_cities BEFORE UPDATE ON geo.cities FOR EACH ROW EXECUTE FUNCTION core.set_updated_at();
