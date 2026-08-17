#!/bin/bash
#SBATCH -p test # Partition to submit to (comma separated)
#SBATCH -J mcmcmtree # Job name
#SBATCH -n 30 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 100G
#SBATCH -t 00-06:00
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
cd sciarid_species_tree/MCMC_runs/run_$1

singularity exec /cvmfs/singularity.galaxyproject.org/p/a/paml:4.10.6--h031d066_1 mcmctree ../mcmctree-outBV.ctl

cp out.BV in.BV
singularity exec /cvmfs/singularity.galaxyproject.org/p/a/paml:4.10.6--h031d066_1 mcmctree ../mcmctree.ctl