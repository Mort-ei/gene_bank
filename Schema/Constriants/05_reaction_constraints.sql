
-- Constraints: Enforcing valid references and IDs

ALTER TABLE reaction
ADD CONSTRAINT fk_reaction_pathway
    FOREIGN KEY (pathway_id)
    REFERENCES pathway(pathway_id)
    ON DELETE CASCADE;

ALTER TABLE reaction
ADD CONSTRAINT valid_reaction_name
    CHECK (LENGTH(reaction_name) > 0);

ALTER TABLE reaction
ADD CONSTRAINT valid_kegg_reaction_id
    CHECK (kegg_reaction_id ~ '^R\d{5}$');
