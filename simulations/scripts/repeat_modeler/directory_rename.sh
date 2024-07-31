#!/bin/bash

## This script runs through a directory with repeat modeler outputs (which consists of
## folders starting with RM_ and a random set of numbers) and changes the directory names to match
## the name of each database specified in the repeast_array.sh script. These database names
## are built from the metadata file which contains the full path to the fasta in the Garlic program
## folder. At the end, you have RM output folders titled after which fasta was used which will
## allow for easier repeat masker runs.

repeat_modeler_output_dir=/cwork/hpk4/temp_simulations/repeat_modeler #full path to umbrella directory

for folder in ${repeat_modeler_output_dir}/RM* #for each RM directory within the umbrella directory
do
	database=$(head ${folder}/rmod.log -n 11 | tail -n 1 | sed "s@.*/@@" | sed "s/\   - Sequences = 1$//") #specify the new database name
	echo "Database:"
	echo ${database} #echo the database name

	echo "Folder:"
	echo ${folder} #echo the repeat modeler folder containing this database's output

	new_path=/cwork/hpk4/temp_simulations/repeat_modeler/${database}_RM #specify the new directory path
	echo "New path:"
	echo ${new_path} #echo the new directory path
	mv ${folder} ${new_path} #move the old directory to the new directory so al directories are now database_RM
done
