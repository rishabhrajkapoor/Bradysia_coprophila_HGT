import os
import pandas as pd
import multiprocessing as mp
import os
import sys
genome=sys.argv[1]
fam=sys.argv[2]
from ete3 import NCBITaxa
import numpy as np
ncbi = NCBITaxa()
num_processes = 50  # Use all available CPU cores

def taxid_to_lineage_string(taxid):
    try: 
        lineage = ncbi.get_lineage(taxid)
        names = ncbi.get_taxid_translator(lineage)
        
        ranks = ncbi.get_rank(lineage)
    
        
        kingdom = np.nan
        phylum = np.nan
        out={}
    
        for tid in lineage:
            rank = ranks[tid]
            if rank == 'kingdom':
                kingdom=names[tid]
            elif rank =='phylum':
                phylum=names[tid]
        names = "; ".join(names[t] for t in lineage).split("root; ")[1]
    except:
        print("fail",taxid)
        names=np.nan     
        kingdom = np.nan
        phylum = np.nan
        
    try:
       name=ncbi.get_taxid_translator([taxid])[taxid] 
    except:
        name=np.nan
  
    return names, name, kingdom, phylum


def get_missing_tax_add_header(x):
    df = pd.read_csv(
        f"/n/netscratch/extavour_lab/Everyone/Rishabh/diamond_clustred_dipteran_results_split/{genome}/{x}",
        sep="\t",
        names="qseqid sseqid stitle staxids sscinames sphylums skingdoms slineage pident length mismatch gapopen qstart qend sstart send evalue bitscore qcovhsp".split(),
        nrows=2000
    )

    tids = set(df.loc[df.slineage.isna(), "staxids"].dropna())

    df.to_csv(
        f"/n/netscratch/extavour_lab/Everyone/Rishabh/diamond_clustred_dipteran_results_split/{genome}/{x}",
        sep="\t",
        index=False
    )

    return tids

td=os.listdir(f"/n/netscratch/extavour_lab/Everyone/Rishabh/diamond_clustred_dipteran_results_split/{genome}/")
td=[x for x in td if '.tsv' in x]
import multiprocessing as mp
pool = mp.Pool(processes=num_processes)

# Use the pool's map function to apply the get_data function to each element in td
result = pool.map(get_missing_tax_add_header, td)
missing_tax = set().union(*result)
tid_map={x:taxid_to_lineage_string(x) for x in missing_tax}
def fill_missing_taxa(x):
    df = pd.read_csv(
        f"/n/netscratch/extavour_lab/Everyone/Rishabh/diamond_clustred_dipteran_results_split/{genome}/{x}",
        sep="\t",
        nrows=2000,
        
    )
    for index, row in df.iterrows():
        if row.staxids in tid_map:
            df.loc[index,['slineage', 'sscinames','skingdoms','sphylums']]=tid_map[row.staxids]
    df.to_csv(f"/n/netscratch/extavour_lab/Everyone/Rishabh/diamond_clustred_dipteran_results_split/{genome}/{x}",sep="\t")

pool = mp.Pool(processes=num_processes)
# Use the pool's map function to apply the get_data function to each element in td
result = pool.map(fill_missing_taxa, td)

def get_data(x):
    df=pd.read_csv(f"/n/netscratch/extavour_lab/Everyone/Rishabh/diamond_clustred_dipteran_results_split/{genome}/{x}",sep="\t",index_col=0, nrows=2000)
    ##exclude synthetic taxid
    df=df[df.staxids.astype(int)!=32630]
    ## exclude rhagoletis zephyria
    df=df[df.staxids.astype(int)!=28612]
    n_non_diptera,n_out_fam_diptera,AI,sseqid,slineage,sciname,tid,evalue,bitscore,qcovhsp,qstart,qend,pident=[np.nan]*13
    if df[~df.slineage.str.contains(fam)].shape[0]>0:
        top=df[~df.slineage.str.contains(fam)].iloc[0,:]
        sseqid,sciname,slineage,tid,evalue,bitscore,qcovhsp,qstart,qend,pident=top[['sseqid','sscinames','slineage','staxids','evalue','bitscore','qcovhsp','qstart','qend','pident']]
                   
        in_fam=df[df.slineage.str.contains(fam)&df.slineage.str.contains('Diptera')]
        out_fam_diptera=df[~df.slineage.str.contains(fam)&df.slineage.str.contains('Diptera')]

        ##return n_out_fam sseqid
        n_out_fam_diptera=len(set(out_fam_diptera['sseqid']))
        non_diptera=df[~df.slineage.str.contains('Diptera;')]

        ##return non dipteran sseqid
        n_non_diptera=len(set(non_diptera['sseqid']))
        AI=np.nan
        if out_fam_diptera.shape[0]>0 and non_diptera.shape[0]>0:
            AI=np.log10((out_fam_diptera.evalue.iloc[0]+1e-200)/(non_diptera.evalue.iloc[0]+1e-200))
        del in_fam, out_fam_diptera
            
    lo=[x.replace(".tsv",""),n_non_diptera,n_out_fam_diptera,AI,sseqid,slineage,sciname,tid,evalue,bitscore,qcovhsp,qstart,qend,pident]
    del df

    return lo



pool = mp.Pool(processes=num_processes)
td=os.listdir(f"/n/netscratch/extavour_lab/Everyone/Rishabh/diamond_clustred_dipteran_results_split/{genome}/")
td=[x for x in td if '.tsv' in x]
# Use the pool's map function to apply the get_data function to each element in td
result = pool.map(get_data, td)
cols="accession,n_non_diptera,n_out_fam_diptera,AI,sseqid,slineage,sciname,tid,evalue,bitscore,qcovhsp,qstart,qend,pident".split(",")
dfresult=pd.DataFrame(result,columns=cols)
dfresult=pd.read_csv(f"/n/netscratch/extavour_lab/Everyone/Rishabh/diamond_diptera_out/{genome}.tsv",sep='\t',index_col=0)
for index, row in dfresult.iterrows():
    non_dipt=(row.n_out_fam_diptera==0)&(row.evalue<1e-5)
    alien=row.AI>10
    if alien:
        dfresult.loc[index,'type']='alien'
    elif non_dipt:
        dfresult.loc[index,'type']='non_dipt'
    elif 'Diptera' in str(row.slineage):
        dfresult.loc[index,'type']='dipt'
    elif str(row.sseqid)=='nan':
        dfresult.loc[index,'type']='orphan'
    else:
         dfresult.loc[index,'type']='none'
    dfresult.loc[index,'HGT']=alien|non_dipt
dfresult.to_csv(f"outputs/diptera_wide_screen/{genome}.tsv",sep='\t')