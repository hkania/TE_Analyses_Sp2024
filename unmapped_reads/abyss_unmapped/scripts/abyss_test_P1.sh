#!/bin/bash

#SBATCH --output=log/abyss_P1.out
#SBATCH --error=log/abyss_P1.err
#SBATCH --account=yoderlab
#SBATCH --partition=yoderlab
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kania.hannah@duke.edu

# Load earlgrey
source /hpc/home/hpk4/miniconda3/etc/profile.d/conda.sh
conda activate abyss

mkdir /work/hpk4/abyss_unmapped/P1

abyss-pe -C /work/hpk4/abyss_unmapped/P1 name=P1 B=50G k=90 \
in='/datacommons/yoderlab/users/CAROSEG/Petriky_mistery/MALARIA/Unmapped_reads/P1_S17.unmapped.R1.fastq.gz /datacommons/yoderlab/users/CAROSEG/Petriky_mistery/MALARIA/Unmapped_reads/P1_S17.unmapped.R2.fastq.gz'

abyss-fac /work/hpk4/abyss_unmapped/P1/P1-scaffolds.fa
