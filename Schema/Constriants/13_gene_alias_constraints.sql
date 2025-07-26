
-- Constraints: Enforcing valid references and alias data

ALTER TABLE gene_alias
ADD CONSTRAINT fk_alias_gene
    FOREIGN KEY (gene_id)
    REFERENCES Gene(gene_id)
    ON DELETE CASCADE;

ALTER TABLE gene_alias
ADD CONSTRAINT valid_source
    CHECK (source IN ('HGNC', 'Ensembl', 'NCBI', 'UniProt', 'KEGG', 'Vega', 'Custom', 'Common'));

ALTER TABLE gene_alias
ADD CONSTRAINT valid_alias_symbol
    CHECK (LENGTH(TRIM(alias_symbol)) > 0);

ALTER TABLE gene_alias
ADD CONSTRAINT unique_gene_alias
    UNIQUE (gene_id, alias_symbol, source);
