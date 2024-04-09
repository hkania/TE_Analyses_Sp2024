#!/bin/bash

#SBATCH --output=log/megahit_P1_SE.out
#SBATCH --error=log/megahit_P1_SE.err
#SBATCH --account=yoderlab
#SBATCH --partition=yoderlab
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kania.hannah@duke.edu

#run megahit

/datacommons/yoderlab/programs/MEGAHIT-1.2.9-Linux-x86_64-static/bin/megahit \
	-1 /datacommons/yoderlab/users/epaietta/virustranscriptome/CARO_data/trimmed/P1_1_paired.fastq.gz \
	-2 /datacommons/yoderlab/users/epaietta/virustranscriptome/CARO_data/trimmed/P1_2_paired.fastq.gz \
	-r /datacommons/yoderlab/users/epaietta/virustranscriptome/CARO_data/trimmed/P1_1_unpaired.fastq.gz,/datacommons/yoderlab/users/epaietta/virustranscriptome/CARO_data/trimmed/P1_2_unpaired.fastq.gz \
	-o /work/hpk4/megahit/petriky1/P1_S17_SE_assembly
