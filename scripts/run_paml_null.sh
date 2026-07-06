#!/bin/bash
cd "pairwise_copro_impatiens_dnds/"$1
singularity exec /cvmfs/singularity.galaxyproject.org/p/a/paml:4.10.6--h031d066_1 codeml /net/bos-nfsisilon/ifs/rc_labs/extavour_lab/rkapoor/Bradysia_HGT_2026/scripts/M0_null.ctl