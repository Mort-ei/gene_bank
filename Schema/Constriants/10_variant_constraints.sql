
-- Constraints: Ensure valid values and references

ALTER TABLE variant
ADD CONSTRAINT fk_variant_gene
    FOREIGN KEY (gene_id)
    REFERENCES Gene(gene_id)
    ON DELETE CASCADE;

ALTER TABLE variant
ADD CONSTRAINT valid_variant_type
    CHECK (variant_type IN ('SNP', 'Insertion', 'Deletion', 'Indel', 'CNV', 'Structural'));

ALTER TABLE variant
ADD CONSTRAINT valid_reference_allele
    CHECK (reference_allele ~ '^[ACGTN]+$|^[-*]$');

ALTER TABLE variant
ADD CONSTRAINT valid_alternate_allele
    CHECK (alternate_allele ~ '^[ACGTN]+$|^[-*]$');

ALTER TABLE variant
ADD CONSTRAINT valid_clinical_significance
    CHECK (clinical_significance IS NULL OR 
           clinical_significance IN ('Pathogenic', 'Likely pathogenic', 'Uncertain significance', 
                                     'Likely benign', 'Benign', 'Drug response', 'Risk factor'));

ALTER TABLE variant
ADD CONSTRAINT unique_variant
    UNIQUE (gene_id, position, reference_allele, alternate_allele);

ALTER TABLE variant
ADD CONSTRAINT valid_position
    CHECK (position > 0);
