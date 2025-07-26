
-- Indexes: For efficient lookups and range queries

CREATE INDEX idx_gene_symbol ON gene(gene_symbol);
CREATE INDEX idx_gene_taxonomy ON gene(taxonomy_id);
CREATE INDEX idx_gene_positions ON gene(start_position, end_position);