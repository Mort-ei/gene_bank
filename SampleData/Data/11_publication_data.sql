
-- Sample Data Inserts: Publications related to genes

INSERT INTO publication (gene_id, pmid, doi, title, authors, publication_date) VALUES
    (1, '10581552', '10.1126/science.1058155', 'Breast and ovarian cancer risks due to inherited mutations in BRCA1',
     'Easton DF, Ford D, Bishop DT', '1995-10-26'),
    (1, '30643254', '10.1038/s41586-019-1197-0', 'BRCA1 DNA repair function and its clinical implications',
     'Lord CJ, Ashworth A', '2019-01-01'),
    (2, '20301425', '10.1056/NEJMoa0900212', 'Screening for BRCA1 mutations in high-risk populations',
     'King MC, Marks JH, Mandell JB', '2003-10-24'),

    -- TP53 publications
    (3, '12529408', '10.1016/S0092-8674(02)01200-3', 'p53 mutations in human cancers',
     'Olivier M, Hollstein M, Hainaut P', '2002-12-13'),
    (6, '12642038', '10.1038/nrc1247', 'p53 and human cancer: the first ten thousand mutations',
     'Petitjean A, Mathe E, Kato S', '2007-03-01'),

    -- CFTR publications
    (4, '2570460', '10.1126/science.2570460', 'Identification of the cystic fibrosis gene',
     'Riordan JR, Rommens JM, Kerem B', '1989-09-08'),

    -- MYOG publications
    (7, '2910754', '10.1016/0092-8674(89)90030-8', 'Myogenin is required for late but not early aspects of myogenesis',
     'Hasty P, Bradley A, Morris JH', '1989-12-22'),

    -- AT1G01010 publications
    (8, NULL, '10.1105/tpc.105.038588', 'Functional characterization of Arabidopsis thaliana unknown protein AT1G01010',
     'Smith AM, Jones RB, Taylor CB', '2006-07-01');
