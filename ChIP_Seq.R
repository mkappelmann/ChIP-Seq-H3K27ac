library(GenomicRanges)
library(rtracklayer)
library(IRanges)

WM9p44_sictrl= import ('/Volumes/LacieRAID/ChIPseq/tracks/GRCh38/ChIP-WM9p44-sictrl_7b_H3K27ac.ucsc.bigWig')
WM9p44_sictrl_Input= import ('/Volumes/LacieRAID/ChIPseq/tracks/GRCh38/ChIP-WM9p44-sictrl-7b_Input.ucsc.bigWig')
WM9p44_siHADAC2 = import ('/Volumes/LacieRAID/ChIPseq/tracks/GRCh38/ChIP-WM9p44-siHADAC2-12_H3K27ac.ucsc.bigWig')
WM9p44_siHADAC2_Input = import ('/Volumes/LacieRAID/ChIPseq/tracks/GRCh38/ChIP-WM9p44-siHADAC2-12_Input.ucsc.bigWig')
WM9p85_sictrl = import ('/Volumes/LacieRAID/ChIPseq/tracks/GRCh38/ChIP-WM9p85-sictrl-2_H3K27ac.ucsc.bigWig')
WM9p85_sictrl_Input = import ('/Volumes/LacieRAID/ChIPseq/tracks/GRCh38/ChIP-WM9p85-sictrl-2_Input.ucsc.bigWig')
WM9p85_siHADAC2 = import ('/Volumes/LacieRAID/ChIPseq/tracks/GRCh38/ChIP-WM9p85-siHADAC2-4_H3K27ac.ucsc.bigWig')
WM9p85_siHADAC2_Input = import ('/Volumes/LacieRAID/ChIPseq/tracks/GRCh38/ChIP-WM9p85-siHADAC2-4_Input.ucsc.bigWig')

library (chipseq)

prepareChIPseq = function(reads) {
  frag.len =median (estimate.mean.fraglen (reads) )
  cat ( paste0( 'Median fragment size for this library is' , round (frag.len)))
  reads.extended =resize(reads, width =frag.len)
}

WM9p44_sictrl= prepareChIPseq (WM9p44_sictrl)
WM9p44_sictrl_Input= prepareChIPseq (WM9p44_sictrl_Input)
WM9p44_siHADAC2 = prepareChIPseq (WM9p44_siHADAC2)
WM9p44_siHADAC2_Input = prepareChIPseq (WM9p44_siHADAC2_Input)
WM9p85_sictrl = prepareChIPseq(WM9p85_sictrl)
WM9p85_sictrl_Input = prepareChIPseq(WM9p85_sictrl_Input)
WM9p85_siHADAC2 = prepareChIPseq(WM9p85_siHADAC2 )
WM9p85_siHADAC2_Input = prepareChIPseq(WM9p85_siHADAC2_Input)




#Obtaining object si for hg38
library(BSgenome.Hsapiens.UCSC.hg38)
genome= BSgenome.Hsapiens.UCSC.hg38
si=seqinfo(genome)
si=si[paste0('chr',c(1:22,'X','Y'))]
si

binsize = 200
bins= tileGenome(si['chr13'], tilewidth=binsize,cut.last.tile.in.chrom = TRUE)
bins

#Binning

BinChIP = function ( reads, bins) {
  mcols(bins)$score = countOverlaps( bins, reads) 
  return (bins)
}

WM9p44_sictrl.200bins = BinChIP (WM9p44_sictrl, bins)
WM9p44_sictrl_Input.200bins = BinChIP (WM9p44_sictrl_Input, bins)
WM9p44_siHADAC2.200bins = BinChIP (WM9p44_siHADAC2, bins)
WM9p85_sictrl.200bins = BinChIP (WM9p85_sictrl, bins)
WM9p85_sictrl_Input.200bins = BinChIP (WM9p85_sictrl_Input, bins)
WM9p85_siHADAC2.200bins = BinChIP (WM9p85_siHADAC2, bins)

library(Gviz)

library(biomaRt)
mart = useMart (biomart = "ENSEMBL_MART_ENSEMBL")
mart = useDataset("hsapiens_gene_ensembl", mart=mart)
listAttributes(mart)

fm= Gviz:::.getBMFeatureMap()
fm["sympol"]="external_gene_name"

bm = BiomartGeneRegionTrack(chromosome = 'chr13', genome = "hg38", start = 78583089, end= 78600000, biomart = mart, filters = list("with_refseq_mrna"=TRUE), size=4, name = "RefSeq", utr5="red3", utr3="red3", protein_coding="black", col.line=NULL, cex=7, collapseTranscripts="longest", featureMap = fm)

AT= GenomeAxisTrack()

plotTracks(c(bm,AT), from=78583089, to= 78700000,transcriptAnnotation="symbol",  window="auto", cex.title=1, fontsize=10 )

WM9p44_sictrl.track = DataTrack(WM9p44_sictrl.200bins, 
                                strand="*", genome="hg38", col.histogram='gray',
                                fill.histogram='gray', name="H3K27ac", col.axis="black",
                                cex.axis=0.6, ylim=c(0,80))

WM9p44_sictrl_Input.track = DataTrack(WM9p44_sictrl_Input.200bins, 
                                      strand="*", genome="hg38", col.histogram='gray',
                                      fill.histogram='gray', name="Input", col.axis="black",
                                      cex.axis=0.6, ylim=c(0,80))

WM9p44_siHADAC2.track = DataTrack(WM9p44_siHADAC2.200bins, 
                                  strand="*", genome="hg38", col.histogram='gray',
                                  fill.histogram='gray', name="H3K27ac", col.axis="black",
                                  cex.axis=0.6, ylim=c(0,80))


WM9p85_sictrl.track = DataTrack(WM9p85_sictrl.200bins, 
                                strand="*", genome="hg38", col.histogram='gray',
                                fill.histogram='gray', name="H3K27ac", col.axis="black",
                                cex.axis=0.6, ylim=c(0,80))

WM9p85_sictrl_Input.track = DataTrack(WM9p85_sictrl_Input.200bins, 
                                      strand="*", genome="hg38", col.histogram='gray',
                                      fill.histogram='gray', name="Input", col.axis="black",
                                      cex.axis=0.6, ylim=c(0,80))

WM9p85_siHADAC2.track = DataTrack(WM9p85_siHADAC2.200bins, 
                                strand="*", genome="hg38", col.histogram='gray',
                                fill.histogram='gray', name="H3K27ac", col.axis="black",
                                cex.axis=0.6, ylim=c(0,80))

plotTracks(c (WM9p44_sictrl_Input.track,WM9p44_sictrl.track,WM9p44_siHADAC2.track,WM9p85_sictrl_Input.track,WM9p85_sictrl.track,WM9p85_siHADAC2.track,bm,AT),
           from=78583089, to= 78700000, transcriptAnnotation="symbol", window="auto", type="histogram",cex.title=0.7, fontsize=10)


setwd ("/Volumes/LacieRAID/ChIPseq/analysis/PeakFiles")
peaks_WM9p44_sictrl = import ('findPeaks_ChIP-WM9p44-sictrl-7b_H3K27ac.FDR1e-6.bed')
peaks_WM9p44_siHADAC2= import('findPeaks_ChIP-WM9p44-siHADAC2-12_H3K27ac.FDR1e-6.bed')
peaks_WM9p85_sictrl = import('findPeaks_ChIP-WM9p85-sictrl-2_H3K27ac.FDR1e-6.bed')
peaks_WM9p85_siHADAC2 = import ('findPeaks_ChIP-WM9p85-siHADAC2-4_H3K27ac.FDR1e-6.bed')


peaks_WM9p44_sictrl.track = AnnotationTrack (peaks_WM9p44_sictrl, genome="hg38", options(ucscChromosomeNames=FALSE), chromosome='chr13',name="Peaks", shape='box', fill='orange', size=2.5 )
peaks_WM9p44_siHADAC2.track = AnnotationTrack (peaks_WM9p44_siHADAC2, genome="hg38",options(ucscChromosomeNames=FALSE), chromosome='chr13', name="Peaks", shape='box', fill='blue3', size=2.5)
peaks_WM9p85_sictrl.track =  AnnotationTrack (peaks_WM9p85_sictrl, genome="hg38",options(ucscChromosomeNames=FALSE), chromosome='chr13', name="Peaks", shape='box', fill='orange', size=2.5)
peaks_WM9p85_siHADAC2.track =  AnnotationTrack (peaks_WM9p85_siHADAC2, genome="hg38",options(ucscChromosomeNames=FALSE), chromosome='chr13', name="Peaks", shape='box', fill='blue3', size=2.5)



plotTracks(c(WM9p44_sictrl_Input.track,WM9p44_sictrl.track,peaks_WM9p44_sictrl.track, WM9p44_siHADAC2.track,peaks_WM9p44_siHADAC2.track,WM9p85_sictrl_Input.track, WM9p85_sictrl.track,peaks_WM9p85_sictrl.track,WM9p85_siHADAC2.track,peaks_WM9p85_siHADAC2.track, bm, AT),
           from=78580000, to=78680000, chromosome='chr13',
           transcriptAnnotation="symbol", window="auto", 
           type="histogram", cex.title=0.8, fontsize=12 )




library (pheatmap)

setwd ("/Volumes/LacieRAID/ChIPseq/analysis/PeakFiles/")
ghist<- read.delim ("annotatePeaks_siHADAC2_AllTss_ghist.txt", header=TRUE)
head (ghist)
ghist$Gene
m1<- as.matrix( ghist[,2:ncol(ghist)]) 
rownames(m1)<- ghist$Gene
m1<- m1+1
range(m1)
bk = unique(c(seq(1,14.9, length=100),seq(15,41,length=100)))

hmcols<- colorRampPalette(c("white","blue"))(length(bk)-1)   
pheatmap(m1, color=hmcols,  breaks=bk,  cluster_rows=FALSE, cluster_cols=FALSE, legend=FALSE, show_rownames=FALSE, show_colnames=FALSE)

setwd ("/Volumes/LacieRAID/ChIPseq/analysis/PeakFiles/")
ghist<- read.delim ("annotatePeaks_sictrl_AllTss_ghist.txt", header=TRUE)
head (ghist)
ghist$Gene
m1<- as.matrix( ghist[,2:ncol(ghist)]) 
rownames(m2)<- ghist$Gene
m1<- m1+1
range(m2)
bk = unique(c(seq(1,14.9, length=100),seq(15,33,length=100)))

hmcols<- colorRampPalette(c("white","blue"))(length(bk)-1)   
pheatmap(m1, color=hmcols,  breaks=bk,  cluster_rows=FALSE, cluster_cols=FALSE, legend=FALSE, show_rownames=FALSE, show_colnames=FALSE)

setwd ("/Volumes/LacieRAID/ChIPseq/analysis/PeakFiles/")
ghist<- read.delim ("annotatePeaks_sictrl_RNF219_tss_ghist.txt", header=TRUE)
head (ghist)
ghist$Gene
m1<- as.matrix( ghist[,2:ncol(ghist)]) 
rownames(m1)<- ghist$Gene
m1<- m1+1
range(m1)
bk = unique(c(seq(1,14.9, length=100),seq(14.9,10,length=100)))

hmcols<- colorRampPalette(c("white","blue"))(length(bk)-1)   
pheatmap(m1, color=hmcols,  breaks=bk,  cluster_rows=FALSE, cluster_cols=FALSE, legend=FALSE, show_rownames=FALSE, show_colnames=FALSE)

setwd ("/Volumes/LacieRAID/ChIPseq/analysis/PeakFiles/")
ghist<- read.delim ("annotatePeaks_siHADAC2_RNF219_tss_ghist.txt", header=TRUE)
head (ghist)
ghist$Gene
m1<- as.matrix( ghist[,2:ncol(ghist)]) 
rownames(m1)<- ghist$Gene
m1<- m1+1
range(m1)
bk = unique(c(seq(1,14.9, length=100),seq(14.9,10,length=100)))

hmcols<- colorRampPalette(c("white","blue"))(length(bk)-1)   
pheatmap(m1, color=hmcols,  breaks=bk,  cluster_rows=FALSE, cluster_cols=FALSE, legend=FALSE, show_rownames=FALSE, show_colnames=FALSE)



