#!/bin/bash

#SBATCH --array=1-12%2 #run an array of length 12, with max 2 array tasks at once, can change
#SBATCH --nodes=1 #nodes per task
#SBATCH --ntasks-per-node=16 #tasks per node (or 'threads')
#SBATCH --output=log/masker.array_%A_%a.out #output file with specific array noted
#SBATCH --error=log/masker.array_%A_%a.err #error file with specific array noted
#SBATCH --account=yoderlab
#SBATCH --partition=yoderlab #perform on the yoderlab partition
#SBATCH --mail-type=ALL #set up mailing for notification
#SBATCH --mail-user=hpk4@duke.edu #specify email address

#This script takes a set of repeat modeler output folders and runs repeat masker on the original fasta files with the repeat modeler consensi
#repeat file. You must first run repeat modeler and the corresponding directory_rename.sh script to rename the output
#database (which typically is RM_######).

#Build array, this will be the list of input fasta files for the job
metafile=/cwork/hpk4/temp_simulations/metadata/RM_paths.txt #file with paths to repeat modeler outputs
array=$(cat ${metafile} | sed -n ${SLURM_ARRAY_TASK_ID}p) #set up array of these folders
fasta_paths=/cwork/hpk4/temp_simulations/metadata/all_garlic_fasta_paths.txt #file with list of all file paths to original fastas
database=$(grep ${array} ${metafile} | sed "s@.*/@@"  | sed "s/\_RM$//") #define the database to match the fasta name (ie. dm6_base_1.fasta)

#make directories
echo "##Making output directory for database ${database}"
mkdir -p /cwork/hpk4/temp_simulations/repeat_masker/${database}/mask_outputs #makes directory

#build symbolic links
echo "##Building consensi symbolic link for database ${database}"

ln -s ${array}/consensi.fa.classified /cwork/hpk4/temp_simulations/repeat_masker/${database}/${database}.consensi.fa.classified #consensus repeat file link

cons_symlink=/cwork/hpk4/temp_simulations/repeat_masker/${database}/${database}.consensi.fa.classified #define variable for repeat masker parameter

echo "##Building fasta symbolic link for database ${database}"
fasta_path=$(grep ${database} ${fasta_paths}) #point to correct fasta file
ln -s ${fasta_path} /cwork/hpk4/temp_simulations/repeat_masker/${database}/${database}.fasta #build link to that fasta
fasta_symlink=/cwork/hpk4/temp_simulations/repeat_masker/${database}/${database}.fasta #define variable for repeat masker parameter

echo "##Set-up finished, parameters below:"
echo "##Array file: ${array}"
echo "##Database:  ${database}"
echo "##Consensi symbolic link: ${cons_symlink}"
echo "##Fasta symbolic link: ${fasta_symlink}"

echo "##Run RepeatMasker ..."
date
	/hpc/group/yoderlab/hpk4/repeat_modeler/RepeatMasker/RepeatMasker -pa 16 -gff -a -e rmblast \
	-lib ${cons_symlink} \
	-dir /cwork/hpk4/temp_simulations/repeat_masker/${database}/mask_outputs \
	${fasta_symlink}

echo "##RepeatMasker finished"
echo "Outputs can be found in /cwork/hpk4/temp_simulations/repeat_masker/${database}/mask_outputs"
date
