#!/bin/bash

#SBATCH --mem=10G  # adjust as needed
#SBATCH --partition=scavenger
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kania.hannah@duke.edu
#SBATCH --output=log/dm6_100Mb.out
#SBATCH --error=log/dm6_100Mb.err

perl bin/createFakeSequence.pl -m dros6 -s 100000000 -o test_dm6_jun18_100Mb -v -N 3 --align --write_base
