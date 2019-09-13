# ChIP-Seq-H3K27ac
A basic workflow

In most cases ChIP-Seq is performed with 50 bp single end sequencing. 
__This workflow does NOT include creation of a reference genome index and quality check of your raw data.__

__Note:__ You just have to replace the /path/to...placeholders by your directory names within your computer environment. 

## From unaligned bam to fastq 

```bedtools bamtofastq -i .bam -fq .fastq```

## Mapping to reference genome GRCh38 (human) with bowtie2

```bowtie2 -x GRCh38 -p 23 -un -name /path/to/target/folder/of/alignmentFile /path/to/fastqFile```

The output file after alignment is .sam, which can be gzipped afterwards: 

```gzip /path/to/target/folder/of/alignmentFile/.sam``` 

## Make a tag Directory

```makeTagDirectory /path/to/tagDir /path/to/alignmentFile.sam -genome hg38 -checkGC```

## Make .bigwig for ChIP-Seq data vizualisation

```makeUCSCfile /path/to/tagDir -fsize 1e20 -bigWig /path/to/GenomeIndices/GRCh38.chromosome.sizes -o /path/to/trackFolder/GRCh38/.ucsc.bigWig -name `filename` ```

There are several opportunities for ChIP-Seq data vizualisation. The most common ones are: 

    1. IGV Browser
    2. UCSC Browser
    3. Gviz package in R
 
For vizualisation in the IGV Broser just load your .bigwig files, actually that´s it!

In this tutorial, we want to focus on the data vizualization using RStudio. 

## Load your ChIP-Seq data in R

We need to load the *GenomicRanges*, *rtracklayer* and *IRanges* packages. To read the .bigwig file to R, we use the *import* function from the *rtracklayer* package. The result is a *GRanges* object, in which each read is represented as a genomic interval.


