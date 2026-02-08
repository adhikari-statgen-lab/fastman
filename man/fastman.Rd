\name{fastman}
\alias{fastman}
\title{Create a Manhattan plot}
\description{
Creates a Manhattan plot directly from a PLINK assoc output (or any data frame with chromosome, position, and p-value). See the package vignette for details:

\code{vignette("fastman")}
}

\usage{
fastman(m, chr = "CHR", bp = "BP", p = "P", snp, chrlabs, speedup = TRUE, logp = TRUE,
col = "matlab", maxP = 14, sortchr = TRUE, bybp = FALSE, chrsubset, bprange, highlight,
annotateHighlight = FALSE, annotatePval, colAbovePval = FALSE, col2 = "greys",
annotateTop = TRUE, annotationWinMb, annotateN, annotationCol, annotationAngle = 45,
baseline = NULL, suggestiveline, genomewideline, cex = 0.4, cex.text = 0.4,
cex.axis = 0.6, xlab, ylab, xlim, ylim, ...)
}

\arguments{

\item{m}{
A data frame containing data for producing the Manhattan plot. Has to contain a minimum of three columns: base pair position, chromosome ID, and P-value: defaults are \code{"BP"}, \code{"CHR"}, and \code{"P"} following the Plink assoc file convention. And optionally some ID, e.g. the SNP ID (default \code{"SNP"}) if annotations are needed. See explanations of the next four parameters if your column names differ, e.g. for non-model organisms, you can use contid ID instead of chromosome ID.
}

\item{chr}{
A string denoting the column name for the chromosome. Defaults to \code{"CHR"}, which corresponds to the PLINK –assoc command output. For non-model organisms, this could be the contig ID. In case your chromosome column is numeric but has been converted into string during the reading of data in R, you must pay close attention to the sorting order of chromosomes. If you still want the chromosomes to be sorted in an increasing order of chromosome number then you must convert your chromosome column to numeric before using the function. If your data is already sorted then you do not need to convert the column to numeric, you can specify \code{sortchr = FALSE} in your input arguments instead.
}

\item{bp}{
A string denoting the column name for the chromosomal position. Defaults to \code{"BP"}, which corresponds to the PLINK –assoc command output. The column must be numeric.
}

\item{p}{
A string denoting the column name for the p-values or scores for the SNP association tests. Defaults to \code{"P"}, which corresponds to the PLINK –assoc command output. The column must be numeric. You can also provide an already-computed log of p-values, e.g. from published summary statistics.
}

\item{snp}{
A string denoting the column name for the SNP name (rs number). The column must be character.
}

\item{chrlabs}{
An optional character vector of length equal to the number of chromosomes, specifying the chromosome labels. e.g., you can provide \code{c(1:22, "X", "Y", "MT")} to convert the Plink numerical notation of 23=X, 24=Y, etc. This character vector is used to create the axis labels of the Manhattan plot. So, you should sort the character vector in the order you want the chromosome labels to appear in the final plot. For example, if your input data frame has chromosome numbers in a particular order you specifically want, and you have used the option \code{sortchr = FALSE} to preserve the order for your final plot, then your \code{chrlabs} vector should also have the same order of chromosomes.
}

\item{speedup}{
A logical value; if TRUE, the function employs the faster method where input values at the extreme 0.2\% are rounded to 3 digits, and the rest is rounded to 2 digits. The default value of this parameter is TRUE.
}

\item{logp}{
A logical value; if TRUE, negative logarithms (base 10) of p-values are plotted. In case the user wants to use FST score type data or logarithm of p-values directly, then logp must be stated to be FALSE, as the default value of this parameter is TRUE.
}

\item{scattermore}{
A logical value; if TRUE, uses scattermore package to speed up plot generation faster. In case the user wants to use this feature, the scattermore package needs to be installed and loaded before running the command. The default value of this parameter is FALSE.
}

\item{col}{
A string indicating the colour scheme of the plot. Defaults to \code{"matlab"}. There are various options available for users. See below for details.
}

\item{maxP}{
A numeric value indicating the maximum y-value till which the user wants to visualize. The default value of this parameter is 14. If the data has negative values then both sides are truncated till the absolute value of the parameter. The user can provide NULL as input if truncation is not required.
}

\item{sortchr}{
A logical value; if TRUE, the table is sorted by chromosome number before plotting. If not specified by the user, the function takes the default value TRUE.
}

\item{bybp}{
A logical value; if TRUE, the y-values are plotted against chromosome positions. In this case, the table is not sorted by chromosome number before plotting. If not specified by the user, the function takes the default value FALSE. This feature is useful, especially for plots where the user might be interested in studying the association p-values across contigs.
}

\item{chrsubset}{
The subset of chromosome numbers to be plotted.
}

\item{bprange}{
The range of chromosome positions to be plotted. In case the user wants to subset the X-axis by region, then this should be the parameter of choice, not \code{xlim}.
}

\item{highlight}{
A character vector of SNPs in the dataset to highlight. These SNPs should all be in the dataset.
}

\item{annotateHighlight}{
A logical value; if TRUE, annotates all highlighted SNPs in case more specific annotation instructions are not provided.
}

\item{annotatePval}{
A numeric value, if set, SNPs with p-values below this will be annotated on the plot. In the case of p-value, the user can provide either the p-value or the negative logarithm of the p-value as input for this argument, whichever is convenient. In the case of scores, the user can provide the score cutoff directly as input.
}

\item{colAbovePval}{
A logical value, if TRUE, will colour all hits above the specified p-value threshold using the colour scheme chosen in col argument (default \code{"matlab"}), while the points below the threshold will be coloured using the colour scheme chosen in col2 argument below (default \code{"greys"}). Defaults to FALSE.
}

\item{col2}{
A string indicating the colour scheme of the part of the plot below the specified p-value threshold. Defaults to \code{"greys"}. There are various options available for users. See below for details.
}

\item{annotateTop}{
A logical value; If TRUE, only annotates the top hit on each chromosome that is below the annotatePval threshold. This is just a modifier, and it works only when used with either annotatePval, annotateHighlight or annotateN.
}

\item{annotationWinMb}{
A numeric value, if set, will determine the megabase window within which the top SNP will be annotated. This is just a modifier, and it works only when used with either annotatePval, annotateHighlight or annotateN.
}

\item{annotateN}{
A numeric value, if set, this number of top SNPs will be annotated on the plot.
}

\item{annotationCol}{
A string indicating the colour of the annotation or the column name containing the colour information for the individual rows. The user can provide a column as a part of the input data frame which contains annotation colour information corresponding to each SNP and specify the column name in this parameter. If the user does not want annotation for some particular SNP, NA can be provided in this column corresponding to that SNP. In case the user provides just a string indicating the annotation colour instead of a column name, then the same colour will be used for annotating all the SNPs. Defaults to grey.
}

\item{annotationAngle}{
The angle of annotation, defaults to 45 degrees.
}

\item{baseline}{
The position to draw a baseline in black. Defaults to NULL, as a typical Manhattan plot already has a baseline at y=0. In case the data has a left tail (e.g. two-sided scoes) the user might want to provide a baseline position for reference. In case multiple baselines are required, the user can provide a vector of positions.
}

\item{suggestiveline}{
The position to draw a GWAS ``suggestive significance'' line. Defaults to \eqn{-\log_{10}(1e-5)}. In case multiple suggestive lines are required, the user can provide a vector of positions.
}

\item{genomewideline}{
The position to draw a GWAS ``genome-wide significance'' line. Defaults to \eqn{-\log_{10}(5e-8)}. In case multiple genome-wide significant lines are required, the user can provide a vector of positions.
}

\item{cex}{
A numerical vector giving the amount by which plotting characters and symbols should be scaled relative to the default. This works as a multiple of \code{par("cex")}. NULL and NA are equivalent to 1.0. Defaults to 0.4.
}

\item{cex.text}{
A numerical vector giving the amount by which annotation text should be scaled relative to the default. This works as a multiple of \code{par("cex")}. NULL and NA are equivalent to 1.0. Defaults to 0.4.
}

\item{cex.axis}{
The magnification to be used for axis annotation relative to the current setting of cex. Defaults to 0.6.
}

\item{scattermoresize}{
A 2-element integer vector to specify the size of scattermore plot in pixels. Applicable only if \code{scattermore = TRUE}. The user should make sure that the value of scattermoresize parameter matches the desired size of the final image output for best-quality plots. Defaults to \code{c(3000,1800)}.
}

\item{geneannotate}{
A logical value; if TRUE, the function annotates using gene names instead of SNP names. If not specified by the user, the function takes the default value FALSE.
}

\item{build}{
A numerical value specifying the build number for matching locations to gene names. build=38 corresponds to GRCh38/b38 and Hg20, build=37 corresponds to GRCh37/b37 and Hg19, and build=36 corresponds to GRCh36/b36 and Hg18.
}

\item{sep}{
A character value specifying the separator to be used in case multiple gene name hits come up in the same annotated SNP. If not specified by the user, the function takes the default value \code{'|'}.
}

\item{xlab}{
A label for the x-axis, defaults to a description of x.
}

\item{ylab}{
A label for the y-axis, defaults to a description of y.
}

\item{xlim}{
The x limits of the plot. The user should refrain from changing xlim to subset x-axis by region. The better option is to specify this in the bprange argument, as changing xlim might lead to improper scaling and spacing in the plot.
}

\item{ylim}{
The y limits of the plot. The user should refrain from changing ylim to truncate the y-axis. The better option is to specify the same in the maxP argument, as changing ylim might lead to improper scaling and spacing in the plot.
}

\item{gap.axis}{
A numeric factor that determines the minimum gaps between axis labels; defaults to NA to use R's default settings. The default value might lead to labels of the smaller chromosomes being dropped in some cases; if so, setting \code{gap.axis = -2} can help to display all the labels. But if the figure width is not sufficiently large, or if the chromosome/contig names are large, this can cause overlap in the text.
}

}

\value{
Produces a Manhattan plot.
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
