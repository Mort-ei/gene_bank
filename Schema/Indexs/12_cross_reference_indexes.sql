
-- Indexes: Improve cross-reference lookups

CREATE INDEX idx_xref_gene_id ON cross_reference(gene_id);
CREATE INDEX idx_xref_db_id ON cross_reference(external_db, external_id);