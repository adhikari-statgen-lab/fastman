\name{fastman}
\alias{fastman}
\title{Create a Manhattan plot}
\description{
Creates a Manhattan plot directly from a PLINK assoc output (or any data frame with chromosome, position, and p-value). See the package vignette for details:

\code{vignette("fastman")}
}

\usage{
\code{fastman <- function(m, chr = "CHR", bp = "BP", p = "P", snp, chrlabs, speedup=TRUE, logp = TRUE,
col="matlab", maxP=14, sortchr=TRUE, bybp=FALSE, chrsubset, bprange, highlight, annotateHighlight=FALSE,
annotatePval, colAbovePval=FALSE, col2="greys", annotateTop=TRUE, annotationWinMb, annotateN,
annotationCol, annotationAngle=45, baseline=NULL, suggestiveline, genomewideline, cex=0.4, cex.text=0.4,
cex.axis=0.6, xlab, ylab, xlim, ylim, ...)}
}

\arguments{

\item{m}{
A data frame containing data for producing the Manhattan plot. It must contain at least three columns: base pair position, chromosome ID, and p-value. Defaults follow the PLINK assoc file convention: \code{"BP"}, \code{"CHR"}, and \code{"P"}. Optionally, an ID column such as SNP ID (\code{"SNP"}) may be included for annotation.
}

\item{chr}{
A string denoting the column name for the chromosome. Defaults to \code{"CHR"}. For non-model organisms this may be a contig ID. If chromosome values were read as character but represent numbers, convert to numeric to ensure correct sorting, or set \code{sortchr = FALSE} if already sorted.
}

\item{bp}{
A string denoting the column name for chromosomal position. Defaults to \code{"BP"}. Must be numeric.
}

\item{p}{
A string denoting the column name for p-values or scores. Defaults to \code{"P"}. Must be numeric. Pre-computed log p-values may also be supplied.
}

\item{snp}{
A string denoting the column name for SNP identifiers. Must be character.
}

\item{chrlabs}{
Optional character vector of chromosome labels used for axis annotation. Length must equal the number of chromosomes and follow the desired display order.
}

\item{speedup}{
Logical; if \code{TRUE}, extreme 0.2\% of values are rounded to three digits and the remainder to two digits to speed plotting. Default \code{TRUE}.
}

\item{logp}{
Logical; if \code{TRUE}, plots \eqn{-\log_{10}(p)}. Set to \code{FALSE} when supplying scores or log p-values directly. Default \code{TRUE}.
}

\item{col}{
Colour scheme of the plot. Default \code{"matlab"}.
}

\item{maxP}{
Maximum y-value displayed. Default \code{14}. Use \code{NULL} to disable truncation.
}

\item{sortchr}{
Logical; if \code{TRUE}, data are sorted by chromosome before plotting. Default \code{TRUE}.
}

\item{bybp}{
Logical; if \code{TRUE}, plots values against base-pair position without chromosome sorting. Default \code{FALSE}.
}

\item{chrsubset}{
Subset of chromosome numbers to plot.
}

\item{bprange}{
Range of chromosome positions to plot. Prefer this over modifying \code{xlim}.
}

\item{highlight}{
Character vector of SNPs to highlight. Must exist in the dataset.
}

\item{annotateHighlight}{
Logical; if \code{TRUE}, annotates highlighted SNPs. Default \code{FALSE}.
}

\item{annotatePval}{
Numeric threshold below which SNPs are annotated. Accepts p-values, log p-values, or score cut-offs.
}

\item{colAbovePval}{
Logical; if \code{TRUE}, colours points above the threshold using \code{col} and below using \code{col2}. Default \code{FALSE}.
}

\item{col2}{
Colour scheme for points below the threshold. Default \code{"greys"}.
}

\item{annotateTop}{
Logical; if \code{TRUE}, annotates only the top hit per chromosome below the threshold. Works with other annotation options.
}

\item{annotationWinMb}{
Numeric megabase window used when selecting top SNPs for annotation.
}

\item{annotateN}{
Number of top SNPs to annotate.
}

\item{annotationCol}{
Annotation colour or column name providing colours per SNP. Defaults to grey.
}

\item{annotationAngle}{
Angle of annotation text in degrees. Default \code{45}.
}

\item{baseline}{
Position(s) for drawing baseline reference lines. Default \code{NULL}.
}

\item{suggestiveline}{
Position(s) of GWAS suggestive significance line(s). Default \eqn{-\log_{10}(1e-5)}.
}

\item{genomewideline}{
Position(s) of genome-wide significance line(s). Default \eqn{-\log_{10}(5e-8)}.
}

\item{cex}{
Scaling factor for plotting symbols. Default \code{0.4}.
}

\item{cex.text}{
Scaling factor for annotation text. Default \code{0.4}.
}

\item{cex.axis}{
Axis label magnification. Default \code{0.6}.
}

\item{xlab}{
Label for the x-axis.
}

\item{ylab}{
Label for the y-axis.
}

\item{xlim}{
Limits of the x-axis. Prefer \code{bprange} for subsetting.
}

\item{ylim}{
Limits of the y-axis. Prefer \code{maxP} for truncation.
}

\item{\dots}{
Additional graphical parameters passed to plotting functions.
}

}

\examples{

## Basic Manhattan plot
\code{png("md1.png", width=10, height=6, units="in", res=300)
fastman(m)
dev.off()}

## Annotate SNPs with -log10(P) > 7
\code{png("md5.png", width=10, height=6, units="in", res=300)
fastman(m, annotatePval=1E-7)
dev.off()}
}

\author{
Soumya Subhra Paria (\email{soumya.paria@open.ac.uk}),
Sarthok Rasique Rahman (\email{sarthok@gmail.com}),
and Kaustubh Adhikari (\email{kaustubh.adhikari@open.ac.uk})
}
