#!/bin/bash

#SBATCH --output=log/megahit_P1.out
#SBATCH --error=log/megahit_P1.err
#SBATCH --account=yoderlab
#SBATCH --partition=yoderlab
#SBATCH --mem=32G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kania.hannah@duke.edu

#run megahit

/datacommons/yoderlab/programs/MEGAHIT-1.2.9-Linux-x86_64-static/bin/megahit \
	-1 /datacommons/yoderlab/users/CAROSEG/Petriky_mistery/MALARIA/Unmapped_reads/P1_S17.unmapped.R1.fastq.gz \
	-2 /datacommons/yoderlab/users/CAROSEG/Petriky_mistery/MALARIA/Unmapped_reads/P1_S17.unmapped.R1.fastq.gz \
	-o /work/hpk4/megahit/petriky1/P1_S17_assembly
