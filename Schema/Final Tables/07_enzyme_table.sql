
-- Table: Enzyme
-- Description: Stores enzyme information, EC numbers, and associated genes.

DROP TABLE IF EXISTS Enzyme;

CREATE TABLE Enzyme (
    enzyme_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- Unique identifier
    ec_number VARCHAR(15) NOT NULL,                         -- Enzyme Commission (EC) number
    enzyme_name VARCHAR(255) NOT NULL,                      -- Name of the enzyme
    gene_id INT,                                            -- FK to gene table
    is_active BOOLEAN DEFAULT TRUE,                         -- Active state of the enzyme
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP, -- Creation timestamp
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP -- Last updated timestamp
);
