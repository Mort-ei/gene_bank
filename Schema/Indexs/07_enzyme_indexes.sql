
-- Indexes: Improve lookups by gene_id and EC number

CREATE INDEX idx_enzyme_gene_id ON Enzyme(gene_id);
CREATE INDEX idx_enzyme_ec_number ON Enzyme(ec_number);
