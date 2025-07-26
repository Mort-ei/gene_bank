
-- Constraints: Enforcing valid KEGG ID format and category values

ALTER TABLE pathway
ADD CONSTRAINT valid_kegg_id
    CHECK (kegg_id LIKE 'map%');

ALTER TABLE pathway
ADD CONSTRAINT valid_category
    CHECK (category IN (
        'Metabolism', 
        'Genetic Information Processing', 
        'Environmental Adaptation', 
        'Human Diseases'
    ));