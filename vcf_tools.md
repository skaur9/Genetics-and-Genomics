## VCF/BCF Tools

### View the contents of a VCF file
```bash
bcftools view sample.vcf.gz | less -S
```

### Index a compressed VCF file
```bash
bgzip sample.vcf
tabix -p vcf sample.vcf.gz
```

### Filter variants by quality and depth
```bash
bcftools filter -i 'QUAL>30 && DP>10' input.vcf.gz -Oz -o filtered.vcf.gz
```

### Extract specific regions
```bash
bcftools view -r chr1:100000-200000 input.vcf.gz -Oz -o region_chr1.vcf.gz
```

### Convert VCF to BCF
```bash
bcftools view -O b -o output.bcf input.vcf.gz
```

### Subset samples
```bash
bcftools view -s sample1,sample2 input.vcf.gz -Oz -o subset.vcf.gz
```

### Annotate VCF with INFO fields from another VCF
```bash
bcftools annotate -a annotations.vcf.gz -c INFO input.vcf.gz -Oz -o annotated.vcf.gz
```

---

## Handy VCFtools examples

### Basic statistics
```bash
vcftools --gzvcf input.vcf.gz --site-mean-depth
vcftools --gzvcf input.vcf.gz --site-quality
```

### Filter by minor allele frequency
```bash
vcftools --gzvcf input.vcf.gz --maf 0.05 --recode --out filtered_maf
```

### Remove indels
```bash
vcftools --gzvcf input.vcf.gz --remove-indels --recode --out no_indels
```

### Extract SNPs only
```bash
vcftools --gzvcf input.vcf.gz --remove-indels --recode --out snps_only
```

### Calculate missingness
```bash
vcftools --gzvcf input.vcf.gz --missing-indv
vcftools --gzvcf input.vcf.gz --missing-site
