
-- Sample Data Inserts: Adding common compounds

INSERT INTO compound (compound_name, kegg_compound_id, chemical_formula) 
VALUES
    ('Glucose', 'C00031', 'C6H12O6'),
    ('ATP', 'C00002', 'C10H16N5O13P3'),
    ('Glucose-6-phosphate', 'C00668', 'C6H13O9P'),
    ('ADP', 'C00008', 'C10H15N5O10P2'),
    ('Pyruvate', 'C00022', 'C3H3O3'),
    ('Fructose-6-phosphate', 'C05345', 'C6H13O9P'),
    ('Fructose-1,6-bisphosphate', 'C05378', 'C6H14O12P2'),
    ('Phosphoenolpyruvate', 'C00074', 'C3H5O6P');

INSERT INTO compound (compound_name, kegg_compound_id, chemical_formula) 
VALUES
    ('NAD+', 'C00003', 'C21H27N7O14P2'),
    ('NADH', 'C00004', 'C21H28N7O14P2'),
    ('Acetyl-CoA', 'C00024', 'C23H38N7O17P3S'),
    ('Citrate', 'C00158', 'C6H8O7'),
    ('Oxaloacetate', 'C00036', 'C4H4O5');
