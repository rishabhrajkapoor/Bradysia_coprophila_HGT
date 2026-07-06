#!/bin/bash
#SBATCH -p serial_requeue # Partition to submit to (comma separated)
#SBATCH -J iqtree # Job name
#SBATCH -n 50 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH --mem 300G
#SBATCH -t 2-00:00
#SBATCH --mail-user=rkapoor@g.harvard.edu
#SBATCH --mail-type=END 
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
cd sciarid_species_tree/BUSCO_alignment_iqtree/supermatrix

cat > constraint.tree <<'EOF'
(Aedes_aegypti,((Hermetia_illucens,Drosophila_melanogaster),(((Lycoriella_ingenua,Bradysia_impatiens,Bradysia_coprophila,Bradysia_odoriphaga,Pseudolycoriella_hygida),Diadocidia_ferruginosa),Mycetophila_fungorum),(Contarinia_nasturtii,Sitodiplosis_mosellana)));
EOF

singularity exec /cvmfs/singularity.galaxyproject.org/i/q/iqtree:2.2.0.3--hb97b32f_0 \
  iqtree2 \
  -s "SUPERMATRIX.phylip" \
  -g constraint.tree \
  -B 1000 \
  -T AUTO \
  --prefix no_partition_constraint \
  -safe \
  -m MFP