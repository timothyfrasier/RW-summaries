# Data on Sexes

## Distribution of sexes across sampled whales
```
SELECT DISTINCT organism.nea, sexing.sex from rightwhale.sexing
JOIN rightwhale.samples ON sexing.sample_id = samples.sample_id
JOIN rightwhale.organism ON samples.organism_id = organism.organism_id
WHERE nea > 0
ORDER BY nea
;
```

Export file as "sexes.csv"
