##Update variant information

##Update the rsids in a bim file based on the array file 
plink --noweb --bfile BSIG_Juli2020 --update-name GSA-24v2_update_map.txt 2 1 --make-bed --out BSIG_update_name

## Update empty rsids with chr:pos
plink --noweb --bfile filtered_BSIG --set-missing-var-ids @:#[b37]\$1,\$2 --make-bed --out BSIG_final

## List duplicate variants
-plink --noweb --bfile filtered_BSIG --list-duplicate-vars --out duplicate_vars

## Remove duplicates
plink --noweb --bfile merged_final --list-duplicate-vars ids-only suppress-first
plink --noweb --bfile merged_final --exclude plink.dupvar --make-bed --out DupsRemoved.genotypes


## Filter a dataset with MAF, GENO and MIND
plink --noweb --bfile BSIG_update_name --chr 1-24 --geno 0.1 --maf 0.05 --hwe 0.001 --mind 0.05 --make-bed --out filtered_BSIG

## Merge two datasets 
plink --noweb --bfile filtered_BSIG --bmerge dk3a_hg19/dk3a_filter.bed dk3a_hg19/dk3a_filter.bim dk3a_hg19/dk3a_filter.fam  --make-bed --out merged

## keep SNPs only (removes multialleleic variants)
plink --noweb --bfile ../merged_data --snps-only just-acgt --make-bed --out merged_final

## create Ped and map files
plink --noweb --bfile dk3a_filtered --recode --tab --out dk3a_filtered_

## basic association
plink --noweb --bfile dk3a_filtered --assoc --out dk3a_filtered_assoc



################################
### make one file for each chr

for chr in {1..22}; do \
plink --bfile ../filtered_BSIG --chr $chr --make-bed --out filtered_BSIG_chr${chr}; \
done

## make vcf files

for chr in {1..22}; do \
plink --noweb --bfile filtered_BSIG_chr${chr} --recode vcf --keep-allele-order --out filtered_BSIG_chr${chr};\
done
