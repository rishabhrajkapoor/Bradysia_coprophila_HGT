#!/bin/bash
#SBATCH -p test # Partition to submit to (comma separated)
#SBATCH -J diamond # Job name
#SBATCH -n 110 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 30G
#SBATCH -t 00-07:50
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
python3 scripts/update_taxonomy.py