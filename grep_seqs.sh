#!/bin/bash

# pass the script
# 1) the fastq.gz with reads to search
# 2) the fasta with sequences that you want to check for
# 3) the name of the output file

# Does a simple grep for all AbSeq (or other) sequences in the fasta file.
# Obviously this will not match the pipeline output given all the filtering and denoising that goes on there,
# but it should give an instant idea of whether or not there was contamination.

fq=$1
ab=$2
out=$3
temp=${fq}_temp.txt

# make sure any previous output is deleted/moved because we are appending the redirect
mv $out deleteme
mv $temp deletemetoo

while read p; do
    if [[ $p == \>* ]]
    then
        echo $p
        echo $p >> $temp;
    else
        zcat $fq | grep $p - | wc -l >> $temp
    fi

done < $ab


# Then put the counts in a column next to the sequence name rather than the next row
echo -e "# Searching for ${ab} sequences in ${fq}\n" >> $out
awk '{printf "%s%s",$0,NR%2?"\t":RS}' $temp >> $out

# use gzcat on a Mac

# use samtools if searching a bam instead of a fq
# if you only want to grep on part of a sequence, the substring syntax is ${str:position:length}
# samtools view $bam | grep ${p:40:25} - | wc -l >> $out
