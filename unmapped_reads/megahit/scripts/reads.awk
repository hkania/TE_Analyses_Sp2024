BEGIN {
	OFS="\t"
	print "Read_1_location Read_2_location Paired_1_location Paired_2_location Unpaired_1_location Unpaired_2_location"
}

# for every entry, print read1 location, read2 location, paired 1 location ,paired 2 location, unpaired 1 location, unpaired 2 location

{print "/datacommons/yoderlab/users/CAROSEG/Petriky_mistery/MALARIA/Unmapped_reads/" $1 ".R1.fastq.gz", "/datacommons/yoderlab/users/CAROSEG/Petriky_mistery/MALARIA/Unmapped_reads/" $1 ".R2.fastq.gz", "/cwork/hpk4/megahit/trimmed/" $1 "_1_paired.fastq.gz", "/cwork/hpk4/megahit/trimmed/" $1 "_2_paired.fastq.gz", "/cwork/hpk4/megahit/trimmed/" $1 "_1_unpaired.fastq.gz", "/cwork/hpk4/megahit/trimmed/" $1 "_2_unpaired.fastq.gz"}
