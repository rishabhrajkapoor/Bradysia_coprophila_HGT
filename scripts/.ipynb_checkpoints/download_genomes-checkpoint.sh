#!/bin/bash
cd "$SCRATCH/extavour_lab/Everyone/Rishabh/"
curl -OJX GET "https://api.ncbi.nlm.nih.gov/datasets/v2alpha/genome/accession/$1/download?include_annotation_type=GENOME_GFF&include_annotation_type=PROT_FASTA&hydrated=FULLY_HYDRATED"

unzip -o ncbi_dataset.zip
rm ncbi_dataset.zip