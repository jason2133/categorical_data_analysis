############
# Chapter 9
############


###Abortion Data
Abortion <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Abortion.dat", header=TRUE)
head(Abortion)
sit <- factor(Abortion$situation, levels=c(3,1,2))


fit.glm <- glm(response ~ sit + gender, family=binomial, data=Abortion)
summary(fit.glm) # ML estimates


#install.packages("gee")
library(gee)

fit.gee <- gee(response ~ sit + gender, id=person, family=binomial,corstr="independence", data=Abortion) # cluster on "id" variable
summary(fit.gee) #GEE estimates with independence


fit.gee2 <- gee(response ~ sit + gender, id=person, family=binomial, corstr="exchangeable", data=Abortion)
summary(fit.gee2) #GEE estimates with exchangeable


#install.packages("geepack")
library(geepack) # geepack library enables Wald tests comparing models
fit <- geeglm(response ~ gender + factor(situation), id=person, family=binomial, corstr="exchangeable", data=Abortion)
anova(fit)


