-- Indexes for better lookup performance
CREATE INDEX idx_ontology_term ON ontology(term);
CREATE INDEX idx_ontology_namespace ON ontology(namespace);
