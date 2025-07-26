
-- Constraints: Valid roles and references

ALTER TABLE reaction_compound
ADD CONSTRAINT valid_role
    CHECK (role IN ('substrate', 'product', 'cofactor', 'activator', 'inhibitor'));

ALTER TABLE reaction_compound
ADD CONSTRAINT fk_reactioncompound_reaction
    FOREIGN KEY (reaction_id)
    REFERENCES reaction(reaction_id)
    ON DELETE CASCADE;

ALTER TABLE reaction_compound
ADD CONSTRAINT fk_reactioncompound_compound
    FOREIGN KEY (compound_id)
    REFERENCES compound(compound_id)
    ON DELETE CASCADE;
