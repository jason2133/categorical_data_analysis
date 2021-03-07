############
# Chapter 6
############


#install.packages("VGAM") #for multivariate GLMs, such as multinomial models
library("VGAM")

###Afterlife data

Afterlife <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Afterlife.dat", header=TRUE)
Afterlife


levels(Afterlife$race) #ref is black

levels(Afterlife$gender) #ref is female
Afterlife$gender = relevel(Afterlife$gender, ref="male") #Change levels
levels(Afterlife$gender) #ref is male

fit <- vglm(cbind(yes,undecided,no) ~ gender + race, family=multinomial, data=Afterlife)
summary(fit)

fit.race <- vglm(cbind(yes,undecided,no) ~ race, family=multinomial,data=Afterlife) # with race only
fit.gender <- vglm(cbind(yes,undecided,no) ~ gender, family=multinomial,data=Afterlife) # with gender only
fit0 <- vglm(cbind(yes,undecided,no) ~ 1, family=multinomial,data=Afterlife) # null model

deviance(fit)
deviance(fit.race)
deviance(fit.gender)
deviance(fit0)

lrtest(fit, fit.race) # compare model with gender+race with model with race
lrtest(fit, fit.gender) # compare model with gender+race with model with gender
lrtest(fit, fit0) # compare model with gender+race with null model
lrtest(fit.race, fit0) # compare model with race with null model
lrtest(fit.gender, fit0) # compare model with gender with null model

data.frame(Afterlife$race, Afterlife$gender, fitted(fit))

data.frame(Afterlife$race, Afterlife$gender, fitted(fit.gender))



