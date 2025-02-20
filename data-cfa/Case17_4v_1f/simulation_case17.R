library(MASS)
simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
  mu <- numeric(length(sd))
  covMat <- sd %*% t(sd) * correlationmatrix
  data <- mvrnorm(n =250, mu = mu, Sigma = covMat, empirical = TRUE)
  colnames(data) <- colnames
  write.csv(data, dateiname, row.names = FALSE)
  return(data)
}

cor <- matrix(c(1.0, 0.7, 0.65, 0.62,
                .7, 1.0, 0.66, 0.63,
                .65, .66, 1.0, 0.6,
                .62, .63, .60, 1.0), nrow=4)

simulation(c("O1", "O2", "O3", "O4"), 300,c(0.314, 0.293, 0.38, 0.434), cor, "case17.csv" )
