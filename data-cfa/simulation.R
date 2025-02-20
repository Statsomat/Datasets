
library(MASS)
simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
   mu <- numeric(length(sd))
   covMat <- sd %*% t(sd) * corr#elationmatrix
   data <- mvrnorm(n =250, mu = mu, Sigma = covMat, empirical = TRUE)
   colnames(data) <- colnames
   write.csv(data, dateiname, row.names = FALSE)
   return(data)
}

