
-- Constraints: Enforcing valid references and data

ALTER TABLE feature
ADD CONSTRAINT fk_feature_sequence
    FOREIGN KEY (sequence_id)
    REFERENCES sequence(sequence_id)
    ON DELETE CASCADE;

ALTER TABLE feature
ADD CONSTRAINT valid_feature_type
    CHECK (feature_type IN (
        'exon', 'CDS', '5UTR', '3UTR', 'promoter', 'intron', 'domain', 'enhancer'
    ));

ALTER TABLE feature
ADD CONSTRAINT valid_strand
    CHECK (strand IN ('F', 'R'));

ALTER TABLE feature
ADD CONSTRAINT valid_feature_positions
    CHECK (end_position >= start_position);
