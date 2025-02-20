library(MASS)
simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
  mu <- numeric(length(sd))
  covMat <- sd %*% t(sd) * correlationmatrix
  data <- mvrnorm(n =250, mu = mu, Sigma = covMat, empirical = TRUE)
  colnames(data) <- colnames
  write.csv(data, dateiname, row.names = FALSE)
  return(data)
}
sds<- c(2.260, 2.730, 2.110, 2.320, 2.610, 2.440, 0.500)
cor <- matrix(c
              (1.000, 0.705, 0.724, 0.213, 0.149, 0.155, -0.019,
               0.705, 1.000, 0.646, 0.195, 0.142, 0.162, -0.024,
               0.724, 0.646, 1.000, 0.190, 0.128, 0.135, -0.029,
               0.213, 0.195, 0.190, 1.000, 0.521, 0.557, -0.110,
               0.149, 0.142, 0.128, 0.521, 1.000, 0.479, -0.074,
               0.155, 0.162, 0.135, 0.557, 0.479, 1.000, -0.291,
                -0.019, -0.024, -0.029, -0.110, -0.074, -0.291, 1.000), nrow=7)

simulation(c("S1", "S2", "S3", "A1", "A2", "A3", "Sex"), 730,sd=sds, cor, "case22.csv" )
