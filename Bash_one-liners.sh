## Print the first line (header) of your file:
cat data.tsv | head -1

## Convert tabs to newlines using tr, and number each column with cat -n
cat data.tsv | head -1 | tr "\t" "\n" | cat -n

## Sum of one column
awk 'BEGIN {FS = "\t"} ; {sum+=$3} END {print sum}' sample_01-02.mirna

## Count how many time a value is reapeated
awk '{start[$1]++$1}END{for(i in start) print i" "start[i]}' filename

## Print selected columns from same length files
paste <(awk '{print $1"\t"$2}' geneIDCounts.sample1.txt) <(awk '{print $2}' geneIDCounts.sample2.txt) <(awk '{print $2}' geneIDCounts.sample3.txt) <(awk '{print $2}' geneIDCounts.sample4.txt) <(awk '{print $2}' geneIDCounts.sample5.txt) <(awk '{print $2}' geneIDCounts.sample6.txt) <(awk '{print $2}' geneIDCounts.sample7.txt) <(awk '{print $2}' geneIDCounts.sample8.txt) <(awk '{print $2}' geneIDCounts.sample9.txt) <(awk '{print $2}' geneIDCounts.sample10.txt) >read_counts_all_samples.txt

## Join two files based on one common column
# Join based on column 1 in both files
join -j 1 114_samples.txt Glodko_106_samples.txt >106_samples.txt

## Shuffle a file and print top 100 lines 
shuf 15957_non_T1D_T2D_islet_exp_genes.txt |head -100

###### Grep keywords from a file
grep -Ff 50_lipids_change_over_time.txt 6_months_log_delta.QuantileNormalized.CovariatesRemoved.txt >6_months_50_lipids

#### capture command output while also viewing it live
command |& tee outputfile.txt

## Extract any specific line using sed (Replace N with any number)
cat data.txt | sed -n 'Np'
cat data.txt | sed -n '2p' #Extract 2nd line

## Covert a comma seperated file with tab and print selected columns (col1 and col2 in the below example)
sed 's/,/\t/g' GSA-24v3-0_A1_b151_rsids.txt |awk '{print $1"\t"$2}' >GSA-24v3_update_map.txt

## Use csvcut for cleaner output
csvcut -nt -l data.txt

