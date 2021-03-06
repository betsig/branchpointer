% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotBranchpointWindow.R
\name{plotBranchpointWindow}
\alias{plotBranchpointWindow}
\title{Plots branchpointer predictions}
\usage{
plotBranchpointWindow(queryName, predictions, probabilityCutoff = 0.52,
  plotMutated = FALSE, plotStructure = TRUE, exons)
}
\arguments{
\item{queryName}{query id used to identify the SNP or region}

\item{predictions}{Granges object generated by predictBranchpoints()}

\item{probabilityCutoff}{probability score cutoff value for displaying U2 binding energy}

\item{plotMutated}{plot alternative sequence predicitons alongside reference sequence predictions}

\item{plotStructure}{plot structures for gene and 3' exon containing and skipping isoforms}

\item{exons}{Granges containing exon co-ordinates.
Should be produced by gtfToExons()}
}
\value{
ggplot2 plot with branchpoint features in the specified intronic region
}
\description{
Plots branchpointer predictions
}
\examples{
smallExons <- system.file("extdata","gencode.v26.annotation.small.gtf",
package = "branchpointer")
exons <- gtfToExons(smallExons)
g <- BSgenome.Hsapiens.UCSC.hg38::BSgenome.Hsapiens.UCSC.hg38

querySNPFile <- system.file("extdata","SNP_example.txt", package = "branchpointer")
querySNP <- readQueryFile(querySNPFile,queryType = "SNP",exons = exons, filter = FALSE)
predictionsSNP <- predictBranchpoints(querySNP,queryType = "SNP",BSgenome = g)
plotBranchpointWindow(querySNP$id[1], predictionsSNP,
plotMutated = TRUE, exons = exons)
}
\author{
Beth Signal
}
