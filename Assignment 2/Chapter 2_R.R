############
# Chapter 2
############

install.packages("PropCIs")
install.packages("epitools")
install.packages("vcd")
install.packages("vcdExtra")
install.packages("DescTools")


###Analysis of MI data
prop.test(c(189, 104), c(11034, 11037), conf.level=0.95, correct=FALSE) #Wald test and CI for diff props(D)

library(epitools)
riskratio(c(10933, 104, 10845, 189), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Relative Risk(RR)
riskratio(c(104, 10933, 189, 10845), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Relative Risk(RR)
oddsratio(c(189, 10845, 104, 10933), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Odds Ratio(OR)

library(PropCIs)
diffscoreci(189, 11034, 104, 11037, conf.level=0.95) #Score CI for D 
riskscoreci(189, 11034, 104, 11037, conf.level=0.95) #Score CI for RR
orscoreci(189, 11034, 104, 11037, conf.level=0.95) #Score CI for OR


###Analysis of political gender gap data
Political <-read.table("http://www.stat.ufl.edu/~aa/cat/data/Political.dat",header=TRUE)
head(Political)
Party <- factor(Political$party, levels=c("Dem", "Rep", "Ind"))
GenderGap <- xtabs(~gender+Party, data=Political)
GenderGap

chisq.test(GenderGap) #Pearson's chi-square test
stdres <- chisq.test(GenderGap)$stdres #standardized residuals
stdres

library(DescTools)
GTest(GenderGap, correct="none")  #Likelihood-ratio(LR) test


#Reading the data from the table
GenderGap <- matrix(c(495, 330, 272, 265, 590, 498), ncol=3)
GenderGap <- data.frame(GenderGap, row.names=c("female", "male"))
colnames(GenderGap) <- c("Dem", "Rep", "Ind")
GenderGap

chisq.test(GenderGap) #Pearson's chi-square test
stdres <- chisq.test(GenderGap)$stdres #standardized residuals
stdres

library(DescTools)
GTest(GenderGap)  #Likelihood-ratio(LR) test


#Other political gender gap data
GenderGap2 <- matrix(c(762, 484, 327, 239, 468, 477), ncol=3)
GenderGap2 <- data.frame(GenderGap2, row.names=c("female", "male"))
colnames(GenderGap2) <- c("Dem", "Rep", "Ind")
GenderGap2

chisq.test(GenderGap2) #Pearson's chi-square test
stdres <- chisq.test(GenderGap2)$stdres #standardized residuals
stdres

library(DescTools)
GTest(GenderGap2)  #Likelihood-ratio(LR) test



###Analysis of tea data
tea <- matrix(c(3, 1, 1, 3), ncol=2)
tea
fisher.test(tea)                        #Fisher's exact test
fisher.test(tea, alternative="greater") #Fisher's exact test (one-sided)

library(epitools)
ormidp.test(3, 1, 1, 3, or=1) #Mid P-value



#Analysis of infant malformation data
Malform <- matrix(c(17066, 14464, 788, 126, 37, 48, 38, 5, 1, 1), ncol=2)
library(vcdExtra)
CMHtest(Malform, rscores=c(0, 0.5, 1.5, 4.0, 7.0)) #M-test
sqrt(6.5699)
1-pnorm(2.56318)


#####END
