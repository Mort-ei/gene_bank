
-- Constraints: Ensuring valid identifiers and values

ALTER TABLE publication
ADD CONSTRAINT fk_publication_gene
    FOREIGN KEY (gene_id)
    REFERENCES Gene(gene_id)
    ON DELETE CASCADE;

ALTER TABLE publication
ADD CONSTRAINT has_identifier
    CHECK (pmid IS NOT NULL OR doi IS NOT NULL);

ALTER TABLE publication
ADD CONSTRAINT valid_pmid
    CHECK (pmid IS NULL OR pmid ~ '^(PMID:)?\d{1,8}$');

ALTER TABLE publication
ADD CONSTRAINT valid_doi
    CHECK (doi IS NULL OR doi ~ '^10\.');

ALTER TABLE publication
ADD CONSTRAINT valid_title
    CHECK (LENGTH(TRIM(title)) > 0);

ALTER TABLE publication
ADD CONSTRAINT valid_authors
    CHECK (LENGTH(TRIM(authors)) > 0);
