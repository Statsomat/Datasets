sds<- c(3.61, 3.66, 3.59, 2.94, 3.03, 2.85, 2.22, 2.42, 2.04)
cor<- matrix(c(1.000,   0.29,  0.372,  0.587,  0.201,  0.218,  0.557,  0.196, 0.219,
               0.290,  1.000,  0.478,  0.238,  0.586,  0.281,  0.228,  0.644, 0.241,
               0.372,  0.478,  1.000,  0.209,  0.126,  0.681,  0.195,  0.146, 0.676,
               0.587,  0.238,  0.209,  1.000,  0.213,  0.195,  0.664,  0.261, 0.290,
               0.201,  0.586,  0.126,  0.213,  1.000,  0.096,  0.242,  0.641, 0.168,
               0.218,  0.281,  0.681,  0.195,  0.096,  1.000,  0.232,  0.248, 0.749,
               0.557,  0.228,  0.195,  0.664,  0.242,  0.232,  1.000,  0.383, 0.361,
               0.196,  0.644,  0.146,  0.261,  0.641,  0.248,  0.383,  1.000, 0.342,
               0.219,  0.241,  0.676,  0.290,  0.168,  0.749,  0.361,  0.342,  1.000), 
             nrow=9)

library(MASS)
simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
  mu <- numeric(length(sd))
  covMat <- sd %*% t(sd) * correlationmatrix
  data <- mvrnorm(n =250, mu = mu, Sigma = covMat, empirical = TRUE)
  colnames(data) <- colnames
  write.csv(data, dateiname, row.names = FALSE)
  return(data)
}
simulation(c("PARI", "SZTI", "SZDI", "PARC", "SZTC", "SZDC", "PARO", "SZTO", "SZDO"), 
           500,sd=sds, cor, "case18.csv" )
