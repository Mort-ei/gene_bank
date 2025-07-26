
-- Table: Pathway
-- Description: Stores pathway information with KEGG IDs and categories.

DROP TABLE IF EXISTS pathway;

CREATE TABLE pathway (
    pathway_id SERIAL PRIMARY KEY,       -- Unique identifier for each pathway
    pathway_name VARCHAR(255) NOT NULL,  -- Name of the pathway
    kegg_id VARCHAR(20) NOT NULL UNIQUE, -- KEGG pathway ID (e.g., map00010)
    category VARCHAR(100) NOT NULL       -- Pathway category
);
