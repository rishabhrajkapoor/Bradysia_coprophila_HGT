#!/bin/bash
#SBATCH -p sapphire # Partition to submit to (comma separated)
#SBATCH -J diamond # Job name
#SBATCH -n 30 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 30G
#SBATCH -t 00-04:00
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
cd ncbi_dataset/data/$1
singularity exec /cvmfs/singularity.galaxyproject.org/g/f/gffread:0.12.9--hf426362_0 \
gffread braker.gtf -g *.fna -y protein.faa