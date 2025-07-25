# Data on Mitochondrial Haplotypes

## Distribution of haplotypes across sampled whales
```
SELECT DISTINCT organism.nea, mtdna.haplotype from mtdna
JOIN samples ON mtdna.sample_id = samples.sample_id
JOIN organism ON samples.organism_id = organism.organism_id
WHERE (organism.nea > 0 AND mtdna.locus = "Control Region")
ORDER BY organism.nea
;
```
Export file as "haplotypes.csv" and then **manually remove lines without actual haplotype data**.


## Haplotypes and sex
```
SELECT DISTINCT organism.nea, mtdna.haplotype, sexing.sex from mtdna
JOIN samples ON mtdna.sample_id = samples.sample_id
JOIN organism ON samples.organism_id = organism.organism_id
JOIN sexing on mtdna.sample_id = sexing.sample_id
WHERE (organism.nea > 0 AND mtdna.locus = "Control Region")
ORDER BY organism.nea
;
```
Export file as "haplotype-sex.csv".

See associated R commands for obtaining summar data and figures.
