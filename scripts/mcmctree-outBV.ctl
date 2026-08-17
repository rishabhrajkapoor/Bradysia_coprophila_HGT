seqfile = ../../BUSCO_alignment_iqtree/supermatrix/fixed_SUPERMATRIX.phylip
treefile = ../mcmctree.nw

ndata = 1
seqtype = 2    * 0: nucleotides; 1:codons; 2:AAs
usedata = 3    * 0: no data (prior); 1:exact likelihood; * 2: approximate likelihood; 3:out.BV (in.BV)
clock = 3    * 1: global clock; 2: independent rates; 3: correlated rates

model = 2
aaRatefile = ../insect.dat
alpha = 0.5   * alpha for gamma rates at sites
ncatG = 9    * No. categories in discrete gamma

cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?
