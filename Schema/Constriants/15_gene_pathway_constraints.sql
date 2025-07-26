
-- Constraints: Enforcing valid references and evidence codes

ALTER TABLE gene_pathway
ADD CONSTRAINT valid_evidence_code
    CHECK (evidence_code IN (
        'EXP', 'IDA', 'IPI', 'IMP', 'IGI', 'IEP', 'TAS', 'IC', 'HTP'
    ));

ALTER TABLE gene_pathway
ADD CONSTRAINT fk_genepathways_gene
    FOREIGN KEY (gene_id)
    REFERENCES gene(gene_id)
    ON DELETE CASCADE;

ALTER TABLE gene_pathway
ADD CONSTRAINT fk_genepathway_pathway
    FOREIGN KEY (pathway_id)
    REFERENCES pathway(pathway_id)
    ON DELETE CASCADE;
