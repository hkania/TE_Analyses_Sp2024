# GARLIC GFF File Generation
The current version of GARLIC (v1.4 updated to mirror v1.5 with zero-based approach) does not generate GFF files describing where inserted repeats are
within simulated repeat-rich sequences. 

`gff_generation.sh` uses generic linux commands and ncbi_blast+ executables in a conda environment to parse through output error files (not actually
errors, but where SLURM stores the output of running GARLIC's createModel.pl with perl) and returns a GFF-formatted file including the locations of all TEs
including nested TEs.

### **BEFORE RUNNING** 
* If you generated more than one sequence in a GARLIC createFakeSequence.pl run, you MUST divide the output FASTA files (base sequences and
simulatd-repeat containing sequences) into individual FASTA files. You can do so by running seqkit.
* To run seqkit, simply activate the environment and run `seqkit split -i (GARLIC_header).fasta` & `seqkit split -i (GARLIC_header).base.fasta`
* For the outputs to run with the included GFF generation file, you must ensure that the output seqeuences follow the nomenclature described at the top of the generation file.
* Otherwise, the script will be unable to find your files!
