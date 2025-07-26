
-- Table: Gene_Ontology
-- Description: Maps genes to ontology (GO) terms with evidence codes.

DROP TABLE IF EXISTS gene_ontology;

CREATE TABLE gene_ontology (
    gene_id INT NOT NULL,                -- FK to gene table
    go_id INT NOT NULL,                  -- FK to ontology table
    evidence_code VARCHAR(10),           -- GO evidence code
    PRIMARY KEY (gene_id, go_id)         -- Composite primary key
);
