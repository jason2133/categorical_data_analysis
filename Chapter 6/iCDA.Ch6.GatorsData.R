############
# Chapter 6
############

#install.packages("VGAM") #for multivariate GLMs, such as multinomial models
library("VGAM")

###Gators data

Gators <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Alligators.dat", header=TRUE)
head(Gators)

fit <- vglm(y ~ x, family=multinomial, data=Gators) #the last one "O" is the baseline-category!
coef(fit, matrix = TRUE)
summary(fit)

fit2 <- vglm(y ~ x, family=multinomial(refLevel="I"), data=Gators) #"I" is the baseline-category!
summary(fit2)

fit0 <- vglm(y ~ 1, family=multinomial, data=Gators) # null model

deviance(fit0) #deviance for null model
deviance(fit)  #deviance for working model
lrtest(fit, fit0) # LR test H0: null model vs H1: working model

out <- data.frame(Gators$x, fitted(fit))
head(out)
