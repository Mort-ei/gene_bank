-- Constraints: Enforcing uniqueness, hierarchy, and valid ranks
ALTER TABLE taxonomy ADD Constraint fk_parent_taxonomy
	Foreign KEY (parent_taxonomy_id)
	REFERENCES taxonomy(taxonomy_id)
	ON DELETE CASCADE;

ALTER TABLE taxonomy ADD Constraint unique_taxonomy_name
	UNIQUE(scientific_name, rank, parent_taxonomy_id);

ALTER TABLE taxonomy ADD Constraint valid_rank
	CHECK(RANK IN (
			'domain', 'kingdom', 'phylum', 'class',
			'order', 'family', 'genus', 'species',
			'subspecies', 'strain', 'variety'));