
-- Indexes: Improve lookups by sequence and feature type

CREATE INDEX idx_feature_sequence_id ON feature(sequence_id);
CREATE INDEX idx_feature_type ON feature(feature_type);
