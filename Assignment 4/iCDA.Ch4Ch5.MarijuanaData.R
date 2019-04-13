###################
# Chapters 4 and 5
###################


### Marijuana data

Marijuana <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Marijuana.dat", header=TRUE)
Marijuana

fit <- glm(yes/(yes+no) ~ gender+race, weights=yes+no, family=binomial, data=Marijuana)
summary(fit) #Wald test
library(car)
Anova(fit)   #LR test 

fit$deviance #residual deviance goodness-of-fit statistic
fit$df.residual #residual df
1-pchisq(fit$deviance, fit$df.residual) #P-value for deviance goodness-of-fit statistic


