#!/bin/bash
#SBATCH -p sapphire # Partition to submit to (comma separated)
#SBATCH -J deeploc # Job name
#SBATCH -n 10 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 500G
#SBATCH -t 0-15:00
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL

module load python/3.10.13-fasrc01


python3 scripts/run_deeploc.py 