
#!/bin/bash
#SBATCH -p sapphire # Partition to submit to (comma separated)
#SBATCH -J diamond # Job name
#SBATCH -n 110 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 500G
#SBATCH -t 01-00:00
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
singularity exec /cvmfs/singularity.galaxyproject.org/d/i/diamond:2.2.0--he361c42_0 diamond blastp --db "$SCRATCH/extavour_lab/Everyone/Rishabh/combined_sciarid"  --query "outputs/DIAMOND_htgs.fasta" --out "$SCRATCH/extavour_lab/Everyone/Rishabh/sciarid_diamond_htg_search"  --outfmt 6 qseqid sseqid stitle pident length mismatch gapopen qstart qend sstart send evalue bitscore qcovhsp --threads 110 --evalue .01 --very-sensitive -k 2000


