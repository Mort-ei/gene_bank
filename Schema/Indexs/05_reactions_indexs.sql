
-- Indexes: Improve query performance

CREATE INDEX idx_reaction_pathway ON reaction(pathway_id);
CREATE INDEX idx_kegg_reaction_id ON reaction(kegg_reaction_id);
