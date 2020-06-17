#!/usr/bin/perl -w

if (@ARGV < 5) {
	print STDERR "makeFreeCplot.pl <output directory> <sex (XY/XX)> <genome> <ploidy> <sam-file directory> <sam file name (no .sam extension)>\n";
	exit;
}
my $outputDir = $ARGV[0];
my $sex = $ARGV[1];
my $genome = $ARGV[2];
my $ploidy = $ARGV[3];
my $samDir = $ARGV[4];
my $samFileName = $ARGV[5];

my $r = rand();
my $tmpConfig = $r . ".txt";

#`cd "$outputDir"`;

open OUT, ">$tmpConfig";
print OUT "[general]\n";
print OUT "chrFiles = /Users/mkappelmann-fenzl/GenomeIndices/FREEC/GRCh38\n";
print OUT "chrLenFile= /Users/mkappelmann-fenzl/GenomeIndices/FREEC/GRCh38/chromosome.sizes\n";
print OUT "coefficientOfVariation = 0.05\n";
print OUT "gemMappabilityFile = /Users/mkappelmann-fenzl/miniconda3/pkgs/control-freec-11.6-h4a8c4bd_0/bin/out100m2_hg38.gem\n";
print OUT "maxThreads = 3\n";
print OUT "outputDir = $outputDir\n";
print OUT "ploidy = $ploidy\n";
print OUT "sex = $sex\n";
print OUT "telocentromeric = 50000\n";
print OUT "uniqueMatch = TRUE\n";
print OUT "#contaminationAdjustment = TRUE\n";
print OUT "#contamination .5\n\n";
print OUT "[sample]\n";
print OUT "mateFile = $samDir/$samFileName.sam\n";
print OUT "inputFormat = sam\n";
print OUT "mateOrientation = 0\n";
print OUT "[control]\n\n";
print OUT "[BAF]\n\n";
print OUT "[target]\n";
close OUT;

	print STDERR "\nrunning FreeC for CNV analysis \n";

`freec -conf "$tmpConfig"`;

	print STDERR "creating Plot with FreeChistogram.pl, output: $outputDir/$samFileName.pdf \n";

`FreeChistogram.pl "$outputDir"/"$samFileName".sam_ratio.txt "$outputDir"/"$samFileName"`;

	print STDERR "removing temporary scripts and files \n\n";


`rm -f \"$tmpConfig\" `;
