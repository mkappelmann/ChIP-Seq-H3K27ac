#!/usr/bin/perl -w -I /Users/mkappelmann-fenzl/Software/
my $directory = "/Users/mkappelmann-fenzl";

sub printCMD() {
	print STDERR "\n\tUsage: perl FreeChistogram.pl <FreeC ratio file> <output file name> \n";
	print STDERR "\n\tProgram generates a CNV plot for all chromosomes\n";
	print STDERR "\n";
	exit;
}

if (@ARGV < 1) {
	printCMD();
}

my $freeCFile = $ARGV[0];
my $filename = $ARGV[1];
$rand = rand();
my $tmpFile = "$directory/" . $rand . ".reformat.tmp";
my $tmpScript = "$directory/" . $rand . ".script.tmp";

`FreeCreformat.pl "$freeCFile" >"$tmpFile"`;

open OUT, ">$tmpScript";
print OUT "setwd(\"$directory/\")\n";
print OUT "data <- read.table(\"$tmpFile\", header=T, sep=\"	\")\n";
print OUT "attach(data)\n";
print OUT "plotcolors <- c(\"chocolate\", \"cornflowerblue\", \"chartreuse4\", \"darkgoldenrod\", \"darkmagenta\", \"dodgerblue4\", \"firebrick\", \"darkolivegreen4\", \"darkviolet\", \"darkslategray4\", \"green3\", \"indianred4\", \"lightblue4\", \"lightseagreen\", \"mediumvioletred\", \"navy\", \"magenta3\", \"orangered\", \"orchid4\", \"palegreen4\", \"palevioletred4\", \"deepskyblue1\", \"tomato3\", \"steelblue\")\n";
print OUT "pdf(file=\"$filename.pdf\", height=3, width=15)\n";
print OUT "par(mar=c(3,3,1,3))\n";
print OUT "plot(Pos,chr1, col=plotcolors[1], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr2, col=plotcolors[2], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr3, col=plotcolors[3], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr4, col=plotcolors[4], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr5, col=plotcolors[5], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr6, col=plotcolors[6], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr7, col=plotcolors[7], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr8, col=plotcolors[8], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr9, col=plotcolors[9], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr10, col=plotcolors[10], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr11, col=plotcolors[11], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr12, col=plotcolors[12], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr13, col=plotcolors[13], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr14, col=plotcolors[14], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr15, col=plotcolors[15], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr16, col=plotcolors[16], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr17, col=plotcolors[17], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr18, col=plotcolors[18], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr19, col=plotcolors[19], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr20, col=plotcolors[20], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr21, col=plotcolors[21], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chr22, col=plotcolors[22], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chrX, col=plotcolors[23], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";
print OUT "par(mar=c(3,3,1,3), new=TRUE)\n";
print OUT "plot(Pos,chrY, col=plotcolors[24], pch=\".\", xaxt=\"n\",yaxt=\"n\",xlab=\"\",axes=FALSE, ylab=\"\",lwd=1, lty=1,ylim=c(0,6),xlim=c(1,3096747548))\n";

print OUT "axis(1,padj=-1.0,family=\"Helvetica\",cex.axis=1,)\n";
print OUT "axis(2,padj=0.8,family=\"Helvetica\",cex.axis=1, col=\"black\", col.axis=\"black\")\n";

print OUT "abline(v=249250621,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=492449994,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=690472424,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=881626700,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=1062541960,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=1233657027,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=1392795690,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=1539159712,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=1680373143,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=1815907890,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=1950914406,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=2084766301,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=2199936179,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=2307285719,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=2409817111,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=2500171864,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=2581367074,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=2659444322,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=2718573305,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=2781598825,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=2829728720,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=2881033286,col=\"snow3\",lty=2,lwd=1)\n";
print OUT "abline(v=3036303846,col=\"snow3\",lty=2,lwd=1)\n";

print OUT "dev.off()\n";
close OUT;

print STDERR "\t\trunning r\n";

`R --no-save < "$tmpScript"`;

`rm -f \"$tmpScript\" `;
`rm -f \"$tmpFile\" `;

exit;

