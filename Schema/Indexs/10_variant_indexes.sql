
-- Indexes: Improve performance on lookups

CREATE INDEX idx_variant_gene_id ON variant(gene_id);
CREATE INDEX idx_variant_position ON variant(position);
CREATE INDEX idx_variant_clinical_sig ON variant(clinical_significance);
