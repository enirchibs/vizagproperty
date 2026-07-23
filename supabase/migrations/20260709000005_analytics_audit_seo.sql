-- ==============================================================================
-- 05. ANALYTICS, AUDIT & SEO
-- ==============================================================================

-- -----------------------------------------------------------------------------
-- ANALYTICS (Partitioned by Date)
-- -----------------------------------------------------------------------------
CREATE TABLE analytics.property_views (
    id UUID NOT NULL DEFAULT uuid_generate_v4(),
    property_id UUID NOT NULL,
    user_id UUID, -- Nullable for anonymous views
    session_id VARCHAR(100),
    ip_address INET,
    user_agent TEXT,
    viewed_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
) PARTITION BY RANGE (viewed_at);

-- Create a partition for the current month
CREATE TABLE analytics.property_views_y2026m07 PARTITION OF analytics.property_views FOR VALUES FROM ('2026-07-01') TO ('2026-08-01');

-- Materialized View for Fast Property View Counts
CREATE MATERIALIZED VIEW analytics.property_view_stats AS
SELECT 
    property_id,
    COUNT(*) as total_views,
    COUNT(DISTINCT session_id) as unique_views
FROM analytics.property_views
GROUP BY property_id;

CREATE UNIQUE INDEX idx_property_view_stats ON analytics.property_view_stats(property_id);

-- -----------------------------------------------------------------------------
-- AUDIT SYSTEM
-- -----------------------------------------------------------------------------
CREATE TYPE audit.action_type AS ENUM ('INSERT', 'UPDATE', 'DELETE');

CREATE TABLE audit.record_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    table_name VARCHAR(100) NOT NULL,
    record_id UUID NOT NULL,
    action audit.action_type NOT NULL,
    old_data JSONB,
    new_data JSONB,
    changed_by UUID, -- user who made the change
    changed_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_audit_table_record ON audit.record_history(table_name, record_id);

-- Generic Audit Trigger Function
CREATE OR REPLACE FUNCTION audit.log_record_change()
RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO audit.record_history (table_name, record_id, action, old_data, changed_by)
        VALUES (TG_TABLE_NAME, OLD.id, 'DELETE', row_to_json(OLD)::jsonb, auth.uid());
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO audit.record_history (table_name, record_id, action, old_data, new_data, changed_by)
        VALUES (TG_TABLE_NAME, NEW.id, 'UPDATE', row_to_json(OLD)::jsonb, row_to_json(NEW)::jsonb, auth.uid());
        RETURN NEW;
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO audit.record_history (table_name, record_id, action, new_data, changed_by)
        VALUES (TG_TABLE_NAME, NEW.id, 'INSERT', row_to_json(NEW)::jsonb, auth.uid());
        RETURN NEW;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- -----------------------------------------------------------------------------
-- SEO METADATA
-- -----------------------------------------------------------------------------
CREATE TABLE seo.url_metadata (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(50) NOT NULL, -- 'property', 'locality', 'city'
    entity_id UUID NOT NULL,
    
    canonical_url TEXT NOT NULL,
    meta_title VARCHAR(255),
    meta_description TEXT,
    meta_keywords TEXT,
    
    schema_markup JSONB, -- JSON-LD Schema.org representation
    
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE UNIQUE INDEX idx_seo_entity ON seo.url_metadata(entity_type, entity_id);
CREATE UNIQUE INDEX idx_seo_canonical ON seo.url_metadata(canonical_url);
