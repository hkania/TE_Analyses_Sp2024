#!/bin/bash

#SBATCH --mem=5G  # adjust as needed
#SBATCH --partition=scavenger
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kania.hannah@duke.edu
#SBATCH --output=log/hg38_100Mb_fin.out
#SBATCH --error=log/hg38_100Mb_fin.err

perl bin/createFakeSequence.pl -m hum38 -s 100000000 -o hg38_100Mb_10 -v -N 10 --align --write_base
