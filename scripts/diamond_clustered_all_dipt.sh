#!/bin/bash
#SBATCH -p serial_requeue # Partition to submit to (comma separated)
#SBATCH -J diamond # Job name
#SBATCH -n 110 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 100G
#SBATCH -t 01-00:00
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
echo $1
singularity exec /cvmfs/singularity.galaxyproject.org/d/i/diamond:2.2.0--he361c42_0 diamond blastp --db "$SCRATCH/extavour_lab/Everyone/Rishabh/db_clustered/nr_cluster_seq"  --query "/n/netscratch/extavour_lab/Everyone/Rishabh/ncbi_dataset/data/$1/longest_isoform.fasta" --out "$SCRATCH/extavour_lab/Everyone/Rishabh/diamond_clustered_dipteran_results/$1_out" --outfmt 6 qseqid sseqid stitle staxids sscinames sphylums skingdoms slineages pident length mismatch gapopen qstart qend sstart send evalue bitscore qcovhsp --threads 110 --evalue .01 --very-sensitive -k 2000
