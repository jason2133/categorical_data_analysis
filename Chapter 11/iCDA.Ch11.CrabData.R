############
# Chapter 11
############


###Crab data
Crabs <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Crabs.dat", header=TRUE)


###LDA
library(MASS)

lda(y ~ width + color, data=Crabs) #prior:sample proportions
fit.lda <- lda(y ~ width + color, prior=c(0.5, 0.5), CV=TRUE, data=Crabs) #prior: 0.5 vs 0.5
xtabs(~Crabs$y + fit.lda$class) # using cross-validation (CV=TRUE


###Classification tree
#install.packages("rpart")
#install.packages("rpart.plot")
library(rpart) # or can use tree package described by James et al. (2013)

fit <- rpart(y ~ color + width, method="class", data=Crabs)# method="class" for categorical y
plotcp(fit) # plots error rate by cp = complexity parameter for pruning
p.fit <- prune(fit, cp=0.056) # prune with particular value for cp
library(rpart.plot)
rpart.plot(p.fit, extra=1, digits=4, box.palette=0) # plots the pruned tree


#END

