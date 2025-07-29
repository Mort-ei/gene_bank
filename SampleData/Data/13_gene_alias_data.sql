
-- Sample Data Inserts: Adding alias entries for genes

INSERT INTO gene_alias (gene_id, alias_symbol, source) VALUES
    (1, 'BRCA1_HUMAN', 'UniProt'),
    (1, 'RNF53', 'HGNC'),
    (2, 'BRCA1', 'NCBI'),
    (3, 'P53', 'Common'),
    (3, 'TP53_HUMAN', 'UniProt'),
    (4, 'CFTR_HUMAN', 'UniProt'),
    (4, 'ABCC7', 'HGNC'),
    (5, 'BRCA1_v2', 'Custom'),
    (6, 'TRP53', 'NCBI'),
    (7, 'MYF4', 'HGNC'),
    (8, 'AT1G01010.1', 'Ensembl');
