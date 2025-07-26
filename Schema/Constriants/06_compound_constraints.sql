
-- Constraints: Enforcing valid KEGG compound ID

ALTER TABLE compound
ADD CONSTRAINT valid_kegg_compound_id
    CHECK (kegg_compound_id ~ '^C\\d{5}$');
