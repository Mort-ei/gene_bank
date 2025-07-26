
-- Table: Feature
-- Description: Stores annotated features (e.g., exons, CDS, promoters) for sequences.

DROP TABLE IF EXISTS feature;

CREATE TABLE feature (
    feature_id SERIAL PRIMARY KEY,        -- Unique feature ID
    sequence_id INTEGER NOT NULL,         -- FK to sequence table
    feature_type VARCHAR(50) NOT NULL,    -- Type of feature (exon, CDS, promoter, etc.)
    start_position INTEGER NOT NULL,      -- Start position of feature
    end_position INTEGER NOT NULL,        -- End position of feature
    strand CHAR(1),                       -- Strand direction (F or R)
    notes TEXT                            -- Additional feature description
);
