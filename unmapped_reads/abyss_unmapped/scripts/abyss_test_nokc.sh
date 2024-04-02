#!/bin/bash

#SBATCH --output=log/abyss_Tnokc.out
#SBATCH --error=log/abyss_Tnokc.err
#SBATCH --account=yoderlab
#SBATCH --partition=yoderlab
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kania.hannah@duke.edu

# Load earlgrey
source /hpc/home/hpk4/miniconda3/etc/profile.d/conda.sh
conda activate abyss

mkdir /work/hpk4/abyss_unmapped/test/nokc1

abyss-pe -C /work/hpk4/abyss_unmapped/test/nokc1 name=AM10 B=50G k=90 in='/work/hpk4/abyss_unmapped/fasta/Am10_S43.unmapped.R1.fastq.gz /work/hpk4/abyss_unmapped/fasta/Am10_S43.unmapped.R2.fastq.gz'

abyss-fac /work/hpk4/abyss_unmapped/test/nokc1/AM10-scaffolds.fa
