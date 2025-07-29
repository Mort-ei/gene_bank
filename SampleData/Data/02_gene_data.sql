
-- Sample Data Inserts: Populating genes for various taxa


-- Genes for Mus musculus & Homo sapiens
INSERT INTO gene (taxonomy_id, gene_symbol, gene_name, gene_sequence, start_position, end_position, strand)
VALUES 
    (
        (SELECT taxonomy_id FROM taxonomy WHERE scientific_name = 'Mus musculus'),
        'Brca1',
        'Breast cancer type 1 susceptibility protein',
        'ATGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTA',
        10343523,
        10355678,
        'F'
    ),
    (
        (SELECT taxonomy_id FROM taxonomy WHERE scientific_name = 'Homo sapiens'),
        'BRCA1',
        'Breast Cancer Type 1',
        'ATGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTA',
        41196312,
        41277500,
        'F'
    ),
    (
        (SELECT taxonomy_id FROM taxonomy WHERE scientific_name = 'Homo sapiens'),
        'TP53',
        'Tumor Protein P53',
        'ATGCGTCGAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGC',
        7571719,
        7590856,
        'R'
    ),
    (
        (SELECT taxonomy_id FROM taxonomy WHERE scientific_name = 'Homo sapiens'),
        'CFTR',
        'Cystic Fibrosis Transmembrane Conductance Regulator',
        'AAGCTGATCGTAGCTAGCTAGCGTAGCTAGCTGACTGATCGTAGCTAGCGTAGCT',
        117479533,
        117668665,
        'F'
    );

-- Genes for Mammalia
INSERT INTO gene (taxonomy_id, gene_symbol, gene_name, gene_sequence, start_position, end_position, strand)
VALUES 
    (
        (SELECT taxonomy_id FROM taxonomy WHERE scientific_name = 'Mammalia'),
        'Brca1',
        'Breast Cancer Type 1 Susceptibility Protein',
        'ATGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTA',
        10343523,
        10355678,
        'F'
    ),
    (
        (SELECT taxonomy_id FROM taxonomy WHERE scientific_name = 'Mammalia'),
        'Trp53',
        'Tumor Suppressor Protein P53',
        'ATGCGTCGAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGC',
        124736543,
        124757981,
        'R'
    );

-- Genes for Aves (Birds)
INSERT INTO gene (taxonomy_id, gene_symbol, gene_name, gene_sequence, start_position, end_position, strand)
VALUES 
    (
        (SELECT taxonomy_id FROM taxonomy WHERE scientific_name = 'Aves'),
        'MYOG',
        'Myogenin',
        'CAGTAGCTAGCTAGGCTGATCGTAGCTAGGCTGACTAGCTGATCGTAGCTAGCT',
        5500,
        9500,
        'F'
    );

-- Genes for Arabidopsis thaliana (Plants)
INSERT INTO gene (taxonomy_id, gene_symbol, gene_name, gene_sequence, start_position, end_position, strand)
VALUES 
    (
        (SELECT taxonomy_id FROM taxonomy WHERE scientific_name = 'Arabidopsis thaliana'),
        'AT1G01010',
        'Unknown Protein',
        'ATGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTA',
        3631,
        5899,
        'F'
    );
