
-- Indexes: Improve query performance

CREATE INDEX idx_sequence_gene ON sequence(gene_id);
CREATE INDEX idx_accession_number ON sequence(accession_number);