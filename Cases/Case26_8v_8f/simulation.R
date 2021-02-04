library(lavaan)
changLower.cor <- '
 1.0
-.10  1.0
 .66  .10  1.0
 .48  .06  .42  1.0
 .08  .58  .15  .22  1.0
 .48  .12  .44  .69  .34  1.0
-.53 -.04 -.58 -.34 -.13 -.34 1.0
-.50 -.02 -.40 -.63 -.28 -.58 .56 1.0 '
# name the variables and convert to full correlation matrix
cor <-
  getCov(changLower.cor, names = c("aoc","coc","noc","apc","cpc","npc","orgti","occti"))

sds <- c(1.04,.98,.97,1.07,.78,1.09,1.40,1.50)
library(MASS)
simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
  mu <- numeric(length(sd))
  covMat <- sd %*% t(sd) * correlationmatrix
  data <- mvrnorm(n =N, mu = mu, Sigma = covMat, empirical = TRUE)
  colnames(data) <- colnames
  write.csv(data, dateiname, row.names = FALSE)
  return(data)
}
simulation(colnames(cor), 
           177,sd=sds, cor, "case26.csv" )
