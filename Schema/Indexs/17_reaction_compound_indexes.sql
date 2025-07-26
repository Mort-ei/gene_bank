
-- Indexes: Improve performance for compound-role lookups

CREATE INDEX idx_reaction_compound_comp ON reaction_compound(compound_id);
CREATE INDEX idx_reaction_compound_role ON reaction_compound(role);
