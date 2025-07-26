
-- Table: Cross_Reference
-- Description: Stores external database references for genes.

DROP TABLE IF EXISTS cross_reference;

CREATE TABLE cross_reference (
    xref_id SERIAL PRIMARY KEY,                 -- Unique cross-reference ID
    gene_id INT NOT NULL,                       -- FK to gene table
    external_db VARCHAR(50) NOT NULL,           -- External database name
    external_id VARCHAR(50) NOT NULL,           -- External ID (e.g., UniProt ID)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
