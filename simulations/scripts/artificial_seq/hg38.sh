#!/bin/bash

#SBATCH --mem=10G  # adjust as needed
#SBATCH --partition=scavenger
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kania.hannah@duke.edu

perl bin/createModel.pl -v -m hum38 -f /cwork/hpk4/genome_UCSC_test/hg38/hg38.fa -r /cwork/hpk4/genome_UCSC_test/hg38/hg38.fa.align -t /cwork/hpk4/genome_UCSC_test/hg38/hg38.trf.bed -g /cwork/hpk4/genome_UCSC_test/hg38/hg38.ensGene.gtf
