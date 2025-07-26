
-- Constraints: Valid evidence codes and FK references

ALTER TABLE gene_ontology
ADD CONSTRAINT valid_evidence_code_geneontology
    CHECK (evidence_code IN (
        'EXP', 'IEA', 'IDA', 'IPI', 'IMP', 'IGI', 'IEP', 'TAS', 'NAS', 'IC', 'ND'
    ));

ALTER TABLE gene_ontology
ADD CONSTRAINT fk_geneontology_gene
    FOREIGN KEY (gene_id)
    REFERENCES gene(gene_id)
    ON DELETE CASCADE;

ALTER TABLE gene_ontology
ADD CONSTRAINT fk_geneontology_goid
    FOREIGN KEY (go_id)
    REFERENCES ontology(go_id)
    ON DELETE CASCADE;
