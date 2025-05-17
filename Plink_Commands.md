# Association Testing

### PLINK basic case-control association
```bash
plink --bfile data --assoc --out assoc_results
```

### Logistic regression with covariates
```bash
plink --bfile data --logistic --covar covariates.txt --covar-name age,sex,PC1,PC2 --out log_reg_results
```

### Linear regression (e.g., for quantitative traits)
```bash
plink --bfile data --linear --pheno phenotype.txt --covar covariates.txt --out lin_reg_results
```

### Stratified association
```bash
plink --bfile data --assoc --within strata.txt --out strat_assoc
```

### Association conditioned on another SNP
```bash
plink --bfile data --condition rs12345 --logistic --out cond_assoc
```

### Adjust p-values for multiple testing
```bash
plink --bfile data --assoc --adjust --out adjusted_pvals
```

# Update variant information

## Update the rsids in a bim file based on the array file 
```bash
plink --noweb --bfile BSIG_Juli2020 --update-name GSA-24v2_update_map.txt 2 1 --make-bed --out BSIG_update_name
```

## Filter a dataset with MAF, GENO and MIND
```bash
plink --noweb --bfile BSIG_update_name --chr 1-24 --geno 0.1 --maf 0.05 --hwe 0.001 --mind 0.05 --make-bed --out filtered_BSIG
```

## Update empty rsids with chr:pos
```bash
plink --noweb --bfile filtered_BSIG --set-missing-var-ids @:#[b37]\$1,\$2 --make-bed --out BSIG_final
```

## List duplicate variants
```bash
-plink --noweb --bfile filtered_BSIG --list-duplicate-vars --out duplicate_vars
```

## Merge two datasets 
```bash
plink --noweb --bfile filtered_BSIG --bmerge dk3a_hg19/dk3a_filter.bed dk3a_hg19/dk3a_filter.bim dk3a_hg19/dk3a_filter.fam  --make-bed --out merged
```

## Remove duplicates
```bash
plink --noweb --bfile merged --list-duplicate-vars ids-only suppress-first
plink --noweb --bfile merged --exclude plink.dupvar --make-bed --out DupsRemoved.genotypes
```


## keep SNPs only (removes multialleleic variants)
```bash
plink --noweb --bfile ../merged --snps-only just-acgt --make-bed --out merged_final
```


## create Ped and map files
```bash
plink --noweb --bfile data --recode --tab --out data
```

# Split Dataset by Chromosome and Convert to VCF

## Make one file for each chromosome
```bash
for chr in {1..22}; do \
  plink --bfile ../filtered_BSIG --chr $chr --make-bed --out filtered_BSIG_chr${chr}; \
done
```
This loop creates a separate .bed/.bim/.fam file for each autosome.

## Convert BED files to VCF format
```bash
for chr in {1..22}; do \
  plink --noweb --bfile filtered_BSIG_chr${chr} --recode vcf --keep-allele-order --out filtered_BSIG_chr${chr}; \
done
```

