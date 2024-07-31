#!/bin/bash

#SBATCH --array=1-2%2
#SBATCH --mem-per-cpu=1G  # adjust as needed
#SBATCH -c 16 # number of threads per process
#SBATCH --output=log/array.EG_%A_%a.out
#SBATCH --error=log/array.EG_%A_%a.err
#SBATCH --partition=common
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kania.hannah@duke.edu
#SBATCH --time=72:00:00 #3 days max job time

#Build array, this will be the list of input fasta files for the job
metafile=/cwork/hpk4/temp_simulations/metadata/fasta_paths.txt
array=$(cat ${metafile} | sed -n ${SLURM_ARRAY_TASK_ID}p)

#Define the database name, takes each fasta path listed in the array and prints out the suffix minus the .fasta
database=$(grep ${array} ${metafile} | sed "s@.*/@@" | sed "s/\.fasta$//")

#echo Job Characteristics
echo "##Array fasta path for job: ${array}"
echo "##Database for job: ${database}"
echo "##Array Job ID: $SLURM_ARRAY_JOB_ID"
echo "##Job ID: $SLURM_JOB_ID"
echo "##Task ID: $SLURM_ARRAY_TASK_ID"

# Load earlgrey
source /hpc/group/yoderlab/hpk4/miniconda3/etc/profile.d/conda.sh
conda activate earlgrey4.4.0

#Call earlgrey on array of genomes in genome file
echo "##Starting earlgrey ....."
date

earlGrey -g ${array} -s ${database} -o /cwork/hpk4/temp_simulations/earlgrey/outputs -t 16

echo "##EarlGrey finished"
date

echo -e "\n## Done with script."
