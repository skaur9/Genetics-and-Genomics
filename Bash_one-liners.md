
# Useful Bash One-Liners for Bioinformatics and Data Processing

## Print the first line (header) of your file:
```bash
cat data.tsv | head -1
```

## Convert tabs to newlines using tr, and number each column:
```bash
cat data.tsv | head -1 | tr "\t" "\n" | cat -n
```

## Sum of one column:
```bash
awk 'BEGIN {FS = "\t"} ; {sum+=$3} END {print sum}' sample_01-02.mirna
```

## Count how many times a value is repeated:
```bash
awk '{start[$1]++} END {for(i in start) print i" "start[i]}' filename
```

## Print selected columns from same length files:
```bash
paste \
  <(awk '{print $1"\t"$2}' geneIDCounts.sample1.txt) \
  <(awk '{print $2}' geneIDCounts.sample2.txt) \
  <(awk '{print $2}' geneIDCounts.sample3.txt) \
  <(awk '{print $2}' geneIDCounts.sample4.txt) \
  <(awk '{print $2}' geneIDCounts.sample5.txt) \
  <(awk '{print $2}' geneIDCounts.sample6.txt) \
  <(awk '{print $2}' geneIDCounts.sample7.txt) \
  <(awk '{print $2}' geneIDCounts.sample8.txt) \
  <(awk '{print $2}' geneIDCounts.sample9.txt) \
  <(awk '{print $2}' geneIDCounts.sample10.txt) > read_counts_all_samples.txt
```

## Join two files based on one common column:
```bash
# Join based on column 1 in both files
join -j 1 114_samples.txt Glodko_106_samples.txt > 106_samples.txt
```

## Shuffle a file and print top 100 lines:
```bash
shuf 15957_non_T1D_T2D_islet_exp_genes.txt | head -100
```

## Grep keywords from a file:
```bash
grep -Ff 50_lipids_change_over_time.txt 6_months_log_delta.QuantileNormalized.CovariatesRemoved.txt > 6_months_50_lipids
```

## Capture command output while also viewing it live:
```bash
command |& tee outputfile.txt
```

## Extract any specific line using sed (Replace N with line number):
```bash
sed -n 'Np' data.txt
sed -n '2p' data.txt  # Extract 2nd line
```

## Convert comma-separated file to tab and print selected columns:
```bash
sed 's/,/\t/g' GSA-24v3-0_A1_b151_rsids.txt | awk '{print $1"\t"$2}' > GSA-24v3_update_map.txt
```

## Use csvcut for cleaner tabular output:
```bash
csvcut -nt -l data.txt
```

## Additional Examples

### Count unique values in a column:
```bash
cut -f1 file.txt | sort | uniq -c | sort -nr
```

### Replace string in multiple files:
```bash
find . -name "*.txt" -exec sed -i 's/old/new/g' {} +
```

### Parallel gzip compression:
```bash
ls *.fastq | parallel gzip
```

### Monitor resource usage of a command:
```bash
time -v your_command.sh
```

### List top 10 largest files:
```bash
du -ah . | sort -rh | head -10
```

### Remove empty lines:
```bash
sed '/^$/d' file.txt > cleaned.txt
```
