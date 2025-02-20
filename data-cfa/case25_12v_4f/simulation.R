houghtonLower.cor <- '
1.000
.668 1.000
.635  .599 1.000
.263  .261   .164 1.000
.290  .315   .247  .486 1.000
.207  .245   .231  .251  .449 1.000
-.206 -.182  -.195 -.309 -.266 -.142 1.000 
-.280 -.241  -.238 -.344 -.305 -.230  .753 1.000
-.258 -.244 -.185  -.255 -.255 -.215  .554  .587 1.000 
.080  .096  .094  -.017  .151  .141 -.074 -.111  .016 1.000
.061  .028 -.035  -.058 -.051 -.003 -.040 -.040 -.018 .284 1.000
.113  .174  .059   .063  .138  .044 -.119 -.073 -.084 .563  .379 1.000 '
# name the variables and convert to full correlation matrix
cor <- 
  getCov(houghtonLower.cor, names = c("wk1","wk2","wk3","hap","md1","md2","pr1","pr2","app","bel","st","ima"))
sds = c(.939,1.017,.937,.562,.760,.524,.585,.609,.731,.711,1.124,1.001)
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
           263,sd=sds, cor, "case25.csv" )