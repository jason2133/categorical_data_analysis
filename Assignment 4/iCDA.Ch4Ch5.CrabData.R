###################
# Chapters 4 and 5
###################

### Crab data (ungrouped)

Crabs <- read.table("http://users.stat.ufl.edu/~aa/cat/data/Crabs.dat", header=TRUE) #importing the data from the data repository
head(Crabs)

#Crabs = read.table("crabdata.txt", header = FALSE) #Or, importing the data from the local folder
#colnames(Crabs) = c("color","spine","width","sat","weight","y")
#head(Crabs)

Crabs$color <- Crabs$color-1  #color=1,2,3,4 from 2,3,4,5
head(Crabs)


###Plotting
plot(jitter(y, 0.08)~width, data=Crabs)
#install.packages("gam")
library(gam)
gam.fit <- gam(y ~ s(width), family=binomial, data=Crabs)
curve(predict(gam.fit, data.frame(width=x), type="resp"), add=TRUE)



###Model fits with width and color

fit <- glm(y~width, family=binomial, data=Crabs)
summary(fit) #Wald test
Anova(fit)   #LR test

fit2 <- glm(y~width+factor(color), family=binomial, data=Crabs) #color:nominal
summary(fit2) #Wald test
#install.packages("car")
library(car)
Anova(fit2)   #LR test

fit3 <- glm(y~width+color, family=binomial, data=Crabs) #color:ordinal
summary(fit3) #Wald test
Anova(fit3)   #LR test

anova(fit2, fit, test="LRT") #LR test to compare models 2 ad 3



###Model fits with weight, width, color, and spline

fit <- glm(y~weight+width+factor(color)+factor(spine), family=binomial, data=Crabs)
summary(fit)
1-pchisq(225.76-185.20,172-165) #LR test for comparing null and working models
Anova(fit) #LR test


fit2 <- glm(y~width+factor(color), family=binomial, data=Crabs)
-2*logLik(fit2) #-2 log-likelihod
AIC(fit2) #AIC


fit <- glm(y~weight+width+factor(color)+factor(spine), family=binomial, data=Crabs)
library(MASS)
#(direction = c("both", "backward", "forward"))
stepAIC(fit, direction = "both") #Stepwise selextion using AIC 



Crabs2 <- Crabs[,c(4,5,6,7,3)] #weight, width, color, spline, y
head(Crabs2)

#install.packages("leaps")
library(leaps)
#install.packages("bestglm")
library(bestglm)
bestglm(Crabs2, family=binomial, IC="AIC") #the model with the smallest AIC


#Diagonostics
residuals(fit, type="pearson") #Pearson residuals
influence.measures(fit)        #Influence measures

r <- rstandard(fit, type="pearson") #Standardized residuals
plot(r, ylab="Pearson Residual", ylim=c(-5,5))
abline(h=2, lty=2);abline(h=-2,lty=2)



####ROC and AUC

prop <- sum(Crabs$y)/nrow(Crabs)
prop

fit <- glm(y~width+factor(color), family=binomial, data=Crabs)
predicted <- as.numeric(fitted(fit) > prop) #predict the responses
xt <- xtabs(~Crabs$y + predicted) #classification table
xt

xt[1,1]/sum(xt[1,]) #sensitivity
xt[2,2]/sum(xt[2,]) #specificity
sum(xt[1,1], xt[2,2])/sum(xt) #accuracy

#install.packages("pROC")
library(pROC)
rocplot <- roc(y~fitted(fit), data=Crabs)
plot.roc(rocplot, legacy.axes=TRUE)
auc(rocplot)


#END