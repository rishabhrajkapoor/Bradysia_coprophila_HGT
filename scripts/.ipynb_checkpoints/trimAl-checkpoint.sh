#!/bin/bash
#SBATCH -p shared # Partition to submit to (comma separated)
#SBATCH -J diamond # Job name
#SBATCH -n 30 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 25G
#SBATCH -t 3-00:00
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=FAIL


cd "outputs/phylogenetic_dataset/$1"


singularity exec /cvmfs/singularity.galaxyproject.org/t/r/trimal:1.4.1--h9f5acd7_7 trimal -in trimmed_MSA_sub_seq.fasta -out trimAl_MSA_sub_seq.fasta -gt 0.6 
