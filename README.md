# 🧬 Gene Bank Relational Database
A relational‐schema implementation (PostgreSQL 15) that unifies taxonomy, gene annotation, pathways, reactions, compounds, ontologies, and literature metadata—similar in spirit to resources such as **NCBI Gene** and **KEGG**.

| ![ERD](docs/erd.png) |
|:--:|
| *Figure 1 – Full entity–relationship diagram (click to enlarge).* |

---

## 1  Why this project?
Modern bioinformatics projects often juggle siloed flat-files (GBK, FASTA, GFF3), pathway records (KGML, SBML), and JSON/OBO ontologies.  
A single, **normalized SQL schema** makes it easier to:

* run complex JOINs across genes & pathways,
* track variants, aliases, and cross-references,
* keep provenance (publications, external DB IDs),
* power APIs / dashboards without ORMs fighting nested JSON.

---

## 2  Schema at a glance

| Core table            | Purpose (key columns shown)                                                |
|-----------------------|-----------------------------------------------------------------------------|
| `Taxonomy`            | NCBI-style lineage (`TaxonomyID`, `ParentTaxonomyID`, `Rank`, names)        |
| `Gene`                | One row per locus (`GeneID`, `TaxonomyID`, `GeneSymbol`, `Sequence` …)      |
| `Sequence`, `Feature` | Raw sequence blobs + per-feature coords (CDS, UTR, exon, motif …)           |
| `Pathway`, `GenePathway` | KEGG/Reactome pathways & M:N linker to genes                              |
| `Reaction`, `CompoundReaction`, `Compound` | Stoichiometric reactions ↔ compounds                  |
| `Ontology`, `GeneOntology` | GO terms + M:N linker                                                  |
| `Enzyme`, `GeneAlias`, `Variant`, `Publication`, `CrossReference`, `OrthologyGroup` | auxiliary data |

> See **docs/erd.png** for PK/FK details.

---

## 3  Tech stack

* **PostgreSQL 15** (+ pgcrypto for UUIDs if desired)
* **psql** & **pg_dump** for migrations / seeds
* Python ≥3.10 (optional ETL scripts in `etl/`)

---

## 4  Getting started

```bash
# 1 Clone
git clone https://github.com/Mort-ei/gene-bank-db.git
cd gene-bank-db

# 2 Spin-up Postgres (Docker)
docker compose up -d db

# 3 Create schema & seed minimal demo data
psql "postgresql://postgres:postgres@localhost:5432/gene_bank" \
     -f sql/00_schema.sql       \
     -f sql/10_dummy_taxa.sql   \
     -f sql/20_dummy_genes.sql
