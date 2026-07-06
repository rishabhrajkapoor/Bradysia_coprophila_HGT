##trim to solely include regions overlapping with the aligned region of the top non-sciarid hit
import pandas as pd
import pickle
import subprocess
from Bio import SeqIO
import sys
i=sys.argv[1]
htgdf=pd.read_csv("outputs/per_protein_diamond_data.tsv",sep="\t",index_col='accession')
with open('outputs/connected_components_reps.pickle', 'rb') as f:
    representative = pickle.load(f)
    

x=representative[int(i)]
start,stop=htgdf.loc[x,['qstart','qend']]  
input_file = open(f"outputs/phylogenetic_dataset/{i}/MSA.fasta")
fastaj = SeqIO.to_dict(SeqIO.parse(input_file, "fasta"))
imap = {}
ui = 0
for gi, xi in enumerate(str(fastaj[x].seq)):
    if xi != "-":
        imap[ui] = gi
        ui += 1

f=open(f"outputs/phylogenetic_dataset/{i}/trimmed_MSA_sub_seq.fasta","w")
for xj in fastaj:
    f.write(f">{xj}\n")
    f.write(str(fastaj[xj].seq)[ imap[start-1] : imap[stop-1] + 1 ])
    f.write("\n")
f.close()



