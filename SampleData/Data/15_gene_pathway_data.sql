
-- Sample Data Inserts: Mapping genes to pathways

INSERT INTO gene_pathway (gene_id, pathway_id, evidence_code)
VALUES
    (1, (SELECT pathway_id FROM pathway WHERE kegg_id = 'map03460'), 'EXP'),  -- BRCA1 in Fanconi anemia
    (1, (SELECT pathway_id FROM pathway WHERE kegg_id = 'map04013'), 'HTP'),  -- BRCA1 in MAPK signaling
    (2, (SELECT pathway_id FROM pathway WHERE kegg_id = 'map00010'), 'TAS');  -- TP53 in Glycolysis
