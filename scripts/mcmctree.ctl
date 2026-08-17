seed = -1
seqfile = ../../BUSCO_alignment_iqtree/supermatrix/fixed_SUPERMATRIX.phylip
treefile = ../mcmctree.nw
mcmcfile = posterior_mcmc.txt
outfile = posterior_out.txt

ndata = 1
seqtype = 2    * 0: nucleotides; 1:codons; 2:AAs
usedata = 2    * 0: no data (prior); 1:exact likelihood; 
* 2:approximate likelihood; 3:out.BV (in.BV)
clock = 3    * 1: global clock; 2: independent rates; 3: correlated rates


model = 2
aaRatefile =  ../insect.dat
alpha = 0.5   * alpha for gamma rates at sites
ncatG = 9    * No. categories in discrete gamma

cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?

BDparas = 1 1 0   * birth, death, sampling

rgene_gamma = 2 7.8299 
sigma2_gamma = 1 10    * gammaDir prior for sigma^2     (for clock=2 or 3)

print = 1   * 0: no mcmc sample; 1: everything except branch rates 2: everything
burnin = 100000
sampfreq = 100
nsample = 300000

