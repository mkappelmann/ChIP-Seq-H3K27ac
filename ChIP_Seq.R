#Install the required R packages and load the libaries in R
#optional
#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("Gviz")

#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("biomaRt")


library(GenomicRanges)
library(rtracklayer)
library(IRanges)

#load your data in R (NOTE: replace SampleNames and PATH due to your naming within your computer environment)
SampleNameA= import ('/path/to/your/SampleNameA.ucsc.bigWig')
SampleNameB= import ('/path/to/your/SampleNameB.ucsc.bigWig')


#Obtaining object "si" for hg38
#To perform the binning step in the next section we first need to generate a seqinfo (si) file. 
# We get chromosome lengths from the BSgenome.Hsapiens.UCSC.hg38 package, in which the chromosome names are in ensembl format. 
library(BSgenome.Hsapiens.UCSC.hg38)
genome= BSgenome.Hsapiens.UCSC.hg38
si=seqinfo(genome)
#We add the prefix ´chr` to chromosome names: 
si=si[paste0('chr',c(1:22,'X','Y'))]
si

#Binning the ChIP-Seq and Input samples
#The main purpose of this step is to count how many reads map to each of the pre-established genomic intervals. 
# Next, we use the tileGenome function from the GenomicRanges package to generate a GRanges object with intervals 
# covering the genome (here only chr13) in tiles (bins) of size of 200 bp.

binsize = 200
bins= tileGenome(si['chr13'], tilewidth=binsize,cut.last.tile.in.chrom = TRUE)
bins

#Counting how many reads fall into each bin by a function called BinChIP. The two arguments "bins" and "reads" are both GRanges objects.

BinChIP = function ( reads, bins) {
  mcols(bins)$score = countOverlaps( bins, reads) 
  return (bins)
}

SampleNameA.200bins = BinChIP (SampleNameA, bins)
SampleNameB.200bins = BinChIP (SampleNameB, bins)

#Visualisation of the ChIP-Seq data with the R package "Gviz"

#First load the required packages
library(Gviz)
library(biomaRt)

# The biomaRt package is used to obtain the annotation queiing the biomart database: https://www.ensembl.org/info/data/biomart/index.html
# First search for the required genome and needed information 
mart = useMart (biomart = "ENSEMBL_MART_ENSEMBL")
mart = useDataset("hsapiens_gene_ensembl", mart=mart)

listAttributes(mart)

#Add a biomart feature map depicting the external gene names:
fm= Gviz:::.getBMFeatureMap()
fm["sympol"]="external_gene_name"

#Create biomart object ("bm")
bm = BiomartGeneRegionTrack(chromosome = 'chr13', genome = "hg38", 
                            start = 78500000, end= 78600000, biomart = mart,
                            filters = list("with_refseq_mrna"=TRUE), size=4, 
                            name = "RefSeq", utr5="red3", utr3="red3", 
                            protein_coding="black", col.line=NULL, cex=7, 
                            collapseTranscripts="longest", featureMap = fm)

#We also include the GenomeAxisTrack object which is a coordinate axis showing the genomic span of the analyzed region.
AT= GenomeAxisTrack()

#You can plot your generated biomart object and the Genome axis track withaout any file information to check if it work out:

plotTracks(c(bm,AT), from=78500000, to= 78700000,
           transcriptAnnotation="symbol",
           window="auto", cex.title=1, fontsize=10 )

#We next add our data tracks to the plot. 
#We first generate DataTrack objects with the DataTrack function. 
#We include the information about how the track should be labaled and colored.

SampleNameA.track = DataTrack(SampleNameA.200bins, 
                                strand="*", genome="hg38", col.histogram='gray',
                                fill.histogram='gray', name="H3K27ac", col.axis="black",
                                cex.axis=0.6, ylim=c(0,80))

SampleNameB.track = DataTrack(SampleNameB.200bins, 
                                      strand="*", genome="hg38", col.histogram='gray',
                                      fill.histogram='gray', name="Input", col.axis="black",
                                      cex.axis=0.6, ylim=c(0,80))

#Finally, we can plot the tracks along with the genomic features.

plotTracks(c (SampleNameA.track,SampleNameB.track,bm,AT),
           from=78500000, to= 78700000, transcriptAnnotation="symbol", window="auto", 
           type="histogram",cex.title=0.7, fontsize=10)

#If you have already performed Peak identification by MACS or homer etc. you can also load your peakFiles into R to plot them also:

setwd ("/path/to/PeakFiles")
peaks_SampleNasmeA= import ('SampleNameA.FDR1e-6.bed')
peaks_SampleNameB= import('SampleNameB.FDR1e-6.bed')



peaks_SampleNameA.track = AnnotationTrack (peaks_SampleNameA, genome="hg38", 
                                           options(ucscChromosomeNames=FALSE), 
                                           chromosome='chr13',name="Peaks", 
                                           shape='box', fill='orange', size=2.5 )
peaks_SampleNameB.track = AnnotationTrack (peaks_SampleNameB, genome="hg38",
                                           options(ucscChromosomeNames=FALSE), 
                                           chromosome='chr13', name="Peaks", 
                                           shape='box', fill='blue3', size=2.5)

#Now you can plot your tracks, peaks and genomic features at once:

plotTracks(c(SampleNameA.track,peaks_SampleNameA.track, 
             SampleNameB.track,peaks_SampleNameB.track , bm, AT),
           from=78580000, to=78680000, chromosome='chr13',
           transcriptAnnotation="symbol", window="auto", 
           type="histogram", cex.title=0.8, fontsize=12 )



