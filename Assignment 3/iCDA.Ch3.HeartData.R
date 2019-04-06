############
# Chapter 3 
############

### Heart Data (grouped)

Heart <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Heart.dat", header=TRUE)
Heart

#To recode explanatory variable
install.packages("dplyr")
library(dplyr)
Heart$x <- recode(Heart$snoring, never=0, occasional=2, nearly_every_night=4, every_night=5)
Heart$x
n <- Heart$yes+Heart$no


fit <- glm(yes/n ~ x, family=binomial(link="logit"), weights=n, data=Heart) #logit link
summary(fit)
fitted(fit)

fit2 <- glm(yes/n ~ x, family=binomial(link="probit"), weights=n, data=Heart) #inverse cdf link
summary(fit2)
fitted(fit2)

fit3 <- glm(yes/n ~ x, family=quasibinomial(link="identity"), weights=n, data=Heart) #identity link
summary(fit3)
fitted(fit3)


###LR CIs and tests
confint(fit) #LR CI

install.packages("car")
library(car)
Anova(fit) #LR test


fit0 <- glm(yes/n ~ 1, family=binomial(link="logit"), weights=n, data=Heart) #logit link
summary(fit0)
anova(fit0, fit) #LR test for comparing the null model with an intercept only and the model with a single predictor


###Residuals and fitted values
r <- rstandard(fit, type="pearson")
r
cbind(Heart,  n, Heart$yes/n, fitted(fit), r)
