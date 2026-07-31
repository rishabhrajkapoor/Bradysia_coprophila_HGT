#!/bin/bash
#SBATCH -p serial_requeue # Partition to submit to (comma separated)
#SBATCH -J deeploc # Job name
#SBATCH -n 4 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 300G
#SBATCH -t 0-5:00
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
mkdir -p "/n/netscratch/extavour_lab/Everyone/Rishabh/deeploc_results/$1"
odir="/n/netscratch/extavour_lab/Everyone/Rishabh/deeploc_results"
idir="/n/netscratch/extavour_lab/Everyone/Rishabh/split_fastas/$1"

deeploc2 -f "$idir" --model Accurate --output "$odir"