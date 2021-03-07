############
# Chapter 6
############

library(VGAM)

###Mental data

Mental <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Mental.dat", header=TRUE)
Mental

fit = vglm(impair ~ life + ses, family=cumulative(parallel=TRUE), data=Mental)
summary(fit) #proportinal odds

fit0 = vglm(impair ~ 1, family=cumulative(parallel=TRUE), data=Mental)
summary(fit0) #null model
lrtest(fit, fit0)

fit3 = vglm(impair ~ life + ses, family=cumulative(parallel=FALSE), data=Mental)
summary(fit3) #non-proportinal odds
lrtest(fit, fit3) #Check the proportional odds assumption


attach(Mental)
data.frame(ses, life, fitted(fit)) 


###using polr
library(MASS)
y <- factor(Mental$impair) # polr function requires response to be a factor
fit <- polr(y ~ life + ses, method="logistic", data=Mental)
summary(fit) # not showing the 3 intercept parameter estimates
predict(fit, data.frame(ses=0, life=mean(Mental$life)), type="probs")

