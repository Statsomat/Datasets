cor <- matrix(c(1.0, 0.7, 0.65, 0.62,
                .70 1.0, 0.66, 0.63,
                .65 .66 1.0, 0.6,
                .62 .63 .60 1.0), nrow=4)
cor <- matrix(c(1.0, 0.7, 0.65, 0.62,
                .7,0 1.0, 0.66, 0.63,
                .65, .66, 1.0, 0.6,
                .62, .63, .60, 1.0), nrow=4)
cor <- matrix(c(1.0, 0.7, 0.65, 0.62,
                .7, 1.0, 0.66, 0.63,
                .65, .66, 1.0, 0.6,
                .62, .63, .60, 1.0), nrow=4)
View(cor)
library(MASS)
simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
  mu <- numeric(length(sd))
  covMat <- sd %*% t(sd) * corr#elationmatrix
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
covMat <- sd %*% t(sd) * correlationmatrix
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
sd<- c(3.61, 3.66, 3.59, 2.94, 3.03, 2.85, 2.22, 2.42, 2.04)
cor<- matrix(c(1.000,   0.29,  0.372,  0.587,  0.201,  0.218,  0.557,  0.196, 0.219,
               0.290,  1.000,  0.478,  0.238,  0.586,  0.281,  0.228,  0.644, 0.241,
               0.372,  0.478,  1.000,  0.209,  0.126,  0.681,  0.195,  0.146, 0.676,
               0.587,  0.238,  0.209,  1.000,  0.213,  0.195,  0.664,  0.261, 0.290
               0.201,  0.586,  0.126,  0.213,  1.000,  0.096,  0.242,  0.641, 0.168,
               0.218,  0.281,  0.681,  0.195,  0.096,  1.000,  0.232,  0.248, 0.749,
               0.557,  0.228,  0.195,  0.664,  0.242,  0.232,  1.000,  0.383, 0.361,
               0.196,  0.644,  0.146,  0.261,  0.641,  0.248,  0.383,  1.000, 0.342,
               0.219,  0.241,  0.676,  0.290,  0.168,  0.749,  0.361,  0.342,  1.000), nrow=9)
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
           500,sd, cor, "case18.csv" )
simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
  mu <- numeric(length(sd))
  covMat <- sd %*% t(sd) * correlationmatrix
  data <- mvrnorm(n =250, mu = mu, Sigma = covMat, empirical = TRUE)
  colnames(data) <- colnames
  write.csv(data, dateiname, row.names = FALSE)
  return(data)
}
simulation(c("PARI", "SZTI", "SZDI", "PARC", "SZTC", "SZDC", "PARO", "SZTO", "SZDO"),
           500,sd=sd, cor, "case18.csv" )
sds<- c(3.61, 3.66, 3.59, 2.94, 3.03, 2.85, 2.22, 2.42, 2.04)
cor<- matrix(c(1.000,   0.29,  0.372,  0.587,  0.201,  0.218,  0.557,  0.196, 0.219,
               0.290,  1.000,  0.478,  0.238,  0.586,  0.281,  0.228,  0.644, 0.241,
               0.372,  0.478,  1.000,  0.209,  0.126,  0.681,  0.195,  0.146, 0.676,
               0.587,  0.238,  0.209,  1.000,  0.213,  0.195,  0.664,  0.261, 0.290
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
                0.290, 0.287, 0.248, 0.796, 0.779, 1.000), nrow=6)
simulation(c("X1", "X2", "X3","X4", "X5", "X6"), 200,sd=sds, cor, "case19.csv" )
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
cor <- matrix(c(1.000, 0.736, 0.731, 0.771, 0.685, 0.481, 0.485, 0.508,
                0.736, 1.000, 0.648, 0.694, 0.512, 0.638, 0.442, 0.469,
                0.731, 0.648, 1.000, 0.700, 0.496, 0.431, 0.635, 0.453,
                0.771, 0.694, 0.700, 1.000, 0.508, 0.449, 0.456, 0.627,
                0.685, 0.512, 0.496, 0.508, 1.000, 0.726, 0.743, 0.759,
                0.481, 0.638, 0.431, 0.449, 0.726, 1.000, 0.672, 0.689,
                0.508, 0.469, 0.453, 0.627, 0.759, 0.689, 0.695, 1.000), nrow=8)
simulation(c("A1", "B1", "C1", "D1", "A2", "B2", "C2", "D2"), 200,sd=sds, cor, "case19.csv" )
cor
sds
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
cor <- matrix(c(1.000, 0.736, 0.731, 0.771, 0.685, 0.481, 0.485, 0.508,
                0.736, 1.000, 0.648, 0.694, 0.512, 0.638, 0.442, 0.469,
                0.731, 0.648, 1.000, 0.700, 0.496, 0.431, 0.635, 0.453,
                0.771, 0.694, 0.700, 1.000, 0.508, 0.449, 0.456, 0.627,
                0.685, 0.512, 0.496, 0.508, 1.000, 0.726, 0.743, 0.759,
                0.481, 0.638, 0.431, 0.449, 0.726, 1.000, 0.672, 0.689,
                0.508, 0.469, 0.453, 0.627, 0.759, 0.689, 0.695, 1.000), nrow=8)
simulation(c("A1", "B1", "C1", "D1", "A2", "B2", "C2", "D2"), 250,sd=sds, cor, "case19.csv" )
sd<- c(1.94, 2.03, 2.05, 1.99, 2.61, 2.66, 2.59, 2.55)
correlationsmatrix <- matrix(c(1.000, 0.736, 0.731, 0.771, 0.685, 0.481, 0.485, 0.508,
                               0.736, 1.000, 0.648, 0.694, 0.512, 0.638, 0.442, 0.469,
                               0.731, 0.648, 1.000, 0.700, 0.496, 0.431, 0.635, 0.453,
                               0.771, 0.694, 0.700, 1.000, 0.508, 0.449, 0.456, 0.627,
                               0.685, 0.512, 0.496, 0.508, 1.000, 0.726, 0.743, 0.759,
                               0.481, 0.638, 0.431, 0.449, 0.726, 1.000, 0.672, 0.689,
                               0.508, 0.469, 0.453, 0.627, 0.759, 0.689, 0.695, 1.000), nrow=8)
mu <- numeric(length(sd))
covMat <- sd %*% t(sd) * correlationmatrix
correlationmatrix <- matrix(c(1.000, 0.736, 0.731, 0.771, 0.685, 0.481, 0.485, 0.508,
                              0.736, 1.000, 0.648, 0.694, 0.512, 0.638, 0.442, 0.469,
                              0.731, 0.648, 1.000, 0.700, 0.496, 0.431, 0.635, 0.453,
                              0.771, 0.694, 0.700, 1.000, 0.508, 0.449, 0.456, 0.627,
                              0.685, 0.512, 0.496, 0.508, 1.000, 0.726, 0.743, 0.759,
                              0.481, 0.638, 0.431, 0.449, 0.726, 1.000, 0.672, 0.689,
                              0.508, 0.469, 0.453, 0.627, 0.759, 0.689, 0.695, 1.000), nrow=8)
covMat <- sd %*% t(sd) * correlationmatrix
sd %*% t(sd)
correlationmatrix
sd %*% t(sd) * correlationmatrix
t(sd) * correlationmatrix
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
library(MASS)
simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
  mu <- numeric(length(sd))
  covMat <- sd %*% t(sd) * correlationmatrix
  data <- mvrnorm(n =250, mu = mu, Sigma = covMat, empirical = TRUE)
  colnames(data) <- colnames
  write.csv(data, dateiname, row.names = FALSE)
  return(data)
}
sds<- c(1.717, 2.015, 2.096, 2.212, 2.132, 2.005, 2.062, 2.156, 1.791)
cor <- matrix(c(1.000, 0.616, 0.315, 0.349, 0.314, 0.418, 0.322, 0.409, 0.318,
                0.616, 1.000, 0.313, 0.332, 0.250, 0.416, 0.313, 0.415, 0.222,
                0.315, 0.313, 1.000, 0.261, 0.270, 0.298, 0.096, 0.189, 0.051,
                0.349, 0.332, 0.261, 1.000, 0.327, 0.328, 0.117, 0.314, 0.115,
                0.314, 0.250, 0.270, 0.327, 1.000, 0.317, 0.130, 0.303, 0.140,
                0.418, 0.416, 0.298, 0.328, 0.317, 1.000, 0.140, 0.281, 0.150,
                0.322, 0.313, 0.096, 0.117, 0.130, 0.140, 1.000, 0.233, 0.217,
                0.409, 0.415, 0.189, 0.314, 0.303, 0.281, 0.233, 1.000, 0.222,
                0.318, 0.222, 0.051, 0.115, 0.140, 0.150, 0.217, 0.222, 1.000 ), nrow=9)
simulation(c("MDD1", "MDD2", "MDD3", "MDD4", "MDD5", "MDD6", "MDD7", "MDD8", "MDD9"),
           375,sd=sds, cor, "case20_female.csv" )
library(MASS)
simulation <- function(colnames, N,sd, correlationmatrix, dateiname){
  mu <- numeric(length(sd))
  covMat <- sd %*% t(sd) * correlationmatrix
  data <- mvrnorm(n =250, mu = mu, Sigma = covMat, empirical = TRUE)
  colnames(data) <- colnames
  write.csv(data, dateiname, row.names = FALSE)
  return(data)
}
sds<- c(1.717, 2.015, 2.096, 2.212, 2.132, 2.005, 2.062, 2.156, 1.791)
cor <- matrix(c(1.000, 0.616, 0.315, 0.349, 0.314, 0.418, 0.322, 0.409, 0.318,
                0.616, 1.000, 0.313, 0.332, 0.250, 0.416, 0.313, 0.415, 0.222,
                0.315, 0.313, 1.000, 0.261, 0.270, 0.298, 0.096, 0.189, 0.051,
                0.349, 0.332, 0.261, 1.000, 0.327, 0.328, 0.117, 0.314, 0.115,
                0.314, 0.250, 0.270, 0.327, 1.000, 0.317, 0.130, 0.303, 0.140,
                0.418, 0.416, 0.298, 0.328, 0.317, 1.000, 0.140, 0.281, 0.150,
                0.322, 0.313, 0.096, 0.117, 0.130, 0.140, 1.000, 0.233, 0.217,
                0.409, 0.415, 0.189, 0.314, 0.303, 0.281, 0.233, 1.000, 0.222,
                0.318, 0.222, 0.051, 0.115, 0.140, 0.150, 0.217, 0.222, 1.000 ), nrow=9)
simulation(c("M1", "M2", "M3", "M4", "M5", "M6", "M7", "M8", "M9"),
           375,sd=sds, cor, "case20_female.csv" )
simulation(c("M1", "M2", "M3", "M4", "M5", "M6", "M7", "M8", "M9"),
           375,sd=sds, cor, "case21_female.csv" )
sds_fem<- c(1.717, 2.015, 2.096, 2.212, 2.132, 2.005, 2.062, 2.156, 1.791)
cor_fem <- matrix(c(1.000, 0.616, 0.315, 0.349, 0.314, 0.418, 0.322, 0.409, 0.318,
                    0.616, 1.000, 0.313, 0.332, 0.250, 0.416, 0.313, 0.415, 0.222,
                    0.315, 0.313, 1.000, 0.261, 0.270, 0.298, 0.096, 0.189, 0.051,
                    0.349, 0.332, 0.261, 1.000, 0.327, 0.328, 0.117, 0.314, 0.115,
                    0.314, 0.250, 0.270, 0.327, 1.000, 0.317, 0.130, 0.303, 0.140,
                    0.418, 0.416, 0.298, 0.328, 0.317, 1.000, 0.140, 0.281, 0.150,
                    0.322, 0.313, 0.096, 0.117, 0.130, 0.140, 1.000, 0.233, 0.217,
                    0.409, 0.415, 0.189, 0.314, 0.303, 0.281, 0.233, 1.000, 0.222,
                    0.318, 0.222, 0.051, 0.115, 0.140, 0.150, 0.217, 0.222, 1.000 ), nrow=9)
sd_male <- c(1.598, 2.018, 2.094, 2.232, 2.108, 2.113, 2.286, 2.174, 1.788)
cor_male <- matric(c(1.000, 0.689, 0.204, 0.335, 0.274, 0.333, 0.258, 0.319, 0.316,
                     0.689, 1.000, 0.218, 0.284, 0.320, 0.333, 0.211, 0.346, 0.269,
                     0.204, 0.218, 1.000, 0.315, 0.153, 0.221, 0.114, 0.176, 0.111,
                     0.335, 0.284, 0.315, 1.000, 0.265, 0.364, 0.139, 0.207, 0.140,
                     0.274, 0.320, 0.153, 0.265, 1.000, 0.268, 0.185, 0.231, 0.117,
                     0.333, 0.333, 0.221, 0.364, 0.268, 1.000, 0.132, 0.279, 0.131,
                     0.258, 0.211, 0.114, 0.139, 0.185, 0.132, 1.000, 0.146, 0.263,
                     0.319, 0.346, 0.176, 0.207, 0.231, 0.279, 0.146, 1.000, 0.163,
                     0.316, 0.269, 0.111, 0.140, 0.117, 0.131, 0.263, 0.163, 1.000),
                   nrow=9)
cor_male <- matrix(c(1.000, 0.689, 0.204, 0.335, 0.274, 0.333, 0.258, 0.319, 0.316,
                     0.689, 1.000, 0.218, 0.284, 0.320, 0.333, 0.211, 0.346, 0.269,
                     0.204, 0.218, 1.000, 0.315, 0.153, 0.221, 0.114, 0.176, 0.111,
                     0.335, 0.284, 0.315, 1.000, 0.265, 0.364, 0.139, 0.207, 0.140,
                     0.274, 0.320, 0.153, 0.265, 1.000, 0.268, 0.185, 0.231, 0.117,
                     0.333, 0.333, 0.221, 0.364, 0.268, 1.000, 0.132, 0.279, 0.131,
                     0.258, 0.211, 0.114, 0.139, 0.185, 0.132, 1.000, 0.146, 0.263,
                     0.319, 0.346, 0.176, 0.207, 0.231, 0.279, 0.146, 1.000, 0.163,
                     0.316, 0.269, 0.111, 0.140, 0.117, 0.131, 0.263, 0.163, 1.000),
                   nrow=9)
simulation(c("M1", "M2", "M3", "M4", "M5", "M6", "M7", "M8", "M9"),
           375,sd=sds_male, cor_male, "case21_male.csv" )
sds_male <- c(1.598, 2.018, 2.094, 2.232, 2.108, 2.113, 2.286, 2.174, 1.788)
cor_male <- matrix(c(1.000, 0.689, 0.204, 0.335, 0.274, 0.333, 0.258, 0.319, 0.316,
                     0.689, 1.000, 0.218, 0.284, 0.320, 0.333, 0.211, 0.346, 0.269,
                     0.204, 0.218, 1.000, 0.315, 0.153, 0.221, 0.114, 0.176, 0.111,
                     0.335, 0.284, 0.315, 1.000, 0.265, 0.364, 0.139, 0.207, 0.140,
                     0.274, 0.320, 0.153, 0.265, 1.000, 0.268, 0.185, 0.231, 0.117,
                     0.333, 0.333, 0.221, 0.364, 0.268, 1.000, 0.132, 0.279, 0.131,
                     0.258, 0.211, 0.114, 0.139, 0.185, 0.132, 1.000, 0.146, 0.263,
                     0.319, 0.346, 0.176, 0.207, 0.231, 0.279, 0.146, 1.000, 0.163,
                     0.316, 0.269, 0.111, 0.140, 0.117, 0.131, 0.263, 0.163, 1.000),
                   nrow=9)
simulation(c("M1", "M2", "M3", "M4", "M5", "M6", "M7", "M8", "M9"),
           375,sd=sds_male, cor_male, "case21_male.csv" )
