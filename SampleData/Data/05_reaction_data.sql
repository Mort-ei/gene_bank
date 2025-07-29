
-- Sample Data Inserts: Adding reactions for pathways


-- Reactions for Glycolysis / Gluconeogenesis (pathway_id = 1)
INSERT INTO reaction (pathway_id, reaction_name, kegg_reaction_id, equation)
VALUES
    (1, 'Hexokinase reaction', 'R00299', 'C00031 + C00002 → C00668 + C00008'),
    (1, 'Phosphofructokinase reaction', 'R00756', 'C05345 + C00002 → C05378 + C00008'),
    (1, 'Pyruvate kinase reaction', 'R00200', 'C00074 + C00002 → C00022 + C00008');

-- Reactions for MAPK signaling pathway (pathway_id = 3)
INSERT INTO reaction (pathway_id, reaction_name, kegg_reaction_id, equation)
VALUES
    (3, 'NADH dehydrogenase', 'R04520', 'C00004 + C00005 + C00009 → C00003 + C00006 + C00008'),
    (3, 'Cytochrome c oxidase', 'R04524', '4C00007 + 4C00009 + 4C00008 → 4C00006 + 2C00001');
