############
# Chapter 1
############

install.packages("binom") #Testing and CI for proportions 
install.packages("exactci") #Mid P-values
install.packages("PropCIs") #CI based on mid P-values


#Reading the clinical data
Clinical <- read.table("http://www.stat.ufl.edu/~aa/cat/data/Clinical.dat", header=TRUE)
Clinical

y <- sum(Clinical$response)
y


#Testing

?prop.test
prop.test(y, n=10,  alternative="two.sided", conf.level=0.95, correct=FALSE) #Score P-value and CI

library("binom")
binom.test(y, 10, p=0.50, alternative="two.sided") #Exact P-value

library(exactci)
binom.exact(y, 10, 0.50, alternative="two.sided", midp=TRUE) #mid P-value


#Confidence Interval
binom.confint(y, 10, conf.level=0.95, method="asymptotic") #Wald CI
binom.confint(y, 10, conf.level=0.95, method="wilson") #Score CI

library(PropCIs)
midPci(y, 10, 0.95) # CI based on test with mid P-value


#####END

