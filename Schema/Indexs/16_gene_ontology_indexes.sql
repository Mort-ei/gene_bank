
-- Indexes: Speed up lookups by gene or GO term

CREATE INDEX idx_geneontology_gene_id ON gene_ontology(gene_id);
CREATE INDEX idx_geneontology_go_id ON gene_ontology(go_id);
