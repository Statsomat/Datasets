library(lavaan)

load("210319.RData")
W <- chol2inv(chol(V))

# DWLS ####

sntx <- '
INT =~ MDD + PTSD + TS + ANX + ED + OCD
EXT =~ ADHD + TS + AD + CAN
P =~ BP + SZ + ASD + TS
INT ~~ EXT
INT ~~ P
EXT ~~ P
MDD ~~ MDD
BP ~~ BP
SZ ~~ SZ
ADHD ~~ ADHD
PTSD ~~ PTSD
ASD ~~ ASD
TS ~~ TS
ANX ~~ ANX
ED ~~ ED
OCD ~~ OCD
AD ~~ AD
CAN ~~ CAN
'
lavmod <- lavaan(
	model=sntx,
	sample.cov=S,
	sample.nobs=2,
	NACOV=V,
	WLS.V=W,
	std.lv=TRUE,
	optim.method="BFGS",
	check.gradient=F,
	estimator="WLSMV"
)

#Why the discrepancy?:
lavmod@optim$fx #<--444.1576
#1963.528:
t(lav_matrix_vech(lavmod@implied$cov[[1]])-lav_matrix_vech(S)) %*%
	diag(diag(V)^-1) %*% (lav_matrix_vech(lavmod@implied$cov[[1]])-lav_matrix_vech(S))


# ULS ####

lavmod2 <- lavaan(
	model=sntx,
	sample.cov=S,
	sample.nobs=2,
	NACOV=V,
	std.lv=TRUE,
	optim.method="BFGS",
	check.gradient=F,
	estimator="ULSMV"
)

#Why the discrepancy?:
lavmod2@optim$fx #<--0.01055887
#0.2850166:
t(lav_matrix_vech(lavmod2@implied$cov[[1]])-lav_matrix_vech(S)) %*% (lav_matrix_vech(lavmod2@implied$cov[[1]])-lav_matrix_vech(S))
