These are the data used in Figures 2.1-2.3, and elsewhere through the
book. 

The data are in the R data object:

ESL.mixture.rda

which you read in using load("ESL.mixture.rda")



The components are:

x	       200 x 2 matrix of training predictors
y	       class variable; logical vector of TRUES and 
	       FALSES - 100 of each
xnew	       matrix 6831 x 2 of lattice points in predictor space
prob	       vector of 6831 probabilities (of class TRUE) at each 
	       lattice point
marginal       marginal probability at each lattice point
px1	       69 lattice coordinates for x.1
px2	       99 lattice values for x.2  (69*99=6831)
means	       20 x 2 matrix of the mixture centers, first ten for one
	       class, next ten for the other

So for example, the Bayes error rate is computed as
bayes.error<-sum(marginal*(prob*I(prob<0.5)+(1-prob)*I(prob>=.5)))

If pred is a vector of predictions (of the logit, say):

pred<-predict.logit(xnew)

then the test error is 

test.error<-sum(marginal*(prob*I(pred <0)+(1-prob)*I(pred>=0)))
