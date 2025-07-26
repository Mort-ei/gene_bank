
-- Table: Publication
-- Description: Stores references (PMID/DOI) related to genes.

DROP TABLE IF EXISTS publication;

CREATE TABLE publication (
    publication_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- Unique publication ID
    gene_id INT NOT NULL,                                        -- FK to gene table
    pmid VARCHAR(20),                                            -- PubMed ID
    doi VARCHAR(100),                                            -- DOI
    title TEXT NOT NULL,                                         -- Publication title
    authors TEXT NOT NULL,                                       -- Author list
    publication_date DATE NOT NULL,                              -- Publication date
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
