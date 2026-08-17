import multiprocessing as mp
import subprocess
import os 
import sys



def run_deep_loc(x):
    subprocess.run(["sh", "scripts/deeplocsh.sh", x])

to_do = [x for x in os.listdir(f"/n/netscratch/extavour_lab/Everyone/Rishabh/split_fastas/") if ".fasta" in x]


with mp.Pool(5) as p:
    results = p.map(run_deep_loc, to_do)
