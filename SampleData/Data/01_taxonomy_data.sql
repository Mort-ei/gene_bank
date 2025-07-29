-- Sample Data Inserts: Initial entries for taxonomy hierarchy

INSERT INTO taxonomy (scientific_name, common_name, rank, ncbi_tax_id)
VALUES ('Biota', 'Life', 'domain', 1);


INSERT INTO taxonomy (scientific_name, common_name, rank, ncbi_tax_id, parent_taxonomy_id)
VALUES 
    ('Bacteria', 'Bacteria', 'kingdom', 2, 1),
    ('Archaea', 'Archaea', 'kingdom', 2157, 1),
    ('Eukaryota', 'Eukaryotes', 'kingdom', 2759, 1);


INSERT INTO taxonomy (scientific_name, common_name, rank, ncbi_tax_id, parent_taxonomy_id)
VALUES 
    ('Chordata', 'Chordates', 'phylum', 7711, 3),
    ('Arthropoda', 'Arthropods', 'phylum', 6656, 3);


INSERT INTO taxonomy (scientific_name, common_name, rank, ncbi_tax_id, parent_taxonomy_id)
VALUES 
    ('Mammalia', 'Mammals', 'class', 40674, 6),
    ('Aves', 'Birds', 'class', 8782, 6);


INSERT INTO taxonomy (scientific_name, common_name, rank, ncbi_tax_id, parent_taxonomy_id)
VALUES 
    ('Primates', 'Primates', 'order', 9443, 8),
    ('Rodentia', 'Rodents', 'order', 9989, 8);


INSERT INTO taxonomy (scientific_name, common_name, rank, ncbi_tax_id, parent_taxonomy_id)
VALUES 
    ('Hominidae', 'Great apes', 'family', 9604, 10);


INSERT INTO taxonomy (scientific_name, common_name, rank, ncbi_tax_id, parent_taxonomy_id)
VALUES 
    ('Homo', 'Humans', 'genus', 9605, 12);


INSERT INTO taxonomy (scientific_name, common_name, rank, ncbi_tax_id, parent_taxonomy_id)
VALUES 
    ('Homo sapiens', 'Human', 'species', 9606, 13);