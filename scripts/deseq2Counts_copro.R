#!/usr/bin/env Rscript

# Load necessary libraries
suppressMessages(library(DESeq2))

args <- commandArgs(trailingOnly=TRUE)
data_file <- args[1]
meta_file <- args[2]
f1 <- args[3]
f2 <- args[4]
t <- args[5]
# Read the data
data <- read.csv(data_file)
meta <- read.csv(meta_file)

mat <- data[,-1]
rownames(mat) <- data[,1]

# Create DESeq2 dataset
dds <- DESeqDataSetFromMatrix(countData=mat, 
                              colData=meta, 
                              design=~c)

dds <- DESeq(dds)
res <- results(dds, contrast=c("c",f1,f2))
write.csv(res, file = paste("outputs/","deseq2", t, ".csv", sep = ""))
