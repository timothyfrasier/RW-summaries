# Commands for getting summary data regarding the number of samples that we currently have.

## SQL Commands

### All samples in total
```
SELECT COUNT(*) FROM rightwhale.samples;
```

### From how many different individuals do we have samples?
```
SELECT COUNT(DISTINCT organism_id) FROM rightwhale.samples
WHERE organism_id > 0
;
```

### Who has been sampled
```
SELECT DISTINCT nea FROM rightwhale.organism
JOIN rightwhale.samples ON organism.organism_id = samples.organism_id
WHERE nea > 0
ORDER BY nea
;
```

Export file as "sampled-individuals.csv"


### Samples by Year
```
SELECT year_collected, COUNT(*) FROM rightwhale.samples
WHERE year_collected > 0
GROUP BY year_collected
ORDER BY year_collected
;
```
Export file as "samples-by-year.csv"



