# This code updates the V2 column of a GFF file to match the y-axis labels on the final GFF track plot

# load libraries
library(dplyr)
library(tidyr)

# Input
input <- "~/Desktop/Graduate2024_25/Coding/Benchmarking/GFFs/Hg38/hg38_7_EGV2.gff" #original GFF file
output <- "~/Desktop/Graduate2024_25/Coding/Benchmarking/GFFs/Hg38/hg38_7_EGV2.gff"#clean GFF file
newV2 <- "EarlGrey (1.00)" #y-axis label for final track plot

update_gff_v2 <- function(input_file, name, output_file) {
  # Read the GFF file
  gff_data <- read.table(input_file, header = FALSE, sep = "\t", comment.char = "#", stringsAsFactors = FALSE)
  
  # Update the V2 column (which is the 2nd column in a GFF file)
  gff_data[, 2] <- name
  
  # Write the updated GFF data to a new file
  write.table(gff_data, file = output_file, sep = "\t", quote = FALSE, col.names = FALSE, row.names = FALSE)
}

# Run script
update_gff_v2(input, newV2, output)
