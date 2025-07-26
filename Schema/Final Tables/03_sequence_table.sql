
-- Table: Sequence
-- Description: Stores sequences related to genes,
--              including mRNA, protein, genomic DNA, etc.

DROP TABLE IF EXISTS sequence;

CREATE TABLE sequence (
    sequence_id SERIAL PRIMARY KEY,     -- Unique identifier for each sequence
    gene_id INTEGER NOT NULL,           -- FK to gene table
    sequence_type VARCHAR(20) NOT NULL, -- Type of sequence (e.g., mRNA, Protein)
    accession_number VARCHAR(20) NOT NULL, -- Unique accession number
    version INTEGER NOT NULL,           -- Version number of the sequence
    sequence_data TEXT,                 -- Nucleotide or protein sequence
    source_database VARCHAR(50) NOT NULL -- Source (e.g., NCBI, UniProt)
);
