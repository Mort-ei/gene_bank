
-- Indexes: Improve performance on searches and joins

CREATE INDEX idx_taxonomy_parent ON Taxonomy(parent_taxonomy_id);
CREATE INDEX idx_taxonomy_scientific_name ON Taxonomy(scientific_name);
CREATE INDEX idx_taxonomy_ncbi_id ON Taxonomy(ncbi_tax_id);