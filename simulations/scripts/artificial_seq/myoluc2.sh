#!/bin/bash

#SBATCH --mem=10G  # adjust as needed
#SBATCH --partition=scavenger
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kania.hannah@duke.edu

perl bin/createModel.pl -v -m myoluc -f /cwork/hpk4/genome_UCSC_test/myoLuc2/myoLuc2.fa -r /cwork/hpk4/genome_UCSC_test/myoLuc2/myoLuc2.fa.align -g /cwork/hpk4/genome_UCSC_test/myoLuc2/myoLuc2.ensGene.gtf -t /cwork/hpk4/genome_UCSC_test/myoLuc2/myoLuc2.trf.bed

