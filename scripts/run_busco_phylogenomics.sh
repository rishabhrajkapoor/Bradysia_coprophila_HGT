#!/bin/bash
#SBATCH -p test # Partition to submit to (comma separated)
#SBATCH -J BUSCO # Job name
#SBATCH -n 50 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 50G
#SBATCH -t 00-06:00
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL

cd BUSCO_phylogenomics
module load python/3.10.13-fasrc01   

conda activate ./BUSCO_phylogenomics

python3 BUSCO_phylogenomics.py -i '../sciarid_species_tree/BUSCO_outputs' -o '../sciarid_species_tree/BUSCO_alignment_iqtree' -t 50