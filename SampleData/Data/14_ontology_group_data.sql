
-- Sample Data Inserts: Orthologous groups linked to genes

INSERT INTO orthology_group (ko_number, description, gene_id) VALUES
    ('K00001', 'Alcohol dehydrogenase', 3),  -- TP53 (example placeholder)
    ('K00002', 'Aldehyde dehydrogenase', 4), -- CFTR
    ('K00003', 'Hexokinase', 1),             -- BRCA1
    ('K00004', 'DNA polymerase', 2),         -- BRCA1 variant
    ('K00005', 'Cytochrome c oxidase', 8),   -- AT1G01010
    ('K00006', 'Myogenin', 7);               -- MYOG
