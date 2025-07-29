-- (0) left join without using the LEFT JOIN keyword
SELECT 
	t.scientific_name,
	STRING_AGG(DISTINCT g.gene_symbol, '| ') AS genes
FROM taxonomy t, gene g
WHERE t.taxonomy_id = g.taxonomy_id
GROUP BY t.taxonomy_id

UNION ALL

SELECT
	t.scientific_name,
	NULL
FROM taxonomy t
WHERE NOT EXISTS (
	SELECT * 
	FROM gene g
	WHERE t.taxonomy_id = g.taxonomy_id
);



-- (1) find child and parent taxonomys
SELECT 
	t.scientific_name  AS "Child scientfic name",
	t.common_name AS "Child common name ",
	t.rank AS "Child rank",
	tp.scientific_name  AS "Parent scientfic name",
	tp.common_name AS "Parent common name ",
	tp.rank AS "Parent rank"
FROM taxonomy t
LEFT JOIN taxonomy tp
	ON t.parent_taxonomy_id = tp.taxonomy_id
ORDER BY t.taxonomy_id DESC;




-- (2) get all gene with their taxonomic classification and parent taxonomy
SELECT
	g.gene_id, g.gene_name, g.gene_symbol,
	t.scientific_name, t.common_name, t.rank,
	tp.scientific_name, tp.common_name, tp.rank
FROM gene g
JOIN taxonomy t
	ON g.taxonomy_id = t.taxonomy_id
LEFT JOIN taxonomy tp
	ON tp.taxonomy_id = t.parent_taxonomy_id;

	

-- (3) Metabolic Pathways with Associated Enzymes
SELECT 
	p.pathway_name,
	e.enzyme_name,
	e.ec_number,
	STRING_AGG(DISTINCT c.compound_name, '| ') AS compounds
FROM pathway p
JOIN reaction r
	ON p.pathway_id = r.pathway_id
JOIN reaction_compound rc
	ON r.reaction_id = rc.reaction_id
JOIN compound c
	ON rc.compound_id = c.compound_id
JOIN enzyme_reaction er
	ON r.reaction_id = er.reaction_id
JOIN enzyme e
	ON er.enzyme_id = e.enzyme_id
WHERE p.category = 'Metabolism'
GROUP BY p.pathway_name, e.enzyme_name, e.ec_number;




--(4)Gene Features and Sequences with Sequence Context
SELECT 
	g.gene_symbol,
	s.sequence_type,
	s.accession_number,
	s.version,
	f.feature_type,
	f.start_position,
	f.end_position
FROM gene g
JOIN sequence s
	ON g.gene_id = s.gene_id
JOIN feature f
	ON s.sequence_id = f.sequence_id
WHERE feature_type = 'CDS';



-- (5) Cross-Species Orthologs
SELECT 
	og.ko_number,
	t.scientific_name,
	g.gene_symbol,
	tp.scientific_name AS reference_species
FROM orthology_group og
JOIN gene g 
	ON og.gene_id = g.gene_id
JOIN taxonomy t
	ON g.taxonomy_id = t.taxonomy_id
JOIN taxonomy tp -- again parent and ref taxonomy all over again :))
	ON t.parent_taxonomy_id = tp.taxonomy_id
WHERE tp.rank = 'species';

-- (6) variant impact analysis
SELECT 
	g.gene_symbol,
	v.variant_type,
	v.position,
	COUNT(DISTINCT p.pmid) AS publication_count,
	STRING_AGG(DISTINCT o.term, '| ') AS affected_functions
FROM variant v
JOIN gene g
	ON v.gene_id = g.gene_id
LEFT JOIN publication p
	ON g.gene_id = p.gene_id
LEFT JOIN gene_ontology go
	ON g.gene_id = go.gene_id
JOIN ontology o 
	ON go.go_id = o.go_id
WHERE clinical_significance = 'Pathogenic'
GROUP BY g.gene_id, v.variant_id;



-- (7) Metabolic Network Visualization
SELECT 
	STRING_AGG(DISTINCT CASE WHEN rc.role = 'product' THEN c.compound_name END, '| ') AS products,
	STRING_AGG(DISTINCT CASE WHEN rc.role = 'substrate' THEN c.compound_name END, '| ') AS substrates,
	COUNT(DISTINCT gp.gene_id) AS enzyme_count
FROM reaction r
JOIN reaction_compound rc
	ON r.reaction_id = rc.reaction_id
JOIN compound c
	ON rc.compound_id = c.compound_id
LEFT JOIN enzyme_reaction er
	ON r.reaction_id = er.reaction_id
LEFT JOIN enzyme e
	ON er.enzyme_id = e.enzyme_id
LEFT JOIN gene_pathway gp
	on e.gene_id = gp.gene_id
GROUP BY r.reaction_id;


-- (8) taxonomic distribution of pathways 

SELECT 
	t.scientific_name,
	p.pathway_name,
	COUNT(DISTINCT g.gene_id) AS gene_count
FROM pathway p
JOIN gene_pathway gp
	ON p.pathway_id = gp.pathway_id
JOIN gene g
	ON gp.gene_id = g.gene_id
JOIN taxonomy t
	ON g.taxonomy_id = t.taxonomy_id
WHERE t.rank = 'species'
GROUP BY t.taxonomy_id, p.pathway_id;

-- (9) multi database gene identifying mapping 
SELECT 
	g.gene_symbol,
	MAX(CASE WHEN x.external_db = 'NCBI' THEN x.external_id END) AS NCBI,
	MAX(CASE WHEN x.external_db = 'KEGG' THEN x.external_id END )AS KEGG,
	MAX(CASE WHEN x.external_db = 'UniProt' THEN x.external_id END) AS UniProt,
	MAX(CASE WHEN x.external_db = 'HGNC' THEN x.external_id END) AS HGNC
FROM cross_reference x
JOIN gene g
	ON x.gene_id = g.gene_id
GROUP BY g.gene_id;

-- (10) gene ontology enrichment analysis

SELECT 
	COUNT(DISTINCT g.gene_id) AS gene_count,
	STRING_AGG(DISTINCT t.scientific_name, '| ') AS species_list
FROM ontology o
JOIN gene_ontology go
	ON o.go_id = go.go_id
JOIN gene g
	ON go.gene_id = g.gene_id
JOIN taxonomy t
	ON g.taxonomy_id = t.taxonomy_id
GROUP BY g.gene_id
HAVING COUNT(DISTINCT g.gene_id) >= 1;

-- (11) Evolutionary Conservation Analysis

SELECT 
	og.ko_number,
	COUNT(DISTINCT t.scientific_name) AS species_count,
	AVG(LENGTH(s.sequence_data)) AS avg_seq_length
FROM orthology_group og
JOIN gene g
	ON og.gene_id = g.gene_id
JOIN taxonomy t
	ON g.taxonomy_id = t.taxonomy_id
JOIN sequence s
	ON g.gene_id = s.gene_id
GROUP BY og.ko_number
ORDER BY species_count DESC;

-- (12) Publication Timeline Analysis
SELECT 
	EXTRACT(YEAR FROM p.publication_date) AS pub_year,
	COUNT(DISTINCT p.pmid) AS paper_count,
	STRING_AGG(DISTINCT v.variant_type, '| ') AS variant_type
FROM publication p
JOIN gene g
	ON p.gene_id = g.gene_id
LEFT JOIN variant v
	ON g.gene_id = v.gene_id
GROUP BY g.gene_id, pub_year
ORDER BY paper_count DESC;

-- (13) Sequence Annotation Completeness Report

SELECT 
	s.accession_number,
	COUNT(DISTINCT f.feature_id) AS feature_count,
	SUM(f.end_position - f.start_position) AS annotated_bp,
	LENGTH(s.sequence_data) AS total_bp,
	(SUM(f.end_position - f.start_position) / LENGTH(s.sequence_data)) AS coverage_ratio
	
FROM feature f
JOIN sequence s
	ON f.sequence_id = s.sequence_id
GROUP BY s.sequence_id
HAVING (SUM(f.end_position - f.start_position) / LENGTH(s.sequence_data)) < 0.9;

-- (14) Metabolic Pathway Completeness Check
SELECT 
	COUNT(DISTINCT r.reaction_id) AS total_reactions,
	COUNT(DISTINCT CASE WHEN e.ec_number IS NOT NULL THEN
	r.reaction_id END) AS annotated_reactions,
	COUNT(DISTINCT CASE WHEN e.ec_number IS NOT NULL THEN r.reaction_id END)::float / 
    NULLIF(COUNT(DISTINCT r.reaction_id), 0) AS completion_ratio
FROM pathway p
LEFT JOIN reaction r
	ON p.pathway_id = r.pathway_id
LEFT JOIN enzyme_reaction er 
	ON r.reaction_id = er.reaction_id
LEFT JOIN enzyme e
	ON er.enzyme_id = e.enzyme_id
GROUP BY p.pathway_id;


-- (15) Variant Frequency by Population
SELECT 
	v.position,
	v.reference_allele,
	v.alternate_allele,
	COUNT(DISTINCT CASE WHEN t.ncbi_tax_id = 9606 THEN variant_id END) AS human_occuerence,
	COUNT(DISTINCT CASE WHEN t.ncbi_tax_id = 9598 THEN variant_id END) AS chimp_occurence
FROM variant v
JOIN gene g
	ON v.gene_id = g.gene_id
JOIN taxonomy t
	ON g.taxonomy_id = t.taxonomy_id
GROUP BY v.position, v.reference_allele, v.alternate_allele;


-- (16) Enzyme Commission Distribution

SELECT 
	SPLIT_PART(e.ec_number, '.', 1) AS ec_class,
	COUNT(DISTINCT e.enzyme_id) AS enzyme_count,
	STRING_AGG(DISTINCT p.pathway_name, '| ') AS associated_pathways 
FROM enzyme e
JOIN enzyme_reaction er
	ON e.enzyme_id = er.enzyme_id
JOIN reaction r
	ON er.reaction_id = r.reaction_id
JOIN pathway p
	On r.pathway_id = p.pathway_id
GROUP BY SPLIT_PART(e.ec_number, '.', 1)
ORDER BY enzyme_count;

-- (17) Get all genes with variants of clinical significance

SELECT 
	g.gene_symbol,
	g.gene_name,
	COUNT(v.variant_id) AS variant_count,
	STRING_AGG(DISTINCT v.clinical_significance, '| ') AS clinical_significance 
FROM gene g
JOIN variant v
	ON g.gene_id = v.gene_id
WHERE v.clinical_significance IS NOT NULL
GROUP BY g.gene_id
HAVING COUNT(DISTINCT v.clinical_significance) > 0;

--(18) Cross-Database Sequence Validation

SELECT g.gene_symbol,
       ncbi.accession_number AS ncbi_seq,
       ensembl.accession_number AS ensembl_seq,
       CASE WHEN ncbi.sequence_data = ensembl.sequence_data THEN 'Match' ELSE 'Conflict' END AS validation_status
FROM Gene g
JOIN Sequence ncbi
	ON g.gene_id = ncbi.gene_id AND ncbi.source_database = 'NCBI'
JOIN Sequence ensembl 
	ON g.gene_id = ensembl.gene_id AND ensembl.source_database = 'Ensembl'
WHERE ncbi.sequence_type = ensembl.sequence_type;


-- (19) Get all genes with their longest sequence
SELECT 
	g.gene_symbol,
	g.gene_sequence,
	MAX(LENGTH(s.sequence_data)) AS max_len_sequence,
	s.sequence_type
FROM gene g
JOIN sequence s
	ON g.gene_id = s.gene_id
GROUP BY g.gene_id, s.sequence_type
ORDER BY max_len_sequence DESC;


--(20)  Integrated Gene Report
SELECT 
	g.gene_symbol,
	g.gene_name,
    t.scientific_name AS species,
    STRING_AGG(DISTINCT p.pathway_name, '| ') AS pathways,
    STRING_AGG(DISTINCT o.term, '| ') AS go_terms,
    COUNT(DISTINCT v.variant_id) AS variant_count,
    MAX(pub.publication_date) AS latest_publication
FROM gene g
JOIN taxonomy t
	ON g.taxonomy_id = t.taxonomy_id
LEFT JOIN gene_pathway gp
	ON g.gene_id = gp.gene_id
LEFT JOIN pathway p
	ON gp.pathway_id = p.pathway_id
LEFT JOIN gene_ontology go
	ON g.gene_id = go.gene_id
LEFT JOIN ontology o
	ON go.go_id = o.go_id
LEFT JOIN variant v
	ON g.gene_id = v.gene_id
LEFT JOIN publication pub
	ON g.gene_id = pub.gene_id
GROUP BY g.gene_id, t.scientific_name
ORDER BY variant_count DESC
LIMIT 50;


	


