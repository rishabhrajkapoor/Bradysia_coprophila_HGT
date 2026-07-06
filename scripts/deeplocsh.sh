#!/bin/bash
mkdir -p "/n/netscratch/extavour_lab/Everyone/Rishabh/deeploc_results/$1"
odir="/n/netscratch/extavour_lab/Everyone/Rishabh/deeploc_results"
idir="/n/netscratch/extavour_lab/Everyone/Rishabh/split_fastas/$1"

deeploc2 -f "$idir" --model Accurate --output "$odir"