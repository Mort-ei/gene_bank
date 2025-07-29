
-- Sample Data Inserts: Adding sequences for various genes

INSERT INTO sequence (
    gene_id, 
    sequence_type, 
    accession_number, 
    version, 
    sequence_data, 
    source_database
) VALUES
    -- BRCA1 mRNA (Human)
    (
        (SELECT gene_id FROM gene 
         WHERE gene_symbol = 'BRCA1' 
           AND taxonomy_id = (SELECT taxonomy_id FROM taxonomy 
                              WHERE scientific_name = 'Homo sapiens')),
        'mRNA',
        'NM_007294',
        3,
        'ATGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTAGCTA...',
        'NCBI'
    ),
    
    -- BRCA1 Protein (Human)
    (
        (SELECT gene_id FROM gene 
         WHERE gene_symbol = 'BRCA1' 
           AND taxonomy_id = (SELECT taxonomy_id FROM taxonomy 
                              WHERE scientific_name = 'Homo sapiens')),
        'Protein',
        'NP_009225',
        1,
        'MEEPQSDPSVEPPLSQETFSDLWKLLPENNVLSPLPSQAMDDLMLSPDDIEQWFTED...',
        'RefSeq'
    ),
    
    -- TP53 Genomic DNA (Human)
    (
        (SELECT gene_id FROM gene 
         WHERE gene_symbol = 'TP53' 
           AND taxonomy_id = (SELECT taxonomy_id FROM taxonomy 
                              WHERE scientific_name = 'Homo sapiens')),
        'Genomic DNA',
        'NC_000017',
        11,
        'GATCCCCTGCCCTCCCAGAGCCCCCAGACCTGCACTCAGCCCCACCC...',
        'Ensembl'
    ),
    
    -- Brca1 mRNA (Mouse)
    (
        (SELECT gene_id FROM gene 
         WHERE gene_symbol = 'Brca1' 
           AND taxonomy_id = (SELECT taxonomy_id FROM taxonomy 
                              WHERE scientific_name = 'Mus musculus')),
        'mRNA',
        'NM_009764',
        4,
        'ATGGCGGCGCTGAGCGCGCTGGGGCTGCTGGTGCTGGTGCTGCTGGTG...',
        'NCBI'
    ),
    
    -- Arabidopsis thaliana Genomic DNA
    (
        (SELECT gene_id FROM gene 
         WHERE gene_symbol = 'AT1G01010' 
           AND taxonomy_id = (SELECT taxonomy_id FROM taxonomy 
                              WHERE scientific_name = 'Arabidopsis thaliana')),
        'Genomic DNA',
        'NC_003070',
        9,
        'ATGGTTAATTTTCCCAAGAAGCTTGGAATTTTGAAGATTTTGGAAAGG...',
        'Ensembl'
    );