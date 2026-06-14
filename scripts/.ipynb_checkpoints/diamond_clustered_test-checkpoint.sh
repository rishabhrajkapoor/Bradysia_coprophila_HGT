#!/bin/bash
#SBATCH -p test # Partition to submit to (comma separated)
#SBATCH -J diamond # Job name
#SBATCH -n 110 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 500G
#SBATCH -t 00-07:59
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
singularity exec /cvmfs/singularity.galaxyproject.org/d/i/diamond:2.2.0--he361c42_0 diamond blastp --db "$SCRATCH/extavour_lab/Everyone/Rishabh/db_clustered/nr_cluster_seq"  --query "ncbi_dataset/data/GCF_014529535.2/longest_isoform.fasta" --out "$SCRATCH/extavour_lab/Everyone/Rishabh/diamond_clustered_results" --outfmt 6 qseqid sseqid stitle staxids sscinames sphylums skingdoms slineages pident length mismatch gapopen qstart qend sstart send evalue bitscore qcovhsp --threads 110 --evalue .01 --very-sensitive -k 2000