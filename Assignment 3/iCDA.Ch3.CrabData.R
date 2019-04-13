############
# Chapter 3 
############

### Crab data (ungrouped)

Crabs <- read.table("http://users.stat.ufl.edu/~aa/cat/data/Crabs.dat", header=TRUE) #importing the data from the data repository
head(Crabs)

Crabs = read.table("crabdata.txt", header = FALSE) #Or, importing the data from the local folder
colnames(Crabs) = c("color","spine","width","sat","weight","y")
head(Crabs)


fit = glm(sat~width, family = poisson(link = "log"), data = Crabs) #Poisson regression
summary(fit)


# install.packages("AER")
library(AER)
dispersiontest(fit, trafo=1) #overdispersion test develoepd by Cameron and Trivedi(1990)


fit2 = glm(sat~width, family = quasipoisson(link = "log"), data = Crabs) #Poisson regression (scaling for overdispersion)
summary(fit2)
sqrt(summary(fit2)$dispersion) #sqrt(phi)


# install.packages("MASS")
library(MASS)
fit3 = glm.nb(sat~width, data = Crabs) #NB regression
summary(fit3)
1/fit3$theta #estimate of dispersion parameter = D = 1/k


