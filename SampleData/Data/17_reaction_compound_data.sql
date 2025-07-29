
-- Sample Data Inserts: Compound roles in reactions

INSERT INTO reaction_compound (reaction_id, compound_id, role, stoichiometry)
VALUES
    -- Hexokinase reaction
    (1, (SELECT compound_id FROM compound WHERE kegg_compound_id = 'C00031'), 'substrate', 1),
    (1, (SELECT compound_id FROM compound WHERE kegg_compound_id = 'C00002'), 'substrate', 1),
    (1, (SELECT compound_id FROM compound WHERE kegg_compound_id = 'C00668'), 'product', 1),
    (1, (SELECT compound_id FROM compound WHERE kegg_compound_id = 'C00008'), 'product', 1),
    
    -- Pyruvate kinase reaction
    (3, (SELECT compound_id FROM compound WHERE kegg_compound_id = 'C00074'), 'substrate', 1),
    (3, (SELECT compound_id FROM compound WHERE kegg_compound_id = 'C00022'), 'product', 1);
