---
title: "ChIP-Seq - Visualization of e.g. H3K27ac Peak distribution"
author: "Melanie Kappelmann-Fenzl"
date: "April, 2021"
output:
  pdf_document: default
  html_document: default
---
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("pheatmap")

library (pheatmap)

# Create Input file *_ghist.txt file as discribed in XXX

ghist<- read.delim ("/path/to/your/*_ghist.txt", header=TRUE)
head (ghist)
ghist$Gene
m1<- as.matrix( ghist[,2:ncol(ghist)]) 
rownames(m1)<- ghist$Gene
m1<- m1+1
range(m1)
bk = unique(c(seq(1,14.9, length=100),seq(15,94,length=100)))

hmcols<- colorRampPalette(c("white","blue"))(length(bk)-1)   

pheatmap(m1, color=hmcols,  breaks=bk,  cluster_rows=FALSE, cluster_cols=FALSE, legend=FALSE, show_rownames=FALSE, show_colnames=FALSE)

