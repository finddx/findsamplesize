% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen_pow_curve.R
\name{gen_pow_curve}
\alias{gen_pow_curve}
\title{Generate power curve}
\usage{
gen_pow_curve(
  seq,
  sen_spe,
  alpha,
  margin,
  prevalence,
  prevalence_power,
  performance_characteristic = "sen"
)
}
\arguments{
\item{seq}{A sequence of statistical powers for which sample size is to be calculated}

\item{sen_spe}{expected sensitivity/specificity}

\item{alpha}{significance level}

\item{margin}{error margin (half width of the confidence interval)}

\item{prevalence}{expected disease prevalence}

\item{prevalence_power}{power to predict the prevalence}

\item{performance_characteristic}{the performance characteristic that is being evaluated}
}
\value{
A data frame with values ready to plot a power curve
}
\description{
Calls sample_size_calculation twice to calculate the number of confirmed cases and number of participants to be screened for a sequence of desired powers.
}
\examples{
pow_list <- c(0.8, 0.85, 0.9, 0.95)
    dt <- gen_pow_curve(seq = pow_list,
                        sen_spe = 0.9,
                        alpha = 0.05,
                        margin = 0.05,
                        prevalence = 0.4,
                        prevalence_power = 0.8 ,
                        performance_characteristic = "sen")
}
