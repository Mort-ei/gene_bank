
-- Indexes: Improve query performance for KEGG and category

CREATE INDEX idx_pathway_keggid ON pathway(kegg_id);
CREATE INDEX idx_pathway_category ON pathway(category);