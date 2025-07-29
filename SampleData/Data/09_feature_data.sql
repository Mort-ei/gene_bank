
-- Sample Data Inserts: Adding annotated features for sequences


-- Features for BRCA1 mRNA (sequence_id = 1)
INSERT INTO feature (sequence_id, feature_type, start_position, end_position, strand, notes)
VALUES
    (1, '5UTR', 1, 200, 'F', '5'' untranslated region'),
    (1, 'exon', 201, 400, 'F', 'Exon 1: Zinc-binding domain'),
    (1, 'CDS', 250, 380, 'F', 'Translation start: Methionine codon'),
    (1, 'exon', 450, 600, 'F', 'Exon 2: BRCA1 C-terminal domain'),
    (1, 'CDS', 460, 590, 'F', 'Critical for tumor suppression'),
    (1, '3UTR', 601, 800, 'F', '3'' untranslated region with regulatory elements');

-- Features for Mouse Brca1 mRNA (sequence_id = 4)
INSERT INTO feature (sequence_id, feature_type, start_position, end_position, strand, notes)
VALUES
    (4, '5UTR', 1, 150, 'F', 'Mouse Brca1 5'' UTR'),
    (4, 'exon', 151, 300, 'F', 'Exon 1: Conserved across mammals'),
    (4, 'CDS', 180, 280, 'F', 'Murine-specific splicing variant');

-- Features for Arabidopsis Genomic DNA (sequence_id = 5)
INSERT INTO feature (sequence_id, feature_type, start_position, end_position, strand, notes)
VALUES
    (5, 'promoter', 1, 500, 'F', 'Promoter region with TATA box'),
    (5, 'enhancer', 600, 800, 'F', 'Putative enhancer element'),
    (5, 'exon', 1000, 1200, 'F', 'Exon of AT1G01010 gene'),
    (5, 'intron', 1201, 1500, 'F', 'Intronic region with splice sites');

-- Features for TP53 Genomic DNA (sequence_id = 3)
INSERT INTO feature (sequence_id, feature_type, start_position, end_position, strand, notes)
VALUES
    (3, 'promoter', 1, 1000, 'F', 'TP53 promoter with multiple regulatory elements'),
    (3, 'exon', 1500, 2000, 'F', 'Exon 4: DNA-binding domain'),
    (3, 'CDS', 1600, 1950, 'F', 'Encodes p53 tumor suppressor protein');
