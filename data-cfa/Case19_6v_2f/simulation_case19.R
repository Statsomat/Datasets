library(MASS)
simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
  mu <- numeric(length(sd))
  covMat <- sd %*% t(sd) * correlationmatrix
  data <- mvrnorm(n =250, mu = mu, Sigma = covMat, empirical = TRUE)
  colnames(data) <- colnames
  write.csv(data, dateiname, row.names = FALSE)
  return(data)
}
sds<- c(2.610, 2.660, 2.590, 1.940, 2.030, 2.050)
cor <- matrix(c(1.000, 0.661, 0.630, 0.270, 0.297, 0.290,
                0.661, 1.000, 0.643, 0.300, 0.265, 0.287,
                0.630, 0.643, 1.000, 0.268, 0.225, 0.248,
                0.270, 0.300, 0.268, 1.000, 0.805, 0.796,
                0.297, 0.265, 0.225, 0.805, 1.000, 0.779,
                0.290, 0.287, 0.248, 0.796, 0.779, 1.000), nrow=6)

simulation(c("X1", "X2", "X3","X4", "X5", "X6"), 200,sd=sds, cor, "case19.csv" )
