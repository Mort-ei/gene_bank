
-- Sample Data Inserts: External references for various genes


-- BRCA1 references (gene_id 1, 2, 5)
INSERT INTO cross_reference (gene_id, external_db, external_id) VALUES
    (1, 'UniProt', 'P38398'),
    (1, 'KEGG', 'hsa:672'),
    (1, 'NCBI', '672'),
    (2, 'UniProt', 'P38398'),
    (2, 'HGNC', '1100'),
    (5, 'UniProt', 'P38398'),
    (5, 'OMIM', '113705'),

-- TP53 references (gene_id 3, 6)
    (3, 'UniProt', 'P04637'),
    (3, 'KEGG', 'hsa:7157'),
    (6, 'UniProt', 'P04637'),
    (6, 'HGNC', '11998'),

-- CFTR references (gene_id 4)
    (4, 'UniProt', 'P13569'),
    (4, 'KEGG', 'hsa:1080'),
    (4, 'OMIM', '602421'),

-- MYOG references (gene_id 7)
    (7, 'UniProt', 'P15173'),
    (7, 'HGNC', '7612'),

-- AT1G01010 references (gene_id 8)
    (8, 'UniProt', 'Q9SJZ2'),
    (8, 'NCBI', '839388');
