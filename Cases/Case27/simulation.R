library(lavaan)

browneLowercor <- '
1.00
.77 1.00
.59 .81 1.00
.50 .72 .89 1.00
.48 .69 .84 .91 1.00
.46 .68 .80 .88 .93 1.00
.50 .46 .36 .26 .28 .28 1.00 '
# name the variables and convert to full correlation matrix
cor <-
  getCov(browneLowercor, names = c("tr1","tr2","tr3","tr4","tr5","tr6","ability"))

# add the standard deviations and convert to covariances
sds = c(7.60,8.44,8.95,9.21,9.49,9.62,5.62)

library(MASS)
simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
  mu <- numeric(length(sd))
  covMat <- sd %*% t(sd) * correlationmatrix
  data <- mvrnorm(n =250, mu = mu, Sigma = covMat, empirical = TRUE)
  colnames(data) <- colnames
  write.csv(data, dateiname, row.names = FALSE)
  return(data)
}
simulation(colnames(cor), 
           177,sd=sds, cor, "case27.csv" )
