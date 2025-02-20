library(lavaan)
changLower.cor <- '
 1.0
 .227  1.0
 .400  .322  1.0
 .324  .330  .354  1.0
 .473  .370  .486  .540  1.0 '
# name the variables and convert to full correlation matrix
cor <-
  getCov(changLower.cor, names = c("X1", "X2", "X3", "X4", "X5"))

sds <- c(1.034, 0.597, 0.836, 0.785, 0.701)
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
           257,sd=sds, cor, "case29_spanish.csv" )

changLower.cor <- '
 1.0
 .381  1.0
 .599  .393  1.0
 .416  .445  .476  1.0
 .601  .404  .661  .519  1.0 '
# name the variables and convert to full correlation matrix
cor <-
  getCov(changLower.cor, names = c("X1", "X2", "X3", "X4", "X5"))

sds <- c(0.887, 0.925, 0.972, 1.014, 0.901)
simulation(colnames(cor), 
           193,sd=sds, cor, "case29_english.csv" )
