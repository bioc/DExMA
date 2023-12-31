\name{makeHeatmap}
\alias{makeHeatmap}
\title{Visualization of the meta-analysis results}
\usage{
makeHeatmap(
    objectMA, 
    resMA,
    scaling=c("zscor","rscale","swr","none"),
    regulation=c("all", "up","down"),
    breaks=c(-2,2),
    fdrSig = 0.05,
    logFCSig = 1.5,
    numSig = "all",
    color = colorRampPalette(rev(brewer.pal(n = 7, name = "RdYlBu")))(100),
    na_col = "darkgrey",
    legend = TRUE, 
    cluster_cols = FALSE, 
    cluster_rows = FALSE,
    show_rownames = TRUE,
    show_colnames = FALSE)
}
\arguments{
\item{objectMA}{A list of list. Each list contains two elements. The first
element is the expression matrix (genes in rows and sample in columns) and
the second element is a vector of zeros and ones that represents the state
of the different samples of the expression matrix. 0 represents one group
(controls) and 1 represents the other group (cases).
The result of the CreateobjectMA can be used too.}

\item{resMA}{Output generated by the differents functions that performs
meta-analysis (metaES, metaPvalue, metaRank or metaAnalysisDE)}

\item{scaling}{Character variable to choose between different scaling 
approaches. See "Details" for more information.}

\item{regulation}{Character variable that indicates whether we want the 
heatmap to show all significant genes ("all"), only the up-regulated genes
("up") or only the down-regulated genes("down")}

\item{breaks}{Numeric vector of length 2 that contains the extreme values
(minimum and maximum) of the range of values in which the heatmap 
color scale will be distributed. Default a vector By default a 
vector of -2 and 2 as extreme values.}

\item{fdrSig}{Adjusted p-value from which a gene is considered significant.
Default 0.05}

\item{logFCSig}{In absolute value. Log Fold Change threshold from which genes 
are considered in the heatmap.}

\item{numSig}{The number of most significant genes to be represented. 
If numSig = "all", all significant genes that meet the selected parameters will 
be represented.}

\item{color}{Vector of colors used in heatmap}

\item{na_col}{Color of the NA cell in the heatmap}

\item{legend}{Logical to determine if legend should be drawn or not}

\item{cluster_cols}{boolean values determining if columns should be clustered.}

\item{cluster_rows}{boolean values determining if rows should be clustered.}

\item{show_rownames}{boolean specifying if row names are be shown.}

\item{show_colnames}{boolean specifying if column names are be shown.}
}
\value{
The matrix represented in the heatmap
}
\description{
It allows to see how the different significant genes are expressed in the 
different samples. Missing genes appear in gray
}
\details{
Scaling approaches that can be used are:
\itemize{
\item "rscale": it applies rescale function of \emph{scales} package. Values
will be between -1 and 1)
\item "zscor":  It calculates a z-score value for each gene, that is, the 
mean gene expression from each gene is subtracted from each gene expression 
value and then it is divided by the standard deviation
\item "swr": it applys scaling relative to reference dataset approach
\item "none": any scaling approach it is applied.
}
}
\examples{

data(DExMAExampleData)

resultsMA <- metaAnalysisDE(maObject, typeMethod="REM")
makeHeatmap(objectMA=maObject, resMA=resultsMA, 
scaling = "zscor", regulation = "all",breaks=c(-2,2), 
fdrSig = 0.05, logFCSig = 1.5, numSig=40)

}
\references{
Hadley Wickham and Dana Seidel (2020). scales: Scale Functions for 
Visualization. R package version 1.1.1. 
\url{https://CRAN.R-project.org/package=scales}

Lazar, C, Meganck, S, Taminau, J, and et al. 2013. “Batch Effect 
Removal Methods for Microarray Gene Expression Data Integration: 
A Survey,” 469–90.

Raivo Kolde 2019. pheatmap: Pretty Heatmaps. R package version 1.0.12.
\url{https://CRAN.R-project.org/package=pheatmap}
}
\seealso{
\code{\link{createObjectMA}}, \code{\link{metaAnalysisDE}}
}
\author{
Juan Antonio Villatoro Garcia, \email{juanantoniovillatorogarcia@gmail.com}
}
