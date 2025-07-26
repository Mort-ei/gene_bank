
-- Table: Reaction_Compound

DROP TABLE IF EXISTS reaction_compound;

CREATE TABLE reaction_compound (
    reaction_id INTEGER NOT NULL,               -- FK to reaction table
    compound_id INTEGER NOT NULL,               -- FK to compound table
    role VARCHAR(20) NOT NULL,                  -- Role of compound (substrate, product, etc.)
    stoichiometry INTEGER DEFAULT 1,            -- Stoichiometric coefficient
    PRIMARY KEY (reaction_id, compound_id, role) -- Composite PK
);
