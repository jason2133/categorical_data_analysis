# Assignment 2

install.packages("PropCIs")
install.packages("epitools")
install.packages("vcd")
install.packages("vcdExtra")
install.packages("DescTools")

# Print - Table 2.3
table23 <- matrix(c(189, 104, 10845, 10933), ncol = 2)
table23

chisq.test(table23) #Pearson's chi-square test

library(epitools)
riskratio(matrix(c(189, 104, 10845, 10933), ncol=2), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Relative Risk(RR)
riskratio(matrix(c(189, 104, 10845, 10933), ncol=2), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Relative Risk(RR)

# Num 1 - a - Odds Ratio (OR)
# OR and CI of OR
oddsratio(matrix(c(21, 8, 2, 9), ncol=2), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Odds Ratio(OR)

# Book - Table 2.5
table25 <- matrix(c(762, 484, 327, 239, 468, 477), ncol = 3)
table25

chisq.test(table25)

library(epitools)
library(PropCIs)

library(DescTools)
GTest(table25)  #Likelihood-ratio(LR) test

# 과제 문제 1번 Num 1
num1 <- matrix(c(21, 8, 2, 9), ncol = 2)
num1

# Num 1 - a - proportions(D)
# D and CI of D
prop.test(num1, conf.level=0.95, correct=FALSE) #Wald test and CI for diff props(D)

# Num 1 - a - Relative Risk (RR)
# RR and CI of RR
library(epitools)
riskratio(c(9, 8, 2, 21), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Relative Risk(RR)
riskratio(c(8, 9, 21, 2), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Relative Risk(RR)
oddsratio(c(21, 2, 8, 9), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for OR

library(PropCIs)
diffscoreci(21, 23, 8, 17, conf.level=0.95) #Score CI for D 
riskscoreci(21, 23, 8, 17, conf.level=0.95) #Score CI for RR
orscoreci(21, 23, 8, 17, conf.level=0.95) #Score CI for OR

# Num 1 - a - Odds Ratio (OR)
# OR and CI of OR
oddsratio(matrix(c(21, 8, 2, 9), ncol=2), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Odds Ratio(OR)

chisq.test(num1) #Pearson's chi-square test
lr.test(# What is here?)

# Num 1 againn
#Other political gender gap data
num1again <- matrix(c(21, 8, 2, 9), ncol=2)
num1again <- data.frame(num1again, row.names=c("Surgery", "Radiation Therapy"))
colnames(num1again) <- c("Controlled", "Not Controlled")
num1again
  
chisq.test(num1again) #Pearson's chi-square test
stdres <- chisq.test(GenderGap2)$stdres #standardized residuals
stdres
  
library(DescTools)
GTest(GenderGap2)  #Likelihood-ratio(LR) test

  
  
###Analysis of tea data
fisher.test(num1)                        #Fisher's exact test
fisher.test(num1, alternative="greater") #Fisher's exact test (one-sided)  
        
# Num 2
num2 <- matrix(c(9, 44, 13, 10, 11, 52, 23, 22, 9, 41, 12, 27), ncol = 3)
num2

chisq.test(num2)

library(DescTools)
GTest(num2, correct="none")  #Likelihood-ratio(LR) test

# Num2 Again
#Other political gender gap data
numm2 <- matrix(c(762, 484, 327, 239, 468, 477), ncol=3)
GenderGap2 <- data.frame(GenderGap2, row.names=c("female", "male"))
colnames(GenderGap2) <- c("Dem", "Rep", "Ind")
GenderGap2

chisq.test(GenderGap2) #Pearson's chi-square test
stdres <- chisq.test(GenderGap2)$stdres #standardized residuals
stdres

library(DescTools)
GTest(GenderGap2)  #Likelihood-ratio(LR) test

# > oddsratio(c(21, 2, 8, 9), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for OR
oddsratio(c(9, 11, 9, 44, 52, 41, 13, 23, 12, 10, 22, 27), method='wald', conf=0.95, correct=FALSE)

