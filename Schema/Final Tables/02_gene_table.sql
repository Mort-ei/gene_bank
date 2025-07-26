
-- Table: Gene
-- Description: Stores gene information including
--              gene symbols, sequences, and genomic positions.

DROP TABLE IF EXISTS gene;

CREATE TABLE gene (
    gene_id SERIAL PRIMARY KEY,       -- Unique identifier for each gene
    taxonomy_id INTEGER NOT NULL,     -- FK to taxonomy table
    gene_symbol VARCHAR(50) NOT NULL, -- Gene symbol (e.g., BRCA1)
    gene_name VARCHAR(255) NOT NULL,  -- Full gene name
    gene_sequence TEXT,               -- Nucleotide sequence
    start_position INTEGER,           -- Start position on genome
    end_position INTEGER,             -- End position on genome
    strand CHAR(1)                    -- Strand direction: F=Forward, R=Reverse
);