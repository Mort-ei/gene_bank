
-- Table: Gene_Pathway
-- Description: Maps genes to pathways with evidence codes and roles.

DROP TABLE IF EXISTS gene_pathway;

CREATE TABLE gene_pathway (
    gene_id INT NOT NULL,                      -- FK to gene table
    pathway_id INT NOT NULL,                   -- FK to pathway table
    evidence_code VARCHAR(20),                 -- Evidence code (EXP, TAS, etc.)
    last_updated DATE DEFAULT CURRENT_DATE,    -- Last update date
    role VARCHAR(50) DEFAULT 'Not Defined',    -- Role of the gene in the pathway
    PRIMARY KEY (gene_id, pathway_id)          -- Composite primary key
);
