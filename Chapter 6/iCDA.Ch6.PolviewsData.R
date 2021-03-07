############
# Chapter 6
############

library(VGAM)

###Political view data

Polviews <- read.table("Polviews.csv", sep=",", header=TRUE)
Polviews # grouped data

#Polviews1 <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Polviews.dat",header=TRUE)
#Polviews1 # grouped data

#Polviews2 <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Polviews2.dat",header=TRUE)
#head(Polviews2)  # ungrouped data

levels(Polviews$gender) #ref=female
levels(Polviews$party) #ref=dem
Polviews$party = relevel(Polviews$party, ref="repub") #Change levels
levels(Polviews$party) #ref=repub

fit <- vglm(cbind(y1,y2,y3,y4,y5) ~ party + gender, family=cumulative(parallel=TRUE), data=Polviews)
summary(fit) # "parallel=TRUE" imposes proportional odds structure

attach(Polviews)
data.frame(gender, party, fitted(fit)) # y1 = very lib., y5 = very conserv.

fit.gender <- vglm(cbind(y1,y2,y3,y4,y5) ~ gender, family=cumulative(parallel=TRUE), data=Polviews)
lrtest(fit, fit.gender)
confint(fit.gender)


#Check the proportional odds assumption
fit2 <- vglm(cbind(y1,y2,y3,y4,y5) ~ party + gender, family=cumulative(parallel=FALSE), data=Polviews)
summary(fit2) # "parallel=FALSE": non-proportional odds
lrtest(fit, fit2)


