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
riskratio(matrix(c(21, 8, 2, 9), ncol=2), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Relative Risk(RR)
riskratio(matrix(c(21, 8, 2, 9), ncol=2), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Relative Risk(RR)

# Num 1 - a - Odds Ratio (OR)
# OR and CI of OR
oddsratio(matrix(c(21, 8, 2, 9), ncol=2), method="wald", conf=0.95, correct=FALSE) #Wald test and CI for Odds Ratio(OR)

chisq.test(num1) #Pearson's chi-square test
lr.test(# What is here?)

###Analysis of tea data
fisher.test(num1)                        #Fisher's exact test
fisher.test(num1, alternative="greater") #Fisher's exact test (one-sided)  
        