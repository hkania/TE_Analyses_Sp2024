# Environments
The following files are environment yamls (for miniconda) or descriptive files (not miniconda) for copying of the environments used in our benchmarking analyses. If it is a .yaml, simply run `conda env create --file=(XXX).yaml` within base conda.

### 1. EDTA.yaml
### 2. earlgrey4.4.0.yaml
* *NOTE:* EarlGrey was configured to use RepeatMasker version 4.1.7 to mirror the capabilities of RepeatModeler2.
* To update:
  * You must first delete RepeatMasker in `earlgrey4.4.0/share/`
  * Then, copy the RepeatMasker 4.1.7 directory that RepeatModeler2.0.5 points to into `earlgrey4.4.0/share/`
  * Lastly, use perl to configure the new RepeatMasker by running `perl ./configure` inside of the new RepeatMasker directory in `/earlgrey4.4.0/share/`
### 3. mapping_calling.yaml
### 4. ncbi_blast.yaml
### 5. repeatmodeler2.0.5.txt
* A descriptive file explaining how RepeatModeler2.0.5 was installed. Specific directions are not included, but resources to install are!
* It includes resources for downloading RepeatMasker 4.1.7, as well as all Dfam partitions.
* Configure this environment prior to EarlGrey to make it easier to set up EarlGrey with an updated RepeatMasker.
### 6. seqkit.yaml
### 7. trimmomatic.yaml
