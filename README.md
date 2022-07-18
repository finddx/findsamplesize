
<!-- README.md is generated from README.Rmd. Please edit that file -->

# findsamplesize

<!-- badges: start -->

[![R-CMD-check](https://github.com/berkosarFIND/findsamplesize/workflows/R-CMD-check/badge.svg)](https://github.com/berkosarFIND/findsamplesize/actions)
<!-- badges: end -->

findsamplesize provides several functions to calculate sample sizes in
diagnostic studies, as well as cluster randomized trials.

## Installation

You can install the development version of findsamplesize like so:

``` r
devtools::install(file.path(getwd(),'findsamplesize') )
library(findsamplesize)
```

## Example

This is a basic example which shows you how to calculate the sample
size:

``` r
library(findsamplesize)
 sample_size_calculation(sen_spe= 0.8, alpha=0.05, power=0.8, margin=0.05, prevalence = NULL, prevalence_power = NULL, performance_characteristic = "sen") 
#> [1] 503
```
