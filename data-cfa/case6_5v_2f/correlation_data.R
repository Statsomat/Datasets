sd <- c(66.50,38.00,36.80,67.00,62.48)
corr<- matrix(c(1.00, -0.03,0.39,-0.05,-0.08,
                -0.03,  1,  0.07,-0.23,-0.16,
                0.39,  0.07,   1,-0.13,-0.29,
                -0.05,-0.23,-0.13,   1, 0.34,
                -0.08,-0.16,-0.29,0.34,    1), nrow= 5)
colnames <- c("exercise","hardiness","fitness","stress","illness")
setwd("C:/Users/berit/Desktop/Reyar/CFA/case6")
simulation(colnames,373, sd, corr,"case6.csv" )
