
-- Table: Variant
-- Description: Stores genetic variants with their positions, types, and clinical significance.

DROP TABLE IF EXISTS variant;

CREATE TABLE variant (
    variant_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- Unique identifier
    gene_id INT NOT NULL,                                   -- FK to gene table
    position INT NOT NULL,                                  -- Genomic position
    variant_type VARCHAR(50) NOT NULL,                      -- Type (SNP, Insertion, etc.)
    reference_allele VARCHAR(10) NOT NULL,                  -- Reference allele
    alternate_allele VARCHAR(10) NOT NULL,                  -- Alternate allele
    clinical_significance VARCHAR(100),                     -- Clinical significance annotation
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,  -- Creation timestamp
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP -- Last updated timestamp
);
