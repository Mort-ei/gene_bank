
-- Constraints: Validating EC format, uniqueness, and references

ALTER TABLE Enzyme
ADD CONSTRAINT fk_enzyme_gene
    FOREIGN KEY (gene_id)
    REFERENCES Gene(gene_id)
    ON DELETE SET NULL;

ALTER TABLE Enzyme
ADD CONSTRAINT valid_ec_format
    CHECK (ec_number ~ '^EC:[1-7](\\.[0-9-]+){3}$');

ALTER TABLE Enzyme
ADD CONSTRAINT unique_ec_number
    UNIQUE (ec_number);

ALTER TABLE Enzyme
ADD CONSTRAINT valid_enzyme_name
    CHECK (LENGTH(TRIM(enzyme_name)) >= 3);

ALTER TABLE Enzyme
ADD CONSTRAINT no_duplicate_enzyme_names
    UNIQUE (enzyme_name, ec_number);
