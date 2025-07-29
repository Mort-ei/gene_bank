
-- Sample Data Inserts: Variants for different genes

-- BRCA1 variants (gene_id 1, 2, 5)
INSERT INTO variant (gene_id, position, variant_type, reference_allele, alternate_allele, clinical_significance) VALUES
    (1, 43124016, 'SNP', 'C', 'T', 'Pathogenic'),         -- rs80357906
    (1, 43125435, 'Deletion', 'AG', '-', 'Likely pathogenic'),
    (2, 43124016, 'SNP', 'C', 'T', 'Pathogenic'),         -- Same variant different gene record
    (5, 43125279, 'Insertion', '-', 'A', 'Uncertain significance'),

-- TP53 variants (gene_id 3, 6)
    (3, 7577539, 'SNP', 'G', 'A', 'Pathogenic'),          -- rs28934578
    (6, 7577539, 'SNP', 'G', 'A', 'Pathogenic'),          -- Same variant different gene record
    (3, 7579472, 'SNP', 'C', 'T', 'Benign'),

-- CFTR variants (gene_id 4)
    (4, 117559592, 'Deletion', 'CTT', '-', 'Pathogenic'), -- ΔF508
    (4, 117559590, 'SNP', 'G', 'A', 'Pathogenic'),        -- G542X

-- MYOG variants (gene_id 7)
    (7, 8000, 'SNP', 'T', 'C', 'Likely benign'),

-- AT1G01010 variants (gene_id 8)
    (8, 5000, 'SNP', 'A', 'G', NULL);                     -- Unknown significance
