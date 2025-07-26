
-- Constraints: Enforcing uniqueness, hierarchy, and data validity

ALTER TABLE gene
ADD CONSTRAINT fk_gene_taxonomy
    FOREIGN KEY (taxonomy_id)
    REFERENCES taxonomy(taxonomy_id)
    ON DELETE CASCADE;

ALTER TABLE gene
ADD CONSTRAINT unique_gene_symbol
    UNIQUE (gene_symbol, taxonomy_id);

ALTER TABLE gene
ADD CONSTRAINT valid_positions
    CHECK (end_position >= start_position);

ALTER TABLE gene
ADD CONSTRAINT valid_strand
    CHECK (strand IN ('F', 'R'));