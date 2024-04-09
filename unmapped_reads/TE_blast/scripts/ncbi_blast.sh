#!/bin/bash

#SBATCH --array=1-84 #need to change to match number of files
#SBATCH --mem-per-cpu=2G  # adjust as needed
#SBATCH -c 1 # number of threads per process
#SBATCH --output=log/ncbi_array_%A_%a.out
#SBATCH --error=log/ncbi_array_%A_%a.err
#SBATCH --partition=scavenger

#variable with alignment paths
alignment=$(cat /cwork/hpk4/TE_blast/metadata/megahit_assembly_paths_full.txt | sed -n ${SLURM_ARRAY_TASK_ID}p)

#activate conda environment
source /hpc/home/hpk4/miniconda3/etc/profile.d/conda.sh
conda activate ncbi_blast

#send array of assemblies through ncbi_blast
blastn -query ${alignment} -db repbase_ncbi/repbase_ncbi -out ${alignment}_blastn.txt -outfmt 6
