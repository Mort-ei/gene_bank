
-- Constraints: Enforcing valid data and relationships

ALTER TABLE sequence
ADD CONSTRAINT fk_sequence_gene
    FOREIGN KEY (gene_id)
    REFERENCES gene(gene_id)
    ON DELETE CASCADE;

ALTER TABLE sequence
ADD CONSTRAINT unique_accession_number
    UNIQUE (accession_number, version);

ALTER TABLE sequence
ADD CONSTRAINT check_sequence_type
    CHECK (sequence_type IN ('mRNA', 'Protein', 'Genomic DNA', 'cDNA', 'ncRNA'));

ALTER TABLE sequence
ADD CONSTRAINT check_source_database
    CHECK (source_database IN ('NCBI', 'Ensembl', 'UniProt', 'RefSeq'));