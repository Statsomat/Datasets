library(MASS)
simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
  mu <- numeric(length(sd))
  covMat <- sd %*% t(sd) * correlationmatrix
  data <- mvrnorm(n =250, mu = mu, Sigma = covMat, empirical = TRUE)
  colnames(data) <- colnames
  write.csv(data, dateiname, row.names = FALSE)
  return(data)
}
sds<- c(1.94, 2.03, 2.05, 1.99, 2.61, 2.66, 2.59, 2.55)
cor <- matrix(c
                            (1.000, 0.736, 0.731, 0.771, 0.685, 0.481, 0.485, 0.508,
                             0.736, 1.000, 0.648, 0.694, 0.512, 0.638, 0.442, 0.469, 
                             0.731, 0.648, 1.000, 0.700, 0.496, 0.431, 0.635, 0.453, 
                             0.771, 0.694, 0.700, 1.000, 0.508, 0.449, 0.456, 0.627,
                             0.685, 0.512, 0.496, 0.508, 1.000, 0.726, 0.743, 0.759,
                             0.481, 0.638, 0.431, 0.449, 0.726, 1.000, 0.672, 0.689,
                             0.485, 0.442, 0.635, 0.456, 0.743, 0.672, 1.000, 0.695,
                             0.508, 0.469, 0.453, 0.627, 0.759, 0.689, 0.695, 1.000), nrow=8)

simulation(c("A1", "B1", "C1", "D1", "A2", "B2", "C2", "D2"), 250,sd=sds, cor, "case20.csv" )
