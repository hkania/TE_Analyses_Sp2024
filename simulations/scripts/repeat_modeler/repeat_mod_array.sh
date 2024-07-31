#!/bin/bash

#SBATCH --array=1-4%4 #run an array of length 4, with max 4 array tasks at once, can change
#SBATCH --mem=10G #10G of memory per array task
#SBATCH --nodes=1 #nodes per task
#SBATCH --ntasks-per-node=16 #tasks per node (or 'threads')
#SBATCH --time=72:00:00 #3 days max job time
#SBATCH --output=log/test.array.RM_%A_%a.out #output file with specific array noted
#SBATCH --error=log/test.array.RM_%A_%a.err #error file with specific array noted
#SBATCH --partition=common #perform on the common partition
#SBATCH --mail-type=ALL #set up mailing for notification
#SBATCH --mail-user=hpk4@duke.edu #specify email address

## This script runs Repeat Modeler over a set of fastas
## with repeat content. The output is typical Repeat Modeler files.
## After this is complete, you should run directory_rename.sh in order to change
## the RM_ directories to match the database names prior to running Repeat Masker and other
## downstream analyses. It cleans everything up so you know which outputs correspond to
## which fasta files.

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

#load required module
module load Perl/5.34.1-rhel8

#SET UP REPEAT DETECTION
echo "##Build database ...."
date

/hpc/group/yoderlab/hpk4/repeat_modeler/RepeatModeler-2.0.5/BuildDatabase -name ${database} ${array}

echo "##Database finished"
date

#Run RepeatModeler
echo "##Run RepeatModeler ......"
date

/hpc/group/yoderlab/hpk4/repeat_modeler/RepeatModeler-2.0.5/RepeatModeler -database ${database} -threads 16 -engine ncbi -LTRStruct

echo "RepeatModler Run finished"
date

echo -e "\n## Done with script."
date
