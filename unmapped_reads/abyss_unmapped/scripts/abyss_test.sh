#!/bin/bash

#SBATCH --output=log/abyss_T6.out
#SBATCH --error=log/abyss_T6.err
#SBATCH --account=yoderlab
#SBATCH --partition=yoderlab
#SBATCH --mem=100G
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kania.hannah@duke.edu

# Load earlgrey
source /hpc/home/hpk4/miniconda3/etc/profile.d/conda.sh
conda activate abyss

for kc in 2 3; do
	for k in `seq 90 8 120`; do
		mkdir /work/hpk4/abyss_unmapped/test/k${k}-kc${kc}
		abyss-pe -C /work/hpk4/abyss_unmapped/test/k${k}-kc${kc} name=AM10 B=50G k=$k kc=$kc in='/work/hpk4/abyss_unmapped/fasta/Am10_S43.unmapped.R1.fastq.gz /work/hpk4/abyss_unmapped/fasta/Am10_S43.unmapped.R2.fastq.gz'
	done
done
abyss-fac /work/hpk4/abyss_unmapped/test/k*/AM10-scaffolds.fa
