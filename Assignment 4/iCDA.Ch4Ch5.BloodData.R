##################
# Chapter 4 and 5 
##################

###Blood pressure data


#Reading the data
blood <- read.table("blood.csv", sep=",", header=F)
blood
names(blood) <- c("pressure","total","ndisease")
blood

y <- blood$ndisease/blood$total
 
fit <- glm(y ~ pressure, weights=total, data = blood, family = binomial("logit"))
summary(fit)
library(car)
Anova(fit)


#Diagonostics
residuals(fit, type="pearson") #Pearson residuals
influence.measures(fit)        #Influence measures

r <- rstandard(fit, type="pearson") #Standardized residuals
plot(r, ylab="Pearson Residual", ylim=c(-3,3))
abline(h=2, lty=2);abline(h=-2,lty=2)



