
-- Table: Reaction
-- Description: Stores biochemical reactions linked to pathways.

DROP TABLE IF EXISTS reaction;

CREATE TABLE reaction (
    reaction_id SERIAL PRIMARY KEY,        -- Unique identifier for each reaction
    pathway_id INT NOT NULL,               -- FK to pathway table
    reaction_name VARCHAR(255),            -- Name of the reaction
    kegg_reaction_id VARCHAR(20),          -- KEGG Reaction ID (e.g., R00299)
    equation TEXT NOT NULL                 -- Chemical equation of the reaction
);
