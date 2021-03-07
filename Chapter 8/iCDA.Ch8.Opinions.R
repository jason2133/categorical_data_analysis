############
# Chapter 8
############

### Environmental Opinions Data
Opinions <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Envir_opinions.dat", header=TRUE)
Opinions

tab <- xtabs(~y1 + y2, data = Opinions)
tab

#McNemar's test
mcnemar.test(tab, correct=FALSE) #McNemar test

library(PropCIs)
diffpropci.Wald.mp(107, 132, 1144, 0.95) # Wald CI
scoreci.mp(tab[2, 1], tab[1, 2], sum(tab), 0.95) #Score CI



#Using logistic regression models
Opinions <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Opinions.dat", header=TRUE)
Opinions # data file at text website has 2 lines for each person

#install.packages("gee")
library(gee)

fit <- gee(y ~ question, id=person, family=binomial(link="identity"), data=Opinions) # id identifies variable on which observe y1, y2
summary(fit) #identity link

fit2 <- gee(y ~ question, id=person, family=binomial(link=logit), data=Opinions)
summary(fit2) #logit link

