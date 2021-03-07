############
# Chapter 7
############

###Drug Data

Drugs <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Substance.dat", header=TRUE)
Drugs

A <- Drugs$alcohol; C <- Drugs$cigarettes; M <- Drugs$marijuana

fit.indep = glm(count ~ A + C + M, family=poisson(link=log), data=Drugs)
summary(fit.indep) # loglinear model (A, C, M)

fit.homo2 = glm(count ~ A + C + M + A:M + C:M, family=poisson(link=log), data=Drugs)
summary(fit.homo2) # loglinear model (AM, CM)

fit.saturated = glm(count ~ A + C + M + A:C + A:M + C:M + A:C:M, family=poisson(link=log), data=Drugs)
summary(fit.saturated) # loglinear model (ACM)

fit.homo = glm(count ~ A + C + M + A:C + A:M + C:M, family=poisson(link=log), data=Drugs)
summary(fit.homo) # loglinear model (AC, AM, CM)

#Consider (AC, AM, CM)
pearson.resid = resid(fit.homo, type="pearson") # Pearson residuals under (AC, AM, CM)
sum(pearson.resid^2) # Pearson goodness-of-fit (X2) statistic under (AC, AM, CM)
deviance(fit.homo) #LR statistic (G2) under (AC, AM, CM)

res.homo = rstandard(fit.homo, type="pearson") #Standardized residuals under (AC, AM, CM)
res.homo2 = rstandard(fit.homo2, type="pearson") #Standardized residuals under (AM, CM)
data.frame(A,C,M, Drugs$count, fitted(fit.homo), res.homo, fitted(fit.homo2), res.homo2)

anova(fit.homo2, fit.homo) #LR test for comparing (AM, CM) with (AC, AM, CM)




