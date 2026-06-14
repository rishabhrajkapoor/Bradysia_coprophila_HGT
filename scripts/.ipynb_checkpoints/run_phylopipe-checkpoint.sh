#!/bin/bash
#SBATCH -p sapphire # Partition to submit to (comma separated)
#SBATCH -J muscle # Job name
#SBATCH -n 20 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 20G
#SBATCH -t 01-00:00
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
# module load python
# source activate /n/home11/rkapoor/.conda/envs/rishabh
echo $1

MSA_FILE="outputs/phylogenetic_dataset/$1/MSA.fasta"

if [ ! -s "$MSA_FILE" ]; then
    singularity exec /cvmfs/singularity.galaxyproject.org/m/u/muscle:5.1--h9f5acd7_2 \
        muscle \
        -align "outputs/phylogenetic_dataset/$1/seqs.fasta" \
        -output "$MSA_FILE"
fi

python3 scripts/trimal_python.py "$1"
sh scripts/trimAl.sh "$1"
sbatch scripts/iqtree.sh "$1"