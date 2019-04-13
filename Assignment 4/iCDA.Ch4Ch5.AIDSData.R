###################
# Chapters 4 and 5
###################

### AIDS data

aids <- read.table("aids.csv", sep=",", header=FALSE) 
names(aids) <- c("race","azt","yes","no")
aids

fit <- glm(yes/(yes+no) ~ azt+race, weights=yes+no, family=binomial, data=aids)
summary(fit) #Wald test
Anova(fit)   #LR test 


fit$deviance #residual deviance goodness-of-fit statistic
fit$df.residual #residual df
1-pchisq(fit$deviance, fit$df.residual) #P-value for deviance goodness-of-fit statistic

