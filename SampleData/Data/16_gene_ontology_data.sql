
-- Sample Data Inserts: Gene-to-GO term associations

INSERT INTO gene_ontology (gene_id, go_id, evidence_code)
VALUES
    (1, 1, 'EXP'),  -- BRCA1 associated with "DNA repair" (GO:1)
    (2, 2, 'IEA'),  -- BRCA1 variant associated with "Protein binding" (GO:2)
    (3, 3, 'IDA');  -- TP53 associated with "Cell cycle" (GO:3)
