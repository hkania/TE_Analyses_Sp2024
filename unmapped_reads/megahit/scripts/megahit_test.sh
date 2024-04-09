#!/bin/bash

#SBATCH --output=log/megahit_T1.out
#SBATCH --error=log/megahit_T1.err
#SBATCH --account=yoderlab
#SBATCH --partition=yoderlab
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kania.hannah@duke.edu

#run megahit

/datacommons/yoderlab/programs/MEGAHIT-1.2.9-Linux-x86_64-static/bin/megahit \
	-1 /work/hpk4/megahit/fasta/Am10_S43.unmapped.R1.fastq.gz \
	-2 /work/hpk4/megahit/fasta/Am10_S43.unmapped.R2.fastq.gz -o /work/hpk4/megahit/test/Am10_S43_assembly
