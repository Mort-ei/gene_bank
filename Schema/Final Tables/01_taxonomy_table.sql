-- ===============================================
-- Table: Taxonomy
-- Description: Stores hierarchical biological taxonomy data,
--              including scientific and common names, ranks,
--              and references to parent taxa.
-- ===============================================
CREATE TABLE Taxonomy (
    taxonomy_id SERIAL PRIMARY KEY,  -- Unique identifier for each taxonomy entry
    scientific_name VARCHAR(255) NOT NULL,  -- Scientific name (e.g., Homo sapiens)
    common_name VARCHAR(100),  -- Common name (e.g., Human)
    rank VARCHAR(50) NOT NULL,  -- Taxonomic rank (e.g., species, genus)
    ncbi_tax_id INTEGER UNIQUE,  -- NCBI Taxonomy ID (external reference)
    parent_taxonomy_id INTEGER  -- References parent taxonomy
);