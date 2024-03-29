# WARNING - Generated by {fusen} from dev/flat_minimal.Rmd: do not edit by hand


#' Error Margin Calculation
#'
#' @param alpha numeric, significance level
#' @param power numeric, desired power
#' @param sen_spe numeric, sensitivity/specificity of a test
#' @param sample_size numeric, number of confirmed cases i.e. positives/negatives by reference
#'
#' @return error margin on one side of the confidence interval
#' @references Zhou XH, Obuchowski NA and McClish DK. Statistical Methods in Diagnostic Medicine. 2011;2:193-228
#' 
#' @export
#'
#' @examples
#'
#'  margin_calc(alpha=0.05, power=0.8, sen_spe=0.8, sample_size=502) 
#' # Error margin on one side. Using the same parameters as sample_size_calculation. Should be ~0.05
#'
 margin_calc <- function(alpha, power, sen_spe, sample_size) {
   alpha_val         <- 1-alpha/2
   margin <- sqrt((((qnorm(alpha_val) + qnorm(power)) * sqrt(sen_spe*(1-sen_spe)))^2)/sample_size)
   return(round(margin, digits=3))
 }
 

#' Total N Calculation
#' 
#' 
#' @param prevalence Disease prevalence
#' @param sample_size Number of confirmed cases by reference
#' @param prevalence_power the power to detect the prevalence
#' 
#'
#' @return total number of subjects to be screened 
#' @export
#' 
#' @references Zhou XH, Obuchowski NA and McClish DK. Statistical Methods in Diagnostic Medicine. 2011;2:193-228
#'
#' @examples
#'
#'  n_tot_calculation(sample_size=503, prevalence = 0.1, prevalence_power = 0.9) 
#' # Total  number of patients to be screened to test 80% sensitivity with 10% prevalence and 80% prevalence power. 
#' # Should give the same number as the second example of sample_size_calculation
#'
n_tot_calculation <-function(prevalence, sample_size, prevalence_power){
     a           <- prevalence^2
    c           <- sample_size^2
    b           <- -(2 * sample_size * prevalence + qnorm(prevalence_power)^2 * prevalence * (1 - prevalence))
    delta       <- b^2 - 4 * a * c
    N <- (-b + sqrt(delta)) / (2*a)
    return(ceiling(N))
}

#' Power Calculation
#'
#' @param sample_size numeric, confirmed positives/negatives by reference standard
#' @param margin numeric, the error margin
#' @param sen_spe test performance characteristice estimate
#' @param alpha significance level
#'
#' @return Power
#' @export
#' @references Zhou XH, Obuchowski NA and McClish DK. Statistical Methods in Diagnostic Medicine. 2011;2:193-228
#' 
#' @examples
#'
#'  power_calc(alpha=0.05, margin=0.05, sen_spe=0.8, sample_size=502) 
#' # Power of the study. Using the same parameters as sample_size_calculation. Should be ~80%
#'
 power_calc <- function(sample_size, margin, sen_spe, alpha) {
   alpha_val         <- 1-alpha/2
   (sqrt(sample_size * margin^2) / (sqrt(sen_spe*(1-sen_spe)))) - qnorm(alpha_val) -> qp
   power <- pnorm(qp)
   return(round(power, digits = 3))
 }
 

#' sample_size_calculation
#'
#' @param sen_spe numeric, expected sensitivity/specificity
#' @param alpha numeric, significance level
#' @param power numeric, desired power
#' @param margin numeric, the error margin - half width of the confidence interval
#' @param prevalence numeric, prevalence of the disease. 
#' @param prevalence_power numeric, the power to detect the prevalence
#' @param performance_characteristic character, "sen" for sensitivity, "spe" for specificity
#'
#' @return sample size 
#' 
#' @references Zhou XH, Obuchowski NA and McClish DK. Statistical Methods in Diagnostic Medicine. 2011;2:193-228
#' @export
#'
#' @examples
#'  sample_size_calculation(sen_spe= 0.8, alpha=0.05, power=0.8, margin=0.05, prevalence = NULL, prevalence_power = NULL, performance_characteristic = "sen") 
#' # Number of true positives for a sensitivity of 80%
#'
#'  sample_size_calculation(sen_spe= 0.8, alpha=0.05, power=0.8, margin=0.05, prevalence = 0.1, prevalence_power = 0.9, performance_characteristic = "sen") 
#'  # Total  number of patients to be screened to test 80% sensitivity with 10% prevalence and 80% prevalence power
#'
#'
sample_size_calculation <- function(sen_spe, alpha, power, margin, prevalence = NULL, prevalence_power = NULL, performance_characteristic = "sen") {
  alpha_val         <- 1-alpha/2
  
  sample_size <- ((qnorm(alpha_val) + qnorm(power)) * sqrt(sen_spe*(1-sen_spe)))^2 / margin^2


  
  if(!is.null(prevalence)){
      if(performance_characteristic == "spe"){
    prevalence <- 1-prevalence
  }
    a           <- prevalence^2
    c           <- sample_size^2
    b           <- -(2 * sample_size * prevalence + qnorm(prevalence_power)^2 * prevalence * (1 - prevalence))
    delta       <- b^2 - 4 * a * c
    sample_size <- (-b + sqrt(delta)) / (2*a)
  }
  return(ceiling(sample_size))
}

