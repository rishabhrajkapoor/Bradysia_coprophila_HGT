#!/bin/bash
#SBATCH -p test # Partition to submit to (comma separated)
#SBATCH -J interproscan # Job name
#SBATCH -n 100 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 250G
#SBATCH -t 0-7:59
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL

cd /n/netscratch/extavour_lab/Everyone/Rishabh/
singularity exec \
    -B $PWD/interproscan-5.77-108.0/data:/opt/interproscan/data \
    -B $PWD/input:/input \
    -B $PWD/temp:/temp \
    -B $PWD/output:/output_bradysia \
    interproscan_5.77-108.0.sif \
    /opt/interproscan/interproscan.sh \
    --input "/net/bos-nfsisilon/ifs/rc_labs/extavour_lab/rkapoor/Bradysia_HGT_2026/ncbi_dataset/data/GCF_014529535.2/longest_isoform.fasta" \
    --disable-precalc \
    --output-dir /net/bos-nfsisilon/ifs/rc_labs/extavour_lab/rkapoor/Bradysia_HGT_2026/outputs/interproscan \
    --tempdir ./temp \
    --cpu 100