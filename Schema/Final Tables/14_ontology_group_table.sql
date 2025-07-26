
-- Table: Orthology_Group
-- Description: Stores orthologous groups (KEGG KO numbers) linked to genes.

DROP TABLE IF EXISTS orthology_group;

CREATE TABLE orthology_group (
    ortho_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- Unique orthology group ID
    ko_number VARCHAR(20) NOT NULL,                        -- KO number (e.g., K00001)
    description VARCHAR(255) NOT NULL,                     -- Description of the ortholog group
    gene_id INT NOT NULL,                                  -- FK to gene table
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
