
-- Indexes: For efficient lookups by gene or pathway

CREATE INDEX idx_genepathway_gene ON gene_pathway(gene_id);
CREATE INDEX idx_genepathway_pathway ON gene_pathway(pathway_id);
