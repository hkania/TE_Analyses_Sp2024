#!/bin/bash

#SBATCH --array=1-2%2 #this does two array tasks, and the % means the cluster will only run 2 at a time
#SBATCH --mem=10G #mem per task
#SBATCH --nodes=1 #nodes per task
#SBATCH --ntasks-per-node=16 #tasks per node (or 'threads')
#SBATCH --time=50:00:00 #how long to go until time out
#SBATCH --output=log/test.array.RM_%A_%a.out
#SBATCH --error=log/test.array.RM_%A_%a.err
#SBATCH --partition=yoderlab
#SBATCH --account=yoderlab
#SBATCH --mail-type=ALL
#SBATCH --mail-user=hpk4@duke.edu

#Build array, this will be the list of input fasta files for the job
metafile=/cwork/hpk4/temp_simulations/repeat_modeler/test/myo_luc_paths.txt #file with all full paths to fastas you want to run RepeatModeler2.0.5 on
array=$(cat ${metafile} | sed -n ${SLURM_ARRAY_TASK_ID}p) #make the array from the file

#Define the database name, takes each fasta path listed in the array and prints out the suffix minus the .fasta
database=$(grep ${array} ${metafile} | sed "s@.*/@@" | sed "s/\.fasta$//") #command will take the full file path and provide the short name for the database

#echo Job Characteristics
echo "##Array fasta path for job: ${array}"
echo "##Database for job: ${database}"
echo "Array Job ID: $SLURM_ARRAY_JOB_ID"
echo "Job ID: $SLURM_JOB_ID"
echo "Task ID: $SLURM_ARRAY_TASK_ID"

#load required module
module load Perl/5.34.1-rhel8 #need this in order to run RepeatModeler on the cluster

#SET UP REPEAT DETECTION
echo "Build database ...."
date

/hpc/group/yoderlab/hpk4/repeat_modeler/RepeatModeler-2.0.5/BuildDatabase -name ${database} ${array} #build the database for each slurm task (ie. each fasta file in the metafile variable)

echo "Database finished"
date

#Run RepeatModeler
echo "Run RepeatModeler ......"
date

/hpc/group/yoderlab/hpk4/repeat_modeler/RepeatModeler-2.0.5/RepeatModeler -database ${database} -threads 16 -engine ncbi #runs RepeatModeler on each database

echo "RepeatModler Run finished"
date

echo -e "\n## Done with script."
date
