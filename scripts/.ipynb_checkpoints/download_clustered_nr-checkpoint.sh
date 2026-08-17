#!/bin/bash
#SBATCH -p sapphire # Partition to submit to (comma separated)
#SBATCH -J diamond # Job name
#SBATCH -n 5 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 10G
#SBATCH -t 01-00:00
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL

cd "$SCRATCH/extavour_lab/Everyone/Rishabh"

mkdir -p db_clustered
cd db_clustered

wget -r -np -nH --cut-dirs=3 \
    ftp://ftp.ncbi.nlm.nih.gov/blast/db/experimental/

gunzip *.tar.gz

for f in *.tar; do
    tar -xf "$f"
done

wget https://ftp.ncbi.nlm.nih.gov/pub/taxonomy/new_taxdump/new_taxdump.zip
unzip new_taxdump.zip