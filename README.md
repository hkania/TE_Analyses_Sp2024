# TE_Analyses_Sp2024

See the project [wiki](https://github.com/hkania/TE_Analyses_Sp2024/wiki).

Transposable elements (TEs) are selfish genetic units that amplify their own replication within the genome of a host. Some refer to TEs as parasitic due to the nature of their propagation. TEs have been implicated in driving evolutionary patterns from genetic novelty, including placentas in mammals, to reproductive isolation, such as driving incompatibilities between closely related Drosophila species. Much of what is collectively understood about TEs comes from empirical studies in model organisms. However, there is a dearth of knowledge concerning the role of TEs in wild systems, especially as they relate to the process of speciation. I will investigate the putative role(s) of TEs in the speciation process of mouse lemurs, which are thought to have radiated into tens of species in the last 1.5 million years. I will start by identifying TEs within my study genomes. 

De novo modeling pipelines for identifying TEs in genomes include well known RepeatModeler and EDTA. I will use EarlGrey, a newly developed pipeline that takes advantage of RepeatModeler and adds additional steps to return further curated TE sequences. Importantly, a comprehensive benchmarking paper for de novo TE annotation pipelines has not been established. This can make it tricky to decide which software to use when working with new genomes. 

**Consequently, there are two relevant challenges I will address in my final project for Biology 724D Spring 2024.** 

First, I aim to blast the unmapped reads from whole genome short read sequences against the Dfam or Rebpase databases and/or send them through a TE annotation pipeline. 
* Dfam is an open-access database including over 25,000 curated TE families from more than 2,000 species. Repbase is another popular option, albeit proprietary, with over 80,000 TE families from more than 1,600 species.
* I have short-read genome assemblies from 96 mouse lemurs that were mapped to the current Microcebus murinus reference genome. If any of the sequences belong to a non-murinus individual, or if a murinus individual has a TE that is not identified in the current reference genome, due to different evolutionary histories, then TEs that are not specific to murinus may be present in unmapped reads.  

Second, I aim to benchmark the current de novo TE annotation pipelines. 
* My challenge will be to develop a pipeline to simulate genomes that represent various organisms, such as mammals or invertebrates. I am working with an undergraduate to test these pipelines. Our plan is to use biological genomes that are well annotated for TEs in combination with simulated genomes. We need simulated genomes to identify when pipelines accurately identify TEs, including false negatives and positives.
* (An additional consideration would be to simulate differences in read quality to gain perspective on how different assembly qualities affect the accuracy of TE annotation pipelines.) 
