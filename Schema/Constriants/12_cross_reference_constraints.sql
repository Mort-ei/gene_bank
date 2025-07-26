
-- Constraints: Ensuring data integrity

ALTER TABLE cross_reference
ADD CONSTRAINT fk_xref_gene
    FOREIGN KEY (gene_id)
    REFERENCES Gene(gene_id)
    ON DELETE CASCADE;

ALTER TABLE cross_reference
ADD CONSTRAINT unique_xref_combination
    UNIQUE (gene_id, external_db, external_id);

ALTER TABLE cross_reference
ADD CONSTRAINT valid_external_db
    CHECK (external_db IN (
        'UniProt', 'KEGG', 'NCBI', 'Ensembl', 'HGNC', 'Reactome', 'GO', 'OMIM'
    ));

ALTER TABLE cross_reference
ADD CONSTRAINT valid_external_id
    CHECK (LENGTH(TRIM(external_id)) > 0);
