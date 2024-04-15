# Unmapped_Reads

Below are descriptions of the sub-directories within the unmapped_reads directory.

## TE_blast
### metadata
* The metadata directory within TE_blast incudes two text files. The first is a text file with 10 assembly paths used for a first pass trial. Once that trial was confirmed, the workflow was performed on all samples. The second is a text file with the full assembly paths for all samples (excluding the 10 used as a first trial pass).
* These paths are referenced by ncbi_blast.sh in the scripts directory. They allow for an array of jobs to be scheduled to run blast on x number of files all at once.

### scripts
* The scripts directory within TE_blast includes on bash script. It calls upon a .txt file in the metadata folder to run an array of jobs across the specified assembly files.
* If re-running the script on new assemblies, one needs to change:
  * the path to the metadata folder in the alignment variable
  * the array values in SBATCH to mirror the correct numbe of samples
  * conda environment (unless you are Hannah, you need to make a conda environment with ncbi_blast + installed)
* Make sure the path to repbase_ncbi is specified in relation to the directory in which the sbatch command is called. Here, it was called in TE_blast.

## abyss_unmapped


## megahit

git config --get remote.origin.url
