
-- Table: Gene_Alias
-- Description: Stores alternative symbols/aliases for genes from various sources.

DROP TABLE IF EXISTS gene_alias;

CREATE TABLE gene_alias (
    alias_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,  -- Unique alias ID
    gene_id INT NOT NULL,                                  -- FK to gene table
    alias_symbol VARCHAR(50) NOT NULL,                     -- Alias symbol (e.g., RNF53)
    source VARCHAR(50) NOT NULL,                           -- Alias source (e.g., UniProt)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
