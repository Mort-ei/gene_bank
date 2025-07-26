DROP TABLE IF EXISTS ontology;

CREATE TABLE ontology (
    go_id INT PRIMARY KEY,               -- Unique GO identifier
    term VARCHAR(255) NOT NULL,          -- Name of the GO term
    namespace VARCHAR(50) NOT NULL       -- Namespace (e.g., biological_process)
);
