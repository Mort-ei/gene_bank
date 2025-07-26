
-- Indexes: Improve lookups for gene aliases

CREATE INDEX idx_alias_gene_id ON gene_alias(gene_id);
CREATE INDEX idx_alias_symbol ON gene_alias(alias_symbol);
CREATE INDEX idx_alias_source ON gene_alias(source);
