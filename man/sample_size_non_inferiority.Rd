% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sample_size_non_inferiority.R
\name{sample_size_non_inferiority}
\alias{sample_size_non_inferiority}
\title{Sample Size non-inferiority}
\usage{
sample_size_non_inferiority(se1, se2, r, min_dif, alpha, power)
}
\arguments{
\item{se1}{Sensitivity/Specificity of the comparator test}

\item{se2}{Sensitivity/Specificity of the index test}

\item{r}{Correlation coefficient: 0 for an unpaired design, 0.5 for a paired design. Default = 0.5}

\item{min_dif}{Minimum non-acceptable difference}

\item{alpha}{Significance level}

\item{power}{Desired power}
}
\value{
Sample size
}
\description{
Gives the sample size for a diagnostic accuracy non-inferiority trial, based on estimated accuracy for each test and a minimum non-acceptable difference (Eq. 6.24 from Zhou et al. 2011)  Variance is calculated using the Eq.6.21 from Zhou et al., which was originally published in Blume et al. 2009.
}
\examples{
sample_size_non_inferiority(se1 = 0.9, se2 = 0.88, r = 0.5, min_dif=0.05, alpha=0.05, power=0.8)
}
\references{
Zhou XH, Obuchowski NA and McClish DK. Statistical Methods in Diagnostic Medicine. 2011;2:193-228

Blume J. D. (2009). Bounding Sample Size Projections for the Area Under a ROC Curve. Journal of statistical planning and inference, 139(1), 711–721.
}
