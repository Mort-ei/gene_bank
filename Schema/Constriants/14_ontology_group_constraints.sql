
-- Constraints: Ensure valid KO format and uniqueness

ALTER TABLE orthology_group
ADD CONSTRAINT fk_orthology_gene
    FOREIGN KEY (gene_id)
    REFERENCES Gene(gene_id)
    ON DELETE CASCADE;

ALTER TABLE orthology_group
ADD CONSTRAINT valid_ko_number
    CHECK (ko_number ~ '^K\\d{5}$');

ALTER TABLE orthology_group
ADD CONSTRAINT valid_description
    CHECK (LENGTH(TRIM(description)) > 0);

ALTER TABLE orthology_group
ADD CONSTRAINT unique_gene_ko
    UNIQUE (gene_id, ko_number);

ALTER TABLE orthology_group
ADD CONSTRAINT unique_ko_number
    UNIQUE (ko_number);
