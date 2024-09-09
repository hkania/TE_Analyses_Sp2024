#!/bin/bash

#SBATCH --mem=5G  # adjust as needed
#SBATCH --partition=scavenger
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kania.hannah@duke.edu
#SBATCH --output=log/myoluc2_100Mb_fin.out
#SBATCH --error=log/myoluc2_100Mb_fin.err

perl bin/createFakeSequence.pl -m myoluc -s 100000000 -o myoluc_100Mb_10 -v -N 10 --align --write_base
