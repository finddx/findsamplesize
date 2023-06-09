% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sample_size_calculation.R
\name{margin_calc}
\alias{margin_calc}
\title{Error Margin Calculation}
\usage{
margin_calc(alpha, power, sen_spe, sample_size)
}
\arguments{
\item{alpha}{numeric, significance level}

\item{power}{numeric, desired power}

\item{sen_spe}{numeric, sensitivity/specificity of a test}

\item{sample_size}{numeric, number of confirmed cases i.e. positives/negatives by reference}
}
\value{
error margin on one side of the confidence interval
}
\description{
Error Margin Calculation
}
\examples{

 margin_calc(alpha=0.05, power=0.8, sen_spe=0.8, sample_size=502) 
# Error margin on one side. Using the same parameters as sample_size_calculation. Should be ~0.05

}
\references{
Zhou XH, Obuchowski NA and McClish DK. Statistical Methods in Diagnostic Medicine. 2011;2:193-228
}
