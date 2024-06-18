#!/bin/bash

#SBATCH --mem=10G
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=50:00:00
#SBATCH --output=log/test.out
#SBATCH --error=log/test.err
#SBATCH --partition=scavenger
#SBATCH --mail-type=ALL
#SBATCH --mail-user=hpk4@duke.edu

#INPUTS
INPUT=dm3_test_out_sequence_nest.fasta #type the output fasta file from the Garlic/python script pipeline
DB=dm3_test_db #type the database name you'd like to use for the run

#load required module
module load Perl/5.34.1-rhel8

#SET UP REPEAT DETECTION
echo "Build database ...."
time  /hpc/group/yoderlab/hpk4/repeat_modeler/RepeatModeler-2.0.3/BuildDatabase -name ${DB} ${INPUT}

echo "Run RepeatModeler ......"
time  /hpc/group/yoderlab/hpk4/repeat_modeler/RepeatModeler-2.0.3/RepeatModeler -database ${DB} -pa 16 -engine ncbi

#build symbolic link
ln -s RM_*/consensi.fa.classified ./

echo "Run RepeatMasker ..."
time  /hpc/group/yoderlab/hpk4/repeat_modeler/RepeatMasker/RepeatMasker -pa 16 -gff -lib consensi.fa.classified ${INPUT}
