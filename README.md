# Bradysia_coprophila_HGT
This repository contains Jupyter notebooks and associated helper scripts (`scripts/` directory) required to reproduce analyses of horizontal gene transfer in the manuscript *Massive inter-animal horizontal gene transfer contributes to stress tolerance in the fungus gnat Bradysia coprophila*. Associated input and output data are provided in an accompanying Dryad repository.
## Dependencies 

| Software or algorithm name and version | URL |
| --- | --- |
| ColabFold v.1.5.5 | [https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/AlphaFold2.ipynb](https://colab.research.google.com/github/sokrypton/ColabFold/blob/main/AlphaFold2.ipynb) |
| MetaCyc release 29.5 | [https://metacyc.org/](https://metacyc.org/) |
| KEGG release 2025-12-8 | [https://www.genome.jp/kegg/pathway.html](https://www.genome.jp/kegg/pathway.html) |
| KofamKOALA release 2025-12-01 | [https://www.genome.jp/tools/kofamkoala/](https://www.genome.jp/tools/kofamkoala/) |
| UniProtKB | [https://www.uniprot.org/uniprotkb/](https://www.uniprot.org/uniprotkb/) |
| Biopython v.1.83 | [https://biopython.org/](https://biopython.org/) |
| BRAKER3 | [Galaxy BRAKER3](https://usegalaxy.eu/root?tool_id=toolshed.g2.bx.psu.edu%2Frepos%2Fgenouest%2Fbraker3%2Fbraker3%2F3.0.3%20galaxy1) |
| BLAST+ v.2.12.0 | [https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/](https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/) |
| cd-hit v.4.8.1 | https://biocontainers.pro/ |
| DeepLoc2 v.1 | [https://services.healthtech.dtu.dk/services/DeepLoc-2.0/](https://services.healthtech.dtu.dk/services/DeepLoc-2.0/) |
| DESeq2 v.1.38.3 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| Liftoff v.1.6.3 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| Prokka v.1.14.6 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| DIAMOND v.2.2.0 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| Minimap2 v.2.28 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| SAMtools v.1.21 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| BEDTools v.2.31.1 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| scikit-learn v.1.2.0 | [https://github.com/scikit-learn/scikit-learn](https://github.com/scikit-learn/scikit-learn) |
| BLAST+ v.2.12.0 | https://blast.ncbi.nlm.nih.gov/doc/blast-help/downloadblastdata.html |
| ETE v.3.1.2 | [https://pypi.org/project/ete3/](https://pypi.org/project/ete3/) |
| InterProScan webserver, release 5.75-107.0 | [https://www.ebi.ac.uk/interpro/search/sequence/](https://www.ebi.ac.uk/interpro/search/sequence/) |
| IQ-TREE v.2.2.0.3 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| iTOL webserver and API | [https://github.com/iBiology/iTOL](https://github.com/iBiology/iTOL); [https://itol.embl.de/](https://itol.embl.de/) |
| matplotlib v.3.9.2 | [https://matplotlib.org/](https://matplotlib.org/) |
| MUSCLE v.5.1 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| NCBI Genome Data Viewer | [https://www.ncbi.nlm.nih.gov/gdv/](https://www.ncbi.nlm.nih.gov/gdv/) |
| NetworkX v.2.8.8 | [https://github.com/networkx/networkx](https://github.com/networkx/networkx) |
| NumPy v.1.23.5 | [https://numpy.org/](https://numpy.org/) |
| PAL2NAL v.14.1 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| PAML v.4.10.6 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| PyMOL v.3.0.3 | [https://pymol.org/](https://pymol.org/) |
| Python v.3.9.7 | [https://www.python.org/](https://www.python.org/) |
| R v.4.2.3 | [https://www.R-project.org/](https://www.R-project.org/) |
| SciPy v.1.8.1 | [https://scipy.org/](https://scipy.org/) |
| seaborn v.0.13.2 | [https://seaborn.pydata.org/](https://seaborn.pydata.org/) |
| SRA toolkit v.3.1.0; v.3.1.1 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| STAR v.2.7.9a | [https://biocontainers.pro/](https://biocontainers.pro/) |
| statsmodels v.0.14.0 | [https://www.statsmodels.org/stable/index.html](https://www.statsmodels.org/stable/index.html) |
| featureCounts (in Subread v.2.0.6) | [https://biocontainers.pro/](https://biocontainers.pro/) |
| Treemble v.1.6.2 | https://treemble.org/ |
| Trim Galore v.0.6.9 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| trimAl v.1.4.1 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| Gene loss probabilistic recursion | [https://doi.org/10.1093/nar/gkl792](https://doi.org/10.1093/nar/gkl792) |
| GffRead v.0.12.9 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| pyCirclize v.1.7.1 | [https://github.com/moshi4/pyCirclize](https://github.com/moshi4/pyCirclize) |
| RNAnorm v.1.38.3 | https://github.com/genialis/RNAnorm |
| BUSCO version 5.7.1 | [https://biocontainers.pro/](https://biocontainers.pro/) |
| BUSCO Phylogenomics release 20240919 | [https://github.com/jamiemcg/BUSCO_phylogenomics](https://github.com/jamiemcg/BUSCO_phylogenomics) |
| lifelines v.0.30.0 | [https://zenodo.org/records/14007206](https://zenodo.org/records/14007206) |
| Tracer v.1.7.2 | [https://tree.bio.ed.ac.uk/software/tracer/](https://tree.bio.ed.ac.uk/software/tracer/) |
| FigTree v.1.4.4 | [https://tree.bio.ed.ac.uk/software/figtree/](https://tree.bio.ed.ac.uk/software/figtree/) |
| Twist codon optimization tool | [https://www.twistbioscience.com/resources/digital-tools/codon-optimization/upload](https://www.twistbioscience.com/resources/digital-tools/codon-optimization/upload) |
| Benchling | [https://www.benchling.com/](https://www.benchling.com/) |
| NCBI Primer-BLAST | [https://www.ncbi.nlm.nih.gov/tools/primer-blast/](https://www.ncbi.nlm.nih.gov/tools/primer-blast/) |
| UpSetPlot v.0.9.0 | [https://pypi.org/project/UpSetPlot/](https://pypi.org/project/UpSetPlot/) |

## `DIAMOND_screen.ipynb`

Executes a DIAMOND-based screen for HGT in *B. coprophila*, calling the following helper scripts: `get_clustered_nr.sh`, `update_taxonomy.sh`, `download_clustered_nr.sh` (download NR taxonomy database), `download_clustered_nr.sh`, `diamond_clustered.sh`, and `split_diamond.sh`. Outputs include `per_protein_diamond_data.tsv`, a table of HGT data for all protein-coding genes; `DIAMOND_htgs.fasta`, a FASTA file of HTG protein sequences for DIAMOND-inferred HTGs; and the `diamond_clustered_results_split_edited` directory, which contains per-protein DIAMOND outputs in standard format.

## `diptera_screen.ipynb`

Performs DIAMOND-based HGT inference for 53 non-*Bradysia* dipteran genomes using the helper scripts `download_genomes.sh`, `diamond_clustered_all_dipt.sh`, and `diptera_diamond_processing.py`.

## `phylogenetic_inference.ipynb`

Performs maximum-likelihood gene inference by: 1. obtaining BRAKER3 annotations for *Lycoriella ingenua* and *Bradysia impatiens* with the Galaxy webserver (outside of the notebook), then processing them with `gffread.sh`, CD-HIT, and BUSCO; 2. performing a DIAMOND search of the combined sciarid sequence database using *B. coprophila* putative HTGs as queries (`diamond_sciarid.sh`); 3. constructing phylogenetic datasets, including similarity clustering; and 4. performing MUSCLE alignment, trimming, and IQ-TREE analysis with `run_phylopipe.sh`, `trimal_python.py`, `trimAl.sh`, and `iqtree.sh`. Outputs include `connected_components.pickle` and `connected_components_reps.pickle` for similarity clustering, as well as the `phylogenetic_dataset` directory containing FASTA files, alignments, and IQ-TREE outputs for each representative HTG in each cluster. Retrieves sequences from the NR database using `query_clustered_nr_protein.sh`.

## `analyze_trees.ipynb`

Contains scripts to assist with manual inspection of gene tree topologies, along with downstream quantification of topological types, convergent evolution, and gene family expansion.

## `automated_sister_and_top_DIAMOND_analysis.ipynb`

Analyzes the phylogenetic origins of HTGs using automated midpoint rooting and sister detection (Table S5), as well as analysis of top non-sciarid DIAMOND hits.

## `ONT_read_analysis.ipynb`

Analyzes long-read data for coverage and read length to assess the hypothesis that HTGs are contaminants; executes BEDTools analysis with `run_ONT_mapper.sh`.

## `synteny_and_conservation.ipynb`

Performs UpSet plot visualization of HTG homolog presence across sciarid genomes, as well as reciprocal-best-DIAMOND-hit analysis of microsynteny across other sciarid genomes.

## `codon_gc.ipynb`

Performs nucleotide composition analyses (codon usage and GC content) of HGT candidates and compares them with dipteran-ancestry genes and *Folsomia candida* genes. Outputs `nucleotide_composition_stats.csv`.

## `percent_identity_plots.ipynb`

Plots the joint distribution of DIAMOND `pident` and `qcovhsp` values for the top non-sciarid hit.

## `liftoff_transfer_to_GCA_965233685.1.ipynb`

Compares HTGs with an independently assembled *B. coprophila* genome using Liftoff annotation transfer.

## `run_MCMC_analysis.ipynb`

Obtains a time-calibrated tree using BUSCO Phylogenomics (requires a conda installation of [BUSCO_phylogenomics](https://github.com/jamiemcg/BUSCO_phylogenomics)) and PAML, using the following helper scripts: `run_busco.sh`, `run_busco_phylogenomics.sh`, `iqtree_partition.sh`, and `iqtree_no_partition.sh`. Calls MCMCtree with `mcmctree.sh`, the MCMCtree files (`.nw`, and `.ctl`), and the substitution matrix `insect.dat`.

## `representation_in_genbank.ipynb`

Verifies that arthropods with GenBank and RefSeq genome annotations are represented in NCBI, using the helper script `get_taxid_accessions.sh`.

## `arthropod_lineage_tree_construction.ipynb`

Concatenates arthropod species trees from the literature to generate a phylogeny of arthropod donor lineages (Figure 2B).

## `endosymbiont_analysis.ipynb`

Analyzes possible endosymbiotic gene transfer to *B. coprophila* using DIAMOND against a Prokka-generated translation of a putative *B. coprophila* endosymbiont genome.

## `collembola_percent_identity_and_intron_analysis.ipynb`

Performs two analyses related to collembolan-affinity HTGs: 1. comparison of percent identity to the top collembolan DIAMOND hit for HTGs and dipteran proteins; and 2. analysis of intron-position conservation for two-step bacterial → collembola → sciarid transfers (also for glyoxylate shunt and beta-lactam synthesis genes). Also performs intron-conservation analysis with *Paramacrobiotus metropolitanus* for beta-lactam biosynthesis genes.

## `loss_probabilistic_analysis.ipynb`

Performs probabilistic analysis of the null hypothesis that collembolan-affinity *B. coprophila* genes are instead the result of vertical inheritance from the hexapod common ancestor with recurrent loss. Implements the probability recursion outlined in [10.1093/nar/gkl792](https://doi.org/10.1093/nar/gkl792), using a hexapod phylogeny from [Misof et al. (2014)](https://www.science.org/doi/10.1126/science.1257570). The notebook begins by validating the method with a few simple tree topologies for which the probability of a phyletic pattern has a closed-form solution.

## `localization_analysis.ipynb`

Analyzes genomic localization of HTGs, including Circos plot generation and a simulated null distribution of the fraction of HTGs adjacent to other HTGs.

## `transcriptomic_analysis.ipynb`

Accesses transcriptomic data from RefSeq; performs data visualization and DESeq2 differential-expression analysis using the helper script `deseq2Counts_copro.R`.

## `pairwise_dnds.ipynb`

Executes pairwise dN/dS analyses of *B. coprophila* and *B. impatiens* reciprocal-best-DIAMOND hits with PAML, using the following helper scripts and PAML control files: `run_paml.sh`, `run_paml_null.sh`, `M0_null.ctl`, and `M0.ctl`. Also performs OLS regression of ancestry/HTG age and dN/dS.

## `go_term_deeploc_cazy.ipynb`

Performs subcellular localization prediction using DeepLoc2 and enrichment analysis (with helper scripts `deep.sh`, `run_deeploc.py`, and `deeplocsh.sh`), along with enrichment analysis of predicted Gene Ontology (GO) terms. It also compares carbohydrate-active enzymes with the proteome from Trinca et al. 2023 ([https://doi.org/10.1016/j.isci.2023.106449](https://doi.org/10.1016/j.isci.2023.106449)). Adds digestive-enzyme annotations to salivary proteome and differential-expression output data. Note: assumes a DeepLoc2 installation ([https://services.healthtech.dtu.dk/services/DeepLoc-2.0/](https://services.healthtech.dtu.dk/services/DeepLoc-2.0/)) in a Python 3.6 environment (switched inside the notebook before running `deep.sh`). Comparisons with annotations in Trinca et al. are facilitated by a DIAMOND search of the new *B. coprophila* annotation (`GCF_014529535.2`) using queries from the previous annotation (`GCF_014529535.1`).

## `previously_published_HTGs.ipynb`

Compares detected HTGs with prior publications using DIAMOND-based mapping of accessions from the previous genome annotation to the current genome annotation.

## `interproscan.ipynb`

Calls `interproscan.sh` to run InterProScan on the longest protein isoform per *B. coprophila* gene. Contains scripts to assist with pathway assignment through manual inspection of InterProScan domain descriptions and subsequent intersection with expression data.

## `analysis_of_drosophila_data.ipynb`

Contains scripts to analyze transgenic *Drosophila melanogaster* survival data for cyanide fumigation, arsenite supplementation, MMS supplementation, and hydrogen peroxide supplementation.

## `yeast_complementation_growth_curves.ipynb`

Contains scripts to plot yeast complementation growth curves for kynurenine pathway genes.
