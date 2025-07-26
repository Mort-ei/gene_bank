
-- Indexes: For KO number and gene lookups

CREATE INDEX idx_orthology_gene_id ON orthology_group(gene_id);
CREATE INDEX idx_orthology_ko_number ON orthology_group(ko_number);
