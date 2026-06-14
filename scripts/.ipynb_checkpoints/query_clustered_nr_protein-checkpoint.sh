#!/bin/bash
blastdbcmd -db "$SCRATCH/extavour_lab/Everyone/Rishabh/db_clustered/nr_cluster_seq" -entry $1 -target_only  >> $2