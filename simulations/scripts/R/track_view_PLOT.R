# Adapted from Toby Baril (https://github.com/TobyBaril/EarlGrey/blob/main/scripts/makeGff.R, adapted from IOB-Muenster https://github.com/IOB-Muenster/denovoTE-eval/blob/main/gff_plots/gff_plots.R)

# Plots sequence coordinates from GFF format files in multiple tracks
# This script was run on cleaned GFF files (edited to rename program column to mirror y-axis labels and to remove blank columns)

# Load libraries
library(ggplot2)
library(gridExtra)
library(yaml)
library(svglite)
library(patchwork)

# Read configuration file (the file should match the example .yml with each cleaned GFF file, followed by their label in column 2 of the GFF, then 
# desired colors, and finally details on where to start in base pairs, how long each step between base pair ticks to take, and how many times to repeat that step size)
config <- yaml.load_file("Scripts/config_hg38.yml") #loads the human genome 38 simulation GFF files after cleaning with the cleaning scripts

# Load GFF files
list_gff <- lapply(config$gff, function(x) {as.data.frame(read.csv(x, sep = "\t", header = 0))})

# Config scientific notation
options(scipen = 10000)

# Set up color scheme and labels
sw_labels <- config$labels
sw_colors <- config$colors 
plot_colors <- setNames(sw_colors, sw_labels)

# Function to draw plots in multiple tracks
create_plot <- function(xmin, xmax, list_gff, plot_title) {
  daf <- data.frame()
  
  # Base plot to set coordinates
  base_plot <- ggplot(daf) + geom_point() + 
    coord_cartesian(ylim=c(0.5, 4.5), xlim=c(xmin, xmax), expand=F) + #change this when you alter the number of GFFs in the config file ylim=c(0.5 = # of GFFs + .5)
    scale_y_continuous(limits=c(1, 5), breaks=1:4, labels=sw_labels, #change this when you alter the number of GFFs in the config file limits=c(1, # of GFFs +1)
                       # breaks=1:# of GFF files
                       guide = guide_axis(angle = 0)) 
  
  # Iterate over GFFs to draw each one in a track
  y_pos <- 0
  gplot <- lapply(seq_along(list_gff), function(i){
    x <- list_gff[[i]]
    geom_segment(aes(x=V4, xend=V5, y=i, yend=i, colour=V2),
                 data=subset(x, V4 > xmin & V5 < xmax), linewidth=3, alpha=0.7)
  })
  
  main_plot <- base_plot + 
    do.call("c", gplot) +  
    scale_colour_manual(values = plot_colors) +
    theme(plot.title = element_text(size=10)) +
    theme(axis.text.y = element_text(colour = plot_colors)) +
    theme(axis.title.x = element_text(size=8)) +
    labs(x = "Sequence Position (bp)", #change the labels as you see fit
         title = expression(paste(bold("Figure 2b. "),italic("H. sapiens")," simulated model"))) #change the title as you see fit
  
  main_plot <- main_plot + theme(
    axis.ticks = element_blank(), 
    axis.title.y = element_blank(),
    legend.position = "none",
    plot.margin = unit(c(3, 0.1, 3, 0.1), "cm")
  )
  
  print(main_plot)
  return(main_plot)
}

# Set coordinates for starting point, step and number of plots
start_coor <- config$coor[['start']]
step_size <- config$coor[['step']]
repeats <- config$coor[['repeat']]

# Read configuration file
config2 <- yaml.load_file("Scripts/config_scer.yml") #loads in the S. cerevisiae 3 genome simulation GFFs after cleaning

# Load GFF files
list_gff2 <- lapply(config2$gff, function(x) {as.data.frame(read.csv(x, sep = "\t", header = 0))})

# Config scientific notation
options(scipen = 10000)

# Set up color scheme and labels
sw_labels2 <- config2$labels
sw_colors2 <- config2$colors 
plot_colors2 <- setNames(sw_colors2, sw_labels2)

# Function to draw plots in multiple tracks
create_plot2 <- function(xmin, xmax, list_gff, plot_title) {
  daf <- data.frame()
  
  # Base plot to set coordinates
  base_plot <- ggplot(daf) + geom_point() + 
    coord_cartesian(ylim=c(0.5, 4.5), xlim=c(xmin, xmax), expand=F) +
    scale_y_continuous(limits=c(1, 5), breaks=1:4, labels=sw_labels2, 
                       guide = guide_axis(angle = 0)) 
  
  # Iterate over GFFs to draw each one in a track
  y_pos <- 0
  gplot <- lapply(seq_along(list_gff), function(i){
    x <- list_gff[[i]]
    geom_segment(aes(x=V4, xend=V5, y=i, yend=i, colour=V2),
                 data=subset(x, V4 > xmin & V5 < xmax), linewidth=3, alpha=0.7)
  })
  
  main_plot <- base_plot + 
    do.call("c", gplot) +  
    scale_colour_manual(values = plot_colors2) +
    theme(plot.title = element_text(size=10)) +
    theme(axis.text.y = element_text(colour = plot_colors2)) +
    theme(axis.title.x = element_text(size=8)) +
    labs(x = "Sequence Position (bp)", #change the labels as you see fit
         title = expression(paste(bold("Figure 2a. "),italic("S. cerevisiae")," simulated model"))) #change the title as you see fit
  
  main_plot <- main_plot + theme(
    axis.ticks = element_blank(), 
    axis.title.y = element_blank(),
    legend.position = "none",
    plot.margin = unit(c(3, 0.1, 3, 0.1), "cm")
  )
  
  print(main_plot)
  return(main_plot)
}

# Set coordinates for starting point, step and number of plots
start_coor2 <- config2$coor[['start']]
step_size2 <- config2$coor[['step']]
repeats2 <- config2$coor[['repeat']]

# Read configuration file
config3 <- yaml.load_file("Scripts/config_reads.yml") #loads the long and short read GFFs after cleaning

# Load GFF files
list_gff3 <- lapply(config3$gff, function(x) {as.data.frame(read.csv(x, sep = "\t", header = 0))})

# Config scientific notation
options(scipen = 10000)

# Set up color scheme and labels
sw_labels3 <- config3$labels
sw_colors3 <- config3$colors 
plot_colors3 <- setNames(sw_colors3, sw_labels3)

# Function to draw plots in multiple tracks
create_plot3 <- function(xmin, xmax, list_gff, plot_title) {
  daf <- data.frame()
  
  # Base plot to set coordinates
  base_plot <- ggplot(daf) + geom_point() + 
    coord_cartesian(ylim=c(0.5, 5.5), xlim=c(xmin, xmax), expand=F) +
    scale_y_continuous(limits=c(1, 6), breaks=1:5, labels=sw_labels3, 
                       guide = guide_axis(angle = 0)) 
  
  # Iterate over GFFs to draw each one in a track
  y_pos <- 0
  gplot <- lapply(seq_along(list_gff), function(i){
    x <- list_gff[[i]]
    geom_segment(aes(x=V4, xend=V5, y=i, yend=i, colour=V2),
                 data=subset(x, V4 > xmin & V5 < xmax), linewidth=3, alpha=0.7)
  })
  
  main_plot <- base_plot + 
    do.call("c", gplot) +  
    scale_colour_manual(values = plot_colors3) +
    theme(plot.title = element_text(size=10)) +
    theme(axis.text.y = element_text(colour = plot_colors3)) +
    theme(axis.title.x = element_text(size=8)) +
    labs(x = "Sequence Position (bp)", #change the labels as you see fit
         title = expression(paste(bold("Figure 3. ")," Short & long read alignments")))  #change the title as you see fit
  
  main_plot <- main_plot + theme(
    axis.ticks = element_blank(), 
    axis.title.y = element_blank(),
    legend.position = "none",
    plot.margin = unit(c(3, 0.1, 3, 0.1), "cm")
  )
  
  print(main_plot)
  return(main_plot)
}

# Set coordinates for starting point, step and number of plots
start_coor3 <- config3$coor[['start']]
step_size3 <- config3$coor[['step']]
repeats3 <- config3$coor[['repeat']]
# Iterate over function to create multiple plots
glist <- lapply(seq(1:repeats), function(x){create_plot(start_coor, start_coor + step_size*x, list_gff)})
blist <- lapply(seq(1:repeats2), function(x){create_plot2(start_coor2, start_coor2 + step_size2*x, list_gff2)})
rlist <- lapply(seq(1:repeats3), function(x){create_plot3(start_coor3, start_coor3 + step_size3*x, list_gff3)})
