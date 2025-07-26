
-- Indexes: Ensure uniqueness and fast lookups

CREATE UNIQUE INDEX idx_unique_publication ON publication (
    gene_id,
    COALESCE(pmid, ''),
    COALESCE(doi, ''),
    title
);

CREATE INDEX idx_publication_gene_id ON publication(gene_id);
CREATE INDEX idx_publication_pmid ON publication(pmid);
CREATE INDEX idx_publication_doi ON publication(doi);
