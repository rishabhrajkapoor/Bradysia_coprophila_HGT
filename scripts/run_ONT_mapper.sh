#!/bin/bash
#SBATCH -p shared # Partition to submit to (comma separated)
#SBATCH -J coverage # Job name
#SBATCH -n 30 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 30G
#SBATCH -t 00-:30
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL

mkdir -p '/n/netscratch/extavour_lab/Everyone/Rishabh/bradysia_fastq_mapping/'$1

cd '/n/netscratch/extavour_lab/Everyone/Rishabh/bradysia_fastq_mapping/'$1


output_file="$1.fastq"

# Check if the output file already exists
if [ ! -f "$output_file" ]; then
    # Run the singularity command
    singularity exec /cvmfs/singularity.galaxyproject.org/s/r/sra-tools:3.1.1--h4304569_2 fastq-dump "$1"
else
    echo "$output_file already exists. Skipping fastq-dump."
fi


output_file="aligned_reads.sam"

# Check if the output file already exists
if [ ! -f "$output_file" ]; then
    # Run the singularity command
    singularity exec /cvmfs/singularity.galaxyproject.org/m/i/minimap2:2.28--he4a0461_3 minimap2 -ax map-ont -t 20 --secondary=no ../Bradysia_genome.mmi $1.fastq > aligned_reads.sam
else
    echo "$output_file already exists"
fi


output_file="aligned_reads.bam"

# Check if the output file already exists
if [ ! -f "$output_file" ]; then
    # Run the singularity command
    singularity exec /cvmfs/singularity.galaxyproject.org/s/a/samtools:1.21--h50ea8bc_0 samtools view -F 2308 -q 30 -Sb aligned_reads.sam | singularity exec /cvmfs/singularity.galaxyproject.org/s/a/samtools:1.21--h50ea8bc_0 samtools sort -o aligned_reads.bam
else
    echo "$output_file already exists"
fi

output_file="reads.bed"

# Check if the output file already exists
if [ ! -f "$output_file" ]; then
    # Run the singularity command
    singularity exec /cvmfs/singularity.galaxyproject.org/b/e/bedtools:2.31.1--hf5e1c6e_2 bedtools bamtobed -i aligned_reads.bam > reads.bed
else
    echo "$output_file already exists"
fi


output_file="overlaps.txt"

# Check if the output file already exists
if [ ! -f "$output_file" ]; then
    # Run the singularity command
    singularity exec /cvmfs/singularity.galaxyproject.org/b/e/bedtools:2.31.1--hf5e1c6e_2 bedtools intersect -a reads.bed -b ../genes.bed -wa -wb > overlaps.txt
else
    echo "$output_file already exists"
fi


output_file="coverage.txt"

# Check if the output file already exists
if [ ! -f "$output_file" ]; then
    # Run the singularity command
    singularity exec /cvmfs/singularity.galaxyproject.org/b/e/bedtools:2.31.1--hf5e1c6e_2 bedtools coverage -a ../genes.bed -b reads.bed  > coverage.txt
else
    echo "$output_file already exists"
fi


# rm reads.bed
# rm aligned_reads.bam
# rm aligned_reads.sam
# rm "$1.fastq"