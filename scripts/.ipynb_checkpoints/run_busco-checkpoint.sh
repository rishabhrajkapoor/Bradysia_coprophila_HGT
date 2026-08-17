#!/bin/bash
#SBATCH -p serial_requeue # Partition to submit to (comma separated)
#SBATCH -J BUSCO # Job name
#SBATCH -n 50 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 50G
#SBATCH -t 00-01:00
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL

singularity exec /cvmfs/singularity.galaxyproject.org/b/u/busco:5.7.1--pyhdfd78af_0 busco -i sciarid_species_tree/BUSCO_proteins/$1.fasta -l ../Bradysia_coprophila/BUSCO_phylogenomics/BUSCO_phylogenomics/busco_downloads/lineages/diptera_odb10 -c 50 -m prot -f -o sciarid_species_tree/BUSCO_outputs/$1 --offline 