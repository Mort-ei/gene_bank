
-- Table: Compound
-- Description: Stores compound information with KEGG IDs and chemical formulas.

DROP TABLE IF EXISTS compound;

CREATE TABLE compound (
    compound_id SERIAL PRIMARY KEY,       -- Unique identifier for each compound
    compound_name VARCHAR(255) NOT NULL,  -- Name of the compound (e.g., Glucose)
    kegg_compound_id VARCHAR(20) UNIQUE,  -- KEGG Compound ID (e.g., C00031)
    chemical_formula VARCHAR(100)         -- Chemical formula (e.g., C6H12O6)
);
