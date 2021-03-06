############
# Chapter 3 
############

### Collision Data (ungrouped)

train <- data.frame(
		matrix(c(2003, 518,0,3,	1988, 443,2,4,
			2002, 516,1,3,	1987, 397,1,6,
			2001, 508,0,4,	1986, 414,2,13,
			2000, 503,1,3,	1985, 418,0,5,
			1999, 505,1,2,	1984, 389,5,3,
			1998, 487,0,4,	1983, 401,2,7,
			1997, 463,1,1,	1982, 372,2,3,
			1996, 437,2,2,	1981, 417,2,2,
			1995, 423,1,2,	1980, 430,2,2,
			1994, 415,2,4,	1979, 426,3,3,
			1993, 425,0,4,	1978, 430,2,4,
			1992, 430,1,4,	1977, 425,1,8,
			1991, 439,2,6,	1976, 426,2,12,
			1990, 431,1,2,	1975, 436,5,2,
			1989, 436,4,4), ncol=4, byrow=T))
names(train) <- c("year", "trainkm", "traincol", "trainroad")
attach(train)

x <- train$year-1975
y <- train$trainroad
dat <- cbind(train,x,y)   


fit <- glm(y ~ x, family=poisson(link=log), offset=log(trainkm), data=dat)
summary(fit) 


#install.packages("AER")
library(AER)
dispersiontest(fit, trafo=1) #overdispersion test develoepd by Cameron and Trivedi(1990)


fit2 = glm(y ~ x, family = quasipoisson(link = "log"), offset=log(trainkm), data=dat) #Poisson regression (scaling for overdispersion)
summary(fit2)
sqrt(summary(fit2)$dispersion) #sqrt(phi)


#install.packages("MASS")
library(MASS) 
fit3 <- glm.nb(y ~ x + offset(log(trainkm)), data=dat) # NB regression with an offset variable
summary(fit3) 
1/fit3$theta #estimate of dispersion parameter = D = 1/k

