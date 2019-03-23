gazua1 <- matrix(c(21, 8, 2, 9), ncol = 2)
gazua1

LogR_risk<-function(x,a){
  
  conf_int<- c(0,0)
  N<-c(sum(x[1,]),sum(x[2,]))
  p<-prop.test( x, conf.level=1-a)$estimate
  
  conf_int[1] <- log(p[1]/p[2])-qnorm(1-a/2, 0,1)*sqrt((1-p[1])/(N[1]*p[1])+((1-p[2])/N[2]*p[2]))
  conf_int[2] <- log(p[1]/p[2])+qnorm(1-a/2, 0,1)*sqrt((1-p[1])/(N[1]*p[1])+((1-p[2])/N[2]*p[2]))
  
  return(conf_int)
}

LogR_risk(gazua1, 0.05)

install.packages("epiR")
library(epiR)

help(package="epiR")

gazua1 <- matrix(c(21, 8, 2, 9), ncol = 2)
gazua1

epi.2by2(gazua1,method="cohort.count",conf.level=0.95)


